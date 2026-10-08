Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0302C4C33D6
	for <exfat@lists.linux.dev>; Thu,  8 Oct 2026 14:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471376; cv=none; b=EqT9wlws3xsF9IO06q5iw04Nr5agNeVhqKeQN80P51H83eNPy19Iy7ytikQw1N/cSq7ZVALQ1jOKG8sKHhOLZqWD2qRsz6nO5FfxT4SOrSaC6IczwiNNHg6zoG27YErlq+gdfRV18s5A0lNK1qEujZWMjjBj19ZOHsicYKQsodQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471376; c=relaxed/simple;
	bh=5Kk0u8fu21mwveRSRK6fUY91B3QlztR7tuUIxKIH3HU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WTE3pdYkgsYl9hK023g6A4rfBAIOExNfDB5xutQJ61fzOKg86WUfBackQc23FbFkj26a/JwhVy7CbE4znuyAA3yrf41/Lj+Q+hZXVHyvw/qaFeZdbaIYNex5QsqRnkJrkfBACJAnEL5yylAZqVCHoem6jCQvpulw+Nj281pzYGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCenXABs; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCenXABs"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a4c47bb6e3so1675528a91.1
        for <exfat@lists.linux.dev>; Thu, 08 Oct 2026 07:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791471359; x=1792076159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKvTbos4Dxr7+dlQi/4PaLq6hOuxE2UVKPiv4+rBtg0=;
        b=VCenXABsUiPcC5EDe9NrKrrJvc0QNolE0K+4ccF/w5WuBp9oKetkDaaDMfcwirdgr9
         Kd/+XNgzOuRIISfTEtJx9CjcB/cBFLlIJSP3swpm+mdFXd3PA3ZoiC2AfFGRBua1kySU
         AjiPTK1VJqcHOlYWt66WrSAbVljZ/NdU1vTusHnnVeQuAdYQmJlhTf+5VBwQiamcORGj
         rteXqHK3fUoaKd/ItKjDFbdp33n0O/8LVo2qJ36d8z/c/XxpoSoxO5humoUcHgjbBC/A
         pKi0D77fJjyauMYVwwCXFkhOUo4hCrFKRQ8U3uETg9S+t2CVtYOtWZfk2bLOKjNQAC+A
         rUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471359; x=1792076159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKvTbos4Dxr7+dlQi/4PaLq6hOuxE2UVKPiv4+rBtg0=;
        b=EBIfD99lhgBNchNCdx5sJCemkrg3rAmaYqkAg1bfvLUobRKkqDaUy7vnofBnuJw7kl
         ZKuw3Y3AVOw739DSvD4O3QzWWrwseuAJejhIbO0qbdAYS4xbTbRZbvUsC4fUHdsx/XaR
         5yFMxcrOhN63CTKnXyKafTt9VUqHiPPlCOT0KLx4lAFDOrj/hrn4YcrK+lOTedzlHJve
         iIkTDV/VzuP8rFuhL48kiXFWEodNnd6lxVGvNkKpqeyi8tSFmCoBV2QCMutJbrrpOORe
         IPHbXfSkG1SsvYo08uBoACmP4vlrpEtjJ14XbDEM7ZiFVMoaO8S6aWP1nPEUSdS/1TB5
         y7+w==
X-Forwarded-Encrypted: i=1; AKwUvBzd3W02Kq99uR3u6csQbR5T3k7zkHA1clB5mFtaJ0tgwucaqFLJu41tFHxlUiY7JomcXCWUcg==@lists.linux.dev
X-Gm-Message-State: AFq9FYI/glxfO5Xnbt8dsiqtikm5d2yG9qU+WL48HUQxs4RvIkh+U1Sm
	TYgR94WKkQ+uJBxvrGBRXXqMhIzGbfnpBCi8hH7t8ABRIWkPkF+yVNvN
X-Gm-Gg: AYBFou0Yq9dDmB/u0GC9v3uUOirligi2GxNhMfagvcNL7ZlaN/wXTCvlnB55Eo6REwn
	CfmjTDoXCTGDlyFHr1WR6IfUXd1c/vUm+tOzoKSkk5bRg3bKBiS+MN42FWBm1o1B/kZ4wYcuYWM
	qsz4zn/1Z0OFx8/CihP5J33j8hvC0mpJ3iBdikQw8GBHZtsXVBJlP5aUWucfil9El3r+yQ+I9Co
	cb40p46dIvSiomIKDh4yXpIYZxrxHmbTrXA7wzX8QbgOykaF9covuYBQh3MFESKPY09PT0CEUjC
	NnUbhqmTOlUbeQ1xxBJ0GABpVTjkQyQQow+yCNeqBP6G4I2PfEDP6jRUPgEVUMzcnBuYF8NbDKu
	HjyZZ3fFUFjEhC8MPo4pDk2S+5wMwVHhFFPeOk5zahVvVhB7HhipaTNcAMU8UIBGpa/gyHyYMYs
	IkHYgMxjQ0A1IQbZOHdbst49dSFu/gpKrSqfjfMEv5yV6z5BUTxc3pBmF94GsNfVjko/o8oPDS1
	6FA0bstErrI
X-Received: by 2002:a17:90b:28c6:b0:3a4:b022:1747 with SMTP id 98e67ed59e1d1-3a8a1b0bb79mr4822556a91.33.1791471358725;
        Thu, 08 Oct 2026 07:55:58 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab12e6b7f9sm1071596a91.3.2026.10.08.07.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:55:58 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	David Anderson <dvander@google.com>,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v2 2/2] fsck: prevent overflows from invalid clu_count and vol_length
Date: Thu,  8 Oct 2026 22:55:25 +0800
Message-Id: <20261008145525.1950813-3-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008145525.1950813-1-anmuxixixi@gmail.com>
References: <20261008145525.1950813-1-anmuxixixi@gmail.com>
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
Link: https://android.googlesource.com/platform/external/exfatprogs/+/5ec5ede9ba508dde0c2cc95363742f2c2f669fff
Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fsck/fsck.c                               |  20 ++++++++++++++++++--
 include/libexfat.h                        |   2 +-
 tests/clu_count_overflow/exfat.img.tar.xz | Bin 0 -> 3636 bytes
 3 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 tests/clu_count_overflow/exfat.img.tar.xz

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 3be783a..4dec837 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -461,8 +461,7 @@ static int read_boot_region(struct exfat_blk_dev *bd, struct pbr **pbr,
 		goto err;
 	}
 
-	if (le64_to_cpu(bs->bsx.vol_length) * EXFAT_SECTOR_SIZE(bs) >
-			bd->size) {
+	if (le64_to_cpu(bs->bsx.vol_length) > (bd->size >> bs->bsx.sect_size_bits)) {
 		if (verbose)
 			exfat_err("too large sector count: %" PRIu64 ", expected: %llu\n",
 				  le64_to_cpu(bs->bsx.vol_length),
@@ -470,6 +469,23 @@ static int read_boot_region(struct exfat_blk_dev *bd, struct pbr **pbr,
 		goto err;
 	}
 
+	/* Prevent underflow when subtracting clu_offset from vol_length */
+	if (le32_to_cpu(bs->bsx.clu_offset) >= le64_to_cpu(bs->bsx.vol_length)) {
+		if (verbose)
+			exfat_err("cluster offset (%u) is larger than volume length (%" PRIu64 ")\n",
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

-- 
2.38.0.windows.1
