Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD8037B41F
	for <exfat@lists.linux.dev>; Tue,  1 Sep 2026 06:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243881; cv=none; b=azyP+2dl916zXHxUWvvfY0Iau4gAVSQVg1wUTc0t9n2mh5aqtkjStN3zgR0mn2ZaYl6cn1nlvWj+ZYGJDsr/TjT/Oxtt/7YovKoJFda99aH4ULuaikovCd9fEei+E1Nn+DmAOlbA3cj0KGO/QYnPURCwPvyvfeWjjneSD9WyyB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243881; c=relaxed/simple;
	bh=x/zhMV7bRe9TbGjL/u82mKRXEQrIs6PSaKmNZJSZU44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EK3ifS1u4O90/vVcohgaaQ+6GHd6IQpS0RdjhbS3f3kGHq6MfP8pOioZAdN71rhgaSO+9ilzRhEbEB8PopPsNnUw/wKQDqnR+ubr85czFLhk/ItNM56bnMr3YcPU8GZ60eX0EdcFi/g0xL7GJ0dHMK48C3hFZYNkoIryVCXkLlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=CDcJ5fMI; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="CDcJ5fMI"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 50C2D1D452;
	Tue,  1 Sep 2026 06:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 50C2D1D452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788243872; bh=x/zhMV7bRe9TbGjL/u82mKRXEQrIs6PSaKmNZJSZU44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CDcJ5fMIlo9mBAkdWxdW2luexLBY60nCLZFZiJxYa/SIin3HXyjfs8+XFH7C3CVJl
	 1lvMmsIgYo5oRWOW1S1iEFXUsfvN+RXWQEx3g8fFUW/Nre0kvSvA3SPW/NWfZduuFT
	 /Iqqy9U9QGTfH1RwMPElcjSogtSdqKIo7H7idSs0=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id RwMeAJ9vlmoN8AMA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Tue, 01 Sep 2026 06:24:31 +0000
Message-ID: <c52c7fbb-b816-497e-b856-ea9a7dd3b38a@dev.snart.me>
Date: Tue, 1 Sep 2026 06:24:22 +0000
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] exfat: doc: add documentation
To: Namjae Jeon <linkinjeon@kernel.org>, sj1557.seo@samsung.com,
 yuezhang.mo@sony.com
Cc: exfat@lists.linux.dev, anmuxixixi@gmail.com, chizhiling@kylinos.cn,
 linux-kernel@vger.kernel.org
References: <20260831105330.10449-1-linkinjeon@kernel.org>
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
In-Reply-To: <20260831105330.10449-1-linkinjeon@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/31/26 10:53, Namjae Jeon wrote:
> Add documentation for the Linux exFAT filesystem driver, including
> supported mount options and exfatprogs.
>
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
> ---
>  Documentation/filesystems/exfat.rst | 117 ++++++++++++++++++++++++++++
>  Documentation/filesystems/index.rst |   1 +
>  2 files changed, 118 insertions(+)
>  create mode 100644 Documentation/filesystems/exfat.rst
Don't forget to add

F:    Documentation/filesystems/exfat.rst

in MAINTAINERS

Well, it's ain't much but it's a good start.

Davo
