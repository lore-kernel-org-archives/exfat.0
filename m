Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63110366055
	for <exfat@lists.linux.dev>; Wed, 16 Sep 2026 02:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525986; cv=none; b=RG2MoQZX8J1QtXmGIUBqC4j1C5+9iL0Ksdll3CEmTGcRNTRfQhbras8Rlb7Tzy87SuT4kKrxria9Lvy5X4aX0GVqw3XUhIdmVQ09CayWXeDTujKkCe3RGu9C5PZ2DMvpS8FitgeBmBYRnPXXyGLM7qGnnOWpgYyIFU0CWgLpj8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525986; c=relaxed/simple;
	bh=EZ0Y0GH0eFnv267z1dNfPCOyajbrwUevBxSP+KPoIKE=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=C2snBSYQe/44Ccs2puSfrpot6smclGm0jdreWL6bawZiXNsrzwQ3wsKKliMitwRz821/+YMDy2nNpTqcxlzClgkA82pYmaAm97Z0U5+gJhZAmBJqqr1FVCIevNzoqbF9XXa7Ub/DT7OTaqjHFLh2UKh671hJPNTLr0LutetJ+HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=P8JOjN/P; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="P8JOjN/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:From:To:Subject:
	Content-Type; bh=J3z0XGcRdphSoSeo7/86EQAYwoXU6fhTS2E3TBUiKso=;
	b=P8JOjN/P068XTNio9T4flSBqgmk466Su9mQeyJ5hkj93FMREfEBHnOYwyGEoNM
	J8TBzMO7QXDnLYWesZqD+cSsktvmnLcWkHxd3r2Dhh4HYWxNECTBTu9xAcnj2b1T
	FmS90Cp5Mo70OPauzUhBPQavJGV4YMuJGEOyBz2Mg+KGk=
Message-ID: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com>
Date: Wed, 16 Sep 2026 10:32:40 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chi Zhiling <chizhiling@163.com>
To: Namjae Jeon <linkinjeon@kernel.org>, exfat@lists.linux.dev
Subject: exfat: question about valid_size and page cache
Cc: "Yuezhang.Mo@sony.com" <yuezhang.mo@sony.com>,
 Sungjong Seo <sj1557.seo@samsung.com>, Hyunchul Lee <hyc.lee@gmail.com>,
 ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
 liubaolin <liubaolin12138@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:QCgvCgAHiSDI_6lqRgVBRw--.32346S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr45KF18uryftrW7CFWfKrg_yoWxCFX_WF
	1vy34DX3Z29FyxCrs8Ga4kZrWSqrWUua18Z3sYgry3tw15XF1rJrnFvr1rWr10krWIkr4D
	KFn3ta4Uur13ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8Q6pDUUUUU==
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9wk31Gqp-8nRZAAA3d

Hi, Namjae

I have a question about the valid_size advancement logic in exFAT.

In exfat_zero_new_range(), we zero all folios that are either not 
up-to-date or do not exist.

I'm curious whether a page in the page cache can remain beyond 
valid_size. If not, why do we need to skip an uptodate page? There 
should be no uptodate page beyond valid_size, right?

If such pages can exist, how do we prevent them from becoming holes in 
the page cache? Those pages could be written back and then released. In 
that case, we may later zero the corresponding range, which could 
potentially result in data loss.

By the way, I'd also like to understand how NTFS handles this issue.


Thansk :)

