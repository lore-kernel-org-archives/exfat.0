Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD13783C5
	for <exfat@lists.linux.dev>; Mon, 28 Sep 2026 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585671; cv=none; b=Z1mNLvPWF4SmLIn5o8y4anMskooUmJVrO1/ypQHqaX8sPrlRbA1XC0/3bHRl4y6j7p9z5ZZZoX+rhJEwsNMHplP/LVCKkXoD1t1QeBmybHrSHYEo0AUP6d1plaYYwAtBhxG8SSCNyGegUuCgEFmBisyOiKY/K4fpWJBtwa8qrm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585671; c=relaxed/simple;
	bh=8iYgxvWNO4R1Auas9F4FNt4KZlzK0kziqtXuK3jeH+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G/akm+xM8b1jcVzjlfnuMJ2YC8SkPhf60DXL18PXXAWbRrRVvQL9KThEaxM+c+t7GvcST+TckArjfB6IKZGeVdZeQFVPtKwsmUWGwAtK7lhLC0+JYfE4y+Zg1K3icM2lu9t2ezh0XMs0Cy/fwazDdOTubcQqisnSrpCkAGuQo9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DsfLjMYE; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DsfLjMYE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=rs
	uG0wOz1hIvb6siWgm8Sl59muHG+Z7h2ye/mN68kNk=; b=DsfLjMYEujfjC5brat
	TH3juP4wBifV3S88yxSaxp8CSgHNDHDlsPv0YtMY82PQYZQKm+NHHqXiJMsZZ94w
	TNI7KaJjtZbZ9rQ7bB4Q/Ci5Ad+cUZ0zikddpQTrVskYMdATrliqfzPiLE06fQAJ
	cI+yoBdwgmKxvrFMuSu4a6BPE=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3t582K7pqm5HnBA--.52401S5;
	Mon, 28 Sep 2026 16:54:20 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v3 3/3] exfat: drain in-flight DIO before buffered writes
Date: Mon, 28 Sep 2026 16:54:12 +0800
Message-Id: <20260928085412.2221055-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928085412.2221055-1-yaojiale02@163.com>
References: <20260928085412.2221055-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3t582K7pqm5HnBA--.52401S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ary7CrykXFyDKw43XrW8Zwb_yoW8Kr1kpr
	Z8K3y5Jr97t397WrnrCF47W3WYkrZ5J3y3ZFWUu3WDuryYyr4jga18tF1avF43JanrGr4j
	gF4v9FykCryUCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziIzutUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xwjXWq6KzwizAAA3k

An asynchronous direct write can remain in flight after the inode lock is
released.  If a buffered write dirties page cache while the direct write
is still pending, the direct write's post-I/O invalidation can find the
dirty pages, report a page cache invalidation failure, and record -EIO in
the mapping error sequence.  A later fsync() therefore returns -EIO.

Commit 15cdefd0c0522f9d5e12d947fa04f4c11649b699 ("ext4: drain
in-flight DIO before buffered write fallback") fixed the same race in
ext4.  ExFAT does not drain in-flight DIO before either a regular buffered
write or the buffered fallback after iomap_dio_rw() returns -ENOTBLK or a
short write.

Wait for in-flight DIO before calling iomap_file_buffered_write() in both
paths.

A reproducer using concurrent AIO direct writes and buffered fallback
triggered the following warning and made a subsequent fsync() return
-EIO:

  Page cache invalidation failure on direct I/O.  Possible data corruption
  due to collision with buffered I/O!

Fixes: 867b9c96dc83 ("exfat: add iomap direct I/O support")
Link: https://lore.kernel.org/r/20260629113827.4074335-3-libaokun@linux.alibaba.com
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 fs/exfat/file.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index a2a9ee1a2004..28811210663f 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -807,6 +807,8 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
 
 	iocb->ki_flags &= ~IOCB_DIRECT;
 
+	inode_dio_wait(file_inode(iocb->ki_filp));
+
 	written = iomap_file_buffered_write(iocb, from, &exfat_write_iomap_ops,
 			NULL, NULL);
 	if (written < 0)
@@ -889,11 +891,17 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
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

