Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181641;
	b=qrT7zPAaJG9kz+Fzh/Wgfx5XOzIdihjScZoNSYofjfE22M64vZl7gEtoCA+cujDEET5I
	 Mt7xJYIXRhxjhfNGdwMCUxjj06NFohF+sSDpabBxsO9vCQiQ+Yckx2qxHu5IJvXcVFeDz
	 +Pxaya2y8qDa58GYdFYAWo2wyYxJU1A4iSaaZhB8qjWkl/xctRYQfOe+z8NC6y556RzKv
	 cv0DtqukTJ3makruJfk/T1W3Zg4JMeWOt3stPOEn2gOFjAds7MJFMcZZiG7TY0+FxKhCi
	 jUjycxSc9dJDdlmsJR1P11sGUrPKi7VL/k67gBzW5DbZDS+Z6sX0CQ+JmZUXcRjl7vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:X-Mailer:
	 References:In-Reply-To;
	bh=/tgGW37WPbOQT+N8dT1q60bLbw3ltn29ONzKHbalNio=;
	b=z/78VCQ4wrFeZ2ynYo0rCmbBEDlJUR16hQqbR/0Do49fHcCFNdx8qZ70YsDygKp+04g/
	 iqXFzfVryDkcNOd9stsGoYkZfHU1tl4zP+CxOqluOF6lezNEC7Qnt6bE2yRleKc5a3JX3
	 XwcYENeRtPKPR1RXnfb5/5CbX4GeagCGy7ZUOsfG9Lvv2D+FZfEXEAMEIkXYrU0IlZZhB
	 KZzclZ8mkAe7Z/Id9d/Brhk6YdomclBns45jlCK+LNNebgEUYVuUl7ApYpzCBXX2I1dLH
	 G50b3AJB4hJivvr7ik4yeJV52gL5QudzU7HP1MguOEMpvy2xR9NmbPfJaiqCt18DBvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6SgGQtH;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF4E606A320
	for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 13:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF4E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E6SgGQtH
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a357b1c649so452126f8f.3
        for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 05:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795181640; x=1795786440; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/tgGW37WPbOQT+N8dT1q60bLbw3ltn29ONzKHbalNio=;
        b=E6SgGQtHN34MFlZN3YSK/I9JaPuPQ/fspNGf/EPrQvCsZJZwBiz2S5BoTzodShkyB3
         HpHtyrzw33P+binStpZleX+LJMXfcfPGRkwfE/4tMmhPQ7n3KXXJNki3L40JnIR85dFg
         bBBuDPV6IogFarEJXA+ayiZiZI9oEMJM4JR/CAcXGa9ptLGRsQkPvdekk1NacP1Dw/58
         YmlWU0i5Wa0fymjTMbEoTWnJjU7h1gUlpiuG6oC5qe8VuW+hCJZVTV9HOeSFsh4fxaGt
         J3piTcDz0WMHDjL02uwWC++9PSLFTx6uIw+CjFT0ahfuPkE1XTKSg8dh2zr1XmGhWQfe
         XCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181640; x=1795786440;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/tgGW37WPbOQT+N8dT1q60bLbw3ltn29ONzKHbalNio=;
        b=rNULb39EDGMMXWB4Qxc425iiGd8jV5FzRGJ76sot+aOQxSrrRDqLUskHeGuaqS+6pv
         wxf2r+BG4z74g94iz3RAAWf9XI7uBokctY82Yz4FG0C8pcjjNxUP9pEMOTGvLJEFjwDc
         HikihDMS3/g8B4kO9gTZfitwgJwWtC+LpZxy/DX3LjTydZ//DRFJv4XUn9dncQqccKNG
         2Dt5I4WxbzpZmZsegqs60xA2Y+s+I6YvW2QH2yG8bcsTpJa7t2NuY5pD+YFH9ejQzWTz
         PQ5BkHZrk6c0vEIW+WEMnM3o3O9+LniCDgSFEuCeaaUUCDwmahz2VdptKemfcOiL9vVd
         tyCQ==
X-Forwarded-Encrypted: i=1; AL+hErH78VFHXp4uZGrnLOulAAg59nxLMrsYEQNGQHqfhDDworfbjut+t2ByvcSiUHWJM4bficzaRw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/oOUw/jLLT8RaFA2p5u1j1oJWU1TiQR3wlGlzxMNXXKwfc3Cg9
	RkspHznN3IXAB0jDfFHRmU3dItdXuGrNRI9/W4S5Gw6KDgUnHBe+Y/bq
X-Gm-Gg: AZFdTZfpz9E2IAo7yEHRgvrqBgGxk9w+4SI8VqzEb+u8acj8M/Wv+MbJK0iFYRNC/EC
	Qqp1t3GNJ2s3rmYsUy+EfcVwgjH3LDcAnbtl6Ene//1SA9grjQ3KzdRZ/Ev8mVTWXOobv6YWXye
	+ZzS/+E/5j2clH4WmiZktVvGR10w8O0h0n0qm7TwszrBj2uXN3xj4lwHWkL7WvyAW8yVKv7WGMh
	ZqeZdE31MN19ifX4bIUlU74iKYdqH2kjs4gQuZaNnUnFmQ1Xupfe+u0kZ8XgiQyZoPN3XuozjNT
	YJujS683Ea6bETJRNR7PVV+tQ7Y2qzShEKjVRaYU8h+pti1azb2qDTLkWBUbaFjSDLxE7JHm4az
	KZRIgpDPiSc9pMw60RQKEv13NboNalvP65bNfTCGUOilXnMifLZrjo0DLJguJX681dMfWwFdC0Z
	B8OcH+qFwVUxNk45ewDuDbl0KbpBYq1jmmYlHEBHdQnXaXXInc8w0SBMIJBk8yAH9U3wM+X7HJa
	MOCGp+ut94yIttA92x29bMPLRCvPDpVKUybDCtRpcJi/cwe7UOF6Lz8eKvyCWj/YU0QgbSxHP17
	kqAn/wCMr0V+5vmS1y5SIg7N9qhBB+tTqT08tY0jDrJ7FkNKOA7DSgCgcd87jyfEiQ8xyg==
X-Received: by 2002:a05:6000:299c:20b0:4aa:2bf2:4d98 with SMTP id ffacd0b85a97d-4abb0f3b4b0mr4807067f8f.29.1795181639710;
        Fri, 20 Nov 2026 05:33:59 -0800 (PST)
Received: from localhost ([130.192.98.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm6332019f8f.24.2026.11.20.05.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:33:58 -0800 (PST)
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
 boundary=d4d0a5d1810b38e9a5b5d406e137fc7cd12d6afa0f1bd49929aebcd96cb5;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 20 Nov 2026 14:33:56 +0100
Message-Id: <DN02S2XNGRZD.1KNOZJ0GGDJNG@gmail.com>
Subject: Re: [RFC PATCH v4 08/10] nfs: add provenance time (ptime) via
 FATTR4_TIME_CREATE
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
Cc: "David Sterba" <dsterba@suse.com>, "Namjae Jeon"
 <linkinjeon@kernel.org>, "Sungjong Seo" <sj1557.seo@samsung.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian Brauner"
 <brauner@kernel.org>, "Trond Myklebust" <trondmy@kernel.org>, "Anna
 Schumaker" <anna@kernel.org>, "Chuck Lever" <cel@kernel.org>, "Jeff Layton"
 <jlayton@kernel.org>, "Konstantin Komarov"
 <almaz.alexandrovich@paragon-software.com>, "Paulo Alcantara"
 <pc@manguebit.org>, "Chris Mason" <mason@kernel.org>, "Yuezhang Mo"
 <yuezhang.mo@sony.com>, "Jan Kara" <jack@suse.cz>, "NeilBrown"
 <neil@brown.name>, "Olga Kornievskaia" <okorniev@redhat.com>, "Dai Ngo"
 <Dai.Ngo@oracle.com>, "Tom Talpey" <tom@talpey.com>, "Ronnie Sahlberg"
 <ronniesahlberg@gmail.com>, "Shyam Prasad N" <sprasad@microsoft.com>,
 "Bharath SM" <bharathsm@microsoft.com>, "Sergey Senozhatsky"
 <senozhatsky@chromium.org>, "ChenXiaoSong" <chenxiaosong@chenxiaosong.com>,
 "Darrick J . Wong" <djwong@kernel.org>, "Sean Smith"
 <defendthedisabled@gmail.com>, "Andrey Albershteyn" <aalbersh@kernel.org>,
 "Pedro Falcato" <pfalcato@suse.de>, =?utf-8?q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <exfat@lists.linux.dev>, <ntfs3@lists.linux.dev>,
 <linux-cifs@vger.kernel.org>, <linux-nfs@vger.kernel.org>,
 <linux-api@vger.kernel.org>, "Theodore Tso" <tytso@mit.edu>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-9-koray.fra@gmail.com>
 <CAOQ4uxgoNsOH82FyrCxc+qSoid_CFmbmpL0qgWFw-e8E689fFA@mail.gmail.com>
 <DMZJ4PL1JVA4.2YEB7EPYJR5Q7@gmail.com>
 <CAOQ4uxi6h9BBP7pf4sR+gc2+4XtkEgbxXZha45iZzdB_wGFVgQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxi6h9BBP7pf4sR+gc2+4XtkEgbxXZha45iZzdB_wGFVgQ@mail.gmail.com>

--d4d0a5d1810b38e9a5b5d406e137fc7cd12d6afa0f1bd49929aebcd96cb5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 20, 2026 at 7:45 AM CET, Amir Goldstein wrote:
> On Thu, Nov 19, 2026 at 11:10=E2=80=AFPM koraynilay <koray.fra@gmail.com>=
 wrote:
>>
>> On Thu Nov 19, 2026 at 7:06 PM CET, Amir Goldstein wrote:
>> > On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.co=
m> wrote:
>> >>
>> >> Implement provenance time (ptime) in the NFS client, as introduced in=
 a
>> >> previous commit ("vfs: add provenance time (ptime)").
>> >> [...]
>> >>         if (do_update) {
>> >> @@ -1061,6 +1061,7 @@ int nfs_getattr(const struct mnt_idmap *idmap, =
const struct path *path,
>> >>         if (S_ISDIR(inode->i_mode))
>> >>                 stat->blksize =3D NFS_SERVER(inode)->dtsize;
>> >>         stat->btime =3D NFS_I(inode)->btime;
>> >> +       stat->ptime =3D NFS_I(inode)->btime;
>> >>
>> >
>> > As an example of what would be needed per the mutable btime proposal,
>> > adding stat->ptime and STATX_PTIME will not be needed...
>> >
>> >>         /* Special handling for STATX_DIOALIGN and STATX_DIO_READ_ALI=
GN
>> >>          * - NFS doesn't have DIO alignment constraints, avoid gettin=
g
>> >> @@ -1092,10 +1093,26 @@ int nfs_fileattr_get(struct dentry *dentry, s=
truct file_kattr *fa)
>> >>         }
>> >>         if (nfs_server_capable(inode, NFS_CAP_CASE_NONPRESERVING))
>> >>                 fa->fsx_xflags |=3D FS_XFLAG_CASENONPRESERVING;
>> >
>> > This would need:
>> >                   fa->fsx_xflags |=3D FS_XFLAG_CASEFOLD;
>> > +                fa->fsx_xflags_mask |=3D FS_XFLAG_CASEFOLD;
>> > +                fa->fsx_xflags_ro_mask |=3D FS_XFLAG_CASEFOLD;
>> > +                /* unlink other fs FS_CASEFOLD_FL is read-only */
>> (oh, s/unlink/unlike/?)
>
> Yeh :)
> It's a comment for you not for the code
>
>>
>> >                   fa->flags |=3D FS_CASEFOLD_FL;
>> With the new API and vfs helpers, this would need to get removed, as vfs
>> would already handle this for legacy ioctls, correct?
>>
>> >         }
>> >                    fa->fsx_xflags |=3D FS_XFLAG_CASENONPRESERVING;
>> > +                 fa->fsx_xflags_mask |=3D FS_XFLAG_CASENONPRESERVING;
>> > +                 fa->fsx_xflags_ro_mask |=3D FS_XFLAG_CASENONPRESERVI=
NG;
>> Uhm, why both in _mask and _ro_mask? If it's a RDONLY flag shouldn't
>> it *only* be in _ro_mask? (same for CASEFOLD)
>>
>
> Good question. Maybe
> I guess if you want to follow some percent
> FS_FL_USER_MODIFIABLE is a subset of FS_FL_USER_VISIBLE
> but I think that exporting ro_mask and _mask is going to be easier and
> cleaner than rw_mask but not sure.

Hmm I asked that also because you said in the xfs shared extent thread:

> The advantage being that it makes the interface symmetric.
> User can alway setattr() with the buffer they got from getattr()
> and instead of randomly ignoring flags in set, the fsx_ro_mask
> along with fsx_mask defines the behavior exactly.

But by putting the ro flags in _mask too, a user would have to clean
them out or vfs will reject the call with -EINVAL/something else, since
in that case the vfs would see the user say "I want to change this [ro]
flag".

>> >> +       if (NFS_SERVER(inode)->fattr_valid & NFS_ATTR_FATTR_BTIME) {
>> >> +               fa->fsx_xflags |=3D FS_XFLAG_PTIME;
>> >> +               fa->fsx_xflags_mask |=3D FS_XFLAG_PTIME;
>> >> +               fa->fsx_ptime =3D NFS_I(inode)->btime;
>> >> +       }
>> >
>> > +               fa->fsx_xflags |=3D FS_XFLAG_BTIME;
>> > +               fa->fsx_xflags_mask |=3D FS_XFLAG_BTIME;
>> > +               fa->fsx_btime =3D NFS_I(inode)->btime;
>> >
>> > Fs with immutable btime could either not advertise the BTIME flag
>> > in xflags/xflags_mask or advertise the flag also in xflags_ro_mask.
>>
>> That makes sense.
>>
>> >>         return 0;
>> >>  }
>> >>  EXPORT_SYMBOL_GPL(nfs_fileattr_get);
>> >>
>> >> +int nfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *d=
entry,
>> >> [...]
>> >> +       if (!(server->fattr_valid & NFS_ATTR_FATTR_BTIME))
>> >> +               return -EOPNOTSUPP;
>> >> +
>> >> +       if (fa->flags_valid)
>> >> +               return -EOPNOTSUPP;
>> >> +
>> >> +       if (fileattr_has_fsx_mask(fa, NFS4_SUPPORTED_XFLAGS))
>> >> +               return -EOPNOTSUPP;
>> >> +
>> >> +       if (fa->fsx_xflags_mask & ~NFS4_SUPPORTED_XFLAGS)
>> >> +               return -EOPNOTSUPP;
>> >> +
>> >
>> > These two checks look semantically identical.
>> > I am not sure yet what you intention was with the
>> > fileattr_has_fsx_mask() helper - I know you had reservations about it
>> > but at least in this code, it doesn't look like it is needed at all.
>>
>> Eh, the name is not the best, but they aren't, _mask & check the _mask
>> field, has_fsx_mask checks the xflags field (which is why I added the
>> question of keeping its name as it is or changing it to
>> "fileattr_has_unsupported_fsx").
>> But I'm not even sure we still need this helper, so I may just drop it.
>>
>
> I don't care either way as long as the code reads fine.

Fair.

Thanks,
koraynilay

> Thanks,
> Amir.

--d4d0a5d1810b38e9a5b5d406e137fc7cd12d6afa0f1bd49929aebcd96cb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCawBMRQAKCRA0bnTtJTDo
OAxdAQDZAHDxwrsYEK/NjLvhU9XZYKoNPOA+bHn/PxMRXWrsowEAkLcPoymguHvp
ICHPpc1SRc0TROj5o6iGwNAiGXHeGgo=
=NG+4
-----END PGP SIGNATURE-----

--d4d0a5d1810b38e9a5b5d406e137fc7cd12d6afa0f1bd49929aebcd96cb5--
