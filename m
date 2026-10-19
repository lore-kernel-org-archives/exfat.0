Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452140;
	b=jpE41qkSn7/grqFPu6WylqBuyuxunzgY5sGDJdyx8mKcoMeKmgCHZfb8/GY5xE3jFDvI
	 EJv1hv8UotNMIEWwJsAem+vWIVA7gQXbPaWdqodaagw9nj2UjWUl80ZWCowqQd5tviyni
	 dqVDB+m0SLgJ0Egn2w1QXt0UZY0kAOvc0yHr8hwKPkQ9TAlutkPMePAffHZ5b8FgBHumk
	 PMfGODrQCS/V05UuNSKbmLnoUKez2Uc9AZZj7uita3+z0yDIz99NCskVExDhy2u/g5A1N
	 dCgt+j6AIaL2DzZ3LCu/R3qPvXoT9qyYElfaDpT1GRiZ4UuybIIn2hUPWhh7ZxPIixw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452140;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qi7f1KgOCzopIIyafaAsmIgKuU3gCkVBQNjPcWy+NIg=;
	b=wcAzFSLJei10uh+dmux2CEN04Mjx6dWGhK5Tt5Ep4DHoxtoUXi7Hz16l1R7w0dSHTi+x
	 ++Jk4evPAV6ehQD8BmOOVQFAc6IfxEe9PFqbpVW6l9N2L62AILdld1AW0jleiazM/XCaJ
	 5daO7M/osgJElJvxoKC4YMCKKa3LBYudyLU1cxlAbBzWTiiXlAURbV/g/LgGHBggpza/S
	 SwH81eWFLeicYGrEeMQWd7c4u2T4mq6U5llQ7GH+okDwT5BZ4KrMgY+7mCb/+z3yz01Gi
	 DZOa1ICx7pAFo+073/a6i7jbI87rvJj902U6FT18FH+4nniHImPKeMd+6UQiLU9Vv1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jfnut9uF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358E0606A31C
	for <exfat@lists.linux.dev>; Mon, 19 Oct 2026 23:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jfnut9uF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4671F000CA
	for <exfat@lists.linux.dev>; Mon, 19 Oct 2026 23:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792452138;
	bh=qi7f1KgOCzopIIyafaAsmIgKuU3gCkVBQNjPcWy+NIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jfnut9uF/Znj3kJltSHyEUFi8bTwH5/fKeQU9V1eGYqCSYcfync+cRebGXIRcDZkr
	 v5lKqqXYV0OV0y4kWh3KJpJto4iPtKrzZksP5MGOifmaikAIeMoGJGE/LzMrTWa7wo
	 RRJIn6UdlibLr6SNljMi+/0eGaDuYmebiZxvQ1NSK+IbuZ1MgjC5mVTinZNXlKnJHQ
	 /BZYQrzr+loE9Rw4ZNhbCFtFTiRAfrlh62MLpvAeeXPa7Cy/EWEakDW5zdhRCAX2GH
	 P893cVzZ1AjgO6MWHiHroZLg6A1hpjZwvXopp/DlaqAi8kHHiEaP7eyJN3oZ1GJJj1
	 omfldTbXg/m7Q==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4086e892a4so349084366b.2
        for <exfat@lists.linux.dev>; Mon, 19 Oct 2026 16:22:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/BZtq6J4ZatrfPcenFL6rRP2IXt71f/9m7zihsCJgPBbfvywk2yrVNBckYBjJe33sEuDuMQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIy6IURNsHTs+R4Laa2HvttJ6iuqJOWvwzUFfuw2+wlU5nXUdah
	FiZeijop04lslUPrJVof+KmfXRro6CDSoGPfLIE17zXh2ZZNhO/GcXq9O2Fm1KlqpXAcYnQNjHC
	51c3eAKYPIVYDnrvV8VvDyH2nzhk7XZ0=
X-Received: by 2002:a17:907:3fa0:b0:c40:c6c8:6bd8 with SMTP id
 a640c23a62f3a-c419e838694mr681955266b.20.1792452137514; Mon, 19 Oct 2026
 16:22:17 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261015144934.1800240-1-hengyul@cs.unc.edu>
In-Reply-To: <20261015144934.1800240-1-hengyul@cs.unc.edu>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 20 Oct 2026 08:22:04 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-79BubKS44eb_JQ31QD-bY669bQhcFZCcu18JtdUFUQQ@mail.gmail.com>
X-Gm-Features: AclHuK_iGdgwhEbwfe_gFBT5kDnV0OKkRUJozhsOJjHQDS4Kl-rIULKojpqDmcc
Message-ID: <CAKYAXd-79BubKS44eb_JQ31QD-bY669bQhcFZCcu18JtdUFUQQ@mail.gmail.com>
Subject: Re: [PATCH] exfat: fix reading a directory whose FAT chain is longer
 than its size
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, chizhiling@kylinos.cn, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:49=E2=80=AFPM Hengyu Liang <hengyul@cs.unc.edu> =
wrote:
>
> Commit 08cf4a8181b4 ("exfat: use exfat_chain_advance helper") made the
> directory code walk the clusters of a directory with
> exfat_chain_advance().
>
> However, exfat_chain_advance() returns -EIO once it has walked as many
> clusters as the size of the directory says. The FAT chain of a directory
> can be longer than that, because some cameras stop updating the size,
> see commit 1e5654de0f51 ("exfat: handle wrong stream entry size in
> exfat_readdir()"). As of now, opening such a directory fails with EIO as
> soon as the chain is two clusters longer than the size. Reading a
> directory that has a FAT chain after a seek past its end fails with EIO
> too.
>
> The issue can be reproduced with an image in which the size of a
> directory with 200 files and 7 clusters is lowered to 2 clusters:
>
>     mount -o loop exfat.img /mnt
>     ls /mnt/d | wc -l
>
> Before commit 08cf4a8181b4 ("exfat: use exfat_chain_advance helper"),
> the result is:
>
>     200
>
> After that commit, ls fails with "Input/output error" and the result is:
>
>     0
>
> This patch will make exfat_chain_advance() follow the FAT to its end
> when the directory has a FAT chain, as the code did before, and keep the
> size check for a directory without one.
>
> Fixes: 08cf4a8181b4 ("exfat: use exfat_chain_advance helper")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
Applied it to #dev.
Thanks!
