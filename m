Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726874;
	b=X79w/XUWpLFkDf7Dm7mn/a7FxhfcsbHQ0ggXEkxdhMjxKtG6w/dyTRE8U1wS6u/YwMBo
	 VlwZWEduTH9N7ysNGnjUbG1e+aZw+kPnFfSLKsbGcO8YAECfr0X/mA8by0tYqRAbWwgFa
	 P8v3o0bbg88KGNNvtve9+tvzbnGOG6fV5vBmOVtxqugCwFgeZV8TLqh9nIelGPW+CSa+t
	 v2pnB/Y3arRlinhFEmWdfLZA+qvihwskMrWlF8Ji7fFsp938bbsXk92WL7nwc3OP8nDv2
	 WI0qStSMxvJbLJs9LYs/XSXURpJguT6e611qzI3jKCjywH5OGAkGdM+Pzgte/pwYFDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=C7J2xwMhxMcLYQn+HgHArsLVIUvcNtC3sZDiMzWGQG0=;
	b=DY3EXSR8ATvw5yFJ6lNzdJfCfletChbNEdl4WHBYtH34e+Fhtr2BaGoLOI6/hlbo8w96
	 O/WkPB65Ko8OGUhfBvdSx2Ybs+2azsdpKNoVjw4aNXYPl2a+8sCJxcL3TeRrXkZ0jryvT
	 qi9LkJ+c0JNFMG3erUCuOUkNwP8hDe+KCvQPbxqadqXREeSmN2tYrjftlH9Gtr5b3Zpsk
	 awWf+cDLaxhdVtCTokn8qm1k4scJQKqHRLe5l+YGvxYksFPhbWGVoIiJDoadGKPaIErWF
	 1YApswMWgrcC4LCIhQaUt7Cm0IoQ4TwTQzxT48V36ngj/g5BQxuRgojMKjhQohmPw5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMcfU2Hy;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C150F606A329
	for <exfat@lists.linux.dev>; Tue,  3 Nov 2026 17:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C150F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMcfU2Hy
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so4567275f8f.1
        for <exfat@lists.linux.dev>; Tue, 03 Nov 2026 09:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793726872; x=1794331672; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C7J2xwMhxMcLYQn+HgHArsLVIUvcNtC3sZDiMzWGQG0=;
        b=JMcfU2HyiYd97mrt9qKuKs9c5fKdIdoNeIYUHBpodRRiEA/hbzj4KKhPMEvoQa5BBx
         sDbPIP6BQ3eGX9ncyH8AflEV3XzfGLBYp48Cqa8H2O+I7SutwrwadCzlwv+u9+7gbuqu
         5/ggGKR2IrcayVSJMtQyVAer7AhCsjdi8nUfD97bryCQbXkGKRElxhfMFeoD08D5QBcY
         efBGbAd4Tos3pSTrAaOg+qh0bL7rYP0yNMr6DfqAHAqcS3U9dWyFCHtTLN89UNvVSMBP
         tLUeXY77/9AocNh6go01iqVI5XbPBnrZa4/vpdt4nEFssgo0WZuaLnUbUxoergxHTLBc
         CU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726872; x=1794331672;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C7J2xwMhxMcLYQn+HgHArsLVIUvcNtC3sZDiMzWGQG0=;
        b=k7wtr8zmn5kk17fCNEE9ZiteuWROkKpNIHFl3Si0hkOS4p7yCT/Qo4njLzWeiak/h4
         VF+c62+BxZFeVs221C5YEbujapV7i/abrPo4nwrpzDnMUZY8BEVI8p0O9THy2wLkc8af
         wzJMwDNkuU+w4SqhYsiX3v81VVb6girlCfDKXmTgcul6FqIHSqqo7lvpuaVMCwEXg6yB
         301ynYaxtGFRzBJtRRfHxGT3o0VzpS0Jvo/Lm6T1DJxjerSaFULJHar24UxM/nP2uKzG
         iuIixgrMxKxSfkEHvgflV7VfvW2kdC8SIkvdedNxnKh1gb+ozFZELrqaMuN3OBjxSiRv
         eSqg==
X-Forwarded-Encrypted: i=1; AKwUvBxk//ui7ki7UKbIzppnVyLvk4tUpqT/Jbg88qvsWDNo47VFRbxnE7MRd1+G8du2AkvXJ+N1vQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8zwqQWpgl8UvXuVXQkubcmmkCmRZR9FkHiK1VrvyVjVKkqfoLI
	/uq+YE7V9C2aFsqzESv1Fj8g9m9HRKcdzJTBW9bH3NdrdwIjIpZNIT2e
X-Gm-Gg: AYBFou0kMyvxCn3/hc6AOOulyu9ISAYL30UFRl/Klm4ESFwtNMTSP//4eY/5RJsDyAK
	iuBELBSe8ycHGreyzP7RoJonpvf4peffwWYSGSYUF+2ZwVdcpL50db4N+pXbKfSrb2g9FGUfRSr
	Ugy7xTua0Cnotx9MY7T4kIAZkJS7o22jkwLRe6jgOUcdPIFWQ5oOgzyZaT6Fb98Fh/x56JqTUXc
	cQACMWDuMrN2cyfrP7zo7bC46Yd4miFjyGfvAeV0hYmeCgxNBaQjhGGlOIYdUVopFucnGbnRtoL
	WLG1YHSttE9PJyw+lKk4qtm180dlT9h1QMbEQTu/1NKuUNVEBF7BCY1sqi9FmlzrFv60GT5ZuBA
	TFBXvAGDO4SLxy4sCsGLmqNG6BThSxYvYVU4HHb30xsrQckevDG8aSwtL927ag3oCgm2DToZjW7
	KAinC+I0bftgSNys+WF1zIg+GZW+Bdki8H0GGV1E+QwQCTBMOEntgXEMRMeU+XCuopee8wFylEu
	896HJO1qgmkRBT6D1MINIvXAoU4yA4E5I+mwWUth6GmHMZ56kgEq5dR5mlGukkLcuNlcgUa6A77
	yqv7dcvTnLwOY7lfa58vCsNl2nZsi5XBDUMy2/mmp3vmpQ==
X-Received: by 2002:a05:6000:26c8:b0:48e:10a7:40f with SMTP id ffacd0b85a97d-48e6e302612mr29233891f8f.17.1793726872045;
        Tue, 03 Nov 2026 09:27:52 -0800 (PST)
Received: from localhost ([151.60.201.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm25764477f8f.9.2026.11.03.09.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:27:50 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=7bf7be77af3bb2ca970a31782cf12336c55eb4edcc365a7f2b8809684642;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 03 Nov 2026 18:27:48 +0100
Message-Id: <DMLR3VF6HEMW.34XWXBBJLV9A3@gmail.com>
Cc: "David Sterba" <dsterba@suse.com>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>,
 "Namjae Jeon" <linkinjeon@kernel.org>, "Sungjong Seo"
 <sj1557.seo@samsung.com>, "Konstantin Komarov"
 <almaz.alexandrovich@paragon-software.com>, "Chris Mason"
 <mason@kernel.org>, "Jan Kara" <jack@suse.cz>, "Yuezhang Mo"
 <yuezhang.mo@sony.com>, "Chuck Lever" <cel@kernel.org>, "Darrick J . Wong"
 <djwong@kernel.org>, "Sean Smith" <defendthedisabled@gmail.com>, "Andrey
 Albershteyn" <aalbersh@kernel.org>, "Pedro Falcato" <pfalcato@suse.de>,
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 <linux-btrfs@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <exfat@lists.linux.dev>,
 <ntfs3@lists.linux.dev>, <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v3 1/5] vfs: add provenance time (ptime)
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261101015551.786044-1-koray.fra@gmail.com>
 <20261101015551.786044-2-koray.fra@gmail.com>
 <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com>
 <DMLJ5DR2A4KZ.28U8XSZ0KFJTG@gmail.com>
 <CAOQ4uxiTS-QT7y1avNSasJSffkt2uRNkdrb2_GrK7kJ82-MoXw@mail.gmail.com>
In-Reply-To: <CAOQ4uxiTS-QT7y1avNSasJSffkt2uRNkdrb2_GrK7kJ82-MoXw@mail.gmail.com>

--7bf7be77af3bb2ca970a31782cf12336c55eb4edcc365a7f2b8809684642
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 3, 2026 at 4:14 PM CET, Amir Goldstein wrote:
> On Tue, Nov 3, 2026 at 12:13=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> On Mon Nov 2, 2026 at 3:00 PM CET, Amir Goldstein wrote:
>> > On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com=
> wrote:
>> >>
>> >> Add provenance time (ptime), indicating the time when a file or
>> >> directory was created. This is user-settable via file_setattr() and
>> >> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
>> >>
>> >> The semantics of when to preserve this new timestamp are the same as
>> >> mtime, the idea being that there is a correspondence like this:
>> >>
>> >> ctime <-> btime
>> >> mtime <-> ptime
>> >>
>> >> so every operation (copying, moving, ...) that currently preserves mt=
ime
>> >> should also preserve ptime.
>> >>
>> >> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
>> >> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
>> >> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr()=
 to
>> >> allow ptime to be used with the file_setattr()/file_getattr() syscall=
s.
>> >>
>> >> [ This is a re-implementation of the initial patch[1] by Sean Smith
>> >>   <defendthedisabled@gmail.com>, following the advice[2] from Darrick=
 J.
>> >>   Wong <djwong@kernel.org> of using file_setattr() instead of updatin=
g
>> >>   utimensat() ]
>> >>
>> >> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@=
gmail.com
>> >> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
>> >>
>> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
>> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> >> ---
>> >>  fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
>> >>  fs/stat.c                 |  2 ++
>> >>  include/linux/fileattr.h  |  5 +++++
>> >>  include/linux/stat.h      |  1 +
>> >>  include/uapi/linux/fs.h   |  8 +++++++-
>> >>  include/uapi/linux/stat.h |  7 ++++++-
>> >>  6 files changed, 52 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/fs/file_attr.c b/fs/file_attr.c
>> >> index 833e03810b24..c0645cb22bf3 100644
>> >> --- a/fs/file_attr.c
>> >> +++ b/fs/file_attr.c
>> >> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
>> >>  static void fileattr_to_file_attr(const struct file_kattr *fa,
>> >>                                   struct file_attr *fattr)
>> >>  {
>> >> -       __u32 mask =3D FS_XFLAGS_MASK;
>> >> +       __u32 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
>> >>
>> >>         memset(fattr, 0, sizeof(struct file_attr));
>> >>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
>> >> @@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct fi=
le_kattr *fa,
>> >>         fattr->fa_nextents =3D fa->fsx_nextents;
>> >>         fattr->fa_projid =3D fa->fsx_projid;
>> >>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
>> >> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
>> >> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
>> >>  }
>> >>
>> >>  /**
>> >> @@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
>> >>  static int file_attr_to_fileattr(const struct file_attr *fattr,
>> >>                                  struct file_kattr *fa)
>> >>  {
>> >> -       __u64 mask =3D FS_XFLAGS_MASK;
>> >> +       __u64 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
>> >
>> > That is not the correct way to extend this API.
>> > This fixed mask was added as a placeholder for
>> > "We intend to add support for more xflags to selective filesystems":
>> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-2-amir73i=
l@gmail.com/
>> >
>> > Please see this POC patch for filesystems to publish their supported
>> > xflags mask:
>> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-3-amir73i=
l@gmail.com/
>>
>> Thanks, I did not think of adding a dynamic mask like that, I will look
>> into it and implement it for v4.
>>
>> > This will allow callers of file_getattr() to know if the filesystem
>> > supports ptime
>> > without trying to set it and failing.
>>
>> So after adding fsx_xflags_mask to file_kattr, every filesystem would
>> populate fsx_xflags_mask with all the returned (=3D=3D supported) FS_XFL=
AG_*
>> in their own specific .fileattr_get, correct?
>
> Not all filesystems. Just the ones that wish to extend the constant
> legacy FS_XFLAGS_MASK.
> So just the ones that you change to support XFLAGS_PTIME

Ah ok yeah that makes more sense, so like the fileattr_has_fsx_mask()
(that checks if fa has fsx, ignoring the suppored/allowed ones specified
as second arg) that I added, but in the opposite way: "I advertise only
the extra fsx (so only 0 or FS_XFLAG_PTIME rn) that I support".

Thanks,
koraynilay

> Thanks,
> Amir.



--7bf7be77af3bb2ca970a31782cf12336c55eb4edcc365a7f2b8809684642
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCauoZlAAKCRA0bnTtJTDo
OBnVAP9J2oe3Q/z4+CIvNcDvvOtFdyX98jyvuqmiHKySHzb6XAD+N8QVNASksB7a
or/C2uBDgyHnZr93FRknmz2MMzGnvwQ=
=0YAO
-----END PGP SIGNATURE-----

--7bf7be77af3bb2ca970a31782cf12336c55eb4edcc365a7f2b8809684642--
