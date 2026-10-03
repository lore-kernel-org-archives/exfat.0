Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F8B3264DD
	for <exfat@lists.linux.dev>; Sat,  3 Oct 2026 01:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990292; cv=none; b=X7m29Zy28uZOFE66x6MRCCPg1W1nz2Sk2VpACI73P1sQG8OeGcPX2vYN2I5vnwW/7igs9hES1CVObpFjd/W3iLVGevBLuB8OHQ/y/MsCg4tNcRSPtaNlee9xHiLAoBaIBoGp7qujy2soHzC+8INX9FAaRU/J3UFEygm7mPy9l9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990292; c=relaxed/simple;
	bh=jKjBEU2G/u0mxvkAGPseny7iUpGj0X0Eo703/Mp1NfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DiA3P2z9T2rwEUEIDn/8/iquHBH9HbiRdOty5QibcX/Q4NP0Ni4SXcHTc7EFhXLpBMJR581rqTtMUmU+hLLkr+xq4kVgYAp/Bv8YMnLMX01FZC/7Tpm0YzXCp4z9eNobuKOPQzxBrFhpJRJ6fih+Ifa/K/IonV0AOp4sP8ZUYGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ezBak8Tz; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ezBak8Tz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=e1JP35jQXmCfGje61PA8ll7NFwaeQspGgbKgiQs9QZo=;
	b=ezBak8Tzllh4oeuLVGJzY+yPkz3r6OSGFK+l+JMbtPtald2tWrlOZrCsDL72hU
	jkxNzUvGnbnkssbI7axho8LtCBDJxsmX9sAc+lInb0B4lhffJYWdLuIjf7huwBC3
	pZPzzCqixdYVQJSJc8tAsXL8SQYcU8DbI9c9jtw/M3re4=
Message-ID: <eb7855e6-2972-42a7-ace0-e43dc4096677@163.com>
Date: Sat, 3 Oct 2026 09:17:18 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] exfat: drain in-flight DIO before buffered writes
To: Jiale Yao <yaojiale02@163.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 "Darrick J. Wong" <djwong@kernel.org>, exfat@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260928085412.2221055-1-yaojiale02@163.com>
 <20260928085412.2221055-4-yaojiale02@163.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20260928085412.2221055-4-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wAHB7meV8Bq5ToiCQ--.39857S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCryDGw43Cw45XryxKF1rJFb_yoW5Jw18pr
	Z8Kay5Gr92yrZ7WrnruF43W3WFk398J3y3urWxu3WDCryYyr4vgF18KFy2vF43JwsrGr42
	qF4v9FykCryUCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRJkuxUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9wDIZmrAV6DPOgAA3x

On 9/28/26 4:54 PM, Jiale Yao wrote:
> An asynchronous direct write can remain in flight after the inode lock is
> released.  If a buffered write dirties page cache while the direct write
> is still pending, the direct write's post-I/O invalidation can find the
> dirty pages, report a page cache invalidation failure, and record -EIO in
> the mapping error sequence.  A later fsync() therefore returns -EIO.
> 
> Commit 15cdefd0c0522f9d5e12d947fa04f4c11649b699 ("ext4: drain
> in-flight DIO before buffered write fallback") fixed the same race in
> ext4.  ExFAT does not drain in-flight DIO before either a regular buffered
> write or the buffered fallback after iomap_dio_rw() returns -ENOTBLK or a
> short write.
> 
> Wait for in-flight DIO before calling iomap_file_buffered_write() in both
> paths.
> 
> A reproducer using concurrent AIO direct writes and buffered fallback
> triggered the following warning and made a subsequent fsync() return
> -EIO:
> 
>    Page cache invalidation failure on direct I/O.  Possible data corruption
>    due to collision with buffered I/O!
> 
> Fixes: 867b9c96dc83 ("exfat: add iomap direct I/O support")
> Link: https://lore.kernel.org/r/20260629113827.4074335-3-libaokun@linux.alibaba.com
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   fs/exfat/file.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index a2a9ee1a2004..28811210663f 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -807,6 +807,8 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
>   
>   	iocb->ki_flags &= ~IOCB_DIRECT;
>   
> +	inode_dio_wait(file_inode(iocb->ki_filp));
> +
>   	written = iomap_file_buffered_write(iocb, from, &exfat_write_iomap_ops,
>   			NULL, NULL);
>   	if (written < 0)
> @@ -889,11 +891,17 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
>   			goto unlock;
>   	}
>   
> -	if (iocb->ki_flags & IOCB_DIRECT)
> +	if (iocb->ki_flags & IOCB_DIRECT) {
>   		ret = exfat_dio_write_iter(iocb, iter);
> -	else
> +	} else {
> +		/*
> +		 * Prevent concurrent direct I/O and buffered I/O to the same file
> +		 * range. Wait for in-flight DIO to finish before dirtying pages.
> +		 */
> +		inode_dio_wait(inode);
>   		ret = iomap_file_buffered_write(iocb, iter,
>   				&exfat_write_iomap_ops, NULL, NULL);
> +	}
>   	if (ret < 0)
>   		goto unlock;
>   

Also, if you don't mind, could you add inode_dio_wait() to 
exfat_extend_valid_size() as well?

Thanks.

