Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4500C1DD0EF
	for <exfat@lists.linux.dev>; Sun,  4 Oct 2026 02:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791082783; cv=none; b=g8nF+AXV9eXTLuoRJ1t1ZFpijbjZ6IdrvS71//3zwSzAyka06nYNcory+dWjsZ9zKoN54cS7QckUDqGrX2MKs1JOn37byyXk463rOMc6zPgC3o3bBiuamQmuS9+ukDy2FQh/zR0OWgrMACe+6ox8SzwT0cguJSGr+IOmRLtdAeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791082783; c=relaxed/simple;
	bh=qAxUWqTFMtrCIl2wmUEs2HFAgyHUsD11V7wNl+Kespg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3NyBxrh2qnuuk0szvUQTDvE545/9tneFljsoKECfzHXdNSaSSZKtld2qAAvxOnaxpzDYTklnuHG4TbM0Ldyu427Cc1iPid3jYuRquifou2uw4FzRR1uZPkiykSLlTvu+gLehUWs1VORFRmi5pjLWnSecRIOZvx7RhGDRO15l2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gACC/b1w; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gACC/b1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/s
	QvuB5GedPp0o/lrwdd8eb6RY+oS/jH3SFxZRDIBFI=; b=gACC/b1wg+D0l4sGWU
	gB2IUIXWsIuaBl+in1GcESQWDjRl2DBPt5REioTELuPP/6ptw8OdO8pe1PaTHnkL
	Dveeh2i4j7osfyZUYDserIzRyCRVJT3CEN5Y1IeGySNXw6fQEcghlBQShEbviFcP
	VqCCIwTG6RjV9dz3yXrm7/t/s=
Received: from czl-pc (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgB3HLn9wMFqhREUCg--.6715S4;
	Sun, 04 Oct 2026 10:59:11 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH 2/4] exfat: hold the invalidate lock while truncating
Date: Sun,  4 Oct 2026 10:59:05 +0800
Message-ID: <20261004025907.1899933-3-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004025907.1899933-1-chizhiling@163.com>
References: <20261004025907.1899933-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgB3HLn9wMFqhREUCg--.6715S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW5Jr15Zw18WFW3Wr47twb_yoW8WF1rpr
	W5Ga95Kr48X3yqgr1093W8Za1j93WIgrW7u3sYvasFvr95J347tF15trWxKa13tws5Wr4Y
	qFs8XFZ7ury7G3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jqzuXUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2x96GGrBwP8B-AAA3P

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

