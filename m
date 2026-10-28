Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180185;
	b=rrFjBWeIOg8utIHhthJcjQdNh5BXOlFJLZ4n5xmXC5GnJydiGVWFk2ntcxH+hNXCOZx5
	 pYIJByHSkozz93IjVElq4l6SdrEXDItfpgEmPPp6eVIOPWvbMQmQSr558PEMe56wSQ+Uw
	 n1BoiYeJkpaAWdD/WZhq86poZsqSAlMbJyLI28phUeaBu+7xrS5VoM/ax/haXlmhWIXGW
	 9HRx7t0VURKLY+JadAd0P3A+j0R9riMB1PzCz4eun6FCF+FEiNYPDWhY48LuF6y6Q/5iM
	 JSwYkHwGhatpZUpPknbP06jRX9kdLj+g79z4M+ZWvDNu+uNmrkbE+AwgLmy5d6EAukw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180185;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=RVSTO3GdoisMrzGbYsNu2Pz0prLtfhLbWOLpR8HdDeQ=;
	b=OOutrTcVyRYqj/98WaqZNuM01+CpTsIW6zh/jPZ3ck0PrQsQLr3yiqGIy6er4h2Lsm++
	 I//ySZpmUSxlnRHJ/LWEuhXsrQe+UCe0jglbaIZesuj8qPmRx9rdHQHely0MEPmMxpR3j
	 5rF8IY9Zuoc+fKlNsF6uAhvpnODkUuYwBUfKAvp6V+791JhH1qTFwpk/43kzL99XesyJT
	 HsxpHtU32DyEkJulqOuAMP1EXeN7pt2L2lvSHkIuSV7WJloi0Ce2ZupXoAgzzPqhJ6tOC
	 VCAifEs4359TIrwmEUX9YX52GYiUKymeqqr2JXRrpHMi825sS97DcTWiAKhzqwYWUJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIBmz6iR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5251606A334
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UIBmz6iR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CE51F031E2
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180184;
	bh=RVSTO3GdoisMrzGbYsNu2Pz0prLtfhLbWOLpR8HdDeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UIBmz6iRQvgmmq28l20fCVYj3RfUy6pEI8L3mqCKxgDqsYMyya4MsyYeC18C0SYFG
	 JWRk3HV/QUPmKLoXOt5b8sezRI9WmBLeEmfcf4lhJCthf2RxCqBQDzSWjtfsd9UNof
	 hfY9MHPslZCHPf52cNpWo7HKvQgOfyY7R6MrP2SgxBKK/TqBTICvzJSU2JvDu/zn8w
	 +gY1al5wrDQ1KGmzj6djZ894bQT4rpBdZXnr609nZuIHEJ9Txo4ySPCWFDfNxQXUnb
	 WYpsYKwZLqTFtvqMuBcauFyQ1T1PEjVIxYhvn7DGQBOTfg72EFY9qVpV1XFDKBAGxJ
	 PTU1zeB173T/g==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c247f6687dcso100053566b.2
        for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 02:36:24 -0700 (PDT)
X-Gm-Message-State: AFq9FYKKUANhLezDMdB44VY2o5VDwk4bx4U8Pxq20+f7dNXG2T7NXw2w
	cJkBZE6vWzK2myIYhhkk8l0DDgik2JEh33WBi38d/yjWBVNiKUs6xOFYOTeos5JlSC7UOEvHCaT
	NBoB/UNzflxDl+hkZ3YTxqaNjcAeN20M=
X-Received: by 2002:a17:907:2d89:b0:c46:645f:cedf with SMTP id
 a640c23a62f3a-c49bdee086dmr159608866b.15.1793180183125; Wed, 28 Oct 2026
 02:36:23 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027080628.82069-1-dxdt@dev.snart.me> <20261027080628.82069-7-dxdt@dev.snart.me>
 <5c557ada-8b5b-4e63-bcfe-35a313c1e25c@dev.snart.me> <CAKYAXd-GYXmG3BsL9CAfe-F+3spDh=quA_ZKo-EJ6LvdX+7kgQ@mail.gmail.com>
In-Reply-To: <CAKYAXd-GYXmG3BsL9CAfe-F+3spDh=quA_ZKo-EJ6LvdX+7kgQ@mail.gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 28 Oct 2026 18:36:11 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8JGjEMzWMct5odPZPjEDkPAifb3e-Otjw4GVSX-wF+eQ@mail.gmail.com>
X-Gm-Features: AclHuK_0b-2ncDyJSnVx0bwuHiJeZkgDm4AE2KTvsqQ07RdXr3bLDbiKwPiORHU
Message-ID: <CAKYAXd8JGjEMzWMct5odPZPjEDkPAifb3e-Otjw4GVSX-wF+eQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] Github Actions: bump to Ubuntu 26.04 runner
To: David Timber <dxdt@dev.snart.me>
Cc: exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 6:31=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>
> On Wed, Oct 28, 2026 at 6:18=E2=80=AFPM David Timber <dxdt@dev.snart.me> =
wrote:
> >
> > I can see that the CI is failing. It looks like you're stuck with 24.04
> > for some reason.
> >
> > https://github.blog/changelog/2026-09-17-ubuntu-26-generally-available-=
and-latest-migration/
> >
> > I don't understand why they decided to do a gradual roll out. My bad fo=
r
> > not checking this before writing up the patch.
> >
> > We should just pin the runner to "ubuntu-26.04". It should be good for
> > another decade.
> I also tried changing to ubuntu-26.04, but CI failed. because the
> exFAT module is missing in sparc64's linux module package.
See:
https://github.com/exfatprogs/exfatprogs/actions/runs/40640760753
