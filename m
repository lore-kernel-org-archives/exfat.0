Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4EF3C553A
	for <exfat@lists.linux.dev>; Thu, 15 Oct 2026 14:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075785; cv=none; b=a262sVligqqqPK+3j9GbsrPsCUxy0HkYmk0oBXDja1jVV+/3xqXaArJpcqeRWqWIlFynPbNHgFabNBvtpqyhljio+WsNtdFlbk9mn97z9vwy1ZOdleL+G8gOf6QrKnrPVzREkwn7muKJPF2pjchEOdVsOCum7St+ApkgniQdjAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075785; c=relaxed/simple;
	bh=kAMB98C2TO+dg0RpAZ18Gg4F2DJAMfSCQrSzGZazOmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJnFYieY1CMLAl+uUu3lLyVD98Ih2JZPEuwQTiha+dr3XnRUm+62qTh7As+pEjwOL+JA+ku3sU0X9cwpvfLcWrmvcPJtJBTHVRYT6/B1RcS+/7n2s2AAidWJqeMj3e7MI8O79TjFrWyndxjv6SbWgkOhfvt6oWF80tm02/Z7xB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=EB2O6gTI; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="EB2O6gTI"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91b63bd2030so64650426d6.3
        for <exfat@lists.linux.dev>; Thu, 15 Oct 2026 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792075782; x=1792680582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAcdpcTpnQbvHYYEUHq7bhjUU7mNPvOKc1GObp15GFQ=;
        b=EB2O6gTIfmushcqlp9DzFBnPUfxxMp5FZh6ykztY6ecUlKdWeSFMp/Smjl4fz5fpl4
         4O2IrqEMb1ENvIaCWKy01/eWzdbXth3jA5+CnYxldSA+3SzxYAMI152N8VLigVQH5pb4
         LXymj6rQ7tmEOS6WYU43ZIZBmMHWsVrd5VFsBPYmnQAsillIOUFrkvo3RbibhPfAhCyN
         mLuJ7vnP1vE940ZfZsRtTbEJLG8zZdjiRE42Q4iCE7u1gQibIi4hzT9icWnuimNquOt2
         DR6npJnrM3HGI6zzhMvqc3ZpmDMGYwm1SSqlurFyOLj1IdZF9s63SDBwBlbjeCLbztyV
         KK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075782; x=1792680582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAcdpcTpnQbvHYYEUHq7bhjUU7mNPvOKc1GObp15GFQ=;
        b=UNfl/g9tNP40cvIeV1yE9ygfRa4GNok68gqnIwVoCoHuHw9aVFNtK/FZRhniGb2z7+
         b8kD8nEwydbrsQhA4ntPp9x+ZagNSy3x2SeHTKSO7j9qkZD8BPqQaOwbuzkT7FirqBSO
         aCV0oXcK5DuvPhUqrvWTInQOYgQleXXJ03U+tsL895tiIW3MdQy8Os964SVSWx+8qcZS
         5Mh9kH0zLnay3XNqcV5vWWtqBI6oOdJLPz9vWqyH+5Rhj1rpu9vKrpxPEpBhovaXwu/Q
         RfJnm61Zryr2QZAqsM6SSQX2dE46MD1m9d9wrVB6hcKEhEIsquPapW8bUVn4dTN+ojAi
         lKsg==
X-Forwarded-Encrypted: i=1; AKwUvBzL02HETN89ZhzBN9c+z3WXBlL7w6/Kkir0v3/Wxdb8yz4Cl6WY1TUamTZoJL5q4Piy/K1KDw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIlxzp2Bj4Y0wzOG5ja4W1wwzjbzwfJcNV7RIl4Tb2IrWU6tFnH
	D8cLlBMd7oIz8ewnSaKGRSiCWQcuK2QbUao9R6BZ0/RRFoKKwpaRVKasyRPmhOksRQ==
X-Gm-Gg: AYBFou3VKmFcApSxvELewz3XelpriBvX+YdPFeAUadObtZJAwXcNd4lxoD9wWVaP6Vl
	dqputHhfBgUTBHkS74/VmtGc31Y8zVyEr6SeH0Rt+bcTeJbT6ivlywkl/EWJPgLME2DH/1hgQ3K
	dpVDUq35Zw+VIh4M9hxkVqRVLS9ri9KotbMhOuBK4iglpZGnboloxcA9+mEWYfdQDw/0owZappV
	nZUixUGpKyF+NH3OPQj5dkvcFaoiV1KCWc6d8kRRMwlr1xBViAiZFQVPlTSOssgnsW8QgWwc9y5
	i949vpeX5MTqynKCu1mW4uCS7/s+LrIbwPcMtG9p+877pabeCPYMkP+CM3vSwfFf9p/vZskLgmK
	/c68ywiAVqJaiJ0cMBTB3DwCxAi36IXyAU+VFygBLKEWvkYhQbxKnvjA5D+JQLP6NgExaRgjKn6
	FF99vlVFDkvIkMFLFRLZy4fqrfS6VqyAr0qE29vqXaFLyj3TlSLyuhi8NSTZGZKP59nzVKENL9F
	h/4JugASBucd6LbRboy
X-Received: by 2002:a05:620a:4454:b0:939:6dea:374d with SMTP id af79cd13be357-93ebd22f201mr3559144585a.49.1792075781768;
        Thu, 15 Oct 2026 07:49:41 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50295edsm790347085a.22.2026.10.15.07.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:49:41 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	chizhiling@kylinos.cn,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] exfat: fix reading a directory whose FAT chain is longer than its size
Date: Thu, 15 Oct 2026 10:49:34 -0400
Message-ID: <20261015144934.1800240-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 08cf4a8181b4 ("exfat: use exfat_chain_advance helper") made the
directory code walk the clusters of a directory with
exfat_chain_advance().

However, exfat_chain_advance() returns -EIO once it has walked as many
clusters as the size of the directory says. The FAT chain of a directory
can be longer than that, because some cameras stop updating the size,
see commit 1e5654de0f51 ("exfat: handle wrong stream entry size in
exfat_readdir()"). As of now, opening such a directory fails with EIO as
soon as the chain is two clusters longer than the size. Reading a
directory that has a FAT chain after a seek past its end fails with EIO
too.

The issue can be reproduced with an image in which the size of a
directory with 200 files and 7 clusters is lowered to 2 clusters:

    mount -o loop exfat.img /mnt
    ls /mnt/d | wc -l

Before commit 08cf4a8181b4 ("exfat: use exfat_chain_advance helper"),
the result is:

    200

After that commit, ls fails with "Input/output error" and the result is:

    0

This patch will make exfat_chain_advance() follow the FAT to its end
when the directory has a FAT chain, as the code did before, and keep the
size check for a directory without one.

Fixes: 08cf4a8181b4 ("exfat: use exfat_chain_advance helper")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/exfat/exfat_fs.h | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index a9131fe03302..f324c4cba26a 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -623,19 +623,29 @@ static inline int exfat_chain_advance(struct super_block *sb,
 		struct exfat_chain *chain, unsigned int step)
 {
 	unsigned int clu = chain->dir;
+	unsigned int i;
 
-	if (unlikely(chain->size < step))
-		return -EIO;
+	if (chain->flags == ALLOC_NO_FAT_CHAIN) {
+		if (unlikely(chain->size < step))
+			return -EIO;
 
-	if (exfat_cluster_walk(sb, &clu, step, chain->flags))
-		return -EIO;
+		chain->size -= step;
+		chain->dir = chain->size ? clu + step : EXFAT_EOF_CLUSTER;
+		return 0;
+	}
 
-	chain->size -= step;
+	/*
+	 * Only the FAT tells where a chain of this kind ends. The size can be
+	 * smaller than the chain, see commit 1e5654de0f51 ("exfat: handle
+	 * wrong stream entry size in exfat_readdir()").
+	 */
+	for (i = 0; i < step && clu != EXFAT_EOF_CLUSTER; i++) {
+		if (exfat_get_next_cluster(sb, &clu))
+			return -EIO;
+	}
 
-	if (chain->size == 0 && chain->flags == ALLOC_NO_FAT_CHAIN)
-		chain->dir = EXFAT_EOF_CLUSTER;
-	else
-		chain->dir = clu;
+	chain->size -= min(chain->size, step);
+	chain->dir = clu;
 
 	return 0;
 }
-- 
2.53.0

