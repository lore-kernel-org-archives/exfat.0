Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3615D375ACB
	for <exfat@lists.linux.dev>; Fri, 16 Oct 2026 03:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121681; cv=none; b=n3t2IRpJBvN12R4SomnEdD4HLd0Scfpqv8VM1CbG+GEL1A3u/tijxABbVqH//4E57J0qVDOc1Z0c/wJStjlw57TYzAe3Xw/dJBj3wm4VqdCAWlSLcbvsYDHSA/agQira+Ug0pH1XikAUFqBjBjOo/SFLZk+L/fXmLMrWuADGRto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121681; c=relaxed/simple;
	bh=aTBgj/qqRbiEoknT5s0KfQQFS32CjzSCQqD9z/wl4g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bsqdp3a6OwQoeTT1yk2AB7RCBJNY08y6SDfgo+cqXi/yR3nY7V1cC5qu/u70+QSuv27IaJ39/giFV8tsXNZbZy9n/An3l9kI+DzN0Kq6zhx2eUspvo6xgrmYhSZ6hs98hzuzG0GzfGqvhsSpnaVFc5XPlZufi0b3t+YM6T8tol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qe90ePNm; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qe90ePNm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=S1
	92iv37xZv1No/VXB5PzJd+ztp1SUFQRotMCe455p8=; b=qe90ePNmn8fRzNmwm5
	FWDG9R+JREzxJ2X6S+KPfXbmXBoWWxeiJJj8nRgoGX3BjRZwAlul0CnjwEnR4Xn8
	dYia24pLnHoALQInHamsL7nYv5wIcsOA9QkYc0pTu3g0ySHJi1Bon20XMz6HqUvT
	QcRgDiCKxcylsSPnoQIxX7jws=
Received: from czl-pc (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnU5c7m9Fqw1V+AA--.15038S9;
	Fri, 16 Oct 2026 11:34:23 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	exfat@lists.linux.dev
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v3 7/8] exfat: complete direct writes synchronously when they update metadata
Date: Fri, 16 Oct 2026 11:33:48 +0800
Message-ID: <20261016033349.3104509-8-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016033349.3104509-1-chizhiling@163.com>
References: <20261016033349.3104509-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDnU5c7m9Fqw1V+AA--.15038S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyxGr47AF17Jw18ZrWrXwb_yoW8Arykp3
	98Ga13GFZrJ347Wrn7tr48ua4fuayrGFW7JFWFg3W5Zrn0yw1S9F48tFyYka15J397Jw1j
	gF4vkryUGFnFk3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jetCwUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2x8FomrRmz+AuAAA3E

From: Chi Zhiling <chizhiling@kylinos.cn>

The inode metadata for a direct write is updated in ->end_io().  That
handler runs without holding i_rwsem whenever the I/O completes
asynchronously.  As a result, the i_size update can race with other
operations.

Whenever a write extends beyond the current valid_size, that is,
whenever ->end_io() will have metadata to update, pass
IOMAP_DIO_FORCE_WAIT to iomap_dio_rw().  This guarantees that the
metadata update happens under the inode lock held across the write.

Note that this forces extending O_DIRECT writes, the common append case
for AIO and io_uring, to complete synchronously.  Pure overwrites still
complete asynchronously because ->end_io() has nothing to publish for
them.

Fixes: 867b9c96dc83 ("exfat: add iomap direct I/O support")
Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 23b8a36acaf7..27050f0358ee 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -857,10 +857,16 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
 
 static ssize_t exfat_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
+	struct inode *inode = file_inode(iocb->ki_filp);
+	loff_t end = iocb->ki_pos + iov_iter_count(from);
+	unsigned int dio_flags = 0;
 	ssize_t ret;
 
+	if (end > exfat_get_valid_size(EXFAT_I(inode)))
+		dio_flags |= IOMAP_DIO_FORCE_WAIT;
+
 	ret = iomap_dio_rw(iocb, from, &exfat_write_iomap_ops,
-			&exfat_write_dio_ops, 0, NULL, 0);
+			&exfat_write_dio_ops, dio_flags, NULL, 0);
 	if (ret == -ENOTBLK)
 		ret = 0;
 	else if (ret < 0)
-- 
2.53.0

