Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C0395240
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299592; cv=none; b=U7sFi5XVR8fGwivODSFLaiqSRRij0cKRnETNN4O799p0ervPTrTa/ORxKv+1gkjtIbpIdxzbf47kVPIW5tLIHTy3IO0jxghz2BOeh+Hf73VRJjoi7seLmtM8f1nllvOlm5N1fU1Fqfmx/iXAbHDiabw6/GIUn3Xv7ysrJhZ3Csc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299592; c=relaxed/simple;
	bh=HYCrByLe9Ar0tV12+S+80vObPKhOCHkVf7K+LCZExk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItPSjO++BLlX/tJDRms/2zwXd36iw7qtdy83YXxDTJO55QNNzy7GZ1kHGD5RdFM9IGeEHQ/Tqy0/v1j7Qvj6QCPDanrs9f9pKMHK54G+dNY9o8x3nPISIxaD6IeM7MUhciUwXHgD8bK0ZKxZJSNxl9An5k+lvZ7CvRsji/OU/A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=N/1PKscc; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="N/1PKscc"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 0A3A31D455;
	Fri, 21 Aug 2026 08:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 0A3A31D455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787299589; bh=HYCrByLe9Ar0tV12+S+80vObPKhOCHkVf7K+LCZExk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N/1PKsccysPuA2MPtBreRzHXtIjGm/9zBdJYFAoqalVlzwk6TuEcQeLiwcQPowSl7
	 /AFE2qwTGWA1mUZ9foqQCXU1628hTtRhGVTM3NvIZ2wRIR0RYt5g/kZDbYGB6mkAwg
	 Ur7zty7VZ0EYCozM8aubnJKYW75TejaC5h6kJj/A=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id aneqKgQHiGqIUQAA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Fri, 21 Aug 2026 08:06:28 +0000
Message-ID: <3282041a-41c1-409b-b17d-bd6d27958e56@dev.snart.me>
Date: Fri, 21 Aug 2026 17:06:25 +0900
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] libexfat: remove use of sscanf()
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, exfat@lists.linux.dev
References: <20260821060741.92772-1-dxdt@dev.snart.me>
 <20260821060741.92772-2-dxdt@dev.snart.me>
 <CAKYAXd9FWrUtr6b-0fqwgxMKM3XQStsu9BZxfYmotVtFVFimTw@mail.gmail.com>
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
In-Reply-To: <CAKYAXd9FWrUtr6b-0fqwgxMKM3XQStsu9BZxfYmotVtFVFimTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/21/26 15:46, Namjae Jeon wrote:
>> diff --git a/lib/libexfat.c b/lib/libexfat.c
>> index ff0b25b..9cbb17f 100644
>> --- a/lib/libexfat.c
>> +++ b/lib/libexfat.c
>> @@ -167,9 +167,9 @@ static int get_intbool_envvar(const char *name)
>>         const char *env = getenv(name);
>>
>>         if (env != NULL) {
>> -               int v = -1;
>> +               long v = -1;
>>
>> -               if (sscanf(env, "%d", &v) == 1)
>> +               if (exfat_parse_long(env, &v) == 0)
> I have updated this line like the following one.
>
> + if (exfat_parse_long(env, &v) == 0 && v >= 0)
>
> And I will apply this patch if you don't object to it.
> Thanks!
>
My intention was to accept negative values as well, but I guess it
doesn't really matter.

All good!
