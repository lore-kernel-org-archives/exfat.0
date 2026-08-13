Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0C3404BFF
	for <exfat@lists.linux.dev>; Thu, 13 Aug 2026 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631379; cv=none; b=HLa7xs0wZnkzefWFMtLQvzbXIaDEe6aekSn6rH50jgoBi6W78UYiOUw9rFrHrF03xvhKZHRDpWsGKIQovaVe26DfXPAaWpKkETeDSzsrnVJozhgI+6jMMHeNEy7PwLevZBBYjBB16o33NWPm9m+ICEpXT0kaSVG5xe7ZUPdKzqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631379; c=relaxed/simple;
	bh=fn/XLC+6m5VzN+X4PVvs9fE6+rYoplaOpcOerR0lGQY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cPBj8EGGJTMpDZqWr7j3v6o2ep8N9OKbjBcth0Io0vCfzZRBLTmd75ehO1pCfpsnPa8oNigj0aTComhuomqvhyMu1jybBGFMYg6Mlhzg9HOhfWZPPl8bTWD3jbKimiAcQjz3PHVB5D3ItK+53ytvL9w5i+vp7ZdoHAW1SPpBgt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOfRkgwG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOfRkgwG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ced3386430so194415ad.1
        for <exfat@lists.linux.dev>; Thu, 13 Aug 2026 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786631378; x=1787236178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=slSc0BawJ2HB7BNu1jpFArTWF6e11TBXo3Cg8xFP3/0=;
        b=BOfRkgwGkkw+NvfjphJTmvTvFNV/MWfRcH4KskxqI0f8RUPnr5JCBApzn5MCbUqtWL
         Kzf7XMf9A1P+Xbyg1XA6w2JvZEHOWMct1E+zLk9FoCgwSFN/rDKzFnXkHAk5nC43dP44
         sgMqfL60lCUCBq4KyDJUeNBIZuLaXXP6n8y2BC6gqiIhV3UE4Y+oO8ofOf7EyXcIyluT
         liMEXNvKWMP1NPODVviX/utw5nZKPN5uD5vsIKV5TjHarmxQC1pJUP1/hIxUCjkf6PLI
         j6MzeMH6AVLApTXNGg+Vd4kY1xpdOANA+0s6RKi3I1v2HsS9w+LO63LeZh5ThGFGvYFF
         A+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786631378; x=1787236178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slSc0BawJ2HB7BNu1jpFArTWF6e11TBXo3Cg8xFP3/0=;
        b=tTSyHzOb75WC5Gp02wU8UBlEDRAyDVqocTOmH9iV/+LorpaJqCUqm9svA9dm22au4/
         O+3jCi0tzHB6pRcU7Ubh1lSDbVqyhoJ8UvnG0lxq7tuIyGUrsE/m8wX7JRcB1VJSpuhQ
         AqGz3jKcx8x6BlN64A9GIRBTywicYeNGuliJTkq/qGqemg5K+kxkaP/VqDjKRn+XLcPU
         6q0pR8bj7PHWfaAOfFy3YJFTEnMgCOWyXYTp6K5ib6zdGnES/PSAOX7CJVb5YLvDwV57
         RTtD839K3xR9d1Bw3Vh038MXCpqIIQE7JeX21c5v2pmQgKviUUDzP7OUGz00QuzZkG4y
         oknA==
X-Forwarded-Encrypted: i=1; AHgh+RrxB7IokGC8VwUlPcp83VmkSqvp5wg7ErX2dbr7FiZP8d4Ql4RhZ4EQKgEsVHN80EIJvgguHg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1/RsLS+9yUb3o26+0M77Frhz94psQU6ULlLjb1W0E8ECzRkAR
	KQAvJdrZ/YwqyGF0/KlF/8Lsth/qCWz+dEvhs9IWk8qgL7uc6TbgEmzL
X-Gm-Gg: AR+sD13gQcI1HhCoSGx6Z8u5+kcAxlorP/kUwCvVmJxSFS++cYI++4d45s8emscZQ2q
	stqZ/iEHQhXdQvbw+kNTrucIV6Ji11ULGd+PaAFNp40ylv4T2AZQLlzMv1Wk/YBbdeOE8r9y2HF
	C6ZS8BVH9GVGD/SeS31pIhY4hbT2GIZrryulJ9ExuXresHKdS4+/o+dK12aaiZv6i6LaEJon2uZ
	7RWxlywlAyI3k+8Z1clXKEed2d5Y3OPsZm9IdOtautaUjNWRGTwe3KeQ5F2d4gwB8j9jyE6dg2d
	yBamxrbvaci52gb8TjzzeexCgG35TYjRZA8VZD0fyvBnNZziAqDXL+bbURdBWayTg8U0Zp+JQgZ
	lyVtcBwhf7v6KYsboA0VYd27KTJ0TYXHJqZRPkaTvJKb9whD/I49GkH8Wb5x+0P5Nwul3+LVOb/
	vfYxmEOWMIDRryPgGZchaqRR1iC9eSvM7vzQJF8g8lY6HIQOZr/otA8w5fsXk8HbCNdeyFi1AM3
	A==
X-Received: by 2002:a17:903:1b46:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d37d884e0bmr78727825ad.10.1786631377516;
        Thu, 13 Aug 2026 07:29:37 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d37c499befsm10468405ad.66.2026.08.13.07.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:29:37 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH] exfat: keep FITRIM within the requested range
Date: Thu, 13 Aug 2026 22:29:19 +0800
Message-Id: <20260813142919.812744-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

exfat_find_free_bitmap() searches the entire allocation bitmap and may
wrap around to its beginning. exfat_trim_fs() does not verify that the
returned cluster is still within the requested FITRIM range.

As a result, a partial FITRIM operation may discard free clusters outside
the user-specified range and report a trimmed length larger than the
requested length.

Validate each returned cluster against the requested range and stop the
search when it wraps around or passes the range end.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/balloc.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/fs/exfat/balloc.c b/fs/exfat/balloc.c
index e66ebf899778..c0ddd522c1e1 100644
--- a/fs/exfat/balloc.c
+++ b/fs/exfat/balloc.c
@@ -340,14 +340,27 @@ int exfat_trim_fs(struct inode *inode, struct fstrim_range *range)
 	mutex_lock(&sbi->bitmap_lock);
 
 	trim_begin = trim_end = exfat_find_free_bitmap(sb, clu_start);
-	if (trim_begin == EXFAT_EOF_CLUSTER)
+	/*
+	 * exfat_find_free_bitmap() may wrap around to the beginning of
+	 * the bitmap. Reject a cluster outside the requested range.
+	 */
+	if (trim_begin == EXFAT_EOF_CLUSTER ||
+		trim_begin < clu_start || trim_begin > clu_end)
 		goto unlock;
 
-	next_free_clu = exfat_find_free_bitmap(sb, trim_end + 1);
-	if (next_free_clu == EXFAT_EOF_CLUSTER)
-		goto unlock;
+	for (;;) {
+		if (trim_end >= clu_end)
+			break;
+
+		next_free_clu = exfat_find_free_bitmap(sb, trim_end + 1);
+		/*
+		 * Stop if the search wrapped around or moved beyond the requested
+		 * FITRIM range.
+		 */
+		if (next_free_clu == EXFAT_EOF_CLUSTER ||
+			next_free_clu <= trim_end || next_free_clu > clu_end)
+			break;
 
-	do {
 		if (next_free_clu == trim_end + 1) {
 			/* extend trim range for continuous free cluster */
 			trim_end++;
@@ -368,17 +381,11 @@ int exfat_trim_fs(struct inode *inode, struct fstrim_range *range)
 			trim_begin = trim_end = next_free_clu;
 		}
 
-		if (next_free_clu >= clu_end)
-			break;
-
 		if (fatal_signal_pending(current)) {
 			err = -ERESTARTSYS;
 			goto unlock;
 		}
-
-		next_free_clu = exfat_find_free_bitmap(sb, next_free_clu + 1);
-	} while (next_free_clu != EXFAT_EOF_CLUSTER &&
-			next_free_clu > trim_end);
+	}
 
 	/* try to trim remainder */
 	count = trim_end - trim_begin + 1;
-- 
2.34.1

