Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718638;
	b=pyuZBvvYXjn0n0BdCSDFbgm2WAUBphOErzymeCCguCTjnJ8u97Y3QcTc9FaL6WGZ+y7g
	 YWprywPSH9nyMBKTStX0/6YreywggoGz7t9bNN+c/4EzyqSk+CzMsLsPc9tlIutawTODq
	 MyDDSsih8Ow2QRAqXmf9L4gDbeSnJZIaWSqNWTi6p79jYJXwc6OaHdQVefwDt0/BvMx/h
	 gr1ntI1mA7rOQrMkBWEPUegiSpX/sHYFpCJMQx09h3n6mXfmAPOcUMzUs3YlwKjSfw1c3
	 7m/y1XEBqcm/AITwsTdytc00YN31wHiBFskAKIXfJe26Tpt5r7uixHK+GvSZhsFUeDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7sE4JPqE1qSE0dDJji3oRyNIsowmIbXefj05D9f9GTA=;
	b=IBqK6ikS0cv3IGQeV3Qd78d2uBbMrNYIpXSY4ZkDHxj2qjxv3KBttrdi/v5rCKOR6ezP
	 hcWX6gfNWenH0UbVWHELiWEuDQsC1tmHiV1a4/0CblK04yC8/MkDvO5thSbJMu3UXBxWm
	 BLHhxEnQ6NEY7/WZWMwqaTTWwZZdkUYs0GpC5Wp6MAyF1II8a8pcpL5DM5ilWh1ut/mqu
	 uMxyp4wdEvJhm4bFoOzFuh2VtLDDp5kFr0Ze9oFiHI0D3vooxsjg8O0pmJTJPaJEeOeNs
	 gO4mU27uPs81/eisZ5/VUjWCl1sOgssdqSCDBD6knZyuXHebYdtvayrrF7NBdUW5wGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpelZgyT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08E2606BA38
	for <exfat@lists.linux.dev>; Tue,  3 Nov 2026 15:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E08E2606BA38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpelZgyT
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b4f7d3cd98so3526941a12.0
        for <exfat@lists.linux.dev>; Tue, 03 Nov 2026 07:10:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793718636; cv=none;
        d=google.com; s=arc-20260327;
        b=kELz0U53p/ZZvxUswnmZFTmVj5vcm+e/P+PslMQn5t6c+JgUDV2jzt8dcICibFkQU7
         1x+YCNxJj/7fNpamm/q4bgY+ODNZjs1MQO/q9c8/pdUl0LGREt1JWSqU+ivsaaU5kWHA
         LOc1fng9qHwEQ3FYpgecd1MAFQULAcV2BWkvBVgcbK2n9IiAq3U65p5h0vY+3F9Erw6Q
         jZmau4tReRorFTaoPIEjfaPdsvJ+yf2vK5FQer67wUO0IINcna+6lMR3GXpLkusxOBes
         KrM5q7/YgC1ahvT/yLw0iwB+O34jVx5qGfYPvERDL+MUlmAUa4CJAmCcUl5lCP2E8UF+
         H7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7sE4JPqE1qSE0dDJji3oRyNIsowmIbXefj05D9f9GTA=;
        fh=NlKVmJf6PZGoxoePPFze0BmeBwFsIi36kUYFDBsPJ3A=;
        b=HalV8o2qxfUsIhhvm+fy7ja3bPtA+9Bdi2P9LYQBHmJtx1vaEC/REo6JJEikr97LoB
         dyEulc6TpJ+7SvuGqjFimW6NhP/1BpDaGgQiYKykxnG+S5y8L93y/JamlIYB/T1rVhJt
         dNV5wvjhCC8XMFMVdGPMfmKAMhlnaoFNIiHZ6wUDIupxfVuyKfPbd3dGeb/y/AwXXJ9i
         pWpQvMz/ZlNnVSDsQt36V1gS39rkBqy4AZ8KWMS/RoYACQmtHW9AYdXrV+As1AY9A1sI
         4S+UbrxbLuQwWQUFCcryieac5ibSvzO1XwsJaYXPU/TYRLiAKl6Evvw7dq0vwDq9LOI1
         9thw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718636; x=1794323436; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7sE4JPqE1qSE0dDJji3oRyNIsowmIbXefj05D9f9GTA=;
        b=rpelZgyTBZ8GBjipBQ9AVswojZjejOSDYcPtqB8RDcnRk0QY4aB5NrUufh8Sq7oUQo
         vRq9NfLagMjzvfE5WqyCbcaVXE2mHe+ibuXcOboWTcrUCYvSMKSMf01cWkkUSwTezIgG
         tu8jDJPXJR9SnohHrNXMiZgkYySbaDc5Js4YAzPYf6wyCzIkGKXa7gKuAmrxE6LmXhTP
         1JRHqs8LWqizfxARAWsEmwOABmTrec9U31vXsfe1lvw/x1hQwiiXsIe5gWSkzGuG0OQI
         Oe47IHYbETxNNUHazI1sH520mwAwrSf6xP7leJIsf8QwX1xZp1aLL2fa/zMVltC+sWry
         mpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718636; x=1794323436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7sE4JPqE1qSE0dDJji3oRyNIsowmIbXefj05D9f9GTA=;
        b=t0lP78Onf775U46yzDR4Zjl5773blTQN5a0IUew05N0cLtWLIe3mJ05EeIBbZFUqq9
         MhgY/YH+Yi2m6JE9HysYDBKkf0eObUHzSOe4BnTgthnhUjuwPliWSCniXpn8oIvMEPlh
         lcwq9bSYD/59VGl7fHyxBJvGsrneDTEt3LqcYp/Itg52rkTBKeEv9gsBh6lZOaRCgFoo
         wlriCVhlTXGdZI6Agqb23ocQ3deovAj1W6tmiDIpC9nP0uLPqI4BJc6eOzEVcyMC1mIJ
         4gh4MtOQQYJ3FAf7lF+IKWWs0VVFCMuWSYWP1mi/kRrfkBWsKBFjccpjCwur/2QN3QU2
         xXcg==
X-Forwarded-Encrypted: i=1; AKwUvBwLpUP3yhkb/wanAN32zALhDL3F5KfWdt499Iyy/THgvHklR8ULDI/oPYk4Py4p/mGP1UBtzw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9SrDX7Rx5PXuzdFbhmq+2jBUKL8vHVJhxvK5i9vezAXmpA82Ml
	pa8kdbcO6OR2Gsmqnt2k3sjOLs10iCFIIdKGJ6ED969MsdDsIN8uSg8vp93o6l6gO20HYYA8Ufs
	s0b+4lnqaNWFUGousVHfsZuuG2I/MfxwgvbU694U=
X-Gm-Gg: AYBFou12sTbWUehnCQvH54Dr6UD5Zj0eXsQIfy3cYXdYTbGnbl5KixBGk5RBVZFJXrU
	BM5B8pWZJeC1LfjuwxOs3mqe9FYdnyO3KEs19Tt7pBerhKo/GwJfJY2upY2S4A7COtwnQ2v9ZdG
	gIYA4+USYvxsANkfu6L4PfCHjx2ph6ti6IXcLZ3E4n9zVPJ7fg26cM0MzF77RuCRb8ksmr5q7Jk
	ubAavaL3fo94Z5TBmWYxcOz4tW3L5BqZALyov++O7uiIvtjoJFdQqb+T1RleMDPVFajwnmfKrvJ
	6Yno67iLvX239bdTQqrkLd9lEU6JAQr+Vo6xLC6s5lZSJmvOSN8Vr0ftohWHWqofRppBimSq7tl
	aBU0QN/9HX32PU9P0GQuL74D/a4lvf7aouU5ryNM/7APU3DEdspQwiCgKP1t1b4hIBPzxfA==
X-Received: by 2002:a05:6402:1576:b0:6b4:2807:94db with SMTP id
 4fb4d7f45d1cf-6b4d63b89b4mr7276457a12.41.1793718635985; Tue, 03 Nov 2026
 07:10:35 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <20261101015551.786044-4-koray.fra@gmail.com>
 <20261102142452.d6jkitgdeuquy23i@pali> <CAOQ4uxhQ3uhq6s+4deEJAQV5iy8QZoucojR58_dUNYrnjt_yvA@mail.gmail.com>
 <20261102153845.d67wlorqcbe3c2w7@pali> <DD1A08F1-8F47-4612-A807-AEA39461AF9B@dilger.ca>
 <CAOQ4uxh8EDX5HzFFKWv10-mHYVcSC1zXN+BS2qCm5cTMq=GOCA@mail.gmail.com> <20261103094906.n55n5dhrpct5ykmw@pali>
In-Reply-To: <20261103094906.n55n5dhrpct5ykmw@pali>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Nov 2026 16:10:24 +0100
X-Gm-Features: AclHuK-nvjo0FA1uWKxpxW2jM-UILx8XEkVUZkdQkJAo4Tb9oLsdcVumIEFmEyo
Message-ID: <CAOQ4uxizEdR-MauSMOTfVcdxnuSMkrEuPth3nm3MsZuhcN5vjA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] ntfs3: make crtime user-settable using ptime
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Andreas Dilger <adilger@dilger.ca>, koraynilay <koray.fra@gmail.com>, 
	David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Chris Mason <mason@kernel.org>, 
	Jan Kara <jack@suse.cz>, Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <cel@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Sean Smith <defendthedisabled@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, Pedro Falcato <pfalcato@suse.de>, linux-btrfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	exfat@lists.linux.dev, ntfs3@lists.linux.dev, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:49=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
>
> On Tuesday 03 November 2026 09:23:32 Amir Goldstein wrote:
> > On Tue, Nov 3, 2026 at 2:19=E2=80=AFAM Andreas Dilger <adilger@dilger.c=
a> wrote:
> > >
> > > On Nov 2, 2026, at 09:38, Pali Roh=C3=A1r <pali@kernel.org> wrote:
> > > >
> > > > On Monday 02 November 2026 16:09:41 Amir Goldstein wrote:
> > > >> On Mon, Nov 2, 2026 at 3:24=E2=80=AFPM Pali Roh=C3=A1r <pali@kerne=
l.org> wrote:
> > > >>>
> > > >>> On Sunday 01 November 2026 02:55:49 koraynilay wrote:
> > > >>>> @@ -154,6 +158,11 @@ int ntfs_fileattr_set(const struct mnt_idma=
p *idmap, struct dentry *dentry,
> > > >>>>      if (flags & FS_APPEND_FL)
> > > >>>>              new_fl |=3D S_APPEND;
> > > >>>>
> > > >>>> +     if (fa->fsx_xflags & FS_XFLAG_PTIME) {
> > > >>>> +             ni->i_crtime.tv_sec =3D fa->fsx_ptime.tv_sec;
> > > >>>> +             ni->i_crtime.tv_nsec =3D fa->fsx_ptime.tv_nsec;
> > > >>>> +     }
> > > >>>> +
> > > >>>>      inode_set_flags(inode, new_fl, S_IMMUTABLE | S_APPEND);
> > > >>>>
> > > >>>>      /* Save nodump flag to return in ntfs_getattr. */
> > > >>>> @@ -275,8 +284,9 @@ int ntfs_getattr(const struct mnt_idmap *idm=
ap, const struct path *path,
> > > >>>>      if (unlikely(is_bad_ni(ni)))
> > > >>>>              return -EINVAL;
> > > >>>>
> > > >>>> -     stat->result_mask |=3D STATX_BTIME;
> > > >>>> +     stat->result_mask |=3D (STATX_BTIME | STATX_PTIME);
> > > >>>>      stat->btime =3D ni->i_crtime;
> > > >>>> +     stat->ptime =3D ni->i_crtime;
> > > >>>
> > > >>> For me this patch looks dangerous. Somehow I would expect that th=
e
> > > >>> "btime" will never change for existing inode.
> > > >>>
> > > >>> But because the ptime is mapped to i_crtime and ptime is settable=
 from
> > > >>> userspace, with this patch it is directly possible to change btim=
e.
> > > >>>
> > > >>>
> > > >>>
> > > >>> I was thinking more about it... Is not this just misunderstanding=
 of how
> > > >>> the security model around the times is working on different syste=
ms?
> > > >>> Because on NTFS there is stored just one field which says when th=
e file
> > > >>> was created. There are not two fields like "time set by user and =
time
> > > >>> set by system".
> > > >>>
> > > >>> Windows security model allows anybody with WRITE_ATTRIBUTES acces=
s to
> > > >>> change that create time. Linux security model does not allow to c=
hange it.
> > > >>>
> > > >>> NTFS in this view is just a filesystem like any other (ext4, btrf=
s, ...).
> > > >>> In my opinion if the ext4 or btrfs filesystem is correctly implem=
ented
> > > >>> on Windows systems, then Windows security model should handle it =
in the
> > > >>> same way like for NTFS or exFAT. So if something grants WRITE_ATT=
RIBUTES
> > > >>> access, then Windows should allow to change also btime on ext4 or=
 btrfs.
> > > >>>
> > > >>>
> > > >>>
> > > >>> On the other hand, I understand the use case to have two creation=
 times.
> > > >>> One time which would never be changed and could be used for any k=
ind of
> > > >>> atomic / synchronization by userspace application logic (this bti=
me).
> > > >>> And another time for human which can be changed at any time to an=
y value
> > > >>> which user wants (this ptime).
> > > >>>
> > > >>> In any case, I would suggest that filesystem driver would not rep=
ort to
> > > >>> userspace unsupported values and would not try to invent other va=
lues
> > > >>> and lying about them.
> > > >>
> > > >> But all those fs with mutable creation time already report it with=
 STATX_BTIME
> > > >> so what can we do about this?
> > > >
> > > > Well, what I wanted above to point out is that the "mutability" of
> > > > creation time is not feature of filesystem, but in my opinion rathe=
r
> > > > property of the security model on the running operating system.
> > > >
> > > > Maybe better question is: how ext4 btimes differs from the ntfs bti=
me?
> > > > In my opinion there is no much difference, both of them has meaning
> > > > "time when was the file created".
> > > >
> > > >> If userspace requests both STATX_BTIME|STATX_PTIME in mask arg,
> > > >> those fs could technically return only STATX_PTIME and it should n=
ot regress
> > > >> existing programs.
> > > >>
> > > >> But this is still a bit surprising behavior is it not?
> > > >>
> > > >> Thanks,
> > > >> Amir.
> > > >
> > > > I'm not sure what to do with it.
> > > >
> > > > If we allow to change btime of ntfs then for consistency we should =
also
> > > > allow to change btime of ext4.
> > > >
> > > > Maybe another idea... define new capability which would allow to ch=
ange
> > > > btime (on any filesystem)? This would at least make the consistency=
.
> >
> > Pali, I think this is a very bad idea.
>
> Ok, if the point is that ext4 btime must stay immutable then it is a bad =
idea.
>
> > This has nothing to do with capabilities.
> > The Windows and MacOS filesystems have allowed setting their
> > "creation time" forever
>
> FreeBSD for some fs allow it too (see below).
>
> > and for all the other Linux filesystems that had
> > "birth time" it was immutable, so let's not mix filesystem features
> > with capabilities.
>
> I think that it is important to first define behavior and invariants of
> these "btime" and "ptime" kernel properties.
>
> If we want to be consistent then there are two possible options:
>
> 1. If we choose that the STATX_BTIME is immutable then no kernel fs
>    driver should allow to change.
>
> 2. If we choose that the "NTFS create time" is reported via STATX_BTIME
>    then STATX_BTIME is not immutable at all.
>
> These two options cannot be chosen together because option 1 would
> implie that the modifiable "NTFS create time" cannot be reported over
> STATX_BTIME.
>
> We are have currently STATX_BTIME immutable and "NTFS create time"
> reported via STATX_BTIME.
>
> If we want to stay _consistent_ across fs drivers then adding API for
> changing "NTFS create time" would break one of those two things.
>
> In my opinion we should stay consistent across filesystem drivers and
> provide unified behavior of APIs independently of used filesystem.
> Otherwise userspace applications would have to write fs specific code
> for doing their use cases (and we can stay with fs-specific xattrs, no
> need to create unified APIs).
>
> Does it make sense? Or it is still a bad idea to think about it in this w=
ay?
>

My "bad idea" comment was only referring to capability.

w.r.t the STATX_BTIME ambiguity there is another option we may want to
consider: Don't publish STATX_PTIME via statx() at all.

One of the reasons that developers have pointed to fileattr as the right AP=
I
to host the creation time as well as the DOS attributes is that it has a hi=
story
of carrying filesystem specific attributes.

Not every attribute available in lsattr is also available in statx().
If projid is not available in statx() then the settable creation time
doesn't need to be in statx() either.

The file_[sg]etattr() syscalls provides a symmetric API to set/get it.

The same could be true to HIDDEN/ARCHIVE/SYSTEM flags if those
are added to fileattr.

Do we need to stop publishing NTFS creation time in STATX_BTIME?
I think it's too late for that and nobody is going to gain anything
from doing that.

Thanks,
Amir.
