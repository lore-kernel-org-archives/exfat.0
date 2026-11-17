Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954596;
	b=DQqlKl6bPdzXSCQjcDjNWGBPmX2jwk/7Z5n6ewQ3j2YUBxtgzASxtCoQ5C8a0ipodROA
	 1GWg2Bd/HiFJSODJ3G14H99/aeoSA7XFgxQBYW2tXPCcP2YFwn0BqRGuvB5nTqAKpfSke
	 ZIYNHcvIW+cfYgtJX1Mzj1SQQzpe+VrzAvrAozKO4BnZm0T97kDvNyR6gjaPWGBlm6AgU
	 dLyOm45szjsY+L0u4YxYDawNmV7Y8VCk2u7LBtghGHeOowbQcA6S08pQ1UhRc8UsRsxyT
	 qDYzrUjwMx1el8ivcm/m1jkLAJluzpZ/xJHbyIMQy28LV9eJZ3fbnn/i76qazhF4xYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954596;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QgCr0DpcBXV214M0n10zOgwhTeGtnk5rboT1ob7NYxc=;
	b=pJntFwGJUiaPlakxnzimCqRZQdyyptilMkljezBp1ZqZsz4hqa6D/JmWrcqaPgap+9pf
	 6ETAPfZtYRMZV8Uqw8Dhdhcqx6XXSwjxl5cROQdm9zC8l7qZprb+zIdLPv5AaD6qWR3NW
	 Jwu/Oq7yJ+w+/DekZkxbj7kD/q9Exjf6QLYbWY7CFHx4sL5xyg6SrhtnUHNs0E8wYcorj
	 LBKc6SQmPOUOCTuNkGlyiNhnLGdxom6+ItaU5sRJzPbANATD39sZjc6bftmF9C9GYC1Mc
	 +bUGyzqxZ+tLW0a7ukYm6IRLaVK6YJIxqGiQGBN58WmPQOg4d7+ab89rbt1bZs5OMQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ue+7J1Jd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948A8606A8A3
	for <exfat@lists.linux.dev>; Tue, 17 Nov 2026 22:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ue+7J1Jd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C47D1F000C5
	for <exfat@lists.linux.dev>; Tue, 17 Nov 2026 22:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954596;
	bh=QgCr0DpcBXV214M0n10zOgwhTeGtnk5rboT1ob7NYxc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ue+7J1JdQLy6J5AfwVs6ZStS30tAZoxfS3fq9QmWBk6ZL/wr0FebCEbbgS1hEKE/1
	 yq5BaUSyMi9UiVTIurr+vjBx5XUZGmQpaDW6Hh2vLA29IDJkiMxmWjPld2XnJRhvKm
	 QyVPIiXb13QwQ5HWZ42wce+1pDMcmiQ6F62JRGsTu9noV9WJU/0AprrPvHFkOz5ezz
	 emsZIlutt+2VL7IfUShrCQvwAKdCSAfi5yAggijFFcr1i+C5sPtktGzIVa+dTW/v4c
	 YJSaJEzlvIcFGZouhep9sVaSPn9ryOHUURRMlqdoQiCiJStLPJ3x1Co8xROPM59jsd
	 p8lRM/vHt8A7Q==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d427836e9so29047066b.1
        for <exfat@lists.linux.dev>; Tue, 17 Nov 2026 14:29:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFXpgSq9gfTLNtjLS788KLX5rGHlibs1W7Uqh7pSKI05xmBtqUuYfEgh/1IgX6fIGAb7OtH7A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Q0STi3KfpiZb1enqV4pi2sNv5H9gPTED0SAixMZ0z9Zp75U9q
	Ai5n9QBbtD042lzOqd4nploVhlUQUyVSN488wH3/TF8b4FUM7XNnm9oZTR+glqyTtKy8joc/xmW
	/+4XXLjuM8jZ01T9svqkyqyU/3oTSrAw=
X-Received: by 2002:a17:907:9607:b0:c49:a235:8e0c with SMTP id
 a640c23a62f3a-c510e1f18bfmr51977566b.22.1794954594914; Tue, 17 Nov 2026
 14:29:54 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116085752.3908082-1-chizhiling@163.com>
In-Reply-To: <20261116085752.3908082-1-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 18 Nov 2026 07:29:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-R319UyMqTw5LJiuhWMYgbqe9HP_pKyH9LQXPxYaE_6Q@mail.gmail.com>
X-Gm-Features: AclHuK8CBeUwkMopgpP3h-E5Ufv0KRH7jQ07bswOO_DvGn0S7YxPUnFSsbqmUKo
Message-ID: <CAKYAXd-R319UyMqTw5LJiuhWMYgbqe9HP_pKyH9LQXPxYaE_6Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] exfat: fix valid_size update races
To: Chi Zhiling <chizhiling@163.com>
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 5:59=E2=80=AFPM Chi Zhiling <chizhiling@163.com> wr=
ote:
>
> From: Chi Zhiling <chizhiling@kylinos.cn>
>
> exFAT uses valid_size (ValidDataLength) as the on-disk boundary of
> initialised data, but the current code advances it too late and without
> proper serialisation.  Buffered writes can silently lose data reclaimed
> before valid_size covers it, file expansion and page faults can
> initialise the same range concurrently, and a failed or short direct
> write can still grow the file on disk.
>
> This series advances valid_size under the folio lock, keeps zeroed_size
> in sync with the block tails that were actually initialised, and
> revalidates cached iomaps for buffered writes.  File expansion holds
> invalidate_lock across allocation, EOF cleanup and the i_size update.
> Direct writes are prepared and written back through their destination
> boundary folio before submission, publish i_size and valid_size only
> from ->end_io(), and hold invalidate_lock across completion, post-write
> invalidation, gap initialisation and rollback so that mmap faults
> cannot interfere.
>
> V4:
> - Fold the series into five patches and rebase onto current exfat/dev.
> - Add a patch that serialises file expansion with mmap write faults.
> - Rework direct writes: prepare and write back the invalid range through
>   the destination boundary folio, initialise the gap after the post-write
>   invalidation, and keep pure overwrites asynchronous.
> - Track initialised block tails in zeroed_size instead of
>   IOMAP_F_ZERO_TAIL, record the on-disk length in i_size, and finish
>   short direct reads with filemap_read().
> - Pick up the Reviewed-by on the iomap patch.
>
> V3: https://lore.kernel.org/exfat/20261016033349.3104509-1-chizhiling@163=
.com/
> V2: https://lore.kernel.org/exfat/20261013033837.2748258-1-chizhiling@163=
.com/
> V1: https://lore.kernel.org/exfat/59056131-e3bd-4003-8c30-0a356cf0bd82@16=
3.com/
> Link: https://lore.kernel.org/exfat/10029d6f-13cc-4d17-a2f9-b093a8339dde/=
T/#t
>
> Chi Zhiling (3):
>   iomap: export iomap_bio_read_folio_range_sync()
>   exfat: increase VDL before unlocking initialized folios
>   exfat: zero invalid VDL tails in buffered and direct reads
>
> Namjae Jeon (2):
>   exfat: serialize file expansion with mmap write faults
>   exfat: coordinate direct writes with mmap faults
Applied 2/5 ~ 5/5 patches to #dev.
Thanks!
