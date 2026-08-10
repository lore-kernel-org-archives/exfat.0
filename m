Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C57340B373
	for <exfat@lists.linux.dev>; Mon, 10 Aug 2026 14:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373923; cv=none; b=WeLps0h8wFqBK9hWQR9zBioAAZW+sQj99ch23iVHIcpcrofNjGvdrsAkzKK9tGcJqksYcleAk5+8R6BVqE1wOAz55KA182lGta2h4iDAGFiSEvNmZ3SR02Svxh8aI/WvfOw26ih3/bXegxYfrrppe7RQtG2Ij5UX9VcAqzpMkmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373923; c=relaxed/simple;
	bh=8vZRkM5Zd46plRd0M89UI76kGJ7FPkkqdM6N8PBw7BQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OLdFRG49LFXXufXyBgNLg4tbJoBi3IXY+qwSJrCOxL38ASNJ9ZFL1Gj4WgJ77/sw8bSApXOmqcY+zVzXWAXV3QtzwmQ/BIk3aJ1hXCGlgTIVapZ75dB4A6euA6SoqzmRtug89rcyGB/0nYPKMehmbKJDk62j9vwkyBKqTRC+LW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyixMro5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyixMro5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so1508478a91.0
        for <exfat@lists.linux.dev>; Mon, 10 Aug 2026 07:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786373916; x=1786978716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F4KZjrM+Y6LAidWDowgH7FN5hzo9N3+pqXpfKu+fkD0=;
        b=jyixMro569HaD1yrMwC+LIexhTHuanQ7AXvsxFJpaRrwpIBWLuT37mAL92Dq4RC2tp
         utiy0Dj2vdJnN5dHKEOuHoKjfwq+IeDPAOU0mdN66DVw8/np6FweP22IhKdLP47E3FNF
         g0z4+5VTE7su0EHzCqtoGmaa02W18ONQxM662DsOm/2e+ka3VDEcOe1J5HDPEzK2mTTM
         OmKvG13ianTz4YrU0ywfAR2eLG2vmZQ/DmVzN7wHwDgFrPGJDMFrjZZ0/dLCn21j5JoR
         hElTkaiRcwxsx4qc8gUZh69/+QqWTHnzsXNO+YLWtJYJ31zFUza+3h4A0mtSmyMcl8Z6
         4qWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373916; x=1786978716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4KZjrM+Y6LAidWDowgH7FN5hzo9N3+pqXpfKu+fkD0=;
        b=aXqNoRuL9c7QqaVqdKRItC7EiOKTidyG7ogPu1+KT+jNLYnW/dioNkGyX/kLJI5+fu
         tFg6aMZalolcW4P6IEZSYvQngERRB9W7Y6zzy91LY8TUUgUA5qIz8OupaJTuWpbOWPvb
         yhrBSSK+uyUJW/U8CarAfajKKJWZf+Nhs9gBqe/Z/g0urnJAAXkcGY7QEDz5zQdq4/2t
         NQRb82gL1Zm+ardIT28e530RGpb+Y1hJwrL1r7mPKhFJbB3nASHwXd482NsFHZz56Uxk
         N/S1UCRYX7Nni6U2vKp/T3ZpApUdaaDM5uKEE3mjxP2LreO1dBIvDZa+AGRA6clEQkt2
         6aSw==
X-Forwarded-Encrypted: i=1; AHgh+RoHLbwIp001jwUUYARoS39YmHmMYJ2f6Uif+NUVqF7K2ztbuy4koC6LLvVw2lB/nkjGHfto6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIpV12hNMb2aG28WDwez5nayDJrCsmPQHXr8u8vXCfLFlccXQd
	f0s+rKaCP+9Y5EPsrsuvB9rFqajxZXfg760vkQy2c0QWQfnf81zAtsrA
X-Gm-Gg: AR+sD13b91ct1kB7+PcFQOiAbW16MFBvrd5hWCQZfAhc8N6qz5ihIOCPk+BZdJenDWi
	Qkg4u5rM08TWm+R6hGqAQlJ9UGTVhfwOl9x3y5riQjyZ4Vhbtng7XOZ9wQYHK8d+7rdxEKwnyE2
	iyazzl6K8p6MiD/6oFFA0fLnPiRtLfPSyQpdjwUxXCQb4pDJ7pZrMuj1YZppIDm0rUELV5jXWt1
	McCQ28AltOTy1MZ6luIFwsNiU0LtBzCDAX9ROoFEvioXT9iAZcs3X6KWhbPnUe+3yEUMMjddRrm
	2Jh98GpFxCU/JnrmMB+vkbiG4IaBvDEAdteuaeQhMv3k5tH0DKG50PbkVr1kasBOUQXXYrkxt3V
	gWc6mjauTUx3DG0XMhHLKRYwdwFpWAlqInmcMqmX/9qqE4zgclZzKQWqMSL8uiwaqvvwe0K1y7A
	m4NS2k/vB2XKDdDYzuDHlePy5lPXV8w2ygvFmZ9go3TTZGmimpsv5SmlESD283IX/zzqimh4Dsc
	g==
X-Received: by 2002:a17:90b:3d91:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-3928461bf33mr8802598a91.5.1786373915891;
        Mon, 10 Aug 2026 07:58:35 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b1405166sm6541011a91.0.2026.08.10.07.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:58:35 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH] exfat: fix truncated volume labels returned by FS_IOC_GETFSLABEL
Date: Mon, 10 Aug 2026 22:58:14 +0800
Message-Id: <20260810145814.682796-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

exfat_ioctl_get_volume_label() passes uniname.name_len to
exfat_utf16_to_nls() as the output buffer length. However, name_len is
the number of UTF-16 code units, while exfat_utf16_to_nls() expects the
buffer size in bytes.

As a result, volume labels that expand during charset conversion are
truncated.The destination buffer is FSLABEL_MAX bytes long, so pass
its actual size to the conversion helper.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 5e9b47ecc614..1c1524caaaf7 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -566,7 +566,7 @@ static int exfat_ioctl_get_volume_label(struct super_block *sb, unsigned long ar
 	if (ret < 0)
 		return ret;
 
-	ret = exfat_utf16_to_nls(sb, &uniname, label, uniname.name_len);
+	ret = exfat_utf16_to_nls(sb, &uniname, label, sizeof(label));
 	if (ret < 0)
 		return ret;
 
-- 
2.34.1

