Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832185;
	b=gSwfZtT4DvJNKLXi9eTlcOV3gLYzAPtGuR0jzRU7v3dZp6cgjqQdNRdoRCSwDOvjcMOl
	 EVMqtThR1vuXPkP3u/WveHpxjcFLqIZZUWMtxPC7cpTGgevLcDGW05iBAML4gNWGvgI1H
	 XAVnDlt63ru9awFRVPaCEAiyQ9wDViU6O1cLnSqGXJiU+zxTC+l0vj0uwpd+sEk08fY6j
	 MifH374YQu4ne8p4J14VO4rWoquDXjpq4urCBCVjWTFBSZouSg3ZLRCLkz4PTSEco8lAK
	 eONJpuS88MOEHQW6GtHxgQCuTdMVB9unnRpc26+ig7J5ZW6nKy6f3IvrTmWrku3bYpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832185;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D6Gd+45O6jd/WTnyKl3qNGPwrR7aNETEgKYw1kcr+R0=;
	b=exUSsWnguZqhxWNikAtTlBzVd8216fD30CeN0lc55jLQe1JaLXhQL9Rpdt+Y6rNeDsur
	 oyC1A3AqGxG/hALfE3DlJHpsHiHb7cuBdWolKySSZWlXM4ayOOV1Br6HKKLbElhLGD6vJ
	 TYHQaxVeXE9Lc7n2yVJgvO68VK1zAIIzGziCeIl4kutD05/67xYs1re2xFiVelBzwiG7u
	 6aObaZQ01u//rEt4dQF333rTbOpHRRi2ipDtxotc7PNV70zapPb6XRs6VKLUEEoEbXcWh
	 5yhY10Dg7mKLlfVaBxBbu1jNiQXJO3GMQewHLiIQs+jIoo98NBIa3Yp+PeQ1/AlTfRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXBXu7oW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44872606A33B
	for <exfat@lists.linux.dev>; Wed,  4 Nov 2026 22:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXBXu7oW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF73F1F00A18
	for <exfat@lists.linux.dev>; Wed,  4 Nov 2026 22:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793832184;
	bh=D6Gd+45O6jd/WTnyKl3qNGPwrR7aNETEgKYw1kcr+R0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oXBXu7oWdd6jOEskNxnLNKXj5NDVmJ1bZ5msx5HExb5Pste4QfoLQO/cacnE3POpO
	 GPihD/3ocKKggiPisHsKYkQPQ5tR1i5oblR/kEtDJHe89NnLRsgdFYncOUGQrgiSCO
	 0ERAAGlyBhlIazvzEVxXiPT1k4gsNC9mVSkCwOtS4MBdPM1pGY0DKe6iIVLZg5EKuz
	 TRITyqyYPsfEX/IqFKz3KgtcoZZIxxuv7cgd/J80/cfiJNmb+gbjE09RC1GpTrHlM2
	 rnRPtd8uxYiHDyBMMozp5vGFcTxCvtUU/2yUmIE7ZScUQ50xBVOmImTTr3oA7YrOz6
	 NoXm3FhKW4u4g==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso2559906a12.0
        for <exfat@lists.linux.dev>; Wed, 04 Nov 2026 14:43:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy1I1aq1G6IWX8US3MFHtVzHcsobu4P2d/knVG5G2zRBWVgRM9A3QvmwAoUFymJlG/pLQJJbg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Mwh6+njfxnMW8K1M7ufamVYjnLMdu2Cm4j/xF8ETFtxC5D43i
	mJlf2YXmkO8ee95xQzlPXTJEuXyb0VU9+Q/tNEs0jBMhpEb/5DE/eQITVgIsbOeTGF54cT9w7Wh
	B3ATtR3w7gFddH+NEMoi9ilCpgTlz2Uo=
X-Received: by 2002:a05:6402:4485:b0:6b5:5d17:e27e with SMTP id
 4fb4d7f45d1cf-6b55d17e2dbmr2505843a12.19.1793832183452; Wed, 04 Nov 2026
 14:43:03 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-exfat-dropbehind-v1-3caa58820a82-1-qiwenjie@xiaomi.com>
In-Reply-To: <20261104-exfat-dropbehind-v1-3caa58820a82-1-qiwenjie@xiaomi.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 5 Nov 2026 07:42:50 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-B=jAQmirmtFycab_A-f_7WwJO3-jo=JGPT4L4UcajZA@mail.gmail.com>
X-Gm-Features: AclHuK9sZ8fC5MaT5ANgQ7UtQYzaYRrCF6oXuG6pQyKO8IO-RfgzTtGPLe3T2bg
Message-ID: <CAKYAXd-B=jAQmirmtFycab_A-f_7WwJO3-jo=JGPT4L4UcajZA@mail.gmail.com>
Subject: Re: [PATCH] exfat: enable buffered RWF_DONTCACHE
To: Wenjie Qi <qwjhust@gmail.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, qiwenjie@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:50=E2=80=AFPM Wenjie Qi <qwjhust@gmail.com> wrote:
>
> From: Wenjie Qi <qiwenjie@xiaomi.com>
>
> exFAT uses filemap for buffered reads and iomap for buffered writes and
> writeback. These paths already handle IOCB_DONTCACHE, including marking
> new folios for dropbehind and completing writeback bios in task context
> when needed.
>
> Advertise FOP_DONTCACHE so preadv2() and pwritev2() callers can request
> that newly instantiated page-cache folios be dropped after I/O. This is
> useful for one-pass reads and streaming writes to removable media.
>
> On an NVMe-backed exFAT image with 128-KiB clusters in QEMU with two
> vCPUs and 2 GiB RAM, disable KASAN, lockdep and tracing for measurement.
> Compare normal and dontcache I/O in three pairs with alternating order.
> Read a 4-GiB file using 1-MiB calls. Write new 1-GiB files using 8-KiB
> and 1-MiB calls in a memcg with memory.max=3D255852544 and no swap.
> Write throughput includes fdatasync(). Median throughput and peak cgroup
> memory were, with percentage changes relative to normal I/O:
>
>                       MiB/s                   Peak memory, MiB
>                 normal/dontcache  change   normal/dontcache  change
>   read,  1 MiB    5788.4/5124.9    -11.5%      1353.3/18.9    -98.6%
>   write, 8 KiB    2924.6/3400.9    +16.3%       244.0/106.7   -56.3%
>   write, 1 MiB    3534.1/3985.0    +12.8%       244.0/188.3   -22.8%
>
> Dontcache reduced peak memory and recorded no reclaim scans or steals
> in any profile. Normal reads and writes scanned and reclaimed about
> 710,000 and 200,000 pages per run, respectively. The memory-limited
> writes gained throughput. Reads reduced peak memory by 98.6%, to just
> 18.9 MiB, at a modest 11.5% throughput cost. This smaller cache footprint
> can help reduce memory pressure on concurrent workloads on
> memory-constrained mobile devices.
>
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
Applied it to #dev.
Thanks!
