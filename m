Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BEA3A3E78
	for <exfat@lists.linux.dev>; Tue, 28 Jul 2026 04:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785213001; cv=none; b=Z2rGbFqp9zzeDVlGMGr6pratbYKLLvYQbfDTYKiyGCe5LEehPHCOxLCwzFChfHQo4aHcRmJEvUv81grcKOrrBAOBP3TyRIyqIfwSCiWeHLBdaDiXa+Qn88iKDrbQyCnjjhMaBU9RHbCh1sQqvM026MK/gqbDBbFgiI3+6HId/Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785213001; c=relaxed/simple;
	bh=Ty/53crtZAVP4JiHRc2hkVfTG1X0f6nKt79lbpIIyVU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SlYo2eU6b9ApCAbK/py8XUYIHyMMUAclxt+pXVCIwK3JLV/neqR0pnLdbQESXriJET95jJTYl/N4+EJLYsV4blw7FJYoCMb23Gv/8RtycbOE3WIO1i8JTEBlC4cR8kRlbgvvM9WQbXo6qPaXt5SLyqigIam5C18OzEln7nGyTcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=FYT4WbBn; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="FYT4WbBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1785212983;
	bh=P3FLd0gZ4oSbDCtZOiLi2cfEZVT9J4MJIEchpy9yzog=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=FYT4WbBnVPkQRIXIpuPG0lUQWUJvFWsYR0SB/OWSOpvhS3EaXdry/efUSXWkFh+wb
	 4RycP6wrmbMN7Kvgmiir3Dly/Sf5vG4VSGVPMk0tNCnuz4yzdCIii792NP2X9cbiS/
	 WezW/fRtpWC6QtX7j6ZdOdCgaW12eiXNaQfuagbQ=
X-QQ-mid: esmtpgz11t1785212966t38c9a5c2
X-QQ-Originating-IP: 9YkLHireBl8VfaKeoMJ+k+fBfljNy2pO1p1quT6ejXc=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Jul 2026 12:29:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6979517978552794633
EX-QQ-RecipientCnt: 6
From: Yichong Chen <chenyichong@uniontech.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] exfat: free new directory cluster if zeroing fails
Date: Tue, 28 Jul 2026 12:29:23 +0800
Message-Id: <20260728042923.408237-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M5aCtjAndv5OwcANG6NBvvpwF4Z2Y5WumARVvcUk5UQF9nYedDFFifpC
	53uB9eGHkcet9gu6nh7j28GkbNBPJ4KFOJUucv2PiZ6kcF1g+0/dj57cuOu71vSrM97KF5o
	esW0SBbM/bq19od0QANQBS1KBPvKioJ6oRy403+564qtegFSU+xYmjJCkhdEdtatx6HLRf9
	QcRhrbfcJmFL5QOMxdEQQC0XOsw6UlJfCp1WdKtQuCvu/FQ//IZXdQi/cAm32Uxs0y63fgD
	j/xg+ZWz66UKDam9zGu1EMPlWgSdUnR3ty6M1eAL+j1KRtsTjSMvK+H12vbVhPrLRFw1+eh
	59NC1nqVCXKZE9Q0Tj+E22Eto4Lo8T3wotNpF2m0/2SCIjtO4JLbEIXSPkurcwPg4/6b4GD
	VuEUF81sLzrj7s0zUf3bkxHL1JxyzRSvnTM5UmIu8OjRyC8l4L38U+OMubpRVhl4HdXyyGR
	aiSU34qdDb39yvwUVMFnomR9b2Bhc60MOEic2D0Rkv8D8HCg8l+r2grD7DCFt/Gh54YeHYJ
	Ty2w+COLZkaM19A+qfMA6nz08odLvTELLhvFe8gEQ6KmSUN5Cza4xnOAHwnI68nVyPmEuRi
	Inkubknt1wRVhAQrLX8IiUQeg+bke5LWIb3m+gC+W9NzOm9WJzMszOWA+SRe4oPhHJDqgRy
	C5My0I1AAAiCAdJQkVxwm5PKbdxic1dsz82dmiHtkLT/ibYxiEl2Fi+F+/JR8ZBWxOZI0Ik
	hHQZSgtileO4BJqUl7Jc7WOj4XAe2Y/A09ofvNab3Mr8oq5pdQzw8ZWt8H2Um/FeFFAQd7t
	9p+m/tuVy3o8F/u7gQB09z0WXNwdqbUChDwrwLhqL6hs3NZUXI/H16KW2r79/UEVlm3CepJ
	HY46eKUH/XiCr/e+j3ePqI7M3g2efFGZexLebwoCALYOhjkcda9C3vRHQihyzg9NHtm0NbY
	7/CPkJgF4WbW56PxsA3NbjcibX6C1u/DVsjF5lNDqyH794081N1HEbXKpj4WbNps/Po+tvL
	mO19dXWwVXb+vKhzeq0q9SIuJtOieqpIV4l2ptmA==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

exfat_alloc_new_dir() allocates a cluster for a new directory before
zeroing it.  If exfat_zeroed_cluster() fails, the function returns the
error but leaves the allocated cluster in use.

Free the newly allocated cluster before returning the zeroing error.

Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/exfat/dir.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index 4fd4ec52b8c0..8d2ae6e33cbf 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -299,7 +299,13 @@ int exfat_alloc_new_dir(struct inode *inode, struct exfat_chain *clu)
 	if (ret)
 		return ret;
 
-	return exfat_zeroed_cluster(inode, clu->dir);
+	ret = exfat_zeroed_cluster(inode, clu->dir);
+	if (ret) {
+		exfat_free_cluster(inode, clu);
+		return ret;
+	}
+
+	return 0;
 }
 
 int exfat_calc_num_entries(struct exfat_uni_name *p_uniname)
-- 
2.51.0

