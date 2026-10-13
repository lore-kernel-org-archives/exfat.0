Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047973E1729
	for <exfat@lists.linux.dev>; Tue, 13 Oct 2026 06:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871406; cv=none; b=RbJFJglQnxWkjnM7ePqrhhCuK6QCbhj6e5a8YIWd841G81z2+34d2ezbIIaRJDnt48u3DRw9Smuki7jvTJ0sXnHUGk7+mjZLGY7uVMmQnRa49GIb7Qky7wl30f9jDVtdfU2TkIFBk5DmrzlFl/+g/av71wIjPGXsYBuR1g6umYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871406; c=relaxed/simple;
	bh=OaX1apPbFUkBjp9UrZ/NZAi1hvdR7ppShmw6KR+gJ+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAvvD6BZfPhQ1uT9JdCo4jRGpGlps71gYu29wAj0LpvWvwmBfaGebfSNzQAZmcTxF8ySk4mbYUH8XkNQ7CslvFMWaAXVOVhHXNAKC3f8zpMvy5dJbcnyTNQ2YMGGRIzq04jvUaLe+Tmf9GhO+rQBnc1CzniZkzT/SeVciV4gG7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dP6aziLu; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dP6aziLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=YvK1v3PlkaD7Gn+91at/jtdmO9yT32qQMT5mZK7CerE=;
	b=dP6aziLuGAufw3SL2ralvZopLm9+9VWxqHgvw1gLBr7Ry+bPai0UcpeUWj+CU/
	lbOR2IS46lWxux2rlYAXHLxKR4GaogHnkCVRSacog8N9lpR3OWb0PkR7CD7FuiJf
	Dla3ESNb1e0/gfYDcUvyLYmC6SGk10m04p9ZCcqyBOiog=
Message-ID: <d16e59c4-2dcf-4e09-b17e-4c56e177f440@163.com>
Date: Tue, 13 Oct 2026 14:02:52 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] exfat: fix valid_size update races
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yuezhang.Mo@sony.com, dxdt@dev.snart.me, sj1557.seo@samsung.com,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20261013033837.2748258-1-chizhiling@163.com>
 <CAKYAXd8gAtr9uhF_ogOUuc511VEed5HbXbvjzeq-81t_u-4uJQ@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd8gAtr9uhF_ogOUuc511VEed5HbXbvjzeq-81t_u-4uJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnn76Nyc1qzRzvEA--.7092S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1kJw1DCw17KF1fWrWDXFb_yoW8Xw1Upr
	ZY9as3GrWDK3y0ywsFvw1rA3W8u3s5XF1fGrs8Gw1UAr4a9F12va1jgrW2krsrtw1DKw10
	qwsFv348Cr1jv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRL2-rUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9w+jQWrNyY9MXQAA3q

On 10/13/2026 12:04 PM, Namjae Jeon wrote:
> On Tue, Oct 13, 2026 at 12:39 PM Chi Zhiling <chizhiling@163.com> wrote:
>>
>> From: Chi Zhiling <chizhiling@kylinos.cn>
> Hi Chi,

Hi Namjae,

>>
>> exFAT uses valid_size (ValidDataLength) as the on-disk boundary of
>> initialised data, but the current code advances it too late or without
>> proper serialisation.  As a result, buffered writes can silently lose
>> data reclaimed before valid_size covers it, page faults and direct I/O
>> can race with writes, and a failed direct write still grows the file
>> on disk.
>>
>> This series advances valid_size under the folio lock for buffered
>> writes, revalidates cached iomaps, drops i_rwsem from
>> exfat_page_mkwrite(), and publishes i_size/valid_size only on
>> successful direct I/O completion.
>>
>> V1: https://lore.kernel.org/exfat/59056131-e3bd-4003-8c30-0a356cf0bd82@163.com/
>> Link: https://lore.kernel.org/exfat/10029d6f-13cc-4d17-a2f9-b093a8339dde/T/#t
>>
>> Chi Zhiling (7):
>>    exfat: advance valid_size under the folio lock for buffered writes
>>    exfat: advance valid_size while zeroing new ranges
>>    exfat: validate cached iomaps during buffered writes
>>    exfat: drop i_rwsem from exfat_page_mkwrite
>>    exfat: do not re-zero the valid range in exfat_page_mkwrite
>>    exfat: complete direct writes synchronously when they update metadata
>>    exfat: publish i_size and valid_size on direct I/O completion
> Can you add fixes tags to the patches ?

Sure, I'll add Fixes tag in the next version.

