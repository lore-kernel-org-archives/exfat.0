Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1919B3A873D
	for <exfat@lists.linux.dev>; Wed, 16 Sep 2026 03:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528350; cv=none; b=Islu8RIQXH6OYYzkCSHgMF/eWJDwZ7wmDIXh1EoHTDHw16WiCg4ioIjAfl8gMwflA1hJH6NOEj0yLksW2m8CI7e94rWzWQ3QBbJgHoNVsR+gaCgbvGP3dy4FMFYaKTpKoUXKafM2OIPtsDe9hb1tzKlZ+xtVgpBhcXk7svdR9u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528350; c=relaxed/simple;
	bh=S597iyRl2zrZujQg6VGWVKgYtZ6fG/R56DS6d96rpIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IqkataguYcK1hq6jlYXMoqO5e93fAztLE8MlEUHZFapxXJ9O8yUlBcwPGoZywwowOxQUyX9FfUhHaN8NT6QQv5Xaeaktmp2S9YJfPcqsWzjJYpIZ61LX5cYB5Tw6/TwBguAZ7GhJP7r743CdRWVN9XffPhnXKcqFzfXXfVyqyLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Duu8atOi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Duu8atOi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3111F0089A
	for <exfat@lists.linux.dev>; Wed, 16 Sep 2026 03:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789528346;
	bh=S597iyRl2zrZujQg6VGWVKgYtZ6fG/R56DS6d96rpIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Duu8atOiR2Uskp1SBFEAaDY83nsBF8WvI0bjvs/D6r9/+9nlqOntgPlUIyNUPxyEg
	 pWDmq+Ufzc+p9AJh7efCd8cmuTBrWTv8DY+h8tFwUqfe5fJubnQfPKzKK82uGyLlbq
	 BKjsywULGZz3r03/hUM06V5mNCXP1qaKuzG5cYUruSzeBrdRKOSbGLMxXTFVVi7Hzu
	 mwI/zfbymldPZ4cZmY5HeTwFhBjdGdV4TtKIBAk89vo8BgKPragbnJ1o818rNHmOdj
	 HdWWPrIT0GXt+iCFSaTsuSMhPiM/XFapTW7Vnx6jMO6u3BfkaPDNGN6hfn8CdsiSUr
	 Ca6PvaCYbtvCw==
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7daaso661844a12.1
        for <exfat@lists.linux.dev>; Tue, 15 Sep 2026 20:12:26 -0700 (PDT)
X-Gm-Message-State: AFuF++mJr/AyY8W/jjcgM6KSJZ3ieKYg7F3n/TQErJJo4JbJJ56hogUa
	dGjY1KZMN0+rEbwUyORzgvnw666+kR4YRw6hJ4OgMil6/NXAOBw04ofNU2NUCYhPgd/+NFGStKu
	o94nCvVZPmqWp/EVq8yfg3+x9XOsYzZ8=
X-Received: by 2002:a05:6402:a00f:b0:6a9:f874:6da7 with SMTP id
 4fb4d7f45d1cf-6aa22403fbemr1024213a12.14.1789528345030; Tue, 15 Sep 2026
 20:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com>
In-Reply-To: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 16 Sep 2026 12:12:12 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9wnmVyp4ONjYQPs5pxo_ruDmCN_yu7Ma4agDP1n-NNBA@mail.gmail.com>
X-Gm-Features: AcwNN1VH0raOSli5VF-8v12MCiLXYVwrX-yZkxUWGC36ckexezkP2mXSlHbpi6c
Message-ID: <CAKYAXd9wnmVyp4ONjYQPs5pxo_ruDmCN_yu7Ma4agDP1n-NNBA@mail.gmail.com>
Subject: Re: exfat: question about valid_size and page cache
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, "Yuezhang.Mo@sony.com" <yuezhang.mo@sony.com>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Hyunchul Lee <hyc.lee@gmail.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, liubaolin <liubaolin12138@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:32=E2=80=AFAM Chi Zhiling <chizhiling@163.com> w=
rote:
>
> Hi, Namjae
>
> I have a question about the valid_size advancement logic in exFAT.
>
> In exfat_zero_new_range(), we zero all folios that are either not
> up-to-date or do not exist.
Yes. valid_size can be smaller than i_size, for example after
fallocate(). Reading that range can create a zero-filled, uptodate
folio in the page cache.
>
> I'm curious whether a page in the page cache can remain beyond
> valid_size. If not, why do we need to skip an uptodate page? There
> should be no uptodate page beyond valid_size, right?
uptodate folio is not necessarily below valid_size. It can contain
zero-filled data from an unwritten range, or data written through a
shared mapping. Therefore, we must not overwrite uptodate blocks.
>
> If such pages can exist, how do we prevent them from becoming holes in
> the page cache? Those pages could be written back and then released. In
> that case, we may later zero the corresponding range, which could
> potentially result in data loss.
The completed range is recorded in zeroed_size, and future zeroing
starts at max(valid_size, zeroed_size). Therefore, evicting the folio
does not cause the same range to be zeroed again.
>
> By the way, I'd also like to understand how NTFS handles this issue.
ntfs also needs to be changed to be like exFAT. I have a plan, but I
cannot do it right now because I am working other jobs now.

Thanks.
