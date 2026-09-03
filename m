Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E800737267A
	for <exfat@lists.linux.dev>; Thu,  3 Sep 2026 23:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788478103; cv=none; b=Be4gN2FDrNoOVjTPAlEWePGxJ4jddJBMh2kp+f1DZSm825ORjQAwUfTk1Scr9VMAL2CLzYsFvgwKpZxyiB3HN9spROOfLxkFquItN6248nbG+Ipga28Ud+MBjHrQ1H7DChCXH91uZ+9vFDTS0lGbpn9lV0OC+Tr0G37CuNwGi00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788478103; c=relaxed/simple;
	bh=lAQOBZZNM4HeI6bj49fzqToZ0QpD8Fg87vGSAmZVnYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/vDAgFzAcBriQgGGZtcHLQbwDeb1/tMA08NslRj5WVUHoTjPu21uNugGEBtxprro0YTIDZWubURoluxmPo8fDflBfSq/NpnVhp8OZFEvfv7ScAT/Y+MBJ2fBm5Xpq950Qu3vB7ZdQTZDBuY8QdnaNLr5fRs79tdldWGuL4wy10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aR85jWls; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aR85jWls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2EF1F00A3E
	for <exfat@lists.linux.dev>; Thu,  3 Sep 2026 23:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788478101;
	bh=J6Siljdub3jnoqDcVJxmjva8tbUcjub/Wa6bS2BFIiw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aR85jWlsR2hacBYRwAk308Sf+U1zuR82WYL5qgmqWn84j0O7ZAEjzbPkZHmQpcyeV
	 eb80/2XSoVw7nwcyV1D2LczTyp/Krkcc3oK9JXSULC/ovgSKUiYGHxnHzGj8Qe/poK
	 u/2rOzi/wFq8XzWuSvk+AeDloqtVjgw5+QKAuzyf5EfAxLAGr2LJlI1Yw+6QOrwp17
	 0ngsoHQ9azBC7pp1BHpQE4Rhqz/qbWIScu8vOE9THYZGkDtWVLM0lvu31kp9WLnfVJ
	 SYg3ytQ7pCBQz3/CRBuohHULlLH1eb8tZbYMyv/H0RrJkLpZBB/Dc3LFOWDwd5FcX+
	 4X+wP/xHB3K2A==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c25b661d37dso59129666b.0
        for <exfat@lists.linux.dev>; Thu, 03 Sep 2026 16:28:21 -0700 (PDT)
X-Gm-Message-State: AFuF++k1Xn6cvAAa0XaA9vVybMzQQKJB+a1Xga3J9qFSVO30AGLhULT+
	+mLGBcImUf7mAG9+IBaxdfLfCTg8d6ux9e540sAKfxcoYAdqYMTn2gBz/xRwXS7OF1hzqFRjQjn
	GIIex3SP4/Z5p3wpp5l5Dr47z+7PAnd8=
X-Received: by 2002:a17:907:9443:b0:c20:f6d9:d8c7 with SMTP id
 a640c23a62f3a-c260ca24723mr134491066b.24.1788478100271; Thu, 03 Sep 2026
 16:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903092623.301981-1-chizhiling@163.com>
In-Reply-To: <20260903092623.301981-1-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 4 Sep 2026 08:28:06 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-YoYZfNGDJs1gjJPHZ4n5oe+r93y32Gyb=p8rUxzDeqg@mail.gmail.com>
X-Gm-Features: AcwNN1Vz22AcXvYJ9NC1LyAyX1OxPOv_0PS5dygwGrNWUUfYxxuRGrMNkkYRDjE
Message-ID: <CAKYAXd-YoYZfNGDJs1gjJPHZ4n5oe+r93y32Gyb=p8rUxzDeqg@mail.gmail.com>
Subject: Re: [PATCH] exfat: clear the volume dirty flag only when remounting read-only
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> diff --git a/fs/exfat/super.c b/fs/exfat/super.c
> index a9ea36ba2693..268732571837 100644
> --- a/fs/exfat/super.c
> +++ b/fs/exfat/super.c
> @@ -775,9 +775,12 @@ static int exfat_reconfigure(struct fs_context *fc)
>         fc->sb_flags |= SB_NODIRATIME;
>
>         sync_filesystem(sb);
> -       mutex_lock(&sbi->s_lock);
> -       exfat_clear_volume_dirty(sb);
> -       mutex_unlock(&sbi->s_lock);
> +
> +       if ((fc->sb_flags & (SB_FORCE | SB_RDONLY)) == SB_RDONLY) {
Could we also add !sb_rdonly(sb) here?
            if ((fc->sb_flags & (SB_FORCE | SB_RDONLY)) == SB_RDONLY &&
                 !sb_rdonly(sb))
Thanks.


> +               mutex_lock(&sbi->s_lock);
> +               exfat_clear_volume_dirty(sb);
> +               mutex_unlock(&sbi->s_lock);
> +       }
>
>         if (new_opts->allow_utime == (unsigned short)-1)
>                 new_opts->allow_utime = ~new_opts->fs_dmask & 0022;
> --
> 2.53.0
>
