Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704423;
	b=c/utvjeFvogXR5CsoCOqn7GFQ8fgjYVfX7rB6Xlq3wiPeJwEIajFVN4hhHMOFr2vBVsW
	 wOcsnyQBbv2d6WnbjZUPmf08Q14LGCwTm4tfNF/IAROhbNl7O5hGHENmydWzVoLnaO3wk
	 jjEyiPKYTFDzJSqDn/BIOPCoHC3P4kXQgi9QileWb8qekY6gBDlJDbLvpDgZ70dQ1uoJ7
	 /+blq3XLHVnAtlwX6UV8oPW4RnNAppEDqungEjPrBcdtxtbqXeOEJdlnfdPe/tJRO3pnt
	 2VMQnM4Cp1jEvMtiesKUkXTpFfwO3+kzsHu/DvGzsQgip/9tGE3PaHY/dk5in/S5LhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=aApL6RX54q6lZ7c3C3mWoQyOMn5uc2rO6KvHRJ9B9N4=;
	b=dkrvaIIy94/MeoO8/84P/7viMH4b96ze+fh8XwuOtB+SSUvALGYIl6BpMQHDuOCPnK6U
	 I1pCv3lp328x1BpZEbC/7NlTEpwjd1ZxUMdB4TN2/h0s/YMV/N2HorA4w/t7N/5B2a4E7
	 eBeyNFtlTM8mkS2BGaYuOkccKAWhW/DdPI0md30TPAtjH4qei3pdrWsXT2OMKLKwcWgv4
	 IBKPC7SFBww58O7Cm7rzMEu7gBW3fBApYHC4AO6r5nC7u59+WYX0w0hPYjeSTLZ8FSfMM
	 wdJB5EC/wyOzoXr1FhPnFIQ1PWC5Yc1NcKlZBfpSZi9KuXUpnbskuZIpuSw01MzdlEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MdRlQ8R9;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5A3606A32F
	for <exfat@lists.linux.dev>; Tue,  3 Nov 2026 11:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C5A3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MdRlQ8R9
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b060ec084so2375876f8f.0
        for <exfat@lists.linux.dev>; Tue, 03 Nov 2026 03:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793704421; x=1794309221; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aApL6RX54q6lZ7c3C3mWoQyOMn5uc2rO6KvHRJ9B9N4=;
        b=MdRlQ8R9ad4iO+p7eIiZuxhVfR9qZX0NwE2zWB7OLQfn+1kNXKMfkAs+FWVIeedWf6
         7e8RLQYoASiqSFsokk7PaNUI8pIE48QyH9Ln/YNG5QvRSNCytS2FoGh0cRaanApYmNWJ
         /GrlaM2iuUYD1V3dGxutCdsKX6/UkPxpPH2cTpLjtRvr4xys3xhfhrVf/WIwvW77x4MJ
         z7NNQ6qakqfBBf83errdO41Q6waH+antRYVfVgswP3hayaLku4vuyj+i8jZkV6KuCP8J
         32J1PgnRUTcr6DaS2nXNPR50NBxOSJaxy513+pL0Y6whrdShdgJn74wTcStM8hE1pFuc
         WFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704421; x=1794309221;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aApL6RX54q6lZ7c3C3mWoQyOMn5uc2rO6KvHRJ9B9N4=;
        b=OZwLaWRHKhjUhYWpEvFjEgFo0o78w12pCSKiTZj/3v8G2Mx4uJpy8D+ZKn8rrZ398m
         il3FvjMzF8Ql7z3d+XnMc2kzAFmEQJHumaGLjxzg+cK7RCCcA1woroBfG1XzAdfjaZL5
         b5yFGJ9mf2xwo3Fl7KDOtuyokEzYACQrH5+VLpbc23J74pao2T7t62vPBg+8SNtEOSUm
         gCucbZBSAKlL5EOfuEZuTuaA3/fQz9Yj1xiOITY2MrLz5/TNcx/JRBsJ3b2G3Ua7Me3q
         ymn2KA7QDrcf1nzk+PB3xK3cpLGKQFqfw5WuX6x8z/1lA5DiC7dJV9jHdPQcm4vIPKjX
         ZucQ==
X-Forwarded-Encrypted: i=1; AKwUvBz24+LTLYt8JvTkEBJwBidhaIYzKkQnOsGufxGs8BTW3+gyCjiKuT39ia+mA0dRNa7MY2OkWA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8mbq0ypr8HAusMjOwVWcnLsWETJ/yEdLXkUX1SXmvu2J/C/YXC
	QSI2y84Ni7LrJBBg8UXb72Bvwq7jek7P0xgJfOPndWkulr0/vRZGu0xM
X-Gm-Gg: AYBFou0phY3gCAYf7NZXnlL7pF5HdoaFrJH44EdCntJIlal2UPopTyrCSmA2Nx0X52N
	nWX5iEENJ1f2AYwGlFy2nSYYRc6N5mkYjzVgG5oX+XRvooVMUWes1hpCcRot60G+msyuA7Qlq6o
	pCNTekudurMWICnE/p6aRRfbLANY79/wMbIdjVmbg1NcdvvX9t7pQla9bzZ3BU6OVA/phYg/Enf
	+iSbLX9jwnSo+2PdO+v7ASkiVPdeP52J6jtaZjeEAmxjtZynf+xHDfVj2dW78l+N5wEHyx9HMXr
	bSMaojVnyJ1ud4fHwvQjHV++l3EkhMlrH77aZuw+8bInmJVMk4O8g/93l78lU3AxW6bJKgchj1T
	qwbHM0FUVP+wjyLvPupaZ4MZkGtA5lrSwuIb8Rs26l7P7WdsIUkNUilzQl+3KD3F2fWp8alokwB
	FevCKZ7FnJDtZGZeTAtRnxp4fwM1E0KlDkKgONX2HB8Qu0OmwPvKSjJDC2aO7pv3px5x4OCJbC3
	MXhvasX68nWBt84O3gmMDJDRu1IHYAmyQCSw6uFCwYLYK32j3zWkDVJfE3sQiE3kN/yDFWuWPa9
	S6n2GSF2SDIN0fJQYGc4Orqwd9voUeVEyly2ElMiWzC76vAY
X-Received: by 2002:a05:6000:4311:b0:48e:20ed:d5e7 with SMTP id ffacd0b85a97d-48e6e2ff167mr26601099f8f.34.1793704420858;
        Tue, 03 Nov 2026 03:13:40 -0800 (PST)
Received: from localhost ([130.192.98.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a5a7sm25639265f8f.37.2026.11.03.03.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:13:40 -0800 (PST)
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
 boundary=e80d9f52f04d877396f5736b7426fc0b9ce68638903c33e71797700113b3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 03 Nov 2026 12:13:37 +0100
Message-Id: <DMLJ5DR2A4KZ.28U8XSZ0KFJTG@gmail.com>
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
Subject: Re: [RFC PATCH v3 1/5] vfs: add provenance time (ptime)
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261101015551.786044-1-koray.fra@gmail.com>
 <20261101015551.786044-2-koray.fra@gmail.com>
 <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com>
In-Reply-To: <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com>

--e80d9f52f04d877396f5736b7426fc0b9ce68638903c33e71797700113b3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 2, 2026 at 3:00 PM CET, Amir Goldstein wrote:
> On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com> w=
rote:
>>
>> Add provenance time (ptime), indicating the time when a file or
>> directory was created. This is user-settable via file_setattr() and
>> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
>>
>> The semantics of when to preserve this new timestamp are the same as
>> mtime, the idea being that there is a correspondence like this:
>>
>> ctime <-> btime
>> mtime <-> ptime
>>
>> so every operation (copying, moving, ...) that currently preserves mtime
>> should also preserve ptime.
>>
>> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
>> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
>> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() to
>> allow ptime to be used with the file_setattr()/file_getattr() syscalls.
>>
>> [ This is a re-implementation of the initial patch[1] by Sean Smith
>>   <defendthedisabled@gmail.com>, following the advice[2] from Darrick J.
>>   Wong <djwong@kernel.org> of using file_setattr() instead of updating
>>   utimensat() ]
>>
>> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@gma=
il.com
>> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
>>
>> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> ---
>>  fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
>>  fs/stat.c                 |  2 ++
>>  include/linux/fileattr.h  |  5 +++++
>>  include/linux/stat.h      |  1 +
>>  include/uapi/linux/fs.h   |  8 +++++++-
>>  include/uapi/linux/stat.h |  7 ++++++-
>>  6 files changed, 52 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/file_attr.c b/fs/file_attr.c
>> index 833e03810b24..c0645cb22bf3 100644
>> --- a/fs/file_attr.c
>> +++ b/fs/file_attr.c
>> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
>>  static void fileattr_to_file_attr(const struct file_kattr *fa,
>>                                   struct file_attr *fattr)
>>  {
>> -       __u32 mask =3D FS_XFLAGS_MASK;
>> +       __u32 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
>>
>>         memset(fattr, 0, sizeof(struct file_attr));
>>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
>> @@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct file_=
kattr *fa,
>>         fattr->fa_nextents =3D fa->fsx_nextents;
>>         fattr->fa_projid =3D fa->fsx_projid;
>>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
>> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
>> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
>>  }
>>
>>  /**
>> @@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
>>  static int file_attr_to_fileattr(const struct file_attr *fattr,
>>                                  struct file_kattr *fa)
>>  {
>> -       __u64 mask =3D FS_XFLAGS_MASK;
>> +       __u64 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
>
> That is not the correct way to extend this API.
> This fixed mask was added as a placeholder for
> "We intend to add support for more xflags to selective filesystems":
> https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-2-amir73il@g=
mail.com/
>
> Please see this POC patch for filesystems to publish their supported
> xflags mask:
> https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-3-amir73il@g=
mail.com/

Thanks, I did not think of adding a dynamic mask like that, I will look
into it and implement it for v4.

> This will allow callers of file_getattr() to know if the filesystem
> supports ptime
> without trying to set it and failing.

So after adding fsx_xflags_mask to file_kattr, every filesystem would
populate fsx_xflags_mask with all the returned (=3D=3D supported) FS_XFLAG_=
*
in their own specific .fileattr_get, correct?

Best,
koraynilay

> Thanks,
> Amir.

--e80d9f52f04d877396f5736b7426fc0b9ce68638903c33e71797700113b3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRJ2XvJtXGwULYEerQ0bnTtJTDoOAUCaunB4QAKCRA0bnTtJTDo
OGlqAP9FN1O36Vljpv9qu+GHoMq4dpgT5l0jYNkHeq3xwaeLZQEAp8imIPg1c77f
Nx6+7PN4i6jMGvOBbnpA+XfhiQmdEgs=
=mk5d
-----END PGP SIGNATURE-----

--e80d9f52f04d877396f5736b7426fc0b9ce68638903c33e71797700113b3--
