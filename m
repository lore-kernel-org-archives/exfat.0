Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF722AD35
	for <exfat@lists.linux.dev>; Sat,  3 Oct 2026 03:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790998293; cv=none; b=LuUtrRHIFqJdr+QTLXGogm1WZ5O+IbEkzbqGv+JixtG9C+r3f3zFWvfj8YaOihxsYEbI1vx4sjuJYu5C9P2LhVHasKNC+J3Ke49DfxxhDs2CarH+how9HcKRm0v3OZk2mow+egf0DGD+pLMFmZMz9gqIW8BsHhRHCULD8w9Clsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790998293; c=relaxed/simple;
	bh=qAxUWqTFMtrCIl2wmUEs2HFAgyHUsD11V7wNl+Kespg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUExUi5llGsanyvkDN+WpQNNfJvCdfeBp62nOi12etegOBEf/htD5vylp9R2Rq2WBOB6wL4EDxERJ54L3Y9YP4p4GRmVjH8NSEnMPR/JspOeyfKY4c6Bl+xtkbg4x6RoGepTZDirytgZrqLbGbKGWfLB3ppcMFM1GAJEmwk2crI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=NJd0ES48; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="NJd0ES48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/s
	QvuB5GedPp0o/lrwdd8eb6RY+oS/jH3SFxZRDIBFI=; b=NJd0ES48LRIkkesTW4
	u58i2+RqqBCYDXJeXo1Q3YKBRdyyy9Ex3s2rQ8zhPbWYHpT/km0aGM/Vlr1nA3na
	EOcTvbLbb/tJBQgWiwDjXWTzIZYcbFfSOCVOZYWPhQaY7cXvwgytbD4NUKYd1rt8
	acwDY2uUQ07ySypqojtjE54rk=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCXTnLfdsBqOdNwCA--.32914S4;
	Sat, 03 Oct 2026 11:30:43 +0800 (CST)
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
Subject: [PATCH v2 2/7] exfat: hold the invalidate lock while truncating
Date: Sat,  3 Oct 2026 11:30:27 +0800
Message-ID: <20261003033032.1775311-3-chizhiling@163.com>
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
X-CM-TRANSID:_____wCXTnLfdsBqOdNwCA--.32914S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW5Jr15Zw18WFW3Wr47twb_yoW8WF1rpr
	W5Ga95Kr48X3yqgr1093W8Za1j93WIgrW7u3sYvasFvr95J347tF15trWxKa13tws5Wr4Y
	qFs8XFZ7ury7G3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2xRhUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2wOgPmrAduM2ogAA3t

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

