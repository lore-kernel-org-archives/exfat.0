Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E4F200110
	for <exfat@lists.linux.dev>; Tue, 28 Jul 2026 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251248; cv=none; b=ddu70iw13ZESJmCWAOCazXaEMDFie5fniVXCQOgkVpl+odVro2lkBPzoVYGdpGKe/RSWFXrKSF9oxzyF7qmpj5Xq/AFBU1dor1RTmCdPLl3MuKTrMpRL00ujjmaUG4tybS4zS4VQhmyCVhxEVTOKvI0eY35Kd/fyVspSAZP/5ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251248; c=relaxed/simple;
	bh=CIFHN6dw3R6OvBGScq4NWOqP/61RGSJfITUZz9mtH1o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JlouM9Jbo6i+o3DFVK7DTJBomUrC9wx9u7SAr/CznE8h5NLiwoz7rfSnm6ayoPj6bWOq6KD+BQoKB71wHy59WyUxmied5gvm8CZj3Na5oYEBqEleOWd5tlq50dhf8Cr+JOEyun4jeC4n1KW2GcMSdoXXVeFKOuvBT6CbhzU95Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkLSUVz+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkLSUVz+"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso37040995ad.3
        for <exfat@lists.linux.dev>; Tue, 28 Jul 2026 08:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251247; x=1785856047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UKGcGtV7SSA/ItalKXht071JWcw9BBQgAXXjMGjEABo=;
        b=CkLSUVz+Txet7OTYAR57akLN9KGpSFNp+vR3mP0SVwhh7ncPn3+t5mYb+hkS1xmjam
         aP+at9OtMz71OLQfcRh20DOXZB5Ul796oUyhG+HdL7q/FJaFEIpdHVuZegvZTeipeMxx
         SywmxXDT+Hlxy9D+MrPxsrxMJ4KweZiHIDutKVes2y7DzO+4vixlBo0lj+LgypupM2Xj
         u+diDcGcv1JxpCUpRNLbTA7w0IckdhLJE56jsXdFPEZ6v4Opde+1hprp9gCtug3TTl/w
         de9753Tabnl2W1+ngIYeRNo+8dPDCGQhGyqjROzOLuDYQpa06740RPs9htn54yNxeYfs
         3D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251247; x=1785856047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKGcGtV7SSA/ItalKXht071JWcw9BBQgAXXjMGjEABo=;
        b=PS01v2n0FU3ePEPfoZgELCNTvv146rFrDkaNxp/oWXJE0TmWQBK6M4qwMaSgwzjl3/
         eZ3aarfukJm8rRhdFqyI2ByjlrCHJEVdORT5FwMO0SI4KLX7QIT4eg6j1YI+hcYy6I5Y
         GZoYHSTDr6Y7CVSt96DQcSz4FYVUsSppeeJlUSUWkVb63AN91P4yuyrffuLdMl9y0jsj
         s2V050bz30hdmJImgXX+lCp8RAsm7GxdKtmWq86tVEckuMLdJtuxavLuLobXHg5u9hoB
         lyYw6FkP1MXQvJs07wpoR5vRt/FS6eav5XYTtX1Oiyr+gW+0/L4G2dHIwWxtK2DMh8aQ
         VIJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rofw66Grq8jFsk4Ucbmj4Yzu152aDYcWK17FoO/bkNZz6pD4IQCmLpnZ/uxIi3Lmd108dpKiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFedI6t7k3ua6BJlbp8pQd1UDYnFJziEF5zKtnCpwM9f9mdI70
	cb23h9FUS8nuBF63Gm/atKbq3lb1Vnh9OfqiGBcNXmLffA29+YmyjI6G
X-Gm-Gg: AR+sD11qZKZy98k5IeJ3Bq3/grDbduI6ddArx09pj2ymnZM8JDZipEwzt0/5AZzUi/N
	seaYb6Jg6aOvn9QbvMkGpxX4lq/Zr5FgtyHUqsGonVLWwJU3/62c7BFTHHPNxF5fhv2vY/zeovO
	T5lzOeKaA/9vJadBjUOZ1XUjbSRdtJbjf/gHCo0+M+QyRLEzhBePDyX14aAgUVwAuZOpKVRFGxV
	kGzu1Wfhk1TkqnCJ2VqHVEz0730KNv+7YBK988Nu02vz/p5A71y/FjWFly8m10YZu6Vals61v9G
	dHROtS879a6kjfdLcprMjGyQG0tloQQiD7Vd6Mq3rhfCuZOCb9qeG0BZMm6kIO9O6OqQXrHP5oP
	VosN/YwvVtQn7zHGmUeOJ26Uj/oIlroFPZsukxzOieFkiIRg6WynOGScE7r1n0Vq6A8lORR8smE
	FhpXsLkihOHzlzuPY=
X-Received: by 2002:a17:903:2f47:b0:2ca:ed57:8586 with SMTP id d9443c01a7336-2d015cfb53fmr34248735ad.23.1785251246681;
        Tue, 28 Jul 2026 08:07:26 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbde0sm53234725ad.50.2026.07.28.08.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:07:26 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH] exfat: fix overflow in cluster-to-dentry conversion
Date: Tue, 28 Jul 2026 23:07:04 +0800
Message-Id: <20260728150704.314251-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cluster-to-dentry calculation is performed as u32 and may overflow
and wrap around on large volumes. This can result in an incorrect
max_dentries value, causing readdir to stop early and omit directory
entries.

Cast nr_clusters to u64 before shifting to avoid the overflow.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 2 +-
 fs/exfat/exfat_fs.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index 4fd4ec52b8c0..ce5251ba9589 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -87,7 +87,7 @@ static int exfat_readdir(struct inode *inode, loff_t *cpos, struct exfat_dir_ent
 		exfat_bytes_to_cluster(sbi, i_size_read(inode)), ei->flags);
 
 	dentries_per_clu = sbi->dentries_per_clu;
-	max_dentries = min(MAX_EXFAT_DENTRIES,
+	max_dentries = (unsigned int)min_t(u64, MAX_EXFAT_DENTRIES,
 			exfat_cluster_to_dentries(sbi, sbi->num_clusters));
 
 	clu_offset = exfat_dentries_to_cluster(sbi, dentry);
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index 1f020b041a3d..fa30ab9d8564 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -487,10 +487,10 @@ static inline u32 exfat_dentries_to_bytes(u32 dentry)
 /*
  * helpers for cluster size to dentry size conversion.
  */
-static inline u32 exfat_cluster_to_dentries(struct exfat_sb_info *sbi,
+static inline u64 exfat_cluster_to_dentries(struct exfat_sb_info *sbi,
 		u32 nr_clusters)
 {
-	return nr_clusters << (sbi->cluster_size_bits - DENTRY_SIZE_BITS);
+	return (u64)nr_clusters << (sbi->cluster_size_bits - DENTRY_SIZE_BITS);
 }
 
 static inline u32 exfat_dentries_to_cluster(struct exfat_sb_info *sbi,
-- 
2.34.1

