Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640317BCA
	for <exfat@lists.linux.dev>; Sun,  4 Oct 2026 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124514; cv=none; b=S6Bzci4FH2JP+f1AmdkbdKXPun64+XfM+XwatUnck55wjxUfK36zy/+UVbOTCzzqnKLSO3kbbB1Hhj7lzYXZqSaEnIRdwvEeQ4DJHbX1Ye0Q8ZbjSC8wrFcJfXlWblKC8eoG8Y3Ie2CwgorOPVgS271i954gTgulurgexooz2oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124514; c=relaxed/simple;
	bh=v5BkTTV6xIkZ4U0MNoc+KJe5KBVNrtMb6C2kSKm3W7w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AuXiYNcm1neb7CYH6ygdsF7CFvw/31vOU0F4PMJ/dD+DPg8oWUpuConaxjnypuozabfxvpH/fM7oHu83IyOFBeYGe2dfo01GZyTWIEFBeD4QLs9MtpNILF/FKPyTfIwC4g7tm2UVa8qsrs4GB4n6i8/HxF2Jd20ubJm0gMaDv7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTIurBtn; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTIurBtn"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so269181a91.0
        for <exfat@lists.linux.dev>; Sun, 04 Oct 2026 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791124512; x=1791729312; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6hn3SSDnsurWqxR/1PA4qw29vS80uvAthHs9d01q00=;
        b=QTIurBtn6hNmRiwCdBRoh+AAXotzxPoESWlijx5Vd+maJ6UYnAvEP1jtMoZi6Ir4h0
         EYqC+5pNfNM1ao2q92soktlQTe6mkQb8AaZIx8LMxKNzFKDfoEEYdQLf4vyonoHtNwaN
         tabedp4N4JFjOKYpTJyOHeNH0UqAXU02giMwp2N4GVuHx4FFSlboOyO3txFt2ihPnBN1
         bPNrWq+5J5/2+SErmbF3XZmWyRLDKza2yebfBWvVykhhxU3y6JtI6Qr+oRDbMUVFc1b6
         8hBmoqDNzZ7qhJh/RdsKAwiSgAq96b28fpGSafODAaoheO2TtotZ0SADQUtpnN6/h0Ou
         gPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124512; x=1791729312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6hn3SSDnsurWqxR/1PA4qw29vS80uvAthHs9d01q00=;
        b=xqYgcTd/IqoCsNRta83n8fL/8Tjbq1NxCkPk+cfbhtKGuFKGkR0z+gptJRQCMUxP9/
         ybHCzgCIg+thrT3DT3Sil6XeMJyfefZaIQXHt30MyXJDW/c0COjvAU4oMpVX0SzHe62l
         emw2E0+Yh283wSQmla/pgu3U3SWCAoFL8qVHO4Ppcjn+qqM6CPApA3UBt/SejQ3GrODG
         BSTPQ4k/U07uBMFpfNuESG/OKWsRt2MF8e7XI/hYTmov+7EC94Ino3uz4w+2Eh7el8EX
         exub1GqrbGsdK3MoWbTCIHUyuk7FjATm2W7RgTBJJcyEty3A+zwe3AH+KoPhRux3lHlg
         +kDQ==
X-Forwarded-Encrypted: i=1; AKwUvBw923D5Cnn/pH7+i4X/PLDoSaLUBTXTnq/jNdZxQ4BuNKsTrfKJIYvHO9q2XJSYuchogcbvXw==@lists.linux.dev
X-Gm-Message-State: AFq9FYILm7cQ1SCthQwgjWPX+24CDgVbyw0Z2Q5vjblaUlnjyDvmGvIe
	2YKl871DLhLg/cAGRe21iuoW6ZGahgDR9KeEyfWt+DXgsiYeSOpcAFRS
X-Gm-Gg: AYBFou338Dc86+P60lIrP7SisQvj2G4jfnDZrmPwz4MkklRwzXr4OZxAeb5UZqYIK/m
	acTG3rFv9IqSfNXSh4aBoC1Bh+6PmvOkQelTq3z8hQUc29yPQqyMDIuZq775Sop6r/yBc99aut+
	0p2VihOx/MBvnXNjxzuwU2IbyiPwh841HYrimCS/8rRj7OE4ITE5BP8BfSx3Bjai1tabVeQAwh0
	E2msrZlWNSxBrp7qbzrnPKgAnNMdvzo0Y08tMRj3mF8bq96goHCQffrLDZ+X+4Qs67lba5P7BWq
	+jvvqLQASvvOwp86zBIJrIPHRqUvuJ0neO/JqWltBX7wOtws0VXF3kFswZ+12nLtsQrVtidCVUI
	7Tnm+c45E3D1Nz8xE7unVEhAJOLWlzsNFUZDhWbIm6dUKcdUAd3PpuslHgpYLbCRKtUIY1nLvFQ
	pJo794ahrf4+Hv68uWQcydpoglaQClf777w5chTgrvNPAfYYJKeovZ5biP5uI6Q2ir16z9GU2n3
	JR+yl9xGRb7
X-Received: by 2002:a17:90b:134c:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a6ce97cf78mr4539968a91.13.1791124511846;
        Sun, 04 Oct 2026 07:35:11 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm7285868a91.2.2026.10.04.07.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:35:11 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	David Anderson <dvander@google.com>,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH] fsck: prevent overflows from invalid clu_count and vol_length
Date: Sun,  4 Oct 2026 22:34:52 +0800
Message-Id: <20261004143452.1902108-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Anderson <dvander@google.com>

Malformed exFAT boot-sector values can cause arithmetic overflows in
read_boot_region(), resulting in an out-of-bounds read.

Validate vol_length, clu_offset, and clu_count before using them in
cluster-count calculations. Also perform DIV_ROUND_UP arithmetic using
uint64_t to prevent intermediate overflow.

This issue is tracked as CVE-2026-45531.

Link: https://source.android.com/docs/security/bulletin/2026/2026-09-01
Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fsck/fsck.c                               |  20 ++++++++++++++++++--
 include/libexfat.h                        |   2 +-
 tests/clu_count_overflow/exfat.img.tar.xz | Bin 0 -> 3636 bytes
 3 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 tests/clu_count_overflow/exfat.img.tar.xz

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 5447154..ed8b505 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -447,8 +447,7 @@ static int read_boot_region(struct exfat_blk_dev *bd, struct pbr **pbr,
 		goto err;
 	}
 
-	if (le64_to_cpu(bs->bsx.vol_length) * EXFAT_SECTOR_SIZE(bs) >
-			bd->size) {
+	if (le64_to_cpu(bs->bsx.vol_length) > (bd->size >> bs->bsx.sect_size_bits)) {
 		if (verbose)
 			exfat_err("too large sector count: %" PRIu64 ", expected: %llu\n",
 				  le64_to_cpu(bs->bsx.vol_length),
@@ -456,6 +455,23 @@ static int read_boot_region(struct exfat_blk_dev *bd, struct pbr **pbr,
 		goto err;
 	}
 
+	/* Prevent underflow when subtracting clu_offset from vol_length */
+	if (le32_to_cpu(bs->bsx.clu_offset) >= le64_to_cpu(bs->bsx.vol_length)) {
+		if (verbose)
+			exfat_err("cluster offset %u exceeds volume length %" PRIu64 "\n",
+				  le32_to_cpu(bs->bsx.clu_offset),
+				  le64_to_cpu(bs->bsx.vol_length));
+		goto err;
+	}
+
+	/* Cap clu_count to the spec limit to prevent overflow */
+	if (le32_to_cpu(bs->bsx.clu_count) > EXFAT_MAX_NUM_CLUSTER) {
+		if (verbose)
+			exfat_err("too large cluster count: %u, max allowed: %u\n",
+				  le32_to_cpu(bs->bsx.clu_count), EXFAT_MAX_NUM_CLUSTER);
+		goto err;
+	}
+
 	clu_max_count = (le64_to_cpu(bs->bsx.vol_length) - le32_to_cpu(bs->bsx.clu_offset)) >>
 				bs->bsx.sect_per_clus_bits;
 	if (le32_to_cpu(bs->bsx.clu_count) > clu_max_count) {
diff --git a/include/libexfat.h b/include/libexfat.h
index fbf0668..65f13dd 100644
--- a/include/libexfat.h
+++ b/include/libexfat.h
@@ -24,7 +24,7 @@ typedef __u32 clus_t;
 #define MIN(a, b)	((a) < (b) ? (a) : (b))
 #define MAX(a, b)	((a) > (b) ? (a) : (b))
 
-#define DIV_ROUND_UP(__i, __d)	(((__i) + (__d) - 1) / (__d))
+#define DIV_ROUND_UP(__i, __d)	(((uint64_t)(__i) + (__d) - 1) / (__d))
 
 #define EXFAT_MIN_NUM_SEC_VOL		(2048)
 #define EXFAT_MAX_NUM_SEC_VOL		((2 << 64) - 1)
diff --git a/tests/clu_count_overflow/exfat.img.tar.xz b/tests/clu_count_overflow/exfat.img.tar.xz
new file mode 100644
index 0000000000000000000000000000000000000000..bd0f0853a32f476a3afafd483ae5ba5fc5b3b66a
GIT binary patch
literal 3636
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
O9`ZZ^{yPfo9sU7J?g+sE

literal 0
HcmV?d00001


base-commit: 2399fbe848f57aff15ef3a7db4bf852e0de0d0e9
-- 
2.34.1

