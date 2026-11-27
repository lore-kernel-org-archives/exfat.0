Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769216;
	b=4GCGQaDBUrxn5Tb5f3Q87vSOxn7JT9ryo9Iap8Wo+JGbFh0vlO0WXq6pAtKDYiagT4O5
	 Er8VnjZfyIjh35ICDaCE+qCE3y4Aneu934Tl3qKRMYfBrb2U54TfkPcj7EnuWw+WInGXE
	 HFQ9sA6k6OhBBLcmJGnfZfN5YzTgGpZB0C9EoMr1/i030ONlo3UxX9tKTqwzCX03wfQpV
	 z53ZTXhvaSZmh9AVolHY5AdFkKfQLcoweTpGhqnxbgWbvY89gbIYuu/pgllSaZZmzB536
	 LihLXURwjThx6HF6I8G+vX5Gyxfq0TlfVAEzUJlje6GyZuEjmVqTnbbxF44QujgaF0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769216;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pbX40CWrVLOT/YHu7+KZW17QZIhPw9mc1Sh4MZMymMw=;
	b=LPI2wErudHYmYWlJG+aGaKz8DqGPNGtT8BZ9gSzlVxbEUooS7SgL5nq40pBNV2pqBqYc
	 91SqTTLnZwDnUPHzbuzZSoL0t/Ygnng6WLkFToTjv02g05gY0Kad5seIvDelEKLzGkC28
	 YoQT9suHDQ0k000Hxsx+uW92lvTczxSNrmzd1HiQ33MQBkQlcWO2VGzepzfvr3WL2cCqC
	 Yyha2PQ4+OeWWjq5WvJ8o9PE1OEtCX4FCZC1B71h6JvQAvYUXEymxP0cFfhOCo+11VNSQ
	 Ku7CRbrJvvsrRthjL4uOm5P5DVQQqFUozpMHA6gZgBJDQbCVaT+7yb0VkBWU+r4PSGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=qk7B5iNR;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5076D606A31C
	for <exfat@lists.linux.dev>; Fri, 27 Nov 2026 08:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5076D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=qk7B5iNR
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 715BC1D4A2;
	Fri, 27 Nov 2026 08:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 715BC1D4A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1795769214; bh=XyAQkOK8YjSBObkt4cNyiKhEqW9YOOw6bA+lXOMp/jQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qk7B5iNR44QcIFsVnx6fKIGXd+ggrqlZjl6LqpeUJ/R9peDrS6x3fl9NUcXrpYnKu
	 Z2dxfXpzjQMzS5vrasJw8uATigXaq+Jlnpz77+uxl61y3E02bEmhilkqK7yxgP9x+2
	 H3B+HiI8rUaby0MXrPzxYKrO++nQEcOxAivfIVoI=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id Iln9OnxDCWuoKwMA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Fri, 27 Nov 2026 08:46:53 +0000
Message-ID: <5a004aad-3d7d-4d3f-8a2c-85b6b6ce5573@dev.snart.me>
Date: Fri, 27 Nov 2026 08:46:49 +0000
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
Subject: Re: [PATCH v2] fsck: detect case-insensitive duplicate filenames
To: Yang Wen <anmuxixixi@gmail.com>, linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: yuezhang.mo@sony.com, exfat@lists.linux.dev
References: <20261126150920.2761243-1-anmuxixixi@gmail.com>
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
In-Reply-To: <20261126150920.2761243-1-anmuxixixi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/26 15:09, Yang Wen wrote:
> exFAT file names are case-insensitive, but filter_lookup_file() compares
> them with memcmp().  This makes fsck miss duplicate names that differ only
> in case.
>
> Keep memcmp() as the fast path and fall back to the volume upcase table.
> Add a regression image for case-insensitive duplicate names.
Wait. Hold up.

What does the spec say? Does CHKDSK.EXE fix this? Have you checked? If
not, we shouldn't either.

Let me check and report back.

Davo
