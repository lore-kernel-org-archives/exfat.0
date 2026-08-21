Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A1543CE5D
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301015; cv=none; b=PCNyHcoD44XyRYfgvK0/9KF12QNYkoLpCGT0WAA6yc8XsDvxp2zuQA9D2BL9XB6yntUIVRZzIIwjZCTtVm673ZXQUQ2mE6qH64Zkn2bKSQ0HLq2N0r3+93sONjjZkvrCtPi9nRJKkWX2LTS/KzXBhdc082W1+USZJyRmoFV5A5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301015; c=relaxed/simple;
	bh=Lxpvf9h5ni3400KQnHBqA6AtOtS1X2fpIDmtre4qdSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWWijCOfWJxxsbtY5Mhp0QMJwthGJN1MDxE7e3odtlp2Nb8dvJgr5LydHQruAGg89jVkoNeLsquH2V8laTd3BGoULQDQiUc3PB1/Il203CK7ecr4XaaZva8EQST5ORhhxERknISBSDpyd0nyQbaJtYdCUewTUfUWL+7TP3d+lvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=tp4dlHJT; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="tp4dlHJT"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id AFABD1D455;
	Fri, 21 Aug 2026 08:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me AFABD1D455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787301010; bh=Lxpvf9h5ni3400KQnHBqA6AtOtS1X2fpIDmtre4qdSA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tp4dlHJTrKClOjOeg9RGXRRGrbNqa8Xw1heewhm+jzLX2AAXrvNd3ZvQX4oJRcpg+
	 RgSEpRyYFqSUROdhLYfghaNAcRXzn98IBQK2qsiJAyI0ApWQuAiIsWA11jkgHEpp/B
	 A/5dJKTnWvuXWVVrFNhgpcQ5dCCpjCDM+Zbudzks=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id 38SNF5EMiGoIUwAA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Fri, 21 Aug 2026 08:30:09 +0000
Message-ID: <c4af577a-4f65-4f1b-a7cd-f28ab9d3a7ac@dev.snart.me>
Date: Fri, 21 Aug 2026 17:30:06 +0900
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0 0/1] mkfs: set MAP_NORESERVE to force overcommit in
 exfat_map_blankmem()
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, exfat@lists.linux.dev
References: <20260821082454.9976-1-dxdt@dev.snart.me>
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
In-Reply-To: <20260821082454.9976-1-dxdt@dev.snart.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/21/26 17:24, David Timber wrote:
> This is taken out of GH PR #380. I though it didn't belong there and
> I'd like to sit on the PR for a little while longer than I anticipated.
>
> The patch doesn't really fix anything, especially with modern beefy
> hardware. It just prevents mkfs from munching on RAM on embedded
> systems. That is the behaviour I intended in the first place.
>
> Thanks,
>
> David Timber (1):
>   mkfs: set MAP_NORESERVE to force overcommit in exfat_map_blankmem()
>
>  include/libexfat.h | 10 +++++++---
>  lib/libexfat.c     |  4 ++--
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
Oh, and, I think you should add

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

(from GH PR)
