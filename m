Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179104;
	b=oVI27ro94vARIxHESzOZyf4KqxQc/DDEozMfnfLCt8iavIzgew9weipy+rMOieXsBVG5
	 RcQM3OCjsJx6Kzv4hDHb7G7lBkNDgJdhm9wZzwbre6e1iBCOh9N1jlwI7KPqRxHgdezNM
	 3VfaQoDH6I1w05E4rS+Xp9HA4AqStNBbvULmATj5PcnTJTs5P+uvECQk44qJ0XJ/PX7GX
	 HHRhmjEzex79EdhPugRSS/XVfmnrtTXjpawef9wFqhfxwYA1VcQRE2nUbwpUOkVEYhxhc
	 OQR7kZl18qi1Hp3Svy4sG8D0V5n8QLEXFApzNdM1XXfrn38lRaJKolG1hLXZUj/q+iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179104;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=D511JCXBglP7wVINLh5Ys2a7niowXLE5MwOheAZ+m3o=;
	b=QB8PX/dkeFmsOqH63Jh/BLDhcQh6jsIWTrywP5HcGKHnEpIzs0Cr+nf5EbP0ciZIECsB
	 Yusdpmy1mGJ4WoNDjuwRgC0DwSgJe5kDtoXl7MncDc3FbBys7xFcdh7D7xygEVYH5OHaw
	 18iIJXMVrLnwGoPaZO3uXvcP0iWmswQdYdQtZZhyoNguPBJHijrKSbjuKoF+ELPjy2apy
	 ENBIiPgWLbx+L4AzYrnf7wu+wLiQGqFnQOZSyNSkmVeZ/QK1Bt7Sj6/3zGYzSGU34A3Kj
	 KSqWjijlFilKvs1H//Q2lIiBrsCF40sdwl2yRzP5KCw/GX1LUH1nfh9P1ssC2FtvxxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=jGRx+jKe;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CE5606A31A
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 09:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27CE5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=jGRx+jKe
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 235191D485;
	Wed, 28 Oct 2026 09:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 235191D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793179096; bh=D511JCXBglP7wVINLh5Ys2a7niowXLE5MwOheAZ+m3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jGRx+jKev9BofRRaO67JsTDYhkAlAB3+rClvE+Q82hiDEe3ZHewFi0uEGcHE/RkRK
	 lYA6dDE7PJIyOXNcc20VUTIqw1+t9OFfsZRT7Muq10TFhBsuPEqbKMBila1fXUILpN
	 lhYzegbStYFBf2JmPEkCcRiQbV6yR0qmTDTQrd3Q=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id iTE5KNe94WpAzQEA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Wed, 28 Oct 2026 09:18:15 +0000
Message-ID: <5c557ada-8b5b-4e63-bcfe-35a313c1e25c@dev.snart.me>
Date: Wed, 28 Oct 2026 09:18:12 +0000
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] Github Actions: bump to Ubuntu 26.04 runner
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev
References: <20261027080628.82069-1-dxdt@dev.snart.me>
 <20261027080628.82069-7-dxdt@dev.snart.me>
From: David Timber <dxdt@dev.snart.me>
Content-Language: en-US, ko
Autocrypt: addr=dxdt@dev.snart.me; keydata=
 xjMEYmJg1hYJKwYBBAHaRw8BAQdAf5E+ri1XLtjqYbZdHOyc8oS+1/XJ5bSlbx5WHXmVBZzN
 IERhdmlkIFRpbWJlciA8ZHhkdEBkZXYuc25hcnQubWU+wpQEExYKADwWIQQn/Jn96EMUaIoF
 X+T/ldyyrZpWaAUCYmJg1gIbAwULCQgHAgMiAgEGFQoJCAsCBBYCAwECHgcCF4AACgkQ/5Xc
 sq2aVmjJZwD8COjPlUwccrlRvbNQ6f87DWchtYO0o8W2DNRM3RLps0EA/jEhIbRV6AsyC8jr
 30Ut3aJ3/mO/6G4sLj7OvkEEBH0MzjgEYmJg1hIKKwYBBAGXVQEFAQEHQFpgtIgaByv9lIEY
 EmpavMO0pYjtu7TMJynwdnGYkN9LAwEIB8J4BBgWCgAgFiEEJ/yZ/ehDFGiKBV/k/5Xcsq2a
 VmgFAmJiYNYCGwwACgkQ/5Xcsq2aVmhFCwEA0kM9VyYB4bLCM7+SuXUUH+5Ec99Nj4RXxFad
 Key9GuwA/2BZK6bNyrLSfEk2JDRoskqf7OIL0wa6JOD5SrBnMe8E
In-Reply-To: <20261027080628.82069-7-dxdt@dev.snart.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I can see that the CI is failing. It looks like you're stuck with 24.04
for some reason.

https://github.blog/changelog/2026-09-17-ubuntu-26-generally-available-and-latest-migration/

I don't understand why they decided to do a gradual roll out. My bad for
not checking this before writing up the patch.

We should just pin the runner to "ubuntu-26.04". It should be good for
another decade.

Davo
