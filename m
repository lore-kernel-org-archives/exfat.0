Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B45399CF0
	for <exfat@lists.linux.dev>; Sun, 27 Sep 2026 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496263; cv=none; b=ay1pQvj46Y9axMDexF6DoUzX0b4Hv5okI2qYMry1I87dX4wqxhzpuUeeP/1q+Vh5Ie+QlcFE2dRoqur8VfXYwihj+CYXUU6EhiKIqYILT2AT5zD2eof5Zr2nbvgB+mzkciFmgcgFpPCnLhz8LnVeH4Mwrks957ry4qzxOHqGkG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496263; c=relaxed/simple;
	bh=v3GleeYe1rddJF6BGLIJVQY7ekgO93naMaMI8Z5Tdus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxj9C7jR2h1LMPGHANQrd4oANnivLuaZGlDl5KpY0Ab3fZEzK7nJ7IRZukTi7XSoRK4nDjaxCc95MscFnhVUMTyBn5s/vtAZUwekbYgCyrtH6DEk8/Wg+i4iZlayOFLL2Z+5njdIrolwhJ/D6cWd2i/fqQAZpWKcA4nEXG7W1mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lF9HEhsd; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lF9HEhsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9T
	Sl8VVYUNaAg7ltY34P28jHY2YR8qDkzjpgdOr5h2M=; b=lF9HEhsd1HDUc9iUTO
	ezcZPmn86QMnJ0mwZf69mIDENVDVrsVNLyqVkP84ZSy/S+ofSK5fsEp0Kiw2AjvS
	WGX2PB43bC6/TIMMJ2Nd/MWZH/wj4Ji+bQPCaj4YAcNqfI2IJa2QkKsdNnZXui7p
	bIOhtg+wzryTcsR/6g4lQreKc=
Received: from czl-pc (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXrkXNzbhqECuNBg--.31472S4;
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
Subject: [PATCH v1 2/5] exfat: dirty all new pages when extending valid_size
Date: Sun, 27 Sep 2026 16:03:01 +0800
Message-ID: <20260927080305.831641-3-chizhiling@163.com>
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
X-CM-TRANSID:PygvCgBXrkXNzbhqECuNBg--.31472S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxur43CF47KF18Cw1fCr15Jwb_yoW5try5pr
	W3Kr9xGrWDX34DuF1fXr18Zr1F93s3Wa18AFyxXwn3ZF98AryUKr17K3W0vFy5trW7AFy0
	gF1Yyry8uF1UXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2xRhUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+A9vDWq4zc+LpgAA3o

From: Chi Zhiling <chizhiling@kylinos.cn>

In the current code, exfat_zero_new_range() does not mark non-uptodate
pages as dirty, which may cause some blocks within a page to not be
written back.

This commit no longer checks each block in a non-uptodate page
individually. Instead, it reads the entire page back into the cache and
then writes it back as a whole. This allows concurrent writes and zeroing
operations to be synchronized using the folio lock.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c | 89 ++++++++-----------------------------------------
 1 file changed, 13 insertions(+), 76 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index b30aec858da6..e7225f548189 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -662,90 +662,27 @@ int exfat_file_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
 static int exfat_zero_new_range(struct inode *inode, loff_t start, loff_t end)
 {
 	struct address_space *mapping = inode->i_mapping;
-	unsigned int blocksize = i_blocksize(inode);
-	loff_t pos = start;
-	int err;
+	loff_t next, pos = start;
+	struct folio *folio;
+	pgoff_t index;
 
 	while (pos < end) {
-		loff_t next = min_t(loff_t,
-				round_down(pos, PAGE_SIZE) + PAGE_SIZE, end);
-		struct folio *folio;
-		loff_t bpos;
-
-		folio = filemap_get_folio(mapping, pos >> PAGE_SHIFT);
-		if (IS_ERR(folio)) {
-			err = iomap_zero_range(inode, pos, next - pos, NULL,
-					       &exfat_iomap_ops, NULL, NULL);
-			if (err < 0)
-				return err;
-			pos = next;
-			continue;
-		}
+		index = pos >> PAGE_SHIFT;
+		next = min_t(loff_t, (index + 1) << PAGE_SHIFT, end);
 
-		if (folio_test_uptodate(folio)) {
-			folio_lock(folio);
-			if (folio->mapping == mapping)
-				folio_mark_dirty(folio);
-			folio_unlock(folio);
-			folio_put(folio);
-			pos = next;
-			continue;
-		}
+		balance_dirty_pages_ratelimited(mapping);
 
-		/*
-		 * Zero not-uptodate block runs. iomap_zero_range() requires an
-		 * unlocked folio, so recheck ->mapping after each call.
-		 */
-		folio_lock(folio);
-		bpos = pos;
-		while (bpos < next) {
-			loff_t rstart, rend;
-
-			if (folio->mapping != mapping) {
-				folio_unlock(folio);
-				err = iomap_zero_range(inode, bpos, next - bpos,
-						NULL, &exfat_iomap_ops, NULL, NULL);
-				if (err < 0) {
-					folio_put(folio);
-					return err;
-				}
-				folio_lock(folio);
-				break;
-			}
-
-			if (iomap_is_partially_uptodate(folio,
-					offset_in_folio(folio, bpos), blocksize)) {
-				bpos += blocksize;
-				continue;
-			}
+		folio = read_mapping_folio(mapping, index, NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-			rstart = bpos;
-			rend = min_t(loff_t, bpos + blocksize, next);
-			while (rend < next &&
-			       !iomap_is_partially_uptodate(folio,
-					offset_in_folio(folio, rend), blocksize))
-				rend = min_t(loff_t, rend + blocksize, next);
-
-			folio_unlock(folio);
-			err = iomap_zero_range(inode, rstart, rend - rstart,
-					NULL, &exfat_iomap_ops, NULL, NULL);
-			if (err < 0) {
-				folio_put(folio);
-				return err;
-			}
-			folio_lock(folio);
-			bpos = rend;
-		}
-
-		/*
-		 * Dirty only a fully uptodate folio. Dirtying a partial folio could
-		 * write uninitialised cache contents over valid on-disk blocks.
-		 */
-		if (folio->mapping == mapping && folio_test_uptodate(folio))
+		folio_lock(folio);
+		if (folio->mapping == mapping) {
 			folio_mark_dirty(folio);
+			pos = next;
+		}
 		folio_unlock(folio);
 		folio_put(folio);
-		pos = next;
 	}
 
 	return 0;
-- 
2.53.0

