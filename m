Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FF32517AF
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787295740; cv=none; b=RMTHVNWpmj4z2pW6oSB6jYDZzzBK4EWP6hWBpIXP6ibCpTl/y1NYua/QpXy/Hxf1q6XcokRHGDwBiG83boz82jaMe9iKLQHvV4IoCQlVx3G2Df7gPndoIiuSz3PPA4XXkE5s/sSljENLD00VIlXZtF1v4eNhgnguJ4MPs13rYI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787295740; c=relaxed/simple;
	bh=tpq52ZO4ZhYzHxUtPxHjCjE5y82e7WJ42s0u6Vth8yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFysCUkji+Ao+RqM+LLLsd/hZVTBTfbrFBdIay2K/B4s1kTBSVQOxbdSLELqyCCS3BF6ydEsaCCE5SfIGpTEUR6zLZNd07hz53rQeJ38h3DMgR2jRIva1WQWwIi+hEQ2J8iCn0x/+merNsDOuN1SBjVVNEj5fuO5UUWO+8Z0HQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/J6ISgQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/J6ISgQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BB31F000E9
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 07:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787295739;
	bh=MQDoteUEWj9plURsZWDTIEqLhtVPELCYMwRzdzA21iM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=U/J6ISgQKHw56Dsf7HFAwDFWNZLO8tHM7H8sa68NqIDlW2jLBY5UUDfej1T5OqSd5
	 DjSzUWWnv61+UvoF2/wKFKud4pO5NB+SltA1TC6lDrrv74qTOuTNzY2vyvOkx7bn9h
	 xK5I4WkSxPLEggr0/bKDUpQNeZxHV94UWi4lp2yrdvi6S1KrGAOfAlMwmMZ/aWl0qP
	 FYr9N59J+IdO4r/C64NFwvEjj24eq333/Y6+lkHbytcdqs6tdyrRpYA8ZF2qg7PVpR
	 EWrqvUBzMPvVOT+AYqMzGlBWEFKb0PTInyjuhhwI9+DCWRosilKWBJNO4g238hk9vp
	 GoORrOz86wBiQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso95641666b.3
        for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 00:02:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrbuU7UTOKpn564MRgb0L/C9vYb85bn8g6+Y5AVrWOJh6Qy+Ny5IU0B8HrsMFDnoB2LpDrwnA==@lists.linux.dev
X-Gm-Message-State: AFuF++lvQ/FncomMqobkaPQ/lO20l/MATiE0lV7VDIpeJHNhmfhxJw53
	DhCKWZUyrJV5P7ZA0B/lpjc+Ov8MH8EahhZzs8xcFJF2oBmCmL6RvbcfXjV6kCZgFjVjAjwk8FR
	Tg2xfElthaQJXFsLBfJX9EF2W9UF+lUg=
X-Received: by 2002:a17:907:6d1d:b0:c1f:983f:d8a with SMTP id
 a640c23a62f3a-c246a6b2c64mr436396266b.24.1787295738040; Fri, 21 Aug 2026
 00:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821060741.92772-1-dxdt@dev.snart.me> <20260821060741.92772-3-dxdt@dev.snart.me>
In-Reply-To: <20260821060741.92772-3-dxdt@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 21 Aug 2026 16:02:05 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9FD2JVKVfMV3=Nxx6MkDA7566AJT1cqQfFnavZ5m7GzQ@mail.gmail.com>
X-Gm-Features: AcwNN1VWjNlejDYjPwWdpxlDZWDhvTulbl_VAUVTpXby6PFxrA0Lh5FiQxUKDUU
Message-ID: <CAKYAXd9FD2JVKVfMV3=Nxx6MkDA7566AJT1cqQfFnavZ5m7GzQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] treewide: run internal library tests in "make check"
To: David Timber <dxdt@dev.snart.me>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, exfat@lists.linux.dev, Sam James <sam@gentoo.org>
Content-Type: text/plain; charset="UTF-8"

> diff --git a/configure.ac b/configure.ac
> index ab6fb5d..99bad24 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -52,7 +52,7 @@ PKG_CHECK_MODULES([BLKID], [blkid >= 2.20], [AC_DEFINE([HAVE_BLKID], [1], [Defin
>         [PKG_CHECK_MODULES([EXT2_BLKID], [blkid], [AC_DEFINE([HAVE_EXT2_BLKID], [1], [Define if libblkid is from libext2])])])
>
>  AC_ARG_ENABLE([tests],
> -       AS_HELP_STRING([--enable-tests], [build internal test programs])
> +       AS_HELP_STRING([--enable-tests], [always build internal test programs (not just for "make check")]),
>         [enable_tests=yes]
I have updated it like this and will apply it to #exfat-next.

-       AS_HELP_STRING([--enable-tests], [build internal test programs])
+       AS_HELP_STRING([--enable-tests], [always build internal test
programs (not just for "make check")]),
-       [enable_tests=yes]
+       [enable_tests=$enableval],
+       [enable_tests=no]

Thanks!
