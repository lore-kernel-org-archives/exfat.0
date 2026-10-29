Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793251408;
	b=SGYggEofVCdcM5gtxB6oB3UcrcXgFjJpCdaaacFEXU/3qE58g5CFPQlA768x0Rvrehkf
	 tueIWZ23WGdq5M9aB0RscpsKK+4Jc9/Dw61boi480tnRNG373W47RhZfWfGl/ASe+fz+z
	 N36cuBJwh1rs8E14C7PAzoCtkbkgkzC89UTzrJuisB5LuJxm2NgIXuQegDJ0IcLOdUiTn
	 nfSzRQULVQkfUtTSvepvbNUFgvTIKiwlvr3nU0I0auB3aGeOt/QSuCniGsVrlxUSvHRNT
	 diS1/X9AWCZ2eoBEwRxe54418K3ZviXp6KzEDq6oKsz/W8j1F8u/tnGw/3pMRXoGfhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793251408;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=jnmgUCHqtk2McngU9m9SDAY8OqdjvBwq2kcctAgjih4=;
	b=BAK1wm32M/4gr6DWwpXo7PNIHZHI34SlozKvJ2FYgQuXZsYSxpKR7eJQcmq2tZE66Kuk
	 zDKozNOgO3TRrKzIxSy3UXsZfXf761lR+Nc/hfKYj1/Ny+rE/SGKBuDoWwNh++O6HAzkN
	 ts1Wng4ett+mLvOO2kutZDvMaqCnZ6JCCYoOzsQbKHlxUernJpSpYNhW7biPRhE9qfLHq
	 Va3tyHqgQHi17kGzsb7TT7Gn2BkGgylgnKVAzxb/5XSZrbRqyXhB2YNZvB+TS9QqOhw3s
	 V93fmZWGkvVPkNibhcuEeWcT4+08MRZEo8MUVH+wWdstOtcZ0wjym4w/8ttFrEw7Inw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dHiW1aSX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7652606A327
	for <exfat@lists.linux.dev>; Thu, 29 Oct 2026 05:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dHiW1aSX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E891F01829
	for <exfat@lists.linux.dev>; Thu, 29 Oct 2026 05:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793251407;
	bh=jnmgUCHqtk2McngU9m9SDAY8OqdjvBwq2kcctAgjih4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dHiW1aSXKKl+6wHOmqcXG1ohY28rfNo2eHuEMeQuns7oS34AZSFB3e1bCQGycJxIj
	 cxhV0ajmbjUq362/SCUdHFTd/mu1V5Qul1soHy7PXDo6i1Q5C6HWCyn8kZ5EYY1lN+
	 /rPVnLfe16mRYc/dzwOvvZij+pMtOSgi298NTv1y1UljGTq+PnvAIdv+5FWG2aRtWT
	 FSBjrU5HwIhouWDpiSRSJ4l6l0uMEgIusBa4AeFpSSDCR/3C8leh5ECwSE/ODXy2H9
	 qwXygUBahmhFMJrrS2bamEFfDi9wJwgFcrjeKAJXrLi1g9Sr434lD1O6emv9RHq10p
	 oB79RLUiCfnag==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40f29667e6so216182566b.0
        for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 22:23:27 -0700 (PDT)
X-Gm-Message-State: AFq9FYKGUvQHQDv8Zm73Ry3wCNbP+2d0615htmK/kpR+mRPSgWz0cX/D
	I7UO7uLeUYcPqVTaviH1BGXvfcOleTIcCsd0E4WuGtsT3kqjLok8aUaQQuxlS2NbMR4pb7Yz6rk
	cPGLNZyeDJ2hpmcGAKuoZXgEBt86oxWY=
X-Received: by 2002:a17:906:f58c:b0:c46:a72:e0c3 with SMTP id
 a640c23a62f3a-c49bdedc95dmr377390566b.16.1793251406041; Wed, 28 Oct 2026
 22:23:26 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028120920.183005-1-dxdt@dev.snart.me> <20261028120920.183005-2-dxdt@dev.snart.me>
In-Reply-To: <20261028120920.183005-2-dxdt@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 14:23:13 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_wt-=dM9LMYX5aUtKdCTzujOtoNK3gnmR5EeGMmw-80w@mail.gmail.com>
X-Gm-Features: AclHuK92CRwUrB-U_yZg-oWwcEq-fPUAyjIJmgONNd_9foTJWB0tvEZRmU1VbH8
Message-ID: <CAKYAXd_wt-=dM9LMYX5aUtKdCTzujOtoNK3gnmR5EeGMmw-80w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Github Actions: bump to Ubuntu 26.04 runner
To: David Timber <dxdt@dev.snart.me>
Cc: exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 9:09=E2=80=AFPM David Timber <dxdt@dev.snart.me> wr=
ote:
>
> Github rolled out 26.04 for the "ubuntu-latest" runner, breaking the CI
> pipeline due to deprecated and missing packages used, one of which being
> MIPS.
>
> The gradual roll out of Ubuntu 26.04 runner means that some CI runs will
> still be run by the old 24.04 runner, causing breakage. To workaround
> this, pin the runner to "ubuntu-26.04".
>
> Replace MIPS emulation with SPARC64 for big-endian tests. Avoid using
> the -E option of sudo that's been removed in Ubuntu 26.04. Do not
> install other packages that have been removed.
>
> Link: https://github.blog/changelog/2026-09-17-ubuntu-26-generally-availa=
ble-and-latest-migration/
> Signed-off-by: David Timber <dxdt@dev.snart.me>
Applied it to #exfat-next.
Thanks!
