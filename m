Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795009203;
	b=D7CN7pM/8K888mxYOCTPJI74isPh7BFvjVXT2YXEb/SjYiFw//hw/0MSyqTRLqmU5rKe
	 9BJ/6zvy2ca065wTqtW8pr0BfF0ZhAdbv5QBNCBEOIe5Uh45oI/Vhq05K6K+bG8G0uYTw
	 2MJhonFvGuGYddcuIyTg/rEZVRK9oap4nZYkMbAkmnVYI2TDODq9VfcjXIQlPqYyVMmL7
	 goEJmIQEzArk8Q65o0RCEKIJLy94W3WRvbmisOCTVKTXNoyXdsXJ+1YRCybseb5TSLT38
	 BWJ8al7rzo+hwFCeiW7EfSuVuJVLCpxcGHVWra2q7KiNr7DfFmBKts/rUpR3fgXelkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J+YV0mmYZx9G//aLGJ1IlI5Lul1dS/KQcWNo4O8Rh58=;
	b=HoolAcqWgTMsnHoCMeBGeEX+/PUIfY/7SN/mUxG3ZawXy+4FX5YCwObTHLzX7Vt6L3QZ
	 fE4eW0gA/I4lqQ70RIMWuDRC0hoZl3wsRl4eN+HEwfS1T/tO0IJTMSf2bPi4ePVcp7y/D
	 LjCYUHPNItWjcgDsfq60bxX3Nz/rLD2Su6kIT9inuSgTJH4KvzJ9PbNGOSjd77GJt+gRl
	 4c0PIbCLzx8Yy+1qzDx57VAn2YFSV2mvKySSX/y58yaY8Yf2IrymU6v8X3dZplAUYVK+W
	 EiDBEhAfFqC1gpD00akUaFBYj7VpFjM8lw29AhCOw5v+C6oF2PrusNHHY3wcgOJDe8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r+3jU7O3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAFD606A31C
	for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 13:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EAFD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r+3jU7O3
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso11183465e9.3
        for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 05:40:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795009200; cv=none;
        d=google.com; s=arc-20260327;
        b=RD73cx9Y8ieoHwNUfgr5t4EmajCQ8lJ4w4iBLSNATPk3LAbe0qNW1fIcr45/pJijMB
         Esu7vsKdvaGCQFeIVSvL4cnxnMf3FwiBD71Oak5KVWqzk7Pg885ICeazwZhfhZJjUgCT
         7i3tc7SjXkMfLEczmN89ADSfK0wKO/1n+wF6Ywu6EEvKAckv8pQAXHFGHXywdEAXPEQ7
         RWCJc2XcQdZi/7NVT+kEAIkpCVRnN7wnYFqmindcwYjJqoLffth5mIGyjreV7o4pL1vg
         FRLJ2epnzb+MAa3/Qy6yWUd5PCoy7rOpbstlCMPUOFLcl1dZLtqHM6e3fF49oB9f4nF+
         txJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J+YV0mmYZx9G//aLGJ1IlI5Lul1dS/KQcWNo4O8Rh58=;
        fh=7OI9PstnSTMrL3ag3FJ6w/TgdHDpkkqctKu0k6o5Uck=;
        b=fKkqEmjEXB8vq4BtdilP7GDoZ8FSQwjLYC1TON4LQp/MkUt0gXMuH6zlqyOLx/g9fU
         v45+OOK0SCM0itRSgOob4T7tJf1YUGxvFnqja70Eor5eLSnmtOxUh9VLKQ5iODyCCcuV
         n62IYGxWj4vAUmoq62Ls5upzK14kZ08R1hOGMhShksqqfAg1Mg5/y63xPzpfMB+W4R1g
         DZb5Fe8uGOpUDBoCgSYDvDR5Xgxag4ShKxfkMpkOkP0w6S9SB8HeQSlh7gCvTTz9jhxs
         b96CW1CtafWC7yX/odb4INq8uj/ofEVW/pRr5wek5pU7f928SZHN+X7Eqe6U/ZfwCw63
         aIlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009200; x=1795614000; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J+YV0mmYZx9G//aLGJ1IlI5Lul1dS/KQcWNo4O8Rh58=;
        b=r+3jU7O3kEjhVmyuqMrPu+hH9qcLJKzGXIbwx4H/6pnb3zJawzjqCa3hGqRKBtNBEQ
         qmVhx2CbuUecJYq0DNk6/Vd51dEkt91fJhSNx2IXlVRDObUJ8LhtYPltIZT4yfyCCclU
         4PkNyX28PNUuoO4NxGpMU7rMFavY70s4yNtIm+I0n+wl5ROXwFT8BX2Y6u69BNrAk0/G
         LJL5VD4XcSs6CSjwhd8Mgd6W6g4RQonUKvpuZEJWSxwjxQbvI92bvCk7enKvVpHiO3rn
         ZN58K+xphKBbsQ4Q8LGO1SYE5xSssCjJLmyekqWxX6RqChVyUTCmNfT1lPiJUDz4VeGF
         qKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009200; x=1795614000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+YV0mmYZx9G//aLGJ1IlI5Lul1dS/KQcWNo4O8Rh58=;
        b=AQVjdhb76hkAXByE+i2ByF07axkIsXFaFMRZjiEjxqIyDTtLcSgOt7LfGrAExs9Znl
         AhSPmpgS9C1MJ7uaaj7fOHg4NcAX/1QhGZHmiODbFwuRWhlxyXBe7HJXRFmvGGmQrc32
         rlfUVTy5ILVAJw8+4gefbPsQ9FmIOnv0KSGu+M7h0Bp12ewdKc5UiLebti6VaUrcoY4V
         HEjjmiGbFy4e0YWkkP/JLkQdhIVuUrBUkYB6QbtOWOSbGhXk5p2Sug9+brESVDC7DYPe
         5Ud0VdQMoFXIyyp6rEnbLr4/dJiE4QPXorEju/M209UfSsYjNLKNoMOLQL3uEOklrJWq
         a4jg==
X-Forwarded-Encrypted: i=1; AL+hErGqu6GEm1Cq+8O6CCP/ZBUr6zd25Z0MVGoFdRrniXDjysomUP1HVboC1XhHZGhrHN/Yg0T8GA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+yYX7mjsbHiJILR6U/C3KwtsUCM5RQ/dY7j7JGRnMBTEAV9ZiC
	ZTYO6f/uh5oGzkGVDaOIs8EaI3+xJJHfIlcCCVNdoFiRU4N/biS4y0elh2AMgZNolmngzUBI233
	7rmGMQCXO9E/22+T/Cf2uefHWkFON2yE=
X-Gm-Gg: AYBFou1+8jIUaG5QtlrcJXCXy/3hOk7n1o4vhrA/2gRO0OLlLV81Mfw8fv0mlF0UZAJ
	08wU0tQsMFyoySwAn39ddOd+ry6w/1RQWlLgIixOZgi3pxZULgmLdMpMpODlKdl6eX7bO+kh3/X
	IDqN496wcURaGBucxVAQtgYRBAR4K325wD1MdAMto2/G6TNZw2kz+aHw1Ks5j1ekkIJmm9DHdoT
	9tP3KbVeD3UxUjjoU0LJ/7L/uKJNoUVVJWR4+46GRpj4T18GMT9rn1/QtA5v1PfN3NqyvLcTnlh
	moNh/G26x7ItS/tQ3wiPwdPYIUP5paW7bcP6ss1fJ0JUgGZumTRxoAfUlQ07Erogi6x+nN3pLDv
	A+eln36uH0oEBeGSG3W38AvL1Nbv8f2/nB4yU9G4kqyDJZ2Rm8EEGRLzmceBI+xqfIiFDHw==
X-Received: by 2002:a05:600c:4e02:b0:4bb:6994:abf0 with SMTP id
 5b1f17b1804b1-4bb7da4b889mr53005205e9.23.1795009200139; Wed, 18 Nov 2026
 05:40:00 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <fc53ec55d315a4b96ec1e6f250ad3763f2189755.camel@kernel.org>
 <DMXXOPD9UDNP.2YP9ROMHFLM9E@gmail.com> <CAOQ4uxjcvAKTaGXO0=BpbtgoEPmN7GKieVbX1ZpZR38H1Z3j9g@mail.gmail.com>
 <DMY8FEXBRS0L.2X0W5NIFG56C7@gmail.com>
In-Reply-To: <DMY8FEXBRS0L.2X0W5NIFG56C7@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 14:39:48 +0100
X-Gm-Features: Aa3M54rNL1UDtaF4EobdVjCZzK8MF2MoGwTblV1X_B8RR3donvGpdQjZ8_PUMVo
Message-ID: <CAOQ4uxhTBm5bQ9eYdeRCr0MJjugLdBU7X_Y26ADWhG6HSEgKMg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 00/10] add provenance time (ptime)
To: koraynilay <koray.fra@gmail.com>
Cc: Jeff Layton <jlayton@kernel.org>, David Sterba <dsterba@suse.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, 
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

On Wed, Nov 18, 2026 at 10:34=E2=80=AFAM koraynilay <koray.fra@gmail.com> w=
rote:
>
> On Wed Nov 18, 2026 at 9:14 AM CET, Amir Goldstein wrote:
> > On Wed, Nov 18, 2026 at 2:09=E2=80=AFAM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> Hello and thanks for replying,
> >>
> >> On Wed Nov 18, 2026 at 12:53 AM CET, Jeff Layton wrote:
> >> > On Sun, 2026-11-15 at 19:03 +0100, koraynilay wrote:
> >> >> This is an initial implementation of a new timestamp to indicate th=
e
> >> >> time when a file/directory was initially created.
> >> >>
> >> >> This patch series takes inspiration from the one by Sean Smith
> >> >> <defendthedisabled@gmail.com> [1], but using
> >> >> file_setattr()/file_getattr() as suggested by Darrick J. Wong
> >> >> <djwong@kernel.org> in [2].
> >> >>
> >> >> The semantics of this new timestamp should be at least these:
> >> >> - it should be the same as btime on a newly created file
> >> >> - it's user-settable, so it can be preserved for backups, filesyste=
m
> >> >>   conversions, archives and any similar operation
> >> >> - it should be preserved every time mtime gets preserved
> >> >>
> >> >> and the correspondence with the other timestamps is as follows:
> >> >>
> >> >> ctime <-> btime
> >> >> mtime <-> ptime
> >> >>
> >> >
> >> > I'm not sure how to interpret the correspondence above.
> >>
> >>   |-----\_-----------------|-----------|
> >>   |       \_      change/  |   birth/  |
> >>   |         \_ modification|  creation |
> >>   |           \------------|-----------|
> >>   | inode time |   ctime   |   btime   |
> >>   |------------|-----------|-----------|
> >>   | file time  |   mtime   |   ptime   |
> >>   |------------|-----------|-----------|
> >>
> >> ("file" as in "the concept of this file", I'd say "file content" but
> >> that would be incorrect for symlinks)
> >>
> >> so ctime is "inode change time", btime is "inode birth/creation time",
> >> while mtime is "file content change/modification time" and ptime would
> >> be "file content creation time" (same as Window's or MacOS's creation
> >> time).
> >>
> >> Does this make more sense?
> >>
> >> >
> >> >> Examples:
> >> >> 1) a .zsh_history file created in 2019, then after a few years the =
user
> >> >>    decides to switch to another filesystem, copying the .zsh_histor=
y to
> >> >>    the new home, in that case btime would have the timestamp of the=
 copy
> >> >>    and ptime would have the 2019 timestamp (just like mtime would h=
ave
> >> >>    been preserved)
> >> >> 2) a symlink created in 2020 from the home directory to a /path goi=
ng
> >> >>    through the same process as the .zsh_history, in this case it wo=
uld
> >> >>    also make sense to sync the ptime to the 2020 timestamp instead =
of
> >> >>    keeping only the btime (so the inode creation time).
> >> >>
> >> >> The proof-of-concept code (for testing) for stat(1) and cp(1) is
> >> >> available at https://github.com/koraynilay/coreutils (master branch=
)
> >> >> (Note: these coreutils code changes are a prototype and won't be
> >> >> submitted upstream as-is, but they work as expected in simple stat =
and
> >> >> cp -a/--preserve=3Dptime tests)
> >> >>
> >> >> Lastly, the name "provenance" and "ptime" are not final, I personal=
ly
> >> >> don't have a strong opinion on any name, but while testing with sta=
t(1)
> >> >> I noticed that "Provenance" is definitely too long for the normal
> >> >> output, so another option which would fit well is "Origin time",
> >> >> abbreviated as "ntime" (OrigiN time) and not as "otime", as that wo=
uld
> >> >> conflict with btrfs' internal naming and create confusion.
> >> >>
> >> >> v2 changes:
> >> >> - fix permission bypass leading to ptime update on immutable and
> >> >>   append-only files (found by sashiko[3])
> >> >> - normalize ptime timestamp as done in fs/attr.c:notify_change() (f=
ound
> >> >>   by sashiko[3])
> >> >> - fix wording in vfs patch to be like the cover-letter
> >> >>
> >> >> v3 changes:
> >> >> - vfs: reject setting ptime with -EOPNOTSUPP on filesystems that do=
 not
> >> >>   support it instead of silently ignoring it (found by sashiko[4])
> >> >> - vfs: fix not being able to clear immutable and append-only on fil=
es
> >> >>   with ptime, and allow updating immutable/append-only atomically a=
long
> >> >>   with ptime (found by sashiko[4])
> >> >> - btrfs: validate on-disk ptime nanoseconds and reset to otime if
> >> >>   invalid (found by sashiko[4])
> >> >> - btrfs: avoid re-assigning ptime on unrelated chattr calls (found =
by
> >> >>   sashiko[4])
> >> >> - add ntfs3 and exfat support as suggested by Amir Goldstein[5], bu=
t no
> >> >>   vfat, smb, or nfs4 yet as they are a bit more complex
> >> >> - move the introduction of fileattr_has_fsx_mask() from the btrfs p=
atch
> >> >>   to a standalone patch in the series
> >> >> - btrfs: add fileattr_[gs]et to symlink and special file operations
> >> >>
> >> >> v4 changes:
> >> >> - vfs: implement fsx_xflags_mask as suggested by Amir Goldstein[6];
> >> >> - add SMB (ksmbd/cifs) and nfs (nfsd/nfs) support as requested in
> >> >>   previous threads;
> >> >>
> >> >> Note:
> >> >> to apply this patch 2 previous patches[7][8] from the ksmbd/cifs
> >> >> subsystem are needed.
> >> >>
> >> >> New Question:
> >> >> should I rename fileattr_has_fsx_mask() to something like
> >> >> fileattr_has_unsupported_fsx() and keep its code as-is, or should I=
 add
> >> >> the fsx_xflags_mask & ~allowed check in it and keep the name as-is?=
 (or
> >> >> both?)
> >> >>
> >> >> Thanks.
> >> >>
> >> >> [1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisable=
d@gmail.com
> >> >> [2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
> >> >> [3]: https://sashiko.dev/#/patchset/20261027220532.736352-1-koray.f=
ra%40gmail.com
> >> >> [4]: https://sashiko.dev/#/patchset/20261028134728.294127-1-koray.f=
ra%40gmail.com
> >> >> [5]: https://lore.kernel.org/CAOQ4uxiuy0VwZj+3M-zRqQ49WTpHZpiaQ+6MZ=
8z8WdLjyQM_zA@mail.gmail.com/
> >> >> [6]: https://lore.kernel.org/CAOQ4uxjtuTDT63vJdYaq+RHQEQFLTksp66e46=
OMN99WhJz3SbA@mail.gmail.com/
> >> >> [7]: https://lore.kernel.org/linux-cifs/20261112111637.184045-2-kor=
ay.fra@gmail.com/
> >> >> [8]: https://lore.kernel.org/linux-cifs/20261115155308.415734-1-kor=
ay.fra@gmail.com/
> >> >>
> >> >>
> >> >> koraynilay (10):
> >> >>   vfs: add provenance time (ptime)
> >> >>   vfs: add fileattr_has_fsx_mask()
> >> >>   ntfs3: make crtime user-settable using ptime
> >> >>   exfat: make crtime user-settable using ptime
> >> >>   btrfs: add provenance time (ptime)
> >> >>   vfs: add __vfs_fileattr_set_locked() for inode_lock()'d callers
> >> >>   nfsd: add provenance time (ptime) via FATTR4_TIME_CREATE
> >> >>   nfs: add provenance time (ptime) via FATTR4_TIME_CREATE
> >> >>   ksmbd: add provenance time (ptime) and map it to CreationTime
> >> >>   cifs: add provenance time (ptime) and map it to SMB's CreationTim=
e
> >> >>
> >> >>  fs/btrfs/btrfs_inode.h          |   4 +
> >> >>  fs/btrfs/delayed-inode.c        |   6 ++
> >> >>  fs/btrfs/inode.c                |  29 +++++-
> >> >>  fs/btrfs/ioctl.c                |  24 ++++-
> >> >>  fs/btrfs/print-tree.c           |   1 +
> >> >>  fs/btrfs/tree-log.c             |   3 +
> >> >>  fs/exfat/exfat_fs.h             |   2 +
> >> >>  fs/exfat/file.c                 |  42 ++++++++-
> >> >>  fs/exfat/namei.c                |   1 +
> >> >>  fs/file_attr.c                  | 156 ++++++++++++++++++++++++++--=
----
> >> >>  fs/nfs/inode.c                  |  27 +++++-
> >> >>  fs/nfs/internal.h               |   2 +
> >> >>  fs/nfs/nfs4proc.c               |  56 +++++++++++-
> >> >>  fs/nfs/nfs4xdr.c                |  19 ++--
> >> >>  fs/nfs/symlink.c                |   1 +
> >> >>  fs/nfsd/nfs4proc.c              |   9 ++
> >> >>  fs/nfsd/nfs4xdr.c               |  40 +++++---
> >> >>  fs/nfsd/vfs.c                   |  17 ++++
> >> >>  fs/nfsd/vfs.h                   |   4 +-
> >> >>  fs/nfsd/xdr4.h                  |   3 +
> >> >>  fs/ntfs3/file.c                 |  20 +++-
> >> >>  fs/ntfs3/frecord.c              |   8 +-
> >> >>  fs/smb/client/cifsfs.c          |   8 ++
> >> >>  fs/smb/client/inode.c           |   7 +-
> >> >>  fs/smb/client/ioctl.c           | 109 ++++++++++++++++------
> >> >>  fs/smb/server/smb2pdu.c         |  37 +++++---
> >> >>  fs/smb/server/vfs.c             |  43 ++++++++-
> >> >>  fs/smb/server/vfs.h             |   1 +
> >> >>  fs/stat.c                       |   2 +
> >> >>  include/linux/fileattr.h        |  29 +++++-
> >> >>  include/linux/nfs_xdr.h         |   3 +
> >> >>  include/linux/stat.h            |   1 +
> >> >>  include/uapi/linux/btrfs_tree.h |   3 +-
> >> >>  include/uapi/linux/fs.h         |   9 +-
> >> >>  include/uapi/linux/stat.h       |   7 +-
> >> >>  35 files changed, 614 insertions(+), 119 deletions(-)
> >> >>
> >> >>
> >> >> base-commit: 3bc1fb9c3b20cd478c83496ab16addecb401770d
> >> >> prerequisite-patch-id: 049ae0eba275b5be35a238833107e0b251a55aa2
> >> >> prerequisite-patch-id: 614f0bc9411391403d4e9702bafeb31b0ec04ec1
> >> >> prerequisite-patch-id: ddf636b9d33d82ea206ce265d817371350bf8858
> >> >
> >> > I think this is going to be very hard to do properly, because the
> >> > kernel can't really manage this on its own. Something in userland is
> >> > going to have to set this value if you want to update it to somethin=
g
> >> > other than the original inode instantiation time (aka btime).
> >> >
> >> > It really sounds like what you want is the ability to make the btime
> >> > settable. Personally I think the decision to forbid that was wrong-
> >> > headed and that it should have been settable from userland from the
> >> > beginning. Maybe we should just revisit that decision.
> >>
> >
> > Frankly, I don't think this decision was made at all.
> >
> > There are only 2 types of filesystems in Linux today:
> > 1. btime is constant (xfs, etx4, btrfs,...)
> > 2. crtime is settable in principle but not via a standardized Linux
> > API (ntfs, cifs, ...)
> >
> > AFAIK, btrfs in this series is the only filesystem which is going to
> > have two deviated copies of btime and ptime.
> > For all the rest, the deviation is artificial in statx.
>
> Well, my objective with this series would be having ptime just as
> supported as a/c/m/btime, especially from userspace in the 90% of
> setups,
>

This is not a realistic objective for the mid term IMO.
Even if you did go through all the cruciating steps on adding on-disk
ptime support for ext4/xfs/... old formatted filesystems may or may
not be allowed to set the new inode field (per maintainer's decision)
and the stable kernels will take a long time to get those changes,
so userspace tools will not be able to assume support for ptime exists
for a long while.

Maybe 90% support is a realistic objective, depending on the
time windows you set for this objective to manifest...

IMO the more realistic goal is to allow rsync/etc between the
fs that already support ptime, for example between two smb mounts
or within the same smb mount.

> > So the questions to ask are:
> > 1. Do btrfs developers prefer to store a new settable ptime or
> >     making otime/btime settable with this new API?
> > 2. Will any other fs in the future want to store settable ptime along
> >     side the legacy immutable btime?
> >
> > My take on these question is:
> > - Personally I would love to see ptime support in xfs in the future and=
 would
> >   willing to contribute to this work, because I have hard evidence from=
 the
> >   performance benefits that it brings to smb server workloads
> > - Judging by past experience with i_version bump interpretation on xfs,
> >   I find it hard to believe that xfs developer would agree to making th=
e
> >   legacy btime settable
>
> so I guess for v5 or v6 I'll also draft a patch for at least ext4 and
> xfs.

I strongly advise you against this.

That's a great way to block your own patch set indefinitely.

Implementing ptime for ext4/xfs requires working with each of the
maintainers not only on kernel but also on the userspace progs
and has backward compat implications, which makes testing
ever so much harder.

You start with defining an API and implement it for the
filesystems that already have storage for ptime.

You could include a new fs that didn't have storage for
ptime (btrfs) if you are on the same page with the btrfs maintainers
and have the userspace tools patches lined up for review as well.

Otherwise, you will just be blocking your own patch set
creating dependencies with other user space tools.

Thanks,
Amir.
