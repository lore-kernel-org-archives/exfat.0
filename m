Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180336;
	b=V7rTBtGW9ovfZRfvqjdDr67MXCCQnbPhbsuS/rhCnXHOJl8yu2AnZwelDcl3fNrcPfTk
	 vE4oUdKBlUSIgHSe7t3YJZTE3yG95D8uHGeODO4Li4xvdQPOGYrlQ9dpg9dWV+9CxYJ5z
	 ZOot55zjb9e8ouGAT6n1wgQIb+K2UkJTzX/rjUSn6ZuqBd+vXi3eagtC4n8awos8f6Pbt
	 SZxRCTdH48XN2dL7vodwwtSKj5iTHeCNjEJg0EGcrU2Dcx0UPeHTSCYcV75HRvC6jyL54
	 CNc4LDOUAuJ9XljwYUA3BDqoclnAPU3PsECJtoypk/vMGbg7rP+VlCi1/scNd/WudEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180336;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=jIyuf35x/3qiMf9ol6gU+9pecPBb5QTjGSyriU2A0+c=;
	b=tTOat2Uff7rI4yLaQcF04KxdcipubObFNbridNq7k4WpYT20KWfkugdykdrO93NLeHBb
	 i7PLtruaI6Dn3uTCuwLvZvJSUMwcU40TSNVD+IBPsDSlY/Bt5Vsz8ss2Bo3p/Ohhz5kz5
	 iVrD57/aeKeqZyn4aPr9BbTDRxSM7XaItwJQ7n+wMt3rtxcikheEeKH7aLAr1W/cxw6mL
	 LNnZDmwjpDoFdbDheo/gZz6JddC1XP+bBcgzbBjTSyVK+5kdgcnt4Z8OAhGVd8dDD0xY5
	 7ofIjbmkBLb4eTlW9dXYt4hWqH0u8EskX/H0DnTKhoTr3R9KCQ+Q9yk6muN8izV3wuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b="X9/R3npa";
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD725606A31E
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 09:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD725606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=X9/R3npa
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 759751D485;
	Wed, 28 Oct 2026 09:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 759751D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793180334; bh=jIyuf35x/3qiMf9ol6gU+9pecPBb5QTjGSyriU2A0+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X9/R3npalcdINJIqGRtcNUKI0s+LaPMaP9wyEs9PINrSt1KSQDxjQcYL7EMUBLBHQ
	 ZFJW9+AjJkboXKO3zS6PpzcG5GfKGtYpgJW4k9ABrjBpuk6QZjxbT2IuGB6IjvG/42
	 mQbu2/Xm5zjKFeHWVcalwMuYnx5WA7S+myRugwgo=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id r8hRA63C4Wq2zgEA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Wed, 28 Oct 2026 09:38:53 +0000
Message-ID: <9adf8ce1-2bb4-457a-8ecc-c33098adcc7b@dev.snart.me>
Date: Wed, 28 Oct 2026 09:38:51 +0000
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
 <5c557ada-8b5b-4e63-bcfe-35a313c1e25c@dev.snart.me>
 <CAKYAXd-GYXmG3BsL9CAfe-F+3spDh=quA_ZKo-EJ6LvdX+7kgQ@mail.gmail.com>
 <CAKYAXd8JGjEMzWMct5odPZPjEDkPAifb3e-Otjw4GVSX-wF+eQ@mail.gmail.com>
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
In-Reply-To: <CAKYAXd8JGjEMzWMct5odPZPjEDkPAifb3e-Otjw4GVSX-wF+eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

https://github.com/dxdxdt/exfatprogs/actions/runs/40466719701

Well, I know. Devs don't like to hear "it works on my machine". That's
why we have CI but the very thing basically betrayed us. Oh boy I love GH.

So, it must have something to do with the Ubuntu package management....
I'll have a look.

On 10/28/26 09:36, Namjae Jeon wrote:
[...]
>> I also tried changing to ubuntu-26.04, but CI failed. because the
>> exFAT module is missing in sparc64's linux module package.
> See:
> https://github.com/exfatprogs/exfatprogs/actions/runs/40640760753
Thanks. I can dx from there.

Davo
