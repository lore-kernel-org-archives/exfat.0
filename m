Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628043;
	b=TaMwvv7KCVA6AVj5j9prVvCXmBZFAmB5nzirV3GWuIXsbyeDgOdRPODFq1lh4rqoQ93H
	 cTE5s8rWgxPokfiW0Cec3wlIvivHYqNx2VQ4kzB45kR+Qpa/2k6eqlqvooBeK0sAyW1N8
	 2MLr93AFOIq8ZR4EEg/FWbdKGy+m9mMK4r9Tj0OVAjk31cBrrG7EsAFLl6ufek/bMdD20
	 20qRl2Jo5VHeD2szjKIMhqT9xWvofu7+Svxr/93gD3ioWmKapQ90qsbRmT4wYXRb8s0+n
	 /Fe0E04yPsHUWcIr1naWLhKEyy6QsFgsurTFfbnI+epfu7gqxgjDvU0Ef/YmH0vOtAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s5Xf4onWksy+tbgDhi+LvOuZ3PKtrfpCQRc1Tg6vJHg=;
	b=jzQbzLGi8yFpIwZVuwfJJ3t0vJgVxLmlUp5J4zK/HqYDU8wwTivPqXVqtac7m0W7h2I+
	 rEllVeoFg88N2u180ygPghuqdJwUWTHykqwE+V1tNKdckWYZuQ8er0MO6uGEMiNUnGMx8
	 sHEqQse2uhsMPjgFSEANsWYCHntS1B2s6Abl9HzMtbvByDabXP48SkxJfix7DV8ho68TU
	 4JdIl9uvpGRkWHlRU1Ztr0lOnvxy75IU8U2oKffDgTntfT2S1GJO4CjuC/fYyMOjWZZ8I
	 sO9fa3RRdb/umODNawfwcjYm2YUxTaCONT8ocyJqnEB1Rty5y5dhDmZ6Z5rwrBKEzkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cHgSMpBw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D1606A33D
	for <exfat@lists.linux.dev>; Mon,  2 Nov 2026 14:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3D1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cHgSMpBw
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4ceaee6770so2153066b.0
        for <exfat@lists.linux.dev>; Mon, 02 Nov 2026 06:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793628042; cv=none;
        d=google.com; s=arc-20260327;
        b=lZy64w3bs7/0zOe4iG5HxU+tB2ssS8a7qJL0XIhHTdYsovg0oECg8jOb1eSQUz/1Rl
         8qAttf1s9FGVmJ5qSco/tNXpWI0A/JrUnJJbP4m9Cygl6ypvsC4Oq5tN4wnEr/8yy99C
         TmvmfyYc0tezsKQ8TgibQ1G9IMbnZSGHTtT0umVqXWu7LCYOjiTsHxpKmF8TYYMKI3HL
         9xEPYiTvjeLET3nyZk/SSaRJGzHxtsOHWXUDxWgEckJkFaEAYfKQBr1zkFaV+/4EH4CC
         Wz9BpZoQH7Sxk7WdX5KadaDpy+99glxiXfcSzz9jGi4fso67qlkv3EGtgorBhOm+W82L
         u/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5Xf4onWksy+tbgDhi+LvOuZ3PKtrfpCQRc1Tg6vJHg=;
        fh=tZ8gaS/JKtn+/2+nD/9AqlVU5sMaCkHrca56Dd5MpaU=;
        b=pglRf7m5QUjsqJ9umEIbUnmjy8XtZVPPBfCiR5pQewTMRG31b3vRuU1BfGzHoqaQDU
         VIgZXw/BXKRZoClzjN/MQpo/R/dmbuJ4ruZcPsUM/DuzKF7ybCtbOSThFxao4DWs9oh3
         cvBnQganln3AzU6ldCWJ2weNGZRfMgMoTuC9WOXVsMaRpj6YFisxfaFbsq/oOoFlwwQj
         3D0KvEMBQEZurZ/N/dg3E8Ft+54JPN8Hymn55zLLc8Pc158tT/wezG2bb5BPsdLjNTbF
         wqhy5DcWW6StavENxrnLh+h1t3fQgoIxQCdYFuS2iGUWY+bSWyg2jTq3RcKE4NaM/dQI
         3eJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628042; x=1794232842; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5Xf4onWksy+tbgDhi+LvOuZ3PKtrfpCQRc1Tg6vJHg=;
        b=cHgSMpBwtlzDeUSJVncSojDt4Z8dPmCcpdxzKZY6Zej1HDqFJ0f/XC540nCsl+dXIH
         V4vgS5ZPpp9zfRnZvV9SYEFtLnFFmMB4sNpOaTLXMJaamAwRIMHbC0twOW4hB+AZfiRU
         D5wOmWFcJ3mwZkYoVcL9Ig59H6YS7jO2FUIExUL3LGtFmVj92uIeyNDgXlKw4gPKdra4
         ukWOIJr14HWFkk868QdHgXwk63nUp7UNrthE2UKeDGMdzwsz2pO8MxlP9A42R1qNyNkZ
         ayBpAysuseDSjoza67frjoJZfsRcpURrmD/MosUI0Sn1dGiQaYYkVw5hPpSocpWdXjMg
         2azQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628042; x=1794232842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5Xf4onWksy+tbgDhi+LvOuZ3PKtrfpCQRc1Tg6vJHg=;
        b=MbOfZhs4PxkOZgsOFwsWP95fYdXQv3vKJepe8pxAw+lfZuDupuXabJq7zfoG3daQwJ
         cpbxJ6wwpfbD3W7MIKVrdiSsNZBVaJbLIBqgcsnZtVo5r0M6FCYibH8FRy8eB5d8qJ7E
         RKWIxv0DPljCn+VFlRTCLzCuN7frg6nyQYBb3l9CxLdsG0pjF7j5Ifzcr2SpIoUZf81d
         Q4hE3PNBrV5kf9t1en4BFBFxk0/BWZ4wzi8ptoUicHwMTqBg4fHUn6+kB0Kb4CRIeF5u
         Gu3NHDdt5Z2fOG6jkt1htmd4t+1JvLT0lrvBR4SJXsSrhAGl4V/OSYgYvw6Iv2JGhdzo
         nfnA==
X-Forwarded-Encrypted: i=1; AKwUvBzL6d53ybEgDLnGYSU10g+GzKPF1Bks/xW0XhQU8fjQQQoh03RItFMLMf/KF4henOxWuGrXIg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9jpGWfzD2v6th47ue89UVTgohzcCbR9b7siXYXogPYtIoyUbN9
	iN7lg7eOZ5t55Ba68Yx2Zy+jmR/hiBTP0fJnOZyotjWntSzwXrFQDcyv/kKKW9fhK6hvXhmhpa3
	gMh+E5b7u+OsTmWUYb/K/FtJAeASzjBs=
X-Gm-Gg: AYBFou1gEZMruQ0kJjJX29myuNCZ07rGig26pXobEABVzoogklXe7BE7G+i+XOp5JMH
	5q6MUpMWA4SnG6eCraqg26tPhi4znR3ZxyhAvIvN3z5RjuDH8ercHMQMhMiY7diZa83Irj25/Kb
	cNiDrgB3nOb+z/Jk6X55SVmc7IrzYwEKaWKFxJxJbh4Q/orTCDqLp8lW3dI1nu/u1YAL5ANBwIU
	63THBu+wE/usVRXG/4AbeMmn/6pUfDrR7W8sMfLNcwIhYMpI5JEUSZXHYPVciNGTTb1jkAfrqJi
	Pq6Qo9WgkdWWia8vH7yU5dbWxDIrXHQSFHSzFPwggx1Fx+ayOPydE6vvbkgyBSmxCIGRLMJxp+o
	Mko8HkSmZJ10FHENGVFSksQHbOagRDF83z8y5WxE+TxAnnx0ntFBs4kW8KaM9E4a35ifQKA==
X-Received: by 2002:a17:906:9f87:b0:c33:9fab:5f61 with SMTP id
 a640c23a62f3a-c4ca7a80dfcmr888696766b.29.1793628041476; Mon, 02 Nov 2026
 06:00:41 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <20261101015551.786044-2-koray.fra@gmail.com>
In-Reply-To: <20261101015551.786044-2-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 2 Nov 2026 15:00:29 +0100
X-Gm-Features: AclHuK8C6KXo0yGTK4G9AdpXOF6ch7dlD0GPHOdparCBMVqSIwGLvVGFGi1BG64
Message-ID: <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] vfs: add provenance time (ptime)
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Chris Mason <mason@kernel.org>, 
	Jan Kara <jack@suse.cz>, Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <cel@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Sean Smith <defendthedisabled@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com> wro=
te:
>
> Add provenance time (ptime), indicating the time when a file or
> directory was created. This is user-settable via file_setattr() and
> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
>
> The semantics of when to preserve this new timestamp are the same as
> mtime, the idea being that there is a correspondence like this:
>
> ctime <-> btime
> mtime <-> ptime
>
> so every operation (copying, moving, ...) that currently preserves mtime
> should also preserve ptime.
>
> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() to
> allow ptime to be used with the file_setattr()/file_getattr() syscalls.
>
> [ This is a re-implementation of the initial patch[1] by Sean Smith
>   <defendthedisabled@gmail.com>, following the advice[2] from Darrick J.
>   Wong <djwong@kernel.org> of using file_setattr() instead of updating
>   utimensat() ]
>
> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@gmai=
l.com
> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
>  fs/stat.c                 |  2 ++
>  include/linux/fileattr.h  |  5 +++++
>  include/linux/stat.h      |  1 +
>  include/uapi/linux/fs.h   |  8 +++++++-
>  include/uapi/linux/stat.h |  7 ++++++-
>  6 files changed, 52 insertions(+), 4 deletions(-)
>
> diff --git a/fs/file_attr.c b/fs/file_attr.c
> index 833e03810b24..c0645cb22bf3 100644
> --- a/fs/file_attr.c
> +++ b/fs/file_attr.c
> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
>  static void fileattr_to_file_attr(const struct file_kattr *fa,
>                                   struct file_attr *fattr)
>  {
> -       __u32 mask =3D FS_XFLAGS_MASK;
> +       __u32 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
>
>         memset(fattr, 0, sizeof(struct file_attr));
>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
> @@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct file_k=
attr *fa,
>         fattr->fa_nextents =3D fa->fsx_nextents;
>         fattr->fa_projid =3D fa->fsx_projid;
>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
>  }
>
>  /**
> @@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
>  static int file_attr_to_fileattr(const struct file_attr *fattr,
>                                  struct file_kattr *fa)
>  {
> -       __u64 mask =3D FS_XFLAGS_MASK;
> +       __u64 mask =3D FS_FILE_ATTR_XFLAGS_MASK;

That is not the correct way to extend this API.
This fixed mask was added as a placeholder for
"We intend to add support for more xflags to selective filesystems":
https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-2-amir73il@gma=
il.com/

Please see this POC patch for filesystems to publish their supported
xflags mask:
https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-3-amir73il@gma=
il.com/

This will allow callers of file_getattr() to know if the filesystem
supports ptime
without trying to set it and failing.

Thanks,
Amir.
