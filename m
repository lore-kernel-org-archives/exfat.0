Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF99144607B
	for <exfat@lists.linux.dev>; Wed, 30 Sep 2026 07:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753219; cv=none; b=IXeE3QHVNj5GZs+AWF4Ftza1ttDSwnHNmEtoiCGko5+x0syJMEgo6p1xfbLgu0tTUGYkiZXeWcTfGJJchCwayXb837m1A3qNIBEOVFV7vchPArvyTXUxz3f+Jj83/aKn1MPLTypjCJJfX/vjQiW+Q9eVbZHYBPRIaQKGHNRvd10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753219; c=relaxed/simple;
	bh=Sme06fKXpiiS0JBem73tB5psGks4xF4W6JFw9pyTmR8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q+ndwJZZRuwiOfmRpTHFhKBK132SguuhPoFEaJV9xPoOQhZ8LYlQUrdAShCUAlbow1yJpsdnRpE+pCCy4aS/GksddXBX261K99aelhBI0A4WqREEetZ9xbomY2/EWS5me/aj27ZslJWqTzLteZPSdsKy0bQUV7bVL7vrTv9OV7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mffTrond; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mffTrond"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:To:
	Content-Type; bh=NN2hEgGLw48vK5sfJgjnwzekKEgXuy4gp2w1AvGr6bU=;
	b=mffTrondUJE+COWCkoAGeFm7gxQ++X2sLD4eJ7wG6jMwevvgRc0vohLabfqfyY
	SNSILV22/+MfffsXrhJ+Z+UpAHnHqZBxMi5/IhDlErd+fABjYPr9APYXmwqr/d8C
	AQH8wWyz//KJCs36NOWOtaXcPHAROc65Ga8q/uho2zkRU=
Message-ID: <6c4a254e-5d3f-433d-80d9-ab243785d6cf@163.com>
Date: Wed, 30 Sep 2026 15:26:03 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] exfat: dirty all new pages when extending
 valid_size
From: Chi Zhiling <chizhiling@163.com>
To: "Yuezhang.Mo@sony.com" <Yuezhang.Mo@sony.com>,
 "exfat@lists.linux.dev" <exfat@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "chenxiaosong@chenxiaosong.com" <chenxiaosong@chenxiaosong.com>,
 "dxdt@dev.snart.me" <dxdt@dev.snart.me>,
 "hyc.lee@gmail.com" <hyc.lee@gmail.com>,
 "linkinjeon@kernel.org" <linkinjeon@kernel.org>,
 "liubaolin12138@163.com" <liubaolin12138@163.com>,
 "sj1557.seo@samsung.com" <sj1557.seo@samsung.com>,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20260927080305.831641-1-chizhiling@163.com>
 <20260927080305.831641-3-chizhiling@163.com>
 <PUZPR04MB63169342024E0071F334B25B818C2@PUZPR04MB6316.apcprd04.prod.outlook.com>
 <cf7a4ce8-1f64-4ab2-ac97-033f1a45438b@163.com>
In-Reply-To: <cf7a4ce8-1f64-4ab2-ac97-033f1a45438b@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgB3XquLubxqvXfDCA--.36916S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr4fAw4DWF4xZF1DGF1DAwb_yoWftFb_ur
	1kAwnFgw4YgF4ftF9xtrnxAryvqrW0kry3CF10y3W7A345Aa4kJryvvrZ3ZrykJF17WrZx
	Crn0ga4Syw1UZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU66wtUUUUU==
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3A1b+Gq8uY0aaAAA3i

On 9/30/26 2:16 PM, Chi Zhiling wrote:
> On 9/29/26 6:26 PM, Yuezhang.Mo@sony.com wrote:
>>> +               if (folio->mapping == mapping) {
>>>                          folio_mark_dirty(folio);
>>> +                       pos = next;
>>
>> Setting 'pos' under this condition may result in an infinite loop.
> 
> If we set pos unconditionally, I'm concerned that we might miss marking 
> a folio as dirty, which could expose stale data.
> 
> I think it would be better to switch to __filemap_get_folio() in the 
> next version. It can directly return a locked folio, so we don't need to 
> check whether the folio has been truncated.
> 
> folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN, 0);

Sorry, this change is incorrect.

I took another look at it, and I think this loop will not block. 
Reacquiring the folio is the correct approach, and do_read_cache_folio() 
performs the check in the same way.

> 
>>
>>> +               }
>>>                  folio_unlock(folio);
>>>                  folio_put(folio);
>>> -               pos = next;
>>>          }
>>>
>>>         return 0;
>>
> 

