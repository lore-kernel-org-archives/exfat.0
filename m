Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B954A8FF2
	for <exfat@lists.linux.dev>; Wed,  2 Sep 2026 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363120; cv=none; b=KSu8p8qdcRcnnPBkvOttwoo7KgyWBV921LqokF05Dk/UFVdf3bbporZ0ry/szyl8M5giVPGJ+oLkITF1kr2Ax62RHEElUQhmUivyZUhted81WCxbhN+QH8ewPTmLZzVc/1pxpPh+ni1GPgGp+kry9txsCpCis+geQXvKJwAoD/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363120; c=relaxed/simple;
	bh=kcv+0OXwacoUKkfvTFKIQYoooOR8znqyG0iAuaWM1nU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P12VeGKBGoQ+wwQ4nbuLlE+7s+tFPPO19Goq1bXR+0FLe0sI9XiZx4RpSvw8z3mR0fxPvzumxaeMLouCXNgxxIpT9pcQgUCDfdX4AyFqXJ45dqMGFF+LkTH38wOirPqvsvPhyhA86UlXoKGUPkxeacp9f7Y0LOtjicA9Grha7N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pzBkm7ly; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pzBkm7ly"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d710632717so11693675ad.0
        for <exfat@lists.linux.dev>; Wed, 02 Sep 2026 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363117; x=1788967917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXeu7tqkF/2SrDqNx2feyBpj2N1uMheEuJGHutrigA0=;
        b=pzBkm7lyvaP7OM2q/nEbbLEl5q8Rim9+WhC8GMfk5HqlAyag1EcxJw0Wffhxqi5sX/
         3X2oUuYuauUACUHcCaJzP4HNWuvz4VKpQHxRIqI8wZJIV+uGCOBqzQWpFlSBe7ELlRQu
         9BKoHzVfWS5TvwbQXmkxFvmAJ2FaAJvpPL17XiuXOFWFqsEbniv+CesbsKoRHk+0d12F
         Cl9m32LBBPMv+bdLNt0wjWMDy6hWPcFH0YA+yJRa0Ile4QWzDy6Q8NUv5Gf5k4PIIAXT
         2YTwjEXy1FljEBZUreF6manLEq2RxpX0ziU4o4cGeeC2T3qjB/V7FTNdSOC5v5EhCzfp
         U/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363117; x=1788967917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DXeu7tqkF/2SrDqNx2feyBpj2N1uMheEuJGHutrigA0=;
        b=Yk6+C+LovItpkbvsHitg8/rCkd7fJUkG57rmGOk+HscndMXA3SxR6j/r/4OLrjxT1p
         dX5gI70jrjBOLb30p04cVjetw9gIGCCmq1jF/XrtzxsMvnk/DXbx0pFHcLNvO73eCh/c
         +uPjl0yrm51SM4aan6Nyki9xcZJT7AkseBNiYd0uCTTR+zMI8/rdMIL8Ad3PWLSX4G5q
         mEZAy0wcudj6pobs2Dtf6ZiESmm/7CwT1ic7gAz56AE0gSNjybcDqvvDapHguNjjfkRZ
         s7SRPA2uR4HH4/wVw6LtV0LUHu1BMtwQuCQpMZECjVDvZxghr0/23aqJVmedozmOzeHa
         pc5w==
X-Forwarded-Encrypted: i=1; AKwUvByQT15fm6RWDZf/USqiPtjWFhgJruFaMDuuKY0RME5WxRUbDXrQy0JJRS6EVmYS9CysEfTE4A==@lists.linux.dev
X-Gm-Message-State: AFuF++mswAYEpiTlS/plmAxGAaIooCz7X7s/iLskyQrX76NhyX6Cau1h
	aN0j2lhTtOnSwhk2B2CPq5O09DpbRM4TYHf6Pq7K0fQHgNrzMd5NK1OE
X-Gm-Gg: AR+sD12O+uUhK1himMIJZBWRCgVdfvz8IHRF2kPF4QEEncwq73iINntO6ioB9F5RMKz
	0t5FMrmQJxXMVnUAX1nKaAp6lwI5hV+vSMPBZcZJ11iyd62FVMLiiCAJ38G+VZjAwKw9tPxlz3J
	FkNkKhGaFH13mrspjCPangoJBNVspGMy0a2w/K3n5ZAtAdUnQUgpgdC0bSUtoyl0n5SRpzUGhEM
	iPsYWw21nH4XXpm3Nrqbp4SqPXRTCVGqJ742H1xiOtqoQ6Z9HvPxYsV2Aag6xV9rCdBpGkSHJr8
	aWcBbQrkM0dDNFuvQHoKXhkgkelHdbPUgBa3j6o8Q/jJLwAUcwAcq3kgIkPD/lIGttRamQ5QR8k
	9KsxfEibhm7EHV2spUhK9MvFzcapi1qtZn25OyFX38zbd4IckdZoWMPm3mTc9S/tEnFpK/iHmqs
	gJTy9T2vo4X85pMPwYe+oluYJo3cfIRgrcs7I2XyT2lb6JKsg5cpaYowokT2d5AGfS/94DzuEJk
	sSUxg5MF9mC
X-Received: by 2002:a17:902:cf0d:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2daec6fe801mr94524095ad.12.1788363117079;
        Wed, 02 Sep 2026 08:31:57 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd357e3csm15310485ad.10.2026.09.02.08.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:31:56 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org
Cc: anmuxixixi@gmail.com,
	chizhiling@163.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH v2] exfat: speed up file creation in large directories
Date: Wed,  2 Sep 2026 23:31:36 +0800
Message-Id: <20260902153136.1275991-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKYAXd9K2bjm4pyNSQn3NL4EBATxG-k3g1X-MjgaLCwWirU=dw@mail.gmail.com>
References: <CAKYAXd9K2bjm4pyNSQn3NL4EBATxG-k3g1X-MjgaLCwWirU=dw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for pointing these out.

You are right about the 255 UTF-16 code unit case.I overlooked this 
boundary condition.

The empty-entry hint can also become stale when an earlier entry is freed.
I will update the relevant rollback, unlink, rmdir, rename, and move paths
so that the next allocation can rediscover and reuse earlier holes.

I will fix both issues and reorganize the changes into a patch series in
the next revision.

Thanks again for the careful review.

