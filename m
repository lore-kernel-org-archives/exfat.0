Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219627;
	b=rRESAdoWNry7Aj9zsryiLKjSEs8iHSU1okpKm05RtLBO1emaQIBu8O1mC7vqzGKHX34Q
	 GqgzuTawo1xRGdjAgqj52lT7ww1thEhUMDmGX7Mxygx75faIyvObielsbbFTtetdWR0AD
	 L1Ds7ADdkPEXy7jrEKNKoLEyWT+ZIFPH2c/8qPQr23tupGlp3jWBbWxYO56PxKyOmTZHi
	 UIszCoNLW9pa2jMZlcw2IwbQzOzTzC0iPVzc9HnVmK/ijWXxaW884/cjaPka+q9kSiSUw
	 /yZfP0r+bq1wjvVHWx7Ql6Gzfyv15TvntIRgxFuB4xQ5MTT+uVH9W8Qfa3vXWAjWhbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lb/W93mWkP3TBmUhejtZ18o//62t4qTaZxB1+dKBVHs=;
	b=G0KbPuUE9aaOM3tEaos45dI2OzymYAzumD1RMCgCcUPc0FC7appCU+hNDpKk4tlwOqEK
	 3XaVfF+yFbf5dWLkgv9Jjqz82aquhk43i+iSKUMzCSLWgAkk+pGR1jKb63PL3QCVhj0gs
	 lAn/g5Eg0xJQK7bJH2lGG5QIBg/lLUsRHWKTRT01ywx2PR8VqOZY3CPW44069AXKzW4pU
	 aD1jQDajUXfenIgzfElHZ9q/dZ2R3quPmeAHGJaA97NAnjbJRRHkylL/VEAjO8y90VKOQ
	 MdtVtnGKZKBDzdnCogpEcDlz6OBAXr9PjPPVNaTwk1qu6oFMBW354oWsf17FIPal+xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FHuqGaPt;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC521606A31D
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 20:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC521606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FHuqGaPt
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso1071722eec.0
        for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 13:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793219626; x=1793824426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lb/W93mWkP3TBmUhejtZ18o//62t4qTaZxB1+dKBVHs=;
        b=FHuqGaPt/1vb4b5x5K64Ge0Rckf4dNPZnBCZrxfMPUY8i8KobmgzXSf541eh5xRjio
         US1V5VPGP2tke85buNRbKb/kmsW+MRvCfZmQY8j7oWhT/7jpSnhsWX2fl0bNtVNllEfw
         aQcKMjp4c8xtVpXu73bABE6PlXDh2b8CL0STfPwFXSyVYiFKauy5hbzzoha36cGg82q8
         InMA0RGUzMej3EDL9ePNLz7VgFE0x2lmL/6Xh4+qltUm5RvMt2P+WM0LqDQLnl4ENhTh
         w5bhB/glqbV9hxJbNuTONStukv8oXMa9vZiM8kM4fbRY97EV4h8UIcOgHpLaUQ7NekWt
         Kzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219626; x=1793824426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lb/W93mWkP3TBmUhejtZ18o//62t4qTaZxB1+dKBVHs=;
        b=WUQg/c/aR+RccTCwD/hUO5WDgUNPxyAL3h70TqGc5JjrzykOMS3mIRHrsdnYYViI/G
         TJwq2cIfzWMfKOm22CoVObfMggmTyUu0ar8Zt+K5Ki32y1a7+LpXbWcpF0aGPAIph1P7
         YPCHUz0/ajUOnmnvx02McETZrCvcqtRXS5RefvWhZYNDgoDm5wS+4ErMv1KBa+RQ6j3Q
         ME3u2Kla5UfYOXVdk93qCskV4nAduz+VTvpIdS7Zu/wSvi/4SSMAV29NGfG3jLkiSU3g
         vRlFgQfAI3svVrJAcKwHG6x9OL4uCYm6MaXtC1N09jEsGuGakbETl3NYjJYIT7Y3Ro0M
         Aryg==
X-Forwarded-Encrypted: i=1; AKwUvBy1QErBl4h1yfUYGr+Vj6VP0dA9q/BWXueAVUDM8IluRHNqRA3P6R4kLmR3N4Sz2ueYkiIVjQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIA1fcLdhkvbaB9mrOvPBU0AKlKYQAsD89I5WGLwgdo3c3I9rvM
	5CuksM7Hc+gAuEM1QwC9CWNvpCQIA9KG2l4fwBPrWSWJuOHTBKmumomp
X-Gm-Gg: AYBFou3+RsmmEeEWogRL1tZhgeBiJSDbn1uPuLeDYB7rDu4UkEWpNsHYeIvkK6MZ2Bq
	2MYygt/AF8mmum6BiNF1n3BqDISc69SE7s/uUeRtpY/spalFgNSJ9aXMVMS0tspaKYxL99sXWtF
	i7T5DC9fSnlRe3w59Mx0PJw+Gt08IpWSUND3822ij1LMBMTWIpyZA5M7eZuPBABRLpzYh8rQJPg
	pReKOsHHntjjeUPNHH19jnWMBkLgVhDLS1A+xGV8qt5IxPJbn/oKM27o0NvnuLAkiboPF53fDjX
	5oszH2JRBtxStqUfxmn2KNJsW1/otbm2cbIOp1yH/p07mryto+vVbQUzifcPQt4pHNf/b1zIO7l
	ZIZGvOBq7yHZ9cNU/HbAKjUURQe98kGsSsjKkQA2CfdTlT3kyfvWQ79IonDY8FHN0jfVhE5ZkYv
	6mlxDSmOkNOozNp4A4/Vl6124pSU7J8KOSTznQq5mvGplprTVl2WmUA0jnPtnzTdU/5tMo1jEG6
	+tUiB8sUR34O9tgi0r/bqz2689am4NWADl0NYdh1PVhA28QjWzdDBIl0XQ0k90T03aaQIogcVlS
	L9sezZw0GPz6IRyvDs7TKaz++M+e43C52B1HyQOf/GdgWuMwjKDxhsw+01Wxu7kMtTYBla8zjgj
	irg==
X-Received: by 2002:a05:701b:281c:b0:16e:c820:b20d with SMTP id a92af1059eb24-1a6c87bcdabmr3617245c88.5.1793219625684;
        Wed, 28 Oct 2026 13:33:45 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm14699522c88.14.2026.10.28.13.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:33:45 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linkinjeon@kernel.org
Cc: sj1557.seo@samsung.com,
	yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] exfat: fix parent link count when replacing a sibling directory
Date: Wed, 28 Oct 2026 20:33:24 +0000
Message-ID: <20261028203324.6073-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

exfat_rename() adjusts parent link counts only when a directory moves
between different parents. Replacing an existing empty directory in the
same parent also removes one subdirectory, but leaves the parent's
link count unchanged. For example, renaming one of two sibling
directories over the other leaves the parent with four links instead
of three.

Also adjust the parent count when a target inode exists in the directory
rename case. Keep same-parent renames without replacement and the
existing cross-parent accounting unchanged.

Fixes: 5f2aa075070c ("exfat: add inode operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/exfat/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 68ddb9c5504f..24110e7fde47 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -1309,7 +1309,7 @@ static int exfat_rename(const struct mnt_idmap *idmap,
 	else
 		mark_inode_dirty(old_inode);
 
-	if (S_ISDIR(old_inode->i_mode) && old_dir != new_dir) {
+	if (S_ISDIR(old_inode->i_mode) && (old_dir != new_dir || new_inode)) {
 		drop_nlink(old_dir);
 		if (!new_inode)
 			inc_nlink(new_dir);
-- 
2.43.0

