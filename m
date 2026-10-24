Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792838731;
	b=oJCCIDCXYzqziNpeqsv5k5Ay+Eaxb54N1Aqdvy2dW/KTDTCqj8A/G6X3qjB/NpqftCwC
	 kEI6Jtd0tMMj41jKQeTmpWvRRphDz16dFHLlEH2xCR2hM7j5Dy5Df83bIaMPE8rCEU9RL
	 yWdw0B+zZbar1uj8BbQNz+obbMiekU548Txp2j1J7zfv7hkQAPd3bPBn+r9rUPMRUPvhU
	 YgrNryA1pSvETkpsP/SxhrQHNWlDU4m4vdjomanC+zIUuOPzVGIBhnkJNbDhncuF2J1m2
	 dsKjk+vIzwYyrsowb67Ih3RqAnZktxERBLqaZPbreygoRCLseVIANt6HidInYMtoylA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792838731;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oVu/EabzxmmMxWz2qReGOQWh7w4Up6WTJW1py7UB94s=;
	b=g6Oq7UPYKEfZR4UOQt6MTdSw0Sczji4dCy0uPBxCfysc4pV3/itYGhulB/Vx2WkfodMn
	 9BO7ZarR8RWgirLN/c3ioQH1cFnCaba07w4hOHGyokxQeVd9Aax3S31q2k0CbbwJWzIim
	 F/Ywvzo7GKxHwNXv2VN72e/iNwbHfzLp+fji9J7MudNBMIWzBX7PC/vJRdQ9p4zw/fnAr
	 aU504yWUYwzyKs4V+xgzOFeQJOg3Izh+3pXNqccQpPeV9vU6bT4pydPS9kUBvRMkfiMZN
	 IEXU7w7zKMvFqmPRI97wmkYhEgLLdQD3UfeSI0f2W+hVgZlId8Bo4fqb9DyzyZdy+jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=DSHBNdT8;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A84606A31B
	for <exfat@lists.linux.dev>; Sat, 24 Oct 2026 10:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A84606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=DSHBNdT8
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id C60571D485;
	Sat, 24 Oct 2026 10:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me C60571D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1792838729; bh=V+iG06SnZTGDK5rFmW8psNMTSUUfQ/OrYBhy2AoynEE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DSHBNdT8A50mgy0uDViPg1OrkXw3UEbUbFGv/p12zgcaewb8XWrZTlUtgjZwwy9UR
	 ZA3nXPw/Wm6dRy8bdaDbSEDYbASPcwzGAA4yZSJDuGDdppA5G2QqzlDDgzN2jWiHl2
	 IPXIOai4Q+n1eFi4wHWWtJFXF2sGBm9gD9XgQzlc=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id SQLYFUeM3GpkcwAA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Sat, 24 Oct 2026 10:45:27 +0000
Message-ID: <ad9d12b8-a047-4a2a-b0eb-9f9e4be30424@dev.snart.me>
Date: Sat, 24 Oct 2026 10:45:25 +0000
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
Subject: Re: [PATCH v2 2/2] fsck: prevent overflows from invalid clu_count and
 vol_length
To: Yang Wen <anmuxixixi@gmail.com>, linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: yuezhang.mo@sony.com, exfat@lists.linux.dev,
 David Anderson <dvander@google.com>
References: <20261008145525.1950813-1-anmuxixixi@gmail.com>
 <20261008145525.1950813-3-anmuxixixi@gmail.com>
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
In-Reply-To: <20261008145525.1950813-3-anmuxixixi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Good morning, campers!

On 10/8/26 14:55, Yang Wen wrote:
[...]
> -#define DIV_ROUND_UP(__i, __d)	(((__i) + (__d) - 1) / (__d))
> +#define DIV_ROUND_UP(__i, __d)	(((uint64_t)(__i) + (__d) - 1) / (__d)) 
Just want to point out that this change introduced a compiler warning:

    fsck.c:863:78: warning: comparison of integer expressions of
    different signedness: ‘long long unsigned int’ and ‘int’
    [-Wsign-compare]
      863 |                 if (DIV_ROUND_UP(stream_de->stream_name_len,
    ENTRY_NAME_MAX) !=
          |                                                             
                    ^~

https://github.com/exfatprogs/exfatprogs/actions/runs/38195762162/job/114637915559#step:10:163

Well, someone(myself) does pay attention to the CI output. Integer width
and endianness confusions were such a pain so I've set up the CI
pipeline to catch them. I think we might as well add -Werror like Linux
kernel at this point.

Davo
