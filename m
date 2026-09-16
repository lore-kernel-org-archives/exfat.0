Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E950F3B5843
	for <exfat@lists.linux.dev>; Wed, 16 Sep 2026 08:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547221; cv=none; b=Ki4sPf4IVK64oWA4KLf3zLPxuqn9K2qtRJ3fcZNUiv+XC4z0Kfx7F4O7Tk0wp77vf/Fi05IytRohJDKxJMIHi0OMe76zUSmMIAeL7VcnNGdvzZ2WTt93KTnZqzDH0o3u1kwZmxWuBXy0tElPZ6h5K8/QOFRXfiC/TLGQiMHUnRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547221; c=relaxed/simple;
	bh=bce/KZY702+5QtZvgkLAI2VHEQf4xZXtKHhSuUWbww8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z08gozZsKnDjFV4iKHqBV+Ert9m6E06YvoxgtlJY5AgLrEoiD3k1X/OYsCVHbjpOkjg7+eW9zbfWbrYl363lkM9rlqRRr6gVr3EVVTzMZz1a8hWDbULh8u7tjpkWbZKodqvBVn2hD9VnUBp2YLkR369anHo3vwjbWtVbqbVac2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WhDaWACU; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WhDaWACU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=hlatqW0ZmUa1qyIvRqVScOQ4nA2INGOEAbDaiQbWftw=;
	b=WhDaWACUR0BCRbaZebSaYTCLFLCUaPhmNkSHpwAMJJMUnmCpIV6DC9W4p3aKuP
	BRyDH0lzBvtODsnTfb8U29ECpZA2ltA4x1e6IkrB2eIpSYhQFxwS16U9tAMnB7PC
	wcimSVd5yhfp/Pq2kjrumVkgViFLrwEkZer7SjemRFgGY=
Message-ID: <32ff49e5-3a9c-4e34-9a09-b0196f7ec4ad@163.com>
Date: Wed, 16 Sep 2026 16:26:22 +0800
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: exfat: question about valid_size and page cache
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: dxdt@dev.snart.me, exfat@lists.linux.dev,
 "Yuezhang.Mo@sony.com" <yuezhang.mo@sony.com>,
 Sungjong Seo <sj1557.seo@samsung.com>, Hyunchul Lee <hyc.lee@gmail.com>,
 ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
 liubaolin <liubaolin12138@163.com>
References: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com>
 <CAKYAXd9wnmVyp4ONjYQPs5pxo_ruDmCN_yu7Ma4agDP1n-NNBA@mail.gmail.com>
 <7380972e-de54-4b56-a67c-842be8887c5f@163.com>
 <CAKYAXd_N7=M2dpQXqZMpoF7NwM_FvC-D3Hx4UR0qqrTzm23FPQ@mail.gmail.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <CAKYAXd_N7=M2dpQXqZMpoF7NwM_FvC-D3Hx4UR0qqrTzm23FPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgB3JgOuUqpqEMSlQQ--.39101S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUedb1DUUUU
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3BAGo2qqUrBsqwAA3M

On 9/16/26 2:12 PM, Namjae Jeon wrote:
> I will check if you send the patches.
> And there should be no regressions in the existing xfstests tests that passed.
> Thanks.

Okay, I’ll first try to construct a reproducer to see whether this issue
actually exists, and then test it with xfstests. I expect the testing to
be completed by tomorrow.

If the second issue does exist, we may need to use a new lock in
exfat_page_mkwrite() instead of the inode lock. In any case, I’ll first 
try to reproduce the issue.

Thanks.

