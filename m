Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFB3221DAE
	for <exfat@lists.linux.dev>; Tue,  8 Sep 2026 00:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788828843; cv=none; b=uBaqLrK7y3BafN9X2DgkVqRFe6poGBeNe56Y5tf1p5/GM6WvftzW6uphtrlaWBloPShxSTzE73xipweS+qaXga4LJbhlQ+r3qfOf8ImJJcPcAs8S3xo0fTVpmNd7HMEoVBvs/5KiRaaiR6HYgF6NuwzTKUSF/wuXrP368TZs4zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788828843; c=relaxed/simple;
	bh=++FzqTLaFYfr8wejQ/E4bIWtzv8cLWckoV/axWcXg4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+YJKFefP1oikQnsuvCZATbQ8I/3SjYLAEO3EOYlCUf6MNDou7u+2C8nykR6ttPg/OFaW2hEjR1Oj0ZXeIxhFQP211FU0QgDxAq36BNQhlfuLxpMGR8ou097PpJg/B8oW315dqyJQcViQz2mvki5zCwvFz4qEve34T2SQEeDYR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=qXAYM5Bu; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="qXAYM5Bu"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 5D8251D452;
	Tue,  8 Sep 2026 00:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 5D8251D452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788828840; bh=++FzqTLaFYfr8wejQ/E4bIWtzv8cLWckoV/axWcXg4o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qXAYM5BumDrn7R130i07+H7AHV4oUZZ6dmD/AnA3n7Uo4OWjh67ZKIZMKY5EC3rw8
	 PzLoHD740myIYEgqwwn400U8bBFbPIKYj+B8JfyONwggiGGMcAPOFRKSHQGQPXPEqD
	 Lpswb7OFsOIarrmhQCLw0i3P2o7zilzODKaG2NTM=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id l4rPAqdcn2r3egYA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Tue, 08 Sep 2026 00:53:59 +0000
Message-ID: <147c3770-bc3e-446c-8bc2-352418aeb1ea@dev.snart.me>
Date: Tue, 8 Sep 2026 00:53:57 +0000
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] exfat: take bitmap_lock at the start of
 exfat_alloc_cluster()
To: Chi Zhiling <chizhiling@163.com>, exfat@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo
 <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20260905054951.674766-1-chizhiling@163.com>
 <20260905054951.674766-3-chizhiling@163.com>
 <0eb35731-1d8f-4f46-9a0d-36a45ceccfb2@dev.snart.me>
 <6d6c01f9-4cc2-4e63-a765-f735452e7eab@163.com>
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
In-Reply-To: <6d6c01f9-4cc2-4e63-a765-f735452e7eab@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 08:04, Chi Zhiling wrote:
[...]
>
> You mean one user has changed the fs, and others see the stale value
> of used_clusters?
>
> For SMP (including NUMA), if a certain CPU changes the value of
> used_clusters, then the caches of all other CPUs will be invalidated
> and need to be refilled. This process is completed by the hardware,
> see MESI protocol.
My bad for taking NUMA as an example. I was just curious as to what you
might have to say on this since the fix is kinda related to your patch.

I was just pointing out that there's a minor race condition in
exfat_statfs(). I used NUMA as an example because the delay through the
interconnect would make the cache coherency problem worse. btw, I think
the MESI protocol only covers cache. It has no control over the
execution flow of processors.

I might have an access to a real NUMA hardware that I can test my
reproducer on. I'll report back with a patch if I can actually reproduce
it. Thanks anyways.

Davo
