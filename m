Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795190156;
	b=CdMvayliulsBsBVBrmJ2Ua8TGqDPEs4HhMNpY1oSXxqmqos6koHBxprHeirIJNoYMX3I
	 gvlpyh7uGwsg3HtI4VF08GxmC+K/qdrN6W0osOOdgC9gH6xkWs6Ece8O7/FEp1HCh2OtF
	 SoAD3d352vx8nAFupRxeOFuMo+uwxDOW1K7+aoeCOKB/MSoZ4Y6Bk5WasQZqNGd8fQ1Kn
	 MBuyEBPK1PkI/rnooDNP3AjK6WLRM+PR/gsx4biBWRkfcnAnrXPGXioLt8X1N1m7NCfTi
	 BRuPtbMWPuMDjXcp3Emmo6F2GisIXXEJpeLQ3uaQg6aHnARDyMmHgOg6vi5HxrothHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sKN0WqYQTyAXEuN5uWRqYydRHORdhfTbdGPGVmgWZ74=;
	b=iqM2R0TBUYg0FlyqGUcmItBTu4jDggsY4qAiqYS/Yiz7EKKkQm7kX34UZ23h8Wwj374f
	 WaN7HSTJpHk7qR2ssPGGffUWiZhkguX326E+7NzXWRM+kMJoC6g2ocYNlLNLV1QWmsqoS
	 DLDrVTOAF07ljGKZ9s0gpcKsaAWJQEGd5CWrvtAECu8JggUR92/IhiW8/EG79X1zuYt4e
	 s5INO5PI5Ig0Kw+eXvyrEaL2QqRfOlJ1YS1IEq1Tvb7ojIatgIWHjpnYDgfAnjHRf9Ld1
	 EvZpkq7aQP9rHpWepHP2amE6Nq212mUwJcfcdBhIZTZTSrr6EcaL/opauuC4bA51SgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yPJ1QIuA;
	arc=fail smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B86C606A33A
	for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 15:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B86C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yPJ1QIuA
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so1852626a12.0
        for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 07:55:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795190155; cv=none;
        d=google.com; s=arc-20260327;
        b=jIJq83OUOEkeJHiGSFvzPf9MIfaWCibORZaxNV1GP5CtVcyG4MrY3h7GpqN3NiwGT7
         UL063ZPk3T/7QE1ic8sUs3uBduFrC2Z58CSKt0XojJSWWIUQ5M3t9zIk9uOWuiDIch18
         FPNW4EkTIhvrwg2nj3X0pFaeTAYdgi4V/pQJ5JtuPeJhFOHgunT7OlTjUvnPpTm753ys
         jIsIY3Kwr+XG4+gGj5DAelFPUe0cUwXHDdt2A1OJ/ChIWV3IYmi8GYxWHfWD/WwP3aNI
         WdfuFPMrJyPFEs11evHZDDRj5Zq40Qjv7b6Pz43fetTJulTzd8bcfUP3BvcjR21hNOju
         weoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sKN0WqYQTyAXEuN5uWRqYydRHORdhfTbdGPGVmgWZ74=;
        fh=OnVIiKdXbolF6uhiwwJY5H9KvJQoMWnqy5Q8lqulbo4=;
        b=IucPIgD071bP2fXs/Nymvr/LE3nupZTPd4lntUf8lnLOuUFFZeaq4e3Mx841ndJsK+
         CtHIxCZCM4ANSYMSYo+C1Y6ehqrfbeW8tlExScIMJTRBmZI0VWqzMTaVumCo5XMOYdYf
         MaIhrH8OnyArmqSz9V8fNqMd3JpRyuDb+spxxi3+xHwGzOrBYSMSgANgxNkMFp51ikDi
         8vfyCFuQAl6MvI5yPzTCZZAiK5WXKTA0WtYMD7Omj8P5GO8wZ/5DXx8MVl20S6JAgGEI
         BFmMJHeRnNs5QMfCGIK67jy1rv7u2hinkoVIqToDX/c07Afgq/vvMGLBVkJNuWHaMKeI
         jIoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190155; x=1795794955; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sKN0WqYQTyAXEuN5uWRqYydRHORdhfTbdGPGVmgWZ74=;
        b=yPJ1QIuAw5i2j9x3f9wv0wymmILtOwq1cGern/LutdD+iE+GbJqb4ydbGRuHG0MfPf
         F5bejmOysPfDLV4glWioiUXVl90uOp16A0W91wBWDP+750+ZmlwFG1sp0SJrTM0VXQuU
         +JuB3Mr+rjmI1v4DSlA5YGm467/mWUfIQw/QNsx4Ljmpdsc/Vcj99DzQlCRSlxtHtI7J
         9/6tbWiYOlORud2HBmGbLO7A7OrCt8QUuLBbtgNJXD/fsO8LJLHDh8wtRxu+YxNQnP/e
         1y85GvM2GshW0pmvDBoqO2qsYA23iezcRLF75HFRgaI6+//n/WEbuvhFgX9ncTLPR/8K
         gLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190155; x=1795794955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKN0WqYQTyAXEuN5uWRqYydRHORdhfTbdGPGVmgWZ74=;
        b=16ChgSwPYDUiVoyuNHR87EmxG9owCP8iDgOICB4N8Qq452HZ2983B+s5UNMOs/EdT4
         zvOwK5JC3tQYO5BntFdp1DfcMg5v+gg9vyg+NTQ9HJFTN+W/95cHf818YtBvJQsN71oQ
         vIzoakWKytNiTgGVSFPnGgRxrswzES4PGwQESz54qwt+4JblNcpHTrv+MDfGGJ1lbtVg
         FpFwXF0HqHNy1wjFrgc+x6KbTjsKZypuEyfBMCzU1jcUURUfTOEfXRcsbQE4QWGEckZ/
         N4rj+eCqVywM2mQiwNexkq7X9V8wPeO4KjP3rQSX61HVjPv6a9nI0HB5HvRat8D5ZaB+
         Po/A==
X-Forwarded-Encrypted: i=1; AL+hErFBY2ANXvDDwt/JhovtmFNi1RJ7JG+tksC94O/ZemWo/wdECIWKn70uT9FnjqcBngArEmOt6A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/dffdr3aRnqZM5MXvB7ZU6rqsyBbGwqIB3NEsezUDsiv20LtbE
	U9gcJv71J3CmpmB5xTRw9KngfCi8UrwyrwzjmaGOu3QRe22pSauXCD64yajF5LyGSaTcrQSgaT6
	HrXOVxLZ+9I/DX0DHALPAwf/ifIIB0oE=
X-Gm-Gg: AZFdTZevBoWjDkVfW9BVcirq8WCIixinSfqgYDMUigANWCkTF/Ks3wm1KDtkTI1gYT/
	362AXzayM12dMnpjVXt89Xz9WLOfy9dYhXQ45bpZE+p07OZMdAKKqf3nh3sPvQcnJnKW11sjNQT
	k4dPRbV5kOIWsFf8rXOmrpYVkbMU+8Igfwn9Nz9nJhvCs5yqmSNt8Cvc6Q8ctXkI1Zj/7PzCYhg
	BtbRkMtbRvLeNFFSyCdXzWuFDXJMhig1H+RQam5qA2iAgwkJSsoJI/WqZyeUy6sELUotLftY184
	UPToheuLktxa2yobB76sLwzi1ZdCll4ZUKkYVP6dvfJznkRbLwdEMnFdjpj3KecGlklasyFrCwm
	eyjOrl4fTUXAk0sciJfYijDZ8HF2Pf7giHfk/Zi5IihIJlYt13DROLc30kYYDzWV1TrRoKw==
X-Received: by 2002:a05:6402:448e:b0:6b8:7769:ffea with SMTP id
 4fb4d7f45d1cf-6ba37ece3efmr2700126a12.45.1795190154705; Fri, 20 Nov 2026
 07:55:54 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-11-koray.fra@gmail.com>
 <CAOQ4uxg2gpC99ohuvKm-SgPzuffJy1fSvXorbuBnYZ=OFSxT3w@mail.gmail.com>
 <DMZIZ05H7MMB.1WYNR4X44BPGR@gmail.com> <CAOQ4uxg8aVcWyNiFDk8djdn-M3xJcu_7-kRxVq9jjFsbcGp1ew@mail.gmail.com>
 <DN03GJ80ZWNZ.9GM35HM4T48N@gmail.com>
In-Reply-To: <DN03GJ80ZWNZ.9GM35HM4T48N@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 16:55:42 +0100
X-Gm-Features: Aa3M54qwBZfUZmZq7N4IJA8RoZGlQgYi2IqZuG6tNGKYRI28yA1oVD8H7wW_Hfk
Message-ID: <CAOQ4uxiEX1wO3vRM2UMNrACR8AfxDbrP=oB9w6L-B-twmD3D4g@mail.gmail.com>
Subject: Re: [RFC PATCH v4 10/10] cifs: add provenance time (ptime) and map it
 to SMB's CreationTime
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
	linux-api@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 3:05=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> > To reduce the scope of your patch set this may be better.
> >
> >> >>
> >> >> -       /*
> >> >> -        * chattr writes back all flags returned by fileattr_get().=
 Accept
> >> >> -        * FS_CASEFOLD_FL only when it reflects the share's casefol=
d state.
> >> >> -        */
> >> >> -       if (fa->flags & FS_CASEFOLD_FL) {
> >> >> -               rc =3D cifs_fileattr_get(dentry, &current_fa);
> >> >> -               if (rc)
> >> >> -                       return rc;
> >> >> -               if (current_fa.flags & FS_CASEFOLD_FL)
> >> >> -                       allowed |=3D FS_CASEFOLD_FL;
> >> >> -       }
> >> >> -       if (fa->flags & ~allowed)
> >> >> +       if (fa->fsx_xflags_mask & ~CIFS_SUPPORTED_XFLAGS)
> >> >>                 return -EOPNOTSUPP;
> >> >>
> >> >> -       enable_compression =3D fa->flags & FS_COMPR_FL;
> >> >> -       compression_state =3D enable_compression ? COMPRESSION_FORM=
AT_DEFAULT :
> >> >> -                                                COMPRESSION_FORMAT=
_NONE;
> >> >> +       if (fa->flags_valid) {
> >> >> +               /*
> >> >> +                * chattr writes back all flags returned by fileatt=
r_get(). Accept
> >> >> +                * FS_CASEFOLD_FL only when it reflects the share's=
 casefold state.
> >> >> +                */
> >> >> +               if (fa->flags & FS_CASEFOLD_FL) {
> >> >> +                       rc =3D cifs_fileattr_get(dentry, &current_f=
a);
> >> >> +                       if (rc)
> >> >> +                               return rc;
> >> >> +                       if (current_fa.flags & FS_CASEFOLD_FL)
> >> >> +                               allowed |=3D FS_CASEFOLD_FL;
> >> >> +               }
> >> >> +               if (fa->flags & ~allowed)
> >> >> +                       return -EOPNOTSUPP;
> >> >
> >> > This whole mess could be sorted out by switching the cifs
> >> > implementation to the new API
> >>
> >> ("new API" you mean _mask right?)
> >>
> >
> > Yes and ro_mask, but it probably also means converting all the
> > read-only CASEFOLD fs to new api, so that FS_XFLAG_CASEFOLD
> > could be taken out of FS_XFLAG_RDONLY_MASK
>
> Can all flags currently in FS_XFLAG_RDONLY_MASK be rw for some
> filesystems or only some?

No. CASEFOLD is the only one which is MODIFIABLE/SETTABLE
in the old setflags ioctl.

Its twin xflag FS_XFLAG_CASEFOLD was recently added along with
FS_XFLAG_CASENONPRESERVING for a bunch of fs (e.g. nfs) which
advertise it as rdonly attribute.

> Should they all be removed from FS_XFLAG_RDONLY_MASK and left to each
> filesystem to define them as ro (to put in _ro_mask)?
>

No need to do this.

One flag at a time per demand.

You *need* to get FS_XFLAG_CASEFOLD out when some
fs will want to set it via xflags API.

You *may* get a flag out of FS_XFLAG_RDONLY_MASK
only after *all* of the fs which support it have been converted
to the new xflags_*_mask api.

> >> > and implementing a generic vfs
> >> > helper which does something like the above code to handle the
> >> > old ioctls.
> >> > FS_XFLAG_CASEFOLD would then be removed from
> >> > FS_XFLAG_RDONLY_MASK and set explicitly in xflags_ro_mask
> >> > by fs which don't allow to set if (e.g. nfs) and added to
> >> > FS_COMMON_FL/FS_XFLAG_COMMON
> >> >
> >> > cifs would advertise FS_XFLAG_CASEFOLD in its ro_mask
> >> > and then the generic helper would mask it and the new syscall
> >> > will not allow it.
> >> >
> >> >> +       }
> >> >> [...]
> >> >> +               cifs_dbg(FYI, "set compress flag rc %d\n", rc);
> >> >
> >> > I think that the roadmap should be to slowly define all the old FS_*=
_FL
> >> > flags as FS_XFLAGS_* and let the generic helpers deal with the conve=
rsion.
> >>
> >> > But it is not so hard to convert one filesystem at a time in a way t=
hat
> >> > fa->fsx_valid will have to be true, because, for example, here
> >> > all the relevant flags would be supported by the new xflags API.
> >>
> >> So, something like what fileattr_fill_{x,}flags() do now, but for
> >> file_attr_to_fileattr()?
> >>
> >
> > Yes, something like this (maybe)
> >
> >  void fileattr_fill_flags(struct file_kattr *fa, u32 flags)
> >  {
> >         fa->flags_valid =3D true;
> > +       fa->fsx_valid =3D !(flags & ~FS_COMMON_FL);
> > +       fa->fsx_xflags_mask =3D FS_XFLAG_COMMON;
> >         fa->flags =3D flags;
>
> So, for the filesystems that switch to the new API, these new/changed
> helpers should handle giving userspace the legacy FS_*_FL flags (if
> userspace uses FS_IOC_GETFLAGS) by converting them from the FS_XFLAG_*
> reported by the filesystem?
>

I did not look at the implementation details but when you make the
vfs API rich enough with the masks, the should be no problem to
describe in the API what the old ioctls do
"get a subset of attributes"
"set a subset of attributes"

Where "subset" differs depending on the ioctl.

> But did you write this
> > +       fa->fsx_valid =3D !(flags & ~FS_COMMON_FL);
> > +       fa->fsx_xflags_mask =3D FS_XFLAG_COMMON;
> while thinking about FS_IOC_SETFLAGS, so from userspace to filesystem,
> and this would be needed because that filesystem wouldn't know what
> FS_*_FL are, so it will use the _mask and the converted xflags?
>
> But why the opposite of (flags & ~FS_COMMON_FL) as fsx_valid?
>
> Why fsx_valid =3D 0 if the passed flags also contain non-FS_COMMON_FL
> flags and fsx_valid =3D 1 if the passed flags contain only FS_COMMON_FL
> flags?
> (if I understood correctly)
>

My interpretation of fsx_valid (for the set side) is:
fs may completely ignore ->flags and get all the information from fsx_*
similarly for flags_valid fs does not need to look at fsx_*

In the case that all requested flags are common, both
fsx_valid and flags_valid can be true.

But what I wrote is nonsense, because the old ioctls have no request_mask
so unset flag does not mean it is not being set.

I think what is needed is something like this helper to be called from
filesystems:

bool fileattr_prepare_xflags(struct file_kattr *fa, u32 xflags, u32 support=
ed)
{
        if (fa->flags_valid) {
                fa->fsx_valid =3D !(fa->flags & supported & ~FS_COMMON_FL);
                fa->fsx_xflags_mask =3D supported & FS_XFLAG_COMMON;
        }
        return fa->fsx_valid;
}

Then cifs_fileattr_set() starts with:

        if (!fileattr_prepare_xflags(fa, CIFS_SUPPORTED_XFLAGS))
                return -EOPNOTSUPP;

And from here on, talk only xflags and xflags_*mask

For cifs that means to add vfs support for FS_XFLAG_COMPR
<-> FS_COMR_FL conversion in helpers.

FS_COMR_FL is also rdonly flag in some fs and rw in others.

> > But in this model FS_XFLAG_COMMON are only the ones that
> > are mutable from the old ioctl.
> >
> > We would need to define FS_READONLY_FL to deal with the
> > group of read-only legacy flags, if some fs needs them and wants
> > to use the new API.
>
> So the those filesystems can put it in _ro_mask on GET you mean?
>

Actually, I meant that the old setflags ioctls could be translates to the
new xflags_mask dialect, for example:

bool fileattr_prepare_xflags(struct file_kattr *fa, u32 xflags, u32 support=
ed)
{
        if (fa->flags_valid) {
                fa->fsx_valid =3D !(fa->flags & supported & ~FS_COMMON_FL);
                fa->fsx_xflags_rw_mask =3D supported & FS_XFLAG_COMMON &
                                                          ~FS_XFLAG_RDONLY_=
MASK;
                fa->fsx_xflags_ro_mask =3D supported & FS_XFLAG_COMMON &
                                                          FS_XFLAG_RDONLY_M=
ASK;
        }
        return fa->fsx_valid;
}

so it will work correctly for example with fs/ntfs which supports
readonly ENCRYPT|COMPR

Thanks,
Amir.
