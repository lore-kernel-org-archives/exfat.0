Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80CC41A928
	for <exfat@lists.linux.dev>; Tue,  6 Oct 2026 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290817; cv=none; b=L9TpTH17LPqUxvXGZu7A/h4WgFshqa7QMa2NZ045Aqwxb9lz0+6E9GVPh0LWScR/Tb/LMqcsDhRWbTpnI+yoJ/ADL3WrxHYrBkFAH7K6z7ljF6RUlqdhTCqw7q7XvUxvFJsHXaaIcRmW6n2cG35A+FS8pIMsXIl92wPg1/nTG1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290817; c=relaxed/simple;
	bh=R72NPvOuQ6e2UyG9GZVXQfcWUZHF2on8NKI/dYIzBbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cnC/R91EU5rK+8QSWFK3snNo/21BCb7N/HyZy9PEE2XAxVtPgxaCiMozla1BfDqxnxjuBKd5R/S6ZwfztsFU8bCmFGPiT59THdbZ5wiH0Qwz/wgng+UoGLZh/ZsDIZCryyMX0m1aGBQ/IXGuw3a+7ti3Spb4jdGqQdM2TdOlvPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LiHOm/dw; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LiHOm/dw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=4H7N/PFGdR9C/OA1qduSI6nayiZubCZ9HlKPIcu+HB8=;
	b=LiHOm/dw4RWOOOidkD52BRG94F/92DCMy7xjOpt9+kF4yAADpXc0Vuh6MxbFt6
	goWnGvJ0FJQBFAqMdFSNzGU77nXnCNiHb5zdi5Jb7YnKhpJgjpbQEmc29tZCvUXs
	6tFT5LKe8q452fi9noqeSMSaoVj26yJT+QAIjooF+N1pE=
Message-ID: <98d26a59-6955-4e1d-8588-eef9a0303ca0@163.com>
Date: Tue, 6 Oct 2026 20:46:05 +0800
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
 <c1ab6f08-f277-4645-99ce-5e31ed896a89@163.com>
 <CAKYAXd-v5W8g_Ho81Xa+hJ5mbA3wrdUcY1K9X-RjpMHbiivXnw@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd-v5W8g_Ho81Xa+hJ5mbA3wrdUcY1K9X-RjpMHbiivXnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v62N7cRqj2H5Cw--.39581S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw18XFyxAF1UCw4rJw4xZwb_yoW8ZFWrpF
	W8Ga15ArWUJw17J392qFn7XF1rt3sxWFn7Xry5X34UArZ09Fy5KrWkJrWjkF1aqwn8uw4j
	vFs5XryxZr1DJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UdsqAUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3A5qCGrE7Y7KlgAA3h

On 10/6/26 2:30 PM, Namjae Jeon wrote:
> On Tue, Oct 6, 2026 at 3:02 PM Chi Zhiling <chizhiling@163.com> wrote:
>>
>> On 10/6/26 11:57 AM, Namjae Jeon wrote:
>>> On Mon, Oct 5, 2026 at 7:19 PM Chi Zhiling <chizhiling@163.com> wrote:
>>>>
>>>> On 10/5/26 5:08 PM, Namjae Jeon wrote:
>>>>>> @@ -664,90 +664,30 @@ int exfat_file_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
>>>>>>     static int exfat_zero_new_range(struct inode *inode, loff_t start, loff_t end)
>>>>> Function name and comments no longer seem to match. What do you think
>>>>> about changing them like this?
>>>>>
>>>>> /*
>>>>>     * exfat_prepare_valid_range - populate and dirty folios covering [start, end)
>>>>>     *
>>>>>     * Populate missing blocks via the read path, which zero-fills data
>>>>>     * beyond the current valid_size while preserving uptodate blocks.
>>>>>     * Mark entire folios dirty so the newly valid range is written back.
>>>>>     *
>>>>>     * Call before advancing valid_size.
>>>>>     */
>>>>
>>>> Okay, I'll add it to v3.
>>>>
>>>>>
>>>>> And generic/538 test fails with this patch set. Please check if this
>>>>> test failure is reproducible for you as well.
>>>>
>>>> I ran the tests, but I wasn't able to reproduce the failure. Could you
>>>> tell me the block size and cluster size used to reproduce it?
>>>>
>>>> There is also a new failure in generic/551. This failure can be fixed by
>>>> adding inode_dio_wait() to exfat_extend_valid_size(). Jiale's patch
>>>> includes this fix:
>>>>
>>>> https://lore.kernel.org/exfat/20261003093035.532916-4-yaojiale02@163.com/T/#u
>>> Okay, generic/538 test passed with this patch.
>>> I will apply this patch and your patch-set.
>>
>> Okay,
>>
>> I noticed that these patches have already been merged into the exfat/dev
>> branch, and the comments in exfat_zero_new_range() have also been
>> updated. So I don't need to send v3, right?
> For now, yes. I am currently doing other tests, and if there are some
> issues for these patches, I will request v3 to you.

Okay!


