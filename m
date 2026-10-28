Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179927;
	b=CiHxt5ZGL8yt3wkKvfr/+6+cOvTx+TnDsCEhaX3oe2oqBCtATR7HoVeZmZtPO4+tn5xN
	 4yzRLgvyjsgPV5swEyNlQHjWvofAk8RakRWDhg9E2TOfEFPmB/REDZdG1uhGV1DsMhoAY
	 AWgc1BfqZUjmvjY7cWbhBwc9VfhHw1POmv/LEG6nBrysn3DqHzHEKy/BYa9o5wMqtkAwc
	 vlXP5uSMv1ZTjfKWkXcSWhVWbrxMR/YdNbAkASwFupzktdYXWL5lsafNP1fDO8nFy77l5
	 NaNwXIUyCAmI449eqogOC5TqkM86I/ZjWDq3NibwPetOHAqNu1JrFP3RPOvovx5s/tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179927;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=EPXELM+WGosV9cxYsMmRBpm1IEdmYWKBDzAjdDIcmCY=;
	b=ie4YxDgddGIGR9+tsuLBcIAdYlucCyqy/GLLTJBCuKhAykYmO6qXNrecq4F9Tzk/w7Pv
	 9/sRliSjZu/C30ZiK0mPQ0/tEWNJinWa5iFSZg+CNh/BU87Qm0xdVxZNT+Az7yakfuwbw
	 4qCZE/GX5upFDWyWe8XKiW8r78mvDPA/pvcyKsFCmUx/QHlFqKKbiplUlL/8ytSagmdQp
	 9+sTUcfrk5QHO1Vu4K84wkhoOA03rsLoMnBnu8xlLEkFjkjgpSm84xsfsXI0sRywHB4eq
	 KfvlPtyBqZg0UjB3SR1/lLEVKn72uaajtAgcqL71jJ87uOEksLHlCOICh9WiUIz/TLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UbRVvuZM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D7A606A31A
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UbRVvuZM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CEB1F01825
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793179926;
	bh=EPXELM+WGosV9cxYsMmRBpm1IEdmYWKBDzAjdDIcmCY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UbRVvuZMIbvAqY/bs4XFeRUMx9GKCPdfADV4xazFzD7ImIVpPOlOdmqyRCHDogkHJ
	 K+1o9HqMrmpXCEhRdbxmOX9KImxTO0k9qu+HbbT85sM3j0t6YsUW0rnD3YpkhRQrPY
	 sNdqyClq68KCNFNuPCxa7SzzATZi05YgHEdVIQwy81hwX0bxTVEm7aiy32xyiqBy6Y
	 TKNtEOLopShp7EuPaXXBcVmT4mMeucWWAUj6ojq5vF003HnHvXUgco8AUgZLYguqiZ
	 ByThxnW3kVlxYRo9s8/c599LomppVTR0fn7V+6QhumVssXer8Ln+pGbvHMv8llLtna
	 TOspo8sn25Kvg==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c498fa2f365so89141866b.3
        for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 02:32:06 -0700 (PDT)
X-Gm-Message-State: AFq9FYIa6Y692V3iieSvAz7PWx1kAKV67t0RB9L3pJ+yqnwxIohyvFRQ
	mdAKWL5X48YC4aNsjUwW6UWxvaDVKO3EZJ6GReWn20Td69+G/sWoH8f4+AGuf/RGn3BCnSfEeNC
	CXUHe5hIW3wC49/cf5BzSmjs04fL9Fy8=
X-Received: by 2002:a17:907:940f:b0:c42:4750:8d49 with SMTP id
 a640c23a62f3a-c49bdfb96camr143519166b.25.1793179925555; Wed, 28 Oct 2026
 02:32:05 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027080628.82069-1-dxdt@dev.snart.me> <20261027080628.82069-7-dxdt@dev.snart.me>
 <5c557ada-8b5b-4e63-bcfe-35a313c1e25c@dev.snart.me>
In-Reply-To: <5c557ada-8b5b-4e63-bcfe-35a313c1e25c@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 28 Oct 2026 18:31:53 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-GYXmG3BsL9CAfe-F+3spDh=quA_ZKo-EJ6LvdX+7kgQ@mail.gmail.com>
X-Gm-Features: AclHuK-YTvrAo78HCnxHFW38xGx2QmgONzYQlBzZVn0-WU_J7aL2vxaAOOmK_cA
Message-ID: <CAKYAXd-GYXmG3BsL9CAfe-F+3spDh=quA_ZKo-EJ6LvdX+7kgQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] Github Actions: bump to Ubuntu 26.04 runner
To: David Timber <dxdt@dev.snart.me>
Cc: exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 6:18=E2=80=AFPM David Timber <dxdt@dev.snart.me> wr=
ote:
>
> I can see that the CI is failing. It looks like you're stuck with 24.04
> for some reason.
>
> https://github.blog/changelog/2026-09-17-ubuntu-26-generally-available-an=
d-latest-migration/
>
> I don't understand why they decided to do a gradual roll out. My bad for
> not checking this before writing up the patch.
>
> We should just pin the runner to "ubuntu-26.04". It should be good for
> another decade.
I also tried changing to ubuntu-26.04, but CI failed. because the
exFAT module is missing in sparc64's linux module package.
