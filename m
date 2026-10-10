Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321413CB90A
	for <exfat@lists.linux.dev>; Sat, 10 Oct 2026 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627148; cv=none; b=T5e/rSO8+ETXAgHKUsO5K/Xum6/2hLpnSbx2QrNortezCaPAIYipYy+yBPuESTQJZDvL7/KySty25Qtf8tOHHO3nnwLt6/hNzeuIHUSptqSyNYpr4aWCsy+yTXPf0WEa3yhXe7eRmuxaBS/B/hAT957wQ9PooH0P7EPvTGXc8Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627148; c=relaxed/simple;
	bh=a0Tr1/N3FgUV6QdlbSqAXtxJzvfOcvceFqsFeJUPKBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QYSo2MulANb/CyvHgwhmvQKwclyLoXmnQ00IGDnE4yEbGHr0ulZs8W80tYJ132jEA8th71Ze8UfV+JT3NOs7la3c1DY1ZmAutYmKsFJvTthb8qAkXBWKHlNwRR01HG2GGAuuDZJEDpUimq4qnXRmWkeWsKj1GF6uma5Plv7Zwhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=qnOkklXZ; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="qnOkklXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1791627145; x=1823163145;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qdGKivqSj33ZyBaC+TT8pTlVHkeKOtmcQ5ZF/JBhE0k=;
  b=qnOkklXZoL5AfaKPUu8WddemfxHeyKPuLycfKfnoldeAkcjIsrchWp2+
   IlWTvz1HWy5ZA/dbEfDvm6qVY0kuiET5KJiHp+GOtzpVWkuGwkcgEeXbW
   mvSjC4FI5plAX0RZ/m+V6LfaqCriN+5MnKFpKXT5Ss6CgPXiq4TptbXDs
   773RInpNgIJgiCw4peECFXfFqJE89HeJwzRUwrJqKuZvnXxVv5R2Uxb5X
   /AKkUXuG8G2wHWJoPqHXlyN8TGQSFxk3P77A78pGLH1zKOWEBZzakX9dR
   tvWWdDR8lDN7zwyXF9bIqtyhfyBGVQsXkFX4fN67zQ2vyoaosPc5v7NRG
   A==;
X-CSE-ConnectionGUID: Q2B67eALRcKH+j2CSpOUZQ==
X-CSE-MsgGUID: VBg4V3kgQK2KGOa7f2AI9w==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Oct 2026 19:12:23 +0900
X-CSE-ConnectionGUID: KrOW1YCfQBqbAIGL0B8WyA==
X-CSE-MsgGUID: 9Byr+/MdQVCaCkbgMIAWpQ==
X-IronPort-AV: E=Sophos;i="6.27,150,1786978800"; 
   d="scan'208";a="60226729"
Received: from unknown (HELO cscsh-7000014390..) ([43.82.111.225])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 10 Oct 2026 19:12:23 +0900
From: Yuezhang Mo <Yuezhang.Mo@sony.com>
To: exfat@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com,
	dxdt@dev.snart.me,
	Yuezhang Mo <Yuezhang.Mo@sony.com>
Subject: [PATCH v3] exfat: mark straddling folio RO and zero the post-EOF range
Date: Sat, 10 Oct 2026 18:12:01 +0800
Message-ID: <20261010101200.1211462-2-Yuezhang.Mo@sony.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When extending a file across a non-page-aligned EOF, the folio
containing the old EOF must be marked RO so that subsequent mmap
writes trigger ->page_mkwrite() and update valid_size.

The straddling folio remains mapped to the same filesystem block
after the file is extended. As a result, the existing writable PTE
may remain in place, allowing mmap writes to bypass ->page_mkwrite()
and leave valid_size unchanged.

Furthermore, writes to the post-EOF range may occur between
truncate_pagecache() and locking the folio. So the post-EOF range
should be zeroed after marking the straddling folio RO, and using
truncate_pagecache() to zero out the post-EOF range is redundant.

Introduce exfat_pagecache_isize_extended() to mark the straddling
folio RO and zero the post-EOF range after clearing writable mapping.
This ensures that data written beyond the old EOF before the extension
is not exposed as valid file data, and that subsequent mmap writes
trigger ->page_mkwrite() to update valid_size.

Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
Signed-off-by: Yuezhang Mo <Yuezhang.Mo@sony.com>
---

v2: https://lore.kernel.org/all/20261009093020.1018892-3-Yuezhang.Mo@sony.com/
v1: https://lore.kernel.org/all/20260930104332.4022207-2-Yuezhang.Mo@sony.com/

 fs/exfat/file.c | 65 ++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 9 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index d24f0650bfc88..9af3de65e2267 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -17,11 +17,63 @@
 #include <linux/fileattr.h>
 #include <linux/iomap.h>
 #include <linux/pagemap.h>
+#include <linux/rmap.h>
 
 #include "exfat_raw.h"
 #include "exfat_fs.h"
 #include "iomap.h"
 
+/*
+ * Unlike pagecache_isize_extended(), this function updates i_size while
+ * holding the straddling folio lock, and does not skip the straddling
+ * folio when the filesystem block size is >= PAGE_SIZE or when 'from'
+ * and 'to' fall within the same filesystem block.
+ *
+ * This ensures that the folio is marked RO and the post-EOF range is
+ * zeroed before writeback can observe the updated i_size.
+ */
+static void exfat_pagecache_isize_extended(struct inode *inode, loff_t from,
+		loff_t to)
+{
+	struct folio *folio;
+
+	if (!(from & (PAGE_SIZE - 1))) {
+		i_size_write(inode, to);
+		return;
+	}
+
+	folio = filemap_lock_folio(inode->i_mapping, from >> PAGE_SHIFT);
+	i_size_write(inode, to);
+
+	/* Folio not cached? Nothing to do */
+	if (IS_ERR(folio))
+		return;
+
+	/*
+	 * See folio_clear_dirty_for_io() for details why folio_mark_dirty()
+	 * is needed.
+	 */
+	if (folio_mkclean(folio))
+		folio_mark_dirty(folio);
+
+	/*
+	 * The post-eof range of the folio must be zeroed before it is exposed
+	 * to the file. Writeback normally does this, but since i_size has been
+	 * increased we handle it here.
+	 */
+	if (folio_test_dirty(folio)) {
+		loff_t offset, end;
+
+		offset = from - folio_pos(folio);
+		end = min_t(loff_t, to - folio_pos(folio),
+			    folio_size(folio));
+		folio_zero_segment(folio, offset, end);
+	}
+
+	folio_unlock(folio);
+	folio_put(folio);
+}
+
 static int exfat_cont_expand(struct inode *inode, loff_t size)
 {
 	int ret;
@@ -32,8 +84,6 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
 	struct exfat_chain clu;
 	loff_t oldsize = i_size_read(inode);
 
-	truncate_pagecache(inode, oldsize);
-
 	ret = inode_newsize_ok(inode, size);
 	if (ret)
 		return ret;
@@ -81,15 +131,12 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
 
 out:
 	inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
-	/* Expanded range not zeroed, do not update valid_size */
-	i_size_write(inode, size);
 	/*
-	 * When extending file size, call truncate_pagecache() first,
-	 * then update i_size, and call pagecache_isize_extended()
-	 * to ensures the straddling folio is properly marked RO so
-	 * page_mkwrite() is called and post-EOF area is zeroed.
+	 * When extending file size, call exfat_pagecache_isize_extended()
+	 * to updates i_size and ensures the straddling folio is properly
+	 * marked RO so page_mkwrite() is called and post-EOF area is zeroed.
 	 */
-	pagecache_isize_extended(inode, oldsize, inode->i_size);
+	exfat_pagecache_isize_extended(inode, oldsize, size);
 
 	inode->i_blocks = round_up(size, sbi->cluster_size) >> 9;
 	mark_inode_dirty(inode);
-- 
2.43.0

