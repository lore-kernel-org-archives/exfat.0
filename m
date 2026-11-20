Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795154626;
	b=RZx/kkrP/0SzJd6NYtx4d6dZNaAPr7QlampX8gBo83q3ov+p3WEAJKhSuhUMijPX9+Pe
	 /V+1o51z3rlqtlvd0g1qg9q2ox7lz4gyayHJ2x55F2KiMTOcyLYkc25z2zYII205hdIxR
	 UkoJGps8VDg+S27FNtQe8mqrX3kJQW/9UEjRiNqS+uc8gYEJV2n1zFW4Y2CIOUhKifFad
	 8GxHMMdUq8YPfFJfms2auxN7LW8MJ0dbNRS55wDTr/d2FgfHUm8LqKlJltihoJanPf0TL
	 gu5/dQB5dB6dCH0y9CPoQ4duz32L87+wOP9YVIlP89/KkCyZFTXVxR4rRDvrTOMkRzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pGOGVjzDtRAIxks4mvGvAXFdrHYvYvSfhVh3EqISUwM=;
	b=Mhf52eX0C+6ty1sVb7Bi5jG49LMjp/G1ssAh3J/HdRjVdzKjGGLg6IMiPRXUUy0jdfwE
	 WLIqINxNBu+ALvNXyeeN74+Jlq0tigv7xDsP5C1tuyHyCc49h4kDBzIhvFIvmLEZ8nUN7
	 O1hJ+izdErWQQ07Y+UWPZZirIffPS2Wa6m4jt367fkmIqpbKKgxCG2onXmksiabfslN3m
	 B0els1Derz9ZcH1HKMHUaYaoJjfYFjzEaWSkHIXAAXkHHatjioR4Ay86BQZnZRWhq8HVA
	 dtsY9UgbvqlO2PnRq6U4ST2TsWbis7rJzJwIUIcAHqKFoR2AMR5rKQaqQDBOurhR44w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVeX9UX+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9470160A260F
	for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 06:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9470160A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVeX9UX+
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso620600a12.1
        for <exfat@lists.linux.dev>; Thu, 19 Nov 2026 22:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795154624; cv=none;
        d=google.com; s=arc-20260327;
        b=l4HgxgUjv+regtRmql7hMF6uDpP/Ig3RP6GO0rDzAkRC9h0wTx7KW6RZbmOTOtGVjA
         T5xiqNgUkllBNnpvCzP3zS+TRwR98vzfNn4VMhndWjUJxs0M0rwGiFW1lLLq2ydlVdle
         /gDofWyV/Wp87g9CuL/6fk4/LfR1bFmzFxjFCXBG5KlPidsEVOOicVEcKKnIH5tqo5TN
         SS91IE2dlrlJPqq/xWkclYPInl1yaIeAOEJkingxW2OkRlJZyZ55sGg/KeOoC8WYB88O
         eKV9t7nan01stulmDwYOA+kxo1PIriEnbEOEruBD3QFhkJm/Z/GUDWCpwiANyMDaHqu4
         EnsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pGOGVjzDtRAIxks4mvGvAXFdrHYvYvSfhVh3EqISUwM=;
        fh=QuV2Uw0lDuWA05KsnV83GMyaCMvwQ7nOGiloTI13XE0=;
        b=LTKovQaxsOupZ4AnWFyWFk5Jy3XxFU7e9BJqM6ww1RRUiELuHOuPoetjBjcAgVY/5D
         43QK4YXmajuDSgCXkM2iY78IUfudKbAht6taQYwO1VGtFuRRtvrc8NjNfCq3DsaAcjXQ
         AjJJpFdAStzJH8yx2m+6VXVzwN89xW6jXNWfqt5ZLoKVYk5EQfvUAXdKe+Ewzrq7J8F0
         RlWTKJWAgu+qIblPfbJgXPrb+Qdo9vFt+0aw7v0qp8Q8+AU89OihNqzexdsj3ya6YJe9
         UvZjpvGEZb2JFTgYJq64ya7FNjqzlWRPYaKQZ7XFdNOKe2UkIOsXsWGg0wSmyQYJSzRE
         cu3g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795154624; x=1795759424; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pGOGVjzDtRAIxks4mvGvAXFdrHYvYvSfhVh3EqISUwM=;
        b=hVeX9UX+rI6jwmkihmnDnZT3+LzNCvDlEb6RYKbY60O66wTdySvCCXyql82/+nW/jb
         7/Up0yAUL/qW9DQeBADpCl3D14RxTOZTHeln3SvWkte35f5WSUw4WgE1i++6+sY4asuN
         EtsxdThQ8I8DqWQK2VQNlIaGa4vlR91u17MstSsZysc/iAseLXxwWjRhbm/K2yFAckfV
         Qjr+B0bZGlNknr7Z16lnbSvmpa7IyaFLGvrQNaBQ4SMK9QVAerfZQWOKU3XR80ECJu19
         /UTK0bvKRQa63t1cDCSZ8roqkqPaTY5Kz+ZgEBhBTOaZuA7kmIhL2roTPHpFQ2moBeZ/
         ISjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154624; x=1795759424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGOGVjzDtRAIxks4mvGvAXFdrHYvYvSfhVh3EqISUwM=;
        b=d3qYbjShHU0gxbA+l/RiP+7uSWjgCsoySG40hzOW98P+iBB+jHfmH6h/YiBqmR6LPK
         WwZkjcDJyo/x7T18aVR3LyYUS+Pk3zEYBj19YjQalSZjJF7YkYGDJvEVllUl5vcCf4nU
         nBu38zll38ELhVGiq0sidXhwyHEQdNpaHmeOhStexfhXa0ytsHgC9X1ayA84F4SvM09s
         At2op156KbcOjWdwuPRYaODd9AGzD+c0or3FD2ySPEXeKpAYqRPzucA+eEp+09vmy1QC
         S50PoDz5Zm0sERIA8ZczQW5Cg+SEUl5ZmZ5UdAltsHnZJyBJkCI+Arz6ve9OzVqrHmnW
         xbnQ==
X-Forwarded-Encrypted: i=1; AL+hErEhR120xUYKiLiyi5olgP3W6PMSqvDhKuiqp/arMWIkszFs5o4mprHPndo4G+Pkmmoo2cteHA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9kVF68G1eFHMl/GVfd6XWlDDorGcoIfnbuIGvUKt9ZzdHShTub
	ZPeR9jJ1vfW3MxFT56OuhCu149F1XjYyg90e0rAQaTLiaYuWZWaiFKAcxubkyf7l7hCRbpRZRka
	n1cIl62PZYKZyXy6ujiI4maFtiy3HDNk=
X-Gm-Gg: AZFdTZf966No5Lywd/2GXpdcVZcziBTqg0Wtm8ChIqhlHMALgW1GbPCmSan2p/GJC7j
	/L5ecdHhZjVLot86Ngl4yg2B57ZQ4OamdUAxFrU883TymmqSQF0AU+13snRKOFvUcZ+SVXNMp3z
	Iz73+Esx4pmZ5iYGFI5AGzfwATSibkUf23r9Csx4rUKKwN/U2bWmBM4lJacvl/6wcpeqZrkmcy0
	ult1+z/alFuMGcXAtVsy9J2v3OIDkcTO0Y45hjfDtIDVtNoHLjcOMPe9W5c25dUZzlZNHqIx8Kj
	fB5JJHlTD3gaZ4aAqDy45psq4UN+KEfNammbaLoR5vbCCrOwKB2x76CfwaD2iO4Z7l/hVImxF31
	y0koOHjyPGTET3hGY+cGZSHRLc5kpp6ES1Dsw1eDWkYCOqT2R2uSk8BCl1IjkgoSRMBOOvzAHvU
	0BVffqS3IDJAJ3PXs=
X-Received: by 2002:a05:6402:e06:b0:6b5:4f5c:cb2 with SMTP id
 4fb4d7f45d1cf-6ba37ec320fmr1108851a12.34.1795154623771; Thu, 19 Nov 2026
 22:03:43 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-10-koray.fra@gmail.com>
 <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>
 <DMZIQG4U1NTH.2IN0S2YIWEYTG@gmail.com> <20261119220936.mssmaixcorn2gzli@pali> <DMZJGB07CO56.IZ20OCGGH6C@gmail.com>
In-Reply-To: <DMZJGB07CO56.IZ20OCGGH6C@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 07:03:31 +0100
X-Gm-Features: Aa3M54rvTAbJYlhFUqobPAqFrpuIqbxGTrlnaPynQQoE0nz09X_6dT10Gv8Q47Y
Message-ID: <CAOQ4uxhqgsh9ahJsX7C4YyZH2n_r8VwOe9X9jZwsKALCoYvyag@mail.gmail.com>
Subject: Re: [RFC PATCH v4 09/10] ksmbd: add provenance time (ptime) and map
 it to CreationTime
To: koraynilay <koray.fra@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
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
	Pedro Falcato <pfalcato@suse.de>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	exfat@lists.linux.dev, ntfs3@lists.linux.dev, linux-cifs@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 11:25=E2=80=AFPM koraynilay <koray.fra@gmail.com> w=
rote:
>
> On Thu Nov 19, 2026 at 11:09 PM CET, Pali Roh=C3=A1r wrote:
> > On Thursday 19 November 2026 22:51:26 koraynilay wrote:
> >> On Thu Nov 19, 2026 at 6:34 PM CET, Amir Goldstein wrote:
> >> > On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.=
com> wrote:
> >> >>
> >> >> Implement provenance time (ptime) in ksmbd, as introduced in a
> >> >> previous commit ("vfs: add provenance time (ptime)").
> >> >>
> >> >> Map it to SMB's CreationTime, making it settable by SMB clients. Wh=
en
> >> >> reporting CreationTime to clients, prioritize ptime over da.create_=
time
> >> >> memorized in the user.DOSATTRIB xattr.
> >> >
> >> > That doesn't sound like the right thing to do.
> >> >
> >> > If the server stored a CreationTime that client had set, you cannot
> >> > override this.
> >>
> >> Ah, yes, but how would we handle older files which get a custom
> >> CreationTime both before (in the xattr) and after (in ptime) a kernel
> >> upgrade?
> >
> > Just to note that this problem is already there. ksmbd can export for
> > example ntfs filesystem on removable disk. And this removable disk can
> > be connected to Windows machine which will always only touch
> > CreationTime and ignores xattr DOSATTRIB.
> >
> >> > When the client sets CreationTime, the server can decide if it can a=
nd wants
> >> > (may be a policy decision) to store CreationTime in PTIME and not st=
ore
> >> > it in user.DOSATTRIB.
> >>
> >> To fix the above problem we should probably keep storing it in both
> >> ptime and the xattr though.
> >
> > IMHO for a long term solution it is better to not have duplicated
> > information in xattr. Because duplicated information are going to be
> > out-of-sync. Windows NTFS driver will not update xattr DOSATTRIB.
>
> Yeah, to avoid out-of-sync issues is why I made ksmbd prefer ptime over
> the xattr's CreationTime.
>
> >
> > For me it looks like that this needs some policy / configuration
> > decision done by user. We do not know if the user will replug that disk
> > also to Windows NTFS driver (and then those xattr DOSATTRIB could cause
> > out-of-sync issues) or will only use it from Linux or Samba and then
> > xattr DOSATTRIB is probably fine.
>
> I'm not sure if this is the best solution, it doesn't feel too right
> to me, but maybe there isn't a better one.
>

If you ask me, this is not your problem and I agree with Pali that
this is a policy decision.

I would not include this patch at all in the series if I were you.
Maybe as a demo user, but you could just as well include a demo
user application.

The nfsd user is a simpler demo, so as long as the nfsd maintainers
are on the same page wrt the mutable btime plan, you could include
it in your series.

The problem you raise with DOSATTRIB xattr is similar to the problems
that Chuck raised for ptime vs. btime as the source of FATTR4_TIME_CREATE

Thanks,
Amir.
