Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E254B431E47
	for <exfat@lists.linux.dev>; Mon,  7 Sep 2026 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768335; cv=none; b=ex6vpNVHT5daSDyNBZ/eRxUJqm8ETlzRMGdskpkT0gF9RImrQUcWebDTkRrVxaN+W/iZiLrTNGKiNIRzZ0kLlSpEW4niCKQ0e5Yh5EbdmVGVKifeSkscAGQVPiyhUmQialJVQjMv4DNe0zpE+1HWTLaWpWHXLX4Y+K/AFLpzGLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768335; c=relaxed/simple;
	bh=qFeQeT9RL6sflpHQsKPdZQF57cc7Iw7PpAMpOBOR+Jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ApqGMUB24oXI/fsWi0Xc40trvIV8rYfVYdAiNdOvb5Zk38D+QQaAFQeMD8jmLUdsIO8XHcxIbbq6hFOHppaHxIW1Vq8rp7e2EkgNPNawTco+SGmIq7ydGqvVZgABuGUFG4lZnmQqhzwajEytamsFhDbJpzHOTu5gh9qtAFNJacI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=b+uezJIu; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="b+uezJIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=1ZmA2XqKhMsAW53N8Mt/vJGAUK8o5bte9KbUXtpQ+Uw=;
	b=b+uezJIu9nN97fdme2mFtVTIiDGnS3eS/3t/FHTpwnNt2CmTZFcTLlX2AA2yO/
	cqNH9fuOgxYwUx+jdt2E9CUTz+DpPkpLwn4wYxOCIqFPLu1NJ2DZEPNVR8ZUTley
	upthLrM6l+VEIP3Sq62Hg5N+TPLzDhrk+kSAamiwEXurk=
Message-ID: <6d6c01f9-4cc2-4e63-a765-f735452e7eab@163.com>
Date: Mon, 7 Sep 2026 16:04:58 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 2/2] exfat: take bitmap_lock at the start of
 exfat_alloc_cluster()
To: David Timber <dxdt@dev.snart.me>, exfat@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo
 <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20260905054951.674766-1-chizhiling@163.com>
 <20260905054951.674766-3-chizhiling@163.com>
 <0eb35731-1d8f-4f46-9a0d-36a45ceccfb2@dev.snart.me>
Content-Language: en-US
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <0eb35731-1d8f-4f46-9a0d-36a45ceccfb2@dev.snart.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PigvCgDnLxcqcJ5q4yOWRQ--.56373S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF43Cr45GrykKry3Kr17Wrg_yoW5AF48pr
	WFka1Ykrs8Xw4DWF4Igr18uF1ruw4xG3WUJFZ3ta4jyr98Z3ZY9r90qFn5uFyqqw47AanF
	qr1Ygw48urZIkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTHqxUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3AxpB2qecCwZyQAA3G

Hi, David


On 9/7/26 11:21, David Timber wrote:
> On 9/5/26 05:49, Chi Zhiling wrote:
>> From: Chi Zhiling <chizhiling@kylinos.cn>
>>
>> exfat_alloc_cluster() checks sbi->used_clusters against the total
>> number of data clusters before acquiring sbi->bitmap_lock. A concurrent
>> allocation can update sbi->used_clusters after the check but before
>> the lock is acquired, making the check stale. This can allow the
>> allocation to proceed even though there are not enough free clusters,
>> causing it to fail partway through.
>>
>> Acquire sbi->bitmap_lock before checking sbi->used_clusters so that
>> the free-space check and subsequent cluster allocation are serialized
>> with concurrent allocations.
>>
>> Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
>> ---
>>   fs/exfat/fatent.c | 17 ++++++++++-------
>>   1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/fs/exfat/fatent.c b/fs/exfat/fatent.c
>> index a6728c361289..3c8bdc131f6f 100644
>> --- a/fs/exfat/fatent.c
>> +++ b/fs/exfat/fatent.c
>> @@ -427,19 +427,22 @@ int exfat_alloc_cluster(struct inode *inode, unsigned int num_alloc,
>>   	struct super_block *sb = inode->i_sb;
>>   	struct exfat_sb_info *sbi = EXFAT_SB(sb);
>>   
>> +	mutex_lock(&sbi->bitmap_lock);
> Speaking of which, I think we should do this as well:
> 
> diff --git a/fs/exfat/super.c b/fs/exfat/super.c
> index 217d150652cf..238533982831 100644
> --- a/fs/exfat/super.c
> +++ b/fs/exfat/super.c
> @@ -62,7 +62,9 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
>          buf->f_type = sb->s_magic;
>          buf->f_bsize = sbi->cluster_size;
>          buf->f_blocks = sbi->num_clusters - 2; /* clu 0 & 1 */
> +       mutex_lock(&sbi->bitmap_lock);
>          buf->f_bfree = buf->f_blocks - sbi->used_clusters;
> +       mutex_unlock(&sbi->bitmap_lock);
>          buf->f_bavail = buf->f_bfree;
>          buf->f_fsid = u64_to_fsid(id);
>          /* Unicode utf16 255 characters */
> 
> 
> Because there's a short window of chance that stale data is returned to
> userspace on NUMA systems. For example, if a shell script or a
> multi-threaded process makes changes to the fs and pulls statfs() in
> rapid succession, the kernel might give userspace a wrong impression
> that the fs has been chnaged by other users when it's really just a
> cache coherency issue.

You mean one user has changed the fs, and others see the stale value of 
used_clusters?

For SMP (including NUMA), if a certain CPU changes the value of 
used_clusters, then the caches of all other CPUs will be invalidated and 
need to be refilled. This process is completed by the hardware, see MESI 
protocol.

> 
> Well, this happens all the time with CoW-based fs like btrfs and zfs.
> But this is a traditional fs and people would expect generally the same
> behaviour as FAT(which does the right thing by placing a lock before
> counting clusters).

Perhaps I didn't fully understand your meaning. What is the FAT's behavior?


Thanks,

