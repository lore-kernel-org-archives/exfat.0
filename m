Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A023815F0
	for <exfat@lists.linux.dev>; Tue, 13 Oct 2026 03:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862765; cv=none; b=dszufN6IMl1kTEm4pdCFigEbe7vHjw+r9W8uW1g2rDpxYi+YsZQTDac1HqdmuY9wwIkYKhtxiHSxiBw0hiNi7QmLVMQiK6s7JJjmwj3CY5iGE77mUvRb26/AMKt4d7ooCoZp8l1JLe3/7JvVOdhtQNx0lpb/iz54L0Fpa1R7sk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862765; c=relaxed/simple;
	bh=r1XoEurPXm2HjqiN5AAXY/TiqT+ipIiKwcmAEZ8dEPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6tLcbEIDwsVeXVp89h/wq+EUVY9gx/W9lHwSSY81hET+z2cv/h3AyBxwGAdsTpf32/K1TCmCpGPh4LtuWh6N8khavuSlp9EyYCzqEknV8QY3iSm4ynFpZW2xfF7BUurvrV9U8FJkkbHC+oAp84GjYGrOTUKSeqnmsWK5ZAs/Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kCYnaS65; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kCYnaS65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ei
	S5+qLlY8LRrVBiWt8RnWa+C7BzAITLjOUib6is1jE=; b=kCYnaS652DSDAHlNnx
	0s2UucodsfKSiEyF59b4GOWN+8C8DpKE/05E0xO7eKhvfIbLEEZXMOcLOSfTlZLC
	0vwRrsW37WGkr6rejcO8hfybDFfGvpizULuAa+IIZ/pqo8cOXFKlZHDEQ3pcrdB4
	/TCJF0sTIFB9f9X2chrbnNn5w=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3fwTKp81qBFXLEQ--.23138S3;
	Tue, 13 Oct 2026 11:38:53 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 1/7] exfat: advance valid_size under the folio lock for buffered writes
Date: Tue, 13 Oct 2026 11:38:31 +0800
Message-ID: <20261013033837.2748258-2-chizhiling@163.com>
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
X-CM-TRANSID:_____wD3fwTKp81qBFXLEQ--.23138S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWkCr15Gw1DXFy7Cw18Grg_yoW5uFyfp3
	98Ka13GrZ7Xay7Wrn8CFyUXa4Yk34fGrW3GryrGanxZr9FvrWIkFyjgFyjkF15J3srGr4Y
	qFsY9ry8JrsrC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzyIUUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+A0ryGrNp80CNQAA3s

From: Chi Zhiling <chizhiling@kylinos.cn>

Buffered writes currently advance valid_size in
exfat_write_iomap_end(), which runs after the folio has been unlocked.
As a result, a folio beyond valid_size can become uptodate and dirty,
and be observed by writeback or reclaim while valid_size still points
to an earlier position.

If reclaim drops such a folio before valid_size covers its range, a
subsequent read treats the range as unwritten and zero-fills it without
reading from disk. When this zero-filled page is later written back,
the zeros overwrite the data that was just written, silently losing
the write even if valid_size has since been advanced.

Advance valid_size from the buffered write path via an iomap
put_folio callback while the folio is still locked. This ensures
valid_size is updated before the folio becomes visible to writeback,
preventing the written data from being lost. Mark the inode dirty
whenever valid_size advances.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c  |  8 ++++++--
 fs/exfat/iomap.c | 16 ++++++++++++++++
 fs/exfat/iomap.h |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index f106db945d8d..dc6df0b73373 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -816,7 +816,7 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
 	inode_dio_wait(file_inode(iocb->ki_filp));
 
 	written = iomap_file_buffered_write(iocb, from, &exfat_write_iomap_ops,
-			NULL, NULL);
+			&exfat_iomap_write_ops, NULL);
 	if (written < 0)
 		return written;
 
@@ -907,11 +907,15 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 		 */
 		inode_dio_wait(inode);
 		ret = iomap_file_buffered_write(iocb, iter,
-				&exfat_write_iomap_ops, NULL, NULL);
+				&exfat_write_iomap_ops, &exfat_iomap_write_ops,
+				NULL);
 	}
 	if (ret < 0)
 		goto unlock;
 
+	if (exfat_get_valid_size(ei) > valid_size)
+		mark_inode_dirty(inode);
+
 	inode_unlock(inode);
 
 	if (iocb->ki_pos > pos) {
diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index e50ecbfbfbe0..f3816509c6e5 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -252,6 +252,22 @@ const struct iomap_ops exfat_write_iomap_ops = {
 	.iomap_next	= exfat_write_iomap_next,
 };
 
+static void exfat_iomap_put_folio(struct inode *inode, loff_t pos,
+		unsigned int copied, struct folio *folio)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
+	if (copied)
+		exfat_advance_valid_size(ei, pos + copied);
+
+	folio_unlock(folio);
+	folio_put(folio);
+}
+
+const struct iomap_write_ops exfat_iomap_write_ops = {
+	.put_folio	= exfat_iomap_put_folio,
+};
+
 /*
  * exfat_writeback_range - Map folio during writeback
  *
diff --git a/fs/exfat/iomap.h b/fs/exfat/iomap.h
index fd8a913f7794..39c93f8cd790 100644
--- a/fs/exfat/iomap.h
+++ b/fs/exfat/iomap.h
@@ -9,6 +9,7 @@
 extern const struct iomap_dio_ops exfat_write_dio_ops;
 extern const struct iomap_ops exfat_iomap_ops;
 extern const struct iomap_ops exfat_write_iomap_ops;
+extern const struct iomap_write_ops exfat_iomap_write_ops;
 extern const struct iomap_writeback_ops exfat_writeback_ops;
 extern const struct iomap_read_ops exfat_iomap_bio_read_ops;
 
-- 
2.53.0

