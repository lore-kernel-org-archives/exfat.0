Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA2D379960
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 02:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787797352; cv=none; b=kCEvIZFyNwEkd8zhRKBe1hZ/CsQ2nxIcuoXkwyrnpqSBzqSn/wX4ZlWW8mW8SSWkgyksUsXm4Tnh7Gf5WumasVDzpOO4YieDkX74V3Rm97x2QxOeEqGwIpkm1KQ7p5alX8pvT98GFciyAQ0oYycaFfNTOmKuIOTHRDSBY3OKevM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787797352; c=relaxed/simple;
	bh=tV2tbkWIuRZE7RBPTiClufk3HfIcr+YCmZkrRVMvy7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhEvGu5fN6vBYUoCtpDMylYbgrkpEZt4AEM1QXQx2tcLGiHyZod3kI6RXWhUtE/Yw3EWzWClqDQx7wclue8UJDvcevxSTscIlMaEvMiFAwW9pQI+xgXd17K4GnK2Ns5luYxujN7h80HwIiwy8VtC0VKS+/pYSpboQWTfzvZx62c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=bX6sAUtH; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="bX6sAUtH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=VddDkYSW5n+ZYdHhj9idPFFuTMZ7oydpcPx/fvm3eLk=;
	b=bX6sAUtH+FD74qX1Op6nNshNVH+UwE18euGhPIKNQonon5eiUQdsVYp/7x4JCP
	SRbtSXHy9TlWRfO4jXpYZmEVE8oYldsKHe3tZKAkrItsz3xvVKIgpPnAWaZRk/OS
	bx98/pJDUD13AEtlRhKJtT99QjeWpoPYoe/y/pOaEwJJg=
Received: from [10.42.0.64] (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wA30YVHn49qSa4nRw--.63972S2;
	Thu, 27 Aug 2026 10:22:00 +0800 (CST)
Message-ID: <de355170-d57d-4247-93ba-521080ca30eb@163.com>
Date: Thu, 27 Aug 2026 10:21:59 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 6/6] exfat: take s_lock in read mode for iomap
 mapping paths
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20260821100531.998196-1-chizhiling@163.com>
 <20260821100531.998196-7-chizhiling@163.com>
 <CAKYAXd_MxctBGgP6_daddk1q9Dwr0ZMAQchXqvEZME_Yo6xSuA@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd_MxctBGgP6_daddk1q9Dwr0ZMAQchXqvEZME_Yo6xSuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wA30YVHn49qSa4nRw--.63972S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrW5CrWkGFW7ZFyxWr4DArb_yoW8GF4Up3
	90gayUKayaq348urWkJFnYgF1Fyw4aqr47JryxKr95Zas0vF1kKa47ua4a9wn3Jwn2kr40
	qFWFkr15W3ZrGwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U7EfOUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3Ah4FmqPn0hpTAAA3t

On 8/27/26 9:08 AM, Namjae Jeon wrote:
>> @@ -68,7 +68,7 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
>>          num_clusters = exfat_bytes_to_cluster_round_up(sbi,
>>                          offset + length) - exfat_bytes_to_cluster(sbi, offset);
>>
>> -       down_write(&sbi->s_lock);
>> +       down_read(&sbi->s_lock);
> If may_alloc is true, Should we use down_write() ?

IMO, there is no need for down_write(); the block mapping of an inode is 
protected by the inode lock, not s_lock. see exfat_fallocate(), where we 
don't hold s_lock.

If may_alloc is true, we need to allocate clusters and append them to 
the file's FAT chain. The allocation is protected by bitmap_lock, while 
the FAT chain is protected by the inode lock, since we hold the inode 
write lock in exfat_file_write_iter(), exfat_fallocate() and 
exfat_truncate(), there is no race when modifying the FAT chain.

Besides, I'm trying to remove s_lock in the next version and am 
considering adding a per-inode lock to exfat_inode_info, since the inode 
lock has a relatively large scope.

Thanks,

> 
>>          iomap->bdev = inode->i_sb->s_bdev;
>>          iomap->offset = offset;
>>
>> @@ -135,7 +135,7 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
>>
>>          iomap->flags |= IOMAP_F_MERGED;
>>   out:
>> -       up_write(&sbi->s_lock);
>> +       up_read(&sbi->s_lock);
>>          return err;
>>   }

