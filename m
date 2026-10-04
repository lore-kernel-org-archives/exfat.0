Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6633F7AB7
	for <exfat@lists.linux.dev>; Sun,  4 Oct 2026 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109223; cv=none; b=b1JkmWxvSxvQY6tc6CUfXuzvRSgcU73RQYNUtyXS/auxhLZVLNTHrqpKTo26jCYZ+T+2deK3jNnl068kTvq7oPNktXk+qCBnYpd9ZUhBeUBv/pOib+cAGjUn8jS99R9zc/CTO9TH/Lgf2Kr7qPtZTJFQ9d70+2i51qGzRkHvwX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109223; c=relaxed/simple;
	bh=qAxUWqTFMtrCIl2wmUEs2HFAgyHUsD11V7wNl+Kespg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r8/bQD2jU8AOf1GUa8sqxh/YETVH1iXhEqMfG03VQ+knhQfKSQCGSjnxkKXflPWGT3bSYFG4jqF+sIGmvcOnBMx6mfd786a5a7uHpEId/U7YADcU3UsN6V4PFs2JDwocWrbmosZj8UkiFLLtxIkqrkU7ozB09a2aTelAXrLEcMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FHTw0lcT; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FHTw0lcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/s
	QvuB5GedPp0o/lrwdd8eb6RY+oS/jH3SFxZRDIBFI=; b=FHTw0lcTd6JZprkDqG
	jHD8PctmOcmEfNdMkVMSIHTuz2OzEQlemaKOSKvhbV5YwFLU+S+iECk6bFVaKRFp
	JW2lseRPYS+RwaQa6o5EsMFvPOPqXNwEBOoHMffUYVz3tC4Lm0d0jnaZHQDQ6c+L
	O3qEWd20kUIbS2e4Rd5Za3cgs=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3361AKMJqYRaTCQ--.22355S4;
	Sun, 04 Oct 2026 18:19:47 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 2/4] exfat: hold the invalidate lock while truncating
Date: Sun,  4 Oct 2026 18:19:31 +0800
Message-ID: <20261004101934.1975655-3-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004101934.1975655-1-chizhiling@163.com>
References: <20261004101934.1975655-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3361AKMJqYRaTCQ--.22355S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW5Jr15Zw18WFW3Wr47twb_yoW8WF1rpr
	W5Ga95Kr48X3yqgr1093W8Za1j93WIgrW7u3sYvasFvr95J347tF15trWxKa13tws5Wr4Y
	qFs8XFZ7ury7G3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDtxfUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9wNlA2rCKEPlQgAA32

From: Chi Zhiling <chizhiling@kylinos.cn>

truncate_setsize() ends in truncate_inode_pages(), which is documented
as being "Called under (and serialised by) inode->i_rwsem and
mapping->invalidate_lock".

Hold invalidate_lock while executing truncate_setsize() to ensure that
truncate and mmap writes are mutually exclusive. This can simplify the
handling in exfat_page_mkwrite().

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index b30aec858da6..81eeb76ef94b 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -413,6 +413,7 @@ int exfat_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		 * about to be freed.
 		 */
 		inode_dio_wait(inode);
+		filemap_invalidate_lock(inode->i_mapping);
 		truncate_setsize(inode, attr->ia_size);
 
 		/*
@@ -420,6 +421,7 @@ int exfat_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		 * is already written by it, so mark_inode_dirty() is unneeded.
 		 */
 		exfat_truncate(inode);
+		filemap_invalidate_unlock(inode->i_mapping);
 	} else
 		mark_inode_dirty(inode);
 
@@ -784,8 +786,10 @@ static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
 		ret = exfat_zero_new_range(inode, gap_start, new_valid_size);
 		filemap_invalidate_unlock(inode->i_mapping);
 		if (ret) {
+			filemap_invalidate_lock(inode->i_mapping);
 			truncate_setsize(inode, old_valid_size);
 			exfat_truncate(inode);
+			filemap_invalidate_unlock(inode->i_mapping);
 			return ret;
 		}
 
-- 
2.53.0

