Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCF43EC813
	for <exfat@lists.linux.dev>; Fri,  9 Oct 2026 06:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526393; cv=none; b=C4U4+yVFqx97S0B8jSlODK/bfDmia7lUYa+l4Upb8slPEfYXgOJLyBa6elsliW3Ul2/KKwuXsgfCV8gO0SM1v04NcBiRb5gAnNd9ide4UID6VQECA1l8FZ3gGd2aKV1xmfhqIHZN0EHPfEDM3lSXMsuKkh+n7Y35UMC0bejJ+DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526393; c=relaxed/simple;
	bh=35FVDUgLPmlR42ZcIusCQlBwJrVkVMHzMD0g8hDXo5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMeolBpjdYN5zJiyPuqhC/mr6TdF5y8WFMYaRv3YgNhOQOBCqA1fyI7Ir1MtWqt4QkVP9A7YcY6MgdVRPmtdGAYfMxkJLIvqR4lhZXpii2zkLyDbt/2BJN8exNAHOOJZZf8rN8qwr0Yz71jXEkXga6iDbaO57DPRngpgOFF+JL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iHgpQy0g; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iHgpQy0g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=PjUkM5nNy7yy+R2kee0RkF6RIvyrz9My4JOxmq1YZCw=;
	b=iHgpQy0gSiROFhbposPRhzlhq7WzuUsePxiymbh71+8tIxMMLkt1j2JgxEbCUc
	i+67V/fevnQghznkXPVYinJI/9fv5601bsyWfZWE0yg01FkUsznlPinKnzWvF56m
	MrLhDSZWgEgBj3E7NS5owABMfAH+D4XXxQVr4Z4IDkxps=
Message-ID: <c4cecbd4-9f4b-4b07-94fe-20e4abfdaf0b@163.com>
Date: Fri, 9 Oct 2026 14:12:35 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] exfat: mark straddling folio RO for 4K block size
To: "Yuezhang.Mo@sony.com" <Yuezhang.Mo@sony.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linkinjeon@kernel.org" <linkinjeon@kernel.org>,
 "sj1557.seo@samsung.com" <sj1557.seo@samsung.com>,
 "dxdt@dev.snart.me" <dxdt@dev.snart.me>,
 "exfat@lists.linux.dev" <exfat@lists.linux.dev>
References: <20260930104332.4022207-2-Yuezhang.Mo@sony.com>
 <ff3a2271-542a-44a0-b5a0-700990119630@163.com>
 <PUZPR04MB6316DF5C2179DCD7B4200A6A81922@PUZPR04MB6316.apcprd04.prod.outlook.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <PUZPR04MB6316DF5C2179DCD7B4200A6A81922@PUZPR04MB6316.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD335TThchq1sOxDA--.4199S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFW5Wr4xGryDtrWkur1xZrb_yoW8CFWrpr
	W3G3Z8trs8G347uw1jqw1Fqr1F934DWF12yasxK3y7AFyqy3WI9rs7trW5WrWjqF4xJw10
	gws7t3yfZF1vy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pNoGQXUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3BRjAWrIhdTOcQAA3m

On 10/9/26 10:46 AM, Yuezhang.Mo@sony.com wrote:
>>>    #include "exfat_raw.h"
>>>    #include "exfat_fs.h"
>>> @@ -91,6 +92,20 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
>>>         */
>>>        pagecache_isize_extended(inode, oldsize, inode->i_size);
>>>
>>> +     if (i_blocksize(inode) >= PAGE_SIZE && (oldsize & (PAGE_SIZE - 1))) {
>>> +             struct folio *folio;
>>> +
>>> +             folio = filemap_lock_folio(inode->i_mapping,
>>> +                             oldsize >> PAGE_SHIFT);
>>> +             if (!IS_ERR(folio)) {
>>> +                     if (folio_mkclean(folio))
>>> +                             folio_mark_dirty(folio);
>>> +
>>> +                     folio_unlock(folio);
>>> +                     folio_put(folio);
>>> +             }
>>> +     }
>>
>> I think fixing this issue specifically for the block size = 4K case may
>> not be thorough enough, because pagecache_isize_extended() may also fail
>> to work when the block size is smaller than 4K.
> 
> What condition might pagecache_isize_extended() fail to work when the block
> size is smaller than 4K?

I didn’t explain this clearly. What I meant is that the issue is not the 
block size, but the fact that VDL in exFAT is not block-aligned. 
pagecache_isize_extended is designed to work at block granularity, so it 
won’t work either if oldsize and newsize fall within the same block.

/* Page straddling @from will not have any hole block created? */
rounded_from = round_up(from, bsize);
if (to <= rounded_from || !(rounded_from & (PAGE_SIZE - 1)))
         return;

> 
>>
>> We should set the folio containing valid_size to RO whenever valid_size
>> != i_size and valid_size is not page-aligned, regardless of the block size.
> 
> We should set the folio containing oldsize to RO, rather than valid_size.
> This is because, when the folio containing oldsize was first set to RW, oldsize
> constrained valid_size, after the file size is subsequently expanded, that
> constraint changes, necessitating a re-setting of valid_size.

Yes, using oldsize is better.

