Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019817;
	b=3k78DVlaycezI8nX4Z4N50benMNwcn5DaKJTVoTvB76N3r3KeZucCV4pW2WyOhu1nuGa
	 8OWxppNAaPfSgwMXZDxXsamwrAm6asKzbuj97FK1HrfqnM8gMq19/C+juzzcj6KTt0Yy6
	 YgxDm3Mqs1ViIbeyi/3gcBn96XyUt/aGbhIBar51L3hZ20uYniFoS2NpfCRYMMZXc4aUd
	 u8cI8uQClrLGgMCGk4AUzI2i7ri0ApdFaTDN0Hb2gwjnI8Uc2nNg3ml4MtLs1sW7PDhBO
	 IL4IaLxFBHES5y7FG/cN2x2Dlz9kz0NAR/1QRq9l/EojFBpEM6TJzUoeLtc02gPZaBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ThJWWn15R7JIY3hayjLwOhu3LzqQd50Rds3OyAm+UpI=;
	b=3tU9hCrjEM0NOtpO+jgVylVhMwMKR0a1uaciHMYEn6vCyjnrpqGWkO1H6t95XEVn23nG
	 N4L938vHQBqNDQ9X2GIROErKr0OjRptMO9ZiYoNHSKH/aXcNr+AoeqALQBqFSot6IK5i/
	 kSVaVqJoHQdxSIYlYjl8Qxbq7Acby/OyNjM9XLy0cFRZpC9kECoFxAqBmq+lsYiG+a5gU
	 PBxq0x+gULeMbMWmFBaUr5YjbRvi0jD4dKx3jAXOnSStWN58pUtkkX6A/nem2WsPB+YaO
	 UF6UjGykwex0Hg/rHq1L9ehZD37efD3fJ38Zd7yWTUwZQY2MJsaZcxGKtTW53RMjXog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGIltvWq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37440606A330
	for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 16:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37440606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGIltvWq
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so1678042a12.0
        for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 08:36:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795019814; cv=none;
        d=google.com; s=arc-20260327;
        b=pLazYeyhJ6JZ8pQVc9nVzJYWBwOo27bASVwBrkzGh4x1CGJ+aRVS4BbyKesrFaN4bV
         xM95EbNgEY3J0HraabrGBzJ+3sBwP0o0OT+bzbMpoQmj+25jvsucG3cFkIY8Q3LRwv9w
         4vpAnV9nNlw8SL4NBqqaz0rMNQCC3NBnteHZvjdq3ddEl/5WOqVYqCekXfe5Mu1EoP4I
         nmfS4McwI/Elf0b6JvVGjYucr/RABo7jaiL5luRS4Yua1HA0EAlGNXS+Lv4zxopJNwBd
         7vUnJWriQwPQFHr5HcMWmgU6GWqty5yfgVHfoWjp506lhTbti3Aj9ELMNgdkO2K93xb4
         ZrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ThJWWn15R7JIY3hayjLwOhu3LzqQd50Rds3OyAm+UpI=;
        fh=Z3EvrrDSNSTPYYZuhxAwhEpUhO4Bb6atrZZglCLcOSs=;
        b=GisIQJWYZvLLVR5wpXFs2kYvMk+uze6IL6PDTDNgTpvHIJNY7QqYaIq7YhcXsrjbkd
         ag8gZCLOScAPXNct0pTWmJoGf8AKq3RV4t4igP1v50YgeksV4ullYAhVgbZDXdtdnHWs
         h4HWwvYR4tUyEBsgh7JTJOQEgfpScv670uiprS2uISHSdsGeqV0BB2q0BSQ+2ZTPfycF
         VyJHCyMZJ7ZPVY2JeizuTp2J/pUd7w5fXDmirah/zxO1VEPWHs2p619jT6H9+OHdMBnZ
         PxT7brkYAmUaRLdHr6VUFxyYj66MD4xAS1YVJteXEltqIfNScYGJilfnyuyLwwtJ/OWg
         rzhA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795019814; x=1795624614; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ThJWWn15R7JIY3hayjLwOhu3LzqQd50Rds3OyAm+UpI=;
        b=EGIltvWqCmxYgFhyPzsPFdRCXAmOaROmzetW+p9/cX/3lgCsww5zpjEcwMlGSVq/IQ
         t3LeeXJTu+CYv3R5KMLrUgCvpvrvCdU2EfT2ZLq0bkoexomIYOjuwaSS2PW9jfv1NUnM
         ZbUq6xMEgRJ6SV18ulr7u+NY8dqc7i/OuUo4oZdjM3FuEPrsWkVt3iWoK8twJVCDrA+4
         +vhEk7Irg77D0kFEt3mSlMlGQP4QyphQLPNGAH+6HSghFRERmrRdFYroGZcKCp1gsfRp
         fUiXAsBkngsQ87KQOtFlOEEZtQBPWw47T36eTvK3UmnxejGsBQeYPp+kzg0GcmAkrueJ
         /g/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019814; x=1795624614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThJWWn15R7JIY3hayjLwOhu3LzqQd50Rds3OyAm+UpI=;
        b=tlzRgRGkrs7SAO1zE4cxWQ/01hX1pdmmNfxnfFn/xg10qrqlFWCj/+UivpNfullBCR
         u63B7V1zK5AXyKG66YZAMGAZBtXwKXyrzMhIImZ2Q0+ATm9P18H/mlaEISAOjMLxq/72
         TnHELc2j0L2QiIFqs0aiQjDFj7N9z0XsC2hhXRslGeISA+IdzRpMjmevoO8mTFKEqRen
         xlENr1G++AvE/38NlAgGzIYeSKVJcKaRN7H4ec/lurEJdnU7k8TR7CUcVuo+Heu5IoOh
         zJesn1qxWxuvtuQXVC0j8co5Ozfw0cm3+sRYINzzzrJZwPnTQnQV1Ey7Kt98Mte7qiXi
         hCdQ==
X-Forwarded-Encrypted: i=1; AL+hErFEMzcu7rmVuFgdkH8Mu6dcxAKFTZm3SPtG3rcHjKqhr9Xj061pRS1dsdegWOnJ/7BtwwTbEQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/ksGXDLnmU2ZeyPIOjZeiurI5CQ7pMLFiXCJqPWjZKGC/Ye0sx
	miZ/mo8soQy7Prff0Wjylzt+E8cRY03L85Hnj2K9KREXIdFtaPa/Wo5udPp3IpEgPK4jnH/VeEd
	1WV5TiMmh9Y+9//Ofv0WV+hqOz2NY1cw=
X-Gm-Gg: AYBFou1vhUJZiN0cVyUzdDSfDEb6GTevvt4OyCG8K/kBSb/2VUBzayQqcew4uVHSD//
	517UWPg0qoErZXmD+tSNqGPwhGFJVV9ylYhmhSFHpSDccr8UEcB7sMWleN0iBZbpf1RG8R/mj54
	u/amOyMOsfLLOsyRyK6+UDyrOvLg4Kuj+I2YDpzyMHN2Nz7brK0yOGwHIl7LFkVlGQ8CFjTsS5I
	rvPp98j2KldJoUboCkan0/fxbDspUbEgW8mLq95k0szsshfaf4j9dvdvRFos7eeWiqzKlqqQtOA
	4vZc2ZULuViscokJVf8JAD2AuPOJ2eO44Pj0iijUTsemuUiamQr5Vq/sfHJcw7lfbmgfy/nVbsD
	d7bV7WRsFKy1MGeA2yM40dQcGzE68UHxW61XfPQ+/LAUH9Fyk1yq3DEgVLdvRzERHtCtvBg==
X-Received: by 2002:a05:6402:c711:20b0:6b7:b12e:1638 with SMTP id
 4fb4d7f45d1cf-6b887effc26mr1999145a12.37.1795019814317; Wed, 18 Nov 2026
 08:36:54 -0800 (PST)
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
 <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com> <CAOQ4uxhpMARO_ZMJDeoa044BwufLVnS0o4Fv0abBF=tjaZmtWQ@mail.gmail.com>
 <cd49ce48-58d7-4341-b4fc-34e63daf3c52@app.fastmail.com>
In-Reply-To: <cd49ce48-58d7-4341-b4fc-34e63daf3c52@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 17:36:41 +0100
X-Gm-Features: AclHuK_Wot5qcfi8_9CAebWCtd31KyKZ5gW_T2w6JAANm_7TsCfaaSyfxQBsTLM
Message-ID: <CAOQ4uxjme9sJ5LGNDnP6rEKZLTJzX_ZdcMohgu2iLULK96GPOA@mail.gmail.com>
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

On Wed, Nov 18, 2026 at 5:09=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
>
>
> On Wed, Nov 18, 2026, at 2:44 AM, Amir Goldstein wrote:
> > On Tue, Nov 17, 2026 at 11:02=E2=80=AFPM Chuck Lever <cel@kernel.org> w=
rote:
> >>
> >>
> >>
> >> On Sun, Nov 15, 2026, at 1:03 PM, koraynilay wrote:
> >> > Implement provenance time (ptime) in NFSD, as introduced in a
> >> > previous commit ("vfs: add provenance time (ptime)").
> >> >
> >> > Map ptime to FATTR4_TIME_CREATE, allowing clients to set it across
> >> > CREATE, OPEN and SETATTR compounds.
> >> >
> >> > If the underlying filesystem supports it, use __vfs_fileattr_set_loc=
ked()
> >> > to set it, returning -EOPNOTSUPP in case it's not supported (i.e. wh=
en
> >> > __vfs_fileattr_set_locked() returns -ENOIOCTLCMD).
> >> >
> >> > When querying FATTR4_TIME_CREATE, request both STATX_PTIME and
> >> > STATX_BTIME, preferring ptime over btime if available, and advertise
> >> > FATTR4_TIME_CREATE support if either ptime or btime is available.
> >> >
> >> > Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
> >> > Signed-off-by: koraynilay <koray.fra@gmail.com>
> >>
> >> > @@ -3646,7 +3649,14 @@ static __be32
> >> > nfsd4_encode_fattr4_time_access(struct xdr_stream *xdr,
> >> >  static __be32 nfsd4_encode_fattr4_time_create(struct xdr_stream *xd=
r,
> >> >                                             const struct nfsd4_fattr=
_args *args)
> >> >  {
> >> > -     return nfsd4_encode_nfstime4(xdr, &args->stat.btime);
> >> > +     const struct timespec64 *ts;
> >> > +
> >> > +     if (args->stat.result_mask & STATX_PTIME)
> >> > +             ts =3D &args->stat.ptime;
> >> > +     else
> >> > +             ts =3D &args->stat.btime;
> >> > +
> >> > +     return nfsd4_encode_nfstime4(xdr, ts);
> >> >  }
> >>
> >> I have trouble with this approach.
> >>
> >> We've already established that, for the Linux in-kernel NFS server
> >> implementation, FATTR4_TIME_CREATE reports a file's birth time and
> >> does not permit NFS clients to modify that.
> >>
> >> After this patch is applied, the server reports the ptime instead
> >> of the btime on some filesystems but not others.
> >
> > In other words, for some server filesystems FATTR4_TIME_CREATE is
> > settable and for others it is not.
> >
> > Isn't the NFSv4 protocol equipt to deal with this complexity?
>
> Not a question of whether NFSv4 _can_ do it. It's whether it _should_
> and whether opaquely choosing a settable vs. an immutable timestamp
> on the server is the right design.
>
>
> >> Essentially this changes the semantics of existing files that have
> >> a btime set -- technically that's a regression.
> >
> > I fail to see in what situation this is a regression. Please explain.
>
> Any consumer that depends on btime being read-only is now screwed.
>

Who is the consumer in this context?
An NFS client?

Can't an NFS client be connected to another NFS server
implementation which does allow this?

I can't wrap my head around the problem.

Thanks,
Amir.
