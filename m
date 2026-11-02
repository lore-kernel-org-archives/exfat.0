Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793631257;
	b=I346LBb1rkL/uXH2B8BcuB7u26vYZQWE4a97XlH27MWsAGgIg50fXv+r98F9VJPEgiI+
	 fVgzAaYUKvrYDkYWs7113hhXQ9IAzWeWDHhpF5E/mBsgBIAluZFrxZYPBm8D75KYiGmBa
	 bw2UqgYjjBvCRto+8NSGdOM2VtzoYSfABV2P/9ZaNvx4r7EfCzoDo6YGweVkmQktMf0eR
	 BYxq7a2rOmXhzakd9TSOLZvjfNSu/BapfghElsDQGG7pDOaxZHP+7wcYr5pjXglK/Fh5p
	 Q1/xOCc9QTOw20z/KbNz95L6XvfyIyJqpul9luONRVw/EkSAQemdoOhgD8oQOb/JUbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9S45ohuGWD9KQ2+FLxafTobKS8uDh2Gv9DIfHDLQSno=;
	b=Fh6zzTfSekBTrL8pr/VnHmpp4Q6MzEeUd9QGD9hW4jJ0TKgR+mDZO8wt10SxO37jOWl4
	 HWAT4VXboGrLtMgyqDAw19TMWR0vG50XYmiEaYmd3IATCBNgW6bes55tRa3eA8XAXyDCc
	 6kHk5aE7ppRAuY4Q6lwkd7TMLTaryfhpGYMIDvT78hqTT3GVGdyWgJqgUN//oUbSI42gD
	 hllGMom6N+gZgX4jliFmAdK4vUTZrrXN0y+JLRJU2zAqZkWIfMOKEXAo4evHTdBtZznd+
	 DcYLHdRx5TzJBqZktS0j4bvJW/rfRlUr00y2wX17YFN0MqJ2yemeNf+pWdGkl3IpHyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEPyL5xp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9477A607A89D
	for <exfat@lists.linux.dev>; Mon,  2 Nov 2026 14:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9477A607A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEPyL5xp
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4550d8ab15so366156966b.2
        for <exfat@lists.linux.dev>; Mon, 02 Nov 2026 06:54:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793631255; cv=none;
        d=google.com; s=arc-20260327;
        b=CsoDlKtlqcKzCNi2PqExOe/B3tMzsK2dDWybOv0JJlUK93WrrSXn17IK61PWUu0Yg3
         fsg6uwh+AauD1oaLPXZO8FootfpNr6c0Cv+aS91CjNGDNnX8OdFaaROkltOwIx8aLq63
         VJQ2HokdfQt4twWaMP0sE6OStoUivsLjNpn99s99+X0ugAsufeWd0amoq8fVmHv1U4BN
         oLqBreGPy2ovoiHFmPJsfGXbpra1NsO/pgkgix0vW5CuiPXnmTsoqP39gg9jRg/hmkOs
         RexJq20DnxFx8lGtDqCt5ef0yk7Fo/MzgnwWYRMdQcv8RvtnRljiVKY4A6smLwXI/gbS
         fx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9S45ohuGWD9KQ2+FLxafTobKS8uDh2Gv9DIfHDLQSno=;
        fh=Ql7ocmhYa94kyBqM4QJpSfH78SLK5B4y+mhsgW+TJ+M=;
        b=KEV1Q7d+by0TriAr5rlIZwvZoh8B1Bgl1qdS5YBz1/gpOiVSytaTBBJ8HwdDaL4k4B
         DOeYN6UrxZz928VroqZon1+J033yU9CA3PBVtyrxb+EfTCjxw31B65DEYJC9Ux0hRXKR
         r4kyP6Vb9i0egfZ15FGSXYxEdjB8UR1PMs3/+oa5MzRcHmY7pawfn8tbVO22l9Ey0DV2
         Stnq4EzPX2Gvfq3jEHzxXobeE0NS8jZg6e1en3/iQGjn0JwNW3/S9q9Z4lz6Z153Ypcl
         c0I1NHNRtHaBkGLrbEoUx6TH/wNkRMueZjh5zzVzcytRihZLZ7TDVF4JP0GBoPiQKrs3
         Eu+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631255; x=1794236055; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9S45ohuGWD9KQ2+FLxafTobKS8uDh2Gv9DIfHDLQSno=;
        b=sEPyL5xpkpDb1+VnPuA4jOO6zJhcaOso7I8Xiry8kSqdzS5h3a/WXwhB7BPxu9y18f
         ETEqer5eARSDrgPLxLRrOyuDBsilduvx3Pv3lLSUpjKqfEdvWr2IBWfz1qkcFGKlzEtD
         uWegKJl2VOZ0umrFC5S/0PXSHyo+Ussg//AX9Q309QOQx2VYpGRVwK4luKs1bmsEVj3+
         Hq1NyJ8AmNbR8OMCmOFD3JnaTyiAmfujg/AhC6azutXS/GiPBs/rfceRp8AhrAQhW8qE
         ssCoF+GCoaSgm3iR9BJScMpULxe9D5OgjiM7Bckkp8hd73pBu11iZmsWKI4O1JtmMCez
         Qxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631255; x=1794236055;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9S45ohuGWD9KQ2+FLxafTobKS8uDh2Gv9DIfHDLQSno=;
        b=VIwqDbtr/o2D0UnldRMyTZ7MCoiOJwoBIeKu//a6BK5XBCk+hm0MUNQwHOFahQDgTn
         jw59m7vfAQqJmUUFcto+HOFepTT8eQFUX6wjmxTS6QxOKH1B08bxzte75S6NLpkJ++mn
         IFvHLiqHaRtSoVimqdWu2n4B9JAtLxOMpVUnAlDvGN0c76GEmWQYntVmR+sA4++mYXll
         9K6VN8DfwUV8FF4kaREgRtKipzriBG9BfTq8akBf/kgO271D6tXMzRwx+siarcyDfpB4
         O3fICj2qonAMODfE/BJvfpUOZxrDJ2Jsm8QrbE7gCoDpYkpOUT31mGSUdqQUEfuXPeno
         7AUA==
X-Forwarded-Encrypted: i=1; AKwUvBywKWSKw+2ewFS9sXgXwjd7L8iGbRsEgjowm5aTHuJekWsJUz6gq+9jkcUcGxFsm+Cm1NVyvA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9bFFaWmDHVzZbAtruLiC8miI8ZtV5mGFDXK5eQitStz0QIJhDR
	BkSeMupRooHwBzox2dfEkvHRi0kVQSi2dM2cJc43eAbMAlcmnY4HZ4oGr3f4sSKFrQWmRlZ98CE
	Yrm1DduhNd1Uy81TRtuIdEBucrQeSpxk=
X-Gm-Gg: AYBFou0fFHK+onZ7qLj6zRyJN2waDOx2YIbY7Zv2i06C6shDeEt3rZoJIyhJk6zZmId
	XYMN5kyLDqY5p6us410ixnXoP7+Eh9uiUIv7UFOquO6KR96Pzmy1KCNFKpPF/LqBjYHo9TWv4/g
	zG7+r8GWQ3pPlBulvfQt/i1BGpWfUxtN9arMqmoUoL3e14RSFr5yqZ5s4EkwPGuvq/7joE2JOwK
	z+FrrY0cr2bRVhr8DpgVN3nFxaaXwp2Yp8zohzrg4nTn+BzIguKV7s/9Obj+GtLkEh1DLNqPUBb
	od1jqTixHxdPlHE+c8Ii7gBSt1D9ZeUjZgYujJaD4pftyYWshBgKfLFyZ5Vyl+Xb948fDbOa9Iw
	wz/wfoIP/tCMSkR6ZM/r3ML8wL20n4VX0fB9SGEkIQ4j4u0BeNa8juv2+gpIXajrSy8RJhATHpS
	7A40uv0M27PNyrVgg=
X-Received: by 2002:a17:906:eec8:b0:c2e:317e:d711 with SMTP id
 a640c23a62f3a-c4ca7aac250mr889529566b.27.1793631254792; Mon, 02 Nov 2026
 06:54:14 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com>
In-Reply-To: <20261101015551.786044-1-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 2 Nov 2026 15:54:03 +0100
X-Gm-Features: AclHuK8MPfC_dz5RbDokIFz7RFGIRe7sv4kFXfjOWYu6Sb9FQLskiRuGBNP5Y1c
Message-ID: <CAOQ4uxjkG=1j1z==Mv4wzkF042rXstodokKnBfMFBf2e-Eztmw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/5] add provenance time (ptime)
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

On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com> wro=
te:
>
> This is an initial implementation of a new timestamp to indicate the
> time when a file/directory was initially created.
>
> This patch series takes inspiration from the one by Sean Smith
> <defendthedisabled@gmail.com> [1], but using
> file_setattr()/file_getattr() as suggested by Darrick J. Wong
> <djwong@kernel.org> in [2].
>
> The semantics of this new timestamp should be at least these:
> - it should be the same as btime on a newly created file
> - it's user-settable, so it can be preserved for backups, filesystem
>   conversions, archives and any similar operation
> - it should be preserved every time mtime gets preserved
>
> and the correspondence with the other timestamps is as follows:
>
> ctime <-> btime
> mtime <-> ptime
>
> Examples:
> 1) a .zsh_history file created in 2019, then after a few years the user
>    decides to switch to another filesystem, copying the .zsh_history to
>    the new home, in that case btime would have the timestamp of the copy
>    and ptime would have the 2019 timestamp (just like mtime would have
>    been preserved)
> 2) a symlink created in 2020 from the home directory to a /path going
>    through the same process as the .zsh_history, in this case it would
>    also make sense to sync the ptime to the 2020 timestamp instead of
>    keeping only the btime (so the inode creation time).
>
> The proof-of-concept code (for testing) for stat(1) and cp(1) is
> available at https://github.com/koraynilay/coreutils (master branch)
> (Note: these coreutils code changes are a prototype and won't be
> submitted upstream as-is, but they work as expected in simple stat and
> cp -a/--preserve=3Dptime tests)
>
> Lastly, the name "provenance" and "ptime" are not final, I personally
> don't have a strong opinion on any name, but while testing with stat(1)
> I noticed that "Provenance" is definitely too long for the normal
> output, so another option which would fit well is "Origin time",
> abbreviated as "ntime" (OrigiN time) and not as "otime", as that would
> conflict with btrfs' internal naming and create confusion.

FWIW, I agree that given the existing uses of btime and crtime in the
kernel and various XXXprogs, using 'ptime' for kernel code is probably
the lesser evil.

The question of how to display this in stat and tool is a different questio=
n
that can be left to the userspace developers.

The UAPI headers uses Birth time language and stat displays:

Access: 2026-11-02 15:22:27.067329367 +0100
Modify: 2026-11-02 15:22:27.067329367 +0100
Change: 2026-11-02 15:22:27.067329367 +0100
 Birth: 2026-11-02 15:22:27.067329367 +0100

If the UAPI headers will use consistent language:

+       /* provenance (settable creation) time */

+       __s64 fa_ptime_sec;     /* provenance (settable creation) time
(seconds) */

I  think that the man pages could be unambiguous:

stat(1)
       %w     time of file birth (immutable), human-readable; - if unknown
       %W    time of file birth (immutable), seconds since Epoch; 0 if unkn=
own
       %p     time of file creation (mutable), human-readable; - if unknown
       %P     time of file creation (mutable), seconds since Epoch; 0 if un=
known

statx(2)
       stx_btime
              The file's (immutable) creation timestamp.
       stx_ptime
              The file's (mutable) creation timestamp.

And userspace tools could be displaying ptime as:

Access: 2026-11-02 15:22:27.067329367 +0100
Modify: 2026-11-02 15:22:27.067329367 +0100
Change: 2026-11-02 15:22:27.067329367 +0100
Create: 2026-11-02 15:22:27.067329367 +0100
 Birth: 2026-11-02 15:22:27.067329367 +0100

If they want to, without that being more confusing than Provenance.

>
> v2 changes:
> - fix permission bypass leading to ptime update on immutable and
>   append-only files (found by sashiko[3])
> - normalize ptime timestamp as done in fs/attr.c:notify_change() (found
>   by sashiko[3])
> - fix wording in vfs patch to be like the cover-letter
>
> v3 changes:
> - vfs: reject setting ptime with -EOPNOTSUPP on filesystems that do not
>   support it instead of silently ignoring it (found by sashiko[4])

Please see my review on patch 1/5 on exporting the supported mask
to userspace.

> - vfs: fix not being able to clear immutable and append-only on files
>   with ptime, and allow updating immutable/append-only atomically along
>   with ptime (found by sashiko[4])
> - btrfs: validate on-disk ptime nanoseconds and reset to otime if
>   invalid (found by sashiko[4])
> - btrfs: avoid re-assigning ptime on unrelated chattr calls (found by
>   sashiko[4])
> - add ntfs3 and exfat support as suggested by Amir Goldstein[5], but no
>   vfat, smb, or nfs4 yet as they are a bit more complex

Please explain what makes them more complex.
My concern is that I would like to see that the proposed API fits the exist=
ing
fs and we won't need to change the API again later to support them.

Thanks,
Amir.
