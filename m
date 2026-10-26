Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012358;
	b=d81VSn+3vwlgcydZWo/u1XOK5hKqenh3yR3XPOwShz6fPrIxCt4V6Ep6Ndq2qjXblZr8
	 Q38ePhZXwU3070aiwqEvS7vy8R1iwgqgKMtKPCz1VP6rb/mg2nWd/F9qkvcS3EDQzIJBh
	 s6FvGyE0qzEGSqFXNV/ZhVtJyIkPkebvIs+qUC02LeTLCTL1azaCwE0XsnmWiUYjMnjuE
	 peNAdAxgtGC2vBChl/gMDJIHgFDioVeroH0kVCbPQ8zlKk8WYtS/MEM1n7tQwh9dHT+K9
	 ZUxuoYiw0L49WBHk23CwkpRJ8VF24gDXyYq6TP/Ys+wmWbC+Vy29MALVE2MawNvMcWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012358;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=TFMunBZpF+eoRnMN2Oji4st5E8hKoW6Ck2v2RBxXx1M=;
	b=daYz4BzBaVMTMmnBz06VYbbmN9lVsnWtBhbiqbnsXlSYOKegHuL3g9cfVaLfVW0cm6tS
	 E1g2LJtaod50pbiS42j1DPIJ8fCXplQVpvYKghhtJxdbebKxmRQW/5ft/br+g9CCA9xCa
	 Q/xZ5csHMxkT5KY7zNKCbV7LN0JRcpFVQUu5KbsFyi8Fe4onc6pFdZYHkvmSjfQWwnuaL
	 Ft080cB8cUvJS4mRL6gVawoBCRqdPBAAdkEU309HHwTmMdazl3DHuee+6Jo0VY7juhhe1
	 RjFhdB91H6RZv4O/83abKbKV6UajeDghtA39F9Rcj0kmlZupCRNzDcfjoHifRtW32Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="igEbSm/6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ED2606A322
	for <exfat@lists.linux.dev>; Mon, 26 Oct 2026 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igEbSm/6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A43C1F031E4
	for <exfat@lists.linux.dev>; Mon, 26 Oct 2026 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793012357;
	bh=TFMunBZpF+eoRnMN2Oji4st5E8hKoW6Ck2v2RBxXx1M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=igEbSm/65FUH52mY2qyOmGyiDXOGGNZDXzSdAlXg4UNmdkEilO5HsyB64AIRtWVdO
	 QDHxoXowYKgwr47NNGFW9dARtitAFSe57k3yh9u8O7ZWfV6lpYz5ho3N+QkmBQFPKI
	 953DHPqt4kteV8/uExAuJsJzGwCuzBhJU5f8xkVItlfAAyAyWMV1ubWCeYr/8eymxL
	 8Q8cp9N7lJMw9omcD+yb14t2dpP4avzhPpvJxXJB7AA9XyNlyxJi/Z0c0rKX09FaSV
	 cFeo2IOrl60QtVWiwjucTTi8V8PJ2hzOig+UYZJIM6Y+jwDmunkC13FmX3ErHBneIt
	 Jboy/wgZkGg4A==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso367683966b.1
        for <exfat@lists.linux.dev>; Mon, 26 Oct 2026 03:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzDh04RXSb57jqwhEN9AFvvYfADtdMxZLLc25q6G0heilA6WndCLD+kR99oyN22Q4aC4WkEow==@lists.linux.dev
X-Gm-Message-State: AFq9FYJCDNDhCzs72JMs3Ck7yc+8u2KIYyjaZD/f8256CJsUKBZx+5GN
	XIPNRswXbYtBMl5Dr37+9Z9hd4rggSz98gVap8zQAhRzubf4CMtPqkrYqZDwy0Zg77CIYJWzJ1O
	7k09NPxo9ju5z+EKDKZcafQ0rrzvAJZ8=
X-Received: by 2002:a17:906:9fca:b0:c43:bf29:1517 with SMTP id
 a640c23a62f3a-c46bddf6528mr746059266b.12.1793012356106; Mon, 26 Oct 2026
 03:59:16 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026091542.1031813-1-chizhiling@163.com>
In-Reply-To: <20261026091542.1031813-1-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 26 Oct 2026 19:59:03 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8YmzQJuT=afcCSEYLbAqEwC1A9B1phuKibtODdJqqEFQ@mail.gmail.com>
X-Gm-Features: AclHuK8tuPZwDJxdUHrNbLyiATR7J6HD3lgcYKaTYr9FmOKWbdHy2p84BehIlJw
Message-ID: <CAKYAXd8YmzQJuT=afcCSEYLbAqEwC1A9B1phuKibtODdJqqEFQ@mail.gmail.com>
Subject: Re: [PATCH] exfat: drain dirty pages after forced shutdown
To: Chi Zhiling <chizhiling@163.com>
Cc: linux-kernel@vger.kernel.org, exfat@lists.linux.dev, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> @@ -283,9 +283,6 @@ static int exfat_writepages(struct address_space *mapping,
>                 .ops            = &exfat_writeback_ops,
>         };
>
> -       if (unlikely(exfat_forced_shutdown(mapping->host->i_sb)))
> -               return -EIO;
Please move this check to exfat_writeback_range(). Returning -EIO
there lets iomap clear dirty state without writing data after
shutdown.

> -
>         return iomap_writepages(&wpc);
>  }
>
> diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
> index e50ecbfbfbe0..6383739f5700 100644
> --- a/fs/exfat/iomap.c
> +++ b/fs/exfat/iomap.c
> @@ -165,6 +165,9 @@ static int exfat_write_iomap_begin(struct inode *inode, loff_t offset, loff_t le
>         loff_t end;
>         int err;
>
> +       if (exfat_forced_shutdown(inode->i_sb))
> +               return -EIO;
This check is not needed for this hang fix. exfat_file_write_iter()
already checks new writes after shutdown.
It also misses existing mmap writes, which use exfat_iomap_ops. We
need to add a shutdown check to exfat_page_mkwrite() also.
Thanks.
