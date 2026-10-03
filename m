Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5806837F8D7
	for <exfat@lists.linux.dev>; Sat,  3 Oct 2026 03:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790998308; cv=none; b=TJPrmyd0qS08D7n7AQ7UMif2CetaDbuzVBEpVrATM4MxRCCZRBvUdG3xVMcftTUpoE2i6tJsI2LJSzPrhmBCRMzt4hcsD8N+MP+ukKOwuU4pVHvUg2Z6CASLIlsEKnqKiXqWxJGOMgNAiYEHJp2Y2MlUXEZs53XQV42apj0z8og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790998308; c=relaxed/simple;
	bh=UFbcR9aJCgwwNjHkv2z/Zp1rljfvI/rGNjjAyUd6gpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJioSABWwKHBcMchQlOVpPVmvcKD6pL9kx1pN7ZYHTn49xcrDdAG5Xfd8xyJg9NyUvbZKM65vDjQMs1FDBuV1gdVsKcYOTCVB9tXJy+bGsRq4zJG/mzcYfA9b6XbyZSyap7EkvnI06R9TwZKqQNAMp9CI5YCGvFs862dbuAZiIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mkySbm20; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mkySbm20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=HG
	k816CnFgcodWJFZDPBEzVchfSLUZwN7QvVY+L8jZw=; b=mkySbm20r/a8T/XHmH
	oxPDFBo4Ww1jLaNp8mrzv0zum3M4QEYFZjIDcYnan/qMwGdMCjDxhMpz00jDUcOs
	WnIuC4dk3O/4YK3y5ZhjUAY+82leXDyZOLiSNphZNva6ooR3YApKTUksMRrAAQH1
	3rI7puea0RCOdRCiNTVueAsp0=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCXTnLfdsBqOdNwCA--.32914S8;
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
Subject: [PATCH v2 6/7] exfat: advance valid_size while zeroing new ranges
Date: Sat,  3 Oct 2026 11:30:31 +0800
Message-ID: <20261003033032.1775311-7-chizhiling@163.com>
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
X-CM-TRANSID:_____wCXTnLfdsBqOdNwCA--.32914S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW8Jr1xCrWUZrWUtF1UWrg_yoW8KF15pr
	W5Cws5G398Z395Wr1vqrs8ZFyY93sagFWxu3s8Cw1DZFnrA34xKF18KrWxuF43t395Wr1Y
	qF4qyrWUXFnrG3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jetCwUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9wShP2rAduRV9gAA32

From: Chi Zhiling <chizhiling@kylinos.cn>

valid_size is currently updated only after the range has been zeroed, so
it lags the folios that were just marked uptodate and dirty.

Advance it from exfat_zero_new_range() page by page, under the folio
lock and right after the folio is marked dirty.  exfat_extend_valid_size()
then only advances zeroed_size, and exfat_page_mkwrite() advances
valid_size once iomap_page_mkwrite() has returned the locked folio.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 6bd2b6d28a82..d92997dc8eec 100644
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
@@ -683,6 +684,7 @@ static int exfat_zero_new_range(struct inode *inode, loff_t start, loff_t end)
 		folio_lock(folio);
 		if (folio->mapping == mapping) {
 			folio_mark_dirty(folio);
+			exfat_advance_valid_size(ei, next);
 			pos = next;
 		}
 		folio_unlock(folio);
@@ -732,7 +734,6 @@ static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
 			return ret;
 		}
 
-		exfat_set_valid_size(ei, new_valid_size);
 		exfat_advance_zeroed_size(ei,
 				round_up(new_valid_size, i_blocksize(inode)));
 		mark_inode_dirty(inode);
@@ -925,7 +926,6 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 		 */
 		exfat_advance_zeroed_size(ei,
 				round_up(new_valid_size, i_blocksize(inode)));
-		exfat_set_valid_size(ei, new_valid_size);
 		mark_inode_dirty(inode);
 	}
 
@@ -934,6 +934,9 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 
 	filemap_invalidate_lock_shared(inode->i_mapping);
 	ret = iomap_page_mkwrite(vmf, &exfat_iomap_ops, NULL);
+	if (ret == VM_FAULT_LOCKED)
+		exfat_advance_valid_size(ei, new_valid_size);
+
 	filemap_invalidate_unlock_shared(inode->i_mapping);
 	sb_end_pagefault(inode->i_sb);
 	inode_unlock(inode);
-- 
2.53.0

