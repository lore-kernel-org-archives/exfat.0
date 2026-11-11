Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363260;
	b=kLebvZlEK5Y9aA6LDyb8Bn3ybiaLu72ESCiBJrRFFA+c7ZbDbnaA3K7lRNiX37YxR3ea
	 jy5fB9LxVsyFyKXFovTIMgVCdw8ZylFBKSqCUNt1d4TkC5y8GUfto/YfmKbGabfdZEMO3
	 0ga7TAZoh1h4/FBzcGYQANNFrZAkr7V4lG5s8zrBZ8DftoDJt/iH8A8F6xV9IEMgcUkLN
	 lux2BhUCfRl6xsdmm2um5qiWK4ezAwl/mLZsF5M63e6sZzXNz7ntJVx2mnHMc8N8FrRvn
	 zl0/X/Duv8iHRm2xd6gCiSqlzMgFYMdv2xz1/MfvwOJ+ROfyTs0W5/IjXtDJW4igTMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363260;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qnuZ0ZDre3/op87TuQ6fMappUAJaxupV85cTaz0hk1Q=;
	b=YMas1hNpYXiQhF0r9NLvL6zNwsM98XGavAQJOzBwUw8aX9zzKTakoYDcJzjgoMnO4h1m
	 VHbXfTfAeRNnOYC9VDyTUCIU4JCGBDBcZPWOB4HDLMaL83flHAHhMB690GsrH4fYzCBdU
	 aQGYJyGzDgj4+JJF8yBnRHMu/IdkneHQZ9HqEZrBv0VEjxAa9ggDZuZrBAZ9+3Ovjayou
	 tQjMlfrcI6N2sMA6+t92bwOo4X5AG7jgf/Fo58ojV9O6CkbbP6ntKw45eS9ffgp6sgYWN
	 gBJK3t1GdFpbT4erftLnO1VqTS41OulgxBRuCGtE/TR5TvIhopbPnX0SH4gj3w6s1iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=isfhQgAf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F90606A32A
	for <exfat@lists.linux.dev>; Wed, 11 Nov 2026 02:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=isfhQgAf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F144F1F00A07
	for <exfat@lists.linux.dev>; Wed, 11 Nov 2026 02:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794363260;
	bh=qnuZ0ZDre3/op87TuQ6fMappUAJaxupV85cTaz0hk1Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=isfhQgAfx6JVe8nJF4WJzOQZmEwqjMsMuamhq7uvEkuiRrO8BZW1yaVD9B2adA3xj
	 mud60OCLxlZsKTVOKK1vUANVdhBfVOrOXMCOLdGQoBkAAKff0lnSRMObrBVFOyL7JZ
	 kZ1RxD5+G2IaJyTgFn9W2TMauNJFPN0SDSD6HjNRzu4c37qp0mKs7F3TKYJGFTYrQK
	 RAAjnj+R4E2guJVvHYYWJF2W58eb15i+4TFB3fxXdGqkfBS4Qqn2vTW1yAErC1Lm0F
	 sQeByjJu/1dim0VGU4WY+Wi1PLXObTuIUWW/N7lvt7YFYA9+gVNmeZPh6HBtl1Czsk
	 gl9sr6T9HO7ig==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b596569640so4356511a12.1
        for <exfat@lists.linux.dev>; Tue, 10 Nov 2026 18:14:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErENT/JgWxcknRUW2oTH4B6XLs68JEQx0nT3cBhnGY1yUDjMI8U2NmAA2QBtON9vHN7iOSyp6Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8KYNY4nIgbbSfXF999AYaGh9T/0Pupn+uOE6FI6eW9t7CL/5qH
	/n1J70MPdhIeP3epEjk4jLfkkiI1y3o2PEC78GmftJkw7e49CdShc0RhFrSNe3HsuBDZVOiSfh5
	dBWzTA4XmcUVdMCrujhfdUR19akX1eOo=
X-Received: by 2002:a05:6402:51cb:b0:6b7:853d:53aa with SMTP id
 4fb4d7f45d1cf-6b7853d5670mr64053a12.4.1794363258563; Tue, 10 Nov 2026
 18:14:18 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110065441.63590-1-dxdt@dev.snart.me>
In-Reply-To: <20261110065441.63590-1-dxdt@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 11 Nov 2026 11:14:06 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_8s6s5r49jXxULxuT-8x_onFNOsTgHboS-KDXpvFDMHA@mail.gmail.com>
X-Gm-Features: AclHuK9kqN9PikLOBvMg1wWB53-HfGZVUZIhcbtf7Lp0H5a5S4ddEudz3q2RT2w
Message-ID: <CAKYAXd_8s6s5r49jXxULxuT-8x_onFNOsTgHboS-KDXpvFDMHA@mail.gmail.com>
Subject: Re: [PATCH v0 0/7] mkfs: make mkfs.exfat deterministic to reduce CI runtime
To: David Timber <dxdt@dev.snart.me>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:55=E2=80=AFPM David Timber <dxdt@dev.snart.me> wr=
ote:
>
> This series addresses rather wasteful use of Github Actions runners.
> mkfs.exfat can now be run in a mode that doesn't involve any randomness
> (ie. deterministic) so that tests in the CI pipeline can expect volume
> images with the identical contents every time. Other randomness
> generated and tests unrelated to exfatprogs are removed. Moving forward,
> the CI pipelines should focus on testing exfatprogs code, not other
> external implementations like Linux kernel or Microsoft Windows.
>
> In action:
>
>   1. https://github.com/dxdxdt/exfatprogs/actions/runs/42765932946/attemp=
ts/1
>   2. https://github.com/dxdxdt/exfatprogs/actions/runs/42765932946
>
> On the first run, the generated images are consolidated and then tested
> on Windows runners. On the subsequent run, the cached images are
> restored and diff'd. The Windows runners are not run as the diff script
> reports that both cached and generated images are identical.
>
> ---
>
> The series also includes a patch that fixes a minor endianness confusion
> in GPT structure creation code. This is only fixed to make the tests
> work and there should be no real-life impact whatsoever(the disk
> signature in protective MBR seems to be ignored by all OSes).
>
> This series doesn't fix any serious bug and there are some memory errors
> and fsck stability issues reported by users so I wouldn't recommend
> releasing the features in a timely manner.
>
> On removing the stress tests in CI:
>
> I'm planning on building CI pipelines focusing on the Linux kernel fs
> implementation that involve snooping on the
> patches(https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.=
git/),
> running xfstests and publishing the result. I've already made a couple
> of repo mirrors using CI with other providers(just in case Github
> decides to go kaput overnight):
>
>   - https://codeberg.org/exfat-dev/exfatprogs-releases
>   - https://codeberg.org/exfat-dev/exfatprogs
>
> The tests should also the cover cases that are specific to exFAT in
> addition to xfstests. That goes without saying.
>
> The prototype will be hosted on a Github repo. However, I do strongly
> feel that the tests deserve to be run on real hardware including USB
> thumb drives, sdcards and external HDDs as they're the ones exFAT is
> usually used on.
>
>
> David Timber (7):
>   README.md: update build prerequisite packages
>   lib: make exfat_parse_guid() library function
>   mkfs: add -i/--volume-serial, --disk-guid and --part-guid options
>   mkfs: set disk signature of protective MBR to zero
>   CI: add mkfs entropy test
>   CI: generate images in deterministic manner to reduce runtime
>   CI: remove stress test
Applied them to #exfat-next.
Thanks.
