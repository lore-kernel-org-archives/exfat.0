Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F8E3A875F
	for <exfat@lists.linux.dev>; Mon,  7 Sep 2026 14:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792152; cv=none; b=AnsmP7cCZkyyBbm+NQOceHE7CgV3BxRNyeVybqPNXFU9CaWEvbg6Stsqq9YcrKPY1nFcSDz47H3IsOCWLdsjkBDsuswll5Tn8jdDw4Ea8nz5lMCLEp0ATLckiG8wDUnubBaAFII4l4yHD+0P1UC3k3BCgpOHc2ZYMIAEFiL5mF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792152; c=relaxed/simple;
	bh=GNi77y7CCHtSiOeR3mrgA3qzYhq8zFe6d1+Esa22NQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pH9aMfSvJVfuuLVEjmM6P1Xv2o9uwQ1RYk1CijH86QnQJFHfbPnRUrJQ0QUj5ohuhnTbSLoPwUXOnCxbauI0nERU4XqnUqDHbpvHCT03bu5eBRTlW1SMZriXOMHwG/qsDejpxxz3Kriljaf4L0l0Me7fGSnQhI1sphduxkUuQXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Edk5N/Wv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Edk5N/Wv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B471F00ADB
	for <exfat@lists.linux.dev>; Mon,  7 Sep 2026 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788792151;
	bh=QzDMGyQeKSoeHQ8krXZbsj0L74Zf8D5oR9RuktQ4ziQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Edk5N/WvBVBjmYbAhH1zh7Cra3Tebp01bM+rvVywgEgFAZ9aBich6Lm7VAmuSD837
	 xMQ9eJqFwItmheWHGs8wj2tuisei6ds9iNFGDnZOS25O3mxRqT8FTmdOBimgjdBSA4
	 jB0IENYTYKVKMaqxtgarkvUIZYtlV67VZiIYw7nCaU30tQkEoBvl3Qt35H8OUuaIWL
	 KcNv4HND60xTLjjNHCChcOVMe/xz3Wn2p1X2rygIUgJJCmTqt3z8tOwEgQlfiF5tV7
	 vFmXSc+Ihj3kk8f391ypabzdWT7TKjOCYgrhwIjPuY6A6VoJ1rNuD0Op5hYzFKeGYH
	 0UdIWV+xKGIDw==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1670dad7a8so546263966b.3
        for <exfat@lists.linux.dev>; Mon, 07 Sep 2026 07:42:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwqNWGVRKPZrT5UJX5ynmeNjPvwJwotCfpO84ozaYW9zBzD0DQIHATX8u/6ad7VUifuYDj8FQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mH2S5jm7eLaqWm0pWknoa6VoLW1Tz2c+OSOufikyKEr4GdaPj2
	DupyC2Z55ynZExlWSkurNdtOLivrsgPmluPQcCVfWfbtatnSGyIaqkWgWsOS6STPDbG/AIN5Sml
	OKx9WX+OyxRo2+965KxQ8lZ9zrgwLQN8=
X-Received: by 2002:a17:907:e00b:10b0:c26:2795:b4a0 with SMTP id
 a640c23a62f3a-c262795c180mr360010066b.47.1788792149765; Mon, 07 Sep 2026
 07:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260905171043.922793-1-dxdt@dev.snart.me>
In-Reply-To: <20260905171043.922793-1-dxdt@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 7 Sep 2026 23:42:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9_3579PDS_+w8waOJbaa8x1UFEdRXt+4B2Fma5icQA0Q@mail.gmail.com>
X-Gm-Features: AcwNN1UXxZ4Y_vwg5VN5FNhvIEeiQ4L8Ek6dkwhEM-EGrPXyphDdjiR1UWYH_lA
Message-ID: <CAKYAXd9_3579PDS_+w8waOJbaa8x1UFEdRXt+4B2Fma5icQA0Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] exfat: update percent_in_use, remove runtime
 integer division
To: David Timber <dxdt@dev.snart.me>
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev, 
	Hyunchul Lee <hyc.lee@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 2:11=E2=80=AFAM David Timber <dxdt@dev.snart.me> wro=
te:
>
> Changes from RFC v0:
>
>   - use mul_u64_u32_div() for 32-bit arch without 64-bit integer
>     division
>
> mul_u64_u32_div() isn't so popular API, so I'm not sure it's available
> on all arch.
>
> I don't have a beefy machine to test my patches for all arch... If you'd
> like to apply, I suggest waiting for the CI bots to finish testing. I
> believe all submitted patches that apply to the master branch are tested
> by the bots. I'll ping when the patches get a pass.
>
>
> David Timber (2):
>   exfat: update percent_in_use field when updating volume flags
>   exfat: remove runtime integer division
Applied them to #dev.
Thanks!
