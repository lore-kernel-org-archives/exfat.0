Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C416A2E03E4
	for <exfat@lists.linux.dev>; Fri, 28 Aug 2026 04:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787890794; cv=none; b=S4oASagU7bE9vsjOxgzsQKEpKjsohksNMc3IWLySIuo4c8fxL5D5KA2dPdacMdrS6yiwNnmmCrhGlhOztg/RnFmutpd8Auck4L8+0ntRZCQOyPj1VVgcutfXVZ//r2bKUegG6NV+9DRYljf6GomleLUCAFz36BGIPLy/WarSVQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787890794; c=relaxed/simple;
	bh=lxP+s4rqUoPUvqW4ip2386AoVGegem+9+aFx5bAk6ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/P5uhwba+gtNTvEEX4lUFHqQ8JQpBWYggJh96HZySqrZUMnjESjZ31rrvXkiC2AmRcdBp9/0BlqVwr3nNhOMPPuEBIpThL9cIc878iMilmFAFuHQ+VkTiZ0aNDeYTaJgK+QY0NXTcXY12ws5KjTp1EdgFkzHroF3pJiH264118=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkTgQhVX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkTgQhVX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB261F00A3E
	for <exfat@lists.linux.dev>; Fri, 28 Aug 2026 04:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787890793;
	bh=siezxpFG02Qv+beR/suqD5YqBOWHwAMc/FAp8JYkyFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MkTgQhVXO4EvgEAcMAaBSBFpA3+/0oBDaZlBk/37tfdeDu88o00oSCoozjHY3AiRU
	 sVsIv/ADpMXhelb6OgHGecyTxxg+6fiJgICMZXvJJrMUR8V8IW+2+sbJ84tQfCtwkz
	 0KXfe5WHMwqFvakwmG0Q/AMHd4uoWW3erLpCi+0TlHUYlw2tbQQ/0rliLES+ThxFCV
	 /PsFdJIXWUuHHVoIVHm3Wi+e2gjCWFZ96E5zsgp8e4ulgsw4xJynrLZBnnVsIvAJZc
	 Zrw+mEYrSXXk15HGjCLVWAH8Xlpebxnz2C0IFaqLQNLAIPJawqjlirxCL3YY67CeS+
	 2OmVNlBCSgdVA==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a5ded53570so756265a12.3
        for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 21:19:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp7OxpehFZ4Zv3E8trfBQlkeHyWfgum9cQl6BbhaX75TpTXod5X6MqhNJGxpLwDexNdD2UrAg==@lists.linux.dev
X-Gm-Message-State: AFuF++nQuroXq/CjfNkwsgFAF6BYSrBfAfoqmqXsPEwxrdNla4gIsEcU
	K+DPpoTp+Jc4oNvq3aJF8PwC8CUBOf2ClKh+TR0Sj+RUMRGrhOsxxK3xDJZimR2uR2hRIY5xr0i
	rOzWvqyZemYlXAg52BnSR0gtICMu6xjo=
X-Received: by 2002:a05:6402:a2cd:10b0:6a6:fe1:ab10 with SMTP id
 4fb4d7f45d1cf-6a60fe1ae0dmr1048936a12.6.1787890792057; Thu, 27 Aug 2026
 21:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820150508.736275-1-anmuxixixi@gmail.com>
In-Reply-To: <20260820150508.736275-1-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 28 Aug 2026 13:19:38 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9cKQ_Z9ZXRuE8qgA9qHMxO-__pt5J9xxDTyJ-E8PkR-w@mail.gmail.com>
X-Gm-Features: AcwNN1XjUEY68T31N787TZ1euCFmCyWXtk0VJEPwyEWCu9WEqrrv1s6mhfjdGzk
Message-ID: <CAKYAXd9cKQ_Z9ZXRuE8qgA9qHMxO-__pt5J9xxDTyJ-E8PkR-w@mail.gmail.com>
Subject: Re: [PATCH] exfat: validate vendor allocation directory entries
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yang,

> @@ -678,11 +678,53 @@ enum exfat_validate_dentry_mode {
>         ES_MODE_GET_BENIGN_SEC_ENTRY,
>  };
>
> -static bool exfat_validate_entry(unsigned int type,
> -               enum exfat_validate_dentry_mode *mode)
> +static bool exfat_validate_vendor_alloc(struct super_block *sb,
> +               struct exfat_dentry *ep)
> +{
> +       struct exfat_sb_info *sbi =3D EXFAT_SB(sb);
> +       u8 flags =3D ep->dentry.vendor_alloc.flags;
> +       u32 start_clu =3D le32_to_cpu(ep->dentry.vendor_alloc.start_clu);
> +       u64 size =3D le64_to_cpu(ep->dentry.vendor_alloc.size);
> +       u64 max_size =3D EXFAT_CLU_TO_B((u64)EXFAT_DATA_CLUSTER_COUNT(sbi=
), sbi);
Please check the following build error:

fs/exfat/dir.c: In function =E2=80=98exfat_validate_vendor_alloc=E2=80=99:
fs/exfat/dir.c:688:24: error: implicit declaration of function
=E2=80=98EXFAT_CLU_TO_B=E2=80=99; did you mean =E2=80=98EXFAT_ACLTAB=E2=80=
=99?
[-Werror=3Dimplicit-function-declaration]
  688 |         u64 max_size =3D
EXFAT_CLU_TO_B((u64)EXFAT_DATA_CLUSTER_COUNT(sbi), sbi);

Thanks.
