Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB779395243
	for <exfat@lists.linux.dev>; Wed,  7 Oct 2026 04:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791349141; cv=none; b=tvKtd6UxOWa9KQuyVNya6PTm4ZJ+7OSwnqgoUwww66aev46z45Ghz6jdH4f/iEiDcI9NDiOii9FV2XwcscTaS79T09fHErNHOax6A/LxhOeixx+daCljIgJ4USiWlsxSdpD3kfXPmOql0FDzgwP1Ph7MbNgH0y4TPHwn1938b94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791349141; c=relaxed/simple;
	bh=l/2ftnIEdG5YTjfePpkZh3FtNXsMdQ2M02mUro4v5Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKCOGux+deOOPDiYVdH8hQlhl48Y2eQL9wypYoLjLQZUu65ptrMyG/z8y13PysqWQDCsl0Pr3AG503QnyZotGA9+yGvqzFJMdveX+8NGzxAyoyv8ttWrAhAKvSHQAJw1L7UzwyHHo1gjDoSu82niN6Bm96GPnfW6+m/L4SqElj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPG07Ukz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPG07Ukz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798421F0089E
	for <exfat@lists.linux.dev>; Wed,  7 Oct 2026 04:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791349140;
	bh=+UrfWL3UvFqqOtBI9YS1pYrE4A0aG18X4nJK8L2sb0c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dPG07UkzAr5KO01jGMEi3N/1+X7rDBDiXyoMVRWWxzp0HM6KcdnfZKzNhsRWnZafZ
	 HoaHR5HovA+uWHyPNfb+njIdlHZCVoQEB/q7WkMn3+1ilMKjv+TUKsjXYj5iQKrRIv
	 QEe8uM9RQJTCLg0EPYfahIuo3xvzNF5EyFTJ4VxUnnWRX2i/Mz4pGOY88kAEd2akgP
	 1pM1Aj1SP82Iu1FUWgznxem/9W2Je/FTPXmLk6OW8CJ/R3/XJbTcZS78IyiSvx/NCW
	 kCn+giiF2POXgjb0rGn5K5MfrvNGev4pNfcx9WGz10Yqym9bilESmqCaxqrLVYCYoM
	 PfgaV1F+4QEAg==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c315869241fso337847066b.0
        for <exfat@lists.linux.dev>; Tue, 06 Oct 2026 21:59:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw8eg90dkkDvnFXmWfJnGIFhWIqlmBkrSkMzs7bcAQiV19UJo5El6Z/aKf7oIoI4UJXpJBqQg==@lists.linux.dev
X-Gm-Message-State: AFuF++k3+6Kqdkh/mM8ya7XL+TFZ+HVbBHqJfBOKmSdtRc3t9DFlGaEf
	IP82pJQhsYKadnZD49Meekm+/Uq9reFbTcGv667NteLoyWirjxmkA1JCjYHcttVgYwqFlm/D4Zd
	nlE6JhwW2TKK3q5WiVu4PKFgzULcEytg=
X-Received: by 2002:a17:907:9620:b0:c29:60b7:3f14 with SMTP id
 a640c23a62f3a-c317c175a31mr95063866b.46.1791349139088; Tue, 06 Oct 2026
 21:58:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004135638.1888530-1-anmuxixixi@gmail.com>
In-Reply-To: <20261004135638.1888530-1-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 7 Oct 2026 13:58:46 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_2PTzdiQQUp=C0_mz6ot_hnm3=VYKGcZtRujbWka+LWA@mail.gmail.com>
X-Gm-Features: AclHuK8O-zocPPGsOtjzlTPbQDuWMv89n9ZpiZqykH8g1lux9wXVld54aWzCxPU
Message-ID: <CAKYAXd_2PTzdiQQUp=C0_mz6ot_hnm3=VYKGcZtRujbWka+LWA@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] exfat: speed up file creation in large directories
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, chizhiling@163.com, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 10:57=E2=80=AFPM Yang Wen <anmuxixixi@gmail.com> wro=
te:
>
> Negative name lookups and empty-entry allocation can repeatedly scan a
> directory from the beginning. Bulk creation in a large directory therefor=
e
> approaches O(N^2).
>
> This series separates the optimization into three independently reviewabl=
e
> steps. Patch 1 adds the Bloom filter used to reject definite name misses.
> Patch 2 retains and correctly invalidates the next-empty-entry hint.
> Patch 3 adds the LRU and shrinker used to reclaim filters under memory
> pressure.
>
> Test environment:
>   QEMU TCG multi-thread, 4 vCPUs, 6 GiB RAM
>   4 GiB exFAT image, 32 KiB clusters
>
> The measured results were:
>
>                          Before          After
>   real                   589.48 s        30.09 s
>   user                     4.72 s         3.40 s
>   sys                    584.63 s        26.65 s
>
>
> Changes in v7:
> - Size each Bloom filter from the allocated directory size, using four bi=
ts
>   per on-disk entry and clamping the bitmap between 512 bytes and 4 MiB.
> - Track set bits and discard a filter when one third of its bits are set =
or
>   directory growth requires a larger bitmap. Rebuild it lazily after a
>   later complete negative lookup.
> - Account reclaimable filters in pages so shrinker accounting follows the=
ir
>   dynamic allocation sizes.
> - Preserve the shrinker core's scan budget and return SHRINK_STOP when th=
e
>   LRU is already empty, preventing repeated no-progress scans.
>
> Changes in v6:
> - Invalidate the name filter when committing a new entry set fails, befor=
e
>   attempting rollback. Despite the reported write error, the new name may
>   already have reached disk.
> - Move rename/move error invalidation into the Bloom filter patch so that
>   each patch remains correct when applied independently.
>
> Changes in v5:
> - Rebase the series onto the exFAT maintainer's dev branch.
> - Treat every non-negative exfat_find_empty_entry() return value as a
>   successful allocation in the volume-label path.
> - Record the minimum entry-set size for which a saved empty-entry hint is
>   valid. A shorter entry set now rescans from the beginning and can reuse=
 a
>   smaller hole that an earlier, longer entry set could not use.
>
> Changes in v4:
> - Publish the next-empty-entry hint only after the directory entry set is
>   successfully committed, so post-allocation failures cannot skip an unus=
ed
>   slot.
> - Invalidate the destination name filter when rename or move fails becaus=
e
>   the new entry may already exist on disk.
>
> Changes in v3:
> - Split the change into Bloom filter, empty-entry hint, and shrinker
>   patches.
> - Accept filenames containing exactly 255 UTF-16 code units while buildin=
g
>   the Bloom filter.
> - Invalidate the empty-entry hint in every path that can free directory
>   entries, preventing stale hints from skipping earlier holes.
>
> Changes in v2:
> - Move exfat_name_filter_free() to exfat_evict_inode() because
>   ->free_inode() may run from an RCU callback in softirq context.
>
> Yang Wen (3):
>   exfat: add a Bloom filter for negative name lookups
The removal of blank lines in unlink/rmdir/rename is unrelated to this
patch, and the code will be put back in that place in 2/3. It would be
better to drop it.

>   exfat: retain the next empty directory entry hint
>   exfat: reclaim name filters under memory pressure
Please check if Sashiko' review points are false alarms.

https://sashiko.dev/#/patchset/20261004135638.1888530-1-anmuxixixi%40gmail.=
com

Thanks!
