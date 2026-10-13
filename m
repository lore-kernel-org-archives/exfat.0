Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE202477281
	for <exfat@lists.linux.dev>; Tue, 13 Oct 2026 03:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862768; cv=none; b=Iw+zTCqVyfMIdNP3kAa1uzWzqLvN3C/nd/35evuKQtGY0hDFhOPsSJK6JidFBwZHXIDXjlthtKGJ1oA7+LzuKVnOianebofJjteMQYAKZXFSHxK/BF8wZtpXhhBYuhUthxrqNq18fA9ikJaTHTe+hrgVcHpFPD7AcJZ1L/TKuu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862768; c=relaxed/simple;
	bh=IOPsaKxwkdIm80qA1DNNgnplQIj6JaPx4EULJWdVqwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDo+fdixjsMXQq7RXDgGsZpODrmKgOPcAC5rPBs9PMyAi3Z9qQWZrd0DHrDP/X9hVNeDk0xqaiU+niyIH/3xQ0B4s/ScH6eQtCMcYd8c/9Oee8FkfcXNFLTkXtDz5yS7tl58hlHW8GxVuD07WZqNREA2wVXzaePipKAJB7mdTqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=m0W7d1nR; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="m0W7d1nR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5j
	HBII1fbe7tw6DJW/SIl/iK8ymn9KuRntH9ba2g6EA=; b=m0W7d1nRiGB1XimjVE
	ChX5ZsSOI44Tm2QZX1g+4hhwRF55icKSu7wPHvznEABxGtG7SiKundJRRH1/t2PA
	xseTWxbatc4yLs69w47uwKTENG8C2K2rGmR5vV3pVsx6WjXADdRQSYMbupxj7XRj
	De3mi6PkhDjhYCkn65S1dFC5o=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3fwTKp81qBFXLEQ--.23138S4;
	Tue, 13 Oct 2026 11:38:53 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 2/7] exfat: advance valid_size while zeroing new ranges
Date: Tue, 13 Oct 2026 11:38:32 +0800
Message-ID: <20261013033837.2748258-3-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013033837.2748258-1-chizhiling@163.com>
References: <20261013033837.2748258-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fwTKp81qBFXLEQ--.23138S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1kAF1fZF4xAr1rtrW7twb_yoW5ur45pr
	W3Cws8G39rZ3y5Wrnagrs8Za4YkasaqF4xu3s3u3WkZF1DA34SyF1UGrZ7WFW3t395Ww1j
	qa1qyrW8ur17G3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDtxfUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+A0ryGrNp80CPAAA3l

From: Chi Zhiling <chizhiling@kylinos.cn>

valid_size is currently updated only after the range has been zeroed, so
it lags the folios that were just marked uptodate and dirty.

Advance it from exfat_prepare_valid_range() page by page, under the folio
lock and right after each folio is marked dirty; the same helper advances
zeroed_size and dirties the inode once the range is prepared.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index dc6df0b73373..6f7b50c7a075 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -724,6 +724,7 @@ static int exfat_prepare_valid_range(struct inode *inode, loff_t start,
 				    loff_t end)
 {
 	struct address_space *mapping = inode->i_mapping;
+	struct exfat_inode_info *ei = EXFAT_I(inode);
 	loff_t next, pos = start;
 	struct folio *folio;
 	pgoff_t index;
@@ -744,12 +745,21 @@ static int exfat_prepare_valid_range(struct inode *inode, loff_t start,
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
+	exfat_advance_zeroed_size(ei, round_up(next, i_blocksize(inode)));
+	mark_inode_dirty(inode);
+
 	return 0;
 }
 
@@ -794,11 +804,6 @@ static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
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
@@ -962,6 +967,7 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 	struct exfat_inode_info *ei = EXFAT_I(inode);
 	vm_fault_t ret;
 	loff_t new_valid_size, mmap_valid_size, fault_page_start;
+	bool dirty = false;
 
 	if (!inode_trylock(inode))
 		return VM_FAULT_RETRY;
@@ -988,16 +994,7 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
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
+		dirty = true;
 	}
 
 	sb_start_pagefault(inode->i_sb);
@@ -1005,6 +1002,13 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 
 	filemap_invalidate_lock_shared(inode->i_mapping);
 	ret = iomap_page_mkwrite(vmf, &exfat_iomap_ops, NULL);
+	if (ret == VM_FAULT_LOCKED && dirty) {
+		exfat_advance_valid_size(ei, new_valid_size);
+		exfat_advance_zeroed_size(ei,
+				round_up(new_valid_size, i_blocksize(inode)));
+		mark_inode_dirty(inode);
+	}
+
 	filemap_invalidate_unlock_shared(inode->i_mapping);
 	sb_end_pagefault(inode->i_sb);
 	inode_unlock(inode);
-- 
2.53.0

