Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976882DA756
	for <exfat@lists.linux.dev>; Fri, 18 Sep 2026 07:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717035; cv=none; b=fInC8RrbvYUP6/z0MmfUtt+4FTwR8ryXl7CKEPyMFlYatFrWyHsdCVuES1mqbYDv/IElN1zN7reDReDzfGGHSoE9nPVIBprAayoh5MIYm5/8DPChS6Cl2rs/FzURfRq/i43PefUgb2FQkw0KZ8GzEJ2qSOOBwI0edq8KssB/r8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717035; c=relaxed/simple;
	bh=5juHrh8m2mtrcblzG4IRX2zdYth2GmeafmsOrP7r6nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rb9Ih4GY3+iQsW80PgL5Exw+Byf6DuQXmqMGwwyYIuAugWLeASIozeKLxVbvYYFcS6V1bOm/Lv4N39MQz6idF+YtJRsrF3aCtKKSg2hsT3JyRu/bAi35ZhTwXhHLSMdT3sovWHzZBLTI/kZautxUmaAiHJlFf1EulaGQDNa8Tb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Uyvgt+so; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Uyvgt+so"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=S1J9coAIzm99QnaE4bPKFkWGbp09lI1K7bsE8qGPDrE=;
	b=Uyvgt+soMoJ3YF8pkYnSgiglXN4ZtxUx7d3sapqi1Yuca1AEne4uq4Y3z3QTDo
	eziVpnSP0pQmuqkO4IJM79wCcoXDErjypTCKc7vTvv5qoVbhvM26n4KIRieVCqZe
	NnbtidTp6ivIJ7zBmkJJzMeGE8ida7eQkk/iHErLUOt08=
Message-ID: <0fa9e808-0401-42fa-8ecc-776cbc67e918@163.com>
Date: Fri, 18 Sep 2026 15:36:21 +0800
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
 <fd531465-622d-43d3-8c2f-ff38fb527061@163.com>
 <PUZPR04MB6316BE1BAD8C0AE697150E6981872@PUZPR04MB6316.apcprd04.prod.outlook.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <PUZPR04MB6316BE1BAD8C0AE697150E6981872@PUZPR04MB6316.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHx9316axqxhrrBA--.90S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuw47Ww47Zry5GF1xtw47Arb_yoWxGF13pF
	WYkw1rG3yDZ34UWry8Wr98Za4Y9w1FqFWxWas3u34UZwnrC343KF1UtFWrWFWaqwsIqw1j
	van0vrW8Z347CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UseOXUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+Bl+HGqs6fkl6QAA3Z

On 9/18/26 1:56 PM, Yuezhang.Mo@sony.com wrote:
> On 9/17/26 18:10 PM, chizhiling@163.com wrote:
>> On 9/17/26 5:21 PM, Yuezhang.Mo@sony.com wrote:
>>>
>>> Revisited the implementation of exfat_zero_new_range(), I think it is unnecessarily duplicating
>>> existing functionality.
>>>
>>> exfat_iomap_read_end_io() already takes care of zeroing the page cache beyond valid_size. By using
>>> read_cache_folio() to obtain an uptodate folio, we can reuse the existing exfat_iomap_read_end_io()
>>> implementation instead of introducing another zeroing mechanism. Then just need to use
>>> folio_mark_dirty() to mark the folio dirty, causing it to be written back.
>>
>> Yes, you're right. In my local branch, I implemented this by calling
>> __filemap_get_folio() and exfat_read_folio(). The relevant code is
>> below. It's a bit ugly, so I’d really appreciate it if you have any
>> better suggestions:
> 
> Why not simply use read_cache_folio()? Also, it is necessary to hold mapping->invalidate_lock.

I only did a quick search under fs/ and noticed that 
__filemap_get_folio() is used more often. I’ll change it to use 
read_cache_folio() in the next version and test it.

Why should we hold invalidate_lock? Is it because invalidate_lock is 
supposed to protect valid_size?

> 
>>
>>> I’ve also been looking into another issue today: the VM_FAULT_RETRY
>>> returned by exfat_page_mkwrite() seems to be ignored by the memory
>>> management subsystem. As a result, an mmap write may actually proceed
>>> beyond valid_size without advancing valid_size.
> 
> It looks like you are right, the PTE is still set to be writable when VM_FAULT_RETRY
> is returned. inode_lock does not seem suitable for protecting valid_size.

I’m currently testing a somewhat aggressive approach to solving this 
issue: advance zeroed_size before writing the data, and then advance 
valid_size after the write completes.

Advancing zeroed_size before the write prevents us from performing the 
zeroing operation repeatedly on the same range. Since we don’t advance 
valid_size before the write, the range is still considered to contain 
zeros, so this shouldn’t expose any stale data.

This approach seems to work, and it also provides some performance 
improvement. However, it still needs further evaluation and refinement. 
Here is the prototype of this approach:


diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 9f876b2fbc80..22c34ff6e292 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -720,6 +720,9 @@ static int exfat_extend_valid_size(struct inode 
*inode, loff_t new_valid_size)
                                 return ret;
                 }

+               if (ei->zeroed_size < round_up(new_valid_size, 
i_blocksize(inode)))
+                       ei->zeroed_size = round_up(new_valid_size, 
i_blocksize(inode));
+
                 ret = exfat_zero_new_range(inode, gap_start, 
new_valid_size);
                 if (ret) {
                         truncate_setsize(inode, old_valid_size);
@@ -727,9 +730,8 @@ static int exfat_extend_valid_size(struct inode 
*inode, loff_t new_valid_size)
                         return ret;
                 }

-               ei->valid_size = new_valid_size;
-               if (ei->zeroed_size < round_up(new_valid_size, 
i_blocksize(inode)))
-                       ei->zeroed_size = round_up(new_valid_size, 
i_blocksize(inode));
+               if (ei->valid_size < new_valid_size)
+                       ei->valid_size = new_valid_size;
                 mark_inode_dirty(inode);
         }

@@ -885,9 +887,6 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault 
*vmf)
         vm_fault_t ret;
         loff_t new_valid_size, mmap_valid_size, fault_page_start;

-       if (!inode_trylock(inode))
-               return VM_FAULT_RETRY;
-
         mmap_valid_size = ((loff_t)vmf->pgoff + 1) << PAGE_SHIFT;
         fault_page_start = ((loff_t)vmf->pgoff) << PAGE_SHIFT;
         new_valid_size = min(mmap_valid_size, i_size_read(inode));
@@ -895,28 +894,26 @@ static vm_fault_t exfat_page_mkwrite(struct 
vm_fault *vmf)
         if (ei->valid_size < new_valid_size) {
                 if (ei->zeroed_size < fault_page_start) {
                         int err;
+                       loff_t old_zeroed_size = ei->zeroed_size;
+
+                       if (ei->zeroed_size < round_up(fault_page_start, 
i_blocksize(inode)))
+                               ei->zeroed_size = 
round_up(fault_page_start, i_blocksize(inode));

                         /*
                          * Zero only the gap below the faulting page. 
The read
                          * fault populated its folio and 
iomap_page_mkwrite()
                          * will dirty it.
                          */
-                       err = exfat_zero_new_range(inode, ei->zeroed_size,
+                       err = exfat_zero_new_range(inode, old_zeroed_size,
                                         fault_page_start);
                         if (err < 0) {
-                               inode_unlock(inode);
+                               ei->zeroed_size = old_zeroed_size;
                                 return vmf_fs_error(err);
                         }
                 }

-               /*
-                * Track zeroed_size by block, not page, because 
writeback stops
-                * at i_size recording blocks wholly beyond it could skip a
-                * later required zeroing.
-                */
-               if (ei->zeroed_size < round_up(new_valid_size, 
i_blocksize(inode)))
-                       ei->zeroed_size = round_up(new_valid_size, 
i_blocksize(inode));
-               ei->valid_size = new_valid_size;
+               if (ei->valid_size <new_valid_size)
+                       ei->valid_size = new_valid_size;
                 mark_inode_dirty(inode);
         }

@@ -927,7 +924,6 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault 
*vmf)
         ret = iomap_page_mkwrite(vmf, &exfat_iomap_ops, NULL);
         filemap_invalidate_unlock_shared(inode->i_mapping);
         sb_end_pagefault(inode->i_sb);
-       inode_unlock(inode);

         return ret;
  }
diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index 533cdb4f0929..456f9ae8a4bf 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -98,6 +98,9 @@ static int __exfat_iomap_begin(struct inode *inode, 
loff_t offset, loff_t length
                          * __iomap_write_begin()).
                          */
                         iomap->flags |= IOMAP_F_ZERO_TAIL;
+
+                       if (ei->zeroed_size < iomap->offset + iomap->length)
+                               ei->zeroed_size = iomap->offset + 
iomap->length;
                 }
         } else {
                 /*
@@ -201,15 +204,6 @@ static int exfat_write_iomap_end(struct inode 
*inode, loff_t pos, loff_t length,
                 dirtied = true;
         }

-       /*
-        * IOMAP_F_ZERO_TAIL zeroes the remainder of the last block. 
Track that
-        * block as zeroed so later valid_size extensions do not zero it 
again.
-        */
-       if (iomap->flags & IOMAP_F_ZERO_TAIL)
-               end = round_up(end, i_blocksize(inode));
-       if (ei->zeroed_size < end)
-               ei->zeroed_size = end;
-
         if (dirtied || iomap->flags & IOMAP_F_SIZE_CHANGED)
                 mark_inode_dirty(inode);



