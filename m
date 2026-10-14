Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A4D49EC61
	for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965541; cv=none; b=XynACAb2XBZB4T1tTkcqzxjsWxzbLkkxDRCLRyOuiKqpqgbHWpuyu+SPatl37nTY2hk3u+uS0tQJhswiwcKGmLu0Jg/wfXkCw4em7mUjV8Y/EyFICLJhqIGCjAUWpqxEPy9AG4ukhqi5pLQ59wMoBkzEJRouWdtd9J8xsvnZvZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965541; c=relaxed/simple;
	bh=JGcqGwBUE5iT4PuhKMKigfUdggUsfgSpmenKCJW8G9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3kshW3klT1QqtRs22h2BMjEQjkKxSEqNehODZZ2uDDnCH4lCAVMLm0OKBDhkyy0DwuDoJwNvnkbDLkQzE2Qb2fAUb3e5D2sBwlisei3KXZZ80Jp7LaomiP5VXY9hEn3M/20TgDdE2P1UJXwOS6HTCF/nuCQGQtEsu1I1IkJuRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KXb548I1; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KXb548I1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=bJMTlEhOQmjpDyXiQUhJm1mKByD3aMro94dbh75mtTw=;
	b=KXb548I19YxyxUxg6BQ4kAvj6kn2clFeVq8S7N3eF8ih7bK/nvYjZSkmnIfft0
	JGGUoYhbWamI1TXfqvAMk725UyUGfeuTR631P22G/yJ03+PtJnid9d+eSIMqcPLL
	qzyBrOz5aHPfvS/C4gzRAf2rYETpQwExOOBf99OPXD1Fo=
Message-ID: <07bfc007-145b-4ec5-a94e-c9f7bc3eedad@163.com>
Date: Wed, 14 Oct 2026 16:11:41 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] exfat: drop i_rwsem from exfat_page_mkwrite
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yuezhang.Mo@sony.com, dxdt@dev.snart.me, sj1557.seo@samsung.com,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20261013033837.2748258-1-chizhiling@163.com>
 <20261013033837.2748258-5-chizhiling@163.com>
 <CAKYAXd-+whfZ9_Zrgi0awH2tPxuVLW2O7=6e-w5JcBNBMRrSbw@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd-+whfZ9_Zrgi0awH2tPxuVLW2O7=6e-w5JcBNBMRrSbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3v6E+Oc9qRdrZEA--.5933S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFyUuFy5GFW5ZF4UJF4UCFg_yoW5JFWDpF
	Wak34rCFZxAw129rn7uFnYya48Gw1fXr4xGF98uw40vr9Fyw1jgFWxKrZ5uFW5Zwn3X3W7
	tFsYvF97J34DW3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRP73dUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3AHsimrPOUENCQAA3i

On 10/14/2026 9:19 AM, Namjae Jeon wrote:
>> @@ -969,8 +969,9 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
>>          loff_t new_valid_size, mmap_valid_size, fault_page_start;
>>          bool dirty = false;
>>
>> -       if (!inode_trylock(inode))
>> -               return VM_FAULT_RETRY;
> exfat_page_mkwrite() reads the file size before iomap_page_mkwrite()
> locks the page. Because inode_trylock was removed, another thread can
> grow the file in between. exfat_cont_expand() does not take
> invalidate_lock, so the shared lock does not stop it.
> 
> mmap write fault                              ftruncate/fallocate
> Snapshot i_size = 1000
> new_valid_size = 1000
> dirty = false
>                                                Extend i_size to 3000
>                                                valid_size stays 1000
> iomap_page_mkwrite() locks folio
> Checks the current i_size (3000) and succeeds
> dirty is still false, so VDL is not advanced
> 
> MM makes the page writable
> Store at offset 2000, no new page_mkwrite()
> 
> The data at offset 2000 is beyond valid_size, so it can later be read
> as zero. Could you check and fix this race?

This is the issue Yuezhang mentioned earlier, and he has already 
submitted a fix:

https://lore.kernel.org/exfat/20261010101200.1211462-2-Yuezhang.Mo@sony.com/

> 
> +       sb_start_pagefault(inode->i_sb);
> +       file_update_time(vmf->vma->vm_file);
> +       filemap_invalidate_lock_shared(inode->i_mapping);
> 
> With i_size = 12 KB and valid_size = 0, DIO write to [0, 4 KiB  can
> race with an mmap write fault at offset 8 KB. The fault zeroes and
> dirties the gap [0, 8 KiB), then advances valid_size.
> 
> DIO write [0,4 KiB)                         mmap fault at 8 KiB
> Starts writing data
>                                               Reads the gap as zero
>                                               Dirties pages 0 and 1
>                                               Advances valid_size
> Completes
> Post-DIO invalidation cannot remove
> the dirty page
> Writeback can overwrite DIO data with zeros
> 
> Removing  inode_trylock()  from exfat_page_mkwrite() can introduce
> several racy issues. Could you check that the affected paths are
> properly synchronized?

Concurrent DIO and mmap writes are undefined behavior, and other 
filesystems may have similar issues.

I've spent quite a while thinking about this, but I still don't have a 
good solution. So I added the following patch to the patch series:

"exfat: publish i_size and valid_size on direct I/O completion".

The purpose of this patch is to prevent stale on-disk data from being 
exposed when DIO and mmap writes happen concurrently. However, the 
trade-off is that concurrent DIO writes may have their data unexpectedly 
zeroed.

Do you have any thoughts on this?

Thanks!

