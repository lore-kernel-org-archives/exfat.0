Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795117027;
	b=HdZf4pzAwfU+BWl9r3gWblpR2CvwFSG4yCmms+Q5cF7dUnM8qOJy3P9Y+94BYCKS09QD
	 uo/mIvbdPkLn6mk+Qv36AfAvTtcap+tfGezcIGSeyedjLsb4FBn//hD63Zku613bpDArq
	 Nyo7wj9esWJqIX9uZAac1kUKb8ykXcfzVk3NkoDbqqofVH0b4VDxvvL92KDZ5ChLce/Z0
	 gsZCYchE6lnKJaDavNfTj3S3qv1jy/zN5lyt9EGZ6SsaDwg7d2j9GqX+bQ/j4tq299FgO
	 KrTSTtST8RZbBOSTHoDNgXBlAOLLOhwWHyEB1yNZrfPR2e2otOhedUEJ93LJqSMsj1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vs2p+NKw9cBxSHvLMTQ1TCNiiuqtzY0tMFYF/M3imDY=;
	b=bjl1op6URsUIF+TA1fYOAGu4YTSWxThY1S7ifVZXNquqAWWqDvP4KkuTYFUEaPw0hfD8
	 6vQvUDYasYmG8bHkMZwhnhcfXtmAipxjEs5U/5kIVK+VkNK566DA/pJ+ASYy5q4EuLPJP
	 qneoFrFdKBBgkyShk6F2NGyoVbZUKs8JvO3lDFoQx5A+e1FT7xVBsf9RBqNwCiILDDh9x
	 trRZwSwhmVo2wsLbthjHAeTB+/F5oXBOfWpoQCX81z+kORdYRmxO0fcVt4RIMmVXZPW6e
	 bUoctI0PCMUD5D14jiJ7ktcjcH3EJue/z00fXYk4Gn037/nrde4FnQNoaF6MiRoFfcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2Nrodnt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431D9606A33F
	for <exfat@lists.linux.dev>; Thu, 19 Nov 2026 19:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 431D9606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2Nrodnt
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so147573a12.0
        for <exfat@lists.linux.dev>; Thu, 19 Nov 2026 11:37:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795117025; cv=none;
        d=google.com; s=arc-20260327;
        b=JKfRja34zkZO7j2cA0RbWteH5HPchxk0dsBHJPYAq4Usu527jpAmSSTXerqlydInHF
         0XyCia8bpGloEPmdDTWOU6/My6iouaO9cJ+KNfnJWqKKtF+PlhIyiP1pSzy65zgAdUmI
         +N3TwHl3SJeECHWHnBrlzpCjw2oi34fc9V/JcPENkzlUrYyRl1cUV15wrIcGwcaUzk97
         BqmrjiT/g3P9eiRMh031CWbntStQYZ1/QdrDTRPQj49gsDbuDlKVG3Utpel/zIejfvwK
         EqIwfDTJGCLL4ALgw0j8mfoSBspm3Lnk6uCnCafPQhCQcZnRwE/m5JeKbalNJcCtBarp
         n5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vs2p+NKw9cBxSHvLMTQ1TCNiiuqtzY0tMFYF/M3imDY=;
        fh=xfBC3B/rqEou4fTrBn5+IczUkQ4c8y+6MODhZpsgCFc=;
        b=oOg231CvMTYqxNpB/+bHYZ6hCDuZV7gfYgXvMhTmL0Zn/PDhqgxHFeu7iU00Stm56v
         S8rsZ5VsLAnxyhY5atmuqI5ze/kGnwmVAsLUwpRp2iSZGxMAU6YJt0ZZxiTXK2RSj0vK
         Jd2hpUOyzXs1oKPQlWuPr86A6WLUHqTbjgmqhZEZ4v8mesZgY+mI8HShhdxDc8zjmXOD
         8vH+Bzx95mrCwVSwz+eVJyQF888vXwnXDdLL0Yewxb5+8IrMpuwj5i0sTvkJAo/gkOc+
         aphkwAkjCIF5dm+11dXtmH+hbPqaCfTcdSBZWVkTFDIKC1wdkgB79v9wDHTRFanFDD38
         AQ+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795117025; x=1795721825; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vs2p+NKw9cBxSHvLMTQ1TCNiiuqtzY0tMFYF/M3imDY=;
        b=p2NrodntuWOa6cTexK9iPoH7+c8YHfxRLIy+Fni/wdurlmqI/laSifo7cW5cJ4kz/Y
         2pRKsDOu/WYaMjNJh3splHLFKTYk+nU5Xemja7sNoi3Z/N9gxZBFzkFk/Udj7vHJxHTg
         ErpCaJn8uyuWhwOuL/6a0aTI5YP0det0A9Lgyb2Ig7NQUPTUeKccyUKQ5Vyn6SH6FCaz
         oDJfGYOmvv6pbhWatpQgX1ntNJeKwX4kpXrlbwTSULjKtRk74aaIVDPYHO68vFQrIhMj
         CWVdYpRCSadufxWeZU3DZNb4R0aUF5mmLwlBA7ZKhoV13GUaIij9fN5SdHBJCXTG4lSJ
         ZpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117025; x=1795721825;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vs2p+NKw9cBxSHvLMTQ1TCNiiuqtzY0tMFYF/M3imDY=;
        b=wSJ0tWaBEQSFJ1C9z1+2NNW0QPBGTkbqMGHfdx7oo40S96c/f8NGEh+FJoP2sWMBEC
         nfymO+2Hw4BI+DxPF/GGgncu+RNcaoS2pgk594m+m4HkLb6YQp1bLla0YdUJRjZAYN/o
         Ula1xL+P+2OjdAu2JEoF5DCw/VrrMfLvVszZrkQo2OFR72lN5Ay5JQu3r0SCkDI68RCu
         j9p5Ggqm9CZr8qIj44njXj4yKq74PuRZugfhv+detQg3ANnClNcfm21HO5XaZRYrsfG2
         a7kCA4/iJg222VRFVdilLnEw9ukh4pCsLz1d1jFtAQfNB/8nZmg3tYgxVbaZDd+f+mtp
         F7lA==
X-Forwarded-Encrypted: i=1; AL+hErHgxfUNDvvdljT9psJh1jvkshRCq/ko3YjuvGpR39zfXavmIwEPbl5KogJVpKjmJmoFJ62BvQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Fgxe8eKWuO+18yRGv5yqr8nHRaGz9PQ9jHW2YTCIT/RBV/AbZ
	wQuy5J39kIZFULubtAWAAg+BC3jtad0Yf+tD2FI8l3mZtJZYKzd0XONFfdO6Q/3k5jB5bC4wBWf
	/iOF9C8x5FTyqosgtHk8eoiPBmFnDIDo=
X-Gm-Gg: AYBFou0tFj6CaxNhvESl8Zi50/VVDTuYni/PXA+MjAoZDu+sF/jw5zlFpSbtl1T0De9
	8qgI97nPPrMmmCmz2ADgaHR8UJGq9ehwdEAnPHyZ2p47B7R5k35EG2gqHEQSiAGpoxaZEkYrKGD
	wkiQcQ7c+YXb75AWsDNZPII5eR1DqXhj0wiZENTPQgeVoIT2nLIIvIgcmFz747vKl/ej3LQXCuK
	SjbcWKvB5iThgeXb2/6J34HDq0dNXPZ/0orNvPcr2xPxMKLT7QSaoFGmXE27OWqfGid99wSgAj3
	+s6jPGXDt7LTd21HwFq+7+E2zvWuevWJizrZlN/aQrKZKvxcKnmOMys9sbuxCwDR7nJUZBciu7I
	EvyVGZzEjVqlA5NF7LzVn1rKW5AlRwvzB/ZFuMbeghyAdk7/ViVZlkywv9acoFRQBFBn2syk=
X-Received: by 2002:a05:6402:897:b0:6b8:8328:8e66 with SMTP id
 4fb4d7f45d1cf-6ba37d62a2dmr239724a12.7.1795117025446; Thu, 19 Nov 2026
 11:37:05 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-3-koray.fra@gmail.com>
In-Reply-To: <20261115180343.576773-3-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 19 Nov 2026 20:36:52 +0100
X-Gm-Features: AclHuK-9kUyGBTzq0h8pZyp8mMZSXIXsu9pOi4Bu2Y5vLjqBJOsUk2EoN70jtkI
Message-ID: <CAOQ4uxiRFUqgUMvngvXc1nA7e_HMKSs+aXWVQmAEpcR7yQiQLw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 02/10] vfs: add fileattr_has_fsx_mask()
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
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Add fileattr_has_fsx_mask() as a helper to let filesystems check for
> unsupported xflags while allowing supported ones. Can be used in the
> same way as fileattr_has_fsx().
>
> Also make fileattr_has_fsx() a wrapper around fileattr_has_fsx_mask().
>
> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> Signed-off-by: koraynilay <koray.fra@gmail.com>
> ---
>  include/linux/fileattr.h | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
> index 42b92ccdc583..ba7ed3b387d8 100644
> --- a/include/linux/fileattr.h
> +++ b/include/linux/fileattr.h
> @@ -65,6 +65,23 @@ int copy_fsxattr_to_user(const struct file_kattr *fa, =
struct fsxattr __user *ufa
>  void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags);
>  void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
>
> +/**
> + * fileattr_has_fsx_mask - check for extended flags/attributes
> + * @fa:                                fileattr pointer
> + * @allowed_xflags_mask:       additional xflags permitted
> + *
> + * Return: true if any attributes are present that are not represented i=
n
> + * ->flags or @allowed_xflags_mask.
> + */
> +static inline bool fileattr_has_fsx_mask(const struct file_kattr *fa,
> +                                        u32 allowed_xflags_mask)
> +{
> +       return fa->fsx_valid &&
> +               ((fa->fsx_xflags & ~(FS_XFLAG_COMMON | allowed_xflags_mas=
k)) ||
> +                fa->fsx_extsize !=3D 0 || fa->fsx_projid !=3D 0 ||
> +                fa->fsx_cowextsize !=3D 0);
> +}
> +

Every patch in your series did:

       if (fileattr_has_fsx_mask(fa, EXFAT_SUPPORTED_XFLAGS))
               return -EOPNOTSUPP;

       if (fa->fsx_xflags_mask & ~EXFAT_SUPPORTED_XFLAGS)
               return -EOPNOTSUPP;

It looks like this helper is not as helpful as it could have been
and you have raised this question yourself in the cover letter.

Effectively every filesystem that supports fileattr_set() already has
a defined SUPPORTED mask, so I think it's better to do the negated
something like:

static inline bool fileattr_supported_fsx_mask(const struct file_kattr *fa,
                                               u32 supported)
{
        if (!fa->fsx_valid)
                return true;
        if ((fa->fsx_xflags | fa->fsx_xflags_mask) & ~supported)
                return false;
        if (fa->fsx_extsize &&
            !(supported & (FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT)))
                return false;
        if (fa->fsx_cowextsize && !(supported & FS_XFLAG_COWEXTSIZE))
                return false;
        if (fa->fsx_projid && !(supported & FS_XFLAG_PROJID))
                return false;
        return true;
}


...

       if (!fileattr_supported_fsx_mask(fa, EXFAT_SUPPORTED_XFLAGS))
               return -EOPNOTSUPP;


>  /**
>   * fileattr_has_fsx - check for extended flags/attributes
>   * @fa:                fileattr pointer
> @@ -74,9 +91,7 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 fla=
gs);
>   */
>  static inline bool fileattr_has_fsx(const struct file_kattr *fa)
>  {
> -       return fa->fsx_valid &&
> -               ((fa->fsx_xflags & ~FS_XFLAG_COMMON) || fa->fsx_extsize !=
=3D 0 ||
> -                fa->fsx_projid !=3D 0 || fa->fsx_cowextsize !=3D 0);
> +       return fileattr_has_fsx_mask(fa, 0);

            return !fileattr_supported_fsx_mask(fa, FS_XFLAG_COMMON);

I hope I got this right.

Thanks,
Amir.
