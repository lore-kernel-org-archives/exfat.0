Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D9C3CFF62
	for <exfat@lists.linux.dev>; Wed, 30 Sep 2026 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762511; cv=none; b=VZr62kjp5g9lfYUVBz1EumCnCaM7G6ba4yOg8lnyA7LcJxCfW5QNFBPTVDJu5jpNwK57k7+NzqPOEzrUG+iE4Sg7q+N1A2zjTo1t3VPiGxhSekLe9iPsIy+nuFGky7FBS+bzr92EDprSduqPQ74inq4d9Huu3ylHh9rOaA3cfyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762511; c=relaxed/simple;
	bh=kCHCHQfJzfg0Bs1eiO7xT/Q6SblBi2fuN7AUltRtD2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7ofYca0Q7+U7MboRWzwds+y+zt2PCp5GiyaxTRLAGQheXm8jltstuV5HvJP1AA3ihhk/MjNkzsfXAcxD2w0OLRLS+nEeRVjXoJpfq1F0cEqkjhSXWaYz6beHUwaugJKyDgggMBjLLuCmv3k4sDA3mBC5JWG0/0Cz+atHgllDVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XbAAhxih; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbAAhxih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2881F00899
	for <exfat@lists.linux.dev>; Wed, 30 Sep 2026 10:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762510;
	bh=/77b7tpaX0IwG1F2p/oj+zPmslsEIceRWx3ywaCJbao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XbAAhxihvq3X6cp/ooGX+9gjCx7cGjKtNmz8t2jgW1kQu1xNMKZpGviQnXvnSP3ZR
	 iFfg64TfFpfdeTQKifI/NcNRZ4QuQ/aobMXSDWaQaMMf2o0hNAvesC6pW9Uu/ZHUaq
	 QhnV+45aH67m38gnJ/KOv+Ch9RwxPPKziFMzqSmpUwsoVe3gbUKvItVN9bXrFv1mPA
	 rZ/40vO8nuwgsKul2mD874GeneupgUdGNA5KdyvlKWFREsUV1VO2sUwIVf07BsVqnb
	 yKD68VrwO1BCqZG7f2QQo//UcLRu2Q84ebr6Ibt7Is2o0KPKJxvRDed+Z1ehkK2WEP
	 psGZU88KXXSjQ==
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e1195040aso121689166b.2
        for <exfat@lists.linux.dev>; Wed, 30 Sep 2026 03:01:50 -0700 (PDT)
X-Gm-Message-State: AFuF++mWZcNbr+WrxPy+p1YooYTRJvpDU9bcr7kM5UFFp3GKdxJHVmFb
	zYUhHt7sQ2z8/MFoHS8EWNzFEQUhwrkVm0yQzz4ns3tahiDr7nGxi0ujZud139gNd7hmHobRScV
	OiUQrmS6or5O5X2xsS8fxWQlEFSwK1xA=
X-Received: by 2002:a17:907:3e18:b0:c2e:856:2a08 with SMTP id
 a640c23a62f3a-c2e23749254mr69929866b.1.1790762508881; Wed, 30 Sep 2026
 03:01:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927080305.831641-1-chizhiling@163.com>
In-Reply-To: <20260927080305.831641-1-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 30 Sep 2026 19:01:35 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8u2iLQ5aO6XR7vFojB3=9Jcmk7nK1mbzAk=Tza_UoYJA@mail.gmail.com>
X-Gm-Features: AclHuK-_Hp3kM3VG9WhX8ROHQ1VcBmyadbVuAWRyD35V6F-5xhp_l3vFFO17T84
Message-ID: <CAKYAXd8u2iLQ5aO6XR7vFojB3=9Jcmk7nK1mbzAk=Tza_UoYJA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] exfat: fix valid_size handling and locking
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, Yuezhang.Mo@sony.com, 
	chenxiaosong@chenxiaosong.com, dxdt@dev.snart.me, hyc.lee@gmail.com, 
	liubaolin12138@163.com, sj1557.seo@samsung.com, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 5:04=E2=80=AFPM Chi Zhiling <chizhiling@163.com> wr=
ote:
>
> From: Chi Zhiling <chizhiling@kylinos.cn>
>
> valid_size marks the on-disk up-to-date region of an exFAT file. It is
> advanced from the write path, from read/zeroing completion, and via
> truncate, while it is read without i_rwsem from ->iomap_begin and from bi=
o
> completion context. This series fixes several races and stale-data window=
s
> that follow from that split ownership.
>
> Patches 1-2 are self-contained fixes: an append write may be moved to EOF
> by generic_write_checks(), so valid_size must be advanced using the
> recalculated position; and exfat_zero_new_range() must mark non-uptodate
> pages dirty so the whole page is written back.
>
> Patches 3-4 are prerequisites for patch 5: truncate now holds the
> invalidate lock so it is mutually exclusive with mmap writes, and
> valid_size/zeroed_size become atomic so they can be read safely outside
> i_rwsem. Patch 5 then takes exfat_page_mkwrite() out from under i_rwsem,
> since blocking on the inode lock under mmap_lock could deadlock and its
> VM_FAULT_RETRY result is not honored, and advances valid_size under the
> folio lock to keep the page cache and valid_size consistent.
>
> Link: https://lore.kernel.org/exfat/10029d6f-13cc-4d17-a2f9-b093a8339dde@=
163.com/T/#t
>
> Chi Zhiling (5):
>   exfat: advance valid_size to EOF for append writes
>   exfat: dirty all new pages when extending valid_size
>   exfat: hold the invalidate lock while truncating
>   exfat: make valid_size and zeroed_size atomic
>   exfat: use folio lock to protect valid_size
Could you check the review comments from Sashiko ?

https://sashiko.dev/#/patchset/20260927080305.831641-1-chizhiling%40163.com

Thanks!
