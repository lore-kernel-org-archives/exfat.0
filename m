Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102527404E
	for <exfat@lists.linux.dev>; Wed,  7 Oct 2026 04:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791348497; cv=none; b=NcugOEyFqOvet2ti3IRZB2mvk+70CeDAMWcFwkMz+maDTDH5klO/kzNm7kzrh5jsaa+kqMC8/bsleOhVZCYcC80MsVEGfAS5wIfefAfYaQUH/vAFye0PhuL2ePb0FjhZUpnYncKWb5jNVMuGdfWr0BoeKUCg5ewweywpEQcJPfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791348497; c=relaxed/simple;
	bh=LUOwIF/+RKSg4yeAuSHwTalkrYAuYrT8ZtBENuizEq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjmxcgv2pFsLKRT4fBfoVkXvi9k5apXMGuAgN6aiSefyqW34ezHfEWv467gtlFf43VZxAKamQQuXzrOU84ua3SgTL4YSYuwVQk3TvnznzzowBIIznAWijXqdODn/2eMhqvo4BB9xpC586usqNAZsyTczTuEZNbPIOY6b9yygbPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c66NvjnN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c66NvjnN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0F11F0089F
	for <exfat@lists.linux.dev>; Wed,  7 Oct 2026 04:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791348496;
	bh=LI/GifCYkuyachy7bv9KoRPB+5bzVn2Chv8jale9T0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c66NvjnNcdEWzLOlRO43M/oCgHpFTx5N6QOluYzF2FsuqaqZ9kSlksDekIxYjGa/p
	 IYpPf1UN5oBSRCF7kclHg9yHYtFk3bJf+Bm9MoR04KDz4O3EvKgi2ZsDVkbRMO4yAP
	 tDTGNmfQHK0XXsKVjCQcwXnrHmM9c8Xwl++dXWl8UpBSRFfJ0ABcsc0Sd5gEhw3M+V
	 wwPc/z2YtdeSpIldEl0NGdqc6MSsGSykBah1iY+lr5zcS8lBmy+ziV/XfCSNy/xkpN
	 KqLR60M/DKcqC2dF+Rvfr2C/0tdLaecI9u/m7vhEUPdCI5Z3LqWeYdBqxLDaDiuCJR
	 cZz42FatNFYrw==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2e5d08214dso526770366b.1
        for <exfat@lists.linux.dev>; Tue, 06 Oct 2026 21:48:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwX63QgzUbxLCYHYILuewzobz18urpORrVZ+kUz0SVOuJ2tqEP+gpy4sJ4NBqoNZgofuygMYA==@lists.linux.dev
X-Gm-Message-State: AFuF++mPWhQfwxjBLUAxEa6YqAhSGSWUlIALBxdMY7QBVeo1jYkbNieF
	ugLVB1QFku4xXBh1We9M2J7Ro99XuU3DMLirhAYg0XYfMaAr4AjhzjlB08+Xkk7CEqcb844xuPm
	WAOv83qThUA70kx82BWZMIp8KlKFW3qg=
X-Received: by 2002:a17:907:3e20:b0:c2e:4f16:fbf with SMTP id
 a640c23a62f3a-c317c09e5c1mr89396466b.31.1791348495342; Tue, 06 Oct 2026
 21:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004135638.1888530-1-anmuxixixi@gmail.com> <20261004135638.1888530-2-anmuxixixi@gmail.com>
In-Reply-To: <20261004135638.1888530-2-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 7 Oct 2026 13:48:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9d9qzt2mxQNQoUiwHR6EkzxD2LAPWijY2DxSV8gYLkJQ@mail.gmail.com>
X-Gm-Features: AclHuK9U2Ugsb7y5_33gEeoGDoTuYmFee95M_cfEaV0iY9mMTQN8iU9mA3G9Xco
Message-ID: <CAKYAXd9d9qzt2mxQNQoUiwHR6EkzxD2LAPWijY2DxSV8gYLkJQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] exfat: add a Bloom filter for negative name lookups
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, chizhiling@163.com, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>  /* read a directory entry from the opened directory */
>  static int exfat_readdir(struct inode *inode, loff_t *cpos, struct exfat_dir_entry *dir_entry)
>  {
> @@ -1035,6 +1216,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
>
>         if (num_entries < 0)
>                 return num_entries;
> +       if (!exfat_name_filter_maybe_contains(&ei->vfs_inode, p_uniname))
> +               return -ENOENT;
This early return bypasses the normal lookup path, which resets or
rebuilds ei->hint_femp. For example, a prior FS_IOC_GETFSLABEL on a
volume without a label can leave a root-directory hint with cur.size
set to zero. 0002 patch marks that hint as usable for any create
through min_entries = 1. If the first deleted run is too short and the
search crosses a cluster boundary, exfat_chain_advance() sees a zero
length chain and returns -EIO. Could this path invalidate the hint, or
could the volume-label scan avoid publishing an invalid chain hint?
