Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF379439331
	for <exfat@lists.linux.dev>; Thu,  3 Sep 2026 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424909; cv=none; b=nhsqHeyC0e3bR1z7cb7ArLrKr9ZlKPNP/DGANXU0pTIczuFwYSyYpXyq3ZL2ITkp7wYE+o0wS6tqBljU/9oSvH4/J4gIGmc7vfl1DMbQIA9aIXKbNAGft9gb9Nm1dWDiXfI83hCZzjC9Y3ubuEGUl5tCzHfzwpbN3j941P1SeqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424909; c=relaxed/simple;
	bh=4Q+YALJEGeW0Ge6c5F9Ij5f0cqsqZsMf9znuKoxCYDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqrDYfAkRG67r0cWhvLPPK6OOO6oUBVmymRilsVXE1aw6M3eDQMFlOquqdwBpKRaFjUYBQsuYSKSmPPjpmaeZz7SHDJel4nSe5kmWBPHsDVem2gVbuUJYP/wq8TQgDq3avhP9CrJd/sjcOmDCRVma90/dRv3pfoRhhR/6CI6gz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ed98YSjA; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ed98YSjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=ALtFsj6pwnpHxyXfwXGz7hUSU6mpG6oBeDV0R3dmXYU=;
	b=ed98YSjA7kwQ0gl5xbgG5AnZBFEka676et0+/bXTcL4U/FXKQpRLeOVYIDm/MS
	txMu/i7PDVIiJIROEFE9Oua/W+exSeYvt73WNWHDvUU3bI6X6N0dW3MFx5pznC7Y
	dMTo2ES8iw4XcYgPK6g/Dr0nnG2W1VMFAh599dM7Br4fk=
Message-ID: <eb75911d-30cb-4271-aeee-4a629df8e8c5@163.com>
Date: Thu, 3 Sep 2026 16:41:29 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] exfat: speed up file creation in large directories
To: Yang Wen <anmuxixixi@gmail.com>, linkinjeon@kernel.org,
 sj1557.seo@samsung.com, yuezhang.mo@sony.com
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260902152455.1273557-1-anmuxixixi@gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20260902152455.1273557-1-anmuxixixi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3BIi6Mplq9WhYAQ--.13027S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWrury5CF1rWFy8Ww1fCrg_yoW8AF17pF
	s8G34rtrykJ347ZFn3uF18ury3Aw1rGFs5Jr9xuryYyF93ur10kr17K34UXFy7GFyFgr1j
	qayjqr4UKwnruaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U20PhUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9xu7WWqZMru6sQAA3-

On 9/2/26 11:24 PM, Yang Wen wrote:
> Negative name lookups and empty-entry allocation can repeatedly scan a
> directory from the beginning. Bulk creation in a large directory therefore
> approaches O(N^2).
> 
> This series separates the optimization into three independently reviewable
> steps. Patch 1 adds the Bloom filter used to reject definite name misses.
> Patch 2 retains and correctly invalidates the next-empty-entry hint. Patch 3
> adds the LRU and shrinker used to reclaim filters under memory pressure.
> 
> Test environment:
>    QEMU TCG multi-thread, 4 vCPUs, 6 GiB RAM
>    4 GiB exFAT image, 32 KiB clusters
> 
> Creating 20,000 empty files improved from 589.48 seconds to 5.33 seconds,
> which is a 110.6-fold speedup.
> 
> Changes in v3:
> - Split the change into Bloom filter, empty-entry hint, and shrinker patches.
> - Accept filenames containing exactly 255 UTF-16 code units while building
>    the Bloom filter.
> - Invalidate the empty-entry hint in every path that can free directory
>    entries, preventing stale hints from skipping earlier holes.
> 
> Changes in v2:
> - Move exfat_name_filter_free() to exfat_evict_inode() because
>    ->free_inode() may run from an RCU callback in softirq context.
> 
> Yang Wen (3):
>    exfat: add a Bloom filter for negative name lookups
>    exfat: retain the next empty directory entry hint
>    exfat: reclaim name filters under memory pressure
> 
>   fs/exfat/dir.c      | 279 ++++++++++++++++++++++++++++++++++++++++++++
>   fs/exfat/exfat_fs.h |  23 ++++
>   fs/exfat/inode.c    |   1 +
>   fs/exfat/namei.c    |  58 ++++++++-
>   fs/exfat/super.c    |   9 ++
>   5 files changed, 369 insertions(+), 1 deletion(-)
> 

This is a much better version than v2.

Reviewed-by: Chi Zhiling <chizhiling@kylinos.cn>

Thanks!

