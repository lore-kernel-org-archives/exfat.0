Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FB93CB2D5
	for <exfat@lists.linux.dev>; Thu,  8 Oct 2026 06:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442247; cv=none; b=mmudFOZeHHYs4G6D+XQMD7BWl6YOg1rO85gVxbfN48Fqg5FQpUjzC0mmP75VbiFj3wVpqpSmRZWtaTs7UVCybcwsv+XaV2SZYSMyd4yjH9cOthzr162iamNGjVEVYxw4cHh9yoVvRyfM4TVCYodP0pHKqsYINWEu7hFNtX72evU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442247; c=relaxed/simple;
	bh=2iZO9+B4qJUcE0gE3qv20VRk3mKDjg4Oex7myXlw+pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlWaE3LpLHeNd52cadMmKg7b6qwMcwk3GGPVAuNy524YfsUyVu0ovIdcD9/udqOlEgnSHuJPf07h0ze7BCvNomRpQOjA472hvsmc3UhKn/heLrXEFd//9iH6LoI9m79tV7emBN/kyDanBBDC3bQH0inpo7AE/arfHgmy4m6x8Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hl4/5ODA; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hl4/5ODA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=+iSIvpVO0skcVIee1PX8bJQ7YeHAtVYT9l8JjsDupx8=;
	b=hl4/5ODA63roefulhvg4vin+QaEjvtZxL1m5BtYlR9b/Azuwe2Gyl1Q36e09yA
	75Kj5u0hmBPX/F/fZrA51iQfc+/1rdsNt2y9gdTym42TZvFgpHw3CAPRYvbU9oLB
	81noy6tDdSvrhKsPzuPskZH0yqcLpi3GbM1BGwW+UHeLk=
Message-ID: <7250425f-8626-4e8d-ab5a-32d9d4588ba9@163.com>
Date: Thu, 8 Oct 2026 14:50:15 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] exfat: zero invalid tail on partial overwrites
To: Namjae Jeon <linkinjeon@kernel.org>, sj1557.seo@samsung.com,
 yuezhang.mo@sony.com
Cc: exfat@lists.linux.dev, anmuxixixi@gmail.com, dxdt@dev.snart.me,
 chizhiling@kylinos.cn
References: <20261007132339.9379-1-linkinjeon@kernel.org>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20261007132339.9379-1-linkinjeon@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3N1MoPcdqQCrODA--.28973S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Jr17Cw1fJFyfWw13Wr48Zwb_yoW8JrWxpr
	Z8tw1rGryktw129r1kXF1Sqas5Gw13ZrWxC395W3yUZ3ZrZF12vFy7tayUurW5t3Z7Ja10
	qaykCayrGFyDG3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uf-BiUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3Ajlg2rHPSjKrAAA3s

On 10/7/26 9:23 PM, Namjae Jeon wrote:
> Buffered overwrite that ends before valid_size in the same filesystem 
> block reads the entire block without IOMAP_F_ZERO_TAIL. If an existing
> cluster contains stale bytes beyond valid_size, the synchronous read
> loads them into the page cache and marks the block uptodate.
> Subsequent buffered reads can return these bytes while i_size exceeds
> valid_size.
> 
> For example, with 512-byte blocks, valid_size of 1000 and i_size of 2048,
> a cold-cache overwrite of [900, 950) exposes stale data in [1000,
> 1024). Setting ZERO_TAIL for this write would also erase valid data
> in [950, 1000).
> 
> Use iomap_truncate_page() to zero only the invalid tail at valid_size 
> before preparing such buffered overwrites. Call it after dropping s_lock
> and before iomap locks the write folio. The inode lock held by buffered
> writes serializes valid_size against truncation and page_mkwrite.

I’m not saying that this patch will introduce a bug. I think it would be 
easier to handle if we perform the zeroing in iomap_write_ops.put_folio.

Also, we may remove the inode lock from exfat_page_mkwrite soon. Once 
it’s removed, we won’t be able to use valid_size without holding the 
folio lock.


Thanks.

