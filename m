Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5D23537F7
	for <exfat@lists.linux.dev>; Mon, 28 Sep 2026 05:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790572877; cv=none; b=FqHLwMogWsUzl+hez2LqIeoI+QNs5sd6P0Zu9vHyvni8AYOhlgXoAgMiR4aZJVCClIpZVwZHAB9H08CdJG9Feq2jalZQcnOuoyuYJge1xFtCdJLmbT3IM+dbJSI5JXCe3Gj2G0Dv/t3Bm7D2RHHs3D5e3sAzp07yX6ZikfCdyn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790572877; c=relaxed/simple;
	bh=ALjE8j/sEm2NpV1PKK5gDwyyOuL563JYDIDI3ocqvDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3EbUiyvzyzFpimqnMASKepp2RU9uSFsqQhtxlleSiLWyux0WurCIDLQ4s9ZzEfLGLqbi8o3UseCjx05L43SW7kIT9SwohPialDY5uJaAuUbjRc2KaprM8i4g7N2LBVVpRwm2o8dnJRUJ5kYOuHVPrM4ba93lBqqv9dYGEh9jIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTIE/HSD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTIE/HSD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3791F00893
	for <exfat@lists.linux.dev>; Mon, 28 Sep 2026 05:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790572876;
	bh=ALjE8j/sEm2NpV1PKK5gDwyyOuL563JYDIDI3ocqvDc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nTIE/HSD0C7Of0j+8OWcS/M8l1cqAEcO2NetsRee4dDKIU7rH9ONulUcTqgGxWFHw
	 2hWcHPFSQ1MyAK3Fge5Qesewfzyv4fmkVoxBUEecc77nTZc3OHq97WGSF4A28AFmF3
	 eyxELYQT9eFhP0aUPWVaXk7+IOndct6DFU2P8jbOh3xs+/R9vPv858KAayCUJ9YDw2
	 sFYYGbXSstFctGps7HsN1BMHHhL5BjcBIvYnzFp7xuzVlx0vWssE5rfVIg8qlR2+QM
	 NZJ/aKZo/j3gwtW5Zaov8KDNQupt2caeYQ7dfpeW8UUcsPpzOG+qOVe11KkC/2LkbT
	 9gFfVhJ1aa/xw==
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af7721e4aso297690466b.1
        for <exfat@lists.linux.dev>; Sun, 27 Sep 2026 22:21:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz05xPdBj7hGN6X7Qw0oKGGkz7v4qceydGL194EqNWz9euMUth+M5l9DLvT3lXX6+fnPnSEzQ==@lists.linux.dev
X-Gm-Message-State: AFuF++maHANn0fdQ4VqB0okjK5oRZJoY6/AhynXwWOB/dqd465bE33ar
	fMtwC+SGhuOj1MwjlHK4dCrV21ZAbJjQEN3+9tI+gtH1qqvdpmHJ0X+A3B68hVhmn2fZSHU53Is
	hf1v/sDFPBIQDnuLZbI1TH7KNKHDdYSk=
X-Received: by 2002:a17:907:6a16:b0:c2b:eb1:ac01 with SMTP id
 a640c23a62f3a-c2b0eb2a6e0mr494153366b.41.1790572874851; Sun, 27 Sep 2026
 22:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923123300.1626723-1-anmuxixixi@gmail.com> <20260923123300.1626723-2-anmuxixixi@gmail.com>
In-Reply-To: <20260923123300.1626723-2-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 28 Sep 2026 14:21:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9YFErC-L6-P53VUZx=AL123buhHy7yOtxJuCJf03N9QA@mail.gmail.com>
X-Gm-Features: AclHuK9kJGHJw4ejTrv9m83d8HxXuwR5IrNSw9lqwzIWFvegaPGeZPQnjCUGAnw
Message-ID: <CAKYAXd9YFErC-L6-P53VUZx=AL123buhHy7yOtxJuCJf03N9QA@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] exfat: add a Bloom filter for negative name lookups
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, chizhiling@163.com, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 9:33=E2=80=AFPM Yang Wen <anmuxixixi@gmail.com> wro=
te:
>
> Negative name lookups scan a directory from the beginning. Repeating this
> scan before creating each file makes bulk creation approach O(N^2).
>
> Add a 64 KiB per-directory Bloom filter. Build it lazily after a director=
y
> reaches 1024 on-disk entries. A definite miss skips the directory scan,
> while a possible match follows the normal lookup path so hash collisions
> cannot affect correctness.
A fixed size of 64 KiB is excessive for a directory with 1024 dentries
(roughly 340 files). Conversely, for very large directories (1M+
files), the false-positive rate approaches nearly 100%. Because
deleted names are never removed, the structure only keeps filling up,
so shouldn=E2=80=99t the size be adjusted to the directory or regenerated o=
n
saturation?

Thanks.
