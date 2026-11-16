Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859829;
	b=ngiovIONid+3Bc5yPeaqK1ZtLhag3LUYiPN4miB0xYB434kuf7yql4lg5YjtwrBUI8y9
	 NJYUCd+xkFpWx4IrE/z8r0ZVNh6O9ZzLMsRsx0lDqePDexKVVFk6awiokEmyFSLzJT5y1
	 LHT0Oy7LqWR/TC87C4rlYMAjBWPBbNzmG60qn+jacSFGY/UeRpnKdukYqzpU1QsJOyejr
	 Jiai7XGs3nO545LI23CAaAcTrM1XysErUkYyKzCNW49gJFJXGRP4sXKIDYkbS5XXTZS6S
	 oD71s0P9koE9oXsTcPtFTIlhaWfGljWCHLZbzlHcfa7kiON7GmF1Qtkx2JJcAUrKi4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ysm1ObvRHi8QkErB3cHCKWgyx+Xhy7Q4KWF6rBHGU1o=;
	b=G5xbwp+jvHZwrQRvc790TDWBFkyFzDWfPWK2hXw1yGrDIGclMhHGwoOAEoSflsmEPmz3
	 qRBzBfkXfK0GvVKmQdQlw1mc11onusnSau/CYitiywTjgCbVqohi8/GuRfqGvm/S70Z+V
	 TAS9I8+xkSuiZr+OGOHuwUZmoS2993wsQGD32Wtcpuh5pPr9cma2bdrBY4kT5LTyiGIWe
	 m2Cl8ttSofj6oBOxO30ZzDZFs2nY7cePqwLRHfMHd1YKQ2b+lUVb8RaQ4toUSimWQ9Ikd
	 /t2FnP2/mhKK243qWmoRi8cxP/bzubOr+6Pe0Qq+g85t/Md5p02jEUc/DeIS0Ztieeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRPZKUnz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA754606A8AD
	for <exfat@lists.linux.dev>; Mon, 16 Nov 2026 20:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA754606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kRPZKUnz
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50e9408873so134639966b.0
        for <exfat@lists.linux.dev>; Mon, 16 Nov 2026 12:10:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794859823; cv=none;
        d=google.com; s=arc-20260327;
        b=fjc+KLxFtiBC613IL/R0q/CXgTFAQhvcSHSgSfGTFzngy9eoz3b6bg+PFOOqDs+ES5
         rF4BdjksJGI5ODvEIGCUuWLa5C+wOj3IxozA7utBRgGjkL+ajHf/xMUmmetr5I8u0ycT
         pRZYQhIOZmZ+2B/V7pxrFZzFLObFv4ZiXSitEFa1R9+FDQEGjveh/2gCSdqdtslP0bMn
         oBohLwWG0voA9fnpTlBTnt+2C7ajYMHVnTXpGUea43Xp+97nKtVFi4oklA6EIlTf/aAX
         aAau+VI+/+87PaRiCtrfebN9XyJ/M6pFmKF2BAe2eyJRYLXgGxrWkcHzCImfnmpQppCn
         AmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysm1ObvRHi8QkErB3cHCKWgyx+Xhy7Q4KWF6rBHGU1o=;
        fh=4QNVQH3KDGhQoUMxzaIOk1VLMTxqlfhFeT9idr7O4tE=;
        b=G77OVgDxZVYrSoO5dCwvDTWwN9RsDfTYfbUYVxtRnv/fFQ0bmYGF6vGqcC54KYofCL
         XZGpVDn7kcLbhk9u81MpDQrXGtVG7botaaXke4n+3J2NegdWkVkQZPOeEeu2+7i/lckh
         2kld7qbGpaJqc5upKrlOF3caSggJEVSLMGgf7zXrHoMQFUBF83QzzjBRq1tTn6OYS4Ug
         BzSVtLzwX4aZNbgbGMb8LhqO9DDtyLaF8xt7BgO4lrmVsiybKk1KKCEiXldeXfpvGfzr
         e6FA9gua6cyZ6KGWQemGxD97Ux4dvxAXUDP5byZ2U26RK1IsP0rV6cESz8K0MkXWwTQe
         nrIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794859823; x=1795464623; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ysm1ObvRHi8QkErB3cHCKWgyx+Xhy7Q4KWF6rBHGU1o=;
        b=kRPZKUnzY/wTFbz9RyybDzhEt+TXe4FOsFwJcmw9hoz8Hbnt4us5NMQQR73oQQZykk
         Qhzs3Z1Kv789EJE4pzHPOknakcYTdoZtAlXj1g2KyA2zh5VBaLeQQgUNsM02b68CIhdD
         kYTtV2W3y2XhwSyiXimFzjQ3nw8mnME0Q1BCRkuSAov+S31mpOJ/GaB74HmfKdkwzeLU
         OlRL5+0VdaWNOYrlxlOteZHl6iA4k+/oX9Ww2TWj6wxkUjnXT7D8MquinMI2LmnOZIXi
         CzaRrPrU5ysP3iu0DnTKgERKVYZfZUa/7UpfMkWUYjacFK+oiIENf26/uTn5EHq20A7C
         f2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859823; x=1795464623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysm1ObvRHi8QkErB3cHCKWgyx+Xhy7Q4KWF6rBHGU1o=;
        b=JUYqTDCkgcHFxHEFm0ThLZby1fBYrVQjrgdIs/LTbLOfHowWjVLTTC4UFCtagjcgno
         Hn0BsAcaTXRTUSS8U8nB+RDcM5hdH967EKqDkI5dQHTHzJCRfqNJbGNix2z2jH2op1mH
         2otXVIDVkzDok5MhiW98vleCAaKBPWOwLZPgldO0YXD9eo6P13O+VBpSJCdN2MhQRC2K
         rtoODoztXslY8jXybGvWvkEvfICA8144GRWItXAmQCIPoiYW5EDMYN1ktQPZ5g5o6LrJ
         D9BJo8/SqbbTiCki3hU7RzKsofqhia5xkYh4ZG0hi02Ir5AoYLnvhomiWo0AaVYuGZAi
         ZZQw==
X-Forwarded-Encrypted: i=1; AL+hErFWfEGblDGyXXkXlhbicFVwnUjCK31rZlCPfIHePdS1R11vsbhWqY1RxcwIIdEaqYvB4SUgmg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/sYTEKARufc6HSUgExPCra/ZzQF1V+Q5DSYrQrDkPamlekghL0
	dhkDxzhouOBK1pnhsZQvqvcv2IFv8v3aTJT5LBzs9qkyGhY22d1OWfrTkCfXaXXy29Tb7bM120y
	/I048Vo0wkzaa5WYC2S6InSxh9NWpmEQ=
X-Gm-Gg: AYBFou05MSTC+73ocjZ20w4OFV11XoVj7PoLrxoD583s2plsZGEHNRFzhJuGbA5jgiI
	pYZYTMp9MAVIFjDjd5jRKyjvuyBaFcpzO9qBcM2FOTszJcjvhRWoI+0j2gpdl1dtiw+qBv1tk4G
	u/ztgafQisuGmytnMddCMqUUT0+zZWaB9XPj4tTODwD837QsUZOO6WE0Cghq8ghdaL8oVC/tDUD
	+JSTXenf7Y5qWlMDb4lJvfUMKNUtu/oF+zQ/bu6Cq1piUYXnvi7kk8Sjg2bamrTcBa4s0BVhlpu
	tQMC2fbd1rYBLutleXGyJD8ASbqDSG2B+hQAljeMzglFB4WuO6ZmooL4KfDXP2/soUZuOceMD7i
	MItnZPdqu99FTYi3jKvnSjtVcdU3qGT44y7BFm88gR4PWeYk5nJJOLjV6oyB5k9ra6DG0cA==
X-Received: by 2002:a17:907:802:b0:c29:5172:6151 with SMTP id
 a640c23a62f3a-c5096415a37mr947928266b.45.1794859823120; Mon, 16 Nov 2026
 12:10:23 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-2-koray.fra@gmail.com>
In-Reply-To: <20261115180343.576773-2-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 21:10:11 +0100
X-Gm-Features: AclHuK8HNkwAKAuOh7lYPiqcrySU8WxcW1gHG_-7Ti6IFMhOniGdmSp4CPwzuwg
Message-ID: <CAOQ4uxi+50NU8qzg+Owvr8gFZ4vYF5FqWg4Hr9vB6ONUpPsFwg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 01/10] vfs: add provenance time (ptime)
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
> Also add fa_xflags_mask to struct file_attr (and equivalent

That is a very big "Also" part
This is a significant UAPI change that needs to be delivered and
explained with a patch on its own.

> fsx_xflags_mask to struct file_kattr) to let the filesystems advertise
> their support for specific xflags and users advertise what they want to
> change, behaving like statx.stx_attributes_mask:
> - on GET (file_getattr): each filesystem fills the mask according to
>   their supported xflags, e.g. FS_XFLAG_PTIME or FS_XFLAG_COWEXTSIZE,
>   and provides the values in the corresponding struct fields;
> - on SET (file_setattr): userspace fills the mask according to which
>   xflags it wants to change, VFS validates this and preserves xflags
>   that were not specified in the mask;
> - if xflags_mask =3D=3D 0, use legacy full-struct replacement to keep
>   compatibility with older programs.
>
> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
> xflags and use it in fileattr_to_file_attr()/file_attr_to_fileattr() to
> validate that the xflags passed in xflags and xflags_mask fields are
> valid.
>
> Finally, add the missing FS_XFLAG_PROJID flag, to allow userspace to set
> the projid using file_[sg]etattr().

This part also belongs with the xflags_mask patch

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
>  fs/file_attr.c            | 75 +++++++++++++++++++++++++++++++++++++--
>  fs/stat.c                 |  2 ++
>  include/linux/fileattr.h  |  6 ++++
>  include/linux/stat.h      |  1 +
>  include/uapi/linux/fs.h   |  9 ++++-
>  include/uapi/linux/stat.h |  7 +++-
>  6 files changed, 95 insertions(+), 5 deletions(-)
>
> diff --git a/fs/file_attr.c b/fs/file_attr.c
> index 833e03810b24..12610fb6a751 100644
> --- a/fs/file_attr.c
> +++ b/fs/file_attr.c
> @@ -102,14 +102,23 @@ EXPORT_SYMBOL(vfs_fileattr_get);
>  static void fileattr_to_file_attr(const struct file_kattr *fa,
>                                   struct file_attr *fattr)
>  {
> -       __u32 mask =3D FS_XFLAGS_MASK;
> +       /*
> +        * fsx_xflags_mask contains only flags added after the
> +        * file_[gs]etattr() API, so we need to tell userspace the filesy=
stem
> +        * actually supports all legacy and new advertised flags
> +        */
> +       __u32 mask =3D (FS_XFLAGS_MASK | fa->fsx_xflags_mask) &
> +                    FS_FILE_ATTR_XFLAGS_MASK;
>
>         memset(fattr, 0, sizeof(struct file_attr));
>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
> +       fattr->fa_xflags_mask =3D mask;
>         fattr->fa_extsize =3D fa->fsx_extsize;
>         fattr->fa_nextents =3D fa->fsx_nextents;
>         fattr->fa_projid =3D fa->fsx_projid;
>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
>  }
>
>  /**
> @@ -141,15 +150,23 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
>  static int file_attr_to_fileattr(const struct file_attr *fattr,
>                                  struct file_kattr *fa)
>  {
> -       __u64 mask =3D FS_XFLAGS_MASK;
> +       __u64 mask =3D fattr->fa_xflags_mask ?: FS_XFLAGS_MASK;
> +
> +       if (fattr->fa_xflags_mask & ~FS_FILE_ATTR_XFLAGS_MASK)
> +               return -EINVAL;
>
>         if (fattr->fa_xflags & ~mask)
>                 return -EINVAL;
>
>         fileattr_fill_xflags(fa, fattr->fa_xflags & ~FS_XFLAG_RDONLY_MASK=
);
> +       fa->fsx_xflags_mask =3D fattr->fa_xflags_mask;
>         fa->fsx_extsize =3D fattr->fa_extsize;
>         fa->fsx_projid =3D fattr->fa_projid;
>         fa->fsx_cowextsize =3D fattr->fa_cowextsize;
> +       if (fattr->fa_xflags_mask & FS_XFLAG_PTIME) {
> +               fa->fsx_ptime.tv_sec =3D fattr->fa_ptime_sec;
> +               fa->fsx_ptime.tv_nsec =3D fattr->fa_ptime_nsec;
> +       }
>
>         return 0;
>  }
> @@ -232,6 +249,23 @@ static int fileattr_set_prepare(struct inode *inode,
>             !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
>                 return -EINVAL;
>
> +       if (fa->fsx_xflags_mask & FS_XFLAG_PTIME) {
> +               if (!(old_ma->fsx_xflags_mask & FS_XFLAG_PTIME))
> +                       return -EOPNOTSUPP;
> +
> +               if (!(fa->fsx_xflags & FS_XFLAG_PTIME))
> +                       return -EINVAL;
> +
> +               if ((unsigned long)fa->fsx_ptime.tv_nsec >=3D NSEC_PER_SE=
C)
> +                       return -EINVAL;
> +
> +               fa->fsx_ptime =3D timestamp_truncate(fa->fsx_ptime, inode=
);
> +
> +               if (!timespec64_equal(&old_ma->fsx_ptime, &fa->fsx_ptime)=
 &&
> +                   (fa->flags & old_ma->flags) & (FS_APPEND_FL | FS_IMMU=
TABLE_FL))
> +                       return -EPERM;

I don't know what this is but it looks strange.


> +       }
> +
>         /*
>          * It is only valid to set the DAX flag on regular files and
>          * directories on filesystems.
> @@ -288,13 +322,41 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap,=
 struct dentry *dentry,
>         if (!err) {
>                 /* initialize missing bits from old_ma */
>                 if (fa->flags_valid) {
> -                       fa->fsx_xflags |=3D old_ma.fsx_xflags & ~FS_XFLAG=
_COMMON;
> +                       /* FS_IOC_SETFLAGS */
> +                       fa->fsx_xflags |=3D (old_ma.fsx_xflags & FS_XFLAG=
S_MASK) &
> +                                         ~FS_XFLAG_COMMON;
>                         fa->fsx_extsize =3D old_ma.fsx_extsize;
>                         fa->fsx_nextents =3D old_ma.fsx_nextents;
>                         fa->fsx_projid =3D old_ma.fsx_projid;
>                         fa->fsx_cowextsize =3D old_ma.fsx_cowextsize;
> +                       fa->fsx_ptime =3D old_ma.fsx_ptime;
>                 } else {
> +                       /*
> +                        * Preserve unmasked xflags when running file_set=
attr()
> +                        * with a mask, which doesn't need a read-modify-=
write
> +                        * so these attributes would be set to 0.
> +                        *
> +                        * With FS_IOC_FSSETXATTR or mask =3D=3D 0 (legac=
y mode)
> +                        * this is not needed as userspace does
> +                        * read-modify-write already.
> +                        */
> +                       if (fa->fsx_xflags_mask) {
> +                               fa->fsx_xflags |=3D old_ma.fsx_xflags &
> +                                                 ~fa->fsx_xflags_mask;
> +                               fileattr_fill_xflags(fa, fa->fsx_xflags &
> +                                                    ~FS_XFLAG_RDONLY_MAS=
K);
> +                               if (!(fa->fsx_xflags_mask & FS_XFLAG_EXTS=
IZE))
> +                                       fa->fsx_extsize =3D old_ma.fsx_ex=
tsize;
> +                               if (!(fa->fsx_xflags_mask & FS_XFLAG_PROJ=
ID))
> +                                       fa->fsx_projid =3D old_ma.fsx_pro=
jid;
> +                               if (!(fa->fsx_xflags_mask & FS_XFLAG_COWE=
XTSIZE))
> +                                       fa->fsx_cowextsize =3D old_ma.fsx=
_cowextsize;
> +                       }
>                         fa->flags |=3D old_ma.flags & ~FS_COMMON_FL;
> +
> +                       /* xflags not present in fsxattr */
> +                       if (!(fa->fsx_xflags_mask & FS_XFLAG_PTIME))
> +                               fa->fsx_ptime =3D old_ma.fsx_ptime;
>                 }
>

This whole flags/xflags duality needs a closer look
This looks a bit too complicated right now.

I don't have time to do the full review so wanted to give you the
main feedback first.

I'll try to get to it this week.

Thanks,
Amir.
