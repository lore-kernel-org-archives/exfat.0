Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793249483;
	b=Ws6Mn8XFqhI3Um8Dgxa3U7qxoMchKWofGBFOeLdBqyG9KFXEmRTtC/4oo8iAXNmn4FcX
	 qXuPfM6kTOksrxvxDtk+IByBffgGrOtIvRIPD6hppaxNmp6jTnGe7vYHJV5Kn+GjZOSRJ
	 Bv51GiQQSpcPn7bmNPfslot+cFFVMhTjJyQ3DFY2De9Eez42w0H5TA6l4VsqtfPe2jC8y
	 53y1Z+LMhAW9YzJne03L4NrQU3Oo+M5O8Y3JQQWBrx8e15O6C5VTFeL6w3qmpZIv4HzzD
	 5LdAFtknjqqORCD+Qfs2R5DbZ0p26UZw1HatxEkdYad4ORW82uXF3zvo8GaKVuaWLpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793249483;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vgueFsITlweb3Le4oIgwsFk61A9aKEVj4SanxhlYxwg=;
	b=o/h8R1MiZiFTOMomTR6MD3jDE1bUpWBFp6jQQip/2nTrfJQzU9Si7dGHfcof/tjWYRWD
	 c/fwoYbdZPKwoqdHEpBA0KHkejuIkgjI7+eA+OWRSvryooopoe7uO0HvTt6HfLBnWWWe+
	 rdepng82lnm4DJaHSZWKbvVKE00w73eFjePWEqAu1kLaIU8ckI6bTjbEzAMQUPo0IBBNp
	 oMp7ZlveBHEPblORLbCSjmJTSeYk6HEIR2LjHVQhUfWzkbdr9CL93TJIeCkpTAo8aLMz8
	 PdIbNtYzb8qaatkpssPRj+JT+zKPBN98Chswb9GVotzBVx7t2hErJ7IuDuttlOTxNXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=WoSl2bzu;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BA8606A31C
	for <exfat@lists.linux.dev>; Thu, 29 Oct 2026 04:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68BA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=WoSl2bzu
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id ECB9D1D485;
	Thu, 29 Oct 2026 04:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me ECB9D1D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793249481; bh=06sKckXPmXdEfFn3pr+pFzvbE6+uTUnMQKHWbi5GTnI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WoSl2bzu7xss5PAVySqfPrl+Cz9xLqa+pJUg2kBdbkVRkvjIeP3rJt4yXemno7Pmy
	 jF7arsSNW0QftHa0AO/jMAtQYemsn3L594onj3gQuPi2foU966o3+6rorHaroXVqUk
	 WRwRol2NKsVc47R0xaJDiwAvf/m7mfoHH1+96FiM=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id tr9aJsjQ4mrqFQIA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Thu, 29 Oct 2026 04:51:20 +0000
Message-ID: <d2d2ae42-01c2-4898-bf00-ea577fe07cea@dev.snart.me>
Date: Thu, 29 Oct 2026 04:51:16 +0000
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
Subject: Re: [PATCH 3/7] fsck: fix missing line ending in error messages
To: Yang Wen <anmuxixixi@gmail.com>
Cc: exfat@lists.linux.dev, hyc.lee@gmail.com, linkinjeon@kernel.org
References: <20261027080628.82069-3-dxdt@dev.snart.me>
 <20261028140437.2287517-1-anmuxixixi@gmail.com>
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
In-Reply-To: <20261028140437.2287517-1-anmuxixixi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 14:04, Yang Wen wrote:
>>  		exfat_bitmap_set(exfat->alloc_bitmap, clus);
>>  
>>  		if (exfat_get_inode_next_clus(exfat, node, clus, &next)) {
>> -			exfat_err("ERROR: failed to read the fat entry of root");
>> +			exfat_err("ERROR: failed to read the fat entry of root\n");
>>  			goto out_trunc;
>>  		}
>>  
>> @@ -1790,7 +1790,7 @@ static int rescue_orphan_clusters(struct exfat_fsck *fsck)
>>  	/* build a template dentry set */
>>  	err = exfat_build_file_dentry_set(exfat, name, 0, &dset, &dcount);
>>  	if (err) {
>> -		exfat_err("failed to create a temporary file in LOST+FOUNDn");
>> +		exfat_err("failed to create a temporary file in LOST+FOUND\n");
>>  		goto out;
>>  	}
>>  	dset[1].dentry.stream.flags |= EXFAT_SF_CONTIGUOUS;
> Hi David,
>
> I found two more error messages that are missing a trailing newline:
>
>   defrag/defrag.c:
>   exfat_err("memory run out in %s", __func__);
>
>   lib/libexfat.c:
>   exfat_err("ERROR: failed to read the fat entry of root");
>
> Thanks.
ACK
