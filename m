Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794070131;
	b=dMVzpi9SY48HQkEWHpXG/JMwyCt84k+NrOZv1FWw6I1Wc68Sz4mKLhow1Ri8OvRvSEkq
	 ll8abaBMp9bqNqz665uDiY36TlK/fMMZfYRa9T2NoOmhx/HuO3Fe2Ko5CAo2MNNk9Xv0i
	 k1koQMxx58+bHPu66eEw6ttjpFYeY6ivOh8keyNwxY40a5Fg9N9ZdYJBG7rS11k1WSsNX
	 aAPcgGigq5nzJzeiyr3hE0hSoE2xluwober6RtUSua9pBnnmQEGFDqHSP7HMC5m6imVth
	 W7jdt+1VugRexfFlpfAtRX4Ln9Vyx9PpFWtahq4nlcEXij+fkrhLTIW6stYVpEWXEIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LZ1hEM+d+iNpX1Pv6g3S4J8ubodEppWnVLdYamIPsBI=;
	b=vAzbLyvgG9xYmGWhm6aSspVSc2QFO0p/RhnId2oT5Vfb1zb3X1ejsK0p3NatrdxoVwG0
	 F/GXoMaPOj3UD5OII11vlBShvJnc5tbEkJlB8tAce1yjEaMatX1zFNXc5D7cCQNsl9KUp
	 /6Q/JlmtxgKI1mmy24TwNZOWAxIbAoSiQst/drBosXLzT4fNOHgTs/y+2WR38eCVDiXlA
	 gScHnisecSNKup3QkBEfefM8+okw6W8elzpcQUXcuulHgZMKF7m/Gct9ZVvvEMt7SAI3l
	 LZGQJ881sVLtGaxPQHxRDnD8+nPvbFq/NjDDR0nFiX2bfnDvRch9JTqCmL+NoGtP87g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G89fxJTK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B1F606A32F
	for <exfat@lists.linux.dev>; Sat,  7 Nov 2026 16:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B1F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G89fxJTK
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b58cb69927so926419a12.0
        for <exfat@lists.linux.dev>; Sat, 07 Nov 2026 08:48:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794070129; cv=none;
        d=google.com; s=arc-20260327;
        b=MIXANwNtweeC/OYK4p6iVqB2rjo9MoYudB5WTXUwkUMEjB8Br3tkv6wDB1FIo/8n7j
         QdHbZxgNyNEklyhcHvt3DtK9khJPoU88YAsgVRGbXFkn6q0qTbnDZK9Bbz1UGVQkfJxT
         r3Mec0gvNqGabSoE1O057QXowYCo1kEB/dG42dvkOhB1nMDfeh2lxQzj28+kHVMGgf6r
         xdZ0v/EvLETPkXDtGRpDXbuCfUe1BgVQ0LUO22u/Fj3/1xJd8zN4f5EWkT4FzKi+PxKN
         FkDd5nzQJuR50wg084vwU+p/mIB1yPexfLQNl+BfQSaTKL/r9wql+LZtINLLVNZNdoj8
         dufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZ1hEM+d+iNpX1Pv6g3S4J8ubodEppWnVLdYamIPsBI=;
        fh=nhKqOXdqua3RPSCo21MA53jockhNz9XMLvaaKneYaq8=;
        b=r8KflOX0KnsP211dCCNl1QGOEBIl2SSmGYFcAaK7JtPKxasJlr045aWWj2GmNcbb5z
         rXTkaU6fnK/GsRWmWF7INQVlsaNOG1nVPI1A1l9llGCxrA4M/Thz41JycU+upYABtvo1
         TQi8lx4DASMNBz+AZ4/0tLlw+L6nhpKv1hoZSAwfh8ijhPQ/czL3lT+CbXBBJRYO9HzS
         RgErsTEYTJ3eGZXLRsehHlAn8ElactLWPGfO0+SH2Xg5v0v6vOYV1lIxVJ1RLbcgX9MG
         yWOUDaoNToJ+U06zSinuLWrPEto4c4GKvjI7DGvQ538fwnq5jrFoVJ/OVCKcmXJyTn2d
         ys0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070129; x=1794674929; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZ1hEM+d+iNpX1Pv6g3S4J8ubodEppWnVLdYamIPsBI=;
        b=G89fxJTK2DrA5ftSa5ECtKK48vkMnvRJeFmeXgo3wqe+CfmmPngz4MrlfFpHjkq//f
         ftFjtjzMdzbruXwCv9P9oigjxALj+J1pC2gxffpD0jpRHje5GhxPF0CjMzTxJa1MG65E
         MeXbQIOzmNPqq8TVdmjd/q5brraB1P+8BIYum1sjGezel/p3xPniWJV9gDxfX63JRFvD
         u5vMm2bBhitwbhLFEyZgY8xKv9pTy3crzbpQW2A85ELZkl09gGogZg0/c+HpvJq2/Rt2
         pkDmmh9AinsQ27CbXkLDVN056FhJJZj8YrE6CdgiJBl9GSfs2Fh6XV7C5kp7GbRbOLjZ
         2lyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070129; x=1794674929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZ1hEM+d+iNpX1Pv6g3S4J8ubodEppWnVLdYamIPsBI=;
        b=STqIHQHa8sn7maaAsk+nBYKPJS1d6vD+Hz3lNQXaLAQxtqv0/V/wUSNgowTkcP32tG
         Hay9pYbLSz3y9RZ68g9MMLWlQUMtoAjw87d1sYpiDHhhW/Ytcc25RTC+Evs065/1gSTc
         AmujT2sqDmr+AEyrCbstw+mJAuwPE6vxh2cRokitnZ3UGQKiLlBQUWjJFD3xqYCUtNMX
         HuFiDxfuJNueKGmJB22rUaXR4iAAMG0zI0mqHdllX68opasYs4rPlU13cUgZi8OmGb0P
         TPRXFKQFWvEITWZSRsmeOPINtmsO5AAG15VbBraFk9Sxsfg6otHL3aRKy6LSexVEpUEl
         C6rA==
X-Forwarded-Encrypted: i=1; AL+hErGD6xNX2z/X6dLmo1lutMVWAySnEslLa00pcf+dgtGUAHI3qWSer8LYrgkvxPHU897OLvgPHg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+sAduk9CtlJGRDOf5NbS3v6Tn5/njh58sgxGwTYV14OH3zMPoF
	004+9TE1s1An/WT47qYuEHnWbw5/DxMMGZ4fMdeww1IjHWcbpRk8IDQAtdJKWFN+nayjEV2uimv
	y+S/FQ1AaTk9daWuILEPN3+4ff/9jthU=
X-Gm-Gg: AYBFou2+hFE50JetS3aWsmQGB5o0WtTxvBWLaOtXewJNf4KfcLPTBtScCol7A5NDxq1
	9c2hwkm+m1EVu8s8m5lZTUvZDXCdeO9f9i7IMAVWirgG0Q8ryo3UmmzkzPuzc4Q/DVxBfOcjCxy
	3wJHEkVdWGZuGFbYQM047anEHhQmxcYQ5/qA5JfeN1JCK1JbX2SFrVjoYnIyJA1Gpp9fHlPjqiC
	MEsxDwsIppfb+aC++A7wcMPdgXyeY4UL+jsGiJqtwv3jiQJZSC/BLxPquoE/zFiUF9gNMBdIFLK
	/+tZjXMVynC1ioXCo/eruMqdaVWPdnKIybL/CECeFrPGjXS6kdzJopEzbqK9/zhQ0qwWGj5T3lV
	rKCnEPPkF3UjuwQcIxbT5Uge4i35gRo1/SyXzZ94pMUK45jHf+wXl7AaeF2k1mTtWCHIDjQ==
X-Received: by 2002:a05:6402:1ec8:b0:6b4:dcab:bf9f with SMTP id
 4fb4d7f45d1cf-6b6fae71be9mr1620380a12.16.1794070129335; Sat, 07 Nov 2026
 08:48:49 -0800 (PST)
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
 <CAOQ4uxiuJ=eZu28FZAUz3rpqPKqCimPxJucOnYYuBowvD09_Cw@mail.gmail.com> <DMP3UBB0QVOT.20HIXK7ZL6K6U@gmail.com>
In-Reply-To: <DMP3UBB0QVOT.20HIXK7ZL6K6U@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 7 Nov 2026 17:48:38 +0100
X-Gm-Features: AclHuK89rvp6wjLvX07JFLvpP57bRUqY-Yxm_O2zzvQ-fpYQDX7x1__0QP5KjTE
Message-ID: <CAOQ4uxgSVc8n1LbL_dcU-DpNN5BB-ap_vGdXEu7+d0Td7PK5Tw@mail.gmail.com>
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

On Sat, Nov 7, 2026 at 5:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wro=
te:
>
> On Mon Nov 2, 2026 at 3:00 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com>=
 wrote:
> >>
> >> Add provenance time (ptime), indicating the time when a file or
> >> directory was created. This is user-settable via file_setattr() and
> >> retrievable via statx(2) (using STATX_PTIME) or file_getattr().
> >>
> >> The semantics of when to preserve this new timestamp are the same as
> >> mtime, the idea being that there is a correspondence like this:
> >>
> >> ctime <-> btime
> >> mtime <-> ptime
> >>
> >> so every operation (copying, moving, ...) that currently preserves mti=
me
> >> should also preserve ptime.
> >>
> >> Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
> >> FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
> >> xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() =
to
> >> allow ptime to be used with the file_setattr()/file_getattr() syscalls=
.
> >>
> >> [ This is a re-implementation of the initial patch[1] by Sean Smith
> >>   <defendthedisabled@gmail.com>, following the advice[2] from Darrick =
J.
> >>   Wong <djwong@kernel.org> of using file_setattr() instead of updating
> >>   utimensat() ]
> >>
> >> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@g=
mail.com
> >> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
> >>
> >> Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
> >> Signed-off-by: koraynilay <koray.fra@gmail.com>
> >> ---
> >>  fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
> >>  fs/stat.c                 |  2 ++
> >>  include/linux/fileattr.h  |  5 +++++
> >>  include/linux/stat.h      |  1 +
> >>  include/uapi/linux/fs.h   |  8 +++++++-
> >>  include/uapi/linux/stat.h |  7 ++++++-
> >>  6 files changed, 52 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/fs/file_attr.c b/fs/file_attr.c
> >> index 833e03810b24..c0645cb22bf3 100644
> >> --- a/fs/file_attr.c
> >> +++ b/fs/file_attr.c
> >> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
> >>  static void fileattr_to_file_attr(const struct file_kattr *fa,
> >>                                   struct file_attr *fattr)
> >>  {
> >> -       __u32 mask =3D FS_XFLAGS_MASK;
> >> +       __u32 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
> >>
> >>         memset(fattr, 0, sizeof(struct file_attr));
> >>         fattr->fa_xflags =3D fa->fsx_xflags & mask;
> >> @@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct fil=
e_kattr *fa,
> >>         fattr->fa_nextents =3D fa->fsx_nextents;
> >>         fattr->fa_projid =3D fa->fsx_projid;
> >>         fattr->fa_cowextsize =3D fa->fsx_cowextsize;
> >> +       fattr->fa_ptime_sec =3D fa->fsx_ptime.tv_sec;
> >> +       fattr->fa_ptime_nsec =3D fa->fsx_ptime.tv_nsec;
> >>  }
> >>
> >>  /**
> >> @@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
> >>  static int file_attr_to_fileattr(const struct file_attr *fattr,
> >>                                  struct file_kattr *fa)
> >>  {
> >> -       __u64 mask =3D FS_XFLAGS_MASK;
> >> +       __u64 mask =3D FS_FILE_ATTR_XFLAGS_MASK;
> >
> > That is not the correct way to extend this API.
> > This fixed mask was added as a placeholder for
> > "We intend to add support for more xflags to selective filesystems":
> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-2-amir73il=
@gmail.com/
> >
> > Please see this POC patch for filesystems to publish their supported
> > xflags mask:
> > https://lore.kernel.org/linux-fsdevel/20250329143312.1350603-3-amir73il=
@gmail.com/
>
> Quick quesiton, should _mask also be used for user-space -> VFS to advert=
ise
> what it wants to change?
> This would be useful for on/off flags, but for ptime both fa->xflags and
> fa->xflags_mask would have the same meaning of "I want to change ptime,
> look at fa->ptime".
> Should we make _mask the only way to advertise what the user wants to
> change, ignore xflags | PTIME in user-space -> VFS and use it only in FS
> -> VFS -> user-space to say "this fs supports PTIME for this file"
> (which will be always once support is added to an FS, so it would just
> be "this FS supports PTIME")?
>

Sorry I was not able to parse your question.

I think the mask should mean "this FS supports PTIME"
regardless if the user asked to get/set it or not.

Thanks,
Amir.
