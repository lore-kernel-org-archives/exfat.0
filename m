Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE8C3815F0
	for <exfat@lists.linux.dev>; Tue, 13 Oct 2026 03:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862762; cv=none; b=bo0CExYcSj/94jucc/Ear6Gi0JJ8Fe31JWARBEN8G0j+Ui0JKJyRyX6kQk4vYsx2DTMNnmuuAS7hmCZAt0KYEyCkEzhe+DiXValWHRRXNLmval2JW8U3IqGloSQDXoP1xmPbcHk6k8v8wp8Bpec4DNDRTRDKCRZkKAe2WS7JkOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862762; c=relaxed/simple;
	bh=esM51vvoOtPoOxHDlew44PUQimW1PdxLnHpqjPHteUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kC1+bhuUvVyzu4Kchua3fNa3t9RYfN4J/ajFQyC77mkt59E1Vnw9cXSU86rAZCYnjiYt7HIdTl7BUllgUf+OQzrJ7yyPuuupMC39z2qzXOuxE/2dXc1EDTEEIH7OepC+L5gS/BHOmTnPjxyLmDzOhN+PBgQ++lmfVjp+3nWaSWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jvGO8oSY; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jvGO8oSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=Vm88sMH+Ec4eT1ejE6ncmgXkfG54r1I0vCceyymuSAc=;
	b=jvGO8oSYJwe47vTi9StIxY/e0lTydnWBPkI+zz5z7614ERENKKpo67Qoc7fyOO
	snbFDcZCxu0b7Rtpb++KdvqA0FFn716FpqcOm6dmdIEVnuf8wnjPSeG21cKjRxP4
	TLjDsh0TTK1bIiMXu4/utPGZdzM2BeZirc/f2LuIMQj9w=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3fwTKp81qBFXLEQ--.23138S8;
	Tue, 13 Oct 2026 11:38:54 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 6/7] exfat: complete direct writes synchronously when they update metadata
Date: Tue, 13 Oct 2026 11:38:36 +0800
Message-ID: <20261013033837.2748258-7-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013033837.2748258-1-chizhiling@163.com>
References: <20261013033837.2748258-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fwTKp81qBFXLEQ--.23138S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyxGr47XF1rGFyUuw1rWFg_yoW8GryUpw
	s8Ga1xuFWDJ342gr1kGF48Ww1F9a4fKFW7GFWj93W5Zr1qvw1SkF4UtFy5Ca13t397Xw1Y
	gFsY9ryUJrnFkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2XdUUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+A4ryGrNp84CSwAA3S

From: Chi Zhiling <chizhiling@kylinos.cn>

The inode metadata for a direct write is updated in ->end_io(). That
handler runs without holding i_rwsem. As a result, the i_size update can
race with other operations.

Whenever a write extends beyond the current valid_size — that is,
whenever ->end_io() will have metadata to update — force synchronous
completion. This guarantees that the i_size update happens under the
inode lock.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 6209a991a118..efcfeab750c0 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -840,10 +840,16 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
 
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

