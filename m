Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771729;
	b=Dy8NEr+zCPAkSAQHy5FScPNNYvmUbbknMUKQfXk5bAHM8DrNglW6QodZAg4bDRjlF+h5
	 itcrWphCjczaw/RpyGTcO8cguZFXKcui3piJl/GOwaUaCNm6zRy01Vz/4J/vQwUaLGIXU
	 qy+Z/2AXileEtz+lmj3Soxz2BC2yFoW5pVFgvxmfLJUhfod8cW3NdFOse5yCFUZNTSuX5
	 3OakHHwtkaBgaXQhxZqOHCVtajPgzt4ze2BY55beVjUgAMKICIylKkCE7zi4kDdmcexBq
	 vnXdABOytkg2YzBGI5xNa5jFsXeeFn4Eq4pmXX/6U9OoAQwg6CAo3HWCHeUSmycJ0/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771729;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MjmnVss0Svk+adVAV7+iIJa9/qM/sXIRVDxJzToCo9o=;
	b=Nk05dG45fVByb0YwG12f8Ub5hhZ+93A2hFHuTpFmalpO6SeYOzIG4Y8cmD/taJGg2bsO
	 kLr2Ypxh598f8OrqBZwV6LLRimfnNEfpKoHR1BqZC3yimJFS9C8R/5mzpMyzDuAg56kcr
	 Nnzvx9LZV9ux563ISfzsIHeNwX4ltEgkdj8CeD+CPfGIyvwkcNMj3jrjGlEKkdLhnwilD
	 4VkvrtB3gdPn8BZrXSrk47kau1g0r26fJiVXlelDlzU5FDjOY6e4ShbUOocBkXZRfoht0
	 IDXehK6tlvABrsb3TaXeTu0ZpWAO1bwYUAnsR6+EngaTO6mV3vgg9cxgzJqRv80IO4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=MZDjEpIE;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03DA606A31C
	for <exfat@lists.linux.dev>; Fri, 27 Nov 2026 09:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B03DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=MZDjEpIE
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 963321D4A2;
	Fri, 27 Nov 2026 09:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 963321D4A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1795771726; bh=f0GpQg6Txo5TipoNDnyagF0DG9ePPOe22vQB9jq5XOg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=MZDjEpIE8epvPmYAx+rCmnA1J99hHDe123D91TOotcUaCds1x+iPvvPgKFw/Wii61
	 XytMMfkhmIn5+h7cvy1jqcusmTLotf3EIMpj5Eu7SiUD2sb/zA5PjQOMpON8eOAx+e
	 fBwF+9r1jMl2oQuLJ3bdZEEkPNgLb3BEomEBVhXk=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id gtazCE1NCWtMLgMA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Fri, 27 Nov 2026 09:28:45 +0000
Message-ID: <c08193a0-6488-40af-8bed-ba81e016695f@dev.snart.me>
Date: Fri, 27 Nov 2026 09:28:43 +0000
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fsck: detect case-insensitive duplicate filenames
From: David Timber <dxdt@dev.snart.me>
To: Yang Wen <anmuxixixi@gmail.com>, linkinjeon@kernel.org, hyc.lee@gmail.com
Cc: yuezhang.mo@sony.com, exfat@lists.linux.dev
References: <20261126150920.2761243-1-anmuxixixi@gmail.com>
 <5a004aad-3d7d-4d3f-8a2c-85b6b6ce5573@dev.snart.me>
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
In-Reply-To: <5a004aad-3d7d-4d3f-8a2c-85b6b6ce5573@dev.snart.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

G'day everyone!

On 11/27/26 08:46, David Timber wrote:
> On 11/26/26 15:09, Yang Wen wrote:
>> exFAT file names are case-insensitive, but filter_lookup_file() compares
>> them with memcmp().  This makes fsck miss duplicate names that differ only
>> in case.
>>
>> Keep memcmp() as the fast path and fall back to the volume upcase table.
>> Add a regression image for case-insensitive duplicate names.
> Wait. Hold up.
>
> What does the spec say? Does CHKDSK.EXE fix this? Have you checked? If
> not, we shouldn't either.
>
> Let me check and report back.
Oooookay. Checked the image on Win XP and the latest build.

The first thing I noticed that all versions of CHKDSK.EXE do treat the
condition as an error and fix it. EXFAT.sys, however, doesn't seem to
mind, although the WinAPI will probably open one of the dupes and all
the other files are practicall unreachable(see my comments in
https://github.com/exfatprogs/exfatprogs/issues/313). So, not so
critical but worth fixing to match with the CHKDSK.EXE implementation.

Tested-by: David Timber <dxdt@dev.snart.me>

I see no problem with your patch.

However, unrelated to this issue, I've found that fsck.exfat renames the
files to the ones incomprehensible to human! If run with `fsck.exfat
-a`(by initd via fstab), it randomly generates the new file
names("/FILE0000001.CHK"), completely destroying the information! See:

exfat_repair_rename_ask() -> generate_rename()

The Windows implementation renames the files by appending -1 and -2. So,
the files in the test image becomes ...

/Duplicated-filename-test-1
/dUplicated-filename-test-2

after running CHKDSK.EXE. If the file name is over 255 characters? idk.
It will probably have to write over the characters at the end.

Anyhow, I think that fsck.exfat is destroying information. I think that
it needs to be fixed. generate_rename() should be used only for rescuing
orphan clusters. I'll open up a GH issue and get back to this later.

Davo
