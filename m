Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEAB396B8C
	for <exfat@lists.linux.dev>; Thu,  1 Oct 2026 05:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790831181; cv=none; b=Cde7+VNA322eh5rmhbaDsYKcJZdb2sGEF9yJiUzExC+BJO/8UIMkBTSSNX1OdD1FEygovinEIzt/Zl8iu8i1xE5m9CKZZCbKeG6wlh5W8dfekxK0EUDxP3cVLDSjlXesSyJs7fHxvZzJ7hasCq+K4SnPDHEs0VGjiind+XVMSMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790831181; c=relaxed/simple;
	bh=ow7kKLcYFrvrs9qnlmpj5N6b1Xj04ED7ZQxvCV2Oty0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ll41/WNndyVS5ch3F1D3TZu2BCZb1uc4oI/wLz5JoBsEoTLUHsI0ZQfuwIfYFuwrrjyqYQPaUo3vv7N+EA9yXqRmEhx1wdDSv1pIV5nLFnQ28t+E+89fqFw+UFJrMueZAsQ6/4vXp3WMi3TjQ4QJZu5rIApOW8ZnsIzhxxeisrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ck3v3aQL; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ck3v3aQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=X7o5t8QzZtgDYOLlmADgtDvY2Bfxj9SJZoEJ6uoU8Xw=;
	b=ck3v3aQLurermgz+sNJWCi0rYzm+pKoLckxU0eJUK3AnGvSMCStGes3JV/oURS
	y3xMueZ3tRnYQ37KSkVn/pOA3ypKzLk36dNXHLjK933xmPrbrpfwdSCZ/T84S5pF
	+0Gie+BNbjdFoSqTfllMjS3NIyZ48wxckCZYo1RJ7wv4Y=
Message-ID: <ff3a2271-542a-44a0-b5a0-700990119630@163.com>
Date: Thu, 1 Oct 2026 13:05:39 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] exfat: mark straddling folio RO for 4K block size
To: Yuezhang Mo <Yuezhang.Mo@sony.com>, exfat@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linkinjeon@kernel.org,
 sj1557.seo@samsung.com, dxdt@dev.snart.me
References: <20260930104332.4022207-2-Yuezhang.Mo@sony.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20260930104332.4022207-2-Yuezhang.Mo@sony.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PSgvCgD3H9gj6r1qEOV8CA--.15950S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWxtF1UAF45uFW5Kr1fCrg_yoW5Xw45pF
	ZxCwn0vrWDWa4UW3Za9F1aqryF934rtr4xJasagw17AFy7tw1I9r4xK34UWFWUtr48Gr40
	qan5K398u3WDArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRa9aPUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+ATNa2q96iSmXwAA36

On 9/30/26 6:43 PM, Yuezhang Mo wrote:
> The maximum file system block size supported by exFAT is 4096 bytes.
> When extending a file whose EOF is not page aligned, the straddling
> folio must be marked RO so that a subsequent mmap write can trigger
> ->page_mkwrite() and extend the valid data size.
> 
> This is normally handled by pagecache_isize_extended(), which marks
> the straddling folio RO when the filesystem block size is smaller
> than 4K. However, pagecache_isize_extended() returns early when the
> filesystem block size is PAGE_SIZE:
> 
>      if (from >= to || bsize >= PAGE_SIZE)
>          return;
> 
> As a result, on an exFAT filesystem with a 4K block size, the PTE
> for the straddling folio remains writable after a file extension.
> A subsequent mmap write operation that modifies the straddling folio
> beyond the old EOF, will not trigger ->page_mkwrite(), leaving
> valid_size unchanged.
> 
> This was found by running xfstests generic/030 on a block device with
> a 4096-byte sector size: the test fails without this fix and passes
> with it.
> 
> Fix this by marking the straddling folio RO in exfat_cont_expand()
> when the filesystem block size is 4K and the old EOF is not page
> aligned. This mirrors what pagecache_isize_extended() does for smaller
> filesystem block sizes.
> 
> Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
> Signed-off-by: Yuezhang Mo <Yuezhang.Mo@sony.com>
> ---
>   fs/exfat/file.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index a2a9ee1a20048..390bfae3f3aa4 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -17,6 +17,7 @@
>   #include <linux/fileattr.h>
>   #include <linux/iomap.h>
>   #include <linux/pagemap.h>
> +#include <linux/rmap.h>
>   
>   #include "exfat_raw.h"
>   #include "exfat_fs.h"
> @@ -91,6 +92,20 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
>   	 */
>   	pagecache_isize_extended(inode, oldsize, inode->i_size);
>   
> +	if (i_blocksize(inode) >= PAGE_SIZE && (oldsize & (PAGE_SIZE - 1))) {
> +		struct folio *folio;
> +
> +		folio = filemap_lock_folio(inode->i_mapping,
> +				oldsize >> PAGE_SHIFT);
> +		if (!IS_ERR(folio)) {
> +			if (folio_mkclean(folio))
> +				folio_mark_dirty(folio);
> +
> +			folio_unlock(folio);
> +			folio_put(folio);
> +		}
> +	}

I think fixing this issue specifically for the block size = 4K case may 
not be thorough enough, because pagecache_isize_extended() may also fail 
to work when the block size is smaller than 4K.

We should set the folio containing valid_size to RO whenever valid_size 
!= i_size and valid_size is not page-aligned, regardless of the block size.

> +
>   	inode->i_blocks = round_up(size, sbi->cluster_size) >> 9;
>   	mark_inode_dirty(inode);
>   

