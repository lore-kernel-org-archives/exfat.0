Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718890;
	b=0XumgnRkmRmS9DEx+L2OxwFEofeI65Gk+B/9rspIrcDyVlIrBsVbYMVQnCYNIouv05qC
	 kc6j2cvZXy+eCxhxCByXmQKXzEku00YtYyfRvFMu0AWj2579vzb+I1nZEXSv3++V2sOkz
	 sOixothVfCD8wVYfpqMaoEBe+1QKA/x8GaDY0rXrw6ghazT32xCq+KS1FIgQ4I4HveTpc
	 1uTqFopE5/ZUdesQpMWKkxY35lvH/TAcq6l8PENc99hhFj0uU2f6wkWTjk8v/JPBrfFHF
	 YfXUAIpcQH94MQ8GC+J1ROHnblxq/SCF440SwnW4vNu5J35LpWnGoPvz6e5yDbZJ1NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QDUu0ipWkEkr2evKB+VQexo3kZhP7laIpcWU434jcM4=;
	b=ay3icPZxKKa+mRZkS0Y8jlVMoOW2+sUkItd98/lbt6+imAm8pgdFXz3XshUgREkBCK+l
	 fjGwhikICahNSyJJz7us/JxEFq0++uQ1fzcghq7qOPLUpysOaj+WrprwmgnJk/ifzbjTZ
	 AIx5pvbuDc2USlCM7VFoXJXD0f3XVFSTcvGn6SN43599AaH7XjDEqCy8E1yX2C+mOZ+IZ
	 EPRVi+Npz2/X8ISaP7S2xHNsB2Ao8X6DgeaALKNUW0zx8tYlhvBToqoKXSAaFrvLy4aIU
	 AEx6wmf606eLwfkzaxrT/FlIgRqt58PF9zq9A8U7rj7ydcram5NSJy+bemS2MgWc2AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPZrJqXa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75105606EE8A
	for <exfat@lists.linux.dev>; Tue,  3 Nov 2026 15:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75105606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPZrJqXa
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso6255082a12.2
        for <exfat@lists.linux.dev>; Tue, 03 Nov 2026 07:14:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793718888; cv=none;
        d=google.com; s=arc-20260327;
        b=VrNbvfKApybDtXi8NHmquRnjq9xU8AQkIytlfIq1PJZkkp0TaoheUFbhJ/YHUvBtWv
         ARJ4EHpmZQ3Ac5mMlF49vbBSvdPzCOz8ZZt2Z2gUsheKOhW4j+PFiqrbWZz0Z3zLL3se
         YXV7qRNJo93Y8GCkDfyMf+NiW72OIAI5atMhaUz9zW+uDl2jfo5aTMoYD9qSPMocKZ0F
         CrvJSWmZZKwxYc7u1BtT6M6XKpkat74Y2sDLR5wj0RxGHgTtvTEsIdrrLZOSwLmLZnlm
         rmzghGANhs6jiegEf6BMmG8FlFLSgMCFOOuZKY6DzZQRodlbgi6ecu1uWVAuLVPe+5tE
         Peuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QDUu0ipWkEkr2evKB+VQexo3kZhP7laIpcWU434jcM4=;
        fh=ooIb4fwH4kmLR13bf0gEv3iOoENqEXwcBesVuHhtlZQ=;
        b=lNa/rkcFtdETGea4eL4GGd+bUAn5ybJ9tQIhWZH06NiHZ4yD4m+1t4dtk1K+8qwdOL
         9sqxlhVWaRCEc3t/gdXhRHLFUvy6hznTdCujU4ulxivOkLUinm1W5wBIQ32NhrcpvznU
         yfQhMwf6Xu4BK+yItTQ6IO3odLGnFlRg0TDkzLa+Q6r2dwGHr0f5Aariuyt0T1FNDHQt
         6Yy2OOjS4SrElzCzonDhQpNjk5F8YMZ5l/2QbSFnJDesXsarEOn7ETRfLOy5dwCqMbRX
         HZeCM08wuG+HnIa1Q4dgSYxIjO58rGedQpYzqkTf+5Ni1icOHv/12DMbNmU/U3mRJKl2
         xEOw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718888; x=1794323688; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QDUu0ipWkEkr2evKB+VQexo3kZhP7laIpcWU434jcM4=;
        b=IPZrJqXaSzfRftkRRy1qNQtVABcx4KDr6aStT+MDK0d//0AwfqFg1LijJ0wjrIL90v
         wH5HGp2uxQh7ZFqeSPGDOYrvsHtyeIF4CZWYYx83wAeMTzwpwnH3bJzZo9LmhLM1xXma
         72GxG//TlNYeExhPOVi0KQpyCBZ230HR+reNGnrA533nyLtkc2k4tyh1giRt2LTWlGpk
         qF0uXO5PcBkGy2IEcwBkhpV1G/1WbMwfs4h5KfugT5+UXuslQuii3vLm5YvwswTWzIoR
         kpjuklAqEczSxKZGGQh2ChVkDQMMBlDzUIHmLg56m6qK44EregjSp4ug+z5z9JrC1v6O
         30Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718888; x=1794323688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDUu0ipWkEkr2evKB+VQexo3kZhP7laIpcWU434jcM4=;
        b=xOhtEv6ArKpm6/NgMsNI5XBiKdGQrMWXc6UvwtEYs0X+sngkaqVIhNDLq4YGYp83Dm
         cI3eHt96UW05kL1PudD84ZpNGWQD+8Y8QBbTWNct4B7iuZolPgXP8I84QsT1Sd4OwSWR
         HCS57/RqDdksdF/HItoct1mDeXqxwO24V506zk07GdYkk0JVTXUfltOJ9PSsUa7OwaFz
         2Fx4p6SWXvHumg/IuuhKnoYm0UeuJ1XjPbtmy7T3QWktWNzEBHvWN4sR00ukzC7dr8AJ
         f1y8ncSM4Cd3lBC714Z531pmOE5HWMeRHyUQ+MojQdrI9C8CyErcw0jmbc0eezerOKzH
         Gm/Q==
X-Forwarded-Encrypted: i=1; AKwUvByYn/duP/FfUmq0R7nUOtyc/P6B6a7b9SW6594UTpUe3Q0RJjCOJuTdKYzWjIRFwn59JT6kxw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Ez0Z63FYtxQ4OerZBp36JiS1SuuogVOqGbdLMXjvSRot2pRjU
	TiBk1coX6vlNDIe6eAjYp7Xa6kaiq/YyMYBnpSzdJB/4jUoQfcHNNnMepNN9HBGZVEPXHU8c89n
	ihN0eXR+qYTRabkjYd/1ROkwjYZBje4k=
X-Gm-Gg: AYBFou0oXIDrUGiiE4QBp61YLVei5eiocRQAM0PdrEyZkjhrgXvGY6HulpTfIWEA9/X
	+8kAU9SkkSmc167jhQqtpRgaswuHu5iX0L4Epifp/q1LE6JyMA+Er3B+zzeFjIKqfnimPcRrv6z
	JCcGDR3U1bNU19ysH1jb3Mu/Xq9FJ+fhwm+7F+HvUysf14YnPX1aTgaWZrB40OxtTzcI1+6hl2f
	HfjdNHfxjfoJnXwcNTIGLavgAWJy9DljWe2md3NkwxJTvfwO50rBWuMbvNQyHwzR9AF6STlCmVI
	am4USel0OsNJOCE73xUalBRJqUzSdxylMG+goGdrlIwXMpFDpODfKU6XxjdVffJCeDIHLVsF5ga
	EurxZdFn2CMmdFJvwo2s6zM5o57lotcAvz5uIMzcaOxHTxO/uSJSFE+6pTCCw/CWwqxT1QjU=
X-Received: by 2002:aa7:d309:0:b0:6b3:f094:8ced with SMTP id
 4fb4d7f45d1cf-6b4d4683a29mr7344511a12.21.1793718887787; Tue, 03 Nov 2026
 07:14:47 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <20261101015551.786044-2-koray.fra@gmail.com>
 <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com> <DMLJ5DR2A4KZ.28U8XSZ0KFJTG@gmail.com>
In-Reply-To: <DMLJ5DR2A4KZ.28U8XSZ0KFJTG@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Nov 2026 16:14:35 +0100
X-Gm-Features: AclHuK-EjP75rU69csZK2uVzxHspULIwEcPYYUtLw5t3M157ApaMB9lhTx9MQvw
Message-ID: <CAOQ4uxiTS-QT7y1avNSasJSffkt2uRNkdrb2_GrK7kJ82-MoXw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] vfs: add provenance time (ptime)
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Chris Mason <mason@kernel.org>, 
	Jan Kara <jack@suse.cz>, Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <cel@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Sean Smith <defendthedisabled@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:13=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 2, 2026 at 3:00 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com>=
 wrote:
> >>
> >> Add provenance time (ptime), indicating the time when a file or
> >> directory was created. This is user-settable via file_setattr() and
> >> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
> >>
> >> The semantics of when to preserve this new timestamp are the same as
> >> mtime, the idea being that there is a correspondence like this:
> >>
> >> ctime <-> btime
> >> mtime <-> ptime
> >>
> >> so every operation (copying, moving, ...) that currently preserves mti=
me
> >> should also preserve ptime.
> >>
> >> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
> >> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
> >> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() =
to
> >> allow ptime to be used with the file_setattr()/file_getattr() syscalls=
.
> >>
> >> [ This is a re-implementation of the initial patch[1] by Sean Smith
> >>   <defendthedisabled@gmail.com>, following the advice[2] from Darrick =
J.
> >>   Wong <djwong@kernel.org> of using file_setattr() instead of updating
> >>   utimensat() ]
> >>
> >> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@g=
mail.com
> >> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
> >>
> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> ---
> >>  fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
> >>  fs/stat.c                 |  2 ++
> >>  include/linux/fileattr.h  |  5 +++++
> >>  include/linux/stat.h      |  1 +
> >>  include/uapi/linux/fs.h   |  8 +++++++-
> >>  include/uapi/linux/stat.h |  7 ++++++-
> >>  6 files changed, 52 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/fs/file_attr.c b/fs/file_attr.c
> >> index 833e03810b24..c0645cb22bf3 100644
> >> --- a/fs/file_attr.c
> >> +++ b/fs/file_attr.c
> >> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
> >>  static void fileattr_to_file_attr(const struct file_kattr *fa,
> >>                                   struct file_attr *fattr)
> >>  {
> >> -       __u32 mask =3D FS_XFLAGS_MASK;
> >> +       __u32 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
> >>
> >>         memset(fattr, 0, sizeof(struct file_attr));
> >>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
> >> @@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct fil=
e_kattr *fa,
> >>         fattr->fa_nextents =3D fa->fsx_nextents;
> >>         fattr->fa_projid =3D fa->fsx_projid;
> >>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
> >> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
> >> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
> >>  }
> >>
> >>  /**
> >> @@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
> >>  static int file_attr_to_fileattr(const struct file_attr *fattr,
> >>                                  struct file_kattr *fa)
> >>  {
> >> -       __u64 mask =3D FS_XFLAGS_MASK;
> >> +       __u64 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
> >
> > That is not the correct way to extend this API.
> > This fixed mask was added as a placeholder for
> > "We intend to add support for more xflags to selective filesystems":
> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-2-amir73il=
@gmail.com/
> >
> > Please see this POC patch for filesystems to publish their supported
> > xflags mask:
> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-3-amir73il=
@gmail.com/
>
> Thanks, I did not think of adding a dynamic mask like that, I will look
> into it and implement it for v4.
>
> > This will allow callers of file_getattr() to know if the filesystem
> > supports ptime
> > without trying to set it and failing.
>
> So after adding fsx_xflags_mask to file_kattr, every filesystem would
> populate fsx_xflags_mask with all the returned (=3D=3D supported) FS_XFLA=
G_*
> in their own specific .fileattr_get, correct?

Not all filesystems. Just the ones that wish to extend the constant
legacy FS_XFLAGS_MASK.
So just the ones that you change to support XFLAGS_PTIME

Thanks,
Amir.
