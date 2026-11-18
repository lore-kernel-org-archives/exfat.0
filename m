Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995789;
	b=HyxcMQgwr/4SD0d5Z0K29azIQmEE+Ypf0IBCfUUzrIc28cls/NEQnpq+ZJ2BSSIIsMVf
	 cm8P0dzlxc94R/0hXCaAzAdLmRwHDPQ03+zzEva15Q82XmtxvtuTcN5v2V+alOGKjnJcc
	 ondH2nLHSEEVwmGGQWJeqJzwAi15kbQmHS8HLO4mK24iSX6nuj87tnmYZ8RnJaqp3wDf4
	 tIselGydDlJ3CvpGRVBiQHE+R/7CfJzNgA9IHTOfwuQdutIarT50Xh57/OkI73mlzf0L0
	 IzFDclsxkM5D1sMzylYan+s1mAbUqmGJJP9V87dhRDIFy/D0zphxHQxHdhcjP3zJQRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995789;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LVjYfSHFtJGzfxCKWN53IDRtrshFC2glsaaN9aRIShs=;
	b=Yw2IcDoZ3b0YVuRpno+M3bEfgRDoz+I2KN/uLfFlqW+EagHSza+2cAzyPLiVvs6uD17g
	 HVKUhKy0b1n6KpLRt/To+FSETSQvnODOwTzbPpLgPirIPdo9duLT5qIu/MpTzscQR+tLo
	 c6pSi5oo9bPfAlyqZIEuv22vFAX1ZKxfvLsw7lH7wCz7nZ3DVIFKrFBTfbY2XYfS/Lmxy
	 f89TN3ZM6h5U6pJa8pQ5VWURi7F0oHcoWqnW4NWZPQFi1XPCJGJzacEim28xa6VPMSifq
	 BOleiB8Co0nyj0+JImlkIZAVTbPO5K3+mnusvlXYy0bvB3vkmDhmU93gtPFGYdAKYxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n7vI7En0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC78606A31C
	for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n7vI7En0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39191F000C5
	for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794995788;
	bh=LVjYfSHFtJGzfxCKWN53IDRtrshFC2glsaaN9aRIShs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n7vI7En0hPQo7a9PVMecH0yexeoX2tVfG1nvVHVknJURmhrPQ02ocyrU4v58hC0IK
	 /F4Mp1FmndSFPPWxZWreumUwXA6Wg0kkcUgxU8ddwujW7l6yzZqqhpvsp+/v0zK15Z
	 MGOXGKLcff8EHqjS2M8GHvTzKPgCbfVy5s5XxQN1UpOE8en8+LRcWcb+Rb7xhTOXwF
	 6+fmUdF/oCcsRyefhdDoVF8GHel8W1Aw2+YB6UEcrwssKfozmJKLu8kUHBrfLImXIu
	 AbPVQ1PI+SH9MHwavPWMoPz/3d082oTmMi/hM54xsby0Y50YCBxp3OAwFoSvJLEpM4
	 qeP/19Y2n9eHQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1103459a12.3
        for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 01:56:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGXU4FCv667IeFC3MazIkaJBuw7R6gD/aLaC46eWsNGseW9er/OcEd+hKiJOdTJWSd0x2sL2Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z+M+VehCi7gXavJRp22h045es07sZHx9uOHgMJYK5YzyHxSX+jQ
	4jxx/XHmH4FYR0qzVfVYi61p5G+w5iGeNdGTTVjQVoKnTgyB75r6njfOH3iz7aXEUPbbTZsNJdR
	Z8ZKBTTxzvGxy1ave8w4US5ojGjL+Hes=
X-Received: by 2002:a17:907:eccc:b0:c49:bc1f:fe2d with SMTP id
 a640c23a62f3a-c510e2bd578mr158715366b.28.1794995787589; Wed, 18 Nov 2026
 01:56:27 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118015802.899847-1-youling.tang@linux.dev> <2df33679-680c-4fc5-a279-e0e38025f22e@163.com>
In-Reply-To: <2df33679-680c-4fc5-a279-e0e38025f22e@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 18 Nov 2026 18:56:14 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-xcXFh9fxGEz9CUc7t7N_PDqNdBEfj+85nkQ1jp8M7nQ@mail.gmail.com>
X-Gm-Features: AclHuK8r_-YDa3_7OxNEaErJr4ykB6Ed4EZ8_VOz2z-KgaiwfjiSKLanpAfgezA
Message-ID: <CAKYAXd-xcXFh9fxGEz9CUc7t7N_PDqNdBEfj+85nkQ1jp8M7nQ@mail.gmail.com>
Subject: Re: [PATCH v2] exfat: hold s_lock for cluster-chain updates in __exfat_cont_expand()
To: Chi Zhiling <chizhiling@163.com>
Cc: Youling Tang <youling.tang@linux.dev>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 12:22=E2=80=AFPM Chi Zhiling <chizhiling@163.com> w=
rote:
>
> On 11/18/26 09:58, Youling Tang wrote:
> > From: Youling Tang <tangyouling@kylinos.cn>
> >
> > __exfat_cont_expand() allocates clusters, appends them to the FAT chain
> > and updates ei->start_clu, ei->flags and i_blocks without holding
> > sbi->s_lock.  Readers such as writeback call exfat_map_cluster() with
> > s_lock held but without inode_lock, so they are not serialized against
> > the expansion and can observe the chain metadata mid-update.
> >
> > Hold s_lock around the cluster allocation, chain append and i_blocks
> > update.  This nests inside the invalidate_lock held by
> > exfat_cont_expand(), matching the order used by exfat_truncate().  i_si=
ze
> > is published via exfat_pagecache_isize_extended(), which takes the
> > straddling folio lock; since writeback takes folio lock -> s_lock, this
> > must happen after s_lock is released to avoid inverting the lock order.
> > i_blocks is therefore updated first, under s_lock, which also ensures a
> > reader never sees i_size beyond the allocated chain.
> >
> > Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
>
> Looks good to me:
>
> Reviewed-by: Chi Zhiling <chizhiling@kylinos.cn>
Applied it to #dev.
Thanks!
