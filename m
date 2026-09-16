Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C89B286D4D
	for <exfat@lists.linux.dev>; Wed, 16 Sep 2026 04:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534497; cv=none; b=mWJvz1ntDwagHlw5REu+ib4fnRGpS3iH2Gp52KICOLpvvniEroZt252snGhqXkEDdN+Ui38A2KEHTROixpKxedIxXBDs9d5ItJ7QdoSG86VPEJeLxBr3+00Ot4k26IoHFH7Fvf91+ZUGolOqWiWAEFrKPHMGK1bX6IuZ7NfsLZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534497; c=relaxed/simple;
	bh=djB64Pd49TVYWyeZdkJ5loU2TtO0PvpRbTSfPcV0AmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBAtRz7fT1s4gxZWwgmGESPyZxrEjJyox8228P6kLW/bIC/yxSgumSy779Y9+QGouQQkgpNVtmRU8Es4d7XbYJacrLQIyJugZ7GiTpg8eMuztFEbLNc8aoDTf0fFwoSaJJ9oBx3jmWGsm+vsgoUIRjj6kxqa4O5q9js0zGFbzXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gp/Fsl90; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gp/Fsl90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=RlKe15lPwexWf87GWm2qsOM1o5Ge/aSqsZ96kp3vzEU=;
	b=gp/Fsl90faMO65RJnuivt88+bdylEGn6r55UQ2Anes84PN8Nxaqnla+XxZoueW
	ORyNba7oAA+B3Q6Qv2ePU7n+uvUR9xs0ToiQDEZIl2Cu1SylWAOvibyIx1YMLLvQ
	e3xDR0okeTGyqSsuBL3azpbOI+iJzIpqulcG7AcraYjgQ=
Message-ID: <4541f56f-3f7a-4805-8b82-157255ee8041@163.com>
Date: Wed, 16 Sep 2026 12:54:20 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: exfat: question about valid_size and page cache
To: David Timber <dxdt@dev.snart.me>, Namjae Jeon <linkinjeon@kernel.org>,
 exfat@lists.linux.dev
Cc: "Yuezhang.Mo@sony.com" <yuezhang.mo@sony.com>,
 Sungjong Seo <sj1557.seo@samsung.com>, Hyunchul Lee <hyc.lee@gmail.com>,
 ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
 liubaolin <liubaolin12138@163.com>
References: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com>
 <0b82a6b7-8dfb-4445-a9ae-f3029b87ddaf@dev.snart.me>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <0b82a6b7-8dfb-4445-a9ae-f3029b87ddaf@dev.snart.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXbqD8IKpqsV4UBA--.64880S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr4rJFyrZw17JFWruFyDKFg_yoW8WFykpF
	WSkaykGFn7J34kGws7XwnIkw1Fv3y5tFZ5GryrXr95CanxXFySqr4YkrW3urZIgwn5ta1U
	Xw4jgF9FkF98J3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Us18PUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+B2MKmqqIP37hwAA3i

On 9/16/26 11:07 AM, David Timber wrote:
> Hello, Chi.
> 
> Excuse me for top posting and intruding(me not being Cc'd), but let me
> first preface this by taking your attention to the following
> conversation, which was my poor attempt to make VDL sense in Linux
> kernel somehow:
> 
> https://lore.kernel.org/linux-fsdevel/20260313162408.GE6023@frogsfrogsfrogs/
> 
> Excuse my French, but VDL is.... a pain our collective rear ends. It
> doesn't fit nicecly with the kernel API's, which are all extent-based
> file systems. 

Yes, I completely agree.

> 
> On 9/16/26 02:32, Chi Zhiling wrote:
>> Hi, Namjae
>>
>> I have a question about the valid_size advancement logic in exFAT.
>>
>> In exfat_zero_new_range(), we zero all folios that are either not
>> up-to-date or do not exist.
>> I'm curious whether a page in the page cache can remain beyond
>> valid_size. If not, why do we need to skip an uptodate page? There
>> should be no uptodate page beyond valid_size, right?
> Only when lseek() or pwrite() is not involved.
> 
> To your point, I do think that the pages, if they're faulted, should be
> first backed by the zero page if userspace only references it, not write
> to it just like how read to MAP_ANONYMOUS faults are
> handled(empty_zero_page in pgtable.h). Otherwise, we're basically
> unnecessarily poisoning the cache. I'm not even sure if it's possible
> with folio, though.
> 
> If you don't mind, please reference some relevant code so we could be on
> the same page(no pun intended)? I'd really like to see how experts
> handle this issue.

Sure. I’ll post the relevant code in another reply, describe the issue 
in detail, and CC you on the reply.




