Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28264370D6D
	for <exfat@lists.linux.dev>; Sun, 27 Sep 2026 08:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496275; cv=none; b=KkCvSnILqO7WxJmSOijSkIa8BfMDZeSDNw42rnyVdRdLY/VRcdS3OMxt65T6pl0GWlk/+uzemEV1Wq30qGcVY82mmSF3XgRja3BoevRgvLIdHyCLXUBMn7Pjzp5Pabxyn6m9rEg3ECG8+r4d0+rFsEVlVvYXau0KLSHCLylI9XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496275; c=relaxed/simple;
	bh=Pidziwczjfm6ZNqwejbLvVCJCgAz1frDce3lVzzn0so=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qn3Jw109KsBM3/kUdPLYmYGjslkLSXEIf3THuxbI3inTQzXgSpeD2ULRghswonqqCAGK6v4nJ28Xi+3znK0Y6s//tlQkrmZv9WSQj7ENURYJnKKpWOdLgfLzlqM3ICaN1Puaazhl7x+4yMAdBax61EwMEVkYfP05aADsxiIPqJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TBKgDfTZ; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TBKgDfTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mN
	q/B0et8AUHiJqoIE6D5XrJSJuOL+T6JswtFxmavVw=; b=TBKgDfTZAtx8AKtTmE
	0zlqIhBmOBZjEh+J+2I3EAtDkvbJER19AGElMjRlNguf2Ua17bbZ8LJKP9cZ72io
	/5nYga9i5cORN3m93sVaRjIwOAS8f4SJNqIjSxRuiuzNtpP0uUw6G7ko/kNT1L8s
	BSN/c5tnfeo5dIyCiZNJAAsLA=
Received: from czl-pc (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXrkXNzbhqECuNBg--.31472S5;
	Sun, 27 Sep 2026 16:03:27 +0800 (CST)
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
Subject: [PATCH v1 3/5] exfat: hold the invalidate lock while truncating
Date: Sun, 27 Sep 2026 16:03:02 +0800
Message-ID: <20260927080305.831641-4-chizhiling@163.com>
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
X-CM-TRANSID:PygvCgBXrkXNzbhqECuNBg--.31472S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW5Jr15Zw18WFW3Wr47twb_yoW8WF1rpr
	W5Ga95Kw48X3yDWr18u3W8Za1Y93WIgrW7u3sYvasFvr95J34aqF15trWxKa13tws5uw4Y
	qFs8XFZrury7G3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jgcTPUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3BBwDmq4zdC+oAAA3j

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
index e7225f548189..e1394c5b016a 100644
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
 
@@ -721,8 +723,10 @@ static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
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

