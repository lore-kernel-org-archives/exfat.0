Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE674A3F0A
	for <exfat@lists.linux.dev>; Thu,  3 Sep 2026 12:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438535; cv=none; b=fCEoUA/jWERe7XvEkJf7Peo/wjS7kb9rO6JRQ8JtgFrsUQuFyn3Rsy4fG621om0pB9vP5QPDThtKw3iofe8ga5WYPFmGmBONYpXuHYNJYLrBoJsL1rl4tCrcfwj/8POA1NRcgKo24ac46LqNXBWCyA8o+kT/JxPzgFjScqfzkXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438535; c=relaxed/simple;
	bh=7fpaOBm849EDHkaDTTLjalWHjilq3zQL6rBSXDga8VE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGl30JJpkLq7XcT9IiqiUfkujT0YtF05jsH3DrC7JnD2a49mmQ/bJbm7mJCiYZmFGO7XQmu1CVPIxyrDWFXJv0KrCmr9xFMl/IyjS1duyaQIML5+Z+WawoDd/FjnX0REv5QcQaZTuo/slPJ0fWkTcNmAdhItQ7UIZGsBo4FtO6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQDvPjOQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQDvPjOQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317561F00A3A
	for <exfat@lists.linux.dev>; Thu,  3 Sep 2026 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788438531;
	bh=7fpaOBm849EDHkaDTTLjalWHjilq3zQL6rBSXDga8VE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DQDvPjOQiKWYYOW+ENUzUBD8gzPKgxb1bsbTJG+tWogC05XG90CkAOVNKrVobLREQ
	 RxClwdDBiFybbEA62/NRpGGfDXdROQHOHhGjnksQDgk6TYv4QpSikzwhu6J6G45kBz
	 69kq7IRXmzV3NHGO2fz+xeVfQO77zbExGKR51PHA/VmCxwWShuD/lapS8QTFN+vX6w
	 k0cygcsO8cKspUKiXpbRSJ+liIkithJutJefg091XecdUy63kL0+5lSrnqdpmDKlks
	 IdCgTu2h2xLKGvM/iwBPq3a47z5t6WMH3rFX3f1ScaZva+ETHYOtXIH8C42aw1kUPq
	 bOpg3E4u25kNw==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2533d83e3bso361845166b.2
        for <exfat@lists.linux.dev>; Thu, 03 Sep 2026 05:28:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBweGiwR53lnCNtCD1aYP82S2lT/Xiz0/8kq5XTQFPrp2PI/TJX7jLMkKOJySM/gMWQW9GbMnA==@lists.linux.dev
X-Gm-Message-State: AFuF++kYNZI8Iad/JhBOHhEDOTiYo624GFehWRFsmiIhmCNwAxt4+agZ
	oHIN3A5oENCER/0l5fk0giOYjEzHVDSPGHhMut3a0X9eXx02nDT1jfZtnPdlSpAiAAm7lRgtUa3
	gy1YehGwxH2Aqe5NK4zn3U7N2MV19QJw=
X-Received: by 2002:a17:906:99d4:b0:c25:58e:83ff with SMTP id
 a640c23a62f3a-c25d52b4f8cmr759707666b.10.1788438529872; Thu, 03 Sep 2026
 05:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901084219.39898-1-dxdt@dev.snart.me>
In-Reply-To: <20260901084219.39898-1-dxdt@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 3 Sep 2026 21:28:35 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_Jy1ycRkONZQZJx22o+dKRE89nbyjdJUmj+fAbLEDh7w@mail.gmail.com>
X-Gm-Features: AcwNN1VN3qcEKobZf_2D2dl-9dZ4kNqyS-UY_3cv4C22DKIjY2MOAQqX8fX5Mt0
Message-ID: <CAKYAXd_Jy1ycRkONZQZJx22o+dKRE89nbyjdJUmj+fAbLEDh7w@mail.gmail.com>
Subject: Re: [PATCH 1/2] libexfat, fsck: add volume flags definitions
To: David Timber <dxdt@dev.snart.me>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:42=E2=80=AFPM David Timber <dxdt@dev.snart.me> wro=
te:
>
> Add the rest of volume flags(ACTIVE_FAT, DIRTY, MEDIA_FAILURE,
> CLEAR_TO_ZERO) from the exFAT volume format specs for cleaner code and
> upcoming features.
>
> Use VOL_DIRTY instead of the magic value(0x02) in fsck.c.
>
> No functional change.
>
> Signed-off-by: David Timber <dxdt@dev.snart.me>
Applied it to #exfat-next.
Thanks!
