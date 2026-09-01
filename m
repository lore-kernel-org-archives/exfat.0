Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28A6352022
	for <exfat@lists.linux.dev>; Tue,  1 Sep 2026 06:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245187; cv=none; b=f0VTP5vobTadz0Nal6v/ZxneQPvxDm1ZX4+D2JOvNLK+1Of3u1HP3Yr+wEZyzqY28QgmxcBsvaNRllMDNR2nBjieOTTIpkyfPzPeCzONZExsQJ4Y0nRKyougvUptXThkCVbUxfCpWRCL//RWDS5Uz8BJj8TPhzohHlQFWxcrZZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245187; c=relaxed/simple;
	bh=OFcEzgCk9UlnjW2LULSWXEChap30WBhqiCcSNByzP8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GaC+5KGwvs+N0fpNPnliKf7cMotvl+dAfJ6uS91HdA/8QrgftB+Tr31wWl3KerHnVGVGdUKIqTEdkiFsdeDbqt9llj02AN9IZ6rZMzhz9ihb/UZjSlvgI738iFVKwxv7fRVkVffDkGcwByqR14RGqRR42il7YHmn2tz0LaRx08Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KY4f1MKd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KY4f1MKd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DDB1F00ACF
	for <exfat@lists.linux.dev>; Tue,  1 Sep 2026 06:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788245186;
	bh=/uB+oZnXdP3HiDF1gQ9WGpTRmCtUS3KddOyf3RwpAdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KY4f1MKdsZt+7vwMU/K+wbQcEkm73E4Mfs1O8vB3Ky6D5vXiEN4h90qQqqc5CbJkV
	 P9A60PCWDNw7Bk3n0u3c9FEMnpWuQtYxaDVQEpqGzvpsbMD5H1vdCy+qyK3otar51i
	 iPZMpiUlaZ6HgJafSIL0sORdYfy5d6NXFmdStHhg7UNWOUncOPGieddSlAC56eccHk
	 NYLqIhlujzPbAqEU97HL0XGQcXtgKLOxvu36/K4fq+NNiUCTGf28INsh2JlixKW9fN
	 zeCj9uAJIMlkOyc7eDTbc05ZhYU1NES0FMQt5Uts9EbPMnbmL980x2tlC6dMyZHY8V
	 xllNrtWAm8y3A==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c255acff671so613522566b.0
        for <exfat@lists.linux.dev>; Mon, 31 Aug 2026 23:46:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrIDsbH/9K6HpGwBlPBFyl7Zq3z+mItxQA4TaTfqDAtUSjvBI/fLGku0bNCsYys0Bb6Mq3ZZw==@lists.linux.dev
X-Gm-Message-State: AFuF++npC3X2oxt7AGHtzFwBVy75m0o6fS6Ks7jVpCGUfrL9rQApKocd
	ziJHcD2YG2j5tvpndxHZ3oLnyBFHbOeqZVSmKuBF0VZIMHFYyTUkGvkTULJnkrowckRHcEdcJEs
	kVessas56/0P8BxgHHlk2MzZWi00cKrc=
X-Received: by 2002:a17:907:9344:b0:c21:8a0f:56dc with SMTP id
 a640c23a62f3a-c2556c19c3bmr2035182566b.4.1788245184817; Mon, 31 Aug 2026
 23:46:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831105330.10449-1-linkinjeon@kernel.org> <20260831144929.1597433-1-zhanxusheng@xiaomi.com>
In-Reply-To: <20260831144929.1597433-1-zhanxusheng@xiaomi.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 1 Sep 2026 15:46:12 +0900
X-Gmail-Original-Message-ID: <CAKYAXd971E05QF4dPiS1YNcOSQpgQUVrd8dU=PmsHmk_XX+-oQ@mail.gmail.com>
X-Gm-Features: AcwNN1VvEeVJhuX84xSKEi1AfAoYU99AW8E1D9N7hW-2DXejrMz3S62amHDcX5Q
Message-ID: <CAKYAXd971E05QF4dPiS1YNcOSQpgQUVrd8dU=PmsHmk_XX+-oQ@mail.gmail.com>
Subject: Re: [PATCH] exfat: doc: add documentation
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	anmuxixixi@gmail.com, dxdt@dev.snart.me, chizhiling@kylinos.cn, 
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 11:49=E2=80=AFPM Zhan Xusheng <zhanxusheng1024@gmai=
l.com> wrote:
>
> The option list and the defaults match fs/exfat/, including the allow_uti=
me
> derivation and the time_offset range.  Three things the table leaves out =
or
> implies.
>
> Most of the options cannot be changed on remount.  exfat_reconfigure()
> fails with -EINVAL if iocharset, keep_last_dots, sys_tz, time_offset, uid=
,
> gid, fmask, dmask or allow_utime differ from the current values
> (super.c:789), leaving only errors, discard and zero_size_dir.  Nothing i=
s
> logged on that path, so "mount -o remount,uid=3D1000" returns a bare EINV=
AL.
> The reason sits in the code right above the test: the old values are cach=
ed
> in inodes and dentries.
>
> umask=3D sets both masks, and the options take effect in the order they a=
re
> written.  Opt_umask assigns fs_fmask and fs_dmask (super.c:289), so
> "-o umask=3D0022,dmask=3D0077" ends up with dmask 0077, while
> "-o dmask=3D0077,umask=3D0022" silently puts dmask back to 0022.  The dma=
sk=3D
> and fmask=3D entries also do not give their default, which is the same
> current umask that umask=3D defaults to.
>
> utf8 is ignored rather than an old spelling of iocharset=3Dutf8.  It shar=
es a
> fallthrough with debug, namecase=3D and codepage=3D (super.c:331), so
> "mount -o utf8" selects nothing.  exfat_show_options() prints
> iocharset=3Dutf8 only when opts->utf8 is set (super.c:132), and nothing s=
ets
> that but iocharset=3Dutf8.  Listing utf8 apart from the group described a=
s
> "Deprecated and ignored" reads as if it still has an effect.
I will update them on the v2 version.
Thanks for the review!
