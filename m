Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F053A47F777
	for <exfat@lists.linux.dev>; Tue, 13 Oct 2026 03:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862783; cv=none; b=iopIeOFVRpgC5bHlhtpG93zDoy2Y0RYQEsgHbe/OUkEZPG9tySrFF+kEP+HmUV6AbT2a4vJmfkIhtgMgZ16oD+VWF6ngUsO2E0zLXgzku0MFYecRctbTXn0zTewV6xsfcmy1uJT/Y7ttPB/jiAis/G0WczBOlyHtjVyjUGOc2WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862783; c=relaxed/simple;
	bh=nqKycE7y7IjpCVQkX0Vd52dh7LzRBMhlW5EdKGTM1Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lwEd8rBGpJFfil7I038FN5q923FIQJD+82hAokx0whFC8034oVEHvn05Ianu52l4IA7C7LWzrgSlmt+c9PwjK8utwUr3IPDtKxZwMVO1SeIJtddR2/icj2tyy7zht4CSHR11uJKjBuDOpIewVVrIxMYSTkJH1+qREX0oj4ByhFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Uz3RfnwT; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Uz3RfnwT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Gk
	3stjaod+aZo4GPRLSWanFoYc7wUDxKdnlkD5AFGLc=; b=Uz3RfnwTyDLYMRVxam
	XFOKWzqdTNDjKsf0tvg7ke0kS+MA5kswpSS3WOFQKCRetvTYSR/2vXOtEozD1d06
	GSG0IEjPqESay+83f4hb2xD04ul1RArjZTgt5do/Y3/8mXR7yR0VPV/Nrj+TLqNU
	b6WOHAEFksgaeoCV+0ol/f80k=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3fwTKp81qBFXLEQ--.23138S9;
	Tue, 13 Oct 2026 11:38:55 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 7/7] exfat: publish i_size and valid_size on direct I/O completion
Date: Tue, 13 Oct 2026 11:38:37 +0800
Message-ID: <20261013033837.2748258-8-chizhiling@163.com>
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
X-CM-TRANSID:_____wD3fwTKp81qBFXLEQ--.23138S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF17Aw1xtry5XFWfur1rZwb_yoW5ur17pr
	Z09an3GayDJ34xWr1kKFyUZa4Fk3WxKFWxWryFk398AF90ywn7KF10qFyrCay3J39Fyw42
	qF4qgrWrWr9rJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URc_fUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3A8ryGrNp89YSgAA3t

From: Chi Zhiling <chizhiling@kylinos.cn>

exfat_write_iomap_end() advances valid_size from the submission path.
A direct write that later fails or completes short has therefore already
marked its range valid, and __exfat_write_inode() records
max(i_size, valid_size) as DataLength, growing the file on disk even
though no data was written.  Advancing valid_size early also lets a
racing mmap fault map the range and pull the not-yet-overwritten contents
of the recycled cluster into the page cache.

Publish both fields from ->end_io() instead, once the transfer has
completed successfully, and stop advancing valid_size from ->iomap_end();
buffered writes still publish valid_size under the folio lock via
->put_folio().

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/iomap.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index 26d216ef9c44..9e25c18c148a 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -15,22 +15,31 @@
 /*
  * exfat_file_write_dio_end_io - Direct I/O write completion handler
  *
- * Updates i_size if the write extended the file. Called from the dio layer
- * after I/O completion.
+ * Updates i_size and valid_size after the transfer has completed
+ * successfully. The updating of i_size and valid_size runs in process
+ * context and under i_rwsem.
  */
 static int exfat_file_write_dio_end_io(struct kiocb *iocb, ssize_t size,
 		int error, unsigned int flags)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
+	loff_t end = iocb->ki_pos + size;
+	bool dirtied = false;
 
-	if (error)
+	if (error || !size)
 		return error;
 
-	if (size && i_size_read(inode) < iocb->ki_pos + size) {
-		i_size_write(inode, iocb->ki_pos + size);
-		mark_inode_dirty(inode);
+	if (i_size_read(inode) < end) {
+		i_size_write(inode, end);
+		dirtied = true;
 	}
 
+	if (exfat_advance_valid_size(EXFAT_I(inode), end))
+		dirtied = true;
+
+	if (dirtied)
+		mark_inode_dirty(inode);
+
 	return 0;
 }
 
@@ -213,15 +222,11 @@ static const struct iomap_ops exfat_swap_iomap_ops = {
 
 /*
  * exfat_write_iomap_end - Update the state after write
- *
- * Extends ->valid_size to cover the newly written range.
- * Marks the inode dirty if metadata was changed.
  */
 static int exfat_write_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 		ssize_t written, unsigned int flags, struct iomap *iomap)
 {
 	struct exfat_inode_info *ei = EXFAT_I(inode);
-	bool dirtied = false;
 	loff_t end;
 
 	if (!written)
@@ -229,18 +234,17 @@ static int exfat_write_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 
 	end = pos + written;
 
-	if (exfat_advance_valid_size(ei, end))
-		dirtied = true;
-
 	/*
 	 * IOMAP_F_ZERO_TAIL zeroes the remainder of the last block. Track that
 	 * block as zeroed so later valid_size extensions do not zero it again.
 	 */
 	if (iomap->flags & IOMAP_F_ZERO_TAIL)
 		end = round_up(end, i_blocksize(inode));
-	exfat_advance_zeroed_size(ei, end);
 
-	if (dirtied || iomap->flags & IOMAP_F_SIZE_CHANGED)
+	if (!(flags & IOMAP_DIRECT))
+		exfat_advance_zeroed_size(ei, end);
+
+	if (iomap->flags & IOMAP_F_SIZE_CHANGED)
 		mark_inode_dirty(inode);
 
 	return written;
-- 
2.53.0

