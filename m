Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056513806DA
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 02:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787796517; cv=none; b=QCwOURk5FpfwRJ5EuUSYoPNR8TciCaLba9awh+O9H8jqxl/sOQsV1xIS0UVCfkcqYnOrlZocpPsZgBiPsyNkdA9L/b8ddG67Eo/vafEP0BFbyvZshr6OBJsx4XbKCcWlXSXU2pDgR6aNMs3bygWQ69/n3Sp5g5VfaOJkvazRgL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787796517; c=relaxed/simple;
	bh=mYNeG8PpiCg7KtMp1t/6TzxwaSR6WmD7BYQlhtAe+vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WtRS0H1u6b0o/oWF1VGbYpLDYm4fr6tPGVsVmKdgDQ90AZBUTgRFhBYWvWBW80O7tP5k8akzT+DpXX2cbGSAPJkcFZQn4XadReK8NpjQo8klIk8aLJyJndlSfRPRuckBY0JCc9Bm80eaL2a85BlhoBdahbwavKLqyggrC69IEz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CLd8Hmu3; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CLd8Hmu3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Q5R7yxvNnHeu1Pmf1VPlzqNF4/6IOZKhiPhlDgfYcB4=;
	b=CLd8Hmu3Gh256ldPNZfRGUayr3ZXqpYGRy8EDqOouSsYk0NFgbgySyFynDwJJy
	wpkT5olWT5LsNoyOdqzeroF4sYPh5jmvee7Ujm03qKrHNzl6mvMR7J4qQWT9Zz1D
	ipZL3R16yKfLEXN0khvCi/jvLWyeCEZCPpDqE6XiZD3L0=
Received: from [10.42.0.64] (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHyxsNnI9q3ENqOQ--.39675S2;
	Thu, 27 Aug 2026 10:08:13 +0800 (CST)
Message-ID: <9614e8fd-c12c-4a0c-bba4-d2469d7b19aa@163.com>
Date: Thu, 27 Aug 2026 10:08:13 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 3/6] exfat: use atomic bit ops for volume dirty
 flag
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20260821100531.998196-1-chizhiling@163.com>
 <20260821100531.998196-4-chizhiling@163.com>
 <CAKYAXd_gZFJ8P-pk1RijAVtB9A4PdHG8fcwHRAUsS+Kum_3ALg@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd_gZFJ8P-pk1RijAVtB9A4PdHG8fcwHRAUsS+Kum_3ALg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:QCgvCgCHyxsNnI9q3ENqOQ--.39675S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrW3JrWfWw1ktF48uF4UArb_yoWxtrX_Aw
	s29r10kr48Ar4a9w1DA343WFZ2qFn3ZwsFqFWY9rykXr48Ar13Zr45ur9rXas3W3ZrXr4q
	vwnxXrWYyw1UujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj8nY7UUUUU==
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2w2oRmqPnA2TGwAA3E

Hi, Namjae

You are right. This should not be removed. I will restore it in the
next version.


Thanks,

On 8/27/26 9:03 AM, Namjae Jeon wrote:
>> -static int exfat_set_vol_flags(struct super_block *sb, unsigned short new_flags)
>> +static int exfat_sync_vol_flags(struct super_block *sb)
>>   {
>>          struct exfat_sb_info *sbi = EXFAT_SB(sb);
>>          struct boot_sector *p_boot = (struct boot_sector *)sbi->boot_bh->b_data;
>>
>> -       /* retain persistent-flags */
>> -       new_flags |= sbi->vol_flags_persistent;
> Please don't remove ->vol_flags_persistent. It prevents pre-existing
> volume dirty flags from being lost, but removing it clears a dirty
> flag set before mount during normal unmount.

