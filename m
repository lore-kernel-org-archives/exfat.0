Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2092A33F5BE
	for <exfat@lists.linux.dev>; Sat,  5 Sep 2026 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613870; cv=none; b=cbLT7I4547MoCUGx1f2A1SdWqE1pe+vYarMwcxPEVoMMDQBfWONLvh7DYWKtWUUJ1xKpEiGCZMBqjnOwTqHsk/O7Ht5/mTaX1njDnqibA+qXBfwyB4UQ12LhAdQFVugyjwAJoZFrPMZMitSLzhIlfRuZ6riYY3Gh8fS0C3LXGyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613870; c=relaxed/simple;
	bh=OzVm6T5YAbPJggXiDM1XPM2RIY844VEas07qOka2SdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQCUkAxwoxNIsVl3Iabr5Lq5ontd1m/ztEPRG88XaDUCqBuul80us3SMTpz+FUfg7FKibRAE+O0Ozf6YDYnD6eCgLoIddQFkKJK5EEDrA0XgMYgOsBX0e9PvqNZ0mFtkaVeYJpludJ63S0IPowA8FWivC7+qBVfx7Q+4yOql+M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=Y0pwdf37; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="Y0pwdf37"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 769BF1D452;
	Sat,  5 Sep 2026 13:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 769BF1D452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788613860; bh=OzVm6T5YAbPJggXiDM1XPM2RIY844VEas07qOka2SdU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y0pwdf37dZ+09mE0UEB/gy9ZtA9v4JWywHIEj1MsAJugw+h3rsDJEMw5cWX6BPBS5
	 GA1lUuD7jyWZ8xLuczv52Vek0/bXkO8v/fxOxBWTzjjw1IGaL6LeIe0X3iQNque8h7
	 1oiuDnXtu06+5AtUO2RHS+ve8dr3s64+MDAYL4sc=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id vq5pCuMUnGr8iwUA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Sat, 05 Sep 2026 13:10:59 +0000
Message-ID: <1c67ff24-d331-4e2a-9e18-fec41fd5c152@dev.snart.me>
Date: Sat, 5 Sep 2026 13:10:54 +0000
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0] exfat: update percent_in_use field when updating
 volume flags
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo
 <yuezhang.mo@sony.com>, exfat@lists.linux.dev,
 Hyunchul Lee <hyc.lee@gmail.com>
References: <20260902120143.7158-1-dxdt@dev.snart.me>
 <CAKYAXd__vL4=majhavWypYMR++v69SLv0jKH-+s2nXEW0Pd7Gg@mail.gmail.com>
 <f0ea97f3-db5d-4dad-9f96-45aa4401ef9e@dev.snart.me>
 <CAKYAXd8v2U6q6kzf1JFe1qbGT8T+mwdKfUKrJZS=fwL1CSPzow@mail.gmail.com>
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
In-Reply-To: <CAKYAXd8v2U6q6kzf1JFe1qbGT8T+mwdKfUKrJZS=fwL1CSPzow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/5/26 08:55, Namjae Jeon wrote:
> On Fri, Sep 4, 2026 at 8:25 AM David Timber <dxdt@dev.snart.me> wrote:
>> On 9/3/26 12:43, Namjae Jeon wrote:
>>> On Wed, Sep 2, 2026 at 9:02 PM David Timber <dxdt@dev.snart.me> wrote:
>>>> Currently, the exfat fs implementation does not modify the
>>>> percent_in_use in the boot sector header at all. Although the field is
>>>> only an advisory field for situations where bit counting is not
>>>> feasible, not updating the field at all can cause confusion if the
>>>> the value is actually exposed to the user.
>>>>
>>>> Calculate the value using integer arithmetic only when the dirty flag is
>>>> cleared. If the dirty flag is set, set to 0xFF.
>>>>
>>>> It is set to 0xFF when mounting under the assumption that the number of
>>>> used clusters will change - this is basically what is recommended in the
>>>> SD Association's specs.
>>>>
>>>> When clearing the dirty flag, if overridden by
>>>> sbi->vol_flags_persistent, set to 0xFF. This is intentional because if
>>>> there are orphan clusters, the calculated value would be incorrect and
>>>> correcting the fs error is fsck.exfat's job.
>>>>
>>>> Signed-off-by: David Timber <dxdt@dev.snart.me>
>>> Applied it to dev.
>>>
>>> Shouldn’t mkfs.exfat also initialize ->perc_in_use with the calculated
>>> value instead of leaving it at zero?
>> I've sent the patch. I've just changed it to 0xFF instead of zero.
> Please check a warning from kernel test robot.
> For now, I will remove this patch from the exfat dev queue.
There are several places where runtime division is used. I don't think
fs/exfat would build on RISC-V w/o integer division either.

mul_u64_u32_div() seems to be a good candidate for the fix. do_div() for
other places.

Will follow up.

Davo
