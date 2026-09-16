Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E143B0582
	for <exfat@lists.linux.dev>; Wed, 16 Sep 2026 05:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537210; cv=none; b=mXGN0mYu76tZnKUL7CCFVR0t39TPDMAjLkiukPNz8cjygRBTkVNLUnEiKsEdvqErS5AEbKmPa4DcUI1G0rocYq7C8Yxzbd5kZ1qa3UoZhyV+SinRRaqIob5Ykz1vzRHH8WhflBZqSuhp2gAc68l0zdGFhi2iZcoRvICPtMU5lB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537210; c=relaxed/simple;
	bh=YjdHbV87+7BxoDKyF7A0Cf9wy0tOkfSYYzLe7r3tbFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MM8CIzH3QeMvEwIchka1+CUx09+WIJ6B3suRt3ZRU9edzMIEEFCnK3al1fPDTg+g4YcFHGG6u822WYVtUj8MennUzHYltw4woqiF528LCjYMw1s/NFn2OwNJH8cGWuszaBo0HoL+qu8+6VSTaWFnz5rowAFde4q3dPMfGdfGS5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YLKJX22f; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YLKJX22f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=J75zY/d9ixlI2M+2wbdTzA1Cim+avUbD7x3M7Bszoic=;
	b=YLKJX22fStN4nRnb8RG0EV2JkoZCUS7U/sveSGKIvbJxDQvTiPyK9DL2xLqlQV
	zt3/8cdQVL/RXrSia+NZnYJuLWGc4IAf3VDrOdbhHq8dZtsACc9k1bIam6DQhfO/
	kHjMgpXqY6cRlZ5KWWBn+ZWMFCYSCmWVew6o1/6Ote9jw=
Message-ID: <7380972e-de54-4b56-a67c-842be8887c5f@163.com>
Date: Wed, 16 Sep 2026 13:39:27 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: exfat: question about valid_size and page cache
To: Namjae Jeon <linkinjeon@kernel.org>, dxdt@dev.snart.me
Cc: exfat@lists.linux.dev, "Yuezhang.Mo@sony.com" <yuezhang.mo@sony.com>,
 Sungjong Seo <sj1557.seo@samsung.com>, Hyunchul Lee <hyc.lee@gmail.com>,
 ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
 liubaolin <liubaolin12138@163.com>
References: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com>
 <CAKYAXd9wnmVyp4ONjYQPs5pxo_ruDmCN_yu7Ma4agDP1n-NNBA@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd9wnmVyp4ONjYQPs5pxo_ruDmCN_yu7Ma4agDP1n-NNBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCngCSPK6pq1TK6Rw--.38610S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFyxCrW5WF17AF48Kw1rWFg_yoWrtr4Upr
	WUKas0krWqvry8urnaqF15Zr1F9r93Za18Ca4fW3s3ZFn8XFy7Kr17Gayj9FWYkw17Aa10
	qa1Ut3yxZFyDZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Us18PUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2xE00WqqK5EXpQAA3n

On 9/16/26 11:12 AM, Namjae Jeon wrote:
> On Wed, Sep 16, 2026 at 11:32 AM Chi Zhiling <chizhiling@163.com> wrote:
>>
>> Hi, Namjae
>>
>> I have a question about the valid_size advancement logic in exFAT.
>>
>> In exfat_zero_new_range(), we zero all folios that are either not
>> up-to-date or do not exist.
> Yes. valid_size can be smaller than i_size, for example after
> fallocate(). Reading that range can create a zero-filled, uptodate
> folio in the page cache.

Okay

>>
>> I'm curious whether a page in the page cache can remain beyond
>> valid_size. If not, why do we need to skip an uptodate page? There
>> should be no uptodate page beyond valid_size, right?
> uptodate folio is not necessarily below valid_size. It can contain
> zero-filled data from an unwritten range, or data written through a
> shared mapping. Therefore, we must not overwrite uptodate blocks.

Okay, your explanation has made the issue much clearer to me. So, there 
should never be any non-zero data beyond valid_size in the page cache, 
right? This should be an invariant that always holds.

Therefore, any write request that extends beyond valid_size should 
advance valid_size first.

>>
>> If such pages can exist, how do we prevent them from becoming holes in
>> the page cache? Those pages could be written back and then released. In
>> that case, we may later zero the corresponding range, which could
>> potentially result in data loss.
> The completed range is recorded in zeroed_size, and future zeroing
> starts at max(valid_size, zeroed_size). Therefore, evicting the folio
> does not cause the same range to be zeroed again.

With your explanation, I think this issue no longer exists, because as 
you pointed out, there should be no non-zero data beyond valid_size, so 
there is no risk of accidentally zeroing out non-zero data.

However, it looks like exfat_zero_new_range() has some missing handling. 
One issue is that it does not mark the uptodate blocks as dirty, which 
could cause some blocks not to be written back and potentially expose 
stale data.


static int exfat_zero_new_range(struct inode *inode, loff_t start, 
loff_t end)
{
	struct address_space *mapping = inode->i_mapping;
	unsigned int blocksize = i_blocksize(inode);
	loff_t pos = start;
	int err;

	while (pos < end) {
		loff_t next = min_t(loff_t,
				round_down(pos, PAGE_SIZE) + PAGE_SIZE, end);
		struct folio *folio;
		loff_t bpos;

		folio = filemap_get_folio(mapping, pos >> PAGE_SHIFT);
		if (IS_ERR(folio)) {
			err = iomap_zero_range(inode, pos, next - pos, NULL,
					       &exfat_iomap_ops, NULL, NULL);
			if (err < 0)
				return err;
			pos = next;
			continue;
		}

		if (folio_test_uptodate(folio)) {
			folio_lock(folio);
			if (folio->mapping == mapping)
				folio_mark_dirty(folio);
			folio_unlock(folio);
			folio_put(folio);
			pos = next;
			continue;
		}

		/*
		 * Zero not-uptodate block runs. iomap_zero_range() requires an
		 * unlocked folio, so recheck ->mapping after each call.
		 */
		folio_lock(folio);
		bpos = pos;
		while (bpos < next) {
			loff_t rstart, rend;

			if (folio->mapping != mapping) {
				folio_unlock(folio);
				err = iomap_zero_range(inode, bpos, next - bpos,
						NULL, &exfat_iomap_ops, NULL, NULL);
				if (err < 0) {
					folio_put(folio);
					return err;
				}
				folio_lock(folio);
				break;
			}

			if (iomap_is_partially_uptodate(folio,
					offset_in_folio(folio, bpos), blocksize)) {
				bpos += blocksize;

 >>>>>>> We didn't mark this block as dirty.


				continue;
			}

			rstart = bpos;
			rend = min_t(loff_t, bpos + blocksize, next);
			while (rend < next &&
			       !iomap_is_partially_uptodate(folio,
					offset_in_folio(folio, rend), blocksize))
				rend = min_t(loff_t, rend + blocksize, next);

			folio_unlock(folio);
			err = iomap_zero_range(inode, rstart, rend - rstart,
					NULL, &exfat_iomap_ops, NULL, NULL);
			if (err < 0) {
				folio_put(folio);
				return err;
			}
			folio_lock(folio);
			bpos = rend;
		}

		/*
		 * Dirty only a fully uptodate folio. Dirtying a partial folio could
		 * write uninitialised cache contents over valid on-disk blocks.
		 */
		if (folio->mapping == mapping && folio_test_uptodate(folio))
			folio_mark_dirty(folio);
		folio_unlock(folio);
		folio_put(folio);
		pos = next;
	}

	return 0;
}


Another issue is that exfat_page_mkwrite() returns VM_FAULT_RETRY when 
it fails to acquire the inode lock. However, I don't see mm doing 
anything with this flag. So, in exFAT, we use invalidate_lock and unmap 
in pwrite() to prevent new mmap writes from occurring, right?

But if two mmap writes beyond valid_size happen concurrently, since mm 
ignores the VM_FAULT_RETRY returned by exFAT, could this allow an mmap 
write to occur beyond valid_size without advancing valid_size?



