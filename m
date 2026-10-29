Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793249573;
	b=zvidAAQ8uEOT2IOk4Pf/i5AwxYpo3lTQ5uY8bX0AuEwxWuk+7VAQFsqRR0cTmm4/M33W
	 kgtf0+oPX2lFijrhvWm0LUZu2CguxKgBf9yv778YGZw/JzKR8EWpca+nh5kK67Pd9aBVH
	 2q3VgUUMWxTYC6X8Ei31/6FKTc5ZvQX82O5aFzbwQDBA4ua+JW6G+HfGg95er4d2oTud3
	 hBNx/EPuFsRb/ErN/QmVcsHiEXP1ltibvkVPF9iIRUk8wDvipnzC8MO7YDZMD1Ai+DyJi
	 ftY9iOlddYLpTI8NJCH1aW60bcAjfrXx+mF65++jpwm07KpuGbFiy3zJ9oX4ldGYv8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793249573;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GG/P/XqFnL5V69zPAP5v+dqLV7HxUHCGOW6qa67ybOE=;
	b=VLdIXlgm8YvxbrneamVBLKbvcAdkC22nnrAXdDBUHEiKBPUPzfDpMBYm065oKVb2E/bg
	 4vwgPHd1Ly5bFf6czqdyGRSpKIM9TSVggUGr7Tu1tiLmHRjmRtb1qfIOZvZLpW/JPfnVp
	 d3DGLYgp1flyaNq7zhyTwDwBUSb1IfVSZp3cJeGwyuqBhPDcFOmrXr30ENI/Bd+Sy3Q7F
	 GjtC/we3gBZHNduRtPZe9qSv700FssSLZzje49QvyD6IGXw3wg3eS2LTM6h+VCFgvi391
	 YvLqko6b81xIJ21c9tUQumDWzQkc+Dk8gu9BAfp/A50vGH73mT0pIRqyZDz6VM2qsqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=ExrNjbR5;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BC8606A31A
	for <exfat@lists.linux.dev>; Thu, 29 Oct 2026 04:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BC8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=ExrNjbR5
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id E09071D485;
	Thu, 29 Oct 2026 04:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me E09071D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793249571; bh=GG/P/XqFnL5V69zPAP5v+dqLV7HxUHCGOW6qa67ybOE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ExrNjbR5uOVNPEPTo7iDu/n3n+u4uu880x13tJlXLbF3Sytq8okK81ukmerJ59mnj
	 MeUX6EiNRNUNK3P51aFpg3aOWWckP6ZBKYQHYi0bP5p3c9YvHjM2/OUuqkJDUd5ilV
	 Xj2obEcG5O5rqyRZMVeMAgqtrCjpoKPLSTyGmK8A=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id ODjmJCLR4moZFgIA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Thu, 29 Oct 2026 04:52:50 +0000
Message-ID: <e934e90d-d9d2-4430-83bf-11dbf8bce8c7@dev.snart.me>
Date: Thu, 29 Oct 2026 04:52:49 +0000
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
Subject: Re: [PATCH 6/7] tests: add suite0000-dump-arch for CPU arch info
To: Yang Wen <anmuxixixi@gmail.com>
Cc: exfat@lists.linux.dev, hyc.lee@gmail.com, linkinjeon@kernel.org
References: <20261027080628.82069-6-dxdt@dev.snart.me>
 <20261028141136.2287862-1-anmuxixixi@gmail.com>
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
In-Reply-To: <20261028141136.2287862-1-anmuxixixi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 14:11, Yang Wen wrote:
>> +tests_suite0000_dump_arch_SOURCES = tests/suite0000-dump-arch.c
>> +tests_suite0000_dump_arch_LDADD = libexfat.a
> The dump-arch test does not reference any symbols from libexfat.a, so
> the LDADD assignment appears to be unnecessary.
ACK

Doesn't really matter, but will remove that line next time I get around
that particular Makefile recipe.

Thanks
