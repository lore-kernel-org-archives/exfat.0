Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09A13EC808
	for <exfat@lists.linux.dev>; Wed,  2 Sep 2026 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340253; cv=none; b=pa09Y9DKfp5KomgqNBDifePbt5fEL7s0hkk33d/XJIienG0aaikfRjnq2tqv2WlZSD2kGd9phrPImf+7b2uqeq23/JwAiUNKStN0YQXHMB0hzwfSkpuB6IQX8niB9tVh//sC5QXZU+jvVy46FKTxHHJLGIs1948ytutNeev5pV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340253; c=relaxed/simple;
	bh=HxvrRZqhs9CxMJJbbwb/SgRmlUJgB7y7wVn4yL3Y2zc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fyW7UXp1slujeH2BAym/t2emhFiC8Y3/ulaYJg9j8Xf+9b1D773BuH+DuNxpBTVgvqP5YoeQmKy8d8XRnF1uv5a4le0paxv+vZ6XjdQUPFW8vMzEbT5Oa1oVXKdUGBlEZUiJmUKljOd3Nswe4Inc2tiHS23snyxUAbRsnprd0nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=K5fl2/Vi; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="K5fl2/Vi"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 830A81D454;
	Wed,  2 Sep 2026 09:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 830A81D454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788340250; bh=HxvrRZqhs9CxMJJbbwb/SgRmlUJgB7y7wVn4yL3Y2zc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=K5fl2/ViEswRHV/E8hJO9QyNJLZF2/UGS+Ow2XNRHOjlluMf+LLT+Bd24YflE484Y
	 B0Kr8NytBsZMrdDIaq9+8E5ov44N12jqYCx0WYAW2WOFQ0qqY+pGIQcYszrGkX/qH6
	 QFBUhSsNK/L/yTeHp/A2piF/qIKr7T042qs7XCP4=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id 6rpHDhnol2qVWAQA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Wed, 02 Sep 2026 09:10:49 +0000
Message-ID: <a08eca6d-ab9b-4519-b98f-771652457787@dev.snart.me>
Date: Wed, 2 Sep 2026 09:10:48 +0000
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Timber <dxdt@dev.snart.me>
Subject: Re: [PATCH 2/2] dump: show all fields of exFAT volume header
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, exfat@lists.linux.dev
References: <20260901084219.39898-1-dxdt@dev.snart.me>
 <20260901084219.39898-2-dxdt@dev.snart.me>
 <CANFS6bavXevwFWOh3rWiQ3wFXN+=cbBB5B=UTze-xqQFBP6hgQ@mail.gmail.com>
 <680a31ae-d9b1-415a-91b5-0f93a5f27368@dev.snart.me>
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
In-Reply-To: <680a31ae-d9b1-415a-91b5-0f93a5f27368@dev.snart.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/2/26 08:45, David Timber wrote:
> On 9/2/26 01:06, Hyunchul Lee wrote:
> [...]
>> I'm a bit concerned that adding this in the middle of
>> the existing output might break programs that
>> parse dump.exfat output.
>>
>> However, I think that they will parse it line by line.
> That crossed my mind as well and that is my assumption too.
>
> I thought about adding the -v option and printing the extra fields with
> the increased verbosity. Other than the volume flags(especially
> MEDIA_FAILURE - this is a big one) which has legitimate use cases, the
> other boilerplate fields are not really that useful. I think that's why
> the original author(s) didn't bother printing all the fields.
>
> I still don't know if we should add -v or not.
>
>>>         dump_field("Cluster Heap Offset (sector offset)", "%u", clu_offset);
>>>         dump_field("Cluster Count", "%u", total_clus);
>>>         dump_field("Root Cluster (cluster offset)", "%u", root_clu);
>>>         dump_field("Volume Serial", "0x%x", le32_to_cpu(pbsx->vol_serial));
>>> +       dump_field("Version", "%02x%02x", pbsx->fs_version[0], pbsx->fs_version[1]);
>>> +       dump_field("Volume Flags", "%s%04x", vol_flags_str, vol_flags & VOL_RESERVED);
>>>         dump_field("Bytes per Sector", "%u", 1 << pbsx->sect_size_bits);
>>>         dump_field("Sectors per Cluster", "%u", 1 << pbsx->sect_per_clus_bits);
>>> +       dump_field("Number of FATs", "%u", pbsx->num_fats);
>>> +       dump_field("Drive Select (advisory)", "%02x", pbsx->phy_drv_no);
>>> +       dump_field("Percent in Use (advisory)", "%u", pbsx->perc_in_use);
>> How about printing "unknown" if perc_in_use is 0xff?
> Yeah. That was dumb. I'll change it to something like this. Interpreted
> decimal value if in range, raw hex value otherwise:
>
>     #define PERC_IN_USE_STR 13
>     char perc_in_use[PERC_IN_USE_STR];
>
>     perc_in_use[0] = 0;
>
>     if (0 <= x && x <= 100)
>         snprintf(..., "%u", x);
>     else
>         snprintf(..., "unknown (%02x)", x);
>
>
> Davo
Oh, no. The Linux kernel exfat driver doesn't set it at all so it's
always stuck at 0. mkfs.exfat doesn't properly set it either. I think
mkfs.exfat should set it to 0xFF if it doesn't bother setting it properly.

Will follow up.

Davo
