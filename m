Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204644;
	b=ctKFwaymn4uzuTqpTCUvnrJXgTeJhkDN4lcy2t16bjgYVcO5uEYR2ztOuVlIq4Fhez19
	 YcetMBfl5zBKBVSEoxq2q3omEWNORvijW4+6EQ1g2ta1lSR6b3nQgwPqRGOu2mjGPzGLS
	 WL13W0zSwENURmCBPV2/sY2KFwe/lRghP7WlwhRNlTWBr/jCjY+tCP2076JNo/YDx81wZ
	 KoXp4tJ2nZLg4OV1Ptr9WAvuKPCjY7tWoH4R+TZw1M/AEFPDwRz+QMKkiZEBnWoqeagXe
	 s+4ucqDqMNgf1pE4z/T3QUrjsDSEEWdT7w6ahEpKPRtCxhBdwsw1j9m8+zSxfk8Rg1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=bepP2SIrLZrZLh3YoUhcI7r4qP8FXfE4vnBTwIQ4Skc=;
	b=fUqd4IbnOKAv8n37ab2ENVmNHtuo2bcXQmonoiP0bzeVj/fZBG8f5UID+J/+U4Q2Yvz6
	 DPalBGW1lmPwnblx3ZaWOtzgFQs2T6P7LpUlahgpSezXbaYyyGQxeTAQsOaRk6dxx/UDZ
	 c83Qm7U1KfEooGAZHdLVM4OBgpij9p1yzua/KxVROlxE85Lh5FYHfQftqWF1D+FyMY1zx
	 6aX9M5yuN4A+NglB5h8wj6Gty1iy/X/vSBYjwc58f4+cqr3rXfWRgjjzka6QqULfnmZS7
	 0czUwv+C1xtZvDr6B4r6Xn+ZvhQnspC/zMbStIBlXmf0FhwBI3+X1mD9WlHZsBCod6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsfPVQDg;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4AA606A6F1
	for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 19:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E4AA606A6F1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsfPVQDg
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a358881793so717171f8f.0
        for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 11:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204632; x=1795809432; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bepP2SIrLZrZLh3YoUhcI7r4qP8FXfE4vnBTwIQ4Skc=;
        b=LsfPVQDgJ63o9+wyFNwz5EU+jyikQPvxh5ZiyuTyN7vDqFAy15f70kpZZDDlbNMO3E
         pw8DogeSNI0LAcvhdC+AMo8/QuF6fyM2GJVs3vzcHTBh1lYtTFaSiyOdJAZoy9XoDhOo
         IQF5q6nFnJLXcZjhGroxAO1+9NhoSZkNEGmT2erJDG1KdiOIMOQVv5hcBYDpoPgmJ45/
         iYLe8uf1Stx9udME+pyX1SxXMPQB3bEnUE/lB2EhP6DQg0tbxuAc+Hfpc/2xm/W5GS9L
         4iDk6EbPzsGqolgx9IBWXktBYlhdu05OWvwSvYNR4gOPqa0tv0dBPobDQZ3nQ+3BxJ21
         8mZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204632; x=1795809432;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bepP2SIrLZrZLh3YoUhcI7r4qP8FXfE4vnBTwIQ4Skc=;
        b=VyBY1v2AA6G8CvWWVXRYzEXlYDxUkU6WPtwEi0dOS9orLyuCsAShD8Y0AGM0coGpiq
         TcqRJvc7bGnz1F0Wj6t/EM6OzXoV9b/PCSCXFzf01i9P+6o8ecjpNZpHooyJCKaNseNa
         V5cZ5JmaVsprhP25LO7H98agUwp+E7kzfW4Bj0J2iBOLoFH6OpKUi0Cd22acVj9Dq/6g
         wW5xq+GF/8nXuCRUzzDJGtV2ihx7pEHn+8fv0fY7u1PddDVQc16j8nOAGp4p//8CTCVU
         xvDcvEt63KjnA94ZpaqSQuVoDMZluPYsrMrKzZPbOLtn74VHVAz+3+i782j94pJI4VqC
         TfCg==
X-Forwarded-Encrypted: i=1; AL+hErHVfwGOCiPEXNRBomp8V0TnfpdWS+3GXTchS0XBVVVo+5UWT5atNLeBiwb+vRrK+ry07HV8Gw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8qU0wdglNbCq6Zagy0mqKKgm0ifLNhA0OfWbLt5j1qsVRJzBFe
	LHApl7D8bP96aVzplpEM0W5XjfohKos92ZDvfRImyFmg1VjWSzPfPC4f
X-Gm-Gg: AYBFou1MZUKN2bmWGyS72FDnI2ctZ4OvDQrktXNmD/Tgy4hbnx2oaTqkulma+8wq53N
	zRhuJp0ta/CvZyb1fNR+TpZ6fU9st7V0Q0QxKH2R3H5a7Efk2BqJqYGMGnASKwHJz50Z83q9kol
	vctwCgr/Nvz2FeW+/rQCuUzh++AqApQUp3SzaPSPKm5/UjeAVd1UCF2ze3VTknQrrzmJFG/lxWP
	JMLXzJpFSYAdjH+w96qUS+mpH/uHe8ZYADeiz57Q6owjtaaS4Qc6Hry7hCfwljrLB30TRMoPKxA
	H+aGVAJJoC9sJ2j4wN7U/3cgHTva9/5VvuRq/XLuDdP7FJMlUWkNz0G3CuKaC05yhvI0llJ5FE1
	wiK4qgOWPKWrXHM/pDqGM8xYX2k27n+ZJtYfmZEdfWmk+V4VlEAHBWhxlTuIW+dsmNbqkOqS1PD
	N7OlAg0xaiH2rXGQ+uFyi5xWGKG2uE3VXysZxXJt8C2/Fbuf8SdM9Ls3Ni1uW+lrcjh8YKN+iMS
	L/jPsUZgGTAqxnKMxfE5xKH2lv/efG7KfSfqJRvAbnlPKMR5PLvCU/fRsSIzhAkvxhtFIPrgkqf
	k8isADLZjnJfkkVFkTbH2oZpfg==
X-Received: by 2002:a05:600c:638e:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb887e265fmr93789305e9.3.1795204631450;
        Fri, 20 Nov 2026 11:57:11 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm177401215e9.0.2026.11.20.11.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:57:10 -0800 (PST)
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
 boundary=0ce1f2737ac23ac54221dfe9ad89c8615ea720b53f7a9f6f6b271bd43f0e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 20 Nov 2026 20:57:05 +0100
Message-Id: <DN0AXFYCMGXO.1O5VDUA6GJCT4@gmail.com>
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
 <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v4 03/10] ntfs3: make crtime user-settable using
 ptime
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-4-koray.fra@gmail.com>
 <CAOQ4uxjdEiuJMQxtSL8XrPYHSamtfMh+BM8kS1wj_PVME4JynQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxjdEiuJMQxtSL8XrPYHSamtfMh+BM8kS1wj_PVME4JynQ@mail.gmail.com>

--0ce1f2737ac23ac54221dfe9ad89c8615ea720b53f7a9f6f6b271bd43f0e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 20, 2026 at 4:58 PM CET, Amir Goldstein wrote:
> On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> Since NTFS supports user-settable file creation timestamps, map
>> provenance time (ptime) to NTFS file creation time (crtime) by using the
>> newly introduced ptime API (in commit "vfs: add provenance time
>> (ptime)").
>>
>> To do this, update ntfs_fileattr_[gs]et(), ntfs_getattr() and make it
>> persist to disk in ni_write_inode().
>>
>> The timestamp is now retrievable by using file_getattr() or statx(), and
>> is settable by using file_setattr() with the FS_XFLAG_PTIME flag.
>>
>> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> ---
>>  fs/ntfs3/file.c    | 20 ++++++++++++++++++--
>>  fs/ntfs3/frecord.c |  8 +++++++-
>>  2 files changed, 25 insertions(+), 3 deletions(-)
>
> Please don't change the unmaintained ntfs3 driver.
>
> If you want to include an ntfs patch work on the new fs/ntfs driver.

Huh, I thought ntfs3 was the modern and latest one by Paragon.
But apparently I missed some news[1][2] lol.
I'll use fs/ntfs for the mutable btime patch then.

Thanks,
koraynilay

[1]: https://www.phoronix.com/news/New-NTFS-Driver-Submitted-Linux
[2]: commit 1e9ea7e04472d4e5e12e58c881eaacfb3e49b669

> Thanks,
> Amir.



--0ce1f2737ac23ac54221dfe9ad89c8615ea720b53f7a9f6f6b271bd43f0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCawCmEQAKCRDmj22qf5IG
XMFuAP4jbqqWLf0rzRDeTfZI93Ntri5exvb2a4tXBADewtwEHQD+MLXXfUDqNxpu
FJSnl3dfZi2d0aWeniR+psgoM+VAKw0=
=6Hcz
-----END PGP SIGNATURE-----

--0ce1f2737ac23ac54221dfe9ad89c8615ea720b53f7a9f6f6b271bd43f0e--
