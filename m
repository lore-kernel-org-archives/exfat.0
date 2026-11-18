Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795024254;
	b=Aa3AEKQpUuhS3WcOqXiSdYQB846wduyfqET5Yw4NcW37aXnZ3a44QvLqAfD+F4o7aO1R
	 R44DT6Tl2bEFP48Msuv+cO2oCeIpEt2sOW4/JwzkJPLQ/SlgpsKaRbeiDfBpOfKeGQ5mi
	 k6lql2hkVEpBy7YYtLihcfyzCC6el0y3JC19F+QylILwxAUxoFayNrbnC3QHmOxT3rCM1
	 +Z1T6t1YtwtNZgwKpN5nxx9yhPZl2GwIyBW/oiinmQBn7s8D6XHBtX9Q3tKOFKOb21Ft3
	 HZ9EZilHZh2A8dej6JyJAdeXB9R10wa9SYc8qOksa5/H72LOnnEegTGvAqGGPD2+j3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BliQBsLi8Tf+bGa80m+pxZeHcLThIeJfSszhbNvQWjc=;
	b=AS00HKkR3lMrxflsmj5A7xCosBIDQFt7vQxO5ftSNexuPGR415K7TWyU4uPqKZ2sLv3+
	 RsJj8F7g9A8MlcKc5yKbx8Br74CK6JEfuhL4mVOVhO9NThgu0krbD6hMRsi7ltUOZomfg
	 IQn/rakIv/uX3+d2PW3gBje68jRbKW+GK93rid5fJOy9og6j6o7NZWZgvncGaKfHsd52n
	 uEQVFUxbxgYEMex2nwjoCK5l9LdfWob/jc+8tx7Y/o9ao8naMVm0dyf83TVu1+O4fQ0jZ
	 qAOa8rMp2LEmi3afTRMYQ1DKS/0b13SxFvJAUw1PxL3JQUJeXUDhJplUXrS1At6G3gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mEkutrt2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C92260A260E
	for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 17:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C92260A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mEkutrt2
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso1767017a12.1
        for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 09:50:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795024252; cv=none;
        d=google.com; s=arc-20260327;
        b=SXVStJebYaZT6kc/tagDLHU1wJWfBI3CvDLFIWkTYPtHCQIOL6iRSUiV4KjXDanKHD
         sXO9tTrkh6IkyjZtCHqmlHPsUZmPKdIbG2pZbDtGhCib5PXTNRpKqfxGmK5n+aLRjrkx
         YnAllmgRb4dysuIV5Px5mlxA3F+PtkN3AYLpKRdlpbfbO7g1vPhCv/aUjdBnC6++uhlN
         9UH7F2g5VSTKI3GTtz+BB64q+TDQ8Gceke+QWlWDaAeEcdJsI7vOWtHfYGSHY6BOt4u6
         1/cWaizqVXCl+owVbtF4UQc3xrU/u+VYmHcuW8e9Wm1JF+bEQm27NKhpvSs2zKd6dbFq
         n84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BliQBsLi8Tf+bGa80m+pxZeHcLThIeJfSszhbNvQWjc=;
        fh=P190l2A5Vb5/AydIPwZjImAfiLglC0vO8yh1IB5jiXY=;
        b=hm2WQSMLMIzlPr31Sd1wPfPZSjqToJrXtVPz88v5F+M0WjzmBRSb+nZvEJVRJjNyCp
         akJ6BaPtw8EVnkUVdeHMYFRokHfLQwqIiIo5Cs+tpgUj7uLhY8wxoqkmPHB6v0gRLlbA
         bb6qlBbg3MCwcXELw3SZQgKOX1pigVWEkgUb6rvCw2rTtHNs3nebygmdf8CcLrsbhSw0
         yJLRFG3rFVy5i2P3TYrdDH/H3DeYkrqQAr3hzBCUCCl8obuK+PxFEuNW/rFfns9Z5glA
         CO43+gBxnEnpygv5fs73obk3ywNRZfrpJD82OADmH5wF/Rsn+rCKZ84PtaQdcSaILfn6
         dZMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024252; x=1795629052; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BliQBsLi8Tf+bGa80m+pxZeHcLThIeJfSszhbNvQWjc=;
        b=mEkutrt2N983bbRJhg46nNatqRwYp3WvYXUeew0uLu3X9aWe3cyDxNeqS8FFTmf2QU
         l1tlVrlQOBz9zzXFDvWPpv+X3wuVDEt1VTe8QqzZPH0w7h1PT6/15KhNc51RSY8typ8z
         AgD61Z/BPgbCDIt7dVWP90yPonCqH4vnBjVEY0lcJ+n4gklq0RmejBLhvBon4dx0oX0d
         rM6LlHTC3wW/ti+m5idvwb25PIrs1FbaHsXoaOqYjskTgL8SHLVBHJzu3cWExEvn+kuh
         hgHK5H92k6Nce9rgzAveVUVl66DkVaRvfScvP1VNWZ/1q6aQRPm9EKw2JiQ+LA6yX4rm
         VGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024252; x=1795629052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BliQBsLi8Tf+bGa80m+pxZeHcLThIeJfSszhbNvQWjc=;
        b=C6va0qFqoQ/NAfD8bf6KI5VDEadVdGJBeQLPVtRIuT500K1zfiKSf8hVNBUXk517Ia
         AJ/8pVwbngObxJCjyPLKWC/fokp4ZdzTMQ8QSq6I1nD/eE0Z06tiT/5nXBqSW0a6ayoI
         f9Ahak4/qPp5hTaFdk0OCEmBLJ6WspvGjN3Z/fIHKTzq4r/DARM4I2duTu2+8cUgIT4q
         XNVMHZuus2iruhemK447htr4YrRcKMQHbBen9KiC+D/pnR9qbxXgtINZUGMBZpPlNEiE
         srRLHN86gERImWBpwzjZRJuJ/u15fparM7885e/z7vJ+8bYOAPjC8Cn6mgiyOcRtz614
         QOMA==
X-Forwarded-Encrypted: i=1; AL+hErG4Sm+2uBDxILxVLnNVGWIGjMAC1MG5NXLwNwim78EXQHnhUZdhpctsmg+NuIbHeo6fiKWZLg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/6rykwxeWs/zfSFOe/R1pmDg0932iOVx8e+bvKDXqlxSJ3NCcW
	AzgFvp0kb5+tfdyUfTCYYf0bkGVQ3qWlo11z5NSGcxc/g2hP7geK2hk5ZrF0Rru7m5xUyGrbUZ7
	aEJV6+/jdc6Vom0Fkzow6ahwFay2aokU=
X-Gm-Gg: AYBFou1sBnldkq+HL3Te+g3pqEJkam3q8wicM/HLG9TDiKCAkuWLxYz74jb+I6fLXUC
	KyBuu0CjORSaEE+/UGvGR2fr9j+tK3KaUFMQLYzSoSQr8XnZyVGvXj0fUsvsgCO2ZBy5zE7NPus
	7g4bFjsGww2hHm2yqQBgXOQnDUWMS6l3Y55oaFMWHwlIxQAGB5uR8G6GQ7G81CSi4jWhBODjUEA
	sAM78IcD6ls/Mp3QIk2Xpn27DjTZWoOqALwub+fMGbsHtV6zKN+PVSE15k0i4CTSHZg4D8mCeBB
	lNm/smwx+Ysn9SNLRXO55bIEYHtbTs5haUXSjL4GMwxJly679AtL1VlQVWte54jDgi6Q01tdkVH
	91r7wdzbfwj3Fy88AHANMSLk9tfbOIvvpGgJ2q8+WbTp2EObTlIfZxL4rOZ/OB6mjATUakcyCuE
	Caua0larWxVqSBEkE=
X-Received: by 2002:a05:6402:5411:b0:6b7:df0c:18d0 with SMTP id
 4fb4d7f45d1cf-6b8a2e6d881mr1966295a12.11.1795024252167; Wed, 18 Nov 2026
 09:50:52 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261118142613.be3r3s6kobkkxnz4@pali>
 <DMYFBDIV4Y08.35ZKR5G86U1H7@gmail.com> <20261118151605.lqtn5fz423kuswk5@pali>
 <DMYHPLWKPSH3.MUM1IIZZIWNR@gmail.com> <CAOQ4uxiwpdC-fKkqS5kiZ515q9MenC0jX4USV1idN7h2njx45Q@mail.gmail.com>
 <7126bdd0ff59e9ea9bc58702af2ecb38096330e8.camel@kernel.org>
In-Reply-To: <7126bdd0ff59e9ea9bc58702af2ecb38096330e8.camel@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 18:50:40 +0100
X-Gm-Features: AclHuK8-cETfcc5mQcfuFgReFzNL3uUqtJJFv8XHOum7KdV27M9jJ90gtN64MvU
Message-ID: <CAOQ4uxidYWNVmoPgxKrxesXTxpMB-JqUZx9p6xXZWD5m+hJ+JA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 00/10] add provenance time (ptime)
To: Jeff Layton <jlayton@kernel.org>
Cc: koraynilay <koray.fra@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	exfat@lists.linux.dev, ntfs3@lists.linux.dev, linux-cifs@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-api@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:36=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Wed, 2026-11-18 at 18:28 +0100, Amir Goldstein wrote:
...
> > Guys,
> >
> > Let's take a step back.
> >
> > If this discussion is proving anything is that the btime/ptime
> > duality is a big headache and it's going to be a source of confusion to=
 users
> > even if we come up with some smart pants consistent semantics.
> >
> > As Jeff writes, I think we should consider making btime mutable
> > be a per-fs choice and not an API limitation.
> >
> > A filesystem can even decide to store both the forensics btime
> > alongside the user settable crtime.
> >
> > There are some precedents in xfs with settable UUID which is
> > a different field then the origin UUID from mkfs.
> >
> > Fs that have immutable btime have a few choices:
> > 1. Keep it immutable
> > 2. Start making it muttbale (like the Win fs)
> > 3. Start making the user visible btime (STATX_BTIME) mutable
> >     but keep the forensics btime on-disk for, well, forensics
> >
> > If btime becomes settable via options 2 or 3, this could require
> > admin opt-in (e.g. tune2fs -O crtime).
> >
> > With option 3 the crtime feature would be ROCOMPAT
> > With option 2, it could probably be COMPAT. Maybe.
> >
> > If we accept this story and the major fs maintainers are
> > in agreement with this plan, then I think the missing piece
> > is making the "settable mask" visible to users via the new API.
> >
> > IOW, we need to somehow export FS_XFLAG_RDONLY_MASK
> > to userspace instead of only exporting the supported mask.
> > And then with the addition of xflags_mask, we could also
> > -EINVAL on users trying to set readonly flags/values.
> >
> > Perhaps a single xflags_settable_mask is enough.
> >
> > For file_setattr(), xflags_mask is anyway a set-those mask.
> > For file_getattr(), does it matter if we get an answer
> > Filesystem does not support casefold on this file
> > OR
> > Filesystem does not have casefold on this file and
> > you cannot set casefold on this file
> >
> > It's kind of the same, isn't it?
> >
> > What do you say?
> >
> > Shall we drop PTIME in favor of "is BTIME settable?" API?
> > Leaving STATX_BTIME exactly as is.
> >
> >
>
> +1
>
> I think this is the better approach.
>
> Looking over some of the earlier discussions around this since 2010
> (!?!): I think some of the XFS devs objected to making it settable for
> forensic reasons. So, on XFS you might need to rev the on-disk format
> if you want to do it there to preserve the "historical" btime, and
> maybe some xfs userland work to make it accessible for forensics.

XFS_IOC_FSBULKSTAT will likely continue to publish the original bs_btime.
if a mutable field is added it could be published as bs_crtime.

For forensics this should be enough.

>
> For the record, the statx manpage documents the btime field very
> sparsely:
>
>        stx_btime
>               The file's creation timestamp.
>
> There is no documented guarantee that this will be immutable, AFAICT.

Yes, and it really isn't immutable for cifs already.
It's just that we don't have a standard API to change it.

Thanks,
Amir.
