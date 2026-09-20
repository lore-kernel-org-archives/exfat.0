Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC883515D3
	for <exfat@lists.linux.dev>; Sun, 20 Sep 2026 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789883689; cv=none; b=Hwty18NDWFCuFiNgrhoMad8735BhpFRAxi1eq3e74JTUex8/Q1lxBozWEboFsxBllTUnfGcDE70U2AmTO7wg4f4VWJ4l8vvoBRTFsBS2cMz6N11gQoTqfA18ww3ocueK6Uvi/Cn2bJkPhdtxIX5teUfff+OdAdhEfdbnW6O3gFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789883689; c=relaxed/simple;
	bh=d814LnLn4PqcRmpRGVXX4J9iJS1LtVlYGQW8mU3BtDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWYb6SPHTFqFjfkqFjZWZ2sxa5zvsSoIggu7wpE4/KBDCM/RU7/CeiC8+0e3apKfjH/eAYFB007kLdwm9OfSsNgk/Da3XCSJQ7bCjLwyQSDw0HM7JBTDzHZDx52Je+qA5NfqbTTLH5ytl4eAPbNKXPxnOOvM3ndYmPjKpcS9cKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fSsOC+MD; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fSsOC+MD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Fqb1xEIV2nBWDJtFPeFrYXTxS/YyoobPinE+XHejJAE=;
	b=fSsOC+MDw+eD0CSZM/FOoiaF/vll0tqrfLQhXrdprtU2Mrg/4Ufsu/FFVr19KA
	vl01tMR80KZulcY4AtS/HdK9JDLpMXyCeVPaxI+TMUFi9lxDFck4Aq2IJKDGo8Pb
	fmx+Zmm/w8+7KxcfYOaiCTZFJ5hvKV4AI6KHivWA9WPTU=
Message-ID: <10029d6f-13cc-4d17-a2f9-b093a8339dde@163.com>
Date: Sun, 20 Sep 2026 13:54:07 +0800
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
 <0fa9e808-0401-42fa-8ecc-776cbc67e918@163.com>
 <PUZPR04MB6316FC1A97FFF6A062C9A6D881852@PUZPR04MB6316.apcprd04.prod.outlook.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <PUZPR04MB6316FC1A97FFF6A062C9A6D881852@PUZPR04MB6316.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3JgUAda9qYzQkBw--.53585S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr17Aw1UAry7Zr1fAr4ruFg_yoW8uFW3pF
	ZxKF1UKFWkJ3WUur1vq3WxXF10934rK3W5W3Z3Gay7AFn0vFn5Wr1UKayS9ay3Gwsrtr1S
	v3y2va93X3WUZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UseOXUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2wHjgWqvdQHrcwAA3R

On 9/20/26 10:17 AM, Yuezhang.Mo@sony.com wrote:
> On 9/18/26 15:37 PM, chizhiling@163.com wrote:
>> On 9/18/26 1:56 PM, Yuezhang.Mo@sony.com wrote:
>>> On 9/17/26 18:10 PM, chizhiling@163.com wrote:
>>>> On 9/17/26 5:21 PM, Yuezhang.Mo@sony.com wrote:
>>>>>
>>>>> Revisited the implementation of exfat_zero_new_range(), I think it is unnecessarily duplicating
>>>>> existing functionality.
>>>>>
>>>>> exfat_iomap_read_end_io() already takes care of zeroing the page cache beyond valid_size. By using
>>>>> read_cache_folio() to obtain an uptodate folio, we can reuse the existing exfat_iomap_read_end_io()
>>>>> implementation instead of introducing another zeroing mechanism. Then just need to use
>>>>> folio_mark_dirty() to mark the folio dirty, causing it to be written back.
>>>>
>>>> Yes, you're right. In my local branch, I implemented this by calling
>>>> __filemap_get_folio() and exfat_read_folio(). The relevant code is
>>>> below. It's a bit ugly, so I’d really appreciate it if you have any
>>>> better suggestions:
>>>
>>> Why not simply use read_cache_folio()? Also, it is necessary to hold mapping->invalidate_lock.
>>
>> I only did a quick search under fs/ and noticed that
>> __filemap_get_folio() is used more often. I’ll change it to use
>> read_cache_folio() in the next version and test it.
>>
>> Why should we hold invalidate_lock? Is it because invalidate_lock is
>> supposed to protect valid_size?
>>
> 
> Yes, the current implementation uses inode_lock to protect updates to valid_size
> and zeroed_size. We can consider using invalidate_lock to protect them instead.

I think this is a direction worth exploring, but we should be careful 
when using invalidate_lock. In the buffered write path, we should not 
hold invalidate_lock while calling iomap_write_iter, because 
iomap_write_iter may trigger a user-space fault during its execution, 
which could lead to a deadlock.

> What lock does your method intend to use for this?

I was originally planning to use the folio lock, but just like with 
invalidate_lock, there are some details that need to be considered.


