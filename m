Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006188;
	b=JSwLrAnG/i4pYr0wIjzYSlj2ur4J65qcwcCnG9BFWbh0T9yBThwJ11gqiUztGWU7q0Eq
	 gof9rE1EhkJnd6jfBOe2UVE+zINVOe9t5C/1jTIvDsCZxiBRlqUe/++0O1PIW9KKSGQ7u
	 3IH/ozebe9APDb5cyTn40x0Iy0Ywck6NyWQqG61jAEuM/twvRJp1NOLy0VlEdeplUc7bw
	 pOT9ztsQctmv7je1TwYwgSnKIBLun4Xk5r/CXHnj2PdSLuwAvlnm1TkNTPep+TSjcWKl6
	 Gt9vmE26Gjp74oTMwqFHnwOup5dKL5CxU+EWq7r/RL7L2wdL6vcDCIAX1Yn5QQ+AljQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006188;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Js53XS4TQWceQIMjvkvTDx30HJJIpdd/cVtWeNSHEQ8=;
	b=V/JGhgOKYyTYLglO/KMDPLPULbgVig4jtFWDEtxCJlUPSB35kwOGsbs2OVcXzmNoizcb
	 k0UQRM5YZxrOTiouvFgUr6CUKEkn9wCDwE7ffN9R393KrZPz7XXzR8WhuyCrAkXWB/8wK
	 dnDR1KfJrddKz70lUa5g9NoUELarakkKLnxq9APpBF8nrZ+EwNP8N1xIH+xenyopDCEeY
	 z6UbV4Y8dGZDB3aOQ3nWmMzPgfqvZGg6mRwfRvsE8TEZiIy+Db9m09e6W17eBzpx47ZDN
	 xkzWYB5cJTwPTKcmTzKoABZt3h0gpgk+vnR8kH77YYN0QSb/Hd6Hs7jqOsXA8dkSyBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=apAOQ+dS;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661C2606A337
	for <exfat@lists.linux.dev>; Mon, 26 Oct 2026 09:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661C2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=apAOQ+dS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Js
	53XS4TQWceQIMjvkvTDx30HJJIpdd/cVtWeNSHEQ8=; b=apAOQ+dS8e+ftMNNg4
	2IJK0a10MaGt2CaV8WsffJNKPLgfiI3OkQJ05SCXnkNZ4i1+G+5pDYDpjLu0TcjV
	GwtZCZyll32yZXvJn11eJh6QzXMr575Wufxxs3nWI7BbM+2K85hKCKnXO+v8ikba
	IpLOSP6qIqC97VwtysgkhbmEQ=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3329BGt9qS_6HCg--.57689S2;
	Mon, 26 Oct 2026 17:15:46 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: linux-kernel@vger.kernel.org,
	exfat@lists.linux.dev
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH] exfat: drain dirty pages after forced shutdown
Date: Mon, 26 Oct 2026 17:15:42 +0800
Message-ID: <20261026091542.1031813-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3329BGt9qS_6HCg--.57689S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr47AF17Xw4UAF15try8Grg_yoW5Gr45p3
	90kanrGr40q3W7Wrs7WF1DZa4jk3WxKFWftFyrua98Zr9Iy342kFWUKFy2vF45KwnxCryj
	qF4Ygw4UGwnrWr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnzVbUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3AIpxmrfGkK9uQAA3Y

From: Chi Zhiling <chizhiling@kylinos.cn>

A forced shutdown sets EXFAT_FLAGS_SHUTDOWN, after which
exfat_writepages() returns -EIO.  Pages dirtied before the shutdown can
then never be written back, so a writer throttled in
balance_dirty_pages() while extending valid_size sleeps forever.

Stuck stack:

  balance_dirty_pages+0x4f0/0xb40
  exfat_prepare_valid_range+0x43/0x140
  exfat_file_write_iter+0x413/0x520
  iter_file_splice_write+0x32d/0x5a0
  direct_splice_actor+0x51/0x270
  splice_direct_to_actor+0xf5/0x270
  do_splice_direct+0x76/0xc0
  vfs_copy_file_range+0x244/0x710
  __do_sys_copy_file_range+0xe6/0x240
  do_syscall_64+0x106/0x5f0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f

Allow writeback of pages dirtied before the shutdown to drain.  New
writes are still rejected in exfat_write_iomap_begin() and
exfat_prepare_valid_range().

Fixes: f761fcdd289d0 ("exfat: Implement sops->shutdown and ioctl")
Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c  | 3 +++
 fs/exfat/inode.c | 3 ---
 fs/exfat/iomap.c | 3 +++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 1386149916bb..8b9fadba363f 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -735,6 +735,9 @@ static int exfat_prepare_valid_range(struct inode *inode, loff_t start,
 		index = pos >> PAGE_SHIFT;
 		next = min(((loff_t)index + 1) << PAGE_SHIFT, end);
 
+		if (exfat_forced_shutdown(inode->i_sb))
+			return -EIO;
+
 		balance_dirty_pages_ratelimited(mapping);
 
 		folio = read_mapping_folio(mapping, index, NULL);
diff --git a/fs/exfat/inode.c b/fs/exfat/inode.c
index 5129df1e79b4..4bea9e9deb94 100644
--- a/fs/exfat/inode.c
+++ b/fs/exfat/inode.c
@@ -283,9 +283,6 @@ static int exfat_writepages(struct address_space *mapping,
 		.ops		= &exfat_writeback_ops,
 	};
 
-	if (unlikely(exfat_forced_shutdown(mapping->host->i_sb)))
-		return -EIO;
-
 	return iomap_writepages(&wpc);
 }
 
diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index e50ecbfbfbe0..6383739f5700 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -165,6 +165,9 @@ static int exfat_write_iomap_begin(struct inode *inode, loff_t offset, loff_t le
 	loff_t end;
 	int err;
 
+	if (exfat_forced_shutdown(inode->i_sb))
+		return -EIO;
+
 	err = __exfat_iomap_begin(inode, offset, length, flags, iomap, true);
 	if (err || flags & (IOMAP_DIRECT | IOMAP_FAULT) ||
 	    iomap->flags & IOMAP_F_NEW)
-- 
2.53.0

