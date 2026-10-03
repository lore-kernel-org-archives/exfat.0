Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BDB23909F
	for <exfat@lists.linux.dev>; Sat,  3 Oct 2026 03:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790998293; cv=none; b=l71RToVEE70eRdjHgrN86dxHj8HUTYRLwBITwVWQEyKgkNsXET3mcA2VjOercxqGndFVo8+nhOY2gkACRtEnXsrWUg+OE7XKuAGiCiOLZzveWoCQSa12/sDxh9B6FB5YVXFDGKKu2i9Zvm82uV4CUQrHevUuPvBn5C96ZfLLFx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790998293; c=relaxed/simple;
	bh=2nWm8d34SzTw5oigFYpf4yv+ezD9SG4iXMyvVk3+Szs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idelCcR6/yY9VSd0U2n2HFNu7ynypoy2wgvAPAjdDigWkSRfo9hfd0G4CETIhoOrYkk6xDkEjw7IwLkmWaT/n2ev9M7wB79VhwwPkrbZ6y9eSVD3gWVwW161HD7MdD9mCZZKyiF1P8RPFAI19Y+Byg4JeaVv7soKMFOYrydlM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=F4CuVdYW; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="F4CuVdYW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ZZ
	6U8nVuOzizjKQDWabO4p7FcLu1srHGOLJMt1QhZ4A=; b=F4CuVdYWwxv2uiQzxS
	tiMrWpYXdDrdXzq/xfdtoxU06XDKlxGd45CDma0LTP7JSW6htJD77UAayM0s1QVt
	MHCwrWw1s1ExsBjfKwh+2IrO9fxra4hBxA6fD9AkJfkg5E9vxdm1QlwHRTXC+MbH
	dgaiX/x6YaRVSNnfIAeCsAcO8=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCXTnLfdsBqOdNwCA--.32914S6;
	Sat, 03 Oct 2026 11:30:44 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	chenxiaosong@chenxiaosong.com,
	dxdt@dev.snart.me,
	hyc.lee@gmail.com,
	linkinjeon@kernel.org,
	liubaolin12138@163.com,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 4/7] exfat: make valid_size and zeroed_size atomic
Date: Sat,  3 Oct 2026 11:30:29 +0800
Message-ID: <20261003033032.1775311-5-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003033032.1775311-1-chizhiling@163.com>
References: <20261003033032.1775311-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXTnLfdsBqOdNwCA--.32914S6
X-Coremail-Antispam: 1Uf129KBjvAXoW3Aw48Ww4fAw47GF1rZr43Jrb_yoW8JFW3Co
	W8JanIgrs5XF98JrW8G345XF9xXa9F93yfCr4Y9Fs8tF12yw1DWw13Gr15ZFWfXr9Yg3yD
	X3s2qw18GrWYyr4rn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOiSlUUUUU
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+AShP2rAduRfGQAA3c

From: Chi Zhiling <chizhiling@kylinos.cn>

ei->valid_size and ei->zeroed_size are 64-bit fields read from bio
completion context (exfat_iomap_read_end_io()) and from ->iomap_begin
without i_rwsem, while writers update them under i_rwsem.  On 32-bit
these loads can tear, and the "if (x < new) x = new" read-modify-write
can lose an update or regress the value when two writers race.

Convert both to atomic64_t and funnel updates through a cmpxchg-based
monotonic advance helper so the value only moves forward; plain reads use
exfat_get_*(), and the few shrink/init paths (truncate, inode fill,
create) use exfat_set_*().  This is a prerequisite for taking
exfat_page_mkwrite() out from under i_rwsem.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/exfat_fs.h | 60 +++++++++++++++++++++++++++++++++++++++++++--
 fs/exfat/file.c     | 32 +++++++++++++-----------
 fs/exfat/inode.c    | 16 ++++++------
 fs/exfat/iomap.c    | 20 +++++++--------
 fs/exfat/namei.c    |  4 +--
 5 files changed, 96 insertions(+), 36 deletions(-)

diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index 41a2c7dfc479..43c034532ec5 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -7,6 +7,7 @@
 #define _EXFAT_FS_H
 
 #include <linux/fs.h>
+#include <linux/atomic.h>
 #include <linux/ratelimit.h>
 #include <linux/nls.h>
 #include <linux/blkdev.h>
@@ -294,9 +295,16 @@ struct exfat_inode_info {
 
 	/* on-disk position of directory entry or 0 */
 	loff_t i_pos;
-	loff_t valid_size;
+	/*
+	 * valid_size and zeroed_size are updated from multiple contexts that
+	 * are not serialised against each other (page_mkwrite runs without
+	 * i_rwsem, while buffered/DIO writes advance them under i_rwsem).  Keep
+	 * them atomic and only ever advance them with a cmpxchg loop so a
+	 * concurrent update can never regress the value or tear on 32-bit.
+	 */
+	atomic64_t valid_size;
 	/* block-aligned size zeroed in the page cache (>= valid_size) */
-	loff_t zeroed_size;
+	atomic64_t zeroed_size;
 	/* hash by i_location */
 	struct hlist_node i_hash_fat;
 	struct inode vfs_inode;
@@ -314,6 +322,54 @@ static inline struct exfat_inode_info *EXFAT_I(struct inode *inode)
 	return container_of(inode, struct exfat_inode_info, vfs_inode);
 }
 
+static inline loff_t exfat_get_valid_size(struct exfat_inode_info *ei)
+{
+	return atomic64_read(&ei->valid_size);
+}
+
+static inline loff_t exfat_get_zeroed_size(struct exfat_inode_info *ei)
+{
+	return atomic64_read(&ei->zeroed_size);
+}
+
+static inline void exfat_set_valid_size(struct exfat_inode_info *ei, loff_t v)
+{
+	atomic64_set(&ei->valid_size, v);
+}
+
+static inline void exfat_set_zeroed_size(struct exfat_inode_info *ei, loff_t v)
+{
+	atomic64_set(&ei->zeroed_size, v);
+}
+
+/*
+ * Monotonically advance @v to at least @new. Returns true if the value was
+ * actually raised, so callers can decide whether to mark the inode dirty.
+ */
+static inline bool exfat_size_advance(atomic64_t *v, loff_t new)
+{
+	loff_t old = atomic64_read(v);
+
+	do {
+		if (old >= new)
+			return false;
+	} while (!atomic64_try_cmpxchg(v, &old, new));
+
+	return true;
+}
+
+static inline bool exfat_advance_valid_size(struct exfat_inode_info *ei,
+		loff_t new)
+{
+	return exfat_size_advance(&ei->valid_size, new);
+}
+
+static inline bool exfat_advance_zeroed_size(struct exfat_inode_info *ei,
+		loff_t new)
+{
+	return exfat_size_advance(&ei->zeroed_size, new);
+}
+
 static inline int exfat_forced_shutdown(struct super_block *sb)
 {
 	return test_bit(EXFAT_FLAGS_SHUTDOWN, &EXFAT_SB(sb)->s_exfat_flags);
diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index e1394c5b016a..b2940732812a 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -247,8 +247,10 @@ int __exfat_truncate(struct inode *inode)
 		ei->start_clu = EXFAT_EOF_CLUSTER;
 	}
 
-	if (i_size_read(inode) < ei->valid_size)
-		ei->valid_size = ei->zeroed_size = i_size_read(inode);
+	if (i_size_read(inode) < exfat_get_valid_size(ei)) {
+		exfat_set_valid_size(ei, i_size_read(inode));
+		exfat_set_zeroed_size(ei, i_size_read(inode));
+	}
 
 	if (ei->type == TYPE_FILE)
 		ei->attr |= EXFAT_ATTR_ARCHIVE;
@@ -693,12 +695,12 @@ static int exfat_zero_new_range(struct inode *inode, loff_t start, loff_t end)
 static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
 {
 	struct exfat_inode_info *ei = EXFAT_I(inode);
-	loff_t old_valid_size = ei->valid_size;
+	loff_t old_valid_size = exfat_get_valid_size(ei);
 	int ret = 0;
 
 	if (old_valid_size < new_valid_size) {
 		/* Do not re-zero blocks already covered by zeroed_size. */
-		loff_t gap_start = max(old_valid_size, ei->zeroed_size);
+		loff_t gap_start = max(old_valid_size, exfat_get_zeroed_size(ei));
 
 		if (i_size_read(inode) < new_valid_size) {
 			/*
@@ -730,9 +732,9 @@ static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
 			return ret;
 		}
 
-		ei->valid_size = new_valid_size;
-		if (ei->zeroed_size < round_up(new_valid_size, i_blocksize(inode)))
-			ei->zeroed_size = round_up(new_valid_size, i_blocksize(inode));
+		exfat_set_valid_size(ei, new_valid_size);
+		exfat_advance_zeroed_size(ei,
+				round_up(new_valid_size, i_blocksize(inode)));
 		mark_inode_dirty(inode);
 	}
 
@@ -817,7 +819,7 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 	if (pos > i_size_read(inode))
 		truncate_pagecache(inode, i_size_read(inode));
 
-	valid_size = ei->valid_size;
+	valid_size = exfat_get_valid_size(ei);
 	if (pos > valid_size) {
 		ret = exfat_extend_valid_size(inode, pos);
 		if (ret < 0 && ret != -ENOSPC) {
@@ -893,8 +895,10 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 	fault_page_start = ((loff_t)vmf->pgoff) << PAGE_SHIFT;
 	new_valid_size = min(mmap_valid_size, i_size_read(inode));
 
-	if (ei->valid_size < new_valid_size) {
-		if (ei->zeroed_size < fault_page_start) {
+	if (exfat_get_valid_size(ei) < new_valid_size) {
+		loff_t zeroed_size = exfat_get_zeroed_size(ei);
+
+		if (zeroed_size < fault_page_start) {
 			int err;
 
 			/*
@@ -902,7 +906,7 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 			 * fault populated its folio and iomap_page_mkwrite()
 			 * will dirty it.
 			 */
-			err = exfat_zero_new_range(inode, ei->zeroed_size,
+			err = exfat_zero_new_range(inode, zeroed_size,
 					fault_page_start);
 			if (err < 0) {
 				inode_unlock(inode);
@@ -915,9 +919,9 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 		 * at i_size recording blocks wholly beyond it could skip a
 		 * later required zeroing.
 		 */
-		if (ei->zeroed_size < round_up(new_valid_size, i_blocksize(inode)))
-			ei->zeroed_size = round_up(new_valid_size, i_blocksize(inode));
-		ei->valid_size = new_valid_size;
+		exfat_advance_zeroed_size(ei,
+				round_up(new_valid_size, i_blocksize(inode)));
+		exfat_set_valid_size(ei, new_valid_size);
 		mark_inode_dirty(inode);
 	}
 
diff --git a/fs/exfat/inode.c b/fs/exfat/inode.c
index ccd13630187e..5129df1e79b4 100644
--- a/fs/exfat/inode.c
+++ b/fs/exfat/inode.c
@@ -29,6 +29,7 @@ int __exfat_write_inode(struct inode *inode, int sync)
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 	struct exfat_inode_info *ei = EXFAT_I(inode);
 	bool is_dir = (ei->type == TYPE_DIR);
+	loff_t valid_size = exfat_get_valid_size(ei);
 	struct timespec64 ts;
 
 	if (inode->i_ino == EXFAT_ROOT_INO)
@@ -81,7 +82,7 @@ int __exfat_write_inode(struct inode *inode, int sync)
 	 * preventing fsck from reporting "more clusters are allocated".
 	 */
 	on_disk_size = max_t(unsigned long long, i_size_read(inode),
-			ei->valid_size);
+			valid_size);
 
 	if (ei->start_clu == EXFAT_EOF_CLUSTER)
 		on_disk_size = 0;
@@ -89,7 +90,7 @@ int __exfat_write_inode(struct inode *inode, int sync)
 	 * valid_size on disk must reflect only confirmed data (up to i_size)
 	 * and must not exceed on_disk_size.
 	 */
-	on_disk_valid_size = min_t(unsigned long long, ei->valid_size,
+	on_disk_valid_size = min_t(unsigned long long, valid_size,
 			i_size_read(inode));
 	if (ei->start_clu == EXFAT_EOF_CLUSTER)
 		on_disk_valid_size = 0;
@@ -258,15 +259,16 @@ static void exfat_readahead(struct readahead_control *rac)
 	struct inode *inode = mapping->host;
 	struct exfat_inode_info *ei = EXFAT_I(inode);
 	loff_t pos = readahead_pos(rac);
+	loff_t valid_size = exfat_get_valid_size(ei);
 	struct iomap_read_folio_ctx ctx = {
 		.ops = &exfat_iomap_bio_read_ops,
 		.rac = rac,
 	};
 
 	/* Range cross valid_size, read it page by page. */
-	if (ei->valid_size < i_size_read(inode) &&
-	    pos <= ei->valid_size &&
-	    ei->valid_size < pos + readahead_length(rac))
+	if (valid_size < i_size_read(inode) &&
+	    pos <= valid_size &&
+	    valid_size < pos + readahead_length(rac))
 		return;
 
 	iomap_readahead(&exfat_iomap_ops, &ctx, NULL);
@@ -371,8 +373,8 @@ static int exfat_fill_inode(struct inode *inode, struct exfat_dir_entry *info)
 	ei->start_clu = info->start_clu;
 	ei->flags = info->flags;
 	ei->type = info->type;
-	ei->valid_size = info->valid_size;
-	ei->zeroed_size = info->valid_size;
+	exfat_set_valid_size(ei, info->valid_size);
+	exfat_set_zeroed_size(ei, info->valid_size);
 
 	ei->version = 0;
 	ei->hint_stat.eidx = 0;
diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index 533cdb4f0929..291367e10c1e 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -46,6 +46,7 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 	struct exfat_inode_info *ei = EXFAT_I(inode);
 	unsigned int cluster, num_clusters;
 	loff_t cluster_offset, cluster_length;
+	loff_t valid_size = exfat_get_valid_size(ei);
 	int err;
 	bool balloc = false;
 
@@ -88,7 +89,7 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 	if (may_alloc || flags & IOMAP_ZERO) {
 		if (balloc)
 			iomap->flags |= IOMAP_F_NEW;
-		else if (iomap->offset + iomap->length >= ei->valid_size) {
+		else if (iomap->offset + iomap->length >= valid_size) {
 			/*
 			 * This is a write that starts at or extends beyond
 			 * the current valid_size. The region between the old
@@ -114,10 +115,10 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 		 * return IOMAP_UNWRITTEN so the write path can
 		 * distinguish it from a real hole.
 		 */
-		if (offset >= ei->valid_size) {
+		if (offset >= valid_size) {
 			iomap->type = flags & IOMAP_REPORT ?
 				IOMAP_HOLE : IOMAP_UNWRITTEN;
-		} else if (offset + iomap->length > ei->valid_size) {
+		} else if (offset + iomap->length > valid_size) {
 			if (flags & IOMAP_REPORT) {
 				/*
 				 * For SEEK_HOLE/SEEK_DATA, clip the length
@@ -125,9 +126,9 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 				 * This ensures the caller gets the precise
 				 * hole position in byte units.
 				 */
-				iomap->length = ei->valid_size - iomap->offset;
+				iomap->length = valid_size - iomap->offset;
 			} else
-				iomap->length = round_up(ei->valid_size,
+				iomap->length = round_up(valid_size,
 							 i_blocksize(inode)) -
 								iomap->offset;
 		}
@@ -196,10 +197,8 @@ static int exfat_write_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 
 	end = pos + written;
 
-	if (ei->valid_size < end) {
-		ei->valid_size = end;
+	if (exfat_advance_valid_size(ei, end))
 		dirtied = true;
-	}
 
 	/*
 	 * IOMAP_F_ZERO_TAIL zeroes the remainder of the last block. Track that
@@ -207,8 +206,7 @@ static int exfat_write_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 	 */
 	if (iomap->flags & IOMAP_F_ZERO_TAIL)
 		end = round_up(end, i_blocksize(inode));
-	if (ei->zeroed_size < end)
-		ei->zeroed_size = end;
+	exfat_advance_zeroed_size(ei, end);
 
 	if (dirtied || iomap->flags & IOMAP_F_SIZE_CHANGED)
 		mark_inode_dirty(inode);
@@ -271,7 +269,7 @@ static void exfat_iomap_read_end_io(struct bio *bio)
 		s64 valid_size;
 		loff_t pos = folio_pos(folio);
 
-		valid_size = ei->valid_size;
+		valid_size = exfat_get_valid_size(ei);
 		if (pos + iter.offset < valid_size &&
 		    pos + iter.offset + iter.length > valid_size)
 			folio_zero_segment(folio, offset_in_folio(folio, valid_size),
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 3c5746fc57d9..86c8c18d363f 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -380,7 +380,7 @@ int exfat_find_empty_entry(struct inode *inode,
 
 		/* directory inode should be updated in here */
 		i_size_write(inode, size);
-		ei->valid_size += sbi->cluster_size;
+		atomic64_add(sbi->cluster_size, &ei->valid_size);
 		ei->flags = p_dir->flags;
 		inode->i_blocks += sbi->cluster_size >> 9;
 	}
@@ -1249,7 +1249,7 @@ static int __exfat_rename(struct inode *old_parent_inode,
 			}
 
 			i_size_write(new_inode, 0);
-			new_ei->valid_size = 0;
+			exfat_set_valid_size(new_ei, 0);
 			new_ei->start_clu = EXFAT_EOF_CLUSTER;
 			new_ei->flags = ALLOC_NO_FAT_CHAIN;
 		}
-- 
2.53.0

