Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD854392828
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 20:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863322; cv=none; b=p5KUtQ8Z+369y6WOTPcLuFMRbFMOi2O0hpYozEIEFpblJwqWTFoYneGYWwms9kZGMalcj1+I5X+eX/AYGbBuCYemzmIbd6lWQsNgCyaflOZnlFUgiuLMx4wBzQhwRjRWJuBxHR72BThAClx95aliPTh4p7K8BrH2KXvypedSVU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863322; c=relaxed/simple;
	bh=djOQgDmzRp8DDwAzqIgieiiwoHi8z8QZ7CGSMyc1vOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2XTJIzmRI/t/WCOH9dc2LMXWnxfJbFBTwpqZfCmgX5wYbftHBCNVmceebU7Xbh9xKTWslsIn/LITpjg4zvksAZTrMZhXAmgCxJKDI1WKdbBuhdMgyRWS/YTQDuZ0Yg0ISLhiPM8buGdVc3LLl8Ejzxk7N11FPSIGLe6gVXOyl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=vGF7Zhkk; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="vGF7Zhkk"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 5B68190B6;
	Thu, 27 Aug 2026 20:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 5B68190B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787863304; bh=djOQgDmzRp8DDwAzqIgieiiwoHi8z8QZ7CGSMyc1vOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vGF7ZhkkNMGE1/BTkjEQFKwXdoZjbQGekDGozeadTuhi35KA0sWqHuEs4BJWwcBRz
	 aNUiVNBIIreqHqVDlaY3pSOyuRuYQRIcT+BgxM2Jq0CjntFgZloEF4hjFsB4hV7abQ
	 bt3U5A5yIo/hwEZby5l2VB77LHU9/FMrd/34i64w=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id rDNIOvygkGosiAIA8KYfjw:T9
	(envelope-from <dxdt@dev.snart.me>); Thu, 27 Aug 2026 20:41:43 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 8/8] mkfs: issue POSIX_FADV_NOREUSE before zeroing out
Date: Fri, 28 Aug 2026 05:39:54 +0900
Message-ID: <20260827204056.222099-9-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827204056.222099-1-dxdt@dev.snart.me>
References: <20260827204056.222099-1-dxdt@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When zeroing out the disk in "full format mode", if mkfs falls back to
using the traditional method of exfat_write_zero2(), the huge amount of
page caches spawned as a result of the write could thrash the system.

To alleviate the cache pollution problem, issue POSIX_FADV_NOREUSE on
the target device so that FMODE_NOREUSE is set for the new pages.

Link: https://kernelnewbies.org/Linux_6.3#Memory_management
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 mkfs/mkfs.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/mkfs/mkfs.c b/mkfs/mkfs.c
index ea67bf5..0bc4876 100644
--- a/mkfs/mkfs.c
+++ b/mkfs/mkfs.c
@@ -1192,13 +1192,27 @@ static int exfat_zero_out_disk(struct exfat_blk_dev *bd,
 	const void *zm = NULL;
 	size_t iosize;
 	unsigned long long target_zerolen;
+#ifdef POSIX_FADV_NOREUSE
+	bool issued_fadvise = false;
+#endif
 
 	assert(ui->cluster_size > 0);
 
 	if (ui->quick)
 		target_zerolen = MIN(bd->size, EXFAT_HEAD_ZERO_OUT);
-	else
+	else {
 		target_zerolen = bd->size;
+#ifdef POSIX_FADV_NOREUSE
+		/*
+		 * Unfortunately, Linux kernel hadn't supported this fadvise()
+		 * op properly until quite recently. See posix_fadvise(2).
+		 *
+		 *   - relevant code in kernel: vma_has_recency()
+		 *   - currently, the offset and length are ignored by the kernel
+		 */
+		issued_fadvise = posix_fadvise(bd->dev_fd, 0, 0, POSIX_FADV_NOREUSE) == 0;
+#endif
+	}
 
 	if (!quiet) {
 		exfat_info("Zeroing out %llu bytes: ", target_zerolen);
@@ -1285,6 +1299,24 @@ out:
 		exfat_debug("zero out written size : %llu\n", target_zerolen);
 	}
 
+#ifdef POSIX_FADV_NOREUSE
+	/*
+	 * Restore the default fmode so that the volume structures(header,
+	 * bitmap, upcase table ...) are cached as usual. The fs implementation
+	 * would appreciate it when the volume is mounted immediately
+	 * afterwards.
+	 *
+	 * The #ifdef checks against POSIX_FADV_NOREUSE, but POSIX_FADV_NORMAL
+	 * is used here. This is intentional - it wouldn't make sense for the
+	 * platform to support POSIX_FADV_NOREUSE but not POSIX_FADV_NORMAL.
+	 * ie, this shouldn't happen:
+	 *
+	 *   defined(POSIX_FADV_NOREUSE) && !defined(POSIX_FADV_NORMAL)
+	 */
+	if (issued_fadvise)
+		posix_fadvise(bd->dev_fd, 0, 0, POSIX_FADV_NORMAL);
+#endif
+
 	return ret;
 }
 
-- 
2.55.0

