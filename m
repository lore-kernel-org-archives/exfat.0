Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CF6497B70
	for <exfat@lists.linux.dev>; Thu, 17 Sep 2026 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639833; cv=none; b=j6ukjRC3NwcHKj4HFkxiP/AzGmlfeq4Ck22mjMiF+hQ5ivkbGK/YBoqWJP23REYBp9SpIK7j7YCBbEDLqs8Om/5pxk7mbs60TmYRRKOv3QGesZvihIbeXt7AL5qZ30hxIkiDymwrxogS8QPS8EY4UDb+ugbmF/3FL3yaF2b1fBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639833; c=relaxed/simple;
	bh=Qdps5DFkpJK8g7EvEgcPF/ARIweaQvCqlqgM2F4DL6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8lkb9qSf/r0NPiKNQxunir5RQYXR2WzhAOwkomDciSn+iBqceJMspEVPd5cgxMiPqDUr9AxM6SUDAhiFapZN10b/li9P8/K5qGdyTB14CXZrKrnWb1Qe9Eju2rvIBOp8eoVohVeSnthgWe2ybjpEuGtq7UTQkd3Vb24BBij3t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oP3f2WFu; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oP3f2WFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=liOCuREUBzDiwKZQwgFv3j9PrCCBFLcgFW6Qsir+l7w=;
	b=oP3f2WFuar07ZB49hiHzfr9ru7B+jx/E7Cb5lTaWKgEGz3WhaGhDGWq7C1bYQi
	kS7AI/wFerhl4xXbkNVjgKg4GYEisG8JskxFm6a8r0q+KtVeaMWZTPAy1x4CUjgm
	jVd8UBW2nmWHcI6lRF1lB6iQvAaUOlAABh7HSoQVB0SiI=
Message-ID: <fd531465-622d-43d3-8c2f-ff38fb527061@163.com>
Date: Thu, 17 Sep 2026 18:09:58 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: exfat: question about valid_size and page cache
To: "Yuezhang.Mo@sony.com" <Yuezhang.Mo@sony.com>,
 Namjae Jeon <linkinjeon@kernel.org>, "dxdt@dev.snart.me" <dxdt@dev.snart.me>
Cc: "exfat@lists.linux.dev" <exfat@lists.linux.dev>,
 Sungjong Seo <sj1557.seo@samsung.com>, Hyunchul Lee <hyc.lee@gmail.com>,
 ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
 liubaolin <liubaolin12138@163.com>
References: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com>
 <CAKYAXd9wnmVyp4ONjYQPs5pxo_ruDmCN_yu7Ma4agDP1n-NNBA@mail.gmail.com>
 <7380972e-de54-4b56-a67c-842be8887c5f@163.com>
 <PUZPR04MB631662C55F38599C3E6496FF81B82@PUZPR04MB6316.apcprd04.prod.outlook.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <PUZPR04MB631662C55F38599C3E6496FF81B82@PUZPR04MB6316.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXPnp3vKtqAVLuBA--.28374S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw4xKry5tF1DCF1UtF1DZFb_yoW5Aw1kpF
	W5Kas8trWDX3W5uF97XFn7Xa1F93yFqa15ZFyxJwnrAFn0qF9rKF17K3yj9FW3Jw47Jr1I
	qF4UArWrZF1DKaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UseOXUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9xjScGqrvHhKfQAA3-

On 9/17/26 5:21 PM, Yuezhang.Mo@sony.com wrote:
> 
>> However, it looks like exfat_zero_new_range() has some missing handling.
>> One issue is that it does not mark the uptodate blocks as dirty, which
>> could cause some blocks not to be written back and potentially expose
>> stale data.
> 
> Hi Chi,
> 
> The issue you discovered can be reproduced with the following fsx operation sequence:
> 
> # cat exfat.fsxops
> write 0xde00 0x8000 0x4000
> truncate 0x0 0x11200 0x15e00
> truncate 0x0 0x26000 0x11200
> write 0x57600 0xf800 0x53200
> truncate 0x0 0x11c00 0x66e00
> write 0x71400 0x2c00 0x3ea00
> read 0xf000 0x4000 0x74000
> # ./xfstests-dev/ltp/fsx -Z -h -r 4096 -t 512 -w 512 -R -W --replay-ops=exfat.fsxops /mnt/file

Thank you very much for providing the reproducer.

> 
> Revisited the implementation of exfat_zero_new_range(), I think it is unnecessarily duplicating
> existing functionality.
> 
> exfat_iomap_read_end_io() already takes care of zeroing the page cache beyond valid_size. By using
> read_cache_folio() to obtain an uptodate folio, we can reuse the existing exfat_iomap_read_end_io()
> implementation instead of introducing another zeroing mechanism. Then just need to use
> folio_mark_dirty() to mark the folio dirty, causing it to be written back.

Yes, you're right. In my local branch, I implemented this by calling 
__filemap_get_folio() and exfat_read_folio(). The relevant code is 
below. It's a bit ugly, so I’d really appreciate it if you have any 
better suggestions:

static int exfat_zero_new_range(struct inode *inode, loff_t start, 
loff_t end)
{
	struct address_space *mapping = inode->i_mapping;
	loff_t next, pos = start;
	struct folio *folio;
	pgoff_t index;

	while (pos < end) {
		index = pos >> PAGE_SHIFT;
		next = min_t(loff_t, (index + 1) << PAGE_SHIFT, end);

		balance_dirty_pages_ratelimited(mapping);

		folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
					    mapping_gfp_mask(mapping));
		if (IS_ERR(folio))
			return PTR_ERR(folio);

		if (!folio_test_uptodate(folio)) {
			exfat_read_folio(NULL, folio);
			folio_wait_locked(folio);
			if (!folio_test_uptodate(folio)) {
				folio_put(folio);
				return -EIO;
			}

			folio_lock(folio);
		}

		if (folio->mapping == mapping)
			folio_mark_dirty(folio);

		folio_unlock(folio);
		folio_put(folio);
		pos = next;
	}

	return 0;
}


I’ve also been looking into another issue today: the VM_FAULT_RETRY 
returned by exfat_page_mkwrite() seems to be ignored by the memory 
management subsystem. As a result, an mmap write may actually proceed 
beyond valid_size without advancing valid_size.

I’ll share more details over the next few days. I don’t have a good fix 
for this issue yet. If there’s anything you’d like to know about it, 
please feel free to ask, and I’ll provide the details as soon as possible.

Thanks!

> 
>>                          if (iomap_is_partially_uptodate(folio,
>>                                         offset_in_folio(folio, bpos), blocksize)) {
>>                                 bpos += blocksize;
>>
>>>>>>>>> We didn't mark this block as dirty.
> 

