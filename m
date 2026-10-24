Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792847348;
	b=ACO62tsgyeMiffUhHKZLBFT5EBdy0ygoYTjPt60m3wzeVCs0+eqHumzz4A/4kKG0YAj+
	 koN9uiDK/KjKgzTpzYZI/aCC6dl1+br3ZbkMDVWpXJC/JtiZ4mexpqw4pxz21Buyq8drQ
	 72DBOV/sFyFIsrbrd6lasLGxVHITHMgnDpXCC+0fGL92Fy3RV344HI/zE8ln6aZT1mDRv
	 3MOCh+RDrhyoqYvT7n+p9saMiKUCAPam0Yh4tnxwgnvNiH6miWOmrihiTMW78x3mLS/O8
	 8pB5eOyiuO43z0lCjFjMlevPqqRPPvdDTR1PM5PGpGKIIg9NhXxnUulpzxUKRkyJ4tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792847348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6ohlp45sYV01H5qN75KZ9iZN5TbKbiYcGthashRIkk0=;
	b=o0z+zCtgWh/7qP0APiAmuc82TgtDR7zcpvMlZI+7GtwBoZ/gDTu49eCwfmERueF5R3ZM
	 c8BnCLzqsQKZuxB14V0rRN0H2B7hjU/A3XtgJEIISpDSKXySQDdWYfG0yfGIFIv8I2OKj
	 iyjwyGM/cB8H+x4eOCyGweP81jjOGO6mCguPJ6w18XLMQZbMZ9wbrZ5vUAsBuEctZx80B
	 dUGvw/7cYb6X99/ZVd33CMVC2fkg2LTbIzDPKMUtBe6cQ+T27H7y5tqjLPqHrAO8nt6uQ
	 C/OBpO8QzzAJX9MALeay+hDiX/X77CwJUuwFu/svoV4GSkPboUQE33/bAi7d+o9dtNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PsqR50Yy;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB843606A31A
	for <exfat@lists.linux.dev>; Sat, 24 Oct 2026 13:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB843606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PsqR50Yy
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e987b4a710so14348215ad.1
        for <exfat@lists.linux.dev>; Sat, 24 Oct 2026 06:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792847347; x=1793452147; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ohlp45sYV01H5qN75KZ9iZN5TbKbiYcGthashRIkk0=;
        b=PsqR50Yywfgv+dFFdXNMV4dP/iZti2fF5W4ZVqst1C4iWWtH2GU6bZE6uk17PGBFPh
         181LonCfRHAn+iL5R/WQyf8fq7Tazl/AM7Qzqxp3BYbZwqGHHHO3O6ed6s/PYiyFPfuJ
         b+9tq//33aKwoRO+MwVoxLa01oFcYavOglgluaqY0pxaKgwY9hH6W6C5FeSU2qSDCxwo
         ou3RFSLhT4pWg6jScoqKr1QxIQEzextMEz+G2bxEiBdoiSbgB6om/yb5B5wJ+WWvXWOQ
         q2GqMYgojA1AkeZxxnO3reDIlMYzziQ7sZ/w9k2UHUJktNiebPPzzKansdMAvQved6s7
         Oj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792847347; x=1793452147;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ohlp45sYV01H5qN75KZ9iZN5TbKbiYcGthashRIkk0=;
        b=uMVWVXSlexvJ3ej178NwWdq34/X1+aVtfd2v4+9SVo9BooguAPXktsl2Cn35q03fas
         viKf8g/IIP4uv4bD5j5JUtXTSIIhxqaUGXBxS7aqesMzIVLJyaQg12YSIctuXDi1ZUnL
         3sxFbs8u2ag84MZcWhHGJfNoM4f3anSPpH2kQ/sUzLeVsCG1+VlLIVhSzXUZVQhGjAAI
         dN2GSxY8k1EuOdJ4VqyY4fEUX8ZGU9Uy7IR4smeKj2b4MQ8WWx0dYvx3Kn3OcSADW0Hn
         QUEJIbe6T0vT5Aem7jp7gfkT+8+EyFwBynH+5HsdY11+chFReKoMj2mwTxf0X69bYDcW
         oS9A==
X-Forwarded-Encrypted: i=1; AKwUvBzd4CpUxaxL/RR2FaEaBCf32/3o3jsa91fo60mWtrg/nv0RFdyo4JpJMKJ0lnpB2vVCiNSW0w==@lists.linux.dev
X-Gm-Message-State: AFq9FYKMoHiKp5MA8NVcKoercCEEs04pHh2YQGVZSBJAk8cnr1Kz9lIA
	fPrdZ//NXyMLPnzV/aI4cvsGs+wSdj986epel7XqNsJrLJXisDhZx7yt
X-Gm-Gg: AYBFou277YxBrX6s0l6+RG+cRl/Ms6QInqunOkUixZl7EZ+omVma9PnreL381Oqqlk0
	nkVkQOT53su4s71/smVvj7TDzWlSDZEXgrV5pnW3LyjOg8O4yDLxNXGDts0SGQe/SVoiZ2ujn5Q
	LbVIz0RsWhBYs4kQzAco/uSHnAgPdbqo9WFLyTQqTswPhArK6wkyTKh/AM5HMLupBEXQQDw/6LZ
	0qUP3S90mIYjnsOnrKpxVK+BAR090PgiJGQF2z1XnFnn/xjFNBYVEK4yD7NYjqJTfC+ZFS5IveJ
	2Qaoso99Eq8FJfQBNSOP1CXxNLJ3TQVW061xXRk941NZg4KyyA8IhzykLsdVRli6RrzIH68y1EY
	lzgSv8BttCJOySCWk7sc4pIw8Umgy0msaMexfA6EGTAgFP8smRYiJTn0OaK3QxUY3s/ZpwcRkw5
	XqqAK0idopuOKeyibysDtAWZy8us891nrjxi1fw7zPQY62Go3zDBRThNNRAOYayGoTZzHUEFLz3
	ZZPiZ24cbRTkzDGm1pFcyAYmbRuUjWN5RwWCJIuxpPmpF4lHZBl7KlIG9jUQG2awyC/gQ==
X-Received: by 2002:a17:90b:52c6:b0:3ab:3767:65d1 with SMTP id 98e67ed59e1d1-3adeae86b1bmr1641827a91.22.1792847347119;
        Sat, 24 Oct 2026 06:09:07 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm427233a12.8.2026.10.24.06.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:09:06 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: dxdt@dev.snart.me
Cc: anmuxixixi@gmail.com,
	dvander@google.com,
	exfat@lists.linux.dev,
	hyc.lee@gmail.com,
	linkinjeon@kernel.org,
	yuezhang.mo@sony.com
Subject: Re: [PATCH v2 2/2] fsck: prevent overflows from invalid clu_count and vol_length
Date: Sat, 24 Oct 2026 21:08:48 +0800
Message-Id: <20261024130848.2229653-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ad9d12b8-a047-4a2a-b0eb-9f9e4be30424@dev.snart.me>
References: <ad9d12b8-a047-4a2a-b0eb-9f9e4be30424@dev.snart.me>
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On 10/8/26 14:55, Yang Wen wrote:
> [...]
> > -#define DIV_ROUND_UP(__i, __d)	(((__i) + (__d) - 1) / (__d))
> > +#define DIV_ROUND_UP(__i, __d)	(((uint64_t)(__i) + (__d) - 1) / (__d)) 
> Just want to point out that this change introduced a compiler warning:
> 
>     fsck.c:863:78: warning: comparison of integer expressions of
>     different signedness: ‘long long unsigned int’ and ‘int’
>     [-Wsign-compare]
>       863 |                 if (DIV_ROUND_UP(stream_de->stream_name_len,
>     ENTRY_NAME_MAX) !=
>           |                                                    

Thanks for pointing this out. I'll send a new revision shortly to fix
the warning.

> Well, someone(myself) does pay attention to the CI output. Integer width
> and endianness confusions were such a pain so I've set up the CI
> pipeline to catch them. I think we might as well add -Werror like Linux
> kernel at this point.

Enabling -Werror in CI sounds like a good idea. Looking forward to your
update.

Thanks.
