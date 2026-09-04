Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD001A6808
	for <exfat@lists.linux.dev>; Fri,  4 Sep 2026 01:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788486412; cv=none; b=sQH1vLUq+DZTbjCnXbkTqDKYsI6dYjBzmsfdv1IXODn5jZY1LDJ3WOxByIV5KLCeBrVptZqgthQ9MCAOAtQ0ZB8uJF81B2EIBULKV0zep8ZTT7F9LOO7CmQ+GR8vhVVJGsdDY+bDpscpzH3igblYMOqRJ0ukwA3vDt50bJ00xd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788486412; c=relaxed/simple;
	bh=P9jK/W1SXw8+elQE0IMUfuRuqbUBrsprc3OZk9dZdfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdApy9KoPgjqMeZ4/ZsGNTvNhehaxoG3cl/LqPl5hps473d4CmPNJUxDcgrswHqxsYY3Zdl3CELlms/OEuAelC+r0/1QZIcxMQse1+A2zToOOwalDCJH5Ydy0sBDc8CrR8yFm4SK+6x4dI2Zqn1feGvl5wCMFSJ2GV/netfwjj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=D8JzgV6W; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="D8JzgV6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=fQt31jEFrQa2alu2KDpObFxfs4FjKipi6DPc9sw38LI=;
	b=D8JzgV6W1mSCvv06SzhvxasupJIV6BGPUjugAR1COQEuar8Q5M1OMHW0E/0LK0
	23GQKysyNwBWoMMqK3OdqGBfqT8Bmi72pYUbwQbeSsDvLGhlnY7KQjy6/vk2bPP7
	/xVeHOicTV8+IaDAYexqJ12g+I4qjtyzO7rMHrcF1E0EA=
Message-ID: <58bcfcdf-167a-4553-bfcd-cd576e9379b0@163.com>
Date: Fri, 4 Sep 2026 09:46:33 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] exfat: clear the volume dirty flag only when remounting
 read-only
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org,
 Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20260903092623.301981-1-chizhiling@163.com>
 <CAKYAXd-YoYZfNGDJs1gjJPHZ4n5oe+r93y32Gyb=p8rUxzDeqg@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd-YoYZfNGDJs1gjJPHZ4n5oe+r93y32Gyb=p8rUxzDeqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wAX1ZX5IppqUvEYAg--.24064S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF1fAFyUZr1rXFykJr17trb_yoW3WrbE9w
	s7uF48Aa4jyr13G3WFkryft39Iqws3uryjgrsrJr15Xa9rAF4fJrWDXFyrCa4fKFZrCFZx
	Arn8C34xGa10gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj8sqtUUUUU==
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+BsIpWqaIvvCbgAA3L

On 9/4/26 7:28 AM, Namjae Jeon wrote:
>> diff --git a/fs/exfat/super.c b/fs/exfat/super.c
>> index a9ea36ba2693..268732571837 100644
>> --- a/fs/exfat/super.c
>> +++ b/fs/exfat/super.c
>> @@ -775,9 +775,12 @@ static int exfat_reconfigure(struct fs_context *fc)
>>          fc->sb_flags |= SB_NODIRATIME;
>>
>>          sync_filesystem(sb);
>> -       mutex_lock(&sbi->s_lock);
>> -       exfat_clear_volume_dirty(sb);
>> -       mutex_unlock(&sbi->s_lock);
>> +
>> +       if ((fc->sb_flags & (SB_FORCE | SB_RDONLY)) == SB_RDONLY) {
> Could we also add !sb_rdonly(sb) here?
>              if ((fc->sb_flags & (SB_FORCE | SB_RDONLY)) == SB_RDONLY &&
>                   !sb_rdonly(sb))

Yes, this way we do not call exfat_clear_volume_dirty() when remounting 
from RO to RO. I will update it in v2.

Thanks.


