Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C039841B8D7
	for <exfat@lists.linux.dev>; Tue, 11 Aug 2026 09:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439092; cv=none; b=KG20YUgb7/58FXJ0AAT3bUuwQDkbjI3OUg2Y1uSXEnOl/1zN10F6H6CFZ+ltr+VxjFRisTnfBrR+nBZAeQkgnLw30QIY+R+LffqCQlIbfimWGGKaDm5Cet+p7pVP0vJRFgO5JgBIZDekyELzOgkyLU/OzIaAVtcBUdQi1LZ8Vys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439092; c=relaxed/simple;
	bh=QUhS1Bza5HaUsFX2V5HxGZcYNRue8PRdzxfPKKlwBQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m98WpnIbG5Xfdz0UsH6Kh+g6SfoHXlGu8f9Ke6B1TA+GHzzZHYYX0ySlTGOGr5P7DaBbtjxCP5MPA7ID6PYHi8HK+MpDeBq5rgtK8m1jtvbAipFoPqo4rz4yWZ64SHqA0eUjFzw9IcHFGBtkEs5qkWAPwoHQlk0r1rruHKmaRU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7XgyrbE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7XgyrbE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711331F00A3A
	for <exfat@lists.linux.dev>; Tue, 11 Aug 2026 09:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786439091;
	bh=QUhS1Bza5HaUsFX2V5HxGZcYNRue8PRdzxfPKKlwBQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=N7XgyrbEnlhn0g+FdLaecQH3q+QmWnpqaGKyBdppVWyKUz6Sg7Zx+PRf4VuXtzQwB
	 nyYLiiIlEcFH6oeIZiu5K9QIuHd4hFuXMU6rnSJUYX8TNzbaMcRyGweqcRXO0f0gmi
	 0f2G3x/fXHBBcV0/htS/WBZhKJqDvyQjyt/xahQIbfVhREOkLpzTBsCTGe+qZbyOZA
	 5iQCH9kb+V5DBmg0HA/uU5YTJuNCHBpnLimcW0GUDyD88lBVrcXhPTVu55NEFfDezx
	 euehQdsceiyek493Es3xT7u0DagtXuPBSj9oSGQimSDuzGI/ViFnY4gZBi0U7+wvoZ
	 muPOPHsXILOTQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a1542cdb53so2827575a12.2
        for <exfat@lists.linux.dev>; Tue, 11 Aug 2026 02:04:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpBPmg/GLfb1y85knRmJwp5kOSqC2gu3i8PeaH9xcwsInPRsfMHzobikbM7JFDbogPda/jdVA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8C2kZ6fW4kvWrh0Ks8L1DSXK1b2bKMyTKWWoyQ5+2VmNLVXGU
	zysSFzEcO7WkUdVOFEJ/NjSoo7YsD8Z1OHpTOP9MfQqS24d9fuH/Q5Gt/53eLsEPvjJsYMIyMEa
	eEVXNT6yx1o6iOOrqvJdyKQNZaH7jOnQ=
X-Received: by 2002:a17:907:a88f:b0:c15:df42:952c with SMTP id
 a640c23a62f3a-c20e629200dmr96553766b.28.1786439090136; Tue, 11 Aug 2026
 02:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810145814.682796-1-anmuxixixi@gmail.com>
In-Reply-To: <20260810145814.682796-1-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 11 Aug 2026 18:04:38 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_LYB7=MiSbH+gpfZahgraTQY6jyeMBj1AMxZBGQrHhHg@mail.gmail.com>
X-Gm-Features: AUfX_mxJzsOe9MK8QE7Qrg9_rWmg6_AdZbd3CcDJewU0RZHxuLtKObT_Uc_2dYE
Message-ID: <CAKYAXd_LYB7=MiSbH+gpfZahgraTQY6jyeMBj1AMxZBGQrHhHg@mail.gmail.com>
Subject: Re: [PATCH] exfat: fix truncated volume labels returned by FS_IOC_GETFSLABEL
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 11:58=E2=80=AFPM Yang Wen <anmuxixixi@gmail.com> wr=
ote:
>
> exfat_ioctl_get_volume_label() passes uniname.name_len to
> exfat_utf16_to_nls() as the output buffer length. However, name_len is
> the number of UTF-16 code units, while exfat_utf16_to_nls() expects the
> buffer size in bytes.
>
> As a result, volume labels that expand during charset conversion are
> truncated.The destination buffer is FSLABEL_MAX bytes long, so pass
> its actual size to the conversion helper.
>
> Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
Applied it to #dev.
Thanks!
