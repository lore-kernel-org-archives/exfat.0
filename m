Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503ED2F5A2D
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 06:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787294779; cv=none; b=rkVdBiYTYI8mgqeN2AARJa8KMWroPVcJsmW0t1R1ePV/ymHRQ48O4tEw7R82fMJKOQECuft7YefwIC+vKCvfsvn0mQEg1BGF97rO7BCGagEAoCy8O6K08VOB0UEn1CEGX50rH7zYNihmjSjUfBYAr7t21XbLtmcIvRIu1naC0mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787294779; c=relaxed/simple;
	bh=a3jZU0EmDzK7n0NeYT/jGsZLRmYdmzeONKDnQm2h70o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=efwZ1SOHXbRQJlWosyGId2MTkwdcWKxBXqzGM5uenhLgUQbHLKe/4CIozE3fwZ7mIlg3/unGWmb4Ukqyy8oLhf+IXfhP5aIm8y4ffZRJqiJbT/GfB4vvxpqrYk2e9KecsFYS68Eo9INQU6aEizu9lkgDOLQzIHEn63p/uvKhhWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTPHWDdO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTPHWDdO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79211F00A3A
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 06:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787294777;
	bh=YoCbO5EXBzyixSw60R0ijoJxGiQfnTKfajSlZwl/+zQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MTPHWDdOBX4MPvZqJhuwvVI+uKFgZtUS72dEkcnjqwhnEEhbAWZi0U3yeCyiYV0Ct
	 eUu3PrmFzJ+dJQ1/uBfoT2zdz1jqLuRoMPwh38Rr/ajtGQGbULCCbG9BSak9MSldhw
	 kY+djT7MhbQMcCnipR7JRn0Atdn0lk/+jNIA0XiYGoiWje9zfK+FOl6Z9cHgB0kFNw
	 48dkQwJBGwhalSKQeD6crj2RvljBFXKa+NTkRNyaD96wZEcHWknMg6XVnaqMPsMKId
	 PVa0oVyGg9zktATypDqJ8bCHmjeM+J28arf9Vb1CEWC1At1pk2tV8M7D9xkjUn74cm
	 hHH2zpofuI6Ig==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso1319785a12.0
        for <exfat@lists.linux.dev>; Thu, 20 Aug 2026 23:46:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrZJapAO3xMwF/UCLYUllFuoiGKAtq0wIhHaBNEBWQR3SBm6CeRwO+k0PQdudZsnXCGBUBYpw==@lists.linux.dev
X-Gm-Message-State: AFuF++naev56vyQo7IQcrr2rDjj/0p3/KWFlOKpRNCLNo1Ap77WZVlsx
	GiDOJZSrQE46nj+MfuShKqaL2YsnLgXyhxYenm+VD+yTSf6+d0i0sXvGfo2DJO1a0yzPwkUT9zx
	ZYJPgMlRcXrK4vLWgYJGgzYZUJw19Xpo=
X-Received: by 2002:a05:6402:e09:b0:6a3:6d83:ba44 with SMTP id
 4fb4d7f45d1cf-6a42f163036mr4786020a12.2.1787294776594; Thu, 20 Aug 2026
 23:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821060741.92772-1-dxdt@dev.snart.me> <20260821060741.92772-2-dxdt@dev.snart.me>
In-Reply-To: <20260821060741.92772-2-dxdt@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 21 Aug 2026 15:46:04 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9FWrUtr6b-0fqwgxMKM3XQStsu9BZxfYmotVtFVFimTw@mail.gmail.com>
X-Gm-Features: AcwNN1WwYtHw2LnJfdxgAf33QS7dGpAkBaJo-cK5oRPn-IOxwUY1zKouPurHTxU
Message-ID: <CAKYAXd9FWrUtr6b-0fqwgxMKM3XQStsu9BZxfYmotVtFVFimTw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] libexfat: remove use of sscanf()
To: David Timber <dxdt@dev.snart.me>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> diff --git a/lib/libexfat.c b/lib/libexfat.c
> index ff0b25b..9cbb17f 100644
> --- a/lib/libexfat.c
> +++ b/lib/libexfat.c
> @@ -167,9 +167,9 @@ static int get_intbool_envvar(const char *name)
>         const char *env = getenv(name);
>
>         if (env != NULL) {
> -               int v = -1;
> +               long v = -1;
>
> -               if (sscanf(env, "%d", &v) == 1)
> +               if (exfat_parse_long(env, &v) == 0)
I have updated this line like the following one.

+ if (exfat_parse_long(env, &v) == 0 && v >= 0)

And I will apply this patch if you don't object to it.
Thanks!
