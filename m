Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725671;
	b=MUUsTT9XgETUz7rPrE2flpXQvT43SqU3/+OfCvlc3Anbq2e9u1AmAHrSX87Jt5BY7n/m
	 xEeBMyamGFhTMegcx2dfHVkI/qfp6JL9cWR12bMAHaEC634sOYNdwxpdviHK8Zxxu2NPm
	 CIwsBtpYZa72yPSOyMgVnAdcdayU2j6ChAOJ/UV0SCnVgF/ZY1xC35pIy8M3VjN7Jxv/i
	 TtrS5cgRSKRCJByYOeNzCwMr6SQ7CauJReazXxRpedwNgTAxiLjwpFBUJ7f9/W8RWRP2T
	 suhx+hk1Xp24ZkfAlVtT9TbE5Gc+llVFXK7itqmoQVPbDGdGlP5L/7QMzRPoz1Ejuuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:X-Mailer:
	 References:In-Reply-To;
	bh=sbBBeL9FwNcs8isoaaS5jNhxkuwqK/l+rrUFmNYN+7A=;
	b=DST6+12hr5qI84VAkF2qFmFTMqda5nlzM7sEJPfgo3pjqHKpxzyJrxqlU9VKnSR6gYSz
	 6BGyQPwLUo1CXNUQtNyV4yPr6tuPyZc8QKlqlPR5BmfEf92bNUfo3E870h349vXjP6W1x
	 ENo3D3l9s/AAqI2JqPHkokp3xmSm/59J+SZomTD6VX8/YliEvuPBpMIce4Au/tgY2UTXn
	 fgD9lv4oPvL3XWdlP8hHY5GK/MSmOsA37NWX7CCWkRk7FfS+PvI87yH2vtELmhrC2DiwG
	 mXZZi5P1doUZca/3zgI5eUkU8KNDcEscVIWgNn7e4u+jyOoV+FdEzXGOjYH9yOaBp1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVm7J0ZK;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327CB606A339
	for <exfat@lists.linux.dev>; Tue,  3 Nov 2026 17:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 327CB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVm7J0ZK
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so4548548f8f.1
        for <exfat@lists.linux.dev>; Tue, 03 Nov 2026 09:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793725669; x=1794330469; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sbBBeL9FwNcs8isoaaS5jNhxkuwqK/l+rrUFmNYN+7A=;
        b=NVm7J0ZKzIz+BEBj3K1/MabVWGzWQ4qu6kvlCRBrZWNT9Oldoy9DvI5Tr1NdNG4qpw
         NnZHtPQgUdB6+qqKtAx5hX0FxgW5RP9QpRVzgoCS1V/OKcE0RWMvsjGT+h76CbCK8tUu
         ILmRC2n+bwfub4hQ8/ZjYnUN7SHWOQ3vrAD26uHSBMkfQBUi/fxzSSH6Jct8AJ6MisDl
         FTLKYAy2wpOEXK1MnQQksCm3yc1sLv18UVsdfPaVu+eZlmnyqq2QaVz11d7BPHRA9g6u
         keHQJfVDNikQlLIYgvKYae9AiQFgPgQNoWA1rwP+sShrZASN/S74s1GX9YqgqeBcztRM
         x9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725669; x=1794330469;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sbBBeL9FwNcs8isoaaS5jNhxkuwqK/l+rrUFmNYN+7A=;
        b=Y2rMznCgpLj720oxZrKBMAHD2SKiSyCGxovDYZw6Z9TxaiXpfWuiQpoWwFITh0cvtQ
         /JLOWvAQEMnxtQeKk7ljqQjorFvPEDKe63ZvTblIEH6nrSIl2SPTHLs3FQWkAqzUWdAn
         yDnsJRTzkDRxZvJmLGAzTfdqe1g1BlQJH68920rgkyX+ooYqFSU466m5NhPSBuWoKYhu
         4L/ys/Bp46RyByGll49E74Q3meG4VVznAD4sGm6mGQSlRW6DGxGwir20c1+vW3pRnTvs
         XVvWekvkXFycadeQnEG8qw78K5JiTbD/oezcdgo8dSj54KpcDVLOWpv4seToVgz91zKn
         OYug==
X-Forwarded-Encrypted: i=1; AKwUvBzymkyLgEoi0cATNVSPTswwwF5ofGMqo1HdYYgig6NJ89OBxT2fYyyrlGmfL2G0dAbdjeBCgQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+0WE5LFAV9hEeli0rXeJjwmtjJM70rRziQaxo+4KehKsNSwbcR
	osGFGGu6tInaZc8hthE4Rlg6VA1iXUKSmGYw6nNQlNINSh90HJCur9CB
X-Gm-Gg: AYBFou3j7iJaP6TtMLE5GiIbAPArG9p8YBuD8/GIW6XcC+YS1V259GxiK4x9mRa8kyg
	9GXAPJ86q0k0vSnZNkHQ25BkUSiXfn/S43cerpj3qIuzPo5MoThOFReX/P3hmkfohY0U41HusN4
	55OSlJMpa2cIwzLbyo5SnlWCaQoEDz3l68/Hi+Yi/YK0jEg34oTZAwlPaPNFDMtVRI1uK/2Cb/o
	diUcB3vphSa/nnrhDLR2CLVhgjOVi3vaStX9Fw9qywkoYSuZLW87DGmzMjVmbNWB2FNOonFypx8
	EYhaVf74a/xnc3nMOO7pqOYfbljuCc7EpRbodR4N/KGSnfGt4uRTI+kZy57ioTiupx3jeUXHjXN
	8g3ZYq3aeAKaNwMliHtT+pNJRUotxSoUJa8S6sHw8ratpHqTrVY+0sAirMBydDS4EC8KhUB395y
	33BNOpVUrcrdY3CRfDZIFIyiaeG7UauuzEa/7enZc0x5oM3lLYdAZwsmhNneIEMh3VPMiTZxe3z
	E1G2noQfAMm/udio3LsRXu3ticL1gJJKY3XKTeeA5YPBCyiPuCJ82HZL0gaKyJYyRnbl9h4Osm6
	Fhxa1T5u+U5jFOP6ouXLQ1ZLRw==
X-Received: by 2002:a05:600c:3b09:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4b14017c507mr134378295e9.20.1793725669031;
        Tue, 03 Nov 2026 09:07:49 -0800 (PST)
Received: from localhost ([151.60.201.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a66caefsm286352155e9.5.2026.11.03.09.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:07:47 -0800 (PST)
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
 boundary=765487391675193c01a2810812621c4a1fd65a1637755f1280332809fdcb;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 03 Nov 2026 18:07:43 +0100
Message-Id: <DMLQOHTQ5UV5.32Z3QPMCWLPOS@gmail.com>
Subject: Re: [RFC PATCH v3 3/5] ntfs3: make crtime user-settable using ptime
From: "koraynilay" <koray.fra@gmail.com>
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "Amir Goldstein"
 <amir73il@gmail.com>
Cc: "Andreas Dilger" <adilger@dilger.ca>, "koraynilay"
 <koray.fra@gmail.com>, "David Sterba" <dsterba@suse.com>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>,
 "Namjae Jeon" <linkinjeon@kernel.org>, "Sungjong Seo"
 <sj1557.seo@samsung.com>, "Konstantin Komarov"
 <almaz.alexandrovich@paragon-software.com>, "Chris Mason"
 <mason@kernel.org>, "Jan Kara" <jack@suse.cz>, "Yuezhang Mo"
 <yuezhang.mo@sony.com>, "Chuck Lever" <cel@kernel.org>, "Darrick J . Wong"
 <djwong@kernel.org>, "Sean Smith" <defendthedisabled@gmail.com>, "Andrey
 Albershteyn" <aalbersh@kernel.org>, "Pedro Falcato" <pfalcato@suse.de>,
 <linux-btrfs@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <exfat@lists.linux.dev>,
 <ntfs3@lists.linux.dev>, <linux-api@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261101015551.786044-1-koray.fra@gmail.com>
 <20261101015551.786044-4-koray.fra@gmail.com>
 <20261102142452.d6jkitgdeuquy23i@pali>
 <CAOQ4uxhQ3uhq6s+4deEJAQV5iy8QZoucojR58_dUNYrnjt_yvA@mail.gmail.com>
 <20261102153845.d67wlorqcbe3c2w7@pali>
 <DD1A08F1-8F47-4612-A807-AEA39461AF9B@dilger.ca>
 <CAOQ4uxh8EDX5HzFFKWv10-mHYVcSC1zXN+BS2qCm5cTMq=GOCA@mail.gmail.com>
 <20261103094906.n55n5dhrpct5ykmw@pali>
 <CAOQ4uxizEdR-MauSMOTfVcdxnuSMkrEuPth3nm3MsZuhcN5vjA@mail.gmail.com>
 <20261103152515.svzvdugqxrwpz5ju@pali>
In-Reply-To: <20261103152515.svzvdugqxrwpz5ju@pali>

--765487391675193c01a2810812621c4a1fd65a1637755f1280332809fdcb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 3, 2026 at 4:25 PM CET, Pali Roh=C3=A1r wrote:
> On Tuesday 03 November 2026 16:10:24 Amir Goldstein wrote:
>> On Tue, Nov 3, 2026 at 10:49=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org=
> wrote:
>> >
>> > On Tuesday 03 November 2026 09:23:32 Amir Goldstein wrote:
>> > > On Tue, Nov 3, 2026 at 2:19=E2=80=AFAM Andreas Dilger <adilger@dilge=
r.ca> wrote:
>> > > >
>> > > > On Nov 2, 2026, at 09:38, Pali Roh=C3=A1r <pali@kernel.org> wrote:
>> > > > >
>> > > > > On Monday 02 November 2026 16:09:41 Amir Goldstein wrote:
>> > > > >> On Mon, Nov 2, 2026 at 3:24=E2=80=AFPM Pali Roh=C3=A1r <pali@ke=
rnel.org> wrote:
>> > > > >>>
>> > > > >>> On Sunday 01 November 2026 02:55:49 koraynilay wrote:
>> > > > >>>> @@ -154,6 +158,11 @@ int ntfs_fileattr_set(const struct mnt_i=
dmap *idmap, struct dentry *dentry,
>> > > > >>>>      if (flags & FS_APPEND_FL)
>> > > > >>>>              new_fl |=3D S_APPEND;
>> > > > >>>>
>> > > > >>>> +     if (fa->fsx_xflags & FS_XFLAG_PTIME) {
>> > > > >>>> +             ni->i_crtime.tv_sec =3D fa->fsx_ptime.tv_sec;
>> > > > >>>> +             ni->i_crtime.tv_nsec =3D fa->fsx_ptime.tv_nsec;
>> > > > >>>> +     }
>> > > > >>>> +
>> > > > >>>>      inode_set_flags(inode, new_fl, S_IMMUTABLE | S_APPEND);
>> > > > >>>>
>> > > > >>>>      /* Save nodump flag to return in ntfs_getattr. */
>> > > > >>>> @@ -275,8 +284,9 @@ int ntfs_getattr(const struct mnt_idmap *=
idmap, const struct path *path,
>> > > > >>>>      if (unlikely(is_bad_ni(ni)))
>> > > > >>>>              return -EINVAL;
>> > > > >>>>
>> > > > >>>> -     stat->result_mask |=3D STATX_BTIME;
>> > > > >>>> +     stat->result_mask |=3D (STATX_BTIME | STATX_PTIME);
>> > > > >>>>      stat->btime =3D ni->i_crtime;
>> > > > >>>> +     stat->ptime =3D ni->i_crtime;
>> > > > >>>
>> > > > >>> For me this patch looks dangerous. Somehow I would expect that=
 the
>> > > > >>> "btime" will never change for existing inode.
>> > > > >>>
>> > > > >>> But because the ptime is mapped to i_crtime and ptime is setta=
ble from
>> > > > >>> userspace, with this patch it is directly possible to change b=
time.
>> > > > >>>
>> > > > >>>
>> > > > >>>
>> > > > >>> I was thinking more about it... Is not this just misunderstand=
ing of how
>> > > > >>> the security model around the times is working on different sy=
stems?
>> > > > >>> Because on NTFS there is stored just one field which says when=
 the file
>> > > > >>> was created. There are not two fields like "time set by user a=
nd time
>> > > > >>> set by system".
>> > > > >>>
>> > > > >>> Windows security model allows anybody with WRITE_ATTRIBUTES ac=
cess to
>> > > > >>> change that create time. Linux security model does not allow t=
o change it.
>> > > > >>>
>> > > > >>> NTFS in this view is just a filesystem like any other (ext4, b=
trfs, ...).
>> > > > >>> In my opinion if the ext4 or btrfs filesystem is correctly imp=
lemented
>> > > > >>> on Windows systems, then Windows security model should handle =
it in the
>> > > > >>> same way like for NTFS or exFAT. So if something grants WRITE_=
ATTRIBUTES
>> > > > >>> access, then Windows should allow to change also btime on ext4=
 or btrfs.
>> > > > >>>
>> > > > >>>
>> > > > >>>
>> > > > >>> On the other hand, I understand the use case to have two creat=
ion times.
>> > > > >>> One time which would never be changed and could be used for an=
y kind of
>> > > > >>> atomic / synchronization by userspace application logic (this =
btime).
>> > > > >>> And another time for human which can be changed at any time to=
 any value
>> > > > >>> which user wants (this ptime).
>> > > > >>>
>> > > > >>> In any case, I would suggest that filesystem driver would not =
report to
>> > > > >>> userspace unsupported values and would not try to invent other=
 values
>> > > > >>> and lying about them.
>> > > > >>
>> > > > >> But all those fs with mutable creation time already report it w=
ith STATX_BTIME
>> > > > >> so what can we do about this?
>> > > > >
>> > > > > Well, what I wanted above to point out is that the "mutability" =
of
>> > > > > creation time is not feature of filesystem, but in my opinion ra=
ther
>> > > > > property of the security model on the running operating system.
>> > > > >
>> > > > > Maybe better question is: how ext4 btimes differs from the ntfs =
btime?
>> > > > > In my opinion there is no much difference, both of them has mean=
ing
>> > > > > "time when was the file created".
>> > > > >
>> > > > >> If userspace requests both STATX_BTIME|STATX_PTIME in mask arg,
>> > > > >> those fs could technically return only STATX_PTIME and it shoul=
d not regress
>> > > > >> existing programs.
>> > > > >>
>> > > > >> But this is still a bit surprising behavior is it not?
>> > > > >>
>> > > > >> Thanks,
>> > > > >> Amir.
>> > > > >
>> > > > > I'm not sure what to do with it.
>> > > > >
>> > > > > If we allow to change btime of ntfs then for consistency we shou=
ld also
>> > > > > allow to change btime of ext4.
>> > > > >
>> > > > > Maybe another idea... define new capability which would allow to=
 change
>> > > > > btime (on any filesystem)? This would at least make the consiste=
ncy.
>> > >
>> > > Pali, I think this is a very bad idea.
>> >
>> > Ok, if the point is that ext4 btime must stay immutable then it is a b=
ad idea.
>> >
>> > > This has nothing to do with capabilities.
>> > > The Windows and MacOS filesystems have allowed setting their
>> > > "creation time" forever
>> >
>> > FreeBSD for some fs allow it too (see below).
>> >
>> > > and for all the other Linux filesystems that had
>> > > "birth time" it was immutable, so let's not mix filesystem features
>> > > with capabilities.
>> >
>> > I think that it is important to first define behavior and invariants o=
f
>> > these "btime" and "ptime" kernel properties.
>> >
>> > If we want to be consistent then there are two possible options:
>> >
>> > 1. If we choose that the STATX_BTIME is immutable then no kernel fs
>> >    driver should allow to change.
>> >
>> > 2. If we choose that the "NTFS create time" is reported via STATX_BTIM=
E
>> >    then STATX_BTIME is not immutable at all.
>> >
>> > These two options cannot be chosen together because option 1 would
>> > implie that the modifiable "NTFS create time" cannot be reported over
>> > STATX_BTIME.
>> >
>> > We are have currently STATX_BTIME immutable and "NTFS create time"
>> > reported via STATX_BTIME.
>> >
>> > If we want to stay _consistent_ across fs drivers then adding API for
>> > changing "NTFS create time" would break one of those two things.
>> >
>> > In my opinion we should stay consistent across filesystem drivers and
>> > provide unified behavior of APIs independently of used filesystem.
>> > Otherwise userspace applications would have to write fs specific code
>> > for doing their use cases (and we can stay with fs-specific xattrs, no
>> > need to create unified APIs).
>> >
>> > Does it make sense? Or it is still a bad idea to think about it in thi=
s way?
>> >
>>=20
>> My "bad idea" comment was only referring to capability.
>>=20
>> w.r.t the STATX_BTIME ambiguity there is another option we may want to
>> consider: Don't publish STATX_PTIME via statx() at all.
>>=20
>> One of the reasons that developers have pointed to fileattr as the right=
 API
>> to host the creation time as well as the DOS attributes is that it has a=
 history
>> of carrying filesystem specific attributes.
>>=20
>> Not every attribute available in lsattr is also available in statx().
>> If projid is not available in statx() then the settable creation time
>> doesn't need to be in statx() either.
>>=20
>> The file_[sg]etattr() syscalls provides a symmetric API to set/get it.
>>=20
>> The same could be true to HIDDEN/ARCHIVE/SYSTEM flags if those
>> are added to fileattr.
>>=20
>> Do we need to stop publishing NTFS creation time in STATX_BTIME?
>> I think it's too late for that and nobody is going to gain anything
>> from doing that.
>>=20
>> Thanks,
>> Amir.
>
> Kernel NTFS driver changed more times, so I would not say that it is too
> late to stop publishing NTFS creation time in STATX_BTIME, and start
> publishing it in STATX_PTIME.
>
>
> Anyway, I have another idea (if stopping publishing of NTFS is not possib=
le):
> Let fs drivers to fill ptime and btime members only when fs itself
> supports particular field (ext4 would fill only btime, nfts would fill
> only ptime; btrfs with patch would fill both). For userspace STATX_BTIME
> request, VFS will copy ptime to btime if the btime is not provided.
> For userspace STATX_PTIME request or STATX_BTIME|STATX_PTIME request,
> the VFS will not do this copy. Or We can introduce new flag
> STATX_NO_FAKE_BTIME (just random name for now) and this would cause that
> the ptime would not be copied to btime (so it would not be needed to
> misuse STATX_BTIME|STATX_PTIME). The logic would be unified in VFS
> layer, not in the fs drivers.

I feel like this would be a bit of an over-complication/not clear
enough, as we would merge a lot more of the meaning of btime and ptime,
while you would never return mtime when userspace asks for  ctime (I
think?).

But maybe it could make sense as a compromise to not break userspace too
much.


Best,
koraynilay

--765487391675193c01a2810812621c4a1fd65a1637755f1280332809fdcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCauoU3wAKCRA0bnTtJTDo
OE/bAP4totYbTaeW1CrdoWanatGI8Xs7nwRhpOXfUQOLfIfAIAD/epBBEKW49pOz
UccPyppm1LJkU4ZUjjXBG917JI4mdA8=
=vhHD
-----END PGP SIGNATURE-----

--765487391675193c01a2810812621c4a1fd65a1637755f1280332809fdcb--
