Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962121;
	b=ohW6Gv7AYJlSv+OCrY2pEYRW6qJYrK7fLNYiCIaNjyDFIqQmmSYiPsWRPS+XV9AwT/2q
	 guGuQkNnviszH5+EL3GqVqBhtf2rZ0w9KzSgzAaCv1BxhvATNKrXjms4HooKXIL3YAbmE
	 BdQccBV4f+VGMxdZhdWRG4r9R+3lmOAoqyL4doFW0j3+3SiJcYPLrK8hgqcM2M++G/JuD
	 IbBuGqvnXNdyfGMKjs7whB0LwTNqC/c+waqV/hQg9xS/apk38OPG768Km6P4xpaiQRz8L
	 qSCqfcNPtk5MDagH3FegM0WdoK8W1ie9jsL5x/YbArOY5BRwaEWaIujzRdP8+GMea8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To;
	bh=WbIzd+ctnJR4yFdsTDfSvvEGuowj5ndViMpewtBSJFs=;
	b=jKemb+ie4K5CxyXtKOpDrfJb49M9sbLvqg1Nhuoh7s3ZeKzJpx1d5oeQPtSDSbP7FH5y
	 ikt6LH9qP1tWZjZwUzy+FBygxOgHzZw3cCs4FWxmhyUCn66PEC+XS74sgKlmpk6R1/n6O
	 lX2fO8wje5y3w0gD4KPSATJwe4k/fRwIdLXQkVw7srEN3B8oY5724E2PhZzBmMQb9Lt46
	 kT686wvLcE3xawD/Knifi1iEaZlqJ9Lm8GEX1LEzwoNRnLRD2+79qy4MWH06IaQH4IoPK
	 QIWfWQplBz2W4b/vi27aTBuqpFfC0Iq4OVl+zG3O1rgKNu89l9fhGtywTuwCMOKlAqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bQWpC80S;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE37B606A31C
	for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 00:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE37B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bQWpC80S
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso4171175e9.3
        for <exfat@lists.linux.dev>; Tue, 17 Nov 2026 16:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794962119; x=1795566919; darn=lists.linux.dev;
        h=in-reply-to:references:content-transfer-encoding:to:from:subject:cc
         :message-id:date:content-type:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbIzd+ctnJR4yFdsTDfSvvEGuowj5ndViMpewtBSJFs=;
        b=bQWpC80Sj77jfatDORUYlb23wvCwpDnzh3zkRfsybRtxyTGUsR5tTDbgJkQKuPhJp/
         +wQcXIlOJ4adWAK5OEset8Gx1w6yF09V0DyjNqPhv8un206sr9yO1eZo2CYDtM9nQVHK
         /ZShJ6c0mw8eU7hu8I1XQH3XSo2PeqE8MgVuFx1jWFl6rBh/IOlK4XdGk6oR/6MFmPOW
         4mIaFnl2asJqHO+VQWqV1ntDAld2x3sqd3h7bEL/LYekqpzB7bM3Sbew1WqbFEoN+YR9
         qqZlOY1jYccQ0te5KrfUHwQM2SyZR7o/awAV93jJLDkUIqaK63Al/Tq3GYJtQTsaMMlg
         X12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962119; x=1795566919;
        h=in-reply-to:references:content-transfer-encoding:to:from:subject:cc
         :message-id:date:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbIzd+ctnJR4yFdsTDfSvvEGuowj5ndViMpewtBSJFs=;
        b=QlaB46Lzn3L0juYTYnVYHmD3tX9IEIH64qAZ0FO+2N11eo2AU2o9YATZizKjsXa0ej
         LENtQ/2kdfzCnIzBwWSdHRaZ8Un9x7BNhOTuaXom9CTC67lZxBpBWLIKuwczEouh3N1H
         KYnQmIdhVX7kiJlT8UIqM+1MA3F6xqw78C+R0Oz0QvJ0E6BowKe2ngNjP32ZOPDgWa6u
         D8x6q7Wfhj415WtN9tjBuQINda6J8PRgYcYf/HdM3kEaQgBRtcQ+t2MPx/WaOm7f6WjB
         z/vOxZTchWsynlOzZLofPVMqc3XuLnUTGTTSUwfNoai/D1xMVG6vkiCDLEUL+eb4J4Qf
         HCvA==
X-Forwarded-Encrypted: i=1; AL+hErGXxZrYyFE4fuOPvtOtQPtn3H12G0mxwB7zKw+vlsxSukKhiIm9CULFrmlWHXj4iU14M4Vk9g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/YHzOj/Tc+peB5gadJSna1YWGTO06A9V4E7o6PslR4ZLNhaT2g
	nufBFfGpEkMS7Y/q4CdIyPnSych+rzfa5VWCm6L4bBYjtpOhcFcvQP6o
X-Gm-Gg: AYBFou2Gz69kp7yhZ5+6BFv1JTh92T7C1imZ8JsJdBM1WUlN+6bPlLnYZoQ7PeFzd8L
	FOF1givB29T38w8LduvIqbvoU4Gi3/2yBFTB+uot4ySV7jWjaF5wtnEE91ZetHB6rgVtJcrDFLQ
	BeRfkvEJ489/YizzNo+7uo+2k78LlZNYXICVRQXMpVlw8EFNbdgMTdt7ou7h2AL1Jm485q1nxiZ
	g8M5fXJw3IRrgclx9CCAO/18gx+Jjp3E1BeMhGfEVPASaw94OqBESMt61kC64sGL0wFB9h8aEuK
	n430zHM8impoo0bxVnVzYYTnzHFooZqT8F410EiG6RtMAlWA0M+jwhiWaUI+WQAjkibZ82lAZgE
	QjFg9kQXJS1j+0H/ewYJRb2U08NT2JXmpNHMrBJVHCe3iCGBEaLV2vZ1UZWdtMJZ0kznfoRQL9b
	2kbfJ8FZ5JetLw/UTvEogsM7mfeTDSJHDkAWF8+NAVk0w7DBNp3c8F7drDcoN3eO5g0VrVxTyy5
	K7STGxLBoYlE38qnneciEYWgUNIT85AEiEqSwrAntMChOUvdLgVw21zFw2PQquC1474TJKWx0Tk
	aR9dnoiyaTQ0zzKaXKlVqh3Q7g==
X-Received: by 2002:a05:600c:1906:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4bb7da13900mr16206835e9.10.1794962118973;
        Tue, 17 Nov 2026 16:35:18 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560bd46sm1551151f8f.31.2026.11.17.16.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 16:35:17 -0800 (PST)
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
 boundary=3f37a8250c17ef201a283aa9d15331a4c7b5582752331b03c03104ec5ba6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 01:35:11 +0100
Message-Id: <DMXWYQ9MORA5.XHWI9GTCCUMN@gmail.com>
Cc: "Chris Mason" <mason@kernel.org>, "Yuezhang Mo" <yuezhang.mo@sony.com>,
 "Jan Kara" <jack@suse.cz>, "NeilBrown" <neil@brown.name>, "Olga
 Kornievskaia" <okorniev@redhat.com>, "Dai Ngo" <Dai.Ngo@oracle.com>, "Tom
 Talpey" <tom@talpey.com>, "Ronnie Sahlberg" <ronniesahlberg@gmail.com>,
 "Shyam Prasad N" <sprasad@microsoft.com>, "Bharath SM"
 <bharathsm@microsoft.com>, "Sergey Senozhatsky" <senozhatsky@chromium.org>,
 "ChenXiaoSong" <chenxiaosong@chenxiaosong.com>, "Darrick J. Wong"
 <djwong@kernel.org>, "Sean Smith" <defendthedisabled@gmail.com>, "Andrey
 Albershteyn" <aalbersh@kernel.org>, "Pedro Falcato" <pfalcato@suse.de>,
 "Amir Goldstein" <amir73il@gmail.com>, =?utf-8?q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <exfat@lists.linux.dev>, <ntfs3@lists.linux.dev>,
 <linux-cifs@vger.kernel.org>, <linux-nfs@vger.kernel.org>,
 <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v4 07/10] nfsd: add provenance time (ptime) via
 FATTR4_TIME_CREATE
From: "koraynilay" <koray.fra@gmail.com>
To: "Chuck Lever" <cel@kernel.org>, "koraynilay" <koray.fra@gmail.com>,
 "David Sterba" <dsterba@suse.com>, "Namjae Jeon" <linkinjeon@kernel.org>,
 "Sungjong Seo" <sj1557.seo@samsung.com>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Trond
 Myklebust" <trondmy@kernel.org>, "Anna Schumaker" <anna@kernel.org>, "Jeff
 Layton" <jlayton@kernel.org>, "Konstantin Komarov"
 <almaz.alexandrovich@paragon-software.com>, "Paulo Alcantara"
 <pc@manguebit.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-8-koray.fra@gmail.com>
 <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com>
In-Reply-To: <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com>

--3f37a8250c17ef201a283aa9d15331a4c7b5582752331b03c03104ec5ba6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hello and thanks for replying,

On Tue Nov 17, 2026 at 11:01 PM CET, Chuck Lever wrote:
>
>
> On Sun, Nov 15, 2026, at 1:03 PM, koraynilay wrote:
>> Implement provenance time (ptime) in NFSD, as introduced in a
>> previous commit ("vfs: add provenance time (ptime)").
>>
>> Map ptime to FATTR4_TIME_CREATE, allowing clients to set it across
>> CREATE, OPEN and SETATTR compounds.
>>
>> If the underlying filesystem supports it, use __vfs_fileattr_set_locked(=
)
>> to set it, returning -EOPNOTSUPP in case it's not supported (i.e. when
>> __vfs_fileattr_set_locked() returns -ENOIOCTLCMD).
>>
>> When querying FATTR4_TIME_CREATE, request both STATX_PTIME and
>> STATX_BTIME, preferring ptime over btime if available, and advertise
>> FATTR4_TIME_CREATE support if either ptime or btime is available.
>>
>> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>
>> @@ -3646,7 +3649,14 @@ static __be32=20
>> nfsd4_encode_fattr4_time_access(struct xdr_stream *xdr,
>>  static __be32 nfsd4_encode_fattr4_time_create(struct xdr_stream *xdr,
>>  					      const struct nfsd4_fattr_args *args)
>>  {
>> -	return nfsd4_encode_nfstime4(xdr, &args->stat.btime);
>> +	const struct timespec64 *ts;
>> +
>> +	if (args->stat.result_mask & STATX_PTIME)
>> +		ts =3D &args->stat.ptime;
>> +	else
>> +		ts =3D &args->stat.btime;
>> +
>> +	return nfsd4_encode_nfstime4(xdr, ts);
>>  }
>
> I have trouble with this approach.
>
> We've already established that, for the Linux in-kernel NFS server
> implementation, FATTR4_TIME_CREATE reports a file's birth time and
> does not permit NFS clients to modify that.
>
> After this patch is applied, the server reports the ptime instead
> of the btime on some filesystems but not others.

I implemented it in this way to have a proof-of-concept of how ptime
could be use by filesystems that already support settable btime (as was
suggested to me in [1]).

There was also a discussion in v3[2] on NFS's FATTR4_TIME_CREATE as an
example of such a filesystem

> Essentially this changes the semantics of existing files that have
> a btime set -- technically that's a regression.

and since the NFS protocol itself states that FATTR4_TIME_CREATE should
be user-settable, I think adhering more to it would be better.
This would be fine even for already existing files IMO, since btime =3D=3D
ptime if the user doesn't manually change it (or with --preserve=3Dptime
for the various copying tools).

Thanks,
koraynilay

[1]: https://lore.kernel.org/CAOQ4uxiuy0VwZj+3M-zRqQ49WTpHZpiaQ+6MZ8z8WdLjy=
QM_zA@mail.gmail.com/
[2]: https://lore.kernel.org/20261103094906.n55n5dhrpct5ykmw@pali/

--3f37a8250c17ef201a283aa9d15331a4c7b5582752331b03c03104ec5ba6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCavzyvwAKCRDmj22qf5IG
XOsRAP4vh5FXH5uGRieLcNxmpyXktFYo5TTK0/smQUKH1S3W4AD+OFSrMDbk0OBL
bbF4a80MG9QJTSNaQXnZOrSA4Bhhew4=
=tiHS
-----END PGP SIGNATURE-----

--3f37a8250c17ef201a283aa9d15331a4c7b5582752331b03c03104ec5ba6--
