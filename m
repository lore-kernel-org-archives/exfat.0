Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300984A2E1C
	for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 23:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792020609; cv=none; b=pK2PmbjC5YC6W19TfCOpAEn/VVm+ZtA6vbxNutidCzREO1POzI2Khr26pKRBGnGUkDvF7H3RAQ6t6wvidpSIJPuPYLRFatyD9rdM83VSa84+u1Nvsc8NrIPWwpf5+jwXnCcl3xIa1C6LpbUthgAsBKPWJyvDRZLh7VHwBSFZvMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792020609; c=relaxed/simple;
	bh=ooFfoXuxO7m582/nXtDkjaE2ul/5TklQZU1eox80nH4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JwdMw/RRxpDUyCbT6lP0fNulqMf8De3iAzcZONZwfjlZ2PqAxTfcEnwaQycV7Q0c4KLToaLF7Z31+WLxWVCxZxaXbBUYD9L0KLql1n26oxD7rm2tBKlyMeNZF4u51mllZ4snTGmat9Y9ZRtp9mR+aYkMXImh3ank1wFMHZXGaBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fb9zkxgP; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fb9zkxgP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:To:
	Content-Type; bh=U0eU2EDnQnBU/CSAxUC5m8k6ykkFO1pNn8qYzB+Mv6E=;
	b=fb9zkxgPxb8q1Ko+oW/BGXiJ3htilo2BVBiSkikMcFCpNzU0XshOp6cjBOO4/v
	DBx2TwYrGlbRJ/fcQWsgF4x7LToav1FJ66VtIvEfi4ogSPnkv6oIQgz86ZktIPut
	ewcnwQ0l5CGfjrOfRtl+WFJkzk9Ny/vwdO8GheGibob8k=
Message-ID: <ca6b0f0a-e872-489d-843d-a457faa8d8d4@163.com>
Date: Thu, 15 Oct 2026 07:29:26 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] exfat: drop i_rwsem from exfat_page_mkwrite
From: Chi Zhiling <chizhiling@163.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yuezhang.Mo@sony.com, dxdt@dev.snart.me, sj1557.seo@samsung.com,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20261013033837.2748258-1-chizhiling@163.com>
 <20261013033837.2748258-5-chizhiling@163.com>
 <CAKYAXd-+whfZ9_Zrgi0awH2tPxuVLW2O7=6e-w5JcBNBMRrSbw@mail.gmail.com>
 <07bfc007-145b-4ec5-a94e-c9f7bc3eedad@163.com>
In-Reply-To: <07bfc007-145b-4ec5-a94e-c9f7bc3eedad@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCX3YdXENBqVehpEQ--.56376S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF1xKw18uw4fXw17tw1kZrb_yoW5XFyrpF
	WYya4rKFZ8Jw12kFn29FsYya48Kw1SqrWxGF98W3y0vryqvF1UtFWxKrW8uFZ0vwn7X3W2
	qF4qyr93X34DW3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U8pndUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9xfnhWrQEFcjaQAA31

On 10/14/26 4:11 PM, Chi Zhiling wrote:
> On 10/14/2026 9:19 AM, Namjae Jeon wrote:
>>> @@ -969,8 +969,9 @@ static vm_fault_t exfat_page_mkwrite(struct 
>>> vm_fault *vmf)
>>>          loff_t new_valid_size, mmap_valid_size, fault_page_start;
>>>          bool dirty = false;
>>>
>>> -       if (!inode_trylock(inode))
>>> -               return VM_FAULT_RETRY;
>> exfat_page_mkwrite() reads the file size before iomap_page_mkwrite()
>> locks the page. Because inode_trylock was removed, another thread can
>> grow the file in between. exfat_cont_expand() does not take
>> invalidate_lock, so the shared lock does not stop it.
>>
>> mmap write fault                              ftruncate/fallocate
>> Snapshot i_size = 1000
>> new_valid_size = 1000
>> dirty = false
>>                                                Extend i_size to 3000
>>                                                valid_size stays 1000
>> iomap_page_mkwrite() locks folio
>> Checks the current i_size (3000) and succeeds
>> dirty is still false, so VDL is not advanced
>>
>> MM makes the page writable
>> Store at offset 2000, no new page_mkwrite()
>>
>> The data at offset 2000 is beyond valid_size, so it can later be read
>> as zero. Could you check and fix this race?
> 
> This is the issue Yuezhang mentioned earlier, and he has already 
> submitted a fix:
> 
> https://lore.kernel.org/exfat/20261010101200.1211462-2- 
> Yuezhang.Mo@sony.com/

I misunderstood. This is a different issue. I’ll fix this bug as soon as 
possible.

Thanks!

> 
>>
>> +       sb_start_pagefault(inode->i_sb);
>> +       file_update_time(vmf->vma->vm_file);
>> +       filemap_invalidate_lock_shared(inode->i_mapping);
>>
>> With i_size = 12 KB and valid_size = 0, DIO write to [0, 4 KiB  can
>> race with an mmap write fault at offset 8 KB. The fault zeroes and
>> dirties the gap [0, 8 KiB), then advances valid_size.
>>
>> DIO write [0,4 KiB)                         mmap fault at 8 KiB
>> Starts writing data
>>                                               Reads the gap as zero
>>                                               Dirties pages 0 and 1
>>                                               Advances valid_size
>> Completes
>> Post-DIO invalidation cannot remove
>> the dirty page
>> Writeback can overwrite DIO data with zeros
>>
>> Removing  inode_trylock()  from exfat_page_mkwrite() can introduce
>> several racy issues. Could you check that the affected paths are
>> properly synchronized?
> 
> Concurrent DIO and mmap writes are undefined behavior, and other 
> filesystems may have similar issues.
> 
> I've spent quite a while thinking about this, but I still don't have a 
> good solution. So I added the following patch to the patch series:
> 
> "exfat: publish i_size and valid_size on direct I/O completion".
> 
> The purpose of this patch is to prevent stale on-disk data from being 
> exposed when DIO and mmap writes happen concurrently. However, the 
> trade-off is that concurrent DIO writes may have their data unexpectedly 
> zeroed.
> 
> Do you have any thoughts on this?
> 
> Thanks!

