Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7151D3E5A2B
	for <exfat@lists.linux.dev>; Wed, 16 Sep 2026 06:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539148; cv=none; b=rGAE/cIr0NCskIFe/Z4/H2PFQxtj6U9oEFBkqie8XEFrHVrak7dXENfAIBWBUH4q7H1rQc+nRRwAYenhdaezSoLYLq9klFFR7yZD0sGPV8hwnRN/S+JS2CzYEAsxy3/TK1ItAxRYZDtjjtPKiUAZeC9sVZweEAxNDxTWQHfIr10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539148; c=relaxed/simple;
	bh=jaA7QerfVwFQjAdnEdUVuy9HHQsOEM95EoQo9/6YJ00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KpjEn3ean8ZYO0DM5X6OEvZDe+PtLl/4MfndhQRqemvcWx0RingqaCwmwjx3tcwSdv/MXuRFfjjgFL1VnJy/714fuyvENo/j+2C2y3j7jV2a5enrRSgZrzf5gFk8d1LAqujbejvoya+6MorFXUkTfLvCOCGMnKzlEAs+cR13F08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcASVMfR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcASVMfR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E751F00899
	for <exfat@lists.linux.dev>; Wed, 16 Sep 2026 06:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789539147;
	bh=jaA7QerfVwFQjAdnEdUVuy9HHQsOEM95EoQo9/6YJ00=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KcASVMfRy2skAIXn+ilcF41C3LaB9+vrbLEEgAD0xMi1NxifxGS7lJ2MUnQCDkMU/
	 sJQhfoZSvwvbLn7/6kWPEsMlpgiCl/yLuSUnhCuaQQMVKYO+hG4w+8F2CxzZAwmyKs
	 ZLzZ5vmV9AXluhcvsBfiAQf+RzmLxESVVtZhIMgCVh5hY0SGdGbCYPdatTCdXaKFgn
	 FXOXxrtyLplqccpW3u69dRqpY+j7Z9NpUpXOLGaxJfKvyjoUyw1jyw7P8RVKRykz4P
	 sTjQMG8aPr8AJI9kAWbgeqVe7N7u/m08Fu2rfAM6cQlsSuvcuMnGa58RzMoQzLrw4A
	 sfp90MiahJqng==
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso1012609a12.1
        for <exfat@lists.linux.dev>; Tue, 15 Sep 2026 23:12:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx6m6Cw2H1RXLSHsEcp40r+mVFlqvWbJAmojLJKoopMzoXUXXrawG0sVvHtollDLw7R5O7DSA==@lists.linux.dev
X-Gm-Message-State: AFuF++kAOR3VX5SoMA/MzWyFv4tQ6Ntzpro2K8ImY5guudivpMJy0/8B
	QOCbRnHO1xR7AaRrIi/iHu0F8cQ4MwZRlPjpb5/8+DWwbclbVIoLzQaNp/sxvpHBn5btVZBvKLM
	fatTXMdNdiZxRxobgJ92BptNV70alkNk=
X-Received: by 2002:a17:906:478a:b0:c26:1691:b36f with SMTP id
 a640c23a62f3a-c29e52e1576mr62516966b.40.1789539145689; Tue, 15 Sep 2026
 23:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com> <CAKYAXd9wnmVyp4ONjYQPs5pxo_ruDmCN_yu7Ma4agDP1n-NNBA@mail.gmail.com>
 <7380972e-de54-4b56-a67c-842be8887c5f@163.com>
In-Reply-To: <7380972e-de54-4b56-a67c-842be8887c5f@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 16 Sep 2026 15:12:12 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_N7=M2dpQXqZMpoF7NwM_FvC-D3Hx4UR0qqrTzm23FPQ@mail.gmail.com>
X-Gm-Features: AcwNN1UYiBtRX-6Bc1dmLMPmYS7j36zEi3SjEnRgpaAvECwhZsu0jbChCPQZwA4
Message-ID: <CAKYAXd_N7=M2dpQXqZMpoF7NwM_FvC-D3Hx4UR0qqrTzm23FPQ@mail.gmail.com>
Subject: Re: exfat: question about valid_size and page cache
To: Chi Zhiling <chizhiling@163.com>
Cc: dxdt@dev.snart.me, exfat@lists.linux.dev, 
	"Yuezhang.Mo@sony.com" <yuezhang.mo@sony.com>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	liubaolin <liubaolin12138@163.com>
Content-Type: text/plain; charset="UTF-8"

I will check if you send the patches.
And there should be no regressions in the existing xfstests tests that passed.
Thanks.
