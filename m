Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09340318ED9
	for <exfat@lists.linux.dev>; Sat,  3 Oct 2026 01:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790989920; cv=none; b=Tn0Fn2Z9sH8g34qVeqp53cF1ZUBp4z1MMOCCYHqkrcacVRVt97pPMsI2SxWSKAX0Pg69kTNGJQRa0aX0s+KxHVW2cEuxGXnv0xsmzieMhkxhKtPrecnlhrknXyoNxhmetLBlZmnqC7wkb8OcfWzSbtZUPaJJz9cQ/ScItHoyyG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790989920; c=relaxed/simple;
	bh=B4JkUi9my2d9U4NwA9n6bMZyhByBHhozgf11BX091ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fzfn1hVJAmIpb+NWmKApAllOphBosw/ztemK+6Cv9WojA9umKQH9AIs0VX0PcOL5FhDAR8x3eOpW2pvfPM5T2KXGxsKLe+syDpIKQItyS2NbofIGDTkAd+yra9d07LJETlLrSML52t7qhPMgH+NffdbFm7C2NRLA4P498QU9fEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ED6lssCM; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ED6lssCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=yYGDYGipIPKpCp7ZOn9wro1eUA2lYhqQ2yXsDOAsYaM=;
	b=ED6lssCM4oK2Tt3de/JOs7BTXyQ+tGpn5Z/DsVeJtVjMunzd4rdpCSb9y3XFMz
	s1/dFJc66XRoiQFlf1/bKkQy/+rsUY29DRpk4DS50zxMQQIYXBk2sv4Dz7MTiNyI
	T9u3z+anbQqB7ioiSL4hZ2WUIYKefKwC9X5MtU51h0obI=
Message-ID: <59056131-e3bd-4003-8c30-0a356cf0bd82@163.com>
Date: Sat, 3 Oct 2026 09:11:03 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] exfat: fix valid_size handling and locking
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yuezhang.Mo@sony.com, chenxiaosong@chenxiaosong.com, dxdt@dev.snart.me,
 hyc.lee@gmail.com, liubaolin12138@163.com, sj1557.seo@samsung.com,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20260927080305.831641-1-chizhiling@163.com>
 <CAKYAXd8u2iLQ5aO6XR7vFojB3=9Jcmk7nK1mbzAk=Tza_UoYJA@mail.gmail.com>
 <24c5c9ea-1bfe-44a8-81ad-c2b1588e0a63@163.com>
 <CAKYAXd9Z7opATEpHtyTp+cbzsYS_+Ym621fBHHbY1OZw=Hzt2w@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd9Z7opATEpHtyTp+cbzsYS_+Ym621fBHHbY1OZw=Hzt2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXLh0nVsBqWoBUCA--.30796S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWkAF4DurykWrWxGw1DAwb_yoW8KFW5pa
	yFk3W5GFW5J340yrs293W8Xa4Ygwn3Xr17Wr98t3yUArn09F1avry7K3y093y5tws7Kw4j
	vr4vq397Xw1DJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UeMKtUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9wtqCGrAViu9aQAA3d

On 10/3/26 7:42 AM, Namjae Jeon wrote:
> On Thu, Oct 1, 2026 at 11:53 AM Chi Zhiling <chizhiling@163.com> wrote:
>>
>> On 9/30/26 6:01 PM, Namjae Jeon wrote:
>>> On Sun, Sep 27, 2026 at 5:04 PM Chi Zhiling <chizhiling@163.com> wrote:
>>>>
>>>> From: Chi Zhiling <chizhiling@kylinos.cn>
>>>>
>>>> valid_size marks the on-disk up-to-date region of an exFAT file. It is
>>>> advanced from the write path, from read/zeroing completion, and via
>>>> truncate, while it is read without i_rwsem from ->iomap_begin and from bio
>>>> completion context. This series fixes several races and stale-data windows
>>>> that follow from that split ownership.
>>>>
>>>> Patches 1-2 are self-contained fixes: an append write may be moved to EOF
>>>> by generic_write_checks(), so valid_size must be advanced using the
>>>> recalculated position; and exfat_zero_new_range() must mark non-uptodate
>>>> pages dirty so the whole page is written back.
>>>>
>>>> Patches 3-4 are prerequisites for patch 5: truncate now holds the
>>>> invalidate lock so it is mutually exclusive with mmap writes, and
>>>> valid_size/zeroed_size become atomic so they can be read safely outside
>>>> i_rwsem. Patch 5 then takes exfat_page_mkwrite() out from under i_rwsem,
>>>> since blocking on the inode lock under mmap_lock could deadlock and its
>>>> VM_FAULT_RETRY result is not honored, and advances valid_size under the
>>>> folio lock to keep the page cache and valid_size consistent.
>>>>
>>>> Link: https://lore.kernel.org/exfat/10029d6f-13cc-4d17-a2f9-b093a8339dde@163.com/T/#t
>>>>
>>>> Chi Zhiling (5):
>>>>     exfat: advance valid_size to EOF for append writes
>>>>     exfat: dirty all new pages when extending valid_size
>>>>     exfat: hold the invalidate lock while truncating
>>>>     exfat: make valid_size and zeroed_size atomic
>>>>     exfat: use folio lock to protect valid_size
>>> Could you check the review comments from Sashiko ?
>>>
>>> https://sashiko.dev/#/patchset/20260927080305.831641-1-chizhiling%40163.com
>>
>> Okay, I’ll take a close look at this review comment.
>>
>> I also noticed that the comment mentions that concurrent DIO and page
>> faults may lead to data corruption. I believe this is a long-standing
>> issue, and I don’t currently have a good way to fix it.
> Okay, I'll take a look at that. Will you send v2 patchset soon?
> Thanks!

Okay



