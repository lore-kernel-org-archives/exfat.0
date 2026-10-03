Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3FD3DDAF9
	for <exfat@lists.linux.dev>; Sat,  3 Oct 2026 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019859; cv=none; b=oTmH1eiLk3wPWEHQ/HDVh/6zhfPDIV9n+lc6JE87mIj3IaalG4RABowEynB+/9hY6updWQmu0nj47fjfng7VUlRkeqkN3An15G4hpHHOtYpJhHGpQEgT83LX4vlT3g/huDhRM/CFWj6SdN1oDW91TDtV2cc5+MzM6QNWA76EHj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019859; c=relaxed/simple;
	bh=wqG78e7RjaZo7T1vw7bGRgiG1Rx/D5niKIz724aYUN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M0xiRrW/nSwh5zS4hJm31ViQGQx8lYfy2RYNTjQStAt26V4C/9Wf+d5mfmyMGalP1qB74Nw9+orHiVaY6yPD1eXNpxYj4Zl166g/VNGC1PXvhHc+E2TVTM770IBeVLczUgh86UbsAxUy7A5OO9NHB/31opVLHAus8UO+GLKnbUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=N9r37gNy; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="N9r37gNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=XK
	ZXdhMN/Ncg6RxY73rBCxVKsGNsk10aJDPNsgE/cQY=; b=N9r37gNyyMGxmh8gXn
	+BaBegjNnzT1JY16wuH2Cu0VksEkte4JyqRpjCdnVp2j+9zQnIh0W1FFDg+LykMc
	8rw1fTBm26ivop04fsEuHUcZ4gcGz2NTo6rma8IWnxS/2YBmMYApJ6hFXFz9Y2KM
	q1yiH2W2h497W0JvvQqNb2OfM=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBnTqs9y8BqZLmrCg--.23213S5;
	Sat, 03 Oct 2026 17:30:45 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v4 3/3] exfat: drain in-flight DIO before buffered writes
Date: Sat,  3 Oct 2026 17:30:35 +0800
Message-Id: <20261003093035.532916-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261003093035.532916-1-yaojiale02@163.com>
References: <20261003093035.532916-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgBnTqs9y8BqZLmrCg--.23213S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxurW5Wr4xuF1UJw17tF4Dtwb_yoW5Gw4xpr
	ZxK3y5Jr92y397Wrn7uF45Z3WYkrZ5J3y3uFZ8Z3Wqkr98Ar4jgF18tFya9r13JwsrJw4j
	qFsY9FykGryUCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziYL9bUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQXOCWrAy0WoEAAA3T

An asynchronous direct write can remain in flight after the inode lock is
released. If a buffered operation dirties page cache while the direct
write is still pending, the direct write's post-I/O invalidation can find
the dirty pages, report a page cache invalidation failure, and record -EIO
in the mapping error sequence. A later fsync() therefore returns -EIO.

Commit 15cdefd0c0522f9d5e12d947fa04f4c11649b699 ("ext4: drain
in-flight DIO before buffered write fallback") fixed the same race in
ext4. ExFAT does not drain in-flight DIO before a regular buffered write,
the buffered fallback after iomap_dio_rw() returns -ENOTBLK or a short
write, or the page-cache operations used to extend valid_size.

Wait for in-flight DIO before these paths can dirty page cache.

A reproducer using concurrent AIO direct writes and buffered fallback
triggered the following warning and made a subsequent fsync() return
-EIO:

  Page cache invalidation failure on direct I/O. Possible data corruption
  due to collision with buffered I/O!

Fixes: 867b9c96dc83 ("exfat: add iomap direct I/O support")
Link: https://lore.kernel.org/r/20260629113827.4074335-3-libaokun@linux.alibaba.com
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 fs/exfat/file.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index a2a9ee1a2004..3f08b571dec1 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -758,6 +758,8 @@ static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
 	int ret = 0;
 
 	if (old_valid_size < new_valid_size) {
+		inode_dio_wait(inode);
+
 		/* Do not re-zero blocks already covered by zeroed_size. */
 		loff_t gap_start = max(old_valid_size, ei->zeroed_size);
 
@@ -807,6 +809,8 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
 
 	iocb->ki_flags &= ~IOCB_DIRECT;
 
+	inode_dio_wait(file_inode(iocb->ki_filp));
+
 	written = iomap_file_buffered_write(iocb, from, &exfat_write_iomap_ops,
 			NULL, NULL);
 	if (written < 0)
@@ -889,11 +893,17 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 			goto unlock;
 	}
 
-	if (iocb->ki_flags & IOCB_DIRECT)
+	if (iocb->ki_flags & IOCB_DIRECT) {
 		ret = exfat_dio_write_iter(iocb, iter);
-	else
+	} else {
+		/*
+		 * Prevent concurrent direct I/O and buffered I/O to the same file
+		 * range. Wait for in-flight DIO to finish before dirtying pages.
+		 */
+		inode_dio_wait(inode);
 		ret = iomap_file_buffered_write(iocb, iter,
 				&exfat_write_iomap_ops, NULL, NULL);
+	}
 	if (ret < 0)
 		goto unlock;
 
-- 
2.34.1

