Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED231286417
	for <exfat@lists.linux.dev>; Sat, 22 Aug 2026 02:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787365847; cv=none; b=tFyiAmOMpuE2okzXZmVayuTTkYtkFD8okYcXh/B6QpIZ9U1OAU7h4lcjRubMhmr2oPPRUaHJGv4Csv1glDDLIQoiRzTB1/mkuwbFFDLeXZgnpUDz5SxAd0TVxy0hoTd632lRhwoxxRHR4m4c6ZJuD74U8KuB1M9kdG9F4w/xfXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787365847; c=relaxed/simple;
	bh=j8JHyFxQ7Vog5IqVtfMSo3buMCt8Hmlpr3t28qMLY+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnv4JkSBqsFH8Ni58xjd2Acy3WOip/DWLYW8L55NY9Cc9su699qDMw9gStUtH3OKfbktR+102iv4ZqHXRG15knF/nXDNxl8x1LMeSL4u1XQsQHA0xS0F2IbhV/zry7/DU61BSyJxwt3PRTjryh7ylyTb6/1TspRCVbdEA3iOzv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=m8BALq6h; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="m8BALq6h"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id BAB6F1D455;
	Sat, 22 Aug 2026 02:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me BAB6F1D455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787365844; bh=j8JHyFxQ7Vog5IqVtfMSo3buMCt8Hmlpr3t28qMLY+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m8BALq6hQVeqmQRN2pXKYWtICcJVGZry+NuY2SbPngDy/PqxqLDLP2+FrtyhmoDoM
	 u6eRMGXBmBZspeIMkcB2KYASNhkQ2U1bmizz4xDiMMigtkNcNXR2rRehnAD9iXCTEN
	 yhQwpSJ9HT8EMU0HnSx0HQSFRZo9NAa1a4mzjZYs=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id d5n3GdMJiWqglAAA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Sat, 22 Aug 2026 02:30:43 +0000
Message-ID: <53914084-47c1-4d7d-8857-8eaaafd10269@dev.snart.me>
Date: Sat, 22 Aug 2026 11:30:40 +0900
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Github Actions: cache util-linux tarball
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev
References: <20260821103821.52224-1-dxdt@dev.snart.me>
 <20260821103821.52224-2-dxdt@dev.snart.me>
 <CAKYAXd-_=zmvBtV4HEmF3pADx=joEhiyCgAw_e2m_oGQnNhGAA@mail.gmail.com>
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
In-Reply-To: <CAKYAXd-_=zmvBtV4HEmF3pADx=joEhiyCgAw_e2m_oGQnNhGAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/22/26 09:36, Namjae Jeon wrote:
> On Fri, Aug 21, 2026 at 7:38 PM David Timber <dxdt@dev.snart.me> wrote:
>> To minimise the chance of CI pipeline run failures, cache the util-linux
>> tarball in Github Actions cache so that the tarball is not downloaded
>> every time the CI is run.
>>
>> The connection to the CDN usually fail because:
>>
>>   - Cloud VMs usually have low IP reputation due to scraping activities
>>   - Shared tenancy makes the connection unstable
>>
>> Signed-off-by: David Timber <dxdt@dev.snart.me>
>> ---
>>  .github/workflows/c-cpp.yml | 22 ++++++++++++++++++++--
>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-cpp.yml
>> index d332f04..10975b7 100644
>> --- a/.github/workflows/c-cpp.yml
>> +++ b/.github/workflows/c-cpp.yml
>> @@ -33,6 +33,7 @@ env:
>>      1T 2T 3T 4T 6T 8T 16T 32T 44T 64T
>>    TEST_MAGIC: dd01aeee-bab0-babe-babe-deadcafebeef
>>
>> +  UTIL_LINUX_TARBALL: util-linux-2.42.tar.xz
>>    UTIL_LINUX_SRC: https://www.kernel.org/pub/linux/utils/util-linux/v2.42/util-linux-2.42.tar.xz
>>    # xfstests generic/740 equiv
>>    FOREIGN_FS: |
>> @@ -188,12 +189,29 @@ jobs:
>>          sudo apt-get install -y linux-modules-extra-$(uname -r)
>>          export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
>>          export PATH=/usr/local/lib:$PATH
>> +
>> +    - name: Retrieve util-linux tarball from cache
>> +      uses: actions/cache/restore@v6
>> +      id: restore-util-linux-tarball
>> +      with:
>> +        path: ${{ env.UTIL_LINUX_TARBALL }}
>> +        key: tarball-${{ env.UTIL_LINUX_TARBALL }}
>> +    - name: Download util-linux tarball
>> +      if: steps.restore-util-linux-tarball.outputs.cache-hit != 'true'
>> +      run: curl -L -o "$UTIL_LINUX_TARBALL" "$UTIL_LINUX_SRC"
>> +    - name: Save util-linux tarball from cache
>> +      uses: actions/cache/save@v6
>> +      if: steps.restore-util-linux-tarball.outputs.cache-hit != 'true'
>> +      with:
>> +        path: ${{ env.UTIL_LINUX_TARBALL }}
>> +        key: tarball-${{ env.UTIL_LINUX_TARBALL }}
>> +
First off, this is AI report? If so, could you please come clean and say
that the review is AI-assisted? I'm starting to get tired of all the
pedanticity the LLM is throwing at me.

> There is one ordering problem. The cache and download steps run before
> actions/checkout. Since the tarball is stored in the workspace,
> actions/checkout may clean the workspace and delete it. The later tar
> xf command will then fail because the tarball is gone. I am wondering
> if this patch works as intended. Should we move the checkout step
> before the cache steps?
No, there isn't. This is just wrong. libblkid is untared and installed
to the runner system before checking out. This report is invalid. I
attached the links in the cover letter to prove that I tested this
patch(if the reviewer model had access to the links and actually visited
them, I think Claude is smart enough to realise its wrong take). The
runs didn't fail and the first run cached the tarball and the second run
hit the cache and the curl step is skipped.

>
> Also, please add --fail to curl:
>
>  curl --fail --location --retry 3 \
>       -o "$UTIL_LINUX_TARBALL" "$UTIL_LINUX_SRC"
>
> Without --fail, an HTTP error such as 404 or 500 may still produce a
> successful curl exit status, and the error response could be saved and
> cached as the tarball.
>
No. This doesn't really fix any real issue. Once the tarball is cached,
the step will probably never be called ever again for the
org(exfatprogs), unless it's forked elsewhere or more than 10GB of cache
is used in which case the tarball got evicted.

If the CDN is in a such condition that it returns 5xx errors,
immediately retrying the request wouldn't make any difference. The
failure mode we were experiencing was at the L4 level(TCP connection
dropping out or SYN being dropped), probably either due to the WAF at
the CDN end or the Azure VM network being saturated. There is not much
we can do for the first cache miss run.

Davo
