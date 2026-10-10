Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1703DD849
	for <exfat@lists.linux.dev>; Sat, 10 Oct 2026 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637402; cv=none; b=qPIJAN3BUFvqPhkKA1JHFsPcVfmUNeAKNlSgf1nuPMldNHVaxN1mMAHBlsrbT5jqwUCQ8BpSd148YnLxCH70e6B3k8g/rtuCuTSjL2ndrQdaB21uwNoMVHv2L8KQQQKwMxoqWOGxkRTJmNiqIJ5niVD4udF6reuQfj4DQiytuuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637402; c=relaxed/simple;
	bh=7Lm5esxq7xWFq8eptDp166CyZQ6XrNxWb4wYGABOMjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ro7TNbkKtMEOojcKUor/CN36TS7A+SsoK5eKqcezmKy2eznC74p/Loujk9J/75PuWeYmeSY/xH3awDV69uVokAX+pZNDK2Iv2H7SH6tgW1m2Egp5rxsQ71eseI8lycHpmqKykFSJ0DJgFyOVZ5PEegBSKZCNo3qF4m/hI99rm3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUsAWESn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUsAWESn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654401F0089B
	for <exfat@lists.linux.dev>; Sat, 10 Oct 2026 13:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791637400;
	bh=oHHCIcBeSShU+Qb0oqsK5cg5vGoHvRNIIB1sW+b7OR8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lUsAWESnLyQpQZwMHAbYTyZgSBY59fL8uVbGFYvFgGqnHXJ/XLwZe+oehMdPocWm1
	 2fEn/zsNqjrp5xEIEs8uYwEgwWDiijsbnO7k7wq9npkWOXCVCnpt5iRhjw9kPNsE3v
	 3OArfDqekPqJKg47RMwKCFBnXH2L7MQ8J2LqQll6iBy4q3anGvbRFlr5gT4K3bi+pU
	 xw/uOZhVnxUsjaZk/JcOIoeEkVcn0PJ0qK1j48p8PhCM/8bYScmrNNCei1Z+X9T/3M
	 vVPgHzZUscq8WhAvSxl5PX2hgHwAMM9EbVIVnvC9p8HPkVJhynaRGxBkgMLE/w/JFb
	 vXDKx06ticcAQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c263415982eso81326066b.0
        for <exfat@lists.linux.dev>; Sat, 10 Oct 2026 06:03:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByWI08nG4jFPBHDS25dKFgvfjj+A09ZdQUMDVUYn/R2fxy15UqyXm2liTpEQWP3RuRtm21Iog==@lists.linux.dev
X-Gm-Message-State: AFq9FYLfBYRB8tPXXFJ4Lz0hA0o5EdyFLO7bRwlWkZbCSItcRQ7iOLE8
	razScjRG/JDaoisvV7aRrc893BrcF/eB9ML/wHF/SgOBrQbagreO28lZChzBWfB44jIv0/CyNbt
	8l06Zu7yHLxMVX6ceJzjvvIUMCP13dm0=
X-Received: by 2002:a17:907:3f8e:b0:c29:f5d5:5aa7 with SMTP id
 a640c23a62f3a-c31aa0c0ae8mr459865866b.49.1791637398836; Sat, 10 Oct 2026
 06:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261010044420.4045884-1-hengyul@cs.unc.edu>
In-Reply-To: <20261010044420.4045884-1-hengyul@cs.unc.edu>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 10 Oct 2026 22:03:06 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-VvD6NAZAvL9iVoc-mEvTeAkdfkrc7Aqc=z0U95-YoAw@mail.gmail.com>
X-Gm-Features: AclHuK_DHQSHQ3JnZDFwVr6fPBcbPQrMYNLYq4gjvF1aZPeNJpTC54bDvAaAnBs
Message-ID: <CAKYAXd-VvD6NAZAvL9iVoc-mEvTeAkdfkrc7Aqc=z0U95-YoAw@mail.gmail.com>
Subject: Re: [PATCH] exfat: fix a large buffered write failing when the volume
 is nearly full
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 1:44=E2=80=AFPM Hengyu Liang <hengyul@cs.unc.edu> w=
rote:
>
> Commit 82a81a7352bc ("exfat: add iomap buffered I/O support") made a
> buffered write map the whole range of the write in one step, so the
> clusters for all of it are allocated at once.
>
> However, exfat_alloc_cluster() returns -ENOSPC when fewer clusters are
> free than it is asked for. As of now, a write() that is larger than the
> free space writes nothing and fails with ENOSPC, while it used to write
> as much as fits and return a short count.
>
> The issue can be reproduced with a 16M image made by mkfs.exfat that is
> filled except for 256K:
>
>     mount -o loop /img /mnt
>     dd if=3D/dev/zero of=3D/mnt/hole bs=3D256k count=3D1
>     dd if=3D/dev/zero of=3D/mnt/fill bs=3D4k
>     rm /mnt/hole
>     dd if=3D/dev/zero of=3D/mnt/f bs=3D1M count=3D1
>     wc -c < /mnt/f
>
> Before commit 82a81a7352bc ("exfat: add iomap buffered I/O support"),
> the result is:
>
>     262144
>
> After that commit, the result is:
>
>     0
>
> This patch will map a single cluster when the clusters for the whole
> range cannot be allocated, so that the write goes on until the volume is
> full. Direct I/O is not changed, it still fails without writing as it
> did before that commit.
>
> Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
Applied it to #dev.
Thanks!
