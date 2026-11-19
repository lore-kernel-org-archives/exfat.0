Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795126384;
	b=wTEsyz89mPYvi+AZaOhK5UpEhakzDZoxa8q+yPd+jhd1UQhxWEaYnDYo2B38dkQikhni
	 v4heelaQ6sgPApZmOPg2qtj8q0m/L6QABylquHNCZKw9mRJKkTsi1RkqT00qoql1vLdiY
	 TSw60JQ4krV2345qejW7fH6Sb1r86aO6p8CvMuEvlCiPdXmBd3pJCCCbkincqNKYMFseF
	 B/74iE0R5ipfgPcWYD+ybIemnzD1xpb0OFi0tXhM3pmX5NUuNi9Cu4tZC5fN7Z77pZhPa
	 7DTsvY3u1TqWab5cyYcZQ02pRlDDhgeQUE7R0KVIjL3yfyisUQ+M51yXSaFII9wQVPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=IoYLwm6HerTHe4foGRx/rnGtvlKmmT7FHejTxyvI3lY=;
	b=KT3jZfOuhXo7H23+RzQPfp7L9YlCL3t/t2L0hPtvcSMiXBAY+q0rsAtN3sXRdjsbcCKe
	 Xa1yawJJ9hqQwiXGCAnJB+hn+ztLQ6+RLZXM1ustekrwED4jNBitM5+No3ScynovvJuWH
	 qnNt6Y0f+2ntqqN1eZ98+TzngwNjRTORcmEMwCYfKt8zpKhrvYmAq+unjcPc0Xkw2CAad
	 lTbUtzeZyU1I/ihKXoEhEADLBlFPgSJkFFxOS4Enjx+hvOlu82czBMSHrHZGjWRa46ozk
	 5ULzWOHRQ02xbbBhPhFeibcz3SLU005OOutO6qk5R8A3mFJaGp/YQROsjtGb0HmzXHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjZGPI1q;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3FF60A2610
	for <exfat@lists.linux.dev>; Thu, 19 Nov 2026 22:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E3FF60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjZGPI1q
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a358881793so110791f8f.0
        for <exfat@lists.linux.dev>; Thu, 19 Nov 2026 14:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795126381; x=1795731181; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IoYLwm6HerTHe4foGRx/rnGtvlKmmT7FHejTxyvI3lY=;
        b=EjZGPI1qnUGk18/j+5aPYgS8kt66UQ0Xf2cr7NNoKBiVL47U8nlM3SqOnAlBM8OsMZ
         Yrgh0OBxzeYLewARQKRSZu57CiVbydT11Pa5vUXv9E/WPl10rW3foBaqI+QIB5NKUAjj
         Rcz1JFKYG5nWU92dScEoLsLbroaCkO0gFqy8MG+YLM0JcRRiNqfeECD34dmt+j4XWwLm
         DpaHHmq8t8nUBprJyJqDjJAEX8L8OQFdPD5YFH3C4UV/qss2PuZDohb8ZzXTtW9mbK2Z
         oc1QuJetQxqGc/th1vkXDcHHHdZ+UHf3oi3KcfEP7XAEAf82x/wjjsQef2cDs+FNHdUN
         cR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795126381; x=1795731181;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IoYLwm6HerTHe4foGRx/rnGtvlKmmT7FHejTxyvI3lY=;
        b=wf0Caj2wLi9I9sl0MQaWGxqUwqFR9l7AO+E6mNVAsW95SoCFNdRBA5l1/2Vcb2Cemt
         1JUgdUCdqnDA1NO9gwMJ7iOylrsvSJsxoNx8WCMxZwS+78PP9OHzDhjDnuz15TkimSKS
         qpgyQ7c9UyJfvW0LXRNtrvlgsNXjPp7LZjRu5NymklEy+J4dss6BhdKY0WBSlulDypMZ
         zY8vG/vP8Hhbyim0eFpQ1s1ceQUDIJuzGRM0skQSjPDE2oRQH5ecxzqZI0+hLh8SWGBB
         BW4SWNmPDLe7LfNFc/gu0aFZxdW1gvnBVYXFcvfNOFCTxhHbIdNi+OsiztC2Oqf3f/jO
         RECQ==
X-Forwarded-Encrypted: i=1; AL+hErGB6AjsjvE+VlzekMO/KDsQZVRGVO+Dy9jgUDfEYFpbsw3H+OTldy8OGaKCengHf2FOrQIhWQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z99ETEPRoQZz5x2E/BTCCjSX1wgCADLFYrQAmbmaR2OMdWXOHPA
	RY6dp5Gx9y+632QGPX+C1Gvgct7u8S+fAW27vlXqpuUEcWLXV/1M5InH
X-Gm-Gg: AZFdTZffVnAcApB/BXBmyN5FTCzmE5BQNsGTtAbQGOSRd36oJFt07htVnOTa36Qi7ee
	VmD6mRCf7KhqRZUM/xavIxX3b70gV5FjSTDbuJFWGx0y5yEr8OGSe5ed+Yn1JqARcy98RD6lEz+
	x4DyJm8lgVu6zKmJWNEVL09TIUuPS7hoFlwge61F2j206kfWIOECPQOdpprjsXXJQIvvRrM+ydX
	oHiLVEa2WLF5Dw/O+A6FpVNlvoojC2DrIMG7zFAYbZ0e97cl4oTAPYXXoiEBDUNdOrD28fQ27/w
	mWLhyPElAcuAVxE8P5+fzI316nw3p5DQihU3CMuLMhC2MEbxJnbXEYvKLhdQeDsk9eSC8Xk2BMQ
	0Hxr0e89rxGXjaznJHFFGexjO14mVveUa28K/8EXtdpPnnO5fcuUGN7B6Ia7/pvRWEuPNfJVZlU
	DzbsAJD+hSXzKws6JDyN6J2s7eYlVDlOTXPcsjsIEqUXK4r/2g406oP58EuCFA/dkAskcO65EZx
	sZcExSpozD2Qf3xkYofKfumgDsKtR+moFQsdVbqCcVZA2qq/+nGECoyfPHFEzB72oUe9navzjVi
	M/ewF8mDWwkuoq+YWOcyO5/BCQ==
X-Received: by 2002:a05:6000:4904:b0:4a6:60b2:afed with SMTP id ffacd0b85a97d-4abb3c37a2dmr1397766f8f.11.1795126381480;
        Thu, 19 Nov 2026 14:13:01 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm1875580f8f.58.2026.11.19.14.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:13:00 -0800 (PST)
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
 boundary=7470484374e391fd8d57fd43029902e8671499255fadfb82b8d5a6f90081;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 19 Nov 2026 23:12:58 +0100
Message-Id: <DMZJ6XR1X3QE.LSJGBL45MSM6@gmail.com>
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
Subject: Re: [RFC PATCH v4 02/10] vfs: add fileattr_has_fsx_mask()
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-3-koray.fra@gmail.com>
 <CAOQ4uxiRFUqgUMvngvXc1nA7e_HMKSs+aXWVQmAEpcR7yQiQLw@mail.gmail.com>
In-Reply-To: <CAOQ4uxiRFUqgUMvngvXc1nA7e_HMKSs+aXWVQmAEpcR7yQiQLw@mail.gmail.com>

--7470484374e391fd8d57fd43029902e8671499255fadfb82b8d5a6f90081
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 19, 2026 at 8:36 PM CET, Amir Goldstein wrote:
> On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> Add fileattr_has_fsx_mask() as a helper to let filesystems check for
>> unsupported xflags while allowing supported ones. Can be used in the
>> same way as fileattr_has_fsx().
>>
>> Also make fileattr_has_fsx() a wrapper around fileattr_has_fsx_mask().
>>
>> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
>> Signed-off-by: koraynilay <koray.fra@gmail.com>
>> ---
>>  include/linux/fileattr.h | 21 ++++++++++++++++++---
>>  1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
>> index 42b92ccdc583..ba7ed3b387d8 100644
>> --- a/include/linux/fileattr.h
>> +++ b/include/linux/fileattr.h
>> @@ -65,6 +65,23 @@ int copy_fsxattr_to_user(const struct file_kattr *fa,=
 struct fsxattr __user *ufa
>>  void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags);
>>  void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
>>
>> +/**
>> + * fileattr_has_fsx_mask - check for extended flags/attributes
>> + * @fa:                                fileattr pointer
>> + * @allowed_xflags_mask:       additional xflags permitted
>> + *
>> + * Return: true if any attributes are present that are not represented =
in
>> + * ->flags or @allowed_xflags_mask.
>> + */
>> +static inline bool fileattr_has_fsx_mask(const struct file_kattr *fa,
>> +                                        u32 allowed_xflags_mask)
>> +{
>> +       return fa->fsx_valid &&
>> +               ((fa->fsx_xflags & ~(FS_XFLAG_COMMON | allowed_xflags_ma=
sk)) ||
>> +                fa->fsx_extsize !=3D 0 || fa->fsx_projid !=3D 0 ||
>> +                fa->fsx_cowextsize !=3D 0);
>> +}
>> +
>
> Every patch in your series did:
>
>        if (fileattr_has_fsx_mask(fa, EXFAT_SUPPORTED_XFLAGS))
>                return -EOPNOTSUPP;
>
>        if (fa->fsx_xflags_mask & ~EXFAT_SUPPORTED_XFLAGS)
>                return -EOPNOTSUPP;
>
> It looks like this helper is not as helpful as it could have been
> and you have raised this question yourself in the cover letter.
>
> Effectively every filesystem that supports fileattr_set() already has
> a defined SUPPORTED mask, so I think it's better to do the negated
> something like:
>
> static inline bool fileattr_supported_fsx_mask(const struct file_kattr *f=
a,
>                                                u32 supported)
> {
>         if (!fa->fsx_valid)
>                 return true;
>         if ((fa->fsx_xflags | fa->fsx_xflags_mask) & ~supported)
>                 return false;
>         if (fa->fsx_extsize &&
>             !(supported & (FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT)))
>                 return false;
>         if (fa->fsx_cowextsize && !(supported & FS_XFLAG_COWEXTSIZE))
>                 return false;
>         if (fa->fsx_projid && !(supported & FS_XFLAG_PROJID))
>                 return false;
>         return true;
> }
>
>
> ...
>
>        if (!fileattr_supported_fsx_mask(fa, EXFAT_SUPPORTED_XFLAGS))
>                return -EOPNOTSUPP;
>
>
>>  /**
>>   * fileattr_has_fsx - check for extended flags/attributes
>>   * @fa:                fileattr pointer
>> @@ -74,9 +91,7 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 fl=
ags);
>>   */
>>  static inline bool fileattr_has_fsx(const struct file_kattr *fa)
>>  {
>> -       return fa->fsx_valid &&
>> -               ((fa->fsx_xflags & ~FS_XFLAG_COMMON) || fa->fsx_extsize =
!=3D 0 ||
>> -                fa->fsx_projid !=3D 0 || fa->fsx_cowextsize !=3D 0);
>> +       return fileattr_has_fsx_mask(fa, 0);
>
>             return !fileattr_supported_fsx_mask(fa, FS_XFLAG_COMMON);
>
> I hope I got this right.

I think so yeah, though for me it's easier to think about it as
"unsupported" instead of "supported", but the idea should be correct.

Though yeah, this helper may not even be needed, I'll see if it's better
to keep it and write it like you did here, or just remove it altogether
and just do & ~SUPPORTED.

Thanks,
koraynilay

> Thanks,
> Amir.


--7470484374e391fd8d57fd43029902e8671499255fadfb82b8d5a6f90081
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCav90agAKCRDmj22qf5IG
XPKZAP0VIIYNYcMXcJcBnssVPLsh/PdS/1YfbeS+1fY2/mTfywEAh1K4KuZwkU+c
so3nKRdXgi3OcK+mKOduMSp71HXfUgE=
=ip1X
-----END PGP SIGNATURE-----

--7470484374e391fd8d57fd43029902e8671499255fadfb82b8d5a6f90081--
