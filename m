Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9916645A2AE
	for <exfat@lists.linux.dev>; Tue,  1 Sep 2026 07:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247677; cv=none; b=YUEhR0vgC5L1vnixwWfbJ+Ch1Q0t2w5mZfESXSitYMwBo4vMiS2TCQwC3uhAUmyvCn4198MBk7XUMqnDqITNbce5c+8B0fabzeahYkQKAvLYc8VWH1+nKVDYOrhptj1uQobfBvo9uT+WmICSpYirvwguM72K7cnvkKQHwq1yuSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247677; c=relaxed/simple;
	bh=BSafSt5xgqGVmVxx4a/aY+5DJ2PgzqlUQOnH9Av0O9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HfDBNrT8hiMdhUPSXAtuULJMl/BLbqzWFvGsB997NahwzzLHnJBR/JFDipYppa/ljxoGY81zbRwtEBrGL6I3hctZ6oM7jsUvRQf85QWQIulvrEJrrvf6zaSoCBTKJdn9mMywgaxGcen58d2u2Yg0KLCEI0XLG3lSFnu3z3ldX/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=sKGJn2HB; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="sKGJn2HB"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 9E1671D452;
	Tue,  1 Sep 2026 07:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 9E1671D452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788247673; bh=BSafSt5xgqGVmVxx4a/aY+5DJ2PgzqlUQOnH9Av0O9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sKGJn2HBelERHTQNNrFsCmAVwIa5UaF9kWlYY3+DnInTMd/OPGseh3ROyTADACdwp
	 wViST5GsxpZC3pIV/yhHAQ7Sj2QShK4u7kNrzVyjT6nETAjDhTJZtgY+lAACbRJ+UG
	 8NGdoa1ZW7F8uJj7ec1g3+qlPU+Hy3CzAaWYn9ng=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id x4gFE3h+lmpl9AMA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Tue, 01 Sep 2026 07:27:52 +0000
Message-ID: <185d0ab8-c93a-4aef-9355-cb6e96f6b27b@dev.snart.me>
Date: Tue, 1 Sep 2026 07:27:51 +0000
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] exfat: doc: add documentation
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev,
 anmuxixixi@gmail.com, chizhiling@kylinos.cn, linux-kernel@vger.kernel.org
References: <20260831105330.10449-1-linkinjeon@kernel.org>
 <c52c7fbb-b816-497e-b856-ea9a7dd3b38a@dev.snart.me>
 <CAKYAXd8=dotQ1QcyUqvv=6=fUwq8M-DafAs0fB=2QOKGfuBE4w@mail.gmail.com>
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
In-Reply-To: <CAKYAXd8=dotQ1QcyUqvv=6=fUwq8M-DafAs0fB=2QOKGfuBE4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/1/26 06:48, Namjae Jeon wrote:
> On Tue, Sep 1, 2026 at 3:24 PM David Timber <dxdt@dev.snart.me> wrote:
>> On 8/31/26 10:53, Namjae Jeon wrote:
>>> Add documentation for the Linux exFAT filesystem driver, including
>>> supported mount options and exfatprogs.
>>>
>>> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
>>> ---
>>>  Documentation/filesystems/exfat.rst | 117 ++++++++++++++++++++++++++++
>>>  Documentation/filesystems/index.rst |   1 +
>>>  2 files changed, 118 insertions(+)
>>>  create mode 100644 Documentation/filesystems/exfat.rst
>> Don't forget to add
>>
>> F:    Documentation/filesystems/exfat.rst
>>
>> in MAINTAINERS
>>
>> Well, it's ain't much but it's a good start.
> Sure, will do. Thanks for pointing it out:)
Oh, also, if this gets merged, it's worth updating the man page mount(8)
of util-linux as well.

I'll cc you when I do, but anyone else snooping this conversation can
beat me to it.

Davo
