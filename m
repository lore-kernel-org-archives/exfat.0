Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56A13E1CE5
	for <exfat@lists.linux.dev>; Sun,  4 Oct 2026 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109224; cv=none; b=f9zh4n4MZ5xpqJkzTj6PRbuMnYcY0vVRVjW+jDpoVWRUK7osgIZgJrZhcI18Tj838Dc1Oh9IR5yPJ3bb3OtYLqXZV6QXXyaQT5axORdIGEok3rjcsdcjX0GEIDDrIFtCCk2SBS/cYDsRGbMyXXvC8jwhRBrYthDKXDbGXEM2pPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109224; c=relaxed/simple;
	bh=4d49AezO1Cfwv1nYXS6ROw9d+9OyfP6qv0Uc2PvQyzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYtCzXiJs9dN7maEJ46zIS2RKPR8z3Q6E/OguH3zo3Sy6JpOoCHCZZrWJ/VfvPfRfGEWg93AZJrdrTIS/Y72+FOZY2bDTCyDQa/i2WPO6hw9/nRTU69dujk+SVmWO0viyJEEJ/vAlEWNP+OtSZFK9uPYLUgScTvb/msr+LXnQUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eAZPuzLx; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eAZPuzLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8/
	lX9/GFrm1WODBBzZ61GwNxghzeVUCUWV+XT5Dcbwc=; b=eAZPuzLxPC4SBxQuVm
	sgKoJWm13LLqj0ZUZ2Bglrv/om1eD0BDeTRfJYAJJRUOYYc6UsuZMXAVcpvad62q
	ACf4XFn/rPfIQs5rOrw+gDt9d5/Dsc7Ld8nw1bD4ZI9IxKjyxZVlaXTJzy/BcDwh
	WQYCffqCMUmIHuYpfOzgVtYgQ=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3361AKMJqYRaTCQ--.22355S5;
	Sun, 04 Oct 2026 18:19:47 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 3/4] exfat: dirty all new pages when extending valid_size
Date: Sun,  4 Oct 2026 18:19:32 +0800
Message-ID: <20261004101934.1975655-4-chizhiling@163.com>
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
X-CM-TRANSID:_____wD3361AKMJqYRaTCQ--.22355S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxur43CF47KryUAF1DJryUAwb_yoW5tF4kpr
	W3Kr9xCrWDX34DuF1fXF18Xr1Yk3s3Wa18AFyxXwn3ZF98AryDKr17K3W0vFy5trW7AFy0
	gF1Yyry8uF1UXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jdzVbUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2wRmBGrCKEQ7VgAA3U

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
 fs/exfat/file.c | 92 +++++++++----------------------------------------
 1 file changed, 16 insertions(+), 76 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 81eeb76ef94b..d729e881bff0 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -664,90 +664,30 @@ int exfat_file_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
 static int exfat_zero_new_range(struct inode *inode, loff_t start, loff_t end)
 {
 	struct address_space *mapping = inode->i_mapping;
-	unsigned int blocksize = i_blocksize(inode);
-	loff_t pos = start;
-	int err;
-
-	while (pos < end) {
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
+	loff_t next, pos = start;
+	struct folio *folio;
+	pgoff_t index;
 
-		if (folio_test_uptodate(folio)) {
-			folio_lock(folio);
-			if (folio->mapping == mapping)
-				folio_mark_dirty(folio);
-			folio_unlock(folio);
-			folio_put(folio);
-			pos = next;
-			continue;
-		}
-
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
+	if (pos >= end)
+		return 0;
 
-			if (iomap_is_partially_uptodate(folio,
-					offset_in_folio(folio, bpos), blocksize)) {
-				bpos += blocksize;
-				continue;
-			}
+	while (pos < end) {
+		index = pos >> PAGE_SHIFT;
+		next = min(((loff_t)index + 1) << PAGE_SHIFT, end);
 
-			rstart = bpos;
-			rend = min_t(loff_t, bpos + blocksize, next);
-			while (rend < next &&
-			       !iomap_is_partially_uptodate(folio,
-					offset_in_folio(folio, rend), blocksize))
-				rend = min_t(loff_t, rend + blocksize, next);
+		balance_dirty_pages_ratelimited(mapping);
 
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
+		folio = read_mapping_folio(mapping, index, NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
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

