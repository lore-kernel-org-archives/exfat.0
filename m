Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F83386561
	for <exfat@lists.linux.dev>; Mon,  5 Oct 2026 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195577; cv=none; b=Padm4fGUHKvOs2cp1v7PHQwquDjXJS3uTHctCJ0qo7vY98eljLnMOGNETaILZ2+ZeTZxQ0UQPYhMaO1Z9hoALFNtV9e2iHdEBcdjMlnGeo7eFEwrH2FvgY4aWFnj+jl1JXiofsrn0kghpmUtqIZaJdDmwK1k91yVyKF22hfUzz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195577; c=relaxed/simple;
	bh=m8VC3pRHpIqrv1YWkEuKGNAG7iLcdWy3U39CgI31IGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UyzrZcB5fGrCjDoKoF+QJX9PpsSsl+iDIHdh7aCpf+9aOn/BA10qV/hmbWja33J3M7bPaKORlDbFl7pkp5OZieqXuFkkR9Hl3xIZdE7eIKObZPa6LVXbFY/d1+w5hBllOM2BMFb0L1h7LBeAbsDaUPJhBwtcRsq3bf5jFdlpEEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jpWYfDXr; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jpWYfDXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=3eZ6GNi20XHQW1yJA5fWUBUG2ACfvX8eDYNXUASk5oo=;
	b=jpWYfDXrlUzu2FUveGhF15ZQPEc42X+Pb/31nlEWQ9MfjRS8cp6duM+kuvsqza
	wVKIzXU87SFcYzVzR/3SSMa1mqm+xKHLc2Ik1I63gNI6q9yGclIwj5hz5x0G7fsq
	B2g9/Tdvx0NOrq3sgqpOQwYqWm4jzcMbeJ0WTKVUKd9i8=
Message-ID: <5b101dea-77ef-4ae7-b8d9-54df20b0a6a5@163.com>
Date: Mon, 5 Oct 2026 18:18:54 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] exfat: dirty all new pages when extending
 valid_size
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yuezhang.Mo@sony.com, dxdt@dev.snart.me, sj1557.seo@samsung.com,
 Chi Zhiling <chizhiling@kylinos.cn>, Jiale Yao <yaojiale02@163.com>
References: <20261004101934.1975655-1-chizhiling@163.com>
 <20261004101934.1975655-4-chizhiling@163.com>
 <CAKYAXd-2cSYwBcAfGtcAYbK95FfpASRrptz4YUf7Ke-cXK00PA@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd-2cSYwBcAfGtcAYbK95FfpASRrptz4YUf7Ke-cXK00PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PygvCgCHJ1aOecNqakDWCw--.17545S2
X-Coremail-Antispam: 1Uf129KBjvJXoWruFy8ZFW5CF1DtF4UZFWUJwb_yoW8Jr1DpF
	yqgw45JrW8Ww18Gan7tF4xXF1F939xWF4fW3s8X34UAa15WFyDCFWrC3yjkF1ftw4Dt34j
	va98Xr98uryDCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UL2-OUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3BEOq2rDeZGB-gAA3W

On 10/5/26 5:08 PM, Namjae Jeon wrote:
>> @@ -664,90 +664,30 @@ int exfat_file_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
>>   static int exfat_zero_new_range(struct inode *inode, loff_t start, loff_t end)
> Function name and comments no longer seem to match. What do you think
> about changing them like this?
> 
> /*
>   * exfat_prepare_valid_range - populate and dirty folios covering [start, end)
>   *
>   * Populate missing blocks via the read path, which zero-fills data
>   * beyond the current valid_size while preserving uptodate blocks.
>   * Mark entire folios dirty so the newly valid range is written back.
>   *
>   * Call before advancing valid_size.
>   */

Okay, I'll add it to v3.

> 
> And generic/538 test fails with this patch set. Please check if this
> test failure is reproducible for you as well.

I ran the tests, but I wasn't able to reproduce the failure. Could you 
tell me the block size and cluster size used to reproduce it?

There is also a new failure in generic/551. This failure can be fixed by 
adding inode_dio_wait() to exfat_extend_valid_size(). Jiale's patch 
includes this fix:

https://lore.kernel.org/exfat/20261003093035.532916-4-yaojiale02@163.com/T/#u


Thanks.

