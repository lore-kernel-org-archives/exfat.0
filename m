Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020651;
	b=0G8hy2UC1MbIQmELoHu+HjRQ+/ISrPekDAfDGGsc6sLXSwWf87Ai6Gli3Ju+tf6FA9KR
	 VhGC5gbg9Pn3dZ/pHQUa/8L2rvOGR2ZdVNy6t00fMayleyacsNfCLrfL6Zu2VQB24s1UQ
	 /s9ikgmqT6Yl8nynBjOfHdEDHvAscN2gBZRrKm+bGFGRgkO6O+M08DTS4Fs+KbWyZNH4o
	 e8vzMawqiHiaB1d5tiXIuU9W6xxm+HyJPW0r2FLMZhzA5PO7FuBl8JrrD/xFcr1hE4eQp
	 C5jGplyVUJhyQDS316V8BeNuyNjEmnyNgMAoLA2D2OpeMw6sWMLHHjT1kJGYyDPGTag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=m3pvNF133wcwSGy+HdLA8hjMu+z12FMemfmO2dtjbkM=;
	b=GgUQPV6GJuvsnbxAbaNnwsCQ7EB2IjNZ9q1J7ToSVxD/jkKK/tFY7+4Fv0XBSPFv1Lfc
	 hzT0CJk6oAIFfyrmK+0ZucvzexfbZBIgYlr9cjliagFdZgnLwodzrcNQRegMXyYUw2HMT
	 56KrPeJvYHgSrK1ruBPnloDt4pkU3WcdrYNGjV/TCBdJDgt8EHYTE+4ecGBSFiQ62r87r
	 7QsblYeFr0S4sfjDgEopFVinoC/RaCj2J+JpqCP3Xo2aZJuuCkGkl1hHl//1rRlOX8gkx
	 V4f4tUiRo+pdhi+uAua8s0Mj3fnqtyILQWuWFCrUZmLixtuCV2FdnVH90NQ5qxeDPzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o+7rzf/m";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D7360A2616
	for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 16:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54D7360A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+7rzf/m
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490f38e9688so8924f8f.0
        for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 08:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795020650; x=1795625450; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m3pvNF133wcwSGy+HdLA8hjMu+z12FMemfmO2dtjbkM=;
        b=o+7rzf/mdwZdtUJFsT356+AVtPAaE2yb7InKRW4XDS9HUTTQ16S5UsQi4cI3HnmzML
         fxebko0cFEKLczF0CeZZ8qfWyfK96sOksqtEbBSRanr9BnIH7MieFeIH1jhhDiSz7kC7
         9dcI8k+x52P0IKT2z3AVUNe9W/Pk7paOrenFtzKqzbp5SGLBhp8D72WkeVk80/KGFpfz
         oPjV0IvSVs63OlBVrZXZ/rvcD+WHV+Wc1j5hzEfPVq2zQ1gIl3Fw2EeBdSwvWobh1xiv
         z8tTnyAnJkSq9YcYFkZ5GnGkrBXcd1LyXvKOOEZCqKDiwfOUYnUgyKvUPa2D8+pYuX3D
         NP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020650; x=1795625450;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m3pvNF133wcwSGy+HdLA8hjMu+z12FMemfmO2dtjbkM=;
        b=vTR+Rj19LS5ePTS/xQk2h7Q/ganpPpHf2q5AVQSAYs25xEyjyEr4j2M0OsX4/r+J4H
         6c9rVynJPxNn2EaAxUSfRYyuP/6cZQHDMj5ercUwduaS4redVOENDlOMdBOTnPrCiKin
         ax+/6dsBEa7NdArS6t003EL948UiTt2izFXEm7bgGD25r65VGnBZzj7PSGUK06K7wlaQ
         uto+4H3XgBMR5h1TVgeeraqjrVQMzGicZEiiRMeAM133HLNQGezTiUsCOPtf6fIrv+6n
         qKvVJLU/OaGW2T0ihBY8NxH+t3+7rvH/DdELra5mPmsgtlEkalpDyq/Y+ek+xfkv0AU7
         17pg==
X-Forwarded-Encrypted: i=1; AL+hErEUUZssZPf8YcKth6dCbW+xHcFl9TaBo1y3zhLnKXPpavpJR5p7qek5TaPA7cdPT0U+eFphGA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ICBIOPYqUnVYuOd9LftLDSIMv6Js1bxO0ms1fBzlKricSS2zO
	2lfyGIDxQMikkDuqRd7e8HFGN5pmG8g6+ExSQZJjKdBHe+QXAtMwVRJd
X-Gm-Gg: AZFdTZcVrA6C06CVFfQK1N+hYzkT3c7s/tkf+81RuscI0AiJeQXYZ4VVJDgtOp5p+48
	DZvhpDy+kX/LmFITdEBAAtCZAd5hq4Mca4NOtisFclLgLF/N0YwgH+S+DkoO5yW10H4MpF0rvHo
	bkGeiybIv+ozTA8pYEZj2F854Q5ivSTfcgfC+/OySXS167A52nzRytgNDRZBF0w7MMEcKw4FCHN
	2le40x4nFFfAbGHnj4+q/f95t0vn8wQ9kMcJbQ41yNUTJZHaVVsYbJjDrUH/r++AuOyUmvrMBBn
	BMVRBcAUwJCM9yiSW6kH/HRKHoynQLpoIuUfOOJADanAGJS5zloktEO9vN9Gdy7lEBw3oTDcP0M
	QonsdeRkDmLyNEo1+v2Jm5ezUen+Z5/jTQIu6l9bcTBv6T0i9IKoxZnUwwBjwSlreUa7N7B8QPo
	mUzRrXABjH0DU9Ctaa6C29Dksu5WuBubESHuzVMeU4X/TvJabH7fi3iekV/gPXfTt+y8NqlUG0U
	1NysVHjOPOrukQEDebvGx2xXqVYh0zBJPBQBXmNQM0ID6+K8/GHl/K5gZqVnTxNp6j4qwMoZ9DL
	49abvy763/ONhjI4nHuty9UkHa4=
X-Received: by 2002:a05:6000:29d6:b0:48c:585b:8825 with SMTP id ffacd0b85a97d-4a8e60ff7eamr118137f8f.18.1795020649313;
        Wed, 18 Nov 2026 08:50:49 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:de3b:51f3:e461:c0df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm6451582f8f.8.2026.11.18.08.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:50:48 -0800 (PST)
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
 boundary=e68d7a3c08e03032b674b625d495d35f9a655e5ba7e0e8c8006911574197;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 17:50:39 +0100
Message-Id: <DMYHPLWKPSH3.MUM1IIZZIWNR@gmail.com>
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
 "Pedro Falcato" <pfalcato@suse.de>, "Amir Goldstein" <amir73il@gmail.com>,
 <linux-btrfs@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <exfat@lists.linux.dev>,
 <ntfs3@lists.linux.dev>, <linux-cifs@vger.kernel.org>,
 <linux-nfs@vger.kernel.org>, <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v4 00/10] add provenance time (ptime)
From: "koraynilay" <koray.fra@gmail.com>
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261118142613.be3r3s6kobkkxnz4@pali>
 <DMYFBDIV4Y08.35ZKR5G86U1H7@gmail.com>
 <20261118151605.lqtn5fz423kuswk5@pali>
In-Reply-To: <20261118151605.lqtn5fz423kuswk5@pali>

--e68d7a3c08e03032b674b625d495d35f9a655e5ba7e0e8c8006911574197
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 18, 2026 at 4:16 PM CET, Pali Roh=C3=A1r wrote:
> On Wednesday 18 November 2026 15:58:02 koraynilay wrote:
>> On Wed Nov 18, 2026 at 3:26 PM CET, Pali Roh=C3=A1r wrote:
>> > Hello,
>> >
>> > I have just one issue with the userspace API. It does not allow me to
>> > figure out what is the source of statx btime field. If it is fs ptime =
or
>> > fs btime because this RFC implementation is mixing both fs ptime and
>> > fs btime into the statx btime field.
>> >
>> > I have feeling that this is quite a mess in API and I would like to se=
e
>> > a clear distinguish between btime and ptime in the API, like there is =
a
>> > difference in the fs storage.
>> >
>> > If the btime is used for forensic analysis then somehow I would expect
>> > that the statx would not report / not fill changeable ptime value into
>> > the statx btime.
>>=20
>> Hi, for native linux filesystems it will report ptime as PTIME and btime
>> as BTIME (also semnatically).
>
> That is fine.
>
>> for the windows-like ones that only have
>> ptime (semantically) I think it's reasonable to not expect btime to be
>> immutable, since they are meant to be used with other OSs who lack btime
>> semantics.
>
> The problem is here that the RFC statx API does not provide this
> information that the fs lacks btime semantics and instead it fills
> non-immutable ptime value there.
>
> I'm pointing only about this inconsistency.
>
>> > It would be really helpful if the statx API on inode can differ betwee=
n:
>> >
>> > 1. btime is present and its value is ..., ptime is not supported
>> > 2. btime is not supported, ptime is set to value ...
>> > 3. btime is present and its value is ..., ptime is set to value ...
>> > 4. both btime and ptime are not supported
>> >
>> > This should cover all cases of different filesystems and also allows
>> > userspace to do proper backup of both ptime and btime fields (if it wa=
nt
>> > to do forensic analysis or anything else).
>>=20
>> These should already all be covered by STATX_BTIME/PTIME and their
>> fields in struct statx, the only problems are windows-like filesystems,
>> which IMO shuold be handled as mentioned above.
>
> Exactly, I pointed out about these problems. I somehow expect that the
> new API would be generic and uniform across filesystem. IMHO it does not
> matter if the filesystem is windows-like or not (there are also FreeBSD
> fs and also others which allows to modify that time). So better
> description is fs belongs to category 2. from my above description.

Ah yes, I used windows-like to mean "only have ptime semantics", so same
as your category 2.

>> Of course, as in the other discussion, I'm open to changing ptime
>> NTFS/exFAT/... support to remove btime altogether and only use ptime for
>> their own crtime if that's what wanted (I'm fairly impartial on this
>> specific issue).
>
> I'm giving some ideas how to possible handle this situation:
>
> 1. do not fill btime it at all when it is not available (remove btime
>    altogether - the case like you wrote above)

This would be the most semantically correct option, but would break at
least 1 script/program/use case.

> 2. when userspace ask both ptime and btime, then do not fill btime
>    (remove btime altogether - but only for that new case)

This probably is the best compromise.

> 3. fill btime with ptime value, but add a new output flag indicating that
>    the btime is not present at all and instead kernel filled ptime value
>    into the statx btime field

I don't really like this, it adds complexity and uses memory/1 flag big
for a single specific field, IMO it's not worth it.

> 4. let statx btime as currently is, and add two new statx fields:
>    immutable_btime and ptime. immutable_btime would be filled only if the
>    fs supports real btime (so not for ntfs/extfat crtime) and ptime would
>    be what is currently in RFC

I think this is also too complex.

> Ideas 2. 3. and 4. should be fully backward compatible as it would
> affect statx output only when called with new flags.

Then 2. is probably the best way to go forward (maybe I'll include it in
some way in v5), but I think we should let each filesystem maintainer
decide if they think their users want to have statx report their own
crtime as btime, ptime or both (native linux ones would of course
report btime as btime and ptime as ptime).

Thanks,
koraynilay

>> Thanks,
>> koraynilay
>>=20
>> >
>> > Pali



--e68d7a3c08e03032b674b625d495d35f9a655e5ba7e0e8c8006911574197
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCav3XXwAKCRA0bnTtJTDo
OHCeAQCEIeCKM23PngeIMoBXCQU9k+fpxVE5Iim2Z6kczs7U7QD/QrQdNXwKde9D
5NVqKpZ3hIlgyN/x854bwe3ySGv/rQc=
=h4y9
-----END PGP SIGNATURE-----

--e68d7a3c08e03032b674b625d495d35f9a655e5ba7e0e8c8006911574197--
