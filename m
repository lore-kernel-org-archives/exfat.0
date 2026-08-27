Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0CD30C16B
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 01:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787792653; cv=none; b=IKa3KwT+z9Uf7ymY/iSm2JlilnKgP211cjAl2FcBk8Yl5xQyCBaLIbiqHyYe6YYfTn1UeYS7MB0PN4af70BaiYieaI3hyKv3vwFBReJ5P/NXS6sQO0GJz7kYlyp9jr/65iH1nRxnXZB8maMOgADLYgwvelejNJsx8qMNETZ5veI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787792653; c=relaxed/simple;
	bh=KEDhPa6bxtSWZm5pwW0kBZ7YeqtxZW8NTocAGzmYC7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LTbNf6U3GqEfml1otsnR2H8Ra8kFLmET9+gkVlbxkfsm2Btw9uN/DVP66zjLhIDFRPhq49+0fydPtgOjLqap+soFmIc1hxQvRVd8l3XHySrntl2MLWLdPxFTL52i3+nF9VlHyPhLyiXY/w3WSRcjfyCS7Xnti7FqzJCWq2vA5mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTNLY2kS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTNLY2kS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78521F00A3D
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 01:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787792651;
	bh=uc+asQ0eheqFl+dfTGAKnBwVuF6FHUa0alwHBxL09AE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gTNLY2kSd1uFssiCT5GZdb+FDWMW23EiO2/Li+m2KihYYg5NbZMBCgOT5WDf+BTvy
	 c+YXd0OIJIexkv5mLu7hMG+B3PTSy1bdy8wUnphE6vt2CzP1pw4jIvEjuT9DcXvvEx
	 GDowkD+FC2tIFH7u9Lr9mBjaVGOFJQOAqT1LspH49LEJdAZUjBz8Py1RP2mWD6GejY
	 nMMxpJjAKYZtOgaJRD5BBBsm+eI/4K/Fz+pvPT6mz23gKnNqVgj5hcRRmZ5AXa8H5F
	 0ODsIjlEcYAlHXxbIUCNw2Tk73jQvX1YGsVqAb+lpTE6B7sKoC4p+0cgo3zBy7eMjf
	 V1Jy48b1qtsKQ==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15cd3fd760so189131166b.2
        for <exfat@lists.linux.dev>; Wed, 26 Aug 2026 18:04:11 -0700 (PDT)
X-Gm-Message-State: AFuF++lwQszbRR2ectLgj8AahzLTZ8pavZqHgDh2x2d73cM+ZPEYH68V
	DVEvFtLfr3aN4DtIn5bfD/66Q/YxBeO6C6CETd7N85oM3lcLcV5oQw1LXgp8TZhcasy7NkG/Yjo
	GI/yhlZzDQhl0A95/361FvzQjtZXRmvQ=
X-Received: by 2002:a17:907:961d:b0:c1f:8145:820c with SMTP id
 a640c23a62f3a-c250bb4ffc0mr1119242266b.2.1787792650365; Wed, 26 Aug 2026
 18:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821100531.998196-1-chizhiling@163.com> <20260821100531.998196-4-chizhiling@163.com>
In-Reply-To: <20260821100531.998196-4-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 27 Aug 2026 10:03:57 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_gZFJ8P-pk1RijAVtB9A4PdHG8fcwHRAUsS+Kum_3ALg@mail.gmail.com>
X-Gm-Features: AcwNN1V_DyKj4-mCcnac-Y8Ywesb5bksc46E6o8SHLJ3wcSyPMGU4e02zYDlvzw
Message-ID: <CAKYAXd_gZFJ8P-pk1RijAVtB9A4PdHG8fcwHRAUsS+Kum_3ALg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/6] exfat: use atomic bit ops for volume dirty flag
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> -static int exfat_set_vol_flags(struct super_block *sb, unsigned short new_flags)
> +static int exfat_sync_vol_flags(struct super_block *sb)
>  {
>         struct exfat_sb_info *sbi = EXFAT_SB(sb);
>         struct boot_sector *p_boot = (struct boot_sector *)sbi->boot_bh->b_data;
>
> -       /* retain persistent-flags */
> -       new_flags |= sbi->vol_flags_persistent;
Please don't remove ->vol_flags_persistent. It prevents pre-existing
volume dirty flags from being lost, but removing it clears a dirty
flag set before mount during normal unmount.
