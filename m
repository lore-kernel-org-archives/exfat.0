Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718777;
	b=bze8mMtubejHessJFkgd9pQhjGkRIPRJ0SIwArNirAVVjhNTkg26xeY5yvpewArkpJAh
	 W3K8w2Jy+f4cXaavI5Mp0mhztXs7PGJR7IP16XTOEd1oFkORzssEkt9cKwX2CqCI/uciy
	 aZ05jcvOfoUmPGXqcUHqgRQTtN8fAbSc0QVI6+4O5wHoeZFHAt+QK0LCK4h+kCzv4QFu9
	 xYappBix5HplvF/2trwLfCG4M8Dqujgf3YDVGFX8fpJFllP0fzItcrEKWcGCMVeMdQoF7
	 AXM5B6QBdKFe6pTocZtj4eKQLxqbdbzeDfkXE9KE39I9bKE+SdZO76Unv5bizwqQr4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7cMnatEM3HIlL4UaH1i3lvKdnRzKCLctOQy2OXRyT4U=;
	b=JC1oLLawTxQsXX/1dDwbB9KEiTTblIr5DtaT+AJg/urvnPYIvOTpadf4tM4UKjaEXmzf
	 DpvD64O5a7IgWCwlPW11oZCbo5cTpDAMh8pldjdKMVpFC7rOHr35oMOuwwheZ2JhAUAm3
	 veHYO4HAM2MctmBkj4fwyxtVt6ScscIHBULBZKYYsv4npycb5ws32buttCs/NGL8Fdpba
	 7FQex1Xf9Xv7rB91IGFNO1sK1HpaZGiY9sRNQ22jPPl6Qkv/x25kh9rumnAjasRbbFifD
	 9JWWLrCJswF+rvMY+i7Fi3a3h+U2jxSD8+SY6QwNbygPfw47SrQqlwn7J+vH2kHutKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T/l4Ivd7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A956606B26E
	for <exfat@lists.linux.dev>; Tue,  3 Nov 2026 15:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A956606B26E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T/l4Ivd7
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1165434a12.0
        for <exfat@lists.linux.dev>; Tue, 03 Nov 2026 07:12:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793718775; cv=none;
        d=google.com; s=arc-20260327;
        b=MtO2buOH0LD0oc5wpqiFpmzNrX8tbr3WxaYy3hg7GSgjq0iqcaXaa8RFykzYeNV/mA
         Ok4WDAr2NSc7v+mPXKOlgUmHPWAKwS97q1qODAuPHiUpX+sYtM4Aen+sQuhOVX2MGwNR
         KZDL5sAbBGR/pV7pKM4BVd2lmiCwdUMDfcd072LAs6FCwZJc8r7JBYCtpaeZlLNXiYI9
         Ps6YUwS66ZRuA5VWXYeJTWhzJaC+iVWdpDa3v8rPlqIPLJAdYW0quWR8smGoXsQDz3xY
         vccMNqrXx/W6vYEsWHWbVEbnHAGRfN6opj76WZ4YX2LFCLIYdBPwRP6c/gjZj5o8FzuA
         9h/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7cMnatEM3HIlL4UaH1i3lvKdnRzKCLctOQy2OXRyT4U=;
        fh=AXFxGMGHSZ6V+FxKDWGXyV3D5mvMrIZzDPbPAbkhTiw=;
        b=KwROWHzVqgL6sqOrWk2+JZVYBZp3n8mhQtYrvwG3FfkD6vPKqU2a110DK+RN1ySewy
         It7BtEM7DmIxeKwGY/w6EQW1Y1M/hNC60/jqbSQIiucZk/9ONWV8IHNstUVtOe2E9AHr
         kDU6lr0EsSDt1NAYQOZCHxlymdlg+lmrOQnCFaQqVLV/AiVc8szlbjSEF0/DXKq4fq2H
         JQTUdqw8ccpns4Z/Z17iwPDTFvFA5Khj/i8MRMiiigyjV+Uw3hbpHYGW/SpfFKQlrHdk
         4jyvaDb5TuI9MNIQ7CR1SfT9+wm0lsKy+Zifyh0GgpO66Rl8wwqCowUUrScsrRxNTQ0b
         NSQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718775; x=1794323575; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7cMnatEM3HIlL4UaH1i3lvKdnRzKCLctOQy2OXRyT4U=;
        b=T/l4Ivd7S7wh+Bqm/ahmY0ID8RAHMbunJ+xSJZXx/JU6CnrKgmfymMghTXqF9B637d
         sRJwizbhokInVKwBi209+vm20Fi035y1XUZsBJ+HqrR6wjofLAo2A3q9JIVpw1fmM70l
         PPJ+mt7EKH28iz9DpHnKslQ3GJCKAmuBDJwzZKyBZshrGq2jo/ORk/6q0BBhFKiwtQ/E
         5u8IgkziQ0Dn5kFG8h0kiWwWfuWiB55Qo3G8Bbtde2nmgTAND279+x5r4Sg/V4aVDr+y
         +QnTzVU21DIwbMN8Ortt6VMFhOxA1sHI2HMnMZY9UUvWT02UZof4MuvWzGbLGjkpUvtc
         sueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718775; x=1794323575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cMnatEM3HIlL4UaH1i3lvKdnRzKCLctOQy2OXRyT4U=;
        b=vtKL8M/is5YbCydgf1DP2ks8ZW+9gUMiJCHEPe3drL/Ya3Jf7CmHRXQKHMi2q1JWln
         d4froJSZ10HHRArajKt05eGCdSeKNmNt9T0ZOqR1tlf1jJ44D1XMeIg+bAQcDywhI9vW
         qOcUZIsWDyaUV2aeMvra0I6abPOrCC3YgyrCKHJtb0F5M8l8OPRZpaZSQ2R0sDgB8TXt
         HtBnhADdFl9OyjeS09vV9trRGGvueOzhILEarYu90Bx+Ffqs7P0ODQu6dH7AJop1uLkp
         QnxI4NmED82LuF2zTmDTtjs1uLr9ZGB8dtvB9+6vveZIs4ZpoW3GVS8mgNnYSgZG8XnG
         OYAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUvxcNREt+YTXSP1KkJTzEkcVj0WKALfYSWZ0GVkLzlDL5/+4DDjCuJHIApGZKZD4goQN6oA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+0C/4upMbGsjZiOVFKRYdPWxOPhX8hTFIgvBx+fdoUYkuPv6PI
	w1G3EQ/KoJp3djy7cnK6IILp+E/wW3qDVwQ9kTNmOQlieXGicIjYOQy4WzVuCYDCTAD+FM5Y15l
	ldBCm9+aBUl6AzwlANaACLOzM22/DgzU=
X-Gm-Gg: AYBFou2UBvYBJ+c16NkAtqC8Db9TsvCPe4aKd9MH1HVgBbZPoNVKmGFB2v8k60bfIZ0
	jc0YRGOCRGAFsITNqZMC9rAC0gmaS9rF7m9/tsgU+bJyY0+mO7xzbXXbG+wnfD1+Xqp9EjOVK0/
	rP0b/b2bI/qHL7aknyXiDLhYmfK68e/C8C34MOZ0y+2OU+Ls1zfZd7zTalG1p75AsXovkdsQOGF
	RB7NJA1I5lM0AdvYmSAeJARaga50AcqmAfQTQSzDTP/EOzp09wuJ9qQQ1wY0h4ilpnFFbuwpj+z
	l6MxL1TZjf6VXBHPmv1E2oiTi62M6le0VKjRspvzPAzr5EQ6G7r3rFHkf+wks0Y1jle4SQ6Dx4I
	q0L/B6Y3kJ6syc2v15swpZLyYpmcibQx9zQVmtsB+OHgdnoFSv9bSgDLvkSBeWv1RQK4NFAg=
X-Received: by 2002:aa7:c716:0:b0:6b1:c521:ebda with SMTP id
 4fb4d7f45d1cf-6b4d5ee6c50mr6756533a12.14.1793718774731; Tue, 03 Nov 2026
 07:12:54 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101015551.786044-1-koray.fra@gmail.com> <CAOQ4uxjkG=1j1z==Mv4wzkF042rXstodokKnBfMFBf2e-Eztmw@mail.gmail.com>
 <DMLJE2Z57AD9.1W22LSE7V9HH2@gmail.com>
In-Reply-To: <DMLJE2Z57AD9.1W22LSE7V9HH2@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Nov 2026 16:12:42 +0100
X-Gm-Features: AclHuK8QI8V9NvEKNRSnDchTL0FslmV7Uh3t35Xsoq4Akwwc8XamtLwVFdORxbE
Message-ID: <CAOQ4uxiMLDgMXuij99-43UfCqfZN2a=CTet560o_RzU2m_Y4SA@mail.gmail.com>
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

On Tue, Nov 3, 2026 at 12:25=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Mon Nov 2, 2026 at 3:54 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 1, 2026 at 2:57=E2=80=AFAM koraynilay <koray.fra@gmail.com>=
 wrote:
> >>
> >> This is an initial implementation of a new timestamp to indicate the
> >> time when a file/directory was initially created.
> >>
> >> This patch series takes inspiration from the one by Sean Smith
> >> <defendthedisabled@gmail.com> [1], but using
> >> file_setattr()/file_getattr() as suggested by Darrick J. Wong
> >> <djwong@kernel.org> in [2].
> >>
> >> The semantics of this new timestamp should be at least these:
> >> - it should be the same as btime on a newly created file
> >> - it's user-settable, so it can be preserved for backups, filesystem
> >>   conversions, archives and any similar operation
> >> - it should be preserved every time mtime gets preserved
> >>
> >> and the correspondence with the other timestamps is as follows:
> >>
> >> ctime <-> btime
> >> mtime <-> ptime
> >>
> >> Examples:
> >> 1) a .zsh_history file created in 2019, then after a few years the use=
r
> >>    decides to switch to another filesystem, copying the .zsh_history t=
o
> >>    the new home, in that case btime would have the timestamp of the co=
py
> >>    and ptime would have the 2019 timestamp (just like mtime would have
> >>    been preserved)
> >> 2) a symlink created in 2020 from the home directory to a /path going
> >>    through the same process as the .zsh_history, in this case it would
> >>    also make sense to sync the ptime to the 2020 timestamp instead of
> >>    keeping only the btime (so the inode creation time).
> >>
> >> The proof-of-concept code (for testing) for stat(1) and cp(1) is
> >> available at https://github.com/koraynilay/coreutils (master branch)
> >> (Note: these coreutils code changes are a prototype and won't be
> >> submitted upstream as-is, but they work as expected in simple stat and
> >> cp -a/--preserve=3Dptime tests)
> >>
> >> Lastly, the name "provenance" and "ptime" are not final, I personally
> >> don't have a strong opinion on any name, but while testing with stat(1=
)
> >> I noticed that "Provenance" is definitely too long for the normal
> >> output, so another option which would fit well is "Origin time",
> >> abbreviated as "ntime" (OrigiN time) and not as "otime", as that would
> >> conflict with btrfs' internal naming and create confusion.
> >
> > FWIW, I agree that given the existing uses of btime and crtime in the
> > kernel and various XXXprogs, using 'ptime' for kernel code is probably
> > the lesser evil.
>
> What do you think about the origiN time (ntime) (Origin: in stat)?
> It would also coincidentally be alphabetically (ntime <-> mtime, n -> m)
> the same as btime <-> ctime (b -> c) ahah.
>

Honestly I don't know.
My new idea is don't publish it in statx() at all.

Thanks,
Amir.
