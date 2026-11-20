Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795186533;
	b=vqCURMjk7CsaLCReKs1DHQGQkykYrl9mJQP6QoQN20auP9/NJr+WlF3CUV0QX2LE7me/
	 DxEny+BV73FpMQ0I6LxcmzG4JBwc2wmFfbvB2yDVzu/liDAvYTTA0fCI5/4ujjJEGpn0i
	 azLKr1pfsLreq7fzvV+HSLOmDoeWssEO8AB6tJy7DwnNjWjrIfB7iWUcyDCc4pKZ5gIKw
	 zCMP01HfB8GJBQdqHkBRTS9LgIOIqjzRAyL5+NmUTHs2LCBy3eBwJrlTIGejGcOLpC218
	 IZj0Uk4+qrDD1T97+TpsER8LRCiIMvOCDE88XGCZEswlX+VYyiBPzro9ah+0Sa8tjsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zpoWzG1+g8sYeNmdw7RPLfc/0HSn9Ajkmbs7oAG/5Qs=;
	b=KHH+LKS5yNDC+WZfh/jtRsOl/9MNlFYF24jJb6/qtZ3UDMQDrHpchaXcPN/UHFmNspAP
	 Fygai1LB25T6IfS69roAQ1j6Xx7BY+HlETrmm24t4027QU/WdzezUF+8WabDxKNmPz3f2
	 946mK0vDUOl7GlcYpsIy2a/WHaF+BaAAIyNoyZ/v3B7A9aYodbJ9G3O8fuKvI1BgMFZZ7
	 DFNgNV7ym4KLSld+Sxs5oc4HtCRcMxrg/JdjD6p3YMiJuVOJ5R9nyo4AQ3Q6lK2JXfmxw
	 9gLrhrP5hkSWZ0pc+Ecfctk/aJFD5WAahHMaK5aoQH/79qPuTbcyWPpkfUBgOgHVQkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOBxJbwY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B5606A339
	for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 14:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D7B5606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOBxJbwY
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso1450831a12.3
        for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 06:55:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795186532; cv=none;
        d=google.com; s=arc-20260327;
        b=nNU3COD/72ZCmSpitBiyDY881AebOlQGWCDQ0cOx3CURvfhtDCRFa+YOgu805Yia3A
         hBjCfvWrjdvsomni/2xD5nArDE5OhMAsq5Og6f3hsqmOUMCfrNRmaBgXpx2x44RFzUMl
         2hbLXlqdVAYJL6l5hUwpPvBC02b1BLHxzn6+FJbllx/U7iWJgLAMnzPQ+U+Ztd6+MNlZ
         rPVlteJfCsZCmrrIxxChqvp8NDTS7osO7mLczsgMrPr+2n5KAHTS3uYA8HbBPLTdfQt2
         Dd+VvNxWW4zouh6kb+VGyQM64Hi0Otup8DeQ5/S/fI9T2nqbn7KcsCIQtqNCIdgjsKwY
         582A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zpoWzG1+g8sYeNmdw7RPLfc/0HSn9Ajkmbs7oAG/5Qs=;
        fh=bL/w+uDgkjWZBkz+Ak6okmE8emb9/tZTpMoKdlDs37E=;
        b=EvRz0CNZ4/mpHUnmbvdy1CsSvuQQTEZcT8KXa9T5VvmNM79z2EVTkQ38lZf/p3cSAA
         VrIu5Q4frGZNHGU4sfn9a2moz05tOio/0abHx94sWm6fjGCiPGQJRp+6aE/zCpwePCpJ
         nE8TpHsKAT/mpXFWILgXMrW7s0K69CZIhmlf1EL3CpW9PrXG6ka+akj6qb1GTcvFIXkc
         kQAJ+Ze3eO6f47cR3dog3aP7EsoUNbkj6cTjVK9POLgeQwZ/KJ0N1kzRT7nuSnXcg4EW
         G50UJDaU8RJES+2p7k0r/1RYJ1MEaHdT//JZELTUzie4uesQNH3s22drdQ3m0lq21RZY
         cRmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186532; x=1795791332; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zpoWzG1+g8sYeNmdw7RPLfc/0HSn9Ajkmbs7oAG/5Qs=;
        b=fOBxJbwYnWwJOIsqnfVUU8OmQjKJna42gC8RaVKutIPjXWLaVkq2XVb3OD6vR6Yptt
         73LuI5fPAWN8OJUs/c1g0UyEy+PKUcVRUaoedyWO0YIUY5qLGD5j37YpVvakPVvSBWdV
         uDZFi3QRgENF3F8oMFlI1TJlvoa9JXEkLw03iA0mwh0VLsKQWkGtfSNW+Gad5C/iTmxP
         9icnKKu4PjLAV+O8r6ogKG38dwu8DZKkwXlqkXx60CIxuD/DTtOZiwiuggW72AVo5vBM
         TaDLn0AYCAgkJRZIIuizovRJ1aihqBXcUlER15ly/6Gh5tDz9crpQJE3o3A9i5Z94bbk
         vRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186532; x=1795791332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpoWzG1+g8sYeNmdw7RPLfc/0HSn9Ajkmbs7oAG/5Qs=;
        b=AH4m/f658/7fszWiMNaNVvQpqZ2utoFHDXQlIvoLZkHSmyF6IgLgZ8ZcgGvB5rdCGG
         OEfoapq+cDdKLi66l6ZVBs9NymsErYAO3mJNQE3/QRXxohU1O7pvOjIQA5SkrPG+wtJl
         1nZWMylYjtkIt5wS7Ed5S4Y+5J794D7+RWbaptcgp9+5a0tXItUJspM8BYmHVJIqtLjK
         2CxQSrhv79pVzixhXsYZWVb6BJveSpyvXVZogCKylmoZYoaLTmQj9QUh8hZ3FWVQtyVP
         HP7XFTVljgbwT4VCGQS8d9AgE1+ov07GAHLpRRrPN0MEL7QLbRDk66ELeprLIVlONxgQ
         jXEQ==
X-Forwarded-Encrypted: i=1; AL+hErH3/HsJLNZH9tbCo5h4cea2dqgcGskamHGi8vEu7Y9nYpm+iOHI48noe/Xt+S+pKZegyBX5IA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8GpwUZwHCwOEfuEDD6lpU45LZ+UbCaGGm8zKt8a5bE1q3xkw02
	G+/jUfbAaUgGAMgf67OLtrSpoAibwofrb4jI0dSGfwbZF+1SHBnpS/t4qapcWXhSHz+Q7w6Pa5d
	FD85uGgd+EC1Q+CmnqCvybKNcJVeZ2Z8=
X-Gm-Gg: AZFdTZdWY7kPZMpHB97P2a7y+kRM6XZ5Y5pZ58fHMaxgQJk7NT1C5BQ01z0q6bw63xB
	J0g/GdYvLzJqwn7VNXebaND64g+zazJrAwmPc7UHHBLeFxyrmwGV+oravI2tWdSM8W/E8eJ7uX8
	sBqzUmMWfntSZLnSbDAY+ha9LyXfdxJxpbaxHXqQofkiFnd51MChoEYvR+PBr3l11AAwMZgI2n6
	bvgDH51v6oI3ViNwZ4pkGEqmWgObzt8jXX/iIIbHEtLARqUAWWMUtAgZUYv/jQGiZq7uusjPRHK
	lEwPiwfCT16rSk/lRUECbSH8UP70H/KxZogtGSiKv9j7xJzpGp4CLOvgoJ8qV+QPsi1VrXOB2w7
	8+MzzbWFMvmAj8liwLtfBNLBfBdLgn7dBm9HxwPypsklN3rk1LrgJyOqtwsvUxmJHxRhzyw==
X-Received: by 2002:a05:6402:3223:b0:6b8:5f08:931b with SMTP id
 4fb4d7f45d1cf-6ba37ea44b2mr2503989a12.26.1795186531571; Fri, 20 Nov 2026
 06:55:31 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-9-koray.fra@gmail.com>
 <CAOQ4uxgoNsOH82FyrCxc+qSoid_CFmbmpL0qgWFw-e8E689fFA@mail.gmail.com>
 <DMZJ4PL1JVA4.2YEB7EPYJR5Q7@gmail.com> <CAOQ4uxi6h9BBP7pf4sR+gc2+4XtkEgbxXZha45iZzdB_wGFVgQ@mail.gmail.com>
 <DN02S2XNGRZD.1KNOZJ0GGDJNG@gmail.com>
In-Reply-To: <DN02S2XNGRZD.1KNOZJ0GGDJNG@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 15:55:19 +0100
X-Gm-Features: Aa3M54om4CtJTUNd2Te8u7pI-ZPclkwXdtuzgdSJLpiBpdV9ZiFnAJvfZll4Px8
Message-ID: <CAOQ4uxh+d-wNC0aWLEexPFz7zj=TZjLyu61kaEmwBx9_hKn2gg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 08/10] nfs: add provenance time (ptime) via FATTR4_TIME_CREATE
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org, Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:34=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Fri Nov 20, 2026 at 7:45 AM CET, Amir Goldstein wrote:
> > On Thu, Nov 19, 2026 at 11:10=E2=80=AFPM koraynilay <koray.fra@gmail.co=
m> wrote:

> >> >                    fa->fsx_xflags |=3D FS_XFLAG_CASENONPRESERVING;
> >> > +                 fa->fsx_xflags_mask |=3D FS_XFLAG_CASENONPRESERVIN=
G;
> >> > +                 fa->fsx_xflags_ro_mask |=3D FS_XFLAG_CASENONPRESER=
VING;
> >> Uhm, why both in _mask and _ro_mask? If it's a RDONLY flag shouldn't
> >> it *only* be in _ro_mask? (same for CASEFOLD)
> >>
> >
> > Good question. Maybe
> > I guess if you want to follow some percent
> > FS_FL_USER_MODIFIABLE is a subset of FS_FL_USER_VISIBLE
> > but I think that exporting ro_mask and _mask is going to be easier and
> > cleaner than rw_mask but not sure.
>
> Hmm I asked that also because you said in the xfs shared extent thread:
>
> > The advantage being that it makes the interface symmetric.
> > User can alway setattr() with the buffer they got from getattr()
> > and instead of randomly ignoring flags in set, the fsx_ro_mask
> > along with fsx_mask defines the behavior exactly.
>
> But by putting the ro flags in _mask too, a user would have to clean
> them out or vfs will reject the call with -EINVAL/something else, since
> in that case the vfs would see the user say "I want to change this [ro]
> flag".
>

That's just a matter of interpretation.

You could say that if flag FS_XFLAG_CASENONPRESERVING
is in ro_mask then its value may not be modified and fs needs to
fail the set if the user given value is not a match to the current
kernel's value.

Could be used for an "atomic flag set" operation, but I think
this is taking this too far.

I am fine with xflags_ro_mask and xflags_rw_mask I guess this
is the less ambiguous option.

Thanks,
Amir.
