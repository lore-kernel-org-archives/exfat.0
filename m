Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4753DDDC0
	for <exfat@lists.linux.dev>; Fri, 28 Aug 2026 04:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892734; cv=none; b=bEN38HP8ZLy3exLi7RDbKzXFY2j+P05TfKzNY6qL9BkBcwgI5YOuYlLTwMXs4DUjsmARNBKOb++/UjWkT3K0aZ8W+eSYX10brS1GiBPK26S5z6EfNDVX9FGNy+o7EGlJAq+wf9MnQ4oLK5TaPV7gJlnietLDd5ffax0yOoi8Tjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892734; c=relaxed/simple;
	bh=sffi71r12xX7jLBbnQIBN6kD+NBfBMEhj5l2OkWZLlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d80lLrdW00n1zmvAlb7j9K4ISRFQT8KTswnD2eOhqyqfxVKYVTjZ7uFIrNHMFWEWDAgL3RtGjx4mwnlkZmtcYr2Kl87QqfVITuVL6ihWdnO+HlawfWXWl15wH2VVX7Pr8fxwyoEMxHTe8XIJL+rbP3lHX9XGKU8egwNAg5OKH/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zur4ZrbB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zur4ZrbB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54C21F00AC4
	for <exfat@lists.linux.dev>; Fri, 28 Aug 2026 04:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892732;
	bh=h14SpsS2hlAa4J7cmdGhErCQ0al3kUyEP9nCoq0TcNU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zur4ZrbBVPpfy1avuPiL246C0q5arp0HsFzaSWhOIEIoSZLTgyPQ5DF5BNQ9ErIz3
	 CIdzsMD0iDEo6/e/bXzz7+/cvPZREW/yI92NLenvQZFQuPntbuBG//dZsSJ1qHY3l1
	 1oEYBb9Jl098bDDwsSbomUFwboCDJDVjL6qG5HSg0PATLhwINif5kqnG+YQKLKXjos
	 VSmoQproDZX9y4PeNegMLC8S91mf+bEXBc7Q5VQ2Hw8rX0rcPu01Hss06TWyoUyKPA
	 njjbQf3jFhoH6FuDK3YSmjepigB1wUWHGgvQtppYF8JvIBBqKqtsOe2+Mfznd1GM4y
	 XAG77rAsh+3xQ==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2529b3139fso74612466b.3
        for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 21:52:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoQgT8T/BDrAc2Xs5JyQHwX8dznjmujgHya0lbWsLYGe3PC92pxQC9LE4z3iUqmORIWATofSg==@lists.linux.dev
X-Gm-Message-State: AFuF++nxSTAZUR/vagPLnmAFrnAexefAChgtVuD3G0lketdxdofE1g+P
	wcXkwqe+q8nURxbtFaXSNwwNw/AosskBpjSfDeTWM3bz7YF81QnLJNcPmBxx+dS80ScBYtEscrg
	hhPTzQp50B5SzPPGua0wcPUH4EKc8NXM=
X-Received: by 2002:a17:907:1ca4:b0:c21:9870:c4f7 with SMTP id
 a640c23a62f3a-c2557433257mr186751466b.20.1787892731502; Thu, 27 Aug 2026
 21:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827204056.222099-1-dxdt@dev.snart.me>
In-Reply-To: <20260827204056.222099-1-dxdt@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 28 Aug 2026 13:51:58 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_JNFheGWiXY2tfr1tWZ_uGqP1RB_xKp+PyGJ1mSnH15A@mail.gmail.com>
X-Gm-Features: AcwNN1UajcFSQ4lj_FiLKIEHueHnhusb-kxKiaHeH8Av4PY9w45IUkOvy4BUe_U
Message-ID: <CAKYAXd_JNFheGWiXY2tfr1tWZ_uGqP1RB_xKp+PyGJ1mSnH15A@mail.gmail.com>
Subject: Re: [PATCH v0 0/8] exfatprogs: optimise mkfs zeroing out and fix
 stdio output
To: David Timber <dxdt@dev.snart.me>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:41=E2=80=AFAM David Timber <dxdt@dev.snart.me> wr=
ote:
>
> Following is the performance impact profiling. I don't have a spare NVME
> SSD to test with so I used AWS EC2 :(
>
> Your contributions welcome.
>
> I'm sure pgsteal_* in /proc/vmstat can be used as yet another metric on
> a busy host, but I didn't bother to go that far to collect that data.
>
> UAS:
>
>   - Host: Raspberry Pi 4 Model B Rev 1.5
>   - Device: Samsung BAR+ 64GB (via USB 3.0)
>   - Target partition size: 1998585856 bytes
>
>   Pre-patch:
>
>           System time (seconds): 4.54
>           Percent of CPU this job got: 7%
>           Elapsed (wall clock) time (h:mm:ss or m:ss): 1:05.14
>           Maximum resident set size (kbytes): 3200
>           Voluntary context switches: 10297
>           Involuntary context switches: 978
>           File system inputs: 2168
>           File system outputs: 3903664
>
>   Post-patch:
>
>           System time (seconds): 0.29
>           Percent of CPU this job got: 0%
>           Elapsed (wall clock) time (h:mm:ss or m:ss): 0:56.49
>           Maximum resident set size (kbytes): 3200
>           Voluntary context switches: 5792
>           Involuntary context switches: 1322
>           File system inputs: 2224
>           File system outputs: 176
>
> NVME:
>
>   - Host: AWS EC2 c7gd.medium
>   - Device: "locally attached" SSD volume
>   - Size: 59000000000 bytes
>
>   Pre-patch:
>
>           System time (seconds): 22.64
>           Percent of CPU this job got: 0%
>           Elapsed (wall clock) time (h:mm:ss or m:ss): 45:47.70
>           Maximum resident set size (kbytes): 2792
>           Voluntary context switches: 227200
>           Involuntary context switches: 7352
>           File system inputs: 1360
>           File system outputs: 115235032
>
>   Post-patch:
>
>           System time (seconds): 1.14
>           Percent of CPU this job got: 0%
>           Elapsed (wall clock) time (h:mm:ss or m:ss): 26:08.06
>           Maximum resident set size (kbytes): 2788
>           Voluntary context switches: 56409
>           Involuntary context switches: 60
>           File system inputs: 1727
>           File system outputs: 656
Looks great to me:)
Applied them to #exfat-next now.
Thanks!
