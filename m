Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB244AA598
	for <exfat@lists.linux.dev>; Wed,  7 Oct 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379443; cv=none; b=h/R1tCiPeB9bZrA9pGCVShIw+yofyCQSI/jiLb2k0VvkFU9dV3w8SoPNXa1RnX4CMpvXZVQ37G0oiOiTXGnaj9TJ8GRbzb9yIiFA1cQSfftWD3EHhXRjMw35br1mIs2pYWDx7hukJJIaGf5cewHJHLzZ1Ph6cVcHz25l/Pf58Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379443; c=relaxed/simple;
	bh=Sh2bPo8ILQ8omvj8Nfmyq76ES5wrfMlrt4C/IWq+2VI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Oq0FT1UR5bIMJIoTerBOT3rvuw4+Qe1eOzWNaQL52Mjf2Goqy3TiSyIh4FFjlLANbDsY2dpUE+ounZYw8jMwaGwyjwNdPWYNf0unQXGqaod1nxgWGENLqb2zvvio8+rnMyqdFWCvDSDpjnAGQWZ3LxuzpPU4uPDQw2rVAi562GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aM8CmFsp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aM8CmFsp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137D11F0089B;
	Wed,  7 Oct 2026 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791379426;
	bh=3rxmt1J3R4A3nY+oAZ3o78PbKuYZMVKS/fFdgrWQvO0=;
	h=From:To:Cc:Subject:Date;
	b=aM8CmFsplhT7O+ZGs0Z1CGR1/Te1ElBXbdfQyBRt0XzdSppEobb643f6BZvk9JBu5
	 5JFotJvZDNjkYMXH3jWDaVMMrOpohSS54YRrBXfJqjbRSz8vhU6bpcZV3+owlp/g7Y
	 ekNE8xDIKwzhxc5r61SzsktGY3sPr7cn7cpivUdaKOoXpG5kKzsML+rPvSjNPoM7hG
	 M3MYoTXM9mRKfIvGtQT5Zn40XAwRrQ85Zb0Uf+b5pZg/7SXTSPfVstuOGm+2tk7MAB
	 1yO7hEAXCKLbAnMHd+1n5IRizDPviKKDDyS4RIA9OzdWF0gIj9GWGNoti+pB3EeNEq
	 zRtABt1+tWD6g==
From: Namjae Jeon <linkinjeon@kernel.org>
To: sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Cc: exfat@lists.linux.dev,
	anmuxixixi@gmail.com,
	dxdt@dev.snart.me,
	chizhiling@kylinos.cn,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH] exfat: zero invalid tail on partial overwrites
Date: Wed,  7 Oct 2026 22:23:39 +0900
Message-Id: <20261007132339.9379-1-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Buffered overwrite that ends before valid_size in the same filesystem
block reads the entire block without IOMAP_F_ZERO_TAIL. If an existing
cluster contains stale bytes beyond valid_size, the synchronous read
loads them into the page cache and marks the block uptodate. Subsequent
buffered reads can return these bytes while i_size exceeds valid_size.

For example, with 512-byte blocks, valid_size of 1000 and i_size of 2048,
a cold-cache overwrite of [900, 950) exposes stale data in [1000, 1024).
Setting ZERO_TAIL for this write would also erase valid data in
[950, 1000).

Use iomap_truncate_page() to zero only the invalid tail at valid_size
before preparing such buffered overwrites. Call it after dropping s_lock
and before iomap locks the write folio. The inode lock held by buffered
writes serializes valid_size against truncation and page_mkwrite.

Skip direct I/O, fault mappings and new allocations. Writes that reach
valid_size continue to use IOMAP_F_ZERO_TAIL.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/exfat/iomap.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index 291367e10c1e..bec0b35b9420 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -149,7 +149,27 @@ static int exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 static int exfat_write_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
 {
-	return __exfat_iomap_begin(inode, offset, length, flags, iomap, true);
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+	loff_t valid_size = exfat_get_valid_size(ei);
+	loff_t end;
+	int err;
+
+	err = __exfat_iomap_begin(inode, offset, length, flags, iomap, true);
+	if (err || flags & (IOMAP_DIRECT | IOMAP_FAULT) ||
+	    iomap->flags & IOMAP_F_NEW)
+		return err;
+
+	end = iomap->offset + iomap->length;
+	if (end >= valid_size ||
+	    round_up(end, i_blocksize(inode)) <= valid_size)
+		return 0;
+
+	/*
+	 * Zero the invalid bytes from valid_size to the end of the block
+	 * to prevent stale data from being exposed through the page cache.
+	 */
+	return iomap_truncate_page(inode, valid_size, NULL, &exfat_iomap_ops,
+				   NULL, NULL);
 }
 
 static DEFINE_IOMAP_ITER_NEXT(exfat_iomap_next, exfat_iomap_begin);
-- 
2.25.1

