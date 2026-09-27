Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20333370D6D
	for <exfat@lists.linux.dev>; Sun, 27 Sep 2026 08:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496255; cv=none; b=hllaOVgRh19lduFlxU5D2gRE6KQAS/QGJiHL4pUIZiQGn/zeROIfHPPU9ubws8bTIaLT/zWbzVlxK6w/3TXMX3DTiXtpLNjH+Nb+RCifzNnpMpAcvrpPyEa1tDCN5mDri+SeIaH5zJa+L9tYZc2aIOfmriKU9xjUJmj5DrvDPiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496255; c=relaxed/simple;
	bh=yS/pkfvSoFMg+v8FRvHVAOMCeffv6y2EKCo9TpER+9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prWuQJIjNiGYod8pCkxREr7SSD3FZSpMl9t1R9Xz+FOYJbT5Hdaj9ar0YTFg2S+8F7okoDRhMklhlOXvZDi0c0rHmVhwDQ3rrKcecm03DzqQH6M5wFKcGF2t5jlm0ZbWZTmPRN+tyTjjluzw8FWGSBZWEIzca0TBgK1un8CrYUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jYB5DZIR; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jYB5DZIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ga
	k6sS4I6jOBTPU1fPraI5bt8EtPLZlqZwbsHc2e/RI=; b=jYB5DZIRtJ6q8LD0TB
	0H09Eebgr5v4Gw/pg2YKowWS5KL5xHUDtyG/q2y+aL4i8apDGGYU+EaiNWBxcVoJ
	wFT95f4WM68fmXSMdMEx1u3Rsc8Mjh6x58CQEDftjWrqxogOJjwKXZP5AAjWxA5w
	S4Y4uuie7cP9gsHdNp8LDezes=
Received: from czl-pc (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXrkXNzbhqECuNBg--.31472S7;
	Sun, 27 Sep 2026 16:03:28 +0800 (CST)
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
Subject: [PATCH v1 5/5] exfat: use folio lock to protect valid_size
Date: Sun, 27 Sep 2026 16:03:04 +0800
Message-ID: <20260927080305.831641-6-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927080305.831641-1-chizhiling@163.com>
References: <20260927080305.831641-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgBXrkXNzbhqECuNBg--.31472S7
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFWUXF15Wr4fAr4rWF1xXwb_yoWxAw13pr
	ZIkw13GrWkZ3y7Wr1xGFyUZa4Ykw1SgFWxCr95u3WDZrnFy34xKFyUKFW29Fy3J3s3Gr4Y
	qF4q9ry8GrnrG3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeE_NUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+BBwDmq4zdCLsAAA3i

From: Chi Zhiling <chizhiling@kylinos.cn>

The VM_FAULT_RETRY returned by exfat_page_mkwrite() is ignored by the
memory management subsystem. As a result, an mmap write may proceed beyond
valid_size without advancing valid_size, which could expose stale data.

If we block waiting for the inode lock, we would introduce an
mmap_lock -> inode lock locking order, which could potentially lead to
deadlocks. Therefore, we need to avoid using the inode lock in this path.

Once the inode lock is removed, mmap writes may race with other operations
that hold the inode lock. Therefore, we need to advance valid_size while
holding the folio lock to prevent inconsistencies between the page cache
and valid_size.

DIO bypasses the page cache, so a DIO operation and an mmap write
targeting the same range could potentially result in data loss.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c  | 54 ++++++++++++++++++++++++++----------------------
 fs/exfat/iomap.c | 16 ++++++++++++++
 fs/exfat/iomap.h |  1 +
 3 files changed, 46 insertions(+), 25 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index b2940732812a..ad4bf1c5bb06 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -666,6 +666,7 @@ int exfat_file_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
 static int exfat_zero_new_range(struct inode *inode, loff_t start, loff_t end)
 {
 	struct address_space *mapping = inode->i_mapping;
+	struct exfat_inode_info *ei = EXFAT_I(inode);
 	loff_t next, pos = start;
 	struct folio *folio;
 	pgoff_t index;
@@ -683,12 +684,23 @@ static int exfat_zero_new_range(struct inode *inode, loff_t start, loff_t end)
 		folio_lock(folio);
 		if (folio->mapping == mapping) {
 			folio_mark_dirty(folio);
+			exfat_advance_valid_size(ei, next);
 			pos = next;
 		}
 		folio_unlock(folio);
 		folio_put(folio);
 	}
 
+	/*
+	 * Track zeroed_size by block, not page, because writeback stops
+	 * at i_size recording blocks wholly beyond it could skip a
+	 * later required zeroing.
+	 */
+	exfat_advance_zeroed_size(ei, round_up(end, i_blocksize(inode)));
+
+	if (pos != start)
+		mark_inode_dirty(inode);
+
 	return 0;
 }
 
@@ -698,6 +710,8 @@ static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
 	loff_t old_valid_size = exfat_get_valid_size(ei);
 	int ret = 0;
 
+	inode_dio_wait(inode);
+
 	if (old_valid_size < new_valid_size) {
 		/* Do not re-zero blocks already covered by zeroed_size. */
 		loff_t gap_start = max(old_valid_size, exfat_get_zeroed_size(ei));
@@ -731,11 +745,6 @@ static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
 			filemap_invalidate_unlock(inode->i_mapping);
 			return ret;
 		}
-
-		exfat_set_valid_size(ei, new_valid_size);
-		exfat_advance_zeroed_size(ei,
-				round_up(new_valid_size, i_blocksize(inode)));
-		mark_inode_dirty(inode);
 	}
 
 	return ret;
@@ -751,7 +760,7 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
 	iocb->ki_flags &= ~IOCB_DIRECT;
 
 	written = iomap_file_buffered_write(iocb, from, &exfat_write_iomap_ops,
-			NULL, NULL);
+			&exfat_iomap_write_ops, NULL);
 	if (written < 0)
 		return written;
 
@@ -837,10 +846,14 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 		ret = exfat_dio_write_iter(iocb, iter);
 	else
 		ret = iomap_file_buffered_write(iocb, iter,
-				&exfat_write_iomap_ops, NULL, NULL);
+				&exfat_write_iomap_ops, &exfat_iomap_write_ops,
+				NULL);
 	if (ret < 0)
 		goto unlock;
 
+	if (iocb->ki_pos > valid_size)
+		mark_inode_dirty(inode);
+
 	inode_unlock(inode);
 
 	if (iocb->ki_pos > pos) {
@@ -888,9 +901,10 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 	vm_fault_t ret;
 	loff_t new_valid_size, mmap_valid_size, fault_page_start;
 
-	if (!inode_trylock(inode))
-		return VM_FAULT_RETRY;
+	sb_start_pagefault(inode->i_sb);
+	file_update_time(vmf->vma->vm_file);
 
+	filemap_invalidate_lock_shared(inode->i_mapping);
 	mmap_valid_size = ((loff_t)vmf->pgoff + 1) << PAGE_SHIFT;
 	fault_page_start = ((loff_t)vmf->pgoff) << PAGE_SHIFT;
 	new_valid_size = min(mmap_valid_size, i_size_read(inode));
@@ -909,30 +923,20 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 			err = exfat_zero_new_range(inode, zeroed_size,
 					fault_page_start);
 			if (err < 0) {
-				inode_unlock(inode);
+				filemap_invalidate_unlock_shared(inode->i_mapping);
+				sb_end_pagefault(inode->i_sb);
 				return vmf_fs_error(err);
 			}
 		}
-
-		/*
-		 * Track zeroed_size by block, not page, because writeback stops
-		 * at i_size recording blocks wholly beyond it could skip a
-		 * later required zeroing.
-		 */
-		exfat_advance_zeroed_size(ei,
-				round_up(new_valid_size, i_blocksize(inode)));
-		exfat_set_valid_size(ei, new_valid_size);
-		mark_inode_dirty(inode);
 	}
 
-	sb_start_pagefault(inode->i_sb);
-	file_update_time(vmf->vma->vm_file);
-
-	filemap_invalidate_lock_shared(inode->i_mapping);
 	ret = iomap_page_mkwrite(vmf, &exfat_iomap_ops, NULL);
+	if (ret == VM_FAULT_LOCKED &&
+	    exfat_advance_valid_size(ei, new_valid_size))
+		mark_inode_dirty(inode);
+
 	filemap_invalidate_unlock_shared(inode->i_mapping);
 	sb_end_pagefault(inode->i_sb);
-	inode_unlock(inode);
 
 	return ret;
 }
diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index 291367e10c1e..4ed64c67070e 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -221,6 +221,22 @@ const struct iomap_ops exfat_write_iomap_ops = {
 	.iomap_next	= exfat_write_iomap_next,
 };
 
+static void exfat_iomap_put_folio(struct inode *inode, loff_t pos,
+		unsigned int copied, struct folio *folio)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
+	if (copied)
+		exfat_advance_valid_size(ei, pos + copied);
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

