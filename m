Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42EE2E737E
	for <exfat@lists.linux.dev>; Sat,  8 Aug 2026 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786188983; cv=none; b=EySSUwBUV8W7zr07EJUcvu2Rt1pNy/o86H2T9T131l3RBO/mCmkj1lcKmLhFKj9MgwecnUfHyM3UToXWs3ilEO2v7HINevIxNCFp0h+48F44n01VZrYy83iMzQLUcOqS2PUWwj0je0AUqIFSj0+Ow4EuyCzwA5lNnnnLqFmnpU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786188983; c=relaxed/simple;
	bh=dJFjfYJEFiECDsz2HhwAyZJQ7xQkZoKEyDTcxNuhyao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PyIiJdc2EunTARCxHZNZSyhH8peGR0YzMyVPb0PwpAhdktWcQ3EY87/IoGp704j03FSWp0MJvSYkMxiA4GqqT/gCdToJnna720gXQfx58tJ76KruSqzuqwXKepY+fH3hmYtQVA3H34mHzmfTLaSWFHfuWK3owgaHwvfPpI1ytMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7FpOc0u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7FpOc0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07C81F00A3E
	for <exfat@lists.linux.dev>; Sat,  8 Aug 2026 11:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786188982;
	bh=dJFjfYJEFiECDsz2HhwAyZJQ7xQkZoKEyDTcxNuhyao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=k7FpOc0uS/OxoJWQlfN909RDoJ0UuFRd/EZjhzkmp5bFjPSBRcruIgzM6FPX916D9
	 YRllb0cLAZCYwsRvH6XOL/L59ekRCYjUJHJ19JT+DXYz+tRbTprDiqGc1gj0f6k5IQ
	 iKqTZLt8uDUJDDPsww1uT3UMnLvxRmCiEYivIsryP3iBa0zxn/aA49EBGef3pHY7Nd
	 uZFVAThGr+SfXz9fu5c96fpJ/dQjJc9jVxw7qGa+39fB/hhfo1eSXur7hTCabLRG6n
	 nab0iFrs9TkDUYdEQgOImN5taX9gV9fsd41MhFPnTfeH/F3FRx6ipRLcDo1sm2dQQu
	 2PVQ03zrCpYIQ==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c197e7e4e94so51658966b.2
        for <exfat@lists.linux.dev>; Sat, 08 Aug 2026 04:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq7iflIx8eAG2gNvY9D+CtUDOqWhUmCFVohQsWS5O412GAq98eMk5TVxXOk8HmhNPnX3SstRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4hVWX6nhkn4x7hevoHRci5191FMQJzWdNb8wEwrftXfAt3oNT
	DByz21VKmspeh2gt4MX5HCTKxRwnJGOrtCUaI6qUSlq6pfLKlpU2KIr09cUcdCoC88Av7Qeqc57
	kwtvdbpJzmhI5U/FwpkGyYfLwpWIcQL8=
X-Received: by 2002:a17:906:6a21:b0:c1c:4a80:30c4 with SMTP id
 a640c23a62f3a-c20873b2dffmr359149366b.11.1786188981275; Sat, 08 Aug 2026
 04:36:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260808065806.34730-1-dxdt@dev.snart.me>
In-Reply-To: <20260808065806.34730-1-dxdt@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 8 Aug 2026 20:36:08 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9oqN28RASa1pewk-i5FFdjX68Q1zuwgKkdUWgz_ryyew@mail.gmail.com>
X-Gm-Features: AUfX_mw33lwMWIcau42dXMAdXm9VmQV5vNRTVTwawLiZBZGxFBld1dTlsV5PXD0
Message-ID: <CAKYAXd9oqN28RASa1pewk-i5FFdjX68Q1zuwgKkdUWgz_ryyew@mail.gmail.com>
Subject: Re: [PATCH] libexfat: fix return value of exfat_check_written_data()
To: David Timber <dxdt@dev.snart.me>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, exfat@lists.linux.dev, 
	Yang Wen <anmuxixixi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 3:58=E2=80=AFPM David Timber <dxdt@dev.snart.me> wro=
te:
>
> In exfat_check_written_data(), the return value of posix_memalign() is
> only used to check if the memory allocation failed and the errno is
> returned from the function. However, according to posix_memalign(3),
> errno shouldn't be set by posix_memalign() at all.
>
> Overflows and invalid allocation lengths are already checked with
> assert() beforehand. Therefore, EINVAL should never be returned from
> posix_memalign(). So, always return -ENOMEM if allocation fails.
>
> Note that currently, this patch doesn't really fix any issue because
> with all the current Linux libc implementations(glibc and musl), errno
> is set for ENOMEM cases in posix_memalign() anyway. This patch is only
> to fix potential undefined behaviour on other POSIX platforms in the
> future.
>
> Fixes: 78e398e37ba5 ("exfatprogs: Fix and improve verify written zeros (m=
emory optimisations)")
> Signed-off-by: David Timber <dxdt@dev.snart.me>
Applied it to #exfat-next.
Thanks!
