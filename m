Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7753A83A8
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299788; cv=none; b=LHZWDavMfdga24Cr2LHWnYG4vnKgbwX2e8GnXX1eVef54F4xaGgSuM1GCH9ooCa6MzopR1YA/gHPOe5Yom1THNM4g7qq7G0N6rHvcbMcuaToSDI0fkuR2xx/Le6I3Sfnty+nDBWrf7Q05UQRseft6tlwa7rntzjM6Yn96Fohh2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299788; c=relaxed/simple;
	bh=311ElEOY3gPyZpTODijJyTZfE+EkiT2FyzD9owvjRPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q0TC6DqEPIHUAZGp6JDihvzYm9+udXXqS+m1fDZAxb0qyiFP/OcTVWju0d3a+EyjMbdn1hrVCdTaRAMBUIcRz5s3TzDnhOUYGHb62E76OYLqH+0oUF/PQlX4IX4g7scPIQ+SkZOvRFJGVSB2wS6e1nDWbR9zp/DxilVZGtKsTOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=CAkNGTHK; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="CAkNGTHK"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id E30A61D455;
	Fri, 21 Aug 2026 08:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me E30A61D455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787299785; bh=311ElEOY3gPyZpTODijJyTZfE+EkiT2FyzD9owvjRPU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CAkNGTHKKM/SoJbtUaJ8eYKXXGoRpz6RMRPv8Jg4TOAQvEQ510XL2bldiIBbgSOHe
	 xD2pw8GxXugrfmcxVJOYjpvyqMsj7bVCTE280+wLPtqM9jBNAi3Mv9fgEDTUo60iBo
	 EHm7ocMgkwq1g5KnqqQPwfdj5j3BR8yc5bRJVDo4=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id RM95JcgHiGq3UQAA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Fri, 21 Aug 2026 08:09:44 +0000
Message-ID: <cdcb9a83-818f-4064-8b06-b76251f8b6bd@dev.snart.me>
Date: Fri, 21 Aug 2026 17:09:43 +0900
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] treewide: run internal library tests in "make
 check"
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, exfat@lists.linux.dev,
 Sam James <sam@gentoo.org>
References: <20260821060741.92772-1-dxdt@dev.snart.me>
 <20260821060741.92772-3-dxdt@dev.snart.me>
 <CAKYAXd9FD2JVKVfMV3=Nxx6MkDA7566AJT1cqQfFnavZ5m7GzQ@mail.gmail.com>
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
In-Reply-To: <CAKYAXd9FD2JVKVfMV3=Nxx6MkDA7566AJT1cqQfFnavZ5m7GzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/21/26 16:02, Namjae Jeon wrote:
>> diff --git a/configure.ac b/configure.ac
>> index ab6fb5d..99bad24 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -52,7 +52,7 @@ PKG_CHECK_MODULES([BLKID], [blkid >= 2.20], [AC_DEFINE([HAVE_BLKID], [1], [Defin
>>         [PKG_CHECK_MODULES([EXT2_BLKID], [blkid], [AC_DEFINE([HAVE_EXT2_BLKID], [1], [Define if libblkid is from libext2])])])
>>
>>  AC_ARG_ENABLE([tests],
>> -       AS_HELP_STRING([--enable-tests], [build internal test programs])
>> +       AS_HELP_STRING([--enable-tests], [always build internal test programs (not just for "make check")]),
>>         [enable_tests=yes]
> I have updated it like this and will apply it to #exfat-next.
>
> -       AS_HELP_STRING([--enable-tests], [build internal test programs])
> +       AS_HELP_STRING([--enable-tests], [always build internal test
> programs (not just for "make check")]),
> -       [enable_tests=yes]
> +       [enable_tests=$enableval],
> +       [enable_tests=no]
>
> Thanks!
Just a quick question: is this a real problem where "enable_tests" is
set to "yes" before running ./configure? I don't object to explicitly
specifying [enable_tests=no] as a common pattern going forward. I'm just
curious if there's any reasoning behind this.

Davo
