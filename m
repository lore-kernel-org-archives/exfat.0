Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792849441;
	b=iLC5VXaXEYMZa50CmVxOjA7SUDdkHmcYRXAsLaRmUa9DSD3twHalZKqOzCQeJ/bF62M7
	 /qEcuD/G60jgLwvKCcJhEd60TyAI+VUeUXRDppU7YRyxfWCBhklgl5Lwu9f7LK8wg79sw
	 7xrTo3HLI8wtACBkD/5YHYmP3PEy4ugC1NomA5qkLRr/bmCMG/9OBxtYJzAgI/3IJWp2Y
	 Nt6e3r0u0LyblmsuRPj14gfiJbSK6djcdqhCmUrNwcfZSSwE7EojoSqr7B0DRQCr3HjaC
	 f1b+O/xVb+1hQ1QvkBjH2kyCXF4E0XQUpwYkVtl3ueL4ypcx7eSKp7L2efo++6iiKqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792849441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bhYGBeDJEl/0/W5jzdEc+AcT7+86cl76Fh78f0hdHv4=;
	b=jf63Ues9T53gU3tKc1tQwfIi8jFySMosGNSXAdjy1T3+gL9OiWm2rdEX2cKtk9DD+sd/
	 Xj69fBYpelNkQR+1J3T0/Iu9duxrM8raDQJ03PUckUqP/0w6GvWwNvi/pp0xli5TVSSC0
	 sYQCQYOxRwVHEcO4ElC870ygH+2oBVCtvlmLOICv6tkwqBZf4NH6dzFpNbxrJSH9Jebcn
	 KLS5TdKvASUrWfnygjZ6ifGFQo41wKqY3faqflcFYNu4NKWbt7oajtkaNmsFtTwwBSPU8
	 /QNtnpcplE7Mk3W+drt8QoOwgXInei1DbAETwtz26GlRc+j8vtff1Yt5wAMvIbz6ZWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KsKgN9X7;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1973606A31A
	for <exfat@lists.linux.dev>; Sat, 24 Oct 2026 13:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1973606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KsKgN9X7
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1422876a91.0
        for <exfat@lists.linux.dev>; Sat, 24 Oct 2026 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792849440; x=1793454240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhYGBeDJEl/0/W5jzdEc+AcT7+86cl76Fh78f0hdHv4=;
        b=KsKgN9X7M+uoFaajBiRvMOJAyoDrDlsEEFfptPaOg7+Ybi52bWnjogIz628DO2YMdV
         TgZp19w7n+xl9CXADejiGupDHFUYGbsKvh2zASQbOjRUnTbLUh37iwSEcMpiRdOJJssx
         weMJxXWfpMdrl7mkLAAd95Sf73ysaIZWlcbgEcKyaDNXD4tg4p5VZyTYkFz3BKM+N/DT
         bdB950IJB4BAFGmZsw6Rr1B8bhEh8Cmf92F49+9BciXBczwmWoM7Rp6LzlRqqXvpqpZV
         9xlk0dwSsus2/NQ3qDb6ASWHPz3lQGpRVD55HyIiV5gC5HTJtVHLWlJbli5sl2RT2iOi
         SpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792849440; x=1793454240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhYGBeDJEl/0/W5jzdEc+AcT7+86cl76Fh78f0hdHv4=;
        b=y3krjLrYpN5kYmNELDV77fzVQY+6FudWvAn4fnq238IxE9D1CzwlIu5gaJVupzKXU8
         bf4x/tc7e55UmoCFA8H/bIl1Z25LiTiofzLh9epEJjqtNRjRQwYx7+8i0LtnvwbjjeS+
         IU6ylHiCcX+fN01k5UGwuhQ1vnt+JmuX2hYNeGytn/DjznBRtEc4w8Fd8TvdkOxqujdm
         SecuW5FjseEWbN5gWOBjuGrKiythlXo9IsvJ7JbydCv5kMRv6pGM+16lJmvlDotcAR1t
         0Whe0drySNuxOAwrzP6tMUq9FCFy4Y3qKVsZl1LcDelbV87txvtFYWw0BSV+et2Qfa9l
         m4Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzdf5oc2CA/eKZshhzecyMiXCON4LfNya2zo6kbKS9UwRUoKdts3/d2Kn/EJkumiTh80xXqoA==@lists.linux.dev
X-Gm-Message-State: AFq9FYK2SgAoPoXlzbMs/O99YaYt8aQgBWNGzUim/wk7cczYhV8UCswI
	AZ1Pu4VJ0c9y3gJsdm8iLrZLJfXDqjDm1NL9ayRothYLCGaNGdEja9kF
X-Gm-Gg: AYBFou2Xe94fEBdYdQ3z450H1I4KbZdXBT9kipL0yr3VgMNk3i64FghJEllRsw7MsA5
	hiq/Ifz0OqwxDeypmNG+fYkLOwjgIrjvlnWiXbKE2BgTY1KEoJwjAzou8SQ9gqXF7YaOxfDmJxm
	PXNX9vYhjLCTpx/YaIkMVQ9DB5TVMJ8PCLwWKlWDcv6k0VOCFTvapga4ib3AilAFpsSxOPe1G+k
	Q+MR+33r10yN8Sm/yQzhKhkbiaeSkhOTpJsTgZADu1nyeR5/zt7K8nudc2AkAjDobpHBw2iVxhS
	iRZlZuO/NibydN/ead/i4EClELssDaQQ1oaW40Vq/+bomVpkx15rZwm2TOyDcKRS5SWJin0T0r7
	EPh0EaFjlh7T/BWVLQ80YffkX8VmKlftuOshd5n0WvNGGDKkKz6Hqu0g4YLY3DfulUsbypUaUcD
	ONhwK+GTgCqOg+ZNDUMeUbYmduQzmSoIgXAEatwSBkdO0W1ZEmJGGq10OYi0SQReLBJ2QiGJlOG
	5SMMta+G69aAugmU/TH6C+R54T1kl1q6sMBnKq0KuKlQB/osC8X0mkp5WxgLl55anOywvMzEczb
	dPnyfeTSV9UXKss=
X-Received: by 2002:a17:90b:3dce:b0:3aa:6b5d:a02e with SMTP id 98e67ed59e1d1-3adeafd64c2mr1877559a91.54.1792849440200;
        Sat, 24 Oct 2026 06:44:00 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacc885sm3036821a91.5.2026.10.24.06.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:43:59 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	dxdt@dev.snart.me
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH] libexfat: restore the original DIV_ROUND_UP type
Date: Sat, 24 Oct 2026 21:43:42 +0800
Message-Id: <20261024134342.2243235-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Casting the first argument of DIV_ROUND_UP() to uint64_t changes the
result type for every caller and causes a signedness warning in fsck.

The malformed boot-sector arithmetic is protected by the validation
added in the same commit, so restore the original type-preserving macro.

Fixes: 69a8482f3492 ("fsck: prevent overflows from invalid clu_count and vol_length")
Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 include/libexfat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/libexfat.h b/include/libexfat.h
index 65f13dd..fbf0668 100644
--- a/include/libexfat.h
+++ b/include/libexfat.h
@@ -24,7 +24,7 @@ typedef __u32 clus_t;
 #define MIN(a, b)	((a) < (b) ? (a) : (b))
 #define MAX(a, b)	((a) > (b) ? (a) : (b))
 
-#define DIV_ROUND_UP(__i, __d)	(((uint64_t)(__i) + (__d) - 1) / (__d))
+#define DIV_ROUND_UP(__i, __d)	(((__i) + (__d) - 1) / (__d))
 
 #define EXFAT_MIN_NUM_SEC_VOL		(2048)
 #define EXFAT_MAX_NUM_SEC_VOL		((2 << 64) - 1)
-- 
2.34.1

