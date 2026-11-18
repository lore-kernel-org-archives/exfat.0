Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987856;
	b=YJsaRO27DUbdm20h6JWouMc/V92ONgSPJZzryoNGX+Y51gQv0eOjq6XBmbTdDGaJwLEG
	 7BH+gHRbpAlikbIO8XR59Y61VdGkwJ/54IFlP9OXdxp7T6RC7Y2OVtOd4XTTH/DqQ0ZO+
	 Cy5yjCfF2fcIFH5lHu9o6v/9wmYZGq8/yMDby2fgJry0EKNTUX/TMnlKETZlUwB38q2AL
	 HDLyz8AZ9HiCY0U34QfqYLOnauJJlGGVJo+Ry9L54fWuBv1fsvr3CQCat0UNWXPb7dsht
	 MAMmxxdpvQ1uAoQD8Fd3J9w8eHZHjyqJvK0dxtzKk9e3BqQisVCfVkO4kqjITuHk8eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n4AlrOV2bTkxElEMddERWhd2tmhmmQ/VeiiLUiTK5Jw=;
	b=xqQdEmJfFJYimnc3jxAs0ELiivychj8U8Pq0nOFh4MNf/3MnGb6e9xSjI0wq62EFXllx
	 NOHh4vYFTCHcx6Qv7mmndyppELrZxR8PfpJj/LldH4yVgbrvYuevzwQq4v9tZvd5xZfvE
	 tVw1Tv31ZDkxcnKxwuSFiauzdLXpEIq/lIoDX01LvrDJDFo8nLqtqmSUsYQdVb/63Rr2x
	 OqlcYbc97LRTfsOWretgF1Juf73RNcQBEovjaLSEtCH6r5dpCYJVyQ4p2VLuHdX/sRtys
	 Vh9TsaVWF3+jpcSGnFSDiwPEsroIIM/Su4DjpKy5vJV4EkmVrSVODH+6jKWW/OUsS+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFp+AUT7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C281C606A336
	for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 07:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C281C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFp+AUT7
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50cc8e0f84so84846966b.1
        for <exfat@lists.linux.dev>; Tue, 17 Nov 2026 23:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794987854; cv=none;
        d=google.com; s=arc-20260327;
        b=axoawI0jmv0apn2vGvqHZ63LQDhZOtrzf3nOPzpO3tXyCebq/yw45q/Za18y9rEVhl
         1yVLYTm7D+pZmEFsoKuCha+iwyPYJZuvC826W3khhRtqxI0VYid+PJK2zYdFd19L+3Ao
         87YOg+lMSWV0EbmL44DuD7P8ezw7xcrozy4X4CxLkwRtq3LTgjXnMlJqZl4NgPbM/dcW
         hVnQHeXcppN3PjILssSDnIcqKYDEibx07G18q0OT6doopWRihbVmTrWIRMBUA8vvwxis
         gXxLpyTLrR40+2DALWHg5K5o3AwqEJDW2P5TVk+3+siShCAo4laGZfcL6gaNTQdx5qfL
         rEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n4AlrOV2bTkxElEMddERWhd2tmhmmQ/VeiiLUiTK5Jw=;
        fh=+hQUIuOt+wZNSgM5PxliCA9G4G0eXXDiz3Z4m0u9KkY=;
        b=baeI6UyZ9Ea+nLJ1HmwJRplt1FQJU80pJAMHYFzR/J63J0c4sXBW6942Ok3RJJe7gV
         TKkvtfoZ2ZTdtWoKZ5NnqsTb65qXctyme7S0ydnfg49FpcCwy9u6IOizEDhUn7+1ZKK/
         RRmUXbjWJwDvcNxrUfvlHRAAhiyakeY+IazpUOXBdvHoppf4zubIiNXP22DHOnf0UgWT
         /cGD0CroKfmc16ycNsx4qBNUzuEVuRszW3FEFzan5/WprKg999v3iiJYW9iqndtAlFIA
         Gb+d6hKTFWWkre5DwbuNRkODfoBntwxJqqAnV1/7WA1MaCt2z2N2TXd0KJJ3aTzu4IB5
         Kh2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794987854; x=1795592654; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4AlrOV2bTkxElEMddERWhd2tmhmmQ/VeiiLUiTK5Jw=;
        b=hFp+AUT7vN18dzhtpj1avJHh28veDgRORqZeh4N1Jj6HG1Urqh3+AbeDDGA4y/F6Gh
         ai2SCXyeXWykmIwbg8aeHEOM6bVBtH29XieXzieWpJFN2+qFg7noaVTponbshhbbRLRh
         Gr2yJNTcOV38SREKAGSD6TwLfqQ9i9CwEqV1fQnnJFZRL8q9cXsC29ds/YZWaAaQHtFr
         xDlJDU/feVPLIkM2NuoDPCV/hMFs6ei1iKZWUaRIBK0Ri9TZq4Fmz4hsTbdBVct7lgBA
         PIC2rbbyjoQLyTHD7wbhoLnSjBbNcrCBApEwjQwH75t5COMd7Zuc6BAjbjopyuV1JQD3
         iI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987854; x=1795592654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4AlrOV2bTkxElEMddERWhd2tmhmmQ/VeiiLUiTK5Jw=;
        b=Tp09IVEXp+h0KT00a3B9Wf+gYqXvSYAcNyrtjuvVOLQpzkO5DW/Tmt2UBW2zi0p4ur
         h0ALIjmJwnjS9Q3mz0DkBZFKexqo/eG6hPaS+h9M9sn4IlmjJBZ8lG4X3hFbOoYxWIGG
         Ig/lbBgVjMgqlL/zRBgptVsaSRcI4utPUzmk1Q+D1dHiXMiX0CHY5FuR2mF34lVcsJnS
         td/SbD1jI85yiS6AK/KZlJDaC6JKeRFcKcKQgqFH5QopE7+niquIpEw3SNXnywLWTmvm
         Y6fMPJoyRkJpN0SXWTjzoAG4nRYAzL9fe/YXh4C04VPPJF1E6mx2nZbhA0/S0bZWxvID
         agpQ==
X-Forwarded-Encrypted: i=1; AL+hErHZVZ0Ey/sAB33eD7IJATAFJTLcvNXm4N2HaA7NxDFgownPGVGn+blzVNbkejgeX50tbGWcZw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9b+A5RH/nbPoZfk/MWnaJsAOLUabx3dK8v5u4S79og7b6TorKK
	cMnEbZGj6nH0qXwuiAsETdVifU2zdgsAwiKT74k+Uh7uqQFNYlROKMtb29MQy3yZHpV3L4bb8dx
	ooNzsbOndyXCBWzOyLP8SE6R2A5UQW0M=
X-Gm-Gg: AYBFou1i6wVrSA8r2HadCT4EDtRAkIucfZJpMAbqBUisxsrCy+MrwQ3l21+e61Q8Es3
	8KfDyzaaHVDchw4ffTtQyrgA10YgIybcdWS6y75bhrSW+7njOf++r7tTOyETB6Epap39koNlR+j
	Bc5JLVaaoDcT2he07P6BtRCrld6Vq9tP14GeGzIfPNZ5jpU+jVm+nkYVPC2BDiloReTWddJoR1l
	6y+VOIQzw+MVV7Me5tQzZoXS3kFX/jaKBF62UdlL+o6dmgKNJinonS7txSs/7mDhQiiK1LqqT9r
	2bh7JMBDB3oTecE++GqTvwCm0+ZFrH2R1+1yDM/gyOOYqhplMthJlWJDtxlltrlyrBBwrXwa7TH
	OXWXh+x4AazrLbv3tmqtGeP9UniVLUY+cN9h8E0aziS6rYPF/kAgKPobBpP6i5frooI4Nhg==
X-Received: by 2002:a17:906:99c5:b0:c2a:ad55:b3fa with SMTP id
 a640c23a62f3a-c510debbf56mr128472166b.7.1794987854109; Tue, 17 Nov 2026
 23:44:14 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-8-koray.fra@gmail.com>
 <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com>
In-Reply-To: <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 08:44:02 +0100
X-Gm-Features: AclHuK95FDUZyIgGYH5oXAgwPF3l-5HxSmk1nBdJ9DPBoS5wbYWUIu9nYKyQ4rA
Message-ID: <CAOQ4uxhpMARO_ZMJDeoa044BwufLVnS0o4Fv0abBF=tjaZmtWQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 07/10] nfsd: add provenance time (ptime) via FATTR4_TIME_CREATE
To: Chuck Lever <cel@kernel.org>
Cc: koraynilay <koray.fra@gmail.com>, David Sterba <dsterba@suse.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:02=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote=
:
>
>
>
> On Sun, Nov 15, 2026, at 1:03 PM, koraynilay wrote:
> > Implement provenance time (ptime) in NFSD, as introduced in a
> > previous commit ("vfs: add provenance time (ptime)").
> >
> > Map ptime to FATTR4_TIME_CREATE, allowing clients to set it across
> > CREATE, OPEN and SETATTR compounds.
> >
> > If the underlying filesystem supports it, use __vfs_fileattr_set_locked=
()
> > to set it, returning -EOPNOTSUPP in case it's not supported (i.e. when
> > __vfs_fileattr_set_locked() returns -ENOIOCTLCMD).
> >
> > When querying FATTR4_TIME_CREATE, request both STATX_PTIME and
> > STATX_BTIME, preferring ptime over btime if available, and advertise
> > FATTR4_TIME_CREATE support if either ptime or btime is available.
> >
> > Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
> > Signed-off-by: koraynilay <koray.fra@gmail.com>
>
> > @@ -3646,7 +3649,14 @@ static __be32
> > nfsd4_encode_fattr4_time_access(struct xdr_stream *xdr,
> >  static __be32 nfsd4_encode_fattr4_time_create(struct xdr_stream *xdr,
> >                                             const struct nfsd4_fattr_ar=
gs *args)
> >  {
> > -     return nfsd4_encode_nfstime4(xdr, &args->stat.btime);
> > +     const struct timespec64 *ts;
> > +
> > +     if (args->stat.result_mask & STATX_PTIME)
> > +             ts =3D &args->stat.ptime;
> > +     else
> > +             ts =3D &args->stat.btime;
> > +
> > +     return nfsd4_encode_nfstime4(xdr, ts);
> >  }
>
> I have trouble with this approach.
>
> We've already established that, for the Linux in-kernel NFS server
> implementation, FATTR4_TIME_CREATE reports a file's birth time and
> does not permit NFS clients to modify that.
>
> After this patch is applied, the server reports the ptime instead
> of the btime on some filesystems but not others.

In other words, for some server filesystems FATTR4_TIME_CREATE is
settable and for others it is not.

Isn't the NFSv4 protocol equipt to deal with this complexity?

>
> Essentially this changes the semantics of existing files that have
> a btime set -- technically that's a regression.

I fail to see in what situation this is a regression. Please explain.

The only oddity I can see is that a kernel downgrade could result
in an NFS client's view of FATTR4_TIME_CREATE going backward
in time to birth time, but I don't think this qualifies as a regression.

Thanks,
Amir.
