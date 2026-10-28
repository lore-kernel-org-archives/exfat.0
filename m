Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196717;
	b=z+djXIu3Znbxd8ZRTyaQMkDtirliQSEZd7ayOT31N5AC6MiMnPoA/XBJjIJg0enSi8Fn
	 V7bB5qMBDw6NnoTpKTbXbLB6wCcqf3Y9XaToOr0CPgC3/yx3N8t4q4PViqbRPslZ634SF
	 ouMemcbgwGkiVfT8G7jj89eJY0+unA86hjnexJLOjEz2VMrytK+Q4sP7DkNXBQ1wkSIVe
	 +Ecy5pZwU0UDMU0vv3T4TxJC66AH9/FaTob3MWk/hLf1NHotTNTTWuPG9hHVMOjsJlGNp
	 dJLK9IBOoGOtZAtfALswHebXsbaMZ5zNgAU+iSurYEN5JsqUKRQfQDpkI7iVI2IWFrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U8ZX8TANpmLVaMNSrcwf06iPcEkA3/rfw0CYh7jgRSE=;
	b=5iZ7FRWqeQWYeeltI/LEoj/QPHD6y6SGZQKxktN7/pXCf+Tp5YfnHlCn2LDN/rNoWmIt
	 Y/ooAtYqC64/lKDwBOD1DxYo9ncVZ6PXXCZLxAwzoziyAVCdLbuBWS13hjmR8f0NasPWu
	 Wewcrf/y9eEI6vqYP3BpMfgDqmTH/je/RDJyr9t5KrpwG5B1gh4CbVNfP0XDVcvY5iPCc
	 XsyVFLUKNw3xEio1mApmSSi2ZneNc7tFe+uOigW+um3oWBDtWbYZ9+8qTI25De13tB+mT
	 D0FGQtFRY0LAXcUfcqQ1tArWQfYdw0tz4OhwwOJmOp6/pji60bBuJbHJpBw/HvMqKjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ll0MAUqY;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6C4606A31C
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 14:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F6C4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ll0MAUqY
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9d1114320so7383965ad.3
        for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 07:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793196716; x=1793801516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8ZX8TANpmLVaMNSrcwf06iPcEkA3/rfw0CYh7jgRSE=;
        b=ll0MAUqYYBds9UxG98ev25/L1A5pmYHx+aYIXkzIctxzhFbqa0jsuA8R1APscrGyW+
         2lW2YyTxuCewDV0Kr2zdfbZcKoNdkAl2H9iH+uyk0LCK+WfQpumJLs7R88W/k46flz4x
         /SDIJMr7jd+Yp40XX7eA3tgM894S+Hs63w/ZUrjiTRPmWa6miVho3WXehdV5BtpEdmPa
         61B/aWvdfdc2Tx+Fg+6YlRTWUKzt9EOtYaeH/1HHGdd02JU+t/6Z9XkVIjLGlBkqpPJp
         KJAY3zUkue262Zt5t1PPXCSORoV8YzVEkZ8W7XEf1ysh5MW/rBgT0ITb596/k+9Iil0K
         92aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196716; x=1793801516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8ZX8TANpmLVaMNSrcwf06iPcEkA3/rfw0CYh7jgRSE=;
        b=WjK83N0sN6Bnzz4nbMT+PhmMCZ98FaE/IcxXx/bOirYL2UnD7yVWtiEQGawLoOAWh1
         9yxtn752PiCYh6JEL4TkRO/VltPBkBEFMFgXPKPdPBQ4P26yhtAK9kA7wLfwZFLEBV8Y
         fHg2Ur6IYcUSfia6VDVT1sLXx89DIwUfEHVF6YIhVhaN1I4zorb/oeltQBQYE+i0Gx70
         aNCt3F2T1/SMAT63ezWZI7QjRyfK8Xaki9JexFN1xwzbZrKL8Vudu81f78v4Q/36Crw4
         ynNVuBtCUmcLQSj66ZDURe8cpI/filV83P42qWpRgwmo91rWLCBKajoBGf99a6iUe1lO
         plvA==
X-Forwarded-Encrypted: i=1; AKwUvBygsGP0j1aY+wLLHbvIHQPfrEa4MPqlGZKBJnt0dSrFVA0pYQoHUG789+fiZGbW4pFRBvCyyg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLWTwcqrNpisUXcu3n3N0cCSNU1eNgRQkla9crHEikS2DRF89xG
	t+VJfuC2K+sZgm4fjNmvB5NpOld/mD+9bJtSZG1SZ/ym7NcM/JREZvL7
X-Gm-Gg: AYBFou2x+s7FQOgpaiahGvPIL28jq+DpW6GwFMY+nKrY6n9RpukuEIsLtI6KCwx4VNf
	sAj8EYhC+C5IL09/oJo7wDDIcSlBsDN98+3MN8/Yk9fPkJ4lA67tDNVCHB8ZiN7pE0doPo3BPsi
	XDtp4IGoQjoW91orhluXeehsehI7nsnMUwaDuiwQJTjsij0XSl+Oiipmu+YGO9LyvVm2gH+hMGR
	bpoK2osq+9xSsODp+65VyFLgMovhFX1PCWEtggnN+UrSpcVkGCs19tt2s+Edot9zDq8Zie9ixVB
	VcsYLjS4CxBHqkVmUD/uRsB1CjGDifMWACp41F9yAP5SnLTHjD0SY4LbJOyDqB26pqrIu4Ln2En
	Q5DnRK96G9kNa1J7zpvfDLhnP/v8tCIJlLwMpToIzXetTAg/WCL75jo5NAKApMkpilxUT1hEZVJ
	NQt3IH8YtINmuVcq58g2sj5A0slOZ3BnLR0e7d12sMTGn5pb8iH7rKRaJMxA3xwcxJw4b4j1riW
	kY9yczELWHFqx0gkw/3A+RWsEgHNIOA7BK8MZ77SQbNKLprVw7wU8WcJPu2I9WibIWlBfGRzYno
	BlCDdmanoixOBfXKNHV0F815QLFD3+7edo7EdE68TEg=
X-Received: by 2002:a17:903:3803:b0:2e9:568f:75bc with SMTP id d9443c01a7336-2eb00426915mr25449265ad.39.1793196715753;
        Wed, 28 Oct 2026 07:11:55 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bd60desm23059825ad.29.2026.10.28.07.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:11:55 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: dxdt@dev.snart.me
Cc: anmuxixixi@gmail.com,
	exfat@lists.linux.dev,
	hyc.lee@gmail.com,
	linkinjeon@kernel.org,
	sofine.ljm@gmail.com
Subject: [PATCH 6/7] tests: add suite0000-dump-arch for CPU arch info
Date: Wed, 28 Oct 2026 22:11:36 +0800
Message-Id: <20261028141136.2287862-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027080628.82069-6-dxdt@dev.snart.me>
References: <20261027080628.82069-6-dxdt@dev.snart.me>
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

> +tests_suite0000_dump_arch_SOURCES = tests/suite0000-dump-arch.c
> +tests_suite0000_dump_arch_LDADD = libexfat.a

The dump-arch test does not reference any symbols from libexfat.a, so
the LDADD assignment appears to be unnecessary.

I also verified this by linking suite0000-dump-arch.o without
libexfat.a. The link succeeded, the test ran successfully, and the
resulting executable was byte-identical to the executable linked with
libexfat.a.

Thanks.
