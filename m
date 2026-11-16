Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819560;
	b=gO1rF+DapvmuXVkVTAm5M8YT5oVfmm/RvxKao2ao7KDF3uvoTvW2+IZf8P0yNZ3jetqt
	 B99txLSfuP6mC2TJ87TGftxtO1c2loSp/XQ10tiuqM6UXawh99h9LsnESqIYSotob9utE
	 TE1q+LbCg6UxKEXX47NKixfpm7loxQDqAhu+S1K78khMCz4kWgfoNdkDGXzCCr32sMGOT
	 0fbOzQHaC2tgJDC1Wwo1k2aOHxMrZX+0Px05pZR4WBisnxAg+/ixM6N7wnJO6dPgfteow
	 jTwSEBk4Y67SvBoHxjkU5XrsdYwdG3RARN7sME4x+ysbz0xr3MLl0Y0RK6dHFkHI9cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819560;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=/1cWL7iitqo61yTs1U2wym32XcZWzr83Z3cJat/PfU4=;
	b=l5d5kTkBQ8LSH8lg22ElE+/H6Kf9EhnlAoQnNF6irR2GIxMK4aD/rlxWb4qFjzlmgDI7
	 BkJkjJj84Kw15cBnKEBN0g2B6NMqfFfaI8FfPhhS2X5XH0fYGL2D1Qp9zHllsL7vhg4L0
	 npUoi/qrciFop6UNGm8SMOqP1d3qMbDsU+47lj4A/iHDDsFrp0EoY7jXhQzyjKbTinJAj
	 FPAREpRtSTAscYAtqrm84wZj56JRcUNp/m0hdB0olfHC3DWhq7tFddW565EQtVJU7WioE
	 S+SZH4eydyBpJmdCrDdxYun9f/wYDMjZwXaCXwm4qNcHguaeqgvh3gasEHyY0/CKhUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=odnz7Tht;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C92606A32C
	for <exfat@lists.linux.dev>; Mon, 16 Nov 2026 08:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C92606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=odnz7Tht
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/1
	cWL7iitqo61yTs1U2wym32XcZWzr83Z3cJat/PfU4=; b=odnz7ThtkgwuThA5jL
	9V4Owzxi7so7Y3JcvvQ+pSOgryGwDN9dS87fi8GtSI85Crf59RMbEdSjeQHhBc8a
	cyEgrKA+U/yv7fWRmDvftR5R/v8NrQsV1vr4u1I36OQ2QE2VO3N0e/lmoFHB4Lcx
	YnMvPIW7uX0Fuh4ONp18grBfE=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAH5iLPxfpqqlTnHw--.59228S4;
	Mon, 16 Nov 2026 16:58:59 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v4 2/5] exfat: increase VDL before unlocking initialized folios
Date: Mon, 16 Nov 2026 16:57:49 +0800
Message-ID: <20261116085752.3908082-3-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116085752.3908082-1-chizhiling@163.com>
References: <20261116085752.3908082-1-chizhiling@163.com>
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
X-CM-TRANSID:_____wAH5iLPxfpqqlTnHw--.59228S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxtrW7Jw18ZryDCFyDGryDJrb_yoWDGF1rpr
	ZIkwn8JrWkZ34UWrn5GFyUZFyYk3WfXFWxCr95CanrZrnFy3srKF1UKFWUCFW3J397Gw4Y
	qa1qkrW8Wr9rG3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMyIbUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9xP+nGr6xdOT3wAA3M

From: Chi Zhiling <chizhiling@kylinos.cn>

Buffered writes and gap initialization can unlock initialized folios
before increasing valid_size. Racing read can then treat their data
as unwritten and cache zeroes instead.

Increase VDL and dirty the inode before unlocking each initialized folio.
Use put_folio for ordinary buffered writes and direct-I/O buffered
fallback, and increase VDL after initializing each gap folio.

Recheck the gap boundary after taking invalidate_lock and preserve the
previous file size and completed initialization if a later folio fails.
Increase VDL for the faulting folio only after iomap_page_mkwrite succeeds,
using the current file size.

Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
Fixes: 90f4264e8b01 ("exfat: dirty all new pages when extending valid_size")
Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
Co-developed-by: Namjae Jeon <linkinjeon@kernel.org>
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/exfat/file.c  | 116 ++++++++++++++++++++++++++---------------------
 fs/exfat/iomap.c |  18 ++++++++
 fs/exfat/iomap.h |   1 +
 3 files changed, 83 insertions(+), 52 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 5b67bbf81186..13778c72c978 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -718,12 +718,14 @@ int exfat_file_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
  * beyond the current valid_size and skips uptodate blocks.
  * Mark entire folios dirty so the newly valid range is written back.
  *
- * Call before advancing valid_size.
+ * Increase valid_size for each newly initialized range before unlocking
+ * its folio.
  */
 static int exfat_prepare_valid_range(struct inode *inode, loff_t start,
 				    loff_t end)
 {
 	struct address_space *mapping = inode->i_mapping;
+	struct exfat_inode_info *ei = EXFAT_I(inode);
 	loff_t next, pos = start;
 	struct folio *folio;
 	pgoff_t index;
@@ -733,8 +735,6 @@ static int exfat_prepare_valid_range(struct inode *inode, loff_t start,
 
 	while (pos < end) {
 		index = pos >> PAGE_SHIFT;
-		next = min(((loff_t)index + 1) << PAGE_SHIFT, end);
-
 		balance_dirty_pages_ratelimited(mapping);
 
 		folio = read_mapping_folio(mapping, index, NULL);
@@ -743,7 +743,14 @@ static int exfat_prepare_valid_range(struct inode *inode, loff_t start,
 
 		folio_lock(folio);
 		if (folio->mapping == mapping) {
-			folio_mark_dirty(folio);
+			next = min(folio_next_pos(folio), end);
+			if (next > exfat_get_valid_size(ei)) {
+				folio_mark_dirty(folio);
+				if (exfat_advance_valid_size(ei, next))
+					mark_inode_dirty(inode);
+			}
+			exfat_advance_zeroed_size(ei,
+						  round_up(next, i_blocksize(inode)));
 			pos = next;
 		}
 		folio_unlock(folio);
@@ -757,13 +764,12 @@ static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
 {
 	struct exfat_inode_info *ei = EXFAT_I(inode);
 	loff_t old_valid_size = exfat_get_valid_size(ei);
+	loff_t old_size, gap_start;
 	int ret = 0;
 
 	if (old_valid_size < new_valid_size) {
 		inode_dio_wait(inode);
-
-		/* Do not re-zero blocks already covered by zeroed_size. */
-		loff_t gap_start = max(old_valid_size, exfat_get_zeroed_size(ei));
+		old_size = i_size_read(inode);
 
 		if (i_size_read(inode) < new_valid_size) {
 			/*
@@ -782,23 +788,31 @@ static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
 		 * is updated.
 		 */
 		filemap_invalidate_lock(inode->i_mapping);
+		/* Fault may have initialized more of the gap while we waited. */
+		gap_start = max(exfat_get_valid_size(ei),
+				exfat_get_zeroed_size(ei));
 		if (gap_start < new_valid_size)
 			unmap_mapping_range(inode->i_mapping, gap_start,
 					new_valid_size - gap_start, 0);
 		ret = exfat_prepare_valid_range(inode, gap_start, new_valid_size);
-		filemap_invalidate_unlock(inode->i_mapping);
 		if (ret) {
-			filemap_invalidate_lock(inode->i_mapping);
-			truncate_setsize(inode, old_valid_size);
-			exfat_truncate(inode);
+			/* Preserve initialized data, including stores through mmap. */
+			loff_t size = max(old_size, exfat_get_valid_size(ei));
+
+			if (size < i_size_read(inode)) {
+				truncate_setsize(inode, size);
+				exfat_truncate(inode);
+			}
 			filemap_invalidate_unlock(inode->i_mapping);
 			return ret;
 		}
 
-		exfat_set_valid_size(ei, new_valid_size);
+		/* The requested gap can already be covered by zeroed_size. */
+		if (exfat_advance_valid_size(ei, new_valid_size))
+			mark_inode_dirty(inode);
 		exfat_advance_zeroed_size(ei,
 				round_up(new_valid_size, i_blocksize(inode)));
-		mark_inode_dirty(inode);
+		filemap_invalidate_unlock(inode->i_mapping);
 	}
 
 	return ret;
@@ -829,7 +843,7 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
 	inode_dio_wait(file_inode(iocb->ki_filp));
 
 	written = iomap_file_buffered_write(iocb, from, &exfat_write_iomap_ops,
-			NULL, NULL);
+			&exfat_iomap_write_ops, NULL);
 	if (written < 0)
 		return written;
 
@@ -921,7 +935,8 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 		 */
 		inode_dio_wait(inode);
 		ret = iomap_file_buffered_write(iocb, iter,
-				&exfat_write_iomap_ops, NULL, NULL);
+				&exfat_write_iomap_ops, &exfat_iomap_write_ops,
+				NULL);
 	}
 	if (ret != -EIOCBQUEUED && end > i_size_read(inode))
 		exfat_write_failed(inode);
@@ -971,56 +986,53 @@ static ssize_t exfat_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 {
 	struct inode *inode = file_inode(vmf->vma->vm_file);
+	struct address_space *mapping = inode->i_mapping;
 	struct exfat_inode_info *ei = EXFAT_I(inode);
+	struct folio *folio = page_folio(vmf->page);
+	loff_t fault_start = folio_pos(folio);
+	loff_t new_valid_size, gap_start;
 	vm_fault_t ret;
-	loff_t new_valid_size, mmap_valid_size, fault_page_start;
+	int error;
 
-	if (exfat_forced_shutdown(inode->i_sb))
-		return vmf_fs_error(-EIO);
+	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
+		return VM_FAULT_SIGBUS;
 
 	if (!inode_trylock(inode))
 		return VM_FAULT_RETRY;
 
-	mmap_valid_size = ((loff_t)vmf->pgoff + 1) << PAGE_SHIFT;
-	fault_page_start = ((loff_t)vmf->pgoff) << PAGE_SHIFT;
-	new_valid_size = min(mmap_valid_size, i_size_read(inode));
-
-	if (exfat_get_valid_size(ei) < new_valid_size) {
-		loff_t zeroed_size = exfat_get_zeroed_size(ei);
+	sb_start_pagefault(inode->i_sb);
+	error = file_update_time(vmf->vma->vm_file);
+	if (error) {
+		ret = vmf_fs_error(error);
+		goto out_pagefault;
+	}
+	filemap_invalidate_lock_shared(mapping);
 
-		if (zeroed_size < fault_page_start) {
-			int err;
+	if (folio->mapping != mapping || fault_start >= i_size_read(inode)) {
+		ret = VM_FAULT_NOPAGE;
+		goto out_unlock;
+	}
 
-			/*
-			 * Zero only the gap below the faulting page. The read
-			 * fault populated its folio and iomap_page_mkwrite()
-			 * will dirty it.
-			 */
-			err = exfat_prepare_valid_range(inode, zeroed_size,
-					fault_page_start);
-			if (err < 0) {
-				inode_unlock(inode);
-				return vmf_fs_error(err);
-			}
-		}
+	/* The faulting folio is already populated; initialize only its gap. */
+	gap_start = max(exfat_get_valid_size(ei), exfat_get_zeroed_size(ei));
+	error = exfat_prepare_valid_range(inode, gap_start, fault_start);
+	if (error) {
+		ret = vmf_fs_error(error);
+		goto out_unlock;
+	}
 
-		/*
-		 * Track zeroed_size by block, not page, because writeback stops
-		 * at i_size recording blocks wholly beyond it could skip a
-		 * later required zeroing.
-		 */
+	ret = iomap_page_mkwrite(vmf, &exfat_iomap_ops, NULL);
+	if (ret == VM_FAULT_LOCKED) {
+		/* Buffered write may have grown EOF before we locked the folio. */
+		new_valid_size = min(folio_next_pos(folio), i_size_read(inode));
 		exfat_advance_zeroed_size(ei,
 				round_up(new_valid_size, i_blocksize(inode)));
-		exfat_set_valid_size(ei, new_valid_size);
-		mark_inode_dirty(inode);
+		if (exfat_advance_valid_size(ei, new_valid_size))
+			mark_inode_dirty(inode);
 	}
-
-	sb_start_pagefault(inode->i_sb);
-	file_update_time(vmf->vma->vm_file);
-
-	filemap_invalidate_lock_shared(inode->i_mapping);
-	ret = iomap_page_mkwrite(vmf, &exfat_iomap_ops, NULL);
-	filemap_invalidate_unlock_shared(inode->i_mapping);
+out_unlock:
+	filemap_invalidate_unlock_shared(mapping);
+out_pagefault:
 	sb_end_pagefault(inode->i_sb);
 	inode_unlock(inode);
 
diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index 2089da8439e4..0a37ed9b7330 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -252,6 +252,24 @@ const struct iomap_ops exfat_write_iomap_ops = {
 	.iomap_next	= exfat_write_iomap_next,
 };
 
+static void exfat_iomap_put_folio(struct inode *inode, loff_t pos,
+				  unsigned int copied, struct folio *folio)
+{
+	if (copied) {
+		struct exfat_inode_info *ei = EXFAT_I(inode);
+
+		if (exfat_advance_valid_size(ei, pos + copied))
+			mark_inode_dirty(inode);
+	}
+
+	folio_unlock(folio);
+	folio_put(folio);
+}
+
+const struct iomap_write_ops exfat_iomap_write_ops = {
+	.put_folio	= exfat_iomap_put_folio,
+};
+
 /*
  * exfat_writeback_range - Map folio during writeback
  *
diff --git a/fs/exfat/iomap.h b/fs/exfat/iomap.h
index fd8a913f7794..39c93f8cd790 100644
--- a/fs/exfat/iomap.h
+++ b/fs/exfat/iomap.h
@@ -9,6 +9,7 @@
 extern const struct iomap_dio_ops exfat_write_dio_ops;
 extern const struct iomap_ops exfat_iomap_ops;
 extern const struct iomap_ops exfat_write_iomap_ops;
+extern const struct iomap_write_ops exfat_iomap_write_ops;
 extern const struct iomap_writeback_ops exfat_writeback_ops;
 extern const struct iomap_read_ops exfat_iomap_bio_read_ops;
 
-- 
2.53.0

