Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360D64756B9
	for <exfat@lists.linux.dev>; Thu, 24 Sep 2026 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247110; cv=none; b=nGdRjcN94SdH9+FUCShhTIWn+ETFPlzN/q7GfxSglgx1m0su30/roPgZlg0oNHleFFVQs9fkCixl+2MinPOXnWZ2D9S39GOty69lq7hx6/xbxlPCaxOHziUCUgb6JC/p6Hvc2HVHv/e339OH/S8ni4UHDzD+GCokdcFDoinWa/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247110; c=relaxed/simple;
	bh=VCOUBmSvA08OLSZZ0QUtRpBpXc4RIeX5lNww1zeNj+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H7hmXEPpV2H2qmv2McD8vqmTEwO9kZFl11Sv/H1wVICCiE2ZFv2SNsY3ak5ZMgYBXdgr4R1LSTU7MJ6bM7c6CnF1KJE7s/TA/AIk5eiGJ2HQ+VDSTRrxYEFOcR+DGtN+yjNSG3risRptf5MHfUsuWRrNH2YPQeEIw0f2XF8KQYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FCc/RknF; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FCc/RknF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Gb
	iQVEWtVb+Jbk8/U09Tj0Cxmmbe6xVeYJInM/aCluU=; b=FCc/RknFcG65ZL6bzm
	I7IXiL78N00nUmijRrJJ4SkZC1G9q+FXnJL8DdYUTskqxC279fkHKXRE3dV2+w1Z
	OjfPlUOAxKGD+2Z2GTxCR64r5CK4FWTXYUiDGzz71cBgRgR213P24jvF+XzZKfng
	16bNVJ2izr4/kIKRRuZx4UR44=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgBHFxixALVqNOv+Aw--.7356S5;
	Thu, 24 Sep 2026 18:51:34 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 3/3] exfat: drain in-flight DIO before buffered write fallback
Date: Thu, 24 Sep 2026 18:51:25 +0800
Message-Id: <20260924105125.577714-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924105125.577714-1-yaojiale02@163.com>
References: <20260924105125.577714-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgBHFxixALVqNOv+Aw--.7356S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4kGFy5AFykKF47tr1rXrb_yoW8ZF43pr
	Z0ga45JryDt397XwnruF48W3WFk395A3y3ZrWvv3WDCrWUWr4vga1ktr1YvF43JanrGr4j
	qa109rykAr1DCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UY0PhUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRY1b2q1ALb8DgAA3a

An asynchronous direct write can remain in flight after the inode lock is
released.  If another direct write falls back to buffered I/O while the
first write is still pending, iomap_file_buffered_write() can dirty pages
before the first write completes its post-I/O page cache invalidation.
The invalidation then finds dirty pages, reports a page cache invalidation
failure, and records -EIO in the mapping error sequence.  A later fsync()
therefore returns -EIO.

Commit 15cdefd0c0522f9d5e12d947fa04f4c11649b699 ("ext4: drain
in-flight DIO before buffered write fallback") fixed the same race in
ext4.  ExFAT has an equivalent fallback after iomap_dio_rw() returns
-ENOTBLK or a short write, but does not drain other in-flight DIO before
dirtying the page cache.

Wait for in-flight DIO before calling iomap_file_buffered_write() in the
fallback path.

A reproducer using concurrent AIO direct writes and buffered fallback
triggered the following warning and made a subsequent fsync() return
-EIO:

  Page cache invalidation failure on direct I/O.  Possible data corruption
  due to collision with buffered I/O!

Fixes: 867b9c96dc83 ("exfat: add iomap direct I/O support")
Link: https://lore.kernel.org/r/20260629113827.4074335-3-libaokun@linux.alibaba.com
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 fs/exfat/file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index a2a9ee1a2004..cf5ccbd54823 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -807,6 +807,12 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
 
 	iocb->ki_flags &= ~IOCB_DIRECT;
 
+	/*
+	 * Prevent concurrent direct I/O and buffered I/O to the same file
+	 * range. Wait for in-flight DIO to finish before dirtying pages.
+	 */
+	inode_dio_wait(file_inode(iocb->ki_filp));
+
 	written = iomap_file_buffered_write(iocb, from, &exfat_write_iomap_ops,
 			NULL, NULL);
 	if (written < 0)
-- 
2.34.1

