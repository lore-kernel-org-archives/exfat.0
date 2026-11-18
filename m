Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795023780;
	b=aGUou6/EU5lRHLEBp4EMYp9Az6Ga2WBv/BGm345IyQqJCgVYRl9oE4fnlbLwHgxvn6My
	 r3V42yYFhjhzR57aclLdQoQfvvNe4rAEI/ByAk2R5oAgvWIM09J9UDo+mOv2JO6XbpVBy
	 UONbytOlUtIi5zMrvB6M2nRZ5RD4djzbO/DprNtUaMP3BihdD7Id9ENrCXTUHygdPXoBq
	 w0ocHFVC8KX5kKWcFiy1opqEk3DeZYcVDErMdGBEG/oh95LZCV8Nhod0A+tLvGgWeV+09
	 N2yCmaKs3KuVnSKtk+9aRT/ue4NgR64nVV3Adpig+/Nlt5BC7P7C3LlWrAgfMK1Vf/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ciuN1q7GJk6psMO8HqaJ4EweNO3dgrafMeDSntT6n7I=;
	b=bIRUMmP2QS0U0PQrjXBGsHKHHs1n+fmxWtt2HcWR8968DQbZTmd74kINiX/w+k8LM0hU
	 nqLHtAsmgMQaRCEszokEE2228Hbp4BizRK2QYFcRu6h4NY1f9vDjA+cht+7GwIZ8Xuc0+
	 zaXS7xBgWAss1e+lMzpofQJml4RCcIaoqkHnKRJgoLG+8euC1d1rYPtj6n6KyGd+/C1Fl
	 GfqsLFXXAR1QNARPK2oRKpcG8M5I/FAAhkpa5wrEiopT296VkBX9Lq+W4GrLrNTuS5EE4
	 cUpKA2WB/S5+XL7NjON1x0to4bg3ah3ir9QKYCsyH254SZPmdbJq+QHy4o7r8M0B4GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BDubQ4aD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89846606A334
	for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 17:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89846606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BDubQ4aD
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso145491a12.0
        for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 09:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795023779; cv=none;
        d=google.com; s=arc-20260327;
        b=LxcpvMSAMh5SJUf1AGZpShN6kf/IMP4bjk15IWetkXr3g0N0ZSmqqIpbhBkA703d4W
         +Py0Ukz7wUQHBfwvzQ7JFWSBTrIwJPeNSfxAzHEWCMKMUCNeUi5Q2XUeW3iJyCGNsnJ4
         N7X07XYf7yj0uEqIJVxQGnBBJ8JBCElF58Kb2HnoLqkuBhz2qMf2w5YacP2USieCeRBd
         hmvnFSO5a5E2SOnUK/KNjLEEeoahvlsI6BCZMPwKi5Emlg3LB6npPppLJUGFSgqvQ6tB
         BbBgGrZ+8oGwZ6P5mbUJIHl5MxKdyITuTmjZjHachtUV4vk26eJvNrPFg+cH/XjG3Ho+
         h07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ciuN1q7GJk6psMO8HqaJ4EweNO3dgrafMeDSntT6n7I=;
        fh=ANlsJf1Keu4bCkjc92cSvfEW8PXfPdMl4sjaphQH7S4=;
        b=IA7SvyLGX5avmk9zsdInGSit/IchCjiOV9G6W3w9m6LdgoydI4Qhocs5BCZg9HK/bp
         bTk0G0T4SqPgVksVGxt4UZxw/MMkZy6O7dbomWy3U58BX62GS0lB1vgjSTx0aAZ3p5YN
         o/MSPf/yUkOuSr0AdhUf6QcU8UAGJ3jTOXZTvVvnHeW4gUdFoWSNLvZR7LDkJJ/40vui
         Qtly7bc7yywuPPAwKgM/iSqQlYvXF/kExNuCWfjRw3lJpMcoHelWI8tOUt2Q2QSMrxep
         WC5aKo2KGA0QWQkL6XORRBZVGdwpoJ+ea+bcO3hXsnJ7T2MarhvZpuN/2EMlIYlcz/dA
         E0cQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795023779; x=1795628579; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ciuN1q7GJk6psMO8HqaJ4EweNO3dgrafMeDSntT6n7I=;
        b=BDubQ4aDENlY2liwmBmHbgdlKEqHGx+hcIo7rFGKaMya6WmrwGAoynEMZMZ3SK9gud
         iHQTy9FBw/LSLscOGbDnrUiOBmqKzmzkJFJhU/U0fOwRVu/TAQBCDQctWsIoRNYQM0nr
         0ovrd6s9HRqhDHmKH0smj98r15fQGSZ1cvnsL5VWaY+nJoFaEesFIvuuwGqyClXUTv34
         9+2O9busCN/JFF84zvdN1d0ezT1Cm1PTA9FyoyVEWAFIVUzrIHLsxMd3gi1mKZNsrekt
         lkyvho5D2B5WmctiKUf0GQZVfhXJEkDlSI5a3ywPPJfF+xfSf/RgF6JDGJKwphzU8SYC
         Xl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023779; x=1795628579;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciuN1q7GJk6psMO8HqaJ4EweNO3dgrafMeDSntT6n7I=;
        b=EIt1yBzdYg+SU2I/wUmnyClB62weARSOpnXCwBk5OfMi2dGhccCYRXz5gFzR9khojR
         E5jqWlB+5lxZo3KnasLw/MavvIDiCJWzYmmw6TXSs1OjypWthGLJK5hhWASxsKHnjIzS
         7KpIK3NoSbpyt3E9Mz0jZLW12z2F4tysZl26LBiZ+/Z+vOo0qo6XHF67CEgtZa8hD7U8
         qgy3lJRu0Gf4OqjSf5W+F18XuSVuybCIzZA4dXnRnq61E+m9MlpBdtBLufSn8GSqc0cd
         KW/LVh/Adet+qXTAda10RyDHOhrrcTU+SJly+HurlUcEEbP4JBoSl/pKIcCzgbN4VaH/
         EQIw==
X-Forwarded-Encrypted: i=1; AL+hErGcsfgK4Xff30Zyq0v0usOJksAlJe3TX2SSi4SYiqXG0v1k+hM/kHGwivTUJ6SE4WywcKcTRg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8q55ycv8ksCzCBQ2+52AXiHq1j6MSCjPP/LNYWM8eKgxD/0Gr2
	bZcm5yA0OSjae9X9xmEFUsy5IWd8Rrz7mpU+udxBKkxOcs+yaG1B0ttaoSb+awtEgkGoUvvsoDO
	x8WJ/pOWlowkTyVMzJ24n6Qxi3Ic1oDo=
X-Gm-Gg: AYBFou0SjjxBURtWW5PnDbSehv3ELhaUcu68U8wDWBxC1pxh7fWI27opXbFwWo/7gpe
	/ZZjORBWch+Cuc4RFQ+9Xvk7pVIla4IMi4rBcKLZSDacy9Gvb2s2hq/I+0mU3iAWZ4SnQJdNOjc
	5e9FVuvqonn21+WHAb+bseb6DxnqqTwgaeVU47sXgfExcaK/49b0E1oPBbPrlI2DJXpmtbDc5kR
	H2ZB1B77dQXMgGbjHUUzHVWwL9rrymmZqZeC9lzbU3AXNq/vQI+Ji7pyZGYTw8GMhrNAHDhqpnZ
	JJzK5O/8o+J+57SjKSzXGGaWSEWEj4m3TV4hX7nI95twoWk/ox/yfOCLsfUieUf0hqtz5QeZVOr
	aB95crT3Nd7yg0BuugfJAwTXNBuLZ9Y6+RfHh4tZCSgqr+Shi38dPtocHKUE7fPKomaH+/g==
X-Received: by 2002:aa7:c259:0:b0:6b3:e4e8:74ba with SMTP id
 4fb4d7f45d1cf-6b9b29685d7mr115387a12.13.1795023778657; Wed, 18 Nov 2026
 09:42:58 -0800 (PST)
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
 <20261118173708.ax4t7zzklr5jvf2t@pali>
In-Reply-To: <20261118173708.ax4t7zzklr5jvf2t@pali>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 18:42:47 +0100
X-Gm-Features: AclHuK8TtEMT4ky5dtrBYdddz3l6RdahxalryFAKqWHd6v7Nf1ie2l606ulnXFE
Message-ID: <CAOQ4uxi+GvBRD8T4kFSqqZ-bxYfN3L8A61jtS2SeoGM6rN-3=A@mail.gmail.com>
Subject: Re: [RFC PATCH v4 00/10] add provenance time (ptime)
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: koraynilay <koray.fra@gmail.com>, David Sterba <dsterba@suse.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, 
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

On Wed, Nov 18, 2026 at 6:37=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
>
> On Wednesday 18 November 2026 18:28:04 Amir Goldstein wrote:
> > On Wed, Nov 18, 2026 at 5:50=E2=80=AFPM koraynilay <koray.fra@gmail.com=
> wrote:
> > >
> > > On Wed Nov 18, 2026 at 4:16 PM CET, Pali Roh=C3=A1r wrote:
> > > > On Wednesday 18 November 2026 15:58:02 koraynilay wrote:
> > > >> On Wed Nov 18, 2026 at 3:26 PM CET, Pali Roh=C3=A1r wrote:
> > > >> > Hello,
> > > >> >
> > > >> > I have just one issue with the userspace API. It does not allow =
me to
> > > >> > figure out what is the source of statx btime field. If it is fs =
ptime or
> > > >> > fs btime because this RFC implementation is mixing both fs ptime=
 and
> > > >> > fs btime into the statx btime field.
> > > >> >
> > > >> > I have feeling that this is quite a mess in API and I would like=
 to see
> > > >> > a clear distinguish between btime and ptime in the API, like the=
re is a
> > > >> > difference in the fs storage.
> > > >> >
> > > >> > If the btime is used for forensic analysis then somehow I would =
expect
> > > >> > that the statx would not report / not fill changeable ptime valu=
e into
> > > >> > the statx btime.
> > > >>
> > > >> Hi, for native linux filesystems it will report ptime as PTIME and=
 btime
> > > >> as BTIME (also semnatically).
> > > >
> > > > That is fine.
> > > >
> > > >> for the windows-like ones that only have
> > > >> ptime (semantically) I think it's reasonable to not expect btime t=
o be
> > > >> immutable, since they are meant to be used with other OSs who lack=
 btime
> > > >> semantics.
> > > >
> > > > The problem is here that the RFC statx API does not provide this
> > > > information that the fs lacks btime semantics and instead it fills
> > > > non-immutable ptime value there.
> > > >
> > > > I'm pointing only about this inconsistency.
> > > >
> > > >> > It would be really helpful if the statx API on inode can differ =
between:
> > > >> >
> > > >> > 1. btime is present and its value is ..., ptime is not supported
> > > >> > 2. btime is not supported, ptime is set to value ...
> > > >> > 3. btime is present and its value is ..., ptime is set to value =
...
> > > >> > 4. both btime and ptime are not supported
> > > >> >
> > > >> > This should cover all cases of different filesystems and also al=
lows
> > > >> > userspace to do proper backup of both ptime and btime fields (if=
 it want
> > > >> > to do forensic analysis or anything else).
> > > >>
> > > >> These should already all be covered by STATX_BTIME/PTIME and their
> > > >> fields in struct statx, the only problems are windows-like filesys=
tems,
> > > >> which IMO shuold be handled as mentioned above.
> > > >
> > > > Exactly, I pointed out about these problems. I somehow expect that =
the
> > > > new API would be generic and uniform across filesystem. IMHO it doe=
s not
> > > > matter if the filesystem is windows-like or not (there are also Fre=
eBSD
> > > > fs and also others which allows to modify that time). So better
> > > > description is fs belongs to category 2. from my above description.
> > >
> > > Ah yes, I used windows-like to mean "only have ptime semantics", so s=
ame
> > > as your category 2.
> > >
> > > >> Of course, as in the other discussion, I'm open to changing ptime
> > > >> NTFS/exFAT/... support to remove btime altogether and only use pti=
me for
> > > >> their own crtime if that's what wanted (I'm fairly impartial on th=
is
> > > >> specific issue).
> > > >
> > > > I'm giving some ideas how to possible handle this situation:
> > > >
> > > > 1. do not fill btime it at all when it is not available (remove bti=
me
> > > >    altogether - the case like you wrote above)
> > >
> > > This would be the most semantically correct option, but would break a=
t
> > > least 1 script/program/use case.
> > >
> > > > 2. when userspace ask both ptime and btime, then do not fill btime
> > > >    (remove btime altogether - but only for that new case)
> > >
> > > This probably is the best compromise.
> > >
> > > > 3. fill btime with ptime value, but add a new output flag indicatin=
g that
> > > >    the btime is not present at all and instead kernel filled ptime =
value
> > > >    into the statx btime field
> > >
> > > I don't really like this, it adds complexity and uses memory/1 flag b=
ig
> > > for a single specific field, IMO it's not worth it.
> > >
> > > > 4. let statx btime as currently is, and add two new statx fields:
> > > >    immutable_btime and ptime. immutable_btime would be filled only =
if the
> > > >    fs supports real btime (so not for ntfs/extfat crtime) and ptime=
 would
> > > >    be what is currently in RFC
> > >
> > > I think this is also too complex.
> > >
> > > > Ideas 2. 3. and 4. should be fully backward compatible as it would
> > > > affect statx output only when called with new flags.
> > >
> > > Then 2. is probably the best way to go forward (maybe I'll include it=
 in
> > > some way in v5), but I think we should let each filesystem maintainer
> > > decide if they think their users want to have statx report their own
> > > crtime as btime, ptime or both (native linux ones would of course
> > > report btime as btime and ptime as ptime).
> > >
> >
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
> > Thanks,
> > Amir.
>
> From the beginning I had a feeling that this is not an option at all and
> that is why all that ptime-way was chosen.
>
> So thanks for brining this up. I like this your idea. It address the
> original problem with backup/restore of "create time".
>
> But I would like to point out about another thing in this your idea. It
> would be nice to have an API to retrieve that "forensics on-diks btime"
> in case there would be filesystems which choose option 3.

Anticipated this question ;)

As I said there is already a precedent with xfs settable uuid
(I think other fs have it as well?). All the metadata is available
to admin via xfs specific ioctls, but not via the generic vfs APIs
not even to vfs via vfs APIs.

I don't know if this is good enough, that's why I urged to get an
ACK on the API design from major fs maintainers.

Thanks,
Amir.
