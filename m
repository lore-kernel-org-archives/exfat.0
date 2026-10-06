Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8783E42DA5A
	for <exfat@lists.linux.dev>; Tue,  6 Oct 2026 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291650; cv=none; b=DnHSF/AANWjP0eqXEA3i+23YXvI/v1cy1QE/j/ooM7N2Rw6cY38Q1EJbkb6LpzFuh2uIswb5nQ64wsibq43dhzj+2L4p1mcDwHCUCSQU+mSwaFV/MkhmQk9VSJMGleOvn0ucQktKQRIM6EsjcuEHNuLwhDfipjeETEIkoe7QxnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291650; c=relaxed/simple;
	bh=DnxbfHW/ci0RFQdOf7Rjl0LHrBxosYuanF5F3lpGa2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3660Eye9EqIJdvdCBTmuKBZUbYswjVCEqx87cbc3vfMPAKr2mRFstEJiNLbX468KzRe4N20gIFsElqlZCSwBcdZ+gxmbZUwppUqNxzAvP4FGuHq71czPCJ+7U5c5CMaqIKdE2Rkw/L2+h+Jhlx/aTOskM/tMH97DcrVRgfOtE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StwJ1PGF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StwJ1PGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6FF1F00899
	for <exfat@lists.linux.dev>; Tue,  6 Oct 2026 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791291649;
	bh=xoy0kR5aG01hDLZZyUCBcsU19r4ofvk7lSV6CJtTpps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=StwJ1PGFaHQgJhuG3U9oSMTwo0W67rHG61zgmlAQ+ezCvV5O8Ow5GEKzz7txRLGKB
	 mrxrRg5A97OIEIlI5gesV33/lm3il/ZumjQjcEHTHJ5DkQw1z9dbvj4NrsTZz529RY
	 pmcL0dN7portyGjUHqe5To+7sXvO5uwDqCOnrbR9dIqg1hPINZxVdwFE/fd/bYMrXo
	 uCAqR7R9yW/UjrikquZr2b4HpWpBqmvzrknYRFX5DEz+705l08FcD5CvIEEmr8Mrv/
	 DAR0zbd8aXgIUxyKU5B/PtKGke0cd2bYCfa2vOqzr6vfMYFn4DPr4HvCRuiUN2Q7Xp
	 zymtd4ryL+BJA==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c169ae1cb26so127202566b.1
        for <exfat@lists.linux.dev>; Tue, 06 Oct 2026 06:00:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGq8r00CxHR67YJuXkMcdpDAYuKHVguVtXBRxI+LMuH9uqBzHzvsFMoePtAxM2itPIQowe2A==@lists.linux.dev
X-Gm-Message-State: AFuF++mnhnqTLU89DaiyELz/Wk3Na3Zu3PHoy9KNlucutp9HnK31cCKe
	DukJaiCjyUwheRsjtCylQVMo5YBIU/AWNneStuQFponWzDEryzC8gQwYcOvjiqNwKQrNa2nzP2o
	LIaodZc88rvpmnQeGzc+7AUpOGoKvTTU=
X-Received: by 2002:a17:907:1b22:b0:c2d:ba74:b809 with SMTP id
 a640c23a62f3a-c3169fcc8e8mr167752866b.16.1791291647714; Tue, 06 Oct 2026
 06:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003093035.532916-1-yaojiale02@163.com> <20261003093035.532916-4-yaojiale02@163.com>
In-Reply-To: <20261003093035.532916-4-yaojiale02@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 6 Oct 2026 22:00:35 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8NDnQs=yzPSOY3YsnQY8x0e2AaDxP82dy-xDbwZiFbwg@mail.gmail.com>
X-Gm-Features: AclHuK-ImapjGAi9AJ54q9p2uRnewJk_wCL6GswbFrqB8iPjObVh7SNeKiiG7E0
Message-ID: <CAKYAXd8NDnQs=yzPSOY3YsnQY8x0e2AaDxP82dy-xDbwZiFbwg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] exfat: drain in-flight DIO before buffered writes
To: Jiale Yao <yaojiale02@163.com>
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, exfat@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 6:30=E2=80=AFPM Jiale Yao <yaojiale02@163.com> wrote=
:
>
> An asynchronous direct write can remain in flight after the inode lock is
> released. If a buffered operation dirties page cache while the direct
> write is still pending, the direct write's post-I/O invalidation can find
> the dirty pages, report a page cache invalidation failure, and record -EI=
O
> in the mapping error sequence. A later fsync() therefore returns -EIO.
>
> Commit 15cdefd0c0522f9d5e12d947fa04f4c11649b699 ("ext4: drain
> in-flight DIO before buffered write fallback") fixed the same race in
> ext4. ExFAT does not drain in-flight DIO before a regular buffered write,
> the buffered fallback after iomap_dio_rw() returns -ENOTBLK or a short
> write, or the page-cache operations used to extend valid_size.
>
> Wait for in-flight DIO before these paths can dirty page cache.
>
> A reproducer using concurrent AIO direct writes and buffered fallback
> triggered the following warning and made a subsequent fsync() return
> -EIO:
>
>   Page cache invalidation failure on direct I/O. Possible data corruption
>   due to collision with buffered I/O!
>
> Fixes: 867b9c96dc83 ("exfat: add iomap direct I/O support")
> Link: https://lore.kernel.org/r/20260629113827.4074335-3-libaokun@linux.a=
libaba.com
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
Applied it to #ntfs-next.
Thanks!
