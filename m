Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632194;
	b=zo2DFfiwtH9XlYp4LKJv8CyuMzmfZHLz54UJU211hdAM10uDsigxva8Ty8Ir20Y58FyI
	 rZGYwysLJDu/ermeu0VKb/XOs56KeYCBgPEFiFRM83BJJCYvAYstSqxcURofSkeX0qO5F
	 7Hz1UcbMu1Jh/3BRJouhsEtVKYZJdHCkBh0Jr7jAROjlzlnU9+coFHAEcgRXsUPbKS0yT
	 4L/j5RRrwdSRXeXe8fMI03bYYqRRmXNeSZVFXsoGAhqbAsc/iaSCUcGtWvhkQOaqstCRS
	 u3SMxycHsTsceH3bTVYZ7X0FjFL9oU1PQ+36QBOlZ/aXwT/ZMSDuhAsDFN84S6fRX/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V5oGEHqJ8v+T24gYPQlWKHiFIfSM1fugDdyxpETnIGg=;
	b=uVVXW7zC+rFETX7f0okwTAtq6S+7YR9ulDpW9141IeM4M4if0xCGyYzpkVDlx4EK8ADE
	 zSnHrUpDOE7xVFOF7RL/InxKowu/hJRzUfHKUYAsPw/pDqovmqV5CaDXDL+1a3m8plGPv
	 jcrAwuwX4xpZMBAmU0hVMNOqlKEHbCJ1UOTzCEz//4ODj9HgNVpktFdXtwIijz4Gg/L8k
	 vWQwRBmq9PU/RA5H8ox5GjhbREUxtJ3t6dCEuFG+dVOUaVb8kCmdJ4XjMefo4FAg6eIQJ
	 3v4HjpOMyst44UIetRdgmv96FtRWc0RJFDHuBZJ5ZTV0aogvQHhaQjEsY345TTOBz1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WKvTr2bU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8202F606B1FB
	for <exfat@lists.linux.dev>; Mon,  2 Nov 2026 15:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8202F606B1FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WKvTr2bU
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c43373ae89aso473493366b.3
        for <exfat@lists.linux.dev>; Mon, 02 Nov 2026 07:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632193; cv=none;
        d=google.com; s=arc-20260327;
        b=GJ4A6CeaPJI2DXNl7bHVij093D4YyO9K0WTJsL9AtFR/p8MvQT/ncFVEhgC9ngFw0K
         zvALcNX6gOz1IL6Ncso/ALgAuRbQmK95YkC9S0w0WamM6lU2s+fjVKW8sOuv0ZdVokdm
         nOYrfrGe65Yi/G7IU9jUqEZOHQjpYirXacvHaruqwUjo4KePJO3T1eH/Xnki68NshRs/
         4baEnSxW2jK5cubWOLd2BZ0gQKm5dNOy62WSPZoodwEihejYyjWKcyB4dX7gGsB3q+Jc
         423QWyntYiePm8bqipwoc0ogob5twoWrP4EwkUmQcNy2Dc3YAo9OPK9HuzbvupV7oMGo
         UlXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V5oGEHqJ8v+T24gYPQlWKHiFIfSM1fugDdyxpETnIGg=;
        fh=kxGg5pdfviey/ckfmqWR+SeRP84PR0bQ+/fYcKB04k4=;
        b=XXhGO1LW0Ua2OCNR/Pwc8TdRknduxy8f07UxBt/Kh8O2zoxn3y9hTr4wMe73mKOGfn
         Cm9wuS2oM2wapSI9uf6sQ0NVqb/95N/aub87QapdMagZSD7ETlSu9MvYAtSbk4zjLtS5
         dZNHXnXolMSymsoNaDNmisCOMap1LK9sTFlP35JVI73ZIDQrDXlX8bC61ksHPlBwvcLQ
         /81Zu0eR7bwauDRwPZQXAsc00b3y8RYv+b68CXS8DCMZt0aRkw3AnoWt+hzAV5A2rH2s
         TNYNtqxMpiDYEdSFyqbIyfei8F3hK+9FY2upYlDWZqpUt2vN553x7hDVdoqMVrdX6sJW
         sv0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632193; x=1794236993; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V5oGEHqJ8v+T24gYPQlWKHiFIfSM1fugDdyxpETnIGg=;
        b=WKvTr2bUKjEZBLIJp7Z7t++W/J7wcqAT5KISXdyZdJmAVshVP8gwy6eHXmemIx7I7a
         LZWpYARboxh+zsQhzSC5L9hh+aS7U/4MCDoMB0MEpJKKnJoR3G/F5Wx6JPa7Fn9nckI1
         wk9SwMEMs8yfxwRUl0lLbrzVOgROsEq//wf1PBmCe4Uos1KmW5tFZix6C4wNb0Dsg7GI
         55T3JD+5h3P6cPdcs1gNQXFtJLbJjAEyn53hRVsfY9yYFkDk021jpGNVMrLUyjODnZLa
         lfq2+Hqk8ouRMEqCGdRCP2DrAWJ+H/YdDas6Hc8w6i1lXppKrdPWwGKA8h31Soe+NTu6
         X3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632193; x=1794236993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5oGEHqJ8v+T24gYPQlWKHiFIfSM1fugDdyxpETnIGg=;
        b=icqEBnJLP7r8yJFLXXa8p6+Dgn1/IeCkqbyN6KTguu9jyduxMxzWj2aHiogag7ryMR
         nsUt8LwcPhguEixSlbRRC9ylq91ovkvCwt2Z3RrkfMXelY5cf7IdtucguetNggZbpSj+
         YxuVUIagB23rVeMk+m3Oly8gBhiLVOOZdzdW3xGmRBAYspLA+cCfw5l1GtSWqWlDQdJa
         xaddej35C/cHQDeBA1/YRSOcF6eqI7l+3x9dJ8Ng6Oryh9WkXPpZuot+BUShxcN+RohF
         T2dhE1BYQveo0yq2+mSMAczsox28J4T8fsR3bqGCZP7tOA+qHgjLC1V76+XQBdBtp+NM
         S6IQ==
X-Forwarded-Encrypted: i=1; AKwUvByhe5Bk5grQw3ac/ZlBKEBj4gW5lIgBKZUfsehH25swI0QiqJ4EWgOPqEoxiaSfHmYs1uEfew==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Q0IiCZekCyIMiu4Xyed+IFKB2RLrdwtm6VZLKloQqGYf1Brkq
	qJTGwbdOxFwiFPNjEPcV66jx92RwotyDx0lIOlVbhELCf8Zmcr2TBmbPqmyvh3vJkWAZD4Grgdk
	fOgyxJc6p4mFm4gS0q6m+VzcqI5gVxbU=
X-Gm-Gg: AYBFou2HjAmLERvXCZnhPxCnc6BNiuXOppz8t/j0wwWmBtn9FECZpdgh2Iyq1qelXI+
	xcXchwWg1DDXHEB0LcbPChqqCwH5fFViExsyyuP+y3u2/P0sc+ZylHCwK/AoS0zyQPrzb0J4X0b
	FEOWwSGlR4soMJ9Dl3U38xGnDHyK/h3lojxv0oR6qzsSwDOo7QSFwAI50jRekuDNUppv7WTeeSf
	gvfMJor8VWpYOc6ezltowaPQUaGkxne8zblJX6XWNX2kKB1CDRDYW2W3uvFR0gs4vUgKFZdpFA+
	M1l3HdPVN0fSQIk/yzjXWT0kMrHAdfJcjoKszTm+9FTq0dcb51P69Cg5SAJbb3SHfuujKqlh33+
	FF1jsk1zlBHpf/iEBGNG95muWNsjCGzQSluig8tPON7fPjKg7iIhKj24uM394A9fbgGfGeg==
X-Received: by 2002:a17:906:4fd5:b0:c46:7fa4:922c with SMTP id
 a640c23a62f3a-c4ca7b20e1fmr868205166b.24.1793632192478; Mon, 02 Nov 2026
 07:09:52 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <20261101015551.786044-4-koray.fra@gmail.com>
 <20261102142452.d6jkitgdeuquy23i@pali>
In-Reply-To: <20261102142452.d6jkitgdeuquy23i@pali>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 2 Nov 2026 16:09:41 +0100
X-Gm-Features: AclHuK8kuq8eQ7yCdpsnJrZqU_PhMlxnY90gMXEz8lBNnkHZ5ogvsTJfHTXbOfo
Message-ID: <CAOQ4uxhQ3uhq6s+4deEJAQV5iy8QZoucojR58_dUNYrnjt_yvA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] ntfs3: make crtime user-settable using ptime
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: koraynilay <koray.fra@gmail.com>, David Sterba <dsterba@suse.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Chris Mason <mason@kernel.org>, 
	Jan Kara <jack@suse.cz>, Yuezhang Mo <yuezhang.mo@sony.com>, Chuck Lever <cel@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>, Sean Smith <defendthedisabled@gmail.com>, 
	Andrey Albershteyn <aalbersh@kernel.org>, Pedro Falcato <pfalcato@suse.de>, linux-btrfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	exfat@lists.linux.dev, ntfs3@lists.linux.dev, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:24=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> wr=
ote:
>
> On Sunday 01 November 2026 02:55:49 koraynilay wrote:
> > @@ -154,6 +158,11 @@ int ntfs_fileattr_set(const struct mnt_idmap *idma=
p, struct dentry *dentry,
> >       if (flags & FS_APPEND_FL)
> >               new_fl |=3D S_APPEND;
> >
> > +     if (fa->fsx_xflags & FS_XFLAG_PTIME) {
> > +             ni->i_crtime.tv_sec =3D fa->fsx_ptime.tv_sec;
> > +             ni->i_crtime.tv_nsec =3D fa->fsx_ptime.tv_nsec;
> > +     }
> > +
> >       inode_set_flags(inode, new_fl, S_IMMUTABLE | S_APPEND);
> >
> >       /* Save nodump flag to return in ntfs_getattr. */
> > @@ -275,8 +284,9 @@ int ntfs_getattr(const struct mnt_idmap *idmap, con=
st struct path *path,
> >       if (unlikely(is_bad_ni(ni)))
> >               return -EINVAL;
> >
> > -     stat->result_mask |=3D STATX_BTIME;
> > +     stat->result_mask |=3D (STATX_BTIME | STATX_PTIME);
> >       stat->btime =3D ni->i_crtime;
> > +     stat->ptime =3D ni->i_crtime;
>
> For me this patch looks dangerous. Somehow I would expect that the
> "btime" will never change for existing inode.
>
> But because the ptime is mapped to i_crtime and ptime is settable from
> userspace, with this patch it is directly possible to change btime.
>
>
>
> I was thinking more about it... Is not this just misunderstanding of how
> the security model around the times is working on different systems?
> Because on NTFS there is stored just one field which says when the file
> was created. There are not two fields like "time set by user and time
> set by system".
>
> Windows security model allows anybody with WRITE_ATTRIBUTES access to
> change that create time. Linux security model does not allow to change it=
.
>
> NTFS in this view is just a filesystem like any other (ext4, btrfs, ...).
> In my opinion if the ext4 or btrfs filesystem is correctly implemented
> on Windows systems, then Windows security model should handle it in the
> same way like for NTFS or exFAT. So if something grants WRITE_ATTRIBUTES
> access, then Windows should allow to change also btime on ext4 or btrfs.
>
>
>
> On the other hand, I understand the use case to have two creation times.
> One time which would never be changed and could be used for any kind of
> atomic / synchronization by userspace application logic (this btime).
> And another time for human which can be changed at any time to any value
> which user wants (this ptime).
>
> In any case, I would suggest that filesystem driver would not report to
> userspace unsupported values and would not try to invent other values
> and lying about them.

But all those fs with mutable creation time already report it with STATX_BT=
IME
so what can we do about this?

If userspace requests both STATX_BTIME|STATX_PTIME in mask arg,
those fs could technically return only STATX_PTIME and it should not regres=
s
existing programs.

But this is still a bit surprising behavior is it not?

Thanks,
Amir.
