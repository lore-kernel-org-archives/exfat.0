Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013893;
	b=l+S1WTxYwJ9Q4cikimkLLIpVFnT0qV+CjJ4f8z6CQGcxcvFftL7Rksg1MGGPlfwb3x4h
	 4HKkH+WKXDRbdZg6+wF4cWZpEbx/pTXpGXmW61xMJvAaW5MhGh46qJRNFBqVAyvBSwvmA
	 oCNFHiRVPAYhEuAjGsQPf/mF+lKcWvu/vjxDBTf9rF+QvTaJodQA8eSSEniOg1ozHxNaT
	 Fdf8TXxfUVPyo5w3D1cjTA+TZ8hg8E2NXs5IWWIO8YNSlFtHiJQrUwNP1uKyGyZRsnpsM
	 xzMFDqrdrL0XtellKo80sUDrXwRl2lf/YAzCO06NKIGVmw9iKAoxnakhZ+q379b3Ojw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=Pp/RLPMZ3GifsKTDdh8Pk/uftsOfh5azJIs0J3c6Xr8=;
	b=qUYF+pWB/G9Qw3SelHuWnMEjwqC0mKQktDrTCz4EV7V6YrbGJ8ji8CX/c8RQhzfcpCNH
	 cerjHFFyWBGtv7Wk95SHzfEVLDmv5yzbMDBae9jIuoW9m1IBmZ3ypUM47A6+dVWZ9eG91
	 kZozadinC/0p3DEiq8DV975PoZOG0nebS1E2J+RRge2/vxszWzEAKEW63Ixo5TI0xTQEG
	 QGc11CZiquDWCPztmoMoefL2pkM3vhjoON+169+drVduI+YKQZz1s6ogPHt+IZReSy0Q8
	 ZVnb8eVodZXhIGVm/NJreCNeIf3uN8ph/L3MbtT1FwuKRmHMEo5wZTDT8PYCxnX8lRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oKzJ/Oed";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F90606A31C
	for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 14:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKzJ/Oed
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so940361f8f.1
        for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795013892; x=1795618692; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pp/RLPMZ3GifsKTDdh8Pk/uftsOfh5azJIs0J3c6Xr8=;
        b=oKzJ/OedaSLp89aDNI25kO8hRkWzwg9SCytFgOMLXYtmXdOISm12FofiWfRQUzksy1
         mbj/KN6uCLBBVpOuqTfxAsZdAxO4ZPjJJBkJhkp5N+/xhGIBUjO+F+XWdOoHMmFlDW0K
         4qu9e3ESizgFy3mZ5/asZw/rqYyUQrdO3pLdqOUk7J2uVraDYV4PHzvBnqqF1WmA9kcG
         6/T6ewvGmxVH9UYBKFBUE3i0YbehCoysv7QROOKK8kg4DwintmPb1eZfq0OXFf5Ym0ks
         UaKMeqWL0BmQDpUQ7ZLCiL0mSEsUnrXfKpvHJ0ZCIXai8zhNK7RFcr/lAuVXYchidvoI
         a9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013892; x=1795618692;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pp/RLPMZ3GifsKTDdh8Pk/uftsOfh5azJIs0J3c6Xr8=;
        b=2ZRFJN4s7ZgOSrp19oNinktV1/snZohnx3j3EFVfjR9aE7RM6w9qAbvHDEfkTCSxMl
         o9hMu++Ey7s8f6iHLXUjDgLf+CdOFMOC/HdGgPQDApWCNUCGayJFELXmLC1LX/1gEC4b
         HUV+ovbMTzy4VfRyVxPfvGVVHxEeDRXezTPQoTzt2aKE3hfFljZG1U+Gv5elpRFj8Zwo
         Pfv6glnvKCIRnoACA7ztw8iTLjinrKyM1N8NRmoALcm+lDQbomI/SUySGaWgnPIJpHGL
         QuCBGTXQUysSwCVVKVxkX/bHcUxQLwBlqeGV/s7uhsHmEFNvnDpjOFvJw1lCMe+QomHU
         MRiA==
X-Forwarded-Encrypted: i=1; AL+hErFE/J+jCC52pKSFtMfDRbnij0porkDuUZlXWu/ZYSAQmFZ6GJ7EKIDZPnwBsxca/hHSfCb6Jg==@lists.linux.dev
X-Gm-Message-State: APuU4Z++nIoOWvYPhvw/NoeQXCWK7Wu/MHQc5q87oxL0Sm//I6b4JqeB
	w4xog75KM5BIG02YRFvSikZicjKj8ziurlFJ5rzxYE3MIE+1qw1UC/Bo
X-Gm-Gg: AZFdTZd6rA92eO5qfRzzlM6vJ94k4kiXFidBFGD6JO0nK5T6GpDI4IcTHrghMpBfZeo
	7VfwNrWlHpncyAbL9jEMWviVruAq3YAISo8FzD6oiHevZEULFHYN+nrbBFMVhgGM+tPnoA+ci7l
	HKK4DZO3NpRGOYBqJVEQjrzJsJeoIiDsd5pRMiX5/vItj5yhqWSmzX7oMI/M1NnR5DzsdZQ3LrL
	FlcMZ1MItB9to+ydLbAfw6jvNxfxTQoKsQfXWmkTmL6xEBmq/m44PpJm00zTILE54k6dxurZitf
	VqNwTAIyAKdyTVndCuyrGwru2UKalSyMCEiWX1y3gx2IqMkZ/2umH+Cv6Rzo5JMh/geezpegXbH
	ZqOiEVlbgvwxViGXKcyIdPzvUBcJKQzIl9l+ydftg2qfNG782JVEu1oMAJhM4KmqJqUgOmeIk+f
	psskcbRbvJ4/20TAV2YapvMlmrZR8J7CBbk5Xi0RCwxHKo+6HmJl1trk0Ic75+ps7fdfjfho/RV
	X9hl86oenj2tif78KqJQKuoyohPRL9E6f1F5WFTLfAQfrB7pJ8rlfwnjLGD1uNNTPD/qf8FDKv5
	7oz8zcQofrfK8JhQUeQCw2DnKDcAxidMMho8gWEL5H2FgRjI/zOQjW99Njve2ckT+g==
X-Received: by 2002:a05:6000:2dc5:b0:4a7:7bec:e159 with SMTP id ffacd0b85a97d-4a84976942fmr1578019f8f.15.1795013891542;
        Wed, 18 Nov 2026 06:58:11 -0800 (PST)
Received: from localhost (mob-176-246-251-118.net.vodafone.it. [176.246.251.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3b3sm5373344f8f.23.2026.11.18.06.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:58:10 -0800 (PST)
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
 boundary=9e0e009d1054760532dfbb31949a479f82968ef4509cbe81b751bd0d90dd;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 18 Nov 2026 15:58:02 +0100
Message-Id: <DMYFBDIV4Y08.35ZKR5G86U1H7@gmail.com>
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
In-Reply-To: <20261118142613.be3r3s6kobkkxnz4@pali>

--9e0e009d1054760532dfbb31949a479f82968ef4509cbe81b751bd0d90dd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 18, 2026 at 3:26 PM CET, Pali Roh=C3=A1r wrote:
> Hello,
>
> I have just one issue with the userspace API. It does not allow me to
> figure out what is the source of statx btime field. If it is fs ptime or
> fs btime because this RFC implementation is mixing both fs ptime and
> fs btime into the statx btime field.
>
> I have feeling that this is quite a mess in API and I would like to see
> a clear distinguish between btime and ptime in the API, like there is a
> difference in the fs storage.
>
> If the btime is used for forensic analysis then somehow I would expect
> that the statx would not report / not fill changeable ptime value into
> the statx btime.

Hi, for native linux filesystems it will report ptime as PTIME and btime
as BTIME (also semnatically), for the windows-like ones that only have
ptime (semantically) I think it's reasonable to not expect btime to be
immutable, since they are meant to be used with other OSs who lack btime
semantics.

> It would be really helpful if the statx API on inode can differ between:
>
> 1. btime is present and its value is ..., ptime is not supported
> 2. btime is not supported, ptime is set to value ...
> 3. btime is present and its value is ..., ptime is set to value ...
> 4. both btime and ptime are not supported
>
> This should cover all cases of different filesystems and also allows
> userspace to do proper backup of both ptime and btime fields (if it want
> to do forensic analysis or anything else).

These should already all be covered by STATX_BTIME/PTIME and their
fields in struct statx, the only problems are windows-like filesystems,
which IMO shuold be handled as mentioned above.

Of course, as in the other discussion, I'm open to changing ptime
NTFS/exFAT/... support to remove btime altogether and only use ptime for
their own crtime if that's what wanted (I'm fairly impartial on this
specific issue).

Thanks,
koraynilay

>
> Pali

--9e0e009d1054760532dfbb31949a479f82968ef4509cbe81b751bd0d90dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCav28+gAKCRA0bnTtJTDo
OLZcAQD9pG1FmR7nRZDk2H08cDMhIho0sN3gDoVZ9UGDLNS9YgD/Z/0Ge9mFK15R
FEjSmx712gDHXRyPIeZ3A/k22EGaOQc=
=3Ms7
-----END PGP SIGNATURE-----

--9e0e009d1054760532dfbb31949a479f82968ef4509cbe81b751bd0d90dd--
