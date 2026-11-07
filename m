Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794071380;
	b=ECafIXnswrEoUVnXNFZ0jfpljG/gVJzEqOAqCwVI5aONFnZ/faBcSk3ZT8AStcztqDd6
	 PtUlqglm+lXybjidxm/ubF19YOewpJu3lyjJhl/2AGkLlFuzetVewqRyYHvWcGI/vHAAP
	 pSSvEvJ2cWCGhQgGk+/ogGXdyJusQ0S6KJh/L0j2Iy7mpItugkwH8xT/GykHH+JQzD2Ry
	 Z29VO9YYThS4BvVfbc/eb4Pq1j7Mr/X9LUSM8AIH5TNunylZDYtzw8/vpNIh/kyW4Bev4
	 NhX/UjuYQSVbVr9c3upFWG0w/Pri74ZbuQVbJHxbwo9wfXjNau6XdsG7R/t78t02htA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794071380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:X-Mailer:
	 References:In-Reply-To;
	bh=Uo6XeYcnV/x5wbpR7pZuFSSSODwH8TPy4AbG/hgvRWs=;
	b=cg85TJiOgG0/08bNmWpDabGwJAgAgbxguVOObQpYJuKh4QHSGo+geM3+fmyD9uOc5BZK
	 bV8B3QMd4dzbGZ6ocTH5EfZtYiVsJiD37V0C/g7Mi6vj45t1LuyuuQYC4wNB3SQhFVAss
	 yaeFSF3D4dCgcCsLjmTPVUzD9nGJMkecpp86S4c84kkpd+j7IeutPcU0oZAcYEg+xdaq/
	 WWSJ0K1g7GJstVOmcQ4E1KLmHoLA0K2NuSmanh+XAzOcx7TPBsl97s91QrTzoX1GLriQr
	 3+WXERe+olKJWr94hLkJwEABFKQM2po/FsJCkt6fM2cntEexMmlhy6W3pZcPR0O2U8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snYbPrhA;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B13606A32E
	for <exfat@lists.linux.dev>; Sat,  7 Nov 2026 17:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B13606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snYbPrhA
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so18366755e9.1
        for <exfat@lists.linux.dev>; Sat, 07 Nov 2026 09:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794071378; x=1794676178; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uo6XeYcnV/x5wbpR7pZuFSSSODwH8TPy4AbG/hgvRWs=;
        b=snYbPrhAuCS67P5cebxp7GqfPjO9zf2chcMHNbk9xgukbuZWrU/Tp+59jbtEndt6c+
         m10ufcYLJIEcUKKypNNzM8CNjzpejQ4rH7FhsHj/Ew/gQ7r38cEEhsdL88hFeoSoNL3q
         JE9Ivb4ca1cYQSTxPqdCVmG4SQ0ENR0/GCc4P4tGpCQ0isD1wNNxo7BEbnGFqzNm20YB
         W/H0+/btdhhdTPFKdH/rKrUz4wgipiozNuMzpcaDxdi/kAmtaGc7Yt2JwVTdbNfrBQko
         LnREBybdDP6U0tb+6lJwfCHPWosjh5cOq29L4dyqeiMtXoriXY69+PHVtnBHLRlWGOxb
         UUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794071378; x=1794676178;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uo6XeYcnV/x5wbpR7pZuFSSSODwH8TPy4AbG/hgvRWs=;
        b=hPIvG7BVE2qwI8xS/gwyol+qF0sxbm95I6kjL/kpHuYKsLbC434UX8iFJuKjt8scza
         6lxF5//5mUEGBQYyeA40b/8+eFhbzCpc228C8B/5cpuqt2GBZbpvvTfC0bAXJvLQ5vZb
         qBCrY/9oC15HGJPeSJLsBFW/tleunhYTIgBDrj5FmhBRrNOsYCKQE1jf1AD9NLnLMxuT
         jngejHIvujxpGM8QcpCJ2au4xsvusNJbtRwVyQWccAEBS/yWq9OAL4bmASvuifyo2WF2
         6fPJMb/1d7RuGgVeAzQLnjXLbZl8O1aFFv22Ue87+kAzGDsgYR7Z/wDx3ltNuB8utwqr
         NChw==
X-Forwarded-Encrypted: i=1; AKwUvBxTnqTfzPiZCTB9poL/HhnDmXLKTDj2KD0BW0Rtb8cAlPF6/b3wWEgchq7suds97KQYq6ex/g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8FWZWaWG8IoW2U2Ro1xXNNpUH258HbAIUqwls9pxTVTh5Mxbx1
	gM1PAdIOyxaReQwGnv7nlyiptl/Z37tSI1P4UBBkmEEN5Mmg7tUAFQAh
X-Gm-Gg: AYBFou1xE1B7zTYA44Hvr70lUAwn8j2OyK1pVu4W3fr2j4dJUZErU0JDZesdyugmBpv
	OzQMb6EHbRlt2nDespijtH5cvoDYvn8VlCNWDSpxxw3dXB6ra5ri0LVI79Zady9NuiayoVu7Oxh
	LVjLl25GtKZTQWPSHXXoNGXy9EC3KMp/Cmp03a4jB1T32efNb1G8jPOjLCHJ6xbCA9AGiOmuuh/
	or/OuVwL8ZkOaU2Dl9Fb+UZd7yAfRsB9HRmF15CZQru5ByEtPX+IBbIscVH6aiu6SIAKUX1vKOG
	2qRpQEoE+mwlowg21Xy5WKq0SLBAvmuG0TYItqQDX20kUHcFtN/myVNib3TsAX7lmexdsQn6uk7
	MxrFjLgpmttQo4onl37YbNyqRunRT8MTjT+cM/dDYpoy2n+jj08cyh8Em/Xdy6/79muvRQprhs6
	k2AIc/oIHyIMqC63QJZgAnS6rPyTPiBTyDkSEVjQavcJYJ2i0ADCeHyGXmKhRbD88xpCIrojPXY
	17m5K8jruxsCnM9BulKKJrM/Dlk6xJy5sm0J1gHbfDciCw+eLmGrsfv3Hg0R3oyQhcXry1N2RK8
	1gELp1CGiLPJWuWsYyn5QrWmLQ==
X-Received: by 2002:a05:600c:a013:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4b6df5eabebmr104412535e9.19.1794071378114;
        Sat, 07 Nov 2026 09:09:38 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm201380835e9.3.2026.11.07.09.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 09:09:37 -0800 (PST)
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
 boundary=90b72889c6b6179eb92b7fa762786d4ce0b6554dc9b311a78855b8ffacbe;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 07 Nov 2026 18:09:32 +0100
Message-Id: <DMP582BGB7DV.2U0SJLJL7A87K@gmail.com>
Subject: Re: [RFC PATCH v3 1/5] vfs: add provenance time (ptime)
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
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
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261101015551.786044-1-koray.fra@gmail.com>
 <20261101015551.786044-2-koray.fra@gmail.com>
 <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com>
 <DMP3UBB0QVOT.20HIXK7ZL6K6U@gmail.com>
 <CAOQ4uxgSVc8n1LbL_dcU-DpNN5BB-ap_vGdXEu7+d0Td7PK5Tw@mail.gmail.com>
In-Reply-To: <CAOQ4uxgSVc8n1LbL_dcU-DpNN5BB-ap_vGdXEu7+d0Td7PK5Tw@mail.gmail.com>

--90b72889c6b6179eb92b7fa762786d4ce0b6554dc9b311a78855b8ffacbe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Nov 7, 2026 at 5:48 PM CET, Amir Goldstein wrote:
> On Sat, Nov 7, 2026 at 5:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> w=
rote:
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
>> Quick quesiton, should _mask also be used for user-space -> VFS to adver=
tise
>> what it wants to change?
>> This would be useful for on/off flags, but for ptime both fa->xflags and
>> fa->xflags_mask would have the same meaning of "I want to change ptime,
>> look at fa->ptime".
>> Should we make _mask the only way to advertise what the user wants to
>> change, ignore xflags | PTIME in user-space -> VFS and use it only in FS
>> -> VFS -> user-space to say "this fs supports PTIME for this file"
>> (which will be always once support is added to an FS, so it would just
>> be "this FS supports PTIME")?
>>
>
> Sorry I was not able to parse your question.
>
> I think the mask should mean "this FS supports PTIME"
> regardless if the user asked to get/set it or not.

Yeah sorry, I'm just a bit confused because of all the similar names and
concepts.

(assuming btrfs supports ptime and ext4 doesn't)

* filesystem -> VFS -> user-space, while in fileattr_to_file_attr():

  for btrfs, for all files[1]:
        fa->fa_xflags & FS_XFLAG_PTIME =3D=3D 1
        fa->fa_xflags_mask & FS_XFLAG_PTIME =3D=3D 1

  for ext4, for all files:
        fa->fa_xflags & FS_XFLAG_PTIME =3D=3D 0
        fa->fa_xflags_mask & FS_XFLAG_PTIME =3D=3D 0

* user-space -> VFS -> filesystem, while in file_attr_to_fileattr():

        fattr->fa_xflags & FS_XFLAG_PTIME =3D=3D ignored
        fattr->fa_xflags_mask & FS_XFLAG_PTIME =3D=3D 1 if user wants to se=
t it, otherwise 0

Would this be correct?

Or would it be better to set FS_XFLAG_PTIME only in fa_xflags_mask, and
never touch fa_xflags with it, which would make the above become:


* filesystem -> VFS -> user-space, while in fileattr_to_file_attr():

  for btrfs, for all files[1]:
        fa->fa_xflags_mask & FS_XFLAG_PTIME =3D=3D 1

  for ext4, for all files:
        fa->fa_xflags_mask & FS_XFLAG_PTIME =3D=3D 0

  (and always fa->fa_xflags & FS_XFLAG_PTIME =3D=3D 0)

* user-space -> VFS -> filesystem, while in file_attr_to_fileattr():

        (fattr->fa_xflags & FS_XFLAG_PTIME =3D=3D ignored)
        fattr->fa_xflags_mask & FS_XFLAG_PTIME =3D=3D 1 if user wants to se=
t it, otherwise 0

This would mean that fa_xflags_mask is used like stx_mask both by the fs
(to let the user know what it supports (a.k.a. what it's returning)) and
by the user (to let the fs know what it's trying to set), and fa_xflags
is used only for ON/OFF flags (like immutable).

Let me know if it's clearer.

Thanks,
koraynilay

[1]: as we don't have a "no ptime" value (since 0 is a valid epoch), all
files would have it if the fs supports it

> Thanks,
> Amir.



--90b72889c6b6179eb92b7fa762786d4ce0b6554dc9b311a78855b8ffacbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCau9bTAAKCRDmj22qf5IG
XLOnAQCYgmkH9FcgSKhJkILhSIa5F/PVtSlv2NxQd9SmQy++kAD+O8Jm/L7wqEIX
9+esMnf9eYtazI3CTEE5wrzfACj7uQs=
=Jjnq
-----END PGP SIGNATURE-----

--90b72889c6b6179eb92b7fa762786d4ce0b6554dc9b311a78855b8ffacbe--
