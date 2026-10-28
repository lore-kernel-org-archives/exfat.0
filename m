Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152620;
	b=5nIX17BDt3+fpWeemF0euP84yeYMfdeU0OxExPfgiwdjQ4reMoxHXhRuVDI/NMEe4kjJ
	 06M970r+KbL+uRtkEOBkogURC1uS8pY+JA9s85d77+CpkupEDXYWtpU04KeAZyf7LpHgp
	 uLRWgvW6pbU85uqVN3CI8V7vn7VV58QqKWRTJKNb0g2OWT045CYGe0nz4dmrC1ghRvbBL
	 yut77G06mWghZ0y6eo3gaiMYkgOqQnqhv3YSBSb9iQjq1QjSnqh7UmsdGlZV8eIrCGIVT
	 G03BijnOP3+vBe/9GqXZ+ahnvugOrywah5vifQTK+tOIYvKspDu57BWI6jmQQ7Hi12A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152620;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XKLRZviSEkLgOnl2rGT0d3dtRy3oKNXT+qdCHBfeiB0=;
	b=YlG4nPDkfjVwA/InLNr0juFGpukABJcD9hs0Z9JBh6QU/JfpPX1wop1n5GBG+ySKVJ/K
	 Xb6ffTheKnvy9VIzcCFKxXc3GOXOcLQ1t9OTzip8YzJPGIJY5FHXe1QIDlMojcxgaFPAh
	 pxbY8A3TYD+irN38y9CTwPTmBQiTugad6AjrRMMIlQi9L3RgT/PK63B2BPxB4baABhXAt
	 l22mbrRAXAfyYd/KT+JAJnx+pzU47OOuwr7esMJY6tmgLLqqzy7eEVY5d+OpEMrBwdfr+
	 wmrHss+vOBgwfNyyiw++voizQg8z356IqTui52izGnCktX88Wm+R28N/f4SSjCFlbpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6YhXxns;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D51606A31A
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 01:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U6YhXxns
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3F31F01825
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 01:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793152620;
	bh=XKLRZviSEkLgOnl2rGT0d3dtRy3oKNXT+qdCHBfeiB0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=U6YhXxnsiUuaJzgh0HmWWX18b7DckX8ZUq/EfKzr8//OtFanTOD5TbMASLPkAp3UR
	 UM6kCix/thWSQ7lSNK4y9uJc+hHl1FkSgcoYvCdimRxjXoMCjnNBPq1uSiDqcsxFbE
	 qMCAgaPkQx+pOvCqTEuv2yvFoJ5SdmTDQRHqrKAyVEOhcPuivpbeDyXGuOCSLfqIIK
	 S2cBG68yeaJ7dyKKiNv2KT7VuT9oJayY4OC/N9xEnP0RaLwcXAbkCFS/yO8IB4v7TE
	 SCJ//VvTFQFW4Loy/EHK39/kkToVc2CVNKX1W/Mi9RMAZx9njEdpEU29I/Z6zrsq5p
	 LY6Bpg0/kyUiA==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c468bd799ecso54334766b.1
        for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 18:57:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzwt76doa7eC1DKL7TZo15AfrBW21knwsDyWClPftPG6OlinH5eNuOKQrK4y1t4P6hPHuDnFA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJyVywFLiqt8/i/viFouG8RAm/oreKr83UpZHzsR3nXiMNM0Two
	6Bx1/2GyoiFkr7r2BXssgV7l2nJBTB6UNM2udNbfjARK8XKk2vNwBywllyVNtiW18r+mro6/WaP
	tc87gyQYAIC7RvB01sRYzsPb/ZWScckQ=
X-Received: by 2002:a17:907:6e93:b0:c46:7fa4:922b with SMTP id
 a640c23a62f3a-c49be031179mr71705266b.33.1793152618828; Tue, 27 Oct 2026
 18:56:58 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027080628.82069-1-dxdt@dev.snart.me>
In-Reply-To: <20261027080628.82069-1-dxdt@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 28 Oct 2026 10:56:46 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8Ghe+DPz_B008UxkyoLaZ=y9uKyhf_2X8rDn+mhbQH7A@mail.gmail.com>
X-Gm-Features: AclHuK9gLlDH-hXV--XIkXewEXJuS_BctcvY-LhBhjAA8te7DZByw7FfosTnoC0
Message-ID: <CAKYAXd8Ghe+DPz_B008UxkyoLaZ=y9uKyhf_2X8rDn+mhbQH7A@mail.gmail.com>
Subject: Re: [PATCH 1/7] libexfat, fsck: exit() upon I/O error during fsck
To: David Timber <dxdt@dev.snart.me>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, exfat@lists.linux.dev, 
	Yang Wen <anmuxixixi@gmail.com>, "sofine . ljm" <sofine.ljm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:06=E2=80=AFPM David Timber <dxdt@dev.snart.me> wr=
ote:
>
> Add I/O error handling callback to give up fsck process when an I/O
> error occurs. There are several places where I/O errors are either
> improperly treated as filesystem inconsistency errors or silently
> ignored.
>
> As most of the codebase wasn't built with EIO in mind, rather than
> adding EIO checks where I/O syscalls are involved, intercepting errors
> in syscall wrappers through a callback to prevent further operation of
> fsck seems to be a reasonable fix with low risk of regression.
>
> Reported-by: sofine.ljm <sofine.ljm@gmail.com>
> Closes: https://github.com/exfatprogs/exfatprogs/pull/394
> Signed-off-by: David Timber <dxdt@dev.snart.me>
Applied your seven patches to #exfat-next.
Thanks!
