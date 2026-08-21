Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC094C77A2
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322384; cv=none; b=FQyKX1q31emnNxjIpqgkaiHkQ6DIaQ/pYSyK6BaTpCUB5KpK6hg+iaYZTdu+clGwQCu7kPGPU1cnpTxg8o/3CY4cwbq0+hF1jdvj4P6ohsq7HWRrOZMdhGogAR04Ur5Za+WlK545ra1jmkOcJmDNcruPevBPTkzKXXJKpU6ZNOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322384; c=relaxed/simple;
	bh=w/Ycm5PGwp6B9fNdEvz8Qi+2+8UdPIFKBZYlJV7kmd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ea04zwa0/FezomTdtNRUpsYhgSy74Tq0WwnglvakySnjMY+1PN7of0V4AONAaavPn6m65cj3eWUg7GHeW5+bj6cKGpyMlG+RmNvZWfTIm0kTYL/i4BvpcgAXOOHXZSueuMQq/EBqlc4nAzmiYd3/JdfZ8XlpQyyJl1RYGM+fJQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVtR43MP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVtR43MP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA5D1F00A3D
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787322383;
	bh=xJKkFRvLwsH39rZ+5kS4AfukzLW5AbB6CZv7P248WIM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OVtR43MPXqO9cHp9axJ51mLwKGPLTtqpZj8SkGJ44SCqbWdBcBJK7CeYoSvlgb60U
	 qu+qUQMkMtKHEd6eE/I8eM9BDmNmTNvHeq72HqNrvTzPLTtuYIggIPeqJrqNLhEV7B
	 HEc1W3aYkdU4Di+qqDHvp9RxWQvxlfe2NkUpT1ArU6S0PsILOod4CIrRgki9t6fvAa
	 pFkGlHFhNLQtB7CIWz8qQzH11pFmkS//R7naOKyXjuYNolnT3MiigJ7oqH2lQE0PSe
	 hvmS6V7MbOGgzdk+Y7Khw6T0OE7ifdIf4SOg0HzKOm42mBvqxVaZbMpbkhVdA6PJcm
	 vBJgEOeeM7+9w==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c214321dc32so211332266b.0
        for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 07:26:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp2FRPUqDA+mk3mFD9FhGPHUjxVRmdoGFajRbFnOU0xV/8T7dIMuDrOFyVb4U5ObBvj373jXg==@lists.linux.dev
X-Gm-Message-State: AFuF++nn0LX3m74+2XomtAVZGwjuLP7igm/LkZ+rHKzu76wANK4m4P4b
	7bTMN+TSsHJWr1n31XrAihOmV9Jei4BE4mOIuya3dCCtyhyPxnBJ4knTnP3X0mQYxSH+aZ9u1MD
	Mdc20uqhKTE2G/VVYOwiB7cwJEDL2HMQ=
X-Received: by 2002:a17:907:97d5:b0:c19:45df:1856 with SMTP id
 a640c23a62f3a-c246a675873mr643272766b.17.1787322381936; Fri, 21 Aug 2026
 07:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821060741.92772-1-dxdt@dev.snart.me> <20260821060741.92772-3-dxdt@dev.snart.me>
 <CAKYAXd9FD2JVKVfMV3=Nxx6MkDA7566AJT1cqQfFnavZ5m7GzQ@mail.gmail.com> <cdcb9a83-818f-4064-8b06-b76251f8b6bd@dev.snart.me>
In-Reply-To: <cdcb9a83-818f-4064-8b06-b76251f8b6bd@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 21 Aug 2026 23:26:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_pVUC4AKWsQf7suy1wTeuk=R5p1DnyQ62+0TEkVrhBjA@mail.gmail.com>
X-Gm-Features: AcwNN1VLLZN4CxN4Q_zrK7z6Y4E0aVq07hrq77w3-KYCogyMlPIFV6aWtGREilw
Message-ID: <CAKYAXd_pVUC4AKWsQf7suy1wTeuk=R5p1DnyQ62+0TEkVrhBjA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] treewide: run internal library tests in "make check"
To: David Timber <dxdt@dev.snart.me>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, exfat@lists.linux.dev, Sam James <sam@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 5:09=E2=80=AFPM David Timber <dxdt@dev.snart.me> wr=
ote:
>
> On 8/21/26 16:02, Namjae Jeon wrote:
> >> diff --git a/configure.ac b/configure.ac
> >> index ab6fb5d..99bad24 100644
> >> --- a/configure.ac
> >> +++ b/configure.ac
> >> @@ -52,7 +52,7 @@ PKG_CHECK_MODULES([BLKID], [blkid >=3D 2.20], [AC_DE=
FINE([HAVE_BLKID], [1], [Defin
> >>         [PKG_CHECK_MODULES([EXT2_BLKID], [blkid], [AC_DEFINE([HAVE_EXT=
2_BLKID], [1], [Define if libblkid is from libext2])])])
> >>
> >>  AC_ARG_ENABLE([tests],
> >> -       AS_HELP_STRING([--enable-tests], [build internal test programs=
])
> >> +       AS_HELP_STRING([--enable-tests], [always build internal test p=
rograms (not just for "make check")]),
> >>         [enable_tests=3Dyes]
> > I have updated it like this and will apply it to #exfat-next.
> >
> > -       AS_HELP_STRING([--enable-tests], [build internal test programs]=
)
> > +       AS_HELP_STRING([--enable-tests], [always build internal test
> > programs (not just for "make check")]),
> > -       [enable_tests=3Dyes]
> > +       [enable_tests=3D$enableval],
> > +       [enable_tests=3Dno]
> >
> > Thanks!
> Just a quick question: is this a real problem where "enable_tests" is
> set to "yes" before running ./configure? I don't object to explicitly
> specifying [enable_tests=3Dno] as a common pattern going forward. I'm jus=
t
> curious if there's any reasoning behind this.
[enable_tests=3Dno] was not intended to fix an actual bug. I added it to
make the default explicit when no option is specified and to follow
the same pattern used by the iostats option below. The functionally
important change is  [enable_tests=3D$enableval].

Thanks.
