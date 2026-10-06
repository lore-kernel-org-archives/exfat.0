Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55373386C0A
	for <exfat@lists.linux.dev>; Tue,  6 Oct 2026 06:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266594; cv=none; b=kxH7H37F/zwqhV1uyF1KxVz9ZwoR1pMRU1SIwtK8emT6DCbWq2QJp8KcQFKeiW/S2J60AINoVXqpu9RFa56LRdu/pNiD7Zd55Q0cjyEX5MMz5YIkFfGFodePFYS9IFpiMYGUkbqqD0GE0ycseKP3VYnTAIVafDdT3plk31QNZH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266594; c=relaxed/simple;
	bh=BUeqe0sop8BUduLCXUTxcm0E7UM++A9aDsUk/MfpBpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYfW5So3MwTevVaj/2Xi7u2cpIeYdV/ixNRcpFeFFHUspVlSoolRG2zI+gDAL7skkmWrrjFcHBo/DtuRbmEzuWE2qe14RO08CqUmIwGSq5ob/x5ABxkHqtOBD4UTofSsOKvRNvWtioztJsYckLTYXy+KroYVMG0UBt6EgKk0XTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cGUFEeww; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cGUFEeww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=4OaGkGeWJuAXAEuqfk9c1g3z4yOyNWqgglafWczMznc=;
	b=cGUFEewwwv8EiY0jsuYyBSz9zOb1vYFOsoT31QUfhIaIsOkyxjPqF04/9/CGOP
	j3OgMwbRF7IJso0vo4cuMmlBu+ySde2OJhQoEPY7lmNK5p1jOrgFZaQdVzww84K5
	sDGp+pMf+sQtUw2CPW/HvLy9OrYfFSzKOs2lgYt8xeHX4=
Message-ID: <c1ab6f08-f277-4645-99ce-5e31ed896a89@163.com>
Date: Tue, 6 Oct 2026 14:02:15 +0800
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
 <5b101dea-77ef-4ae7-b8d9-54df20b0a6a5@163.com>
 <CAKYAXd9u3gC=McjgAVABfsd_JPwKWMteJ=t4r0RAnuZ0worupw@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd9u3gC=McjgAVABfsd_JPwKWMteJ=t4r0RAnuZ0worupw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3z5PnjsRqcY05Cw--.37199S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw15ZF4UWr4xZF45KF1DAwb_yoW8Ww45pF
	W8Ka1rJrWUXw1xt392qFn7XFyS93sxWF1kW345X3sFyas09Fy8GFW8G3y0kr1aqws7Wa1j
	vFs8Xryxur1DGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPOz-UUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2wipR2rEjuhs2wAA3C

On 10/6/26 11:57 AM, Namjae Jeon wrote:
> On Mon, Oct 5, 2026 at 7:19 PM Chi Zhiling <chizhiling@163.com> wrote:
>>
>> On 10/5/26 5:08 PM, Namjae Jeon wrote:
>>>> @@ -664,90 +664,30 @@ int exfat_file_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
>>>>    static int exfat_zero_new_range(struct inode *inode, loff_t start, loff_t end)
>>> Function name and comments no longer seem to match. What do you think
>>> about changing them like this?
>>>
>>> /*
>>>    * exfat_prepare_valid_range - populate and dirty folios covering [start, end)
>>>    *
>>>    * Populate missing blocks via the read path, which zero-fills data
>>>    * beyond the current valid_size while preserving uptodate blocks.
>>>    * Mark entire folios dirty so the newly valid range is written back.
>>>    *
>>>    * Call before advancing valid_size.
>>>    */
>>
>> Okay, I'll add it to v3.
>>
>>>
>>> And generic/538 test fails with this patch set. Please check if this
>>> test failure is reproducible for you as well.
>>
>> I ran the tests, but I wasn't able to reproduce the failure. Could you
>> tell me the block size and cluster size used to reproduce it?
>>
>> There is also a new failure in generic/551. This failure can be fixed by
>> adding inode_dio_wait() to exfat_extend_valid_size(). Jiale's patch
>> includes this fix:
>>
>> https://lore.kernel.org/exfat/20261003093035.532916-4-yaojiale02@163.com/T/#u
> Okay, generic/538 test passed with this patch.
> I will apply this patch and your patch-set.

Okay,

I noticed that these patches have already been merged into the exfat/dev 
branch, and the comments in exfat_zero_new_range() have also been 
updated. So I don't need to send v3, right?


