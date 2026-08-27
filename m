Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD79377EA1
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 01:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787792907; cv=none; b=Ok6p93bwcyi6vx+Y64c/NeiFCnha/OMACDVoohdLKC+h20NRtg62BzG0mlNEG8+KjKLI3HOisBcEZG9NRaGf7kRcgtDcb8gYXV079H2pgnIc1z8adcNRHh+6Dyd2auTzShkp7LXs20kGz9gE/KbBUR3pfa1qlyZCYdqjkoXxedg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787792907; c=relaxed/simple;
	bh=VOVf2jgsbDW7zRL1jNwLvOVtNkmNk5Jy/OBqDy4omJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhOyaZ2KaF6ENTc+F1vXs24cXEG+5iX3D421W2seT1YbI48sJyoZdjYAilSCWhwsfn++T5fijNobeM0wyujLDq0k+t88o2dfuhi6rCdst6Wn/K1+dZu8KVotZgxeGEY7z0PbIKPB/VqxnsaZerUlbL/nDgtflqpB6X6Rt5tN+aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFVHwHqZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFVHwHqZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB1F1F00A3A
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 01:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787792905;
	bh=U0nb/TwXUmCEr1H01OzNJo0vAVtUQauj50no/8k3br0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YFVHwHqZ02MVnH6FlpkdMb5MY41lnZ6TshruOkSitD9wR+1M24ca0RiJVsNWmCMvv
	 Ef4A5rvwYuje/kpRB+eIOgVqjTIZWH8f980KOs+oT+VWB99qIRojkIZ5zOJ++q80mY
	 ez8EpHUqxAnDillUMRTQ1unwm97+VoxkF9ECldhBjZfZd5T75oDqEjq9+o9TYzxwX/
	 gGEFN0t/nDXOHsLMGstk6/6TgEznIJocwhc273CSq70YQq/vxbajXZzewV3VzoqiCf
	 L5Xz6q2YeWrrQPVw5GM8NSKjjJivinDJGWVLWrt3VGCPY0BoFKVv7FqIO3eqI0YCRQ
	 4hGOHMtMsHt7w==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so1875764a12.2
        for <exfat@lists.linux.dev>; Wed, 26 Aug 2026 18:08:25 -0700 (PDT)
X-Gm-Message-State: AFuF++kyKe1jZIWDSKnbPJjUWLrqw3ukx7P20ej9cVmOue1bE+zGHl+N
	SgXPS7BfLZjPMiaNDPL8i9lImpKqQG+KSBZyB1F0ydf8AytNdLovQHFra4i29hDaVKQw30wCc9e
	XEJSZ+xwdHKbytUM4nUQp1UDE01ed8xA=
X-Received: by 2002:a05:6402:a503:10b0:6a5:f1bb:8376 with SMTP id
 4fb4d7f45d1cf-6a5f1bb857emr4670209a12.3.1787792904440; Wed, 26 Aug 2026
 18:08:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821100531.998196-1-chizhiling@163.com> <20260821100531.998196-7-chizhiling@163.com>
In-Reply-To: <20260821100531.998196-7-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 27 Aug 2026 10:08:11 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_MxctBGgP6_daddk1q9Dwr0ZMAQchXqvEZME_Yo6xSuA@mail.gmail.com>
X-Gm-Features: AcwNN1VvGk8tUaKOvxF7zAh4jb3QjLjFC7J392nsMV9mI8fktnumpSzTbPVQSUI
Message-ID: <CAKYAXd_MxctBGgP6_daddk1q9Dwr0ZMAQchXqvEZME_Yo6xSuA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 6/6] exfat: take s_lock in read mode for iomap
 mapping paths
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> @@ -68,7 +68,7 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
>         num_clusters = exfat_bytes_to_cluster_round_up(sbi,
>                         offset + length) - exfat_bytes_to_cluster(sbi, offset);
>
> -       down_write(&sbi->s_lock);
> +       down_read(&sbi->s_lock);
If may_alloc is true, Should we use down_write() ?

>         iomap->bdev = inode->i_sb->s_bdev;
>         iomap->offset = offset;
>
> @@ -135,7 +135,7 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
>
>         iomap->flags |= IOMAP_F_MERGED;
>  out:
> -       up_write(&sbi->s_lock);
> +       up_read(&sbi->s_lock);
>         return err;
>  }
