Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9440B1DD0EF
	for <exfat@lists.linux.dev>; Sun,  4 Oct 2026 02:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791082780; cv=none; b=bQf7sW988qHzstMZTLgNRJAtlFNo2rLMpghhyhaMKm2pQjnT5lsbOy9doZPTr3jI0dhg5o3lE1TRUsdYO1gNO6NFSMgbDlDdsfrqHdb4F9wSExwfRuvLL+nL59jhdy8k1VrOCxeZrhRr+qyXOTnOmjhF2SfXWMiQvNtBT69Sc8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791082780; c=relaxed/simple;
	bh=4d49AezO1Cfwv1nYXS6ROw9d+9OyfP6qv0Uc2PvQyzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXrLhYHSI2y+WjrBuhDu3iduTmAZ5AZxyY6XZtzTZW0i25Ztkv+UKpMyIcpdZRB8MKpC5tqIp7eRhl4KY9ZovveAnzINbt79JRxcKsdeU8rumTauHsptIIkF3J1wORV+RCTt1pJUsGkHhZF/bMbrIB2VAG+ZL9aeq0pEAbUCwGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kIUM0BPt; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kIUM0BPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8/
	lX9/GFrm1WODBBzZ61GwNxghzeVUCUWV+XT5Dcbwc=; b=kIUM0BPthD7JlDvA5Z
	m9g8dx1vKTiCv8j9JTSOSB/b1F79krSuoXdcg7r/DoFRvFYV6NwVBUgF1hisX32m
	XHrb4VIkrkGBl2mZptvYVtJxMti6IyKSZjK2aFRaw+4RqRLNCupvj9N9+bE4ZhLx
	xFJ3zYUukH9P1Jd1V2hlsUBn8=
Received: from czl-pc (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgB3HLn9wMFqhREUCg--.6715S5;
	Sun, 04 Oct 2026 10:59:11 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH 3/4] exfat: dirty all new pages when extending valid_size
Date: Sun,  4 Oct 2026 10:59:06 +0800
Message-ID: <20261004025907.1899933-4-chizhiling@163.com>
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
X-CM-TRANSID:PSgvCgB3HLn9wMFqhREUCg--.6715S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxur43CF47KryUAF1DJryUAwb_yoW5tF4kpr
	W3Kr9xCrWDX34DuF1fXF18Xr1Yk3s3Wa18AFyxXwn3ZF98AryDKr17K3W0vFy5trW7AFy0
	gF1Yyry8uF1UXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jdfQiUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2x96GGrBwP8CAQAA3x

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

