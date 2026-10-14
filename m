Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BD7185B48
	for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 07:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961669; cv=none; b=YONq+loywV6M5X6yqg1fYubxMq86/fAInBYkk7QPAMuOyHiB4V7+l0lyhwPCWORYCLinNZb3Nhd9bPC9EC9+xwkbVTIVMpmmFvWIi2st6MsSIM2TU3hftsbGcXdNljp/6CAv0Fe9AsI92TuDD6rnHk32d/1YDChmL9EKW4B9PxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961669; c=relaxed/simple;
	bh=jAN4FpmhkZCQSFafqmfkyYYv61rQJ5Lp2ji2EOpAz1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/1GvYHMFqiFKeYiJA4bW/0gABla/+wwanxzVkPE6ExkLQqXTNRxMoAw0cU+0TZex6QngWpi3UtT97QfYLNrwFIJY48CBWeMN6IfFWsrUc+fiGfJMG3cmx4bFzFYDbOdruIfbFb96aoyM4KyQz5Jvpf8p8o6w0RMlZoVeaX5pFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ozuFOzFe; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ozuFOzFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=cN52U4M/akNKSi2TPwUFS588/SgQwjQ7WAsKS9tCPEc=;
	b=ozuFOzFeYTGg1HfHwli+qm2pMBl7yU5XD9tH9Lo2RVN5LTAR+JwUgY61ElK8+j
	XbnsMiTuRNxJ8tZaL/u7KUypXqQSPIEr4RoATahJxnwFLj1Fc1W6/CcsxXSrV8tZ
	ibmg1PnIBL+tj6HQiNp41Tas2Vgcnaga2FJRY1/37Tq9A=
Message-ID: <17da8380-6087-4cf3-8850-336dcf76f919@163.com>
Date: Wed, 14 Oct 2026 15:07:13 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] exfat: validate cached iomaps during buffered
 writes
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yuezhang.Mo@sony.com, dxdt@dev.snart.me, sj1557.seo@samsung.com,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20261013033837.2748258-1-chizhiling@163.com>
 <20261013033837.2748258-4-chizhiling@163.com>
 <CAKYAXd-NdwvD9OO+_5UC5yVLp1OYf3KUFvPe_LRUkNjd9vuxvQ@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd-NdwvD9OO+_5UC5yVLp1OYf3KUFvPe_LRUkNjd9vuxvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDX36UhKs9q1K_mEA--.42514S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1rtr1xKr17Kr1xGry3Arb_yoW8Cr4UpF
	W3KwsxGrWkKw17ur18Jry5ZFyY9rZagr4xGas8G3s8Arnava18KF17Ga4a9FyrJw1q9w10
	vw4vyrs5WryDJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U3-BiUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3AQiv2rPKiS81wAA3F

On 10/14/2026 9:19 AM, Namjae Jeon wrote:
>> +static bool exfat_iomap_valid(struct inode *inode, const struct iomap *iomap)
>> +{
>> +       struct folio *folio = iomap->private;
>> +       loff_t old_valid_size = iomap->validity_cookie;
>> +       loff_t valid_size = exfat_get_valid_size(EXFAT_I(inode));
>> +
>> +       if (valid_size == old_valid_size)
> exfat_write_iomap_begin() reads valid_size before
> __exfat_iomap_begin() records the validity cookie. concurrent mmap
> fault can advance valid_size between those reads, allowing the stale
> value to zero mmap data before iomap_valid() is called:
> 
> buffered write [0,128)                       mmap fault
> Reads valid_size = 256
>                                                Raises valid_size to 4096
>                                                Stores 'X' at offset 400
> Records cookie = 4096
> Zeroes [256,512), erasing 'X'
> iomap_valid() sees cookie = 4096 and accepts
> 
> The validation runs too late to prevent this data loss. Could we
> recheck or serialize valid_size before zeroing?

Sorry, I forgot to address this issue, even though I had it in mind:

https://lore.kernel.org/exfat/7250425f-8626-4e8d-ab5a-32d9d4588ba9@163.com/

This is because the valid_size read in exfat_write_iomap_begin() can 
become stale.

I spent quite a while looking into this today and realized that I had 
oversimplified the problem. Moving the zeroing logic from 
exfat_write_iomap_begin() to ->put_folio won't solve it, because the 
folio has already been marked uptodate before ->put_folio is called.

I'll fix this in the next version, and hopefully the fix won't require 
more extensive changes.

Thanks!

> 
> 
>> +               return true;
>> +
>> +       if (!folio)
>> +               return false;
>> +
>> +       /* Still valid for this folio. */
>> +       if (old_valid_size >= folio_next_pos(folio))
>> +               return true;
>> +
>> +       if (valid_size <= folio_pos(folio))
>> +               return true;
>> +
>> +       return false;
>> +}
>> +

