Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191432;
	b=xl/imnIg9jp5IMRyGh6PUgc105EXglPZy/cZW9k6o4mjAcR7oeDrX2wLSYfehBfXRVnL
	 459fIdlEo/Z5vOjsys+LWRkzOc2IZ1m2S7hEhjSxRm5KrqnKBrWZWsF9rXxwX+CW3WJ/p
	 BZLYib9fGgbVctpzKsjKGkjKkn//3jyI2PZawGBBAf8Gl9I9tRnblJ08ST7wkycnlyp71
	 bAWvim0qOV8CSPs29nz55DdYPl7vJcg1cxcFN1DyQwCC0aui2iPC7+B5tqXLVcVJEAzAe
	 z1XFpsWN4wJAwlpHDVYklyXzoymQ+nN7CA72aN6/qA1TFp+RGnQ+d3SaDf2tzT704jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6pDEC7mZctjuQyIVdZ8lILmTsCvmwBFO6EStJerdj9U=;
	b=RL5qCTkOC0fZttN8zJy+UKcd5Rr1+Sics+Db1P4yy8ELbCgziK0JUuicP1XCkslGTpiL
	 JgvDzknHx5+GYmJzb2C/wFKdoxcJwUuUvK/EqLPl6z48EeFN20NnpVjkmywBR0IR+K6CR
	 oHmmZu3JpKHqShz9A2F9OKzuKOuIYgRbZKXdMGVE9ZhALTe69s0MBBrBbQmY1XzfdN/Fs
	 pCcusKnzsAtRajQRnGfh8enhPVLXF3HBqvqFqQ4fgbvcPGnWGqv7+GZZYpWcYfUF+gT3q
	 Z7ceDKybvQ2GH1SoYpJNK2nVITM+m+7XWgdzJsKV/EPdFds21Py6vWNptoGEatX0Vbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzKK+KWG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAC4606A331
	for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 16:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CAC4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jzKK+KWG
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so1348981a12.2
        for <exfat@lists.linux.dev>; Fri, 20 Nov 2026 08:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795191430; cv=none;
        d=google.com; s=arc-20260327;
        b=ntph779tiLtZPWfYUR9iAOis+GWfA2uppdm+cZJzoHF1g1VXnMepPdBt5yZqZnuRJA
         WokN3L2vzgYwsaOvBLE3hiiMupNOh9RRASybx/WbE6ZNT1LSBE7DDrtLLQ30ElanLc9a
         F4adzrpUxfytvUKAOQHMwOBuMfu2sJO1xdsnn2CPSuCTHf7DODb+mM0tl03ywOClrTGF
         siik4ENemRd9RrS3yaADGCTOZz3QYD6EHy2wsQXXHfZ4ITRVlKQNizMLQPM+tYE7OWui
         C4ReqtPQGKDtLpdL7p/OcGm7up3kUFLdTshx2WYMxUurLizh37KnSHo4s0eU9KRTF7dp
         /CHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6pDEC7mZctjuQyIVdZ8lILmTsCvmwBFO6EStJerdj9U=;
        fh=mZ968Un8DJ38ng2ol3jjFbTxhd9nvO7eUKC/MQsorUY=;
        b=XOmylEJ8iY7MtuHfv76u1fHPsVPg3WIGO+lUgpNhdE4xtX2mYrwLlxZSUMp4bBCEJw
         9lRnfZc5BDTo/1zVxcExvCVgfDPdIUIbJbsvt8oIkfdEMqRulznnUzceg5wUl3rAv8yD
         i8T1dB/1Yx9Gj5ZxU/tjcygL4oRXow3IGDB2+JVTkERew0Dz0GBvqYtq3rjMpgX3Qqme
         lPiLN5QatcAm3ft/K63jFliECrFek0eEQsnvS4NoHlazCA8+iM5/yc0iwWPNnIUFM1zX
         bB4ShPebu5r61AT+ssHeb1KhUp3/3WlTdXkTaF2uCN4onewjIgmTFMCE5ZDsvbWAGV42
         5BHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191430; x=1795796230; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6pDEC7mZctjuQyIVdZ8lILmTsCvmwBFO6EStJerdj9U=;
        b=jzKK+KWGNQkZ8yNyFU4vHOpgDAG6myb+ZOSf66iXUce3Yi6Ed2tf2aE71euW+1c5YC
         mK+CnboYrgSQl9kHP+vpZRJw1PEcFjKO88tyFQXB7+kdADCTZsnB0L1jB2EsGlXE1dCE
         /laXqHPoBfDWB/AgJeM+LSC/XHZ6cUAWV693t5Msa62/EYP8qkNR3a6hdLIe9GC9WqMQ
         jXxeatAjw+aGv/M+C8qk9JwjnTUO3uD0zuPjuqQWcsNZueg4ecPC2AtdmqmdPY65o/o6
         WyRCs6Gbc4Ot63yVD4Q+Oq5RyEM5tTJCUZQWuxgWNYrgaPyKNva/Vi2jrzFySRQFKtdd
         s2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191430; x=1795796230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pDEC7mZctjuQyIVdZ8lILmTsCvmwBFO6EStJerdj9U=;
        b=bEjEUeygjf/10jpMPJmaJnddGfk+x7A9LYNfKnOqKjzB2M1WLiehrk6UndLKS45f0x
         j1avp0UGZL3i4aeQ2hcMetdGgtk2ZmZwrKiqyXG6hdV591lTOVeMeeHdqPYQbRQRFji5
         jV7M1IDR0oFV5RR9VSch+9HA6a3kDlxO87dTyuG50zl69FlUYRXMgls1dECzw4z43eTu
         n70fhVBrD+9fCEwFuJSOTa1Xqlj+OYqBeMvZwakSD6BjMqv3pF3zDM751ZwjiiFWRlob
         5MSS/cEQ0O1g81eToE+9/LyadbkTbm1YW4fRAwisuo7qYaw+TR3df8ROIHkPE+g+VigQ
         k8WA==
X-Forwarded-Encrypted: i=1; AL+hErH3wTLJdzm9eJG8b4VhoubglFGR0m1KltHxV/z2FuG6n6Ke3mhtOfrTxmZbKGATCXBathe8VA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+mc0jQzsp4LcP0sDuWQlbjrThYoR9AQnKJbKfswAl0X+PlidFr
	5Frh+l8a8krPZtdVOhTolA90ch0L3AzAtgiT+my83f6Kt7UiTXxQNFmwTwzgOAAjZcNghH4lDP2
	QuhWXuS/x7u3ZJ1vQrG3UNN15owMvPBs=
X-Gm-Gg: AZFdTZcVjtCod+Qe+nSTYL24Qi8jHzHXE7rLSsiW53t8dK1OiyRYHkwYpbznQhMeeA2
	CJt+JGdYhZLAbGpisS81boCtNHFK30Yl/3DLX72HttBC/btjuv6kzT2+UFN3Z+T0wwWrBrtigt8
	lJyDl2MnZzRqD6qtMksKrG8rtkATIsEvomv/fzpp2Av/975dDRX/1KPKjke9ufG8HS08jPEYlHb
	pxBjCmmTrLCWiqTA1DmuCQPlxPfM1mSA+6KNcAkL8UVG0USlx7oyZWUkk65yPkYTdzJeBYE+0+5
	8bavC2NjIswUqS0SoxXh9CXElfWPOrg5kiMb+JgETGrceABbxYSGgs4KsVqweQUU4yFo9pUjzTn
	afmSoFnG3iwZeuCZ00gi4mip6jNPdhEWMx22UoJbiV8l5+s9NrfYoQ3P7FT/CscceX1bCBw==
X-Received: by 2002:a05:6402:3223:b0:6b8:5f08:931b with SMTP id
 4fb4d7f45d1cf-6ba37ea44b2mr2736007a12.26.1795191430236; Fri, 20 Nov 2026
 08:17:10 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-9-koray.fra@gmail.com>
 <CAOQ4uxgoNsOH82FyrCxc+qSoid_CFmbmpL0qgWFw-e8E689fFA@mail.gmail.com>
 <DMZJ4PL1JVA4.2YEB7EPYJR5Q7@gmail.com> <CAOQ4uxi6h9BBP7pf4sR+gc2+4XtkEgbxXZha45iZzdB_wGFVgQ@mail.gmail.com>
 <DN02S2XNGRZD.1KNOZJ0GGDJNG@gmail.com> <CAOQ4uxh+d-wNC0aWLEexPFz7zj=TZjLyu61kaEmwBx9_hKn2gg@mail.gmail.com>
 <DN0526U5C1RT.3AQRIHXPB86NS@gmail.com>
In-Reply-To: <DN0526U5C1RT.3AQRIHXPB86NS@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 17:16:57 +0100
X-Gm-Features: Aa3M54o4zCHXyRapvg8jSZ5VVJaxHz4N0ZrJOn4Hcu1m2DItc14K7Jop9PLrcPo
Message-ID: <CAOQ4uxjCN-ekd18R-soD8tkGFnXjK0S1VdSNhq9b3Ev6y8K9jQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 08/10] nfs: add provenance time (ptime) via FATTR4_TIME_CREATE
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
	linux-api@vger.kernel.org, Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:21=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Fri Nov 20, 2026 at 3:55 PM CET, Amir Goldstein wrote:
> > On Fri, Nov 20, 2026 at 2:34=E2=80=AFPM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> On Fri Nov 20, 2026 at 7:45 AM CET, Amir Goldstein wrote:
> >> > On Thu, Nov 19, 2026 at 11:10=E2=80=AFPM koraynilay <koray.fra@gmail=
.com> wrote:
> >
> >> >> >                    fa->fsx_xflags |=3D FS_XFLAG_CASENONPRESERVING=
;
> >> >> > +                 fa->fsx_xflags_mask |=3D FS_XFLAG_CASENONPRESER=
VING;
> >> >> > +                 fa->fsx_xflags_ro_mask |=3D FS_XFLAG_CASENONPRE=
SERVING;
> >> >> Uhm, why both in _mask and _ro_mask? If it's a RDONLY flag shouldn'=
t
> >> >> it *only* be in _ro_mask? (same for CASEFOLD)
> >> >>
> >> >
> >> > Good question. Maybe
> >> > I guess if you want to follow some percent
> >> > FS_FL_USER_MODIFIABLE is a subset of FS_FL_USER_VISIBLE
> >> > but I think that exporting ro_mask and _mask is going to be easier a=
nd
> >> > cleaner than rw_mask but not sure.
> >>
> >> Hmm I asked that also because you said in the xfs shared extent thread=
:
> >>
> >> > The advantage being that it makes the interface symmetric.
> >> > User can alway setattr() with the buffer they got from getattr()
> >> > and instead of randomly ignoring flags in set, the fsx_ro_mask
> >> > along with fsx_mask defines the behavior exactly.
> >>
> >> But by putting the ro flags in _mask too, a user would have to clean
> >> them out or vfs will reject the call with -EINVAL/something else, sinc=
e
> >> in that case the vfs would see the user say "I want to change this [ro=
]
> >> flag".
> >>
> >
> > That's just a matter of interpretation.
> >
> > You could say that if flag FS_XFLAG_CASENONPRESERVING
> > is in ro_mask then its value may not be modified and fs needs to
> > fail the set
>
> Yes, that's what I was thinking.
>
> > if the user given value is not a match to the current
> > kernel's value.
>
> Since this is a new API, I think it's fine to -EINVAL if it's in _mask
> anyway, even if the value is the same, no?
>

The question is only about when a flag is set in _ro_mask
and say that it is not in _rw_mask
what do you do with the value of this flag in _xflags?

You can simply ignore it, mask it out as  copy_fsxattr_to_user()
is doing today and this is probably the right choice.

But you could also take a more conservative approach
like ntfs_fileattr_set() in fs/ntfs/file.c:

        /* chattr passes the unchanged read-only flags back to us too. */
        if (NInoCompressed(ni) || NInoWofCompressed(ni))
                readonly |=3D FS_COMPR_FL;
        if (NInoEncrypted(ni))
                readonly |=3D FS_ENCRYPT_FL;
        if ((fa->flags ^ readonly) & (FS_COMPR_FL | FS_ENCRYPT_FL))
                return -EOPNOTSUPP;

This is stronger, because userspace can express:
set flag X while making sure the flag Y is not set

in this case xflags =3D X, xflags_rw_mask =3D X, xflags_ro_mask =3D Y

It does not have to mean that Y is a readonly attribute
the filesystem itself could set it in rw_mask, but when user
puts it in ro_mask its a verification_mask rather than an ignore_mask

In both interpretations (verify/ignore) the sequence:

    ret =3D get_fileattr(&fa)
    ret =3D set_fileattr(&fa)

should work fine most of the time, but if some rdonly flag
can flip between the two calls (e.g. FS_XFLAG_PREALLOC)
then the set call would fail and this is not the expectation
wrt the existing FS_XFLAG_RDONLY_MASK flags.

Thanks,
Amir.
