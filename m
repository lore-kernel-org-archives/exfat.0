Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C423603EB
	for <exfat@lists.linux.dev>; Tue,  1 Sep 2026 07:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247127; cv=none; b=gkp7GLi5cRBKd3/VSwQEYkDd7LoTmyIps2CE5q85XoGzMFZm9J7u25fayOlnTtdVv25Eg+JKXjbKSp6nQeRNcawUg8zXt9SriO4PDQw9ZMsGeMk0XouLVly4mg6R8yd6LooxVMOrp7ZGsZLTyyDUswkc54DCEWKCP/xFpnBL+Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247127; c=relaxed/simple;
	bh=qpGMO2t0h1dOFGcdYDNbkNH0if99gh3rC5Jb5Je4C3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKK6ARhDc3PnaHA1/3D4Qbb9zz1eFvrLWRfKkXJVbXNEvXhlM+NFSXEMULtkQ2UvvYT+zPqvh8NqbDBVSl7iWmIpEzl4v/6SknL8TO1r2NTJtnMIJfcPdZ3Wa85Lbbbeiw4AGbk4OS1MnK0LzEJqEN7HuprMIhnIU9WBy+ZqmZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=iL54+WX3; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="iL54+WX3"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 65D831D452;
	Tue,  1 Sep 2026 07:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 65D831D452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788247124; bh=qpGMO2t0h1dOFGcdYDNbkNH0if99gh3rC5Jb5Je4C3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iL54+WX357cj7J+8aUX9WVhiDexivK+Ti0RatSFuM/Gollud8MDZBaumkaDbDVW/J
	 Blk+K8YcB6tKiQB3534HTbXXFUoXTTLavoEdACS+zi3vokoALorKZSX5wtOF6hAgsD
	 36VP0udAtH3OC8RtdTqXTNEn2DHB+eKvSv0pghpA=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id RIAGBlN8lmrS8wMA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Tue, 01 Sep 2026 07:18:43 +0000
Message-ID: <154d417a-65d7-42ba-84d1-ea7834e11c8d@dev.snart.me>
Date: Tue, 1 Sep 2026 07:18:41 +0000
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] exfat: doc: add documentation
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, linkinjeon@kernel.org
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev,
 anmuxixixi@gmail.com, chizhiling@kylinos.cn, linux-kernel@vger.kernel.org,
 zhanxusheng@xiaomi.com
References: <20260831105330.10449-1-linkinjeon@kernel.org>
 <20260831144929.1597433-1-zhanxusheng@xiaomi.com>
From: David Timber <dxdt@dev.snart.me>
Content-Language: en-US, ko
Autocrypt: addr=dxdt@dev.snart.me; keydata=
 xjMEYmJg1hYJKwYBBAHaRw8BAQdAf5E+ri1XLtjqYbZdHOyc8oS+1/XJ5bSlbx5WHXmVBZzN
 IERhdmlkIFRpbWJlciA8ZHhkdEBkZXYuc25hcnQubWU+wpQEExYKADwWIQQn/Jn96EMUaIoF
 X+T/ldyyrZpWaAUCYmJg1gIbAwULCQgHAgMiAgEGFQoJCAsCBBYCAwECHgcCF4AACgkQ/5Xc
 sq2aVmjJZwD8COjPlUwccrlRvbNQ6f87DWchtYO0o8W2DNRM3RLps0EA/jEhIbRV6AsyC8jr
 30Ut3aJ3/mO/6G4sLj7OvkEEBH0MzjgEYmJg1hIKKwYBBAGXVQEFAQEHQFpgtIgaByv9lIEY
 EmpavMO0pYjtu7TMJynwdnGYkN9LAwEIB8J4BBgWCgAgFiEEJ/yZ/ehDFGiKBV/k/5Xcsq2a
 VmgFAmJiYNYCGwwACgkQ/5Xcsq2aVmhFCwEA0kM9VyYB4bLCM7+SuXUUH+5Ec99Nj4RXxFad
 Key9GuwA/2BZK6bNyrLSfEk2JDRoskqf7OIL0wa6JOD5SrBnMe8E
In-Reply-To: <20260831144929.1597433-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/31/26 14:49, Zhan Xusheng wrote:
> The option list and the defaults match fs/exfat/, including the allow_utime
> derivation and the time_offset range.  Three things the table leaves out or
> implies.
>
> Most of the options cannot be changed on remount.  exfat_reconfigure()
> fails with -EINVAL if iocharset, keep_last_dots, sys_tz, time_offset, uid,
> gid, fmask, dmask or allow_utime differ from the current values
> (super.c:789), leaving only errors, discard and zero_size_dir.  Nothing is
> logged on that path, so "mount -o remount,uid=1000" returns a bare EINVAL.
> The reason sits in the code right above the test: the old values are cached
> in inodes and dentries.
>
> umask= sets both masks, and the options take effect in the order they are
> written.  Opt_umask assigns fs_fmask and fs_dmask (super.c:289), so
> "-o umask=0022,dmask=0077" ends up with dmask 0077, while
> "-o dmask=0077,umask=0022" silently puts dmask back to 0022.  The dmask=
> and fmask= entries also do not give their default, which is the same
> current umask that umask= defaults to.
>
> utf8 is ignored rather than an old spelling of iocharset=utf8.  It shares a
> fallthrough with debug, namecase= and codepage= (super.c:331), so
> "mount -o utf8" selects nothing.  exfat_show_options() prints
> iocharset=utf8 only when opts->utf8 is set (super.c:132), and nothing sets
> that but iocharset=utf8.  Listing utf8 apart from the group described as
> "Deprecated and ignored" reads as if it still has an effect.
>
> Thanks,
> Zhan Xusheng
idk.. The proposed documentation says nothing about the remount option
as of yet. Reconfiguartion of the most of mount options FAT isn't
supported either, but the documentation doesn't really specifically
mention that fact because there's little to no actual use case other
than remounting ro or rw.

Other than the last paragraph, these are separate issues not really
pertaininig to the proposed documentation, if they're valid. I suggest
that you submit patches fixing the issues if you'd like to contribute.

The valid point on "utf8", though. Opt_utf8 is ignored. I think this is
actually a bug in the implementation rather than a factual error in the
doc. "Deprecated" shouldn't mean "it's a no-op". They're totally
different things. fs/fat still honors it, so I think fs/exfat should do
the same.

Davo
