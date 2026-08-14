Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C2A33EB1A
	for <exfat@lists.linux.dev>; Fri, 14 Aug 2026 14:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718648; cv=none; b=A27hx8EmaJjkGBGLpxVFiOvVOfNFUCjhVCroEZM1FVzopiTseVRk6hM2+Xf9MPKHPtpPwBB8sd53dh+aC5tIsHihDVSy5wS2cMTxzzmyN0aFrk7diDnOXjmtv23kzHnuqSs23RRy53WIS+OpUGmkaD119GzgvnR4K25l3b/WSWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718648; c=relaxed/simple;
	bh=YY7MFPbnZs72HXw2Q6ZEEoRnbfZqHhRRBNrF6Kut5qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+fxCuSToemVuocKRaF8Dr/NfNTNHq0mCL8j99/zvXR5+0pS8RQ2GxKysiBuBQwyaDv/WqPxmnDLX4n10ICCWzd+5xjApRy3kpRiqYmCpJfKGYu1JFMaLA9ZsXkibznLGNQJwwFfoSp2gMInr6T3GNCt3oiuZDZXvbWbt9EHsVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ela8TpuO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ela8TpuO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A521F00A3F
	for <exfat@lists.linux.dev>; Fri, 14 Aug 2026 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786718647;
	bh=YY7MFPbnZs72HXw2Q6ZEEoRnbfZqHhRRBNrF6Kut5qE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ela8TpuO7GkJjbJHwiL+PFXqZJ4BCg+nkvwm62Zf3QU1X2fW/OY32jJLN1wriMk0g
	 +1NFxPMG1cFUNxeStKz5Ac1iBsCBVuuHgkrKTUWZmEhCXoyjcS4kA8eovH0m9RV645
	 uDJb5shb2y5U1knrJAVquZyraw72hSO9Um+N8CXENZhovemXzeatbarxdVUuy3er4G
	 OeuaI7Vfmer7VYnsPU/CoAKsP1aFAE4CsMoFVdfq0/Q6pgi7UAWImXwg60VaT9vOwQ
	 RqK2Fi5G4JUdY1raw5jVRjIDa+WB0Tv2jcSZzVTaM4VdHMCWGHvG+RNYAzcquy8iIw
	 nybhLjJ5OeIVQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso185451366b.3
        for <exfat@lists.linux.dev>; Fri, 14 Aug 2026 07:44:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoxU+Rk51pThDLpwAhvKQzkux/evSGzwfHcpVFWpKJy5RD4YdKR9VX6wxU1BzrtPVxR6uI25Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzY9sgqY+LWP5AbO5VkiSENe6iFZerGCxJUxYkGVVR3JUJqdNp/
	L2EIYsSaeAZtS8RWENrmj/4+MWhHPsuDVWiQqWjVMh1ZnnnDmdDLAXUK6TlttsxF5xBfqi6O4o9
	XWCsDaAD5p23V13DYRpzoOhX83ce4tUo=
X-Received: by 2002:a17:907:8b89:b0:c16:29eb:e81a with SMTP id
 a640c23a62f3a-c212ac25d1fmr277234666b.29.1786718645520; Fri, 14 Aug 2026
 07:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813142919.812744-1-anmuxixixi@gmail.com>
In-Reply-To: <20260813142919.812744-1-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 14 Aug 2026 23:43:53 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-GfPRMB5RNfqu5q2AWFTy-qP_-Q3fWj7hv2sbFPi_L-w@mail.gmail.com>
X-Gm-Features: AUfX_mzuqBJlb1NHX8JrJAVdIXjh9CMEHmcRc4mjYyINLhzIaJXSaDx1ra4M5UM
Message-ID: <CAKYAXd-GfPRMB5RNfqu5q2AWFTy-qP_-Q3fWj7hv2sbFPi_L-w@mail.gmail.com>
Subject: Re: [PATCH] exfat: keep FITRIM within the requested range
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 11:29=E2=80=AFPM Yang Wen <anmuxixixi@gmail.com> wr=
ote:
>
> exfat_find_free_bitmap() searches the entire allocation bitmap and may
> wrap around to its beginning. exfat_trim_fs() does not verify that the
> returned cluster is still within the requested FITRIM range.
>
> As a result, a partial FITRIM operation may discard free clusters outside
> the user-specified range and report a trimmed length larger than the
> requested length.
>
> Validate each returned cluster against the requested range and stop the
> search when it wraps around or passes the range end.
>
> Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
Applied it to #dev.
Thanks!
