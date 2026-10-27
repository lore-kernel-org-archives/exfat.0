Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069548;
	b=LtC+oTq5U0O1Yhb2PM2E5Y+hBMs+WpXnOaGZYPeWxbkWvy3m2L/z6X0i9LtDH7fSWC4C
	 /JYNXazcV4vL9y+1/ZxWxfzHJuIKBWCYhNkV7gP1+cIo7dKg/UpqXhda6y7PlOyB1cRvj
	 wYVlmL+pi+9PI7eeSq5HM05As7nQVCmxzpZhAv8citroDdaFZEHKstTuNNvkCOBH81TCJ
	 lIINOjII++oeFfFrw+NDhGlz9njfZpTFyZkaZj38+NwImfzpH72Ycrrafk4pHz9zcBbzz
	 B2VM9UhjbIrqJyTWHhU8IXzOKyO26z5ylhCNwiWoIEhKSS4vaO9dCMXBCBrFY/D+SVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069548;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0Ogm5YaQZBK2OaH2w2NK1mU249C95xBF2GkZFVSaQrQ=;
	b=dcS2kulVzaiHBBPzZtxPfnSVhUtSR+IoaWEao1rnvahCNLSnfWj0qfeo49HCok3VeBGv
	 vRlghbTbQRzaXuLltWpVc7hsJ0Zkeohk5BbdFrcBGcmrRRhzvEx7ST6NXussoYRPvN6lJ
	 Q4UbTyjSlun+WTshyci7kHl99AzcO29TZs+AeUuyCubInaBNnrxgjOCMck2EUp63s+iH/
	 ZkSdXMP/aWB2rDBG5eMRGZitzIkt0sk4VtMgpOV5UWIKOZZtCfFyarQDlZqGDKTpek92y
	 Fs0AQA5tPQ7Iwmh20VpgonhKDsjrawxYKBzR32i2n7AbHkoM4ZJ0M/dbDbkTwgw9poQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=puIB03r1;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75955606A31A
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 02:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75955606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=puIB03r1
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 746081D485;
	Tue, 27 Oct 2026 02:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 746081D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793069539; bh=0Ogm5YaQZBK2OaH2w2NK1mU249C95xBF2GkZFVSaQrQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=puIB03r1CyzJkts/Bn3OGC6W2FevoBbiwRgG4oGbOnBxh54WFxW10govIhHCA+U+X
	 jPkj6mS+Eai4/oEuiEmGcs/nrfoocyUSA9taMycjwWgOcwRmNMsMI4b4lUTAH6QkJP
	 JxccCJPEUtalQTR9dbnXFkEzjmKaXREuiPBG4piw=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id OfFsAOIR4GrXXAEA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Tue, 27 Oct 2026 02:52:18 +0000
Message-ID: <e1d8a49e-8108-4331-8f4d-36c1c122ce4e@dev.snart.me>
Date: Tue, 27 Oct 2026 02:52:14 +0000
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
Subject: Re: [PATCH] libexfat: restore the original DIV_ROUND_UP type
To: Namjae Jeon <linkinjeon@kernel.org>, Yang Wen <anmuxixixi@gmail.com>
Cc: hyc.lee@gmail.com, yuezhang.mo@sony.com, exfat@lists.linux.dev
References: <20261024134342.2243235-1-anmuxixixi@gmail.com>
 <CAKYAXd_AAjF89KQkS2X1WrJSxnAD-ap-hkpjV5DGxuF+XzbUUQ@mail.gmail.com>
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
In-Reply-To: <CAKYAXd_AAjF89KQkS2X1WrJSxnAD-ap-hkpjV5DGxuF+XzbUUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/27/26 02:48, Namjae Jeon wrote:
> On Sat, Oct 24, 2026 at 10:44 PM Yang Wen <anmuxixixi@gmail.com> wrote:
>> Casting the first argument of DIV_ROUND_UP() to uint64_t changes the
>> result type for every caller and causes a signedness warning in fsck.
>>
>> The malformed boot-sector arithmetic is protected by the validation
>> added in the same commit, so restore the original type-preserving macro.
>>
>> Fixes: 69a8482f3492 ("fsck: prevent overflows from invalid clu_count and vol_length")
>> Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
> I will apply an attached patch instead of this patch. Can you check it?
> Thanks!
Hi, all.

Github recently bumped the "ubuntu-latest" runner to 26.04. The CI isn't
working at the moment because of some missing packages. I'm working on
it because I also have some patches to send through.

Davo
