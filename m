Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837990;
	b=Ykr0ZuIUS3hiAyQEZMzm4wK947SMRG6fFJOIVIW/EGXswGScxQAuLC0dQrTDbZ5whNsh
	 L1d2vcpl4VdNvRXI/hNW9HNF7AjcYzunk+gNUgMCPRgT9EZADugNNUtJiWU6okNXn5F9d
	 kuH1JdCSulkgTVaTiu2MwXVvjVO1pidcxZS1iJ5sK4OvIBH9YB9j9WaBHwZeNXtpK4QR8
	 h+RaddRTtpnrjvxTMBDPOjKW0wg/Dec28bEi61G5QXEQGaoo0CNE1/d2RakQaiiKSDp94
	 zJY4bzojSYSvEHd2uMlA6pHiFBP32j7ATgBGMloZwCPpB1PT1l6eXYGQT/yeeAaHrFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837990;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rY4mLXFI6UzYQYs5eGPL8M8Zipq277F+0UWdpW7DxIs=;
	b=MLG35urKoAomyBxehKdC5TfEYuLZGGFNUI2hA5Cfb4DX1NtWH2643oItijTXTSzoxaqv
	 ywFJq8PS72upouysRBJKcThIfUirT98ciocOgAulN+EkNMtLo1REHjK2ge49xyudi+OuC
	 REgWZfXiIUk+yed3wdXmOSSselVSnx8BFyNimMffD1Sl7h7fUUx2O+t/E27aSwE0lSLh0
	 7Om9BLXtAv2z/eKMkEXp9YVFqfsxyn7wzAxp5KWGK2r8UVtGKkFGoZReBmbcbPz6jSOx3
	 vAvk6tAdKgXHsKtfVbhCx4+U2QOT9gmGbUNdmBDEmRLS4trP9W1xJdRXpDTa0Oj/oWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=BFekM73e;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14179606A31A
	for <exfat@lists.linux.dev>; Sat, 24 Oct 2026 10:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14179606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=BFekM73e
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id E23C31D485;
	Sat, 24 Oct 2026 10:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me E23C31D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1792837988; bh=rY4mLXFI6UzYQYs5eGPL8M8Zipq277F+0UWdpW7DxIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BFekM73eBCJzQr4/tcdUdgh8iqMUpzNFAx2OyPzB5J9RVWOAErRTQfNr+aXMbRokr
	 gM0M73xNWhvfgegXjRXkLOfRj8rOflbQyufWM1r+ke2YtbbWMqFrUVRYVt2iLvnNiO
	 SikExI2y37rTXLtZ0g3PuZMfKWWPDwzKxu8yW9M8=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id bcb9GmKJ3GpycgAA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Sat, 24 Oct 2026 10:33:06 +0000
Message-ID: <e2c1e8a3-a87c-4def-bd20-00ff8ce61c35@dev.snart.me>
Date: Sat, 24 Oct 2026 10:33:04 +0000
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
Subject: Re: [PATCH] fsck: prevent overflows from invalid clu_count and
 vol_length
To: Yang Wen <anmuxixixi@gmail.com>, hyc.lee@gmail.com
Cc: dvander@google.com, exfat@lists.linux.dev, linkinjeon@kernel.org,
 yuezhang.mo@sony.com
References: <CANFS6baqmmov6nPMKkw6T1QgtYdT0o1=VFw4nb3-e=spn5SAqw@mail.gmail.com>
 <20261008145239.1949779-1-anmuxixixi@gmail.com>
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
In-Reply-To: <20261008145239.1949779-1-anmuxixixi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 14:52, Yang Wen wrote:
> This patch was taken from the official Android exfatprogs tree and was
> authored by David Anderson. We found it while reviewing recent Android
> CVE fixes and wanted to sync it upstream, so I would prefer to preserve
> the original patch and its authorship.
I wonder why they decided to silently patch Android without notifying
the upstream maintainers? Not very kind of them.

Davo
