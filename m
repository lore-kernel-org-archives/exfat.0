Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C8C1990A7
	for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791940798; cv=none; b=m4ifzm038t4k+B0EyjlFuL5hYlqGEz3fzW2C0BCQa3heUBNf1ygDFv192g7NXIui3nFWmYNsmoWnZp3w1C4F/jFpAjIXWKobqH7YGSDr5+H5JM/EJfXryVT/89fXh9oNt8YToqN2isYxik8VIUqVDJQN40MRj2cvLviswWNcu1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791940798; c=relaxed/simple;
	bh=FF5cN5b3l9mPILletiPeyZw9jikLowzhH5xUpLmzQmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvdBGWVBHhftUJC97Avs22M2LbYhEUYD19koSoNT9Xx++Ipu2kbWYsBg2A005ywFrZl6sjgqOvmrJ1ENfZLKY9lY8oQMKgFWd++aInyAO+0BHSKlUq2/uHfu+n0xJcfnAQpw+Sl4+nZwkRGfvBe5Nceahf00gj73Bm2gaIokD6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CS7xwKx8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CS7xwKx8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4645B1F000FF
	for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 01:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791940797;
	bh=+GIrArmis+acz4agitXRsgC6cPvzUK+MPYMLiPB0QV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CS7xwKx8cAnJdAbnbt0SoNUos1aQvGd8QOQCCHBV4/v/5mwNieEVRAkS/eRbh1t3Z
	 UQQMA+NHRcYe+vtLIZUvygk2GZL9GuL6WcG/18+So2v2cAur+hLHkXWpAOhF4sFj+9
	 xNOsSbe8927iX6JvxeO/BCuaix7jY8GRX57jsp9XW6RqO7Opf/W9h1gTFW9xnHm7YS
	 GmrbxHEYD9mRW784GnvqCZVbRrQUqQaoITne1hg5niFf7Ht3seJcTjCVeJyUAb5WdP
	 gfxHlBIHJUOeMnRdJV26aWfixJSdP31f+ISDXtyxpuSMLCj5Y40re6Rm68uXbDBOYR
	 v/WJBOkruqUbQ==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c20ce3c118aso498389366b.0
        for <exfat@lists.linux.dev>; Tue, 13 Oct 2026 18:19:57 -0700 (PDT)
X-Gm-Message-State: AFq9FYJxZaYs3FjyAZPsBjhQYDT92zZ12P8n2plkXw2kic0+mF8zX+tM
	jX2q45ojvWXTt6uD3cfROSQaw/5P+4P1T4TpdJPlUiD2NWdMAb8hEs0hPgIflG2Bt88wGwD9igq
	ktYOsAa308Cgy3OyzcqWe4GlE8ZEoS80=
X-Received: by 2002:a17:906:dc8c:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c31a97060a9mr1304523866b.0.1791940795972; Tue, 13 Oct 2026
 18:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013033837.2748258-1-chizhiling@163.com> <20261013033837.2748258-4-chizhiling@163.com>
In-Reply-To: <20261013033837.2748258-4-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 14 Oct 2026 10:19:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-NdwvD9OO+_5UC5yVLp1OYf3KUFvPe_LRUkNjd9vuxvQ@mail.gmail.com>
X-Gm-Features: AclHuK9BvpCUy3XHo7AZGtmwtJ4Ax5bg0dQWLa6Jzdaz5kXCvoB1U8gMZNwAQEg
Message-ID: <CAKYAXd-NdwvD9OO+_5UC5yVLp1OYf3KUFvPe_LRUkNjd9vuxvQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] exfat: validate cached iomaps during buffered writes
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, Yuezhang.Mo@sony.com, 
	dxdt@dev.snart.me, sj1557.seo@samsung.com, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> +static bool exfat_iomap_valid(struct inode *inode, const struct iomap *iomap)
> +{
> +       struct folio *folio = iomap->private;
> +       loff_t old_valid_size = iomap->validity_cookie;
> +       loff_t valid_size = exfat_get_valid_size(EXFAT_I(inode));
> +
> +       if (valid_size == old_valid_size)
exfat_write_iomap_begin() reads valid_size before
__exfat_iomap_begin() records the validity cookie. concurrent mmap
fault can advance valid_size between those reads, allowing the stale
value to zero mmap data before iomap_valid() is called:

buffered write [0,128)                       mmap fault
Reads valid_size = 256
                                              Raises valid_size to 4096
                                              Stores 'X' at offset 400
Records cookie = 4096
Zeroes [256,512), erasing 'X'
iomap_valid() sees cookie = 4096 and accepts

The validation runs too late to prevent this data loss. Could we
recheck or serialize valid_size before zeroing?


> +               return true;
> +
> +       if (!folio)
> +               return false;
> +
> +       /* Still valid for this folio. */
> +       if (old_valid_size >= folio_next_pos(folio))
> +               return true;
> +
> +       if (valid_size <= folio_pos(folio))
> +               return true;
> +
> +       return false;
> +}
> +
