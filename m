Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190318;
	b=B6zeF/HWOrEoS3ocri95ooLBnUyuQjme/fSnT0+iUvPaqZXS3Ss3/J8aajdhbXzg51yu
	 TABORZOimPSMILEOpQfKg9nAozv8Mw8nQWeUAtuBdsOxdYQLrM0ED1r3cCiwfSaW9c4S3
	 auCASY8ynq0DDLqWflan8BLtNOkiFKkdaoJgFcXoMTS7ymq+ec33wdzFgfP8JQVIlczwz
	 utay/g9Rw7yD5nHV8QjhpyK5GEmnRCr1TSfqq6TxvzFpheNdgy7qq5NF/lvvxvfFNZJCs
	 JFBSX81ezX2TwgkmdnR0BS8S9hZfy1AFywhdWJ7LXO95gNB401Kz4bX+bDLvRxZZWQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6kM0KOtHeHKXYurgzFZtJQepqztK7z7Hv0tSSDFAXAE=;
	b=sncV10HBlRTUwy7sqHrfOU2b5G78faeGSfaLW8FkOWMbMbZExHV34VfG/JR5e31bDGIN
	 hwpCB11UfnNyT5HSu3Ov03gQ0Bc7qWM0HGMjuy57rlbRtQdXxgCla3eAPZ/7mFpVmC3Os
	 IvHXgh8GVqSKmxCQwOrYchrzZgY4qOxjjk0izO7wlhBGeACU4OqFEcWZo+h0xoq4qXK0l
	 F6Z3JuNy4fauVEGu7Owwzic5x0gL/QAgXNQ+oCIV1UNF9zkoSyDVEPOJbGNOElorOQE0e
	 K1FCWfn4ryoVdpibsg6eL2rBTXt0kmkgsB7dOMmr/zW4tADIuQE2AyfHKuoDZRPsh2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAM+q2EJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DD860A2618
	for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 15:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DD860A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAM+q2EJ
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so1125106a12.3
        for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 07:58:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795190316; cv=none;
        d=google.com; s=arc-20260327;
        b=aa5SiABU6ZvcO/MfPvTNKyWskX7nyWON4Aa3MQ1i1/WSHBOtj2qj1osyBpNEYD3hUu
         Gns7b8cwx3TzF+owWD+44R59x1ocP4QvCcIir2Hk6Ppv75DlaInX5fxLAenssSq5SY1Y
         aXqw1nn0S5BnmoTxPtmpGjFJroQI/1I3gTpLokw39UOWcV4oiOXZyRIAzYZG60dgAKBL
         t1GKDvzhkc4ah1/5vu0q4gmsC1z7qQ/G2rkGYinD5Qul5ZbqMd5CzH1bCxuFgWN5OW6Z
         ofAYGSQ/Px5RaNIKlvAwlqHBxAo9YEw7A0MbPgJvj4722ZlAwdFk/ExC2vEKCfmxDkt+
         lNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6kM0KOtHeHKXYurgzFZtJQepqztK7z7Hv0tSSDFAXAE=;
        fh=bw6/GgzierXzuUMvQai3XOZ/TzRO+RtEqMtAV1+cKbM=;
        b=Bf1Pl6MKZVCS7XG6ekGrp7e4YMzvPmpOKBlsJBSbOOTX379/D2a1j9tK71hl1U0Y6v
         6uHZ64CRYAVZ8GOxI5+nFpzj9B/eYxOG1nXOLzDpjqCwIpxvAe8XRNbR2Tdx9inCnV8i
         TDe48g6SNkirnSqkzwvNOnabqwqnGJQeUGwW9dyVX1DYVr6HXAMU17LssaNN3wV13XFq
         06ZUjVTZ+3Er3NmHO2Iuw1u+3XIu71QO8wpIYtpDcIkxLY0QFmMEph5zTVrmy942kT2u
         LCVheClGulg+mMnZ+nvi2ezrqKZ7wF50o9GoO4NAzFpJGMe2Hb0+u4li4W3huGvNLTGn
         4rIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190316; x=1795795116; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6kM0KOtHeHKXYurgzFZtJQepqztK7z7Hv0tSSDFAXAE=;
        b=iAM+q2EJQINZ732GicNePXTCx4kJ+UNVLmSvt/lGAS440FW/FGy13a266Cjzcq7JOJ
         iUR1vsg472Y69mWV4nhjvJQISYQyZYii81/3e+9YaDdvFZgvhPmIJ8sbVzbIB7whrHH6
         1Il7oCR8QMSSYWptEB3bB2NQsTUsWkIfJB6tUH93J6tI0LulyRc9HllGnn7PxAwanhbO
         e4Tzd/zLzUMJcI1md7BJV4CoOJ9xkHjSGwOTvKdP5l5PEqesEiy3XNTVyFE3Oyb3TDQ6
         wvpsFCWuPab2esimza97mFTHXWgEO3hU+SqINSytahzwXlqeaTkAZn/UAANrL6uDAS+u
         PBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190316; x=1795795116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kM0KOtHeHKXYurgzFZtJQepqztK7z7Hv0tSSDFAXAE=;
        b=szqQ1fM2eALYqRTSALWJ4GCkqgckZ/XAFM9bn+Jcumg3P72brccI/KM++bQAsOB++m
         MEnBri9yMj6KwnfewH6Yzr1y4SNolzZfPewKdxJbg8R96ULnczVu6LNjvphFQJQctJTn
         c3WMwRISYBMUtQKb3nJIX8r3YM7qAbH41ec+2NB935uW66SSV8agiDbnpYUiYBBx/UgT
         66VDsywfO9wC5rH5+GY6yLeTkcz3BtpA2GoBPsi3gmORLfO+6Gj/GThtZVAy6ut2Xj85
         ERFxFgIbYbxOViCE6NVlJSSvJgX3LZ3lQQxsajJyVdDT6+/lai0qJtUD/fnx8jQQKZWN
         y6UQ==
X-Forwarded-Encrypted: i=1; AL+hErEZg6uPqjHMobvytcWUQWi9l+NB86ClEO+23i6buvaBUzszubumoeZZYhryrdL/8j1dfRRWRQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+++m05CVaX634apC79Brvi5AGvV6Ah3EFF0dhMtl1kjmgukEMr
	Q6c2PL23gGgLyPaB+RBPRhZ1IxV6/DvgU9UsYmd8m5oRypcTz2GYxDuQkPXRrVPEuXzFJw1kYkd
	zbMh2WAn+HSA4yH72d5utDMsR4PyAor8=
X-Gm-Gg: AZFdTZc3pf4k6eFf9q/O+he2EeRbgapGoHbfEEjYkZkkv1GK+pUBfyMkum7nY32Vs+7
	r0H0ygKTp7GZGlOvguDzQx4x2AdaS1HPefz195F5ulOoBopueZwHsXGD+s7uICSDDILpx2rdeVw
	E8JeayBiGoflBdtbW3YIe9DxZbg4wOt24QPhjLfVdJR/leaIK5cZfv7CedgXVHqydxrkSk0pHQx
	ffPMuMDquiogcBtEuPeoK8qKb2OqY7fmNlItBtngUA5uJnYbCrXJHUwjgG63ninxwEyyRd7i4ZH
	hsqe5InjOkMAz976ZLvpmDd+YzN4H6vf/KIbneeRW4RlTK74+QlsobiVKsguaCF4eohGXZ1bAVH
	dZcRGPmC6+Y+m7kzt8E2BfZ4iIuh+KJrUV1pr2CgoCavID7Jdqw8CWrpbwSYUdfh5XC82OA==
X-Received: by 2002:a05:6402:52c8:b0:6b8:5aba:6c06 with SMTP id
 4fb4d7f45d1cf-6ba37d652f3mr2090064a12.14.1795190315774; Fri, 20 Nov 2026
 07:58:35 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-4-koray.fra@gmail.com>
In-Reply-To: <20261115180343.576773-4-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 16:58:24 +0100
X-Gm-Features: Aa3M54pideZA7GJITw5PojgxjktVU6GBxKullq4dSyaJ0XYgg1VLGv1zO6-iMnU
Message-ID: <CAOQ4uxjdEiuJMQxtSL8XrPYHSamtfMh+BM8kS1wj_PVME4JynQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 03/10] ntfs3: make crtime user-settable using ptime
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Since NTFS supports user-settable file creation timestamps, map
> provenance time (ptime) to NTFS file creation time (crtime) by using the
> newly introduced ptime API (in commit "vfs: add provenance time
> (ptime)").
>
> To do this, update ntfs_fileattr_[gs]et(), ntfs_getattr() and make it
> persist to disk in ni_write_inode().
>
> The timestamp is now retrievable by using file_getattr() or statx(), and
> is settable by using file_setattr() with the FS_XFLAG_PTIME flag.
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/ntfs3/file.c    | 20 ++++++++++++++++++--
>  fs/ntfs3/frecord.c |  8 +++++++-
>  2 files changed, 25 insertions(+), 3 deletions(-)

Please don't change the unmaintained ntfs3 driver.

If you want to include an ntfs patch work on the new fs/ntfs driver.

Thanks,
Amir.
