Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261706;
	b=YDKNVDDFU1VjhdBSZ9bBYraA7V5OHElMeTbyKqeab/peS1a34+exJNCRC0Gh0M+jz4TW
	 i/FQKXe6xEvGKt+DhkI5muPE4IaJu7Us5LSa7WWJUFNE8YeorAhKmMw4lInKEAij1n8zO
	 M9LoABkf6KzjJP6g3q7bLXgGX+GiMMWttLt+tORYsdzcaoPjSHbQt0MIUakp4kTjfDhkz
	 L6izntccjgOkIuJseQE8fqYLPIIe7dSiyARd7nDbTwKJhfTG77/hsqPqpueG8M4BctXTy
	 rz3wcMww/4LYKBfMiiocYQKd+CH2VoBMDaIEVZ0NAs9gPjLc0ZAYl2BjT/8p2KT8HlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261706;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yYObwNH+TIVb9QisRlkuqPGqCJm2+m3teBi+a2YdMCI=;
	b=paZ+IDAyANCwINSOc2i9b5HOawx8bWBzKj5KJ0cDSH7IHzTVHtFCK39nxHZaZBu5F0rG
	 pDbmfA8IF70Z/sDGncr/bzai/+T7OTquCPqUa9x0w5rT/37o5rsZdo3smgh0tBwc2FnWr
	 f+HP1e23RM818muDOdaDfnwLjQ28tvZyowMBCW7aMsSLL1gbaUwzNW7Xffo0ZEjNruk66
	 2DR9Swk1g5aX+JzA0IjEtoC4qeA/4lMeiMZAR2O1sFNlnUGVslQDn/bJLw+4aolrYNv67
	 CY8nEiauJpcTHRdGCT7Xkj95NDotz5EBuKsvn58+t6Wj7w8z6fGtm73hi4CZjJApJPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6uS1VxD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D117A606A321
	for <exfat@lists.linux.dev>; Thu, 29 Oct 2026 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6uS1VxD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAA01F031E3
	for <exfat@lists.linux.dev>; Thu, 29 Oct 2026 08:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793261705;
	bh=yYObwNH+TIVb9QisRlkuqPGqCJm2+m3teBi+a2YdMCI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=d6uS1VxDtAE1nEpXR8bojG0FSljbs5S1DQb2K9ykGc8AzU+v3S/HEFCHUgHHZ6c0N
	 Q9fo4LWKfh43Ue3TYpDFAGnzYkFnpHRMN5ZMlJqagosj4eFu/NxGbRlDTNC4PXUT2q
	 3EXmcMscL964xIxFdPcvVituqSegsDWE8ABxCWZmJaR3+vG0YiTaHnIpTr1+0w34zq
	 Pm0ONZ6Nl7gSCcX/WZ/PDJFWyrwLS+vcjSbfxbt6+jg1ulevmrDN+QCtNWAYoQZmpS
	 hkwQQqbMpNZnzee0MEOTDm+eJaCOs009VAgQNGO1Ceb0bYYK4TJzWnYKWufV7kc7vy
	 T4qrbnEeryS2A==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c37b612635bso249292766b.3
        for <exfat@lists.linux.dev>; Thu, 29 Oct 2026 01:15:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByFIVshhF13kx52PoPPr7ZRT9bSloa9LDgSL2BpmM//jc3AeKwZMfxtWWCH9RzKCZ6M91HCiA==@lists.linux.dev
X-Gm-Message-State: AFq9FYI5JcjA8co7CuQvFMvgki9thWZ2uEnFYuKHKjrEI3GPZWQ3b3DD
	QCqgDkSvwUcfS3m2miC4sv0ekhxlwPnWi88FBR2OTYpmrAWAQ9cLOs9guZCT1hnbeRuQmPd1TZ/
	5OMji/Mum22t4SkzWY12bKmQz0aNdtl8=
X-Received: by 2002:a17:907:961a:b0:c40:f89f:d91d with SMTP id
 a640c23a62f3a-c49bdf75773mr380842666b.28.1793261704270; Thu, 29 Oct 2026
 01:15:04 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028203324.6073-1-dennylin0707@gmail.com>
In-Reply-To: <20261028203324.6073-1-dennylin0707@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 17:14:51 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_vqP+FK1NDqyqzEbkz9x1O191GNa_JOOHCSFuk7S39Gg@mail.gmail.com>
X-Gm-Features: AclHuK-1y0mLW6FP8qa5uYUDpH3JuwsT0W3xlLQLJRFbzwZl1qeYTJdQVXSzFko
Message-ID: <CAKYAXd_vqP+FK1NDqyqzEbkz9x1O191GNa_JOOHCSFuk7S39Gg@mail.gmail.com>
Subject: Re: [PATCH] exfat: fix parent link count when replacing a sibling directory
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:33=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> exfat_rename() adjusts parent link counts only when a directory moves
> between different parents. Replacing an existing empty directory in the
> same parent also removes one subdirectory, but leaves the parent's
> link count unchanged. For example, renaming one of two sibling
> directories over the other leaves the parent with four links instead
> of three.
>
> Also adjust the parent count when a target inode exists in the directory
> rename case. Keep same-parent renames without replacement and the
> existing cross-parent accounting unchanged.
>
> Fixes: 5f2aa075070c ("exfat: add inode operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Applied it to #dev.
Thanks!
