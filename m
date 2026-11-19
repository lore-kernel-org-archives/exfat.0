Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127117;
	b=sbuaYPYeOJXsxw95ezpl5TIl+nfSUWllcfAXc/2EiBAeM2fnoW/kLO+R+XNo900L30vf
	 ndkH+eZLvXwUx5FgXz8pf81rEO4kP1fFOGTxPnJ4a7NQbA1chy7NBAnXj8738Tko5spnb
	 2BSg+3ZC/9BkLCil0DtQyeNn1OvCvdjznZMh6+KE3iwuziGntT2I9yUyr4Awu5OryGzHu
	 RcyqLC8+dPycl5xd3nA59IXvCL8adi0g3ECnwN/K3Y6Jqi/HSOuPjfiJYBz/MRa5ZHFLO
	 TzY0lnBu57aOGSU8hEHo7NWwgvPzRkqCPhB25l0JsMU1yJ9WknHxiEYxV+BbYC7NQgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=Wkkl/Lkl9FxKypByBkDGnsO1INO/Eqn1TaVyFB/5Zdc=;
	b=ZEufv3gDHZO6Yar7k4D7ugLDxXq2Q2FYeaWOTF8Gxxlq3tEZ18avLtOvDAjNZlZyR5ql
	 y98xAvQi1hUZ4XiwdidT+FeoP8n2mDjBj9kdnmAT9LVdJHw8Wo6oAk0bRlgUkbrGp0NZ4
	 mF6nqIujGgONHqeKvAVbLwGts4fxHRDn40Jg7Bay+UbJEeaocMNO5i3webcye0IkUnolP
	 Pxn9W/HDVg5UDLL0YErG4vw8zb0lcJUjkQI9w0wR6C6j4oAG+TJ49fsuPLQIQLbmsyO1L
	 p8DtZocQ1lp4Hk9qKVTgDm1ZiXCV90+UrzBdatWhUZPR4vA2XV8DSHwcfpa0EFEhnMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxHu46GL;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E01606A330
	for <exfat@lists.linux.dev>; Thu, 19 Nov 2026 22:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E01606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxHu46GL
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso1626075e9.2
        for <exfat@lists.linux.dev>; Thu, 19 Nov 2026 14:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795127115; x=1795731915; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wkkl/Lkl9FxKypByBkDGnsO1INO/Eqn1TaVyFB/5Zdc=;
        b=HxHu46GLsJErR8/H6czTilRjSGjAd+OfaqEPsnnKGACKt/Nr7RXdI4Rsdo3eXYyDw8
         yAdPx8ByCITA5a+LXrHowrAovrX0WVuvHy88hVZ4nhZlNhHWLJVOl5G9cGJyH3BBQpr8
         iMA0BVWvK1tB2nw6bqMf5QYnZPSnUxSnbJNAJRe6uN7Tohhl12grf8g/NbbIvE1/Y6Wx
         86WOUekVl9hnKDwkP1P7EkYm6mnT3SPTnJJJ+FBY7hiXXv7VNZ8qgqt0zTjHKfKcI5DF
         6SH4ZDSalsdqK61fR76g2g/tW4uVaPuThQAkVLoEPwy9edRQmQ6UlPl0HKoZ9djTLoaZ
         +JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795127115; x=1795731915;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wkkl/Lkl9FxKypByBkDGnsO1INO/Eqn1TaVyFB/5Zdc=;
        b=FyFoIFyF84u0bWixWqJGHfIFIFmWvy/QGs2TB6Wuyz1QyjHKMf1Sen+k8pz9Iqm8Dl
         wo2GNK4dCeQZoBiecH+PijFqcrz3vOAgOWtN6GHPYi3dkwI+NiOpIN0FBGwEBuuMRxl9
         1kEjYlZmCwVWDfOa29zauIG2EPxFWpWxsbwOmTv29egBRVEo/46KN/XpNAPrBqgszCvN
         3CjxK1tIYobugrihhkMKAZ5tv6D9maVwGV3wgBKoqb7R4xIJK3Lr+/CeVkvSrmANok/R
         P5z9CzDb5gut0YseT4U5miJaqiY5fu1bs7gScTtPoc26XKdxcsKDAikqkL8NYocDfVqy
         LWLw==
X-Forwarded-Encrypted: i=1; AL+hErF5OHiwy40rO6bMRSawuDtI8gERrM8Redsu7H/4Hh335Ado2MJq6gPhy27dHV1A+T5kN3hgbg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9AnUbUr1z4/ZvPzBuXmLQqLyA1PQuPjqpDSfRB/sczjWzanKGv
	MRdG7Y1lBlRT4kDCovCqoFqntkgWijIOLYTv4US1PjI6N9Lqs3TPUovB
X-Gm-Gg: AYBFou3X6AmQEi6gRUkRJ3MiYTO0MMlh9IOYbxgGesTqFp7HwqjTvCaPTDp/6h3IV36
	QPAjJNL13YaIIWtuGQcssOG3E2h76x2AnFWejAfWU9lKKzm+qq1PsFcXiQP8mceve6mCT/e/6Hy
	t7uAf8erHQOVcHiXFyg853DNCPUsyVx5nC1TVwfJErPS3Pt0uFnYZVJJhdGM3V4dlIWlP4pt2Vw
	Uill1oacZ3m0Il1YG/bsKpJ05iczIk8prDDeRWPm2y5SGuxKtfLLBefcbi7EVN0h4oiz9h9f7WO
	scLp9ocaHTR/UG1rbGkEpkvesyEfP26hhWFxVKWbjBOQOt5g4G2GD5DEOeLio/sm8AUcx/N1cSs
	aWPa4MmH3n+i/TtubkwROUqYbMfEnN1LKptzSOZ6U9xNUuTpsqz45q/+YxbkPr6tE04NMF2KWw+
	Gm3d9b3QsQI20iPoX+MISIMXcud7v1a/39kgEeBIeJNJ/D4AApBRrXf+ANwa2Fnnz0rK9vrY2e1
	6N7qKFAarkWZ+a1WQXxUE3ln5XjQcNp6Ekrtajt5lHISZPYACOQzTq1O+eDtFCMTZ6NGRvmJQxj
	n1K4z5ABSw07ax8lN+ujUuEnkQ==
X-Received: by 2002:a05:600c:4f16:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4bb8882a66emr22851135e9.32.1795127115405;
        Thu, 19 Nov 2026 14:25:15 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm42979175e9.11.2026.11.19.14.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:25:14 -0800 (PST)
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
 boundary=4e96d6451976e17ba3b9883f217aebe13853d9371cfaf2050bcd9e7d05d2;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 19 Nov 2026 23:25:12 +0100
Message-Id: <DMZJGB07CO56.IZ20OCGGH6C@gmail.com>
Cc: "Amir Goldstein" <amir73il@gmail.com>, "David Sterba"
 <dsterba@suse.com>, "Namjae Jeon" <linkinjeon@kernel.org>, "Sungjong Seo"
 <sj1557.seo@samsung.com>, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Trond Myklebust"
 <trondmy@kernel.org>, "Anna Schumaker" <anna@kernel.org>, "Chuck Lever"
 <cel@kernel.org>, "Jeff Layton" <jlayton@kernel.org>, "Konstantin Komarov"
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
 "Pedro Falcato" <pfalcato@suse.de>, <linux-btrfs@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <exfat@lists.linux.dev>, <ntfs3@lists.linux.dev>,
 <linux-cifs@vger.kernel.org>, <linux-nfs@vger.kernel.org>,
 <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v4 09/10] ksmbd: add provenance time (ptime) and map
 it to CreationTime
From: "koraynilay" <koray.fra@gmail.com>
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-10-koray.fra@gmail.com>
 <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>
 <DMZIQG4U1NTH.2IN0S2YIWEYTG@gmail.com>
 <20261119220936.mssmaixcorn2gzli@pali>
In-Reply-To: <20261119220936.mssmaixcorn2gzli@pali>

--4e96d6451976e17ba3b9883f217aebe13853d9371cfaf2050bcd9e7d05d2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 19, 2026 at 11:09 PM CET, Pali Roh=C3=A1r wrote:
> On Thursday 19 November 2026 22:51:26 koraynilay wrote:
>> On Thu Nov 19, 2026 at 6:34 PM CET, Amir Goldstein wrote:
>> > On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.co=
m> wrote:
>> >>
>> >> Implement provenance time (ptime) in ksmbd, as introduced in a
>> >> previous commit ("vfs: add provenance time (ptime)").
>> >>
>> >> Map it to SMB's CreationTime, making it settable by SMB clients. When
>> >> reporting CreationTime to clients, prioritize ptime over da.create_ti=
me
>> >> memorized in the user.DOSATTRIB xattr.
>> >
>> > That doesn't sound like the right thing to do.
>> >
>> > If the server stored a CreationTime that client had set, you cannot
>> > override this.
>>=20
>> Ah, yes, but how would we handle older files which get a custom
>> CreationTime both before (in the xattr) and after (in ptime) a kernel
>> upgrade?
>
> Just to note that this problem is already there. ksmbd can export for
> example ntfs filesystem on removable disk. And this removable disk can
> be connected to Windows machine which will always only touch
> CreationTime and ignores xattr DOSATTRIB.
>
>> > When the client sets CreationTime, the server can decide if it can and=
 wants
>> > (may be a policy decision) to store CreationTime in PTIME and not stor=
e
>> > it in user.DOSATTRIB.
>>=20
>> To fix the above problem we should probably keep storing it in both
>> ptime and the xattr though.
>
> IMHO for a long term solution it is better to not have duplicated
> information in xattr. Because duplicated information are going to be
> out-of-sync. Windows NTFS driver will not update xattr DOSATTRIB.

Yeah, to avoid out-of-sync issues is why I made ksmbd prefer ptime over
the xattr's CreationTime.

>
> For me it looks like that this needs some policy / configuration
> decision done by user. We do not know if the user will replug that disk
> also to Windows NTFS driver (and then those xattr DOSATTRIB could cause
> out-of-sync issues) or will only use it from Linux or Samba and then
> xattr DOSATTRIB is probably fine.

I'm not sure if this is the best solution, it doesn't feel too right
to me, but maybe there isn't a better one.

Thanks,
koraynilay

>> > Fun fact: the user.DOSATTRIB format also has a mask so storing the
>> > creation time inside it is also optional.
>>=20
>> With my current patch series applied, when CreationTime gets set by a
>> client, ksmbd writes it to ptime and fixes/heals the xattr (=3D removing
>> the CREATE_TIME flag created by older kernels, see the other fun fact
>> below).
>>=20
>> And another fun fact: until [1] ksmbd ignored the flags and just
>> read/wrote the attribs every time :) so that can only be honored for
>> files that have been written to/updated with newer kernels.
>> (That's why there is the ((flags & CREATE_TIME) || da.create_time > 0)
>> in my patch, and not just the flag check)
>>=20
>> Thanks,
>> koraynilay
>>=20
>> [1]: https://lore.kernel.org/linux-cifs/20261115155308.415734-1-koray.fr=
a@gmail.com/
>>=20
>> > Thanks,
>> > Amir.
>>=20
>>=20

--4e96d6451976e17ba3b9883f217aebe13853d9371cfaf2050bcd9e7d05d2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCav93SAAKCRDmj22qf5IG
XCh1AQDHwCluN/PD1HO+ivE2XkUxV2Zyx9D+P9Mq0OOkUf4W5gEA15FUsuExyJyj
iwFtbJlvhrNrDKohBVZXaAkjbhxknwA=
=N4cE
-----END PGP SIGNATURE-----

--4e96d6451976e17ba3b9883f217aebe13853d9371cfaf2050bcd9e7d05d2--
