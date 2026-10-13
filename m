Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1CF47887B
	for <exfat@lists.linux.dev>; Tue, 13 Oct 2026 03:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862770; cv=none; b=I5jema/579XD4I+nGKmu0hZw91Lp87DloaGdGdkKbjh9UHNf/TQxd1qpfIkYsylDplVNxw/cryuq3dCB7Xm3ePcm3z0sXu/FBuWBb1ZY0YdtOhKcxPr6RhcA4oy4WpbpqEI6YJjMg/tHIdTYhtOfqX9t2rexCyRj/sBE83EcoXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862770; c=relaxed/simple;
	bh=erfosRWPTFvOsGU4ezdaOnyZtAcxyQVrWAsDL5HRRGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UUsVBaaL5LSik4YIv8RdodcjJxW8N3ci8AlIUDbm4GxccMgGS4mlSo916esnWSC+8qDYaVSQ5+D5zk3mlhxcg4s3rk/grQjVdeaW9vjVKc/05sQ15RKWpQOS2PAwiJ27ZOlXxZLV2OyoAcdcCaN1PzE6YQx/KZU/vQQWaZgHBUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cONBi+7H; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cONBi+7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=1B
	IiVmEsqhgE22RBFOG7HF+qpOGjbt7+PXa7kkCXNkU=; b=cONBi+7H+nWz1wFSFC
	uO8Vx/yIoGrQ3TCI9ZT/OyAqqMHRD+P50+LGkwN9O6HM9orblJ0221IotZ3k6eQk
	gLew5fCCO0MAlVbtI6DUEQMArNXuDzWBWh9wvgHxxcSw3eFIyToukN3OAj1+TF6Z
	CMzqz1zCOiRbcldeYAng10eBQ=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3fwTKp81qBFXLEQ--.23138S5;
	Tue, 13 Oct 2026 11:38:54 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 3/7] exfat: validate cached iomaps during buffered writes
Date: Tue, 13 Oct 2026 11:38:33 +0800
Message-ID: <20261013033837.2748258-4-chizhiling@163.com>
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
X-CM-TRANSID:_____wD3fwTKp81qBFXLEQ--.23138S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxury8JFyUAw17Aw1DJrWDArb_yoW5XF4fpw
	s8K3s8GrZ3W3W7Wr13JryrZF1a934IgF4xArWfG3sxAFyYyw47KFy8Ga42kF15X34DCr1I
	qa1vkF48WFn7Cr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jd0eQUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2w4ryGrNp86OvAAA3K

From: Chi Zhiling <chizhiling@kylinos.cn>

The next patch, "exfat: drop i_rwsem from exfat_page_mkwrite()", allows a
fault to advance valid_size under the folio lock without serializing
against an in-flight buffered write. As a result, valid_size may advance
into a folio covered by a cached iomap. Reusing that iomap would cause
__iomap_write_begin() to zero the wrong part of the block.

Add an ->iomap_valid callback that compares ->validity_cookie against the
current valid_size and forces a remap if valid_size has advanced into the
locked folio, whose pointer is stored in ->private by ->get_folio.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/iomap.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index f3816509c6e5..26d216ef9c44 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -57,6 +57,7 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 			iomap->addr = IOMAP_NULL_ADDR;
 			iomap->offset = offset;
 			iomap->length = length;
+			iomap->validity_cookie = valid_size;
 			return 0;
 		}
 
@@ -145,7 +146,7 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 		}
 	}
 
-	iomap->flags |= IOMAP_F_MERGED;
+	iomap->validity_cookie = valid_size;
 out:
 	mutex_unlock(&sbi->s_lock);
 	return err;
@@ -252,6 +253,17 @@ const struct iomap_ops exfat_write_iomap_ops = {
 	.iomap_next	= exfat_write_iomap_next,
 };
 
+static struct folio *exfat_iomap_get_folio(struct iomap_iter *iter, loff_t pos,
+			unsigned int len)
+{
+	struct folio *folio = iomap_get_folio(iter, pos, len);
+
+	if (!IS_ERR(folio))
+		iter->iomap.private = folio;
+
+	return folio;
+}
+
 static void exfat_iomap_put_folio(struct inode *inode, loff_t pos,
 		unsigned int copied, struct folio *folio)
 {
@@ -264,8 +276,32 @@ static void exfat_iomap_put_folio(struct inode *inode, loff_t pos,
 	folio_put(folio);
 }
 
+static bool exfat_iomap_valid(struct inode *inode, const struct iomap *iomap)
+{
+	struct folio *folio = iomap->private;
+	loff_t old_valid_size = iomap->validity_cookie;
+	loff_t valid_size = exfat_get_valid_size(EXFAT_I(inode));
+
+	if (valid_size == old_valid_size)
+		return true;
+
+	if (!folio)
+		return false;
+
+	/* Still valid for this folio. */
+	if (old_valid_size >= folio_next_pos(folio))
+		return true;
+
+	if (valid_size <= folio_pos(folio))
+		return true;
+
+	return false;
+}
+
 const struct iomap_write_ops exfat_iomap_write_ops = {
+	.get_folio	= exfat_iomap_get_folio,
 	.put_folio	= exfat_iomap_put_folio,
+	.iomap_valid	= exfat_iomap_valid,
 };
 
 /*
-- 
2.53.0

