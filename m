Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE028003D
	for <exfat@lists.linux.dev>; Wed, 16 Sep 2026 03:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789528664; cv=none; b=eaoDxNsL5dQqwV+hOxG9ly39eDG2B5fIj/n+qlV3rMUQvHDAUU580XJUCm8ItO8f3GMn8vrrzXUL2T4ENjaifRLRtbfIVEMAR6d0z+3AEPZfiUj1DOsRCiG/WlgOO3eYdXOPUrc+YASLkCeRWDQ6FKznLIW68Y4Yz+4gDoFzUi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789528664; c=relaxed/simple;
	bh=b7FGCox2QwmNPzISoOzIo+A1pMU6WSfogQIJpBm2ESk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0GkFq/JXgKNRJyHcd2SSrY1ugikD5u5siTwX02M4C6vqYpSm9bUK0gFKugJaSFj4FfLezQeg4uj1Sn/+wRfzL/TQTcs7xuMiAer0sXkxAfQEuK96DYyN9xatHBoFunFE+kxMhgR33eAG52M0UQi150oh51jZJ0Sp2/t9tHkRg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=WbXzWR+N; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="WbXzWR+N"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 6FC7A53445;
	Wed, 16 Sep 2026 03:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 6FC7A53445
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1789528078; bh=b7FGCox2QwmNPzISoOzIo+A1pMU6WSfogQIJpBm2ESk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WbXzWR+NHb4K51l5Y0ozlCkMjGtd8X/n5Ps8Ls278M3aJaXFcbKaavEQQp26PkRJ/
	 1fRvSLaa3viW4bWcjvlnEN8L1AvHuU0qrQ41xmEQ6uQ4BoL1WB8itLiecLoqd/Q1W2
	 nu/KYapnhioMxdDD6XXEAXWl0C4YXyyqC2jwYTuA=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id sw7YBg0IqmqmrwkA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Wed, 16 Sep 2026 03:07:57 +0000
Message-ID: <0b82a6b7-8dfb-4445-a9ae-f3029b87ddaf@dev.snart.me>
Date: Wed, 16 Sep 2026 03:07:52 +0000
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: exfat: question about valid_size and page cache
To: Chi Zhiling <chizhiling@163.com>, Namjae Jeon <linkinjeon@kernel.org>,
 exfat@lists.linux.dev
Cc: "Yuezhang.Mo@sony.com" <yuezhang.mo@sony.com>,
 Sungjong Seo <sj1557.seo@samsung.com>, Hyunchul Lee <hyc.lee@gmail.com>,
 ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
 liubaolin <liubaolin12138@163.com>
References: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com>
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
In-Reply-To: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello, Chi.

Excuse me for top posting and intruding(me not being Cc'd), but let me
first preface this by taking your attention to the following
conversation, which was my poor attempt to make VDL sense in Linux
kernel somehow:

https://lore.kernel.org/linux-fsdevel/20260313162408.GE6023@frogsfrogsfrogs/

Excuse my French, but VDL is.... a pain our collective rear ends. It
doesn't fit nicecly with the kernel API's, which are all extent-based
file systems. It is what it is. Expect some irregularities and hacks in
the implementation. I'm sure Namje and Yuezhang did their best to fit
VDL into the kernel API's.

On 9/16/26 02:32, Chi Zhiling wrote:
> Hi, Namjae
>
> I have a question about the valid_size advancement logic in exFAT.
>
> In exfat_zero_new_range(), we zero all folios that are either not
> up-to-date or do not exist. 
> I'm curious whether a page in the page cache can remain beyond
> valid_size. If not, why do we need to skip an uptodate page? There
> should be no uptodate page beyond valid_size, right?
Only when lseek() or pwrite() is not involved.

To your point, I do think that the pages, if they're faulted, should be
first backed by the zero page if userspace only references it, not write
to it just like how read to MAP_ANONYMOUS faults are
handled(empty_zero_page in pgtable.h). Otherwise, we're basically
unnecessarily poisoning the cache. I'm not even sure if it's possible
with folio, though.

If you don't mind, please reference some relevant code so we could be on
the same page(no pun intended)? I'd really like to see how experts
handle this issue.

Cheers,
Davo
