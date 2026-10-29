Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250732;
	b=JMlFrjRI7Bo5/8wSIGJMB96/D9r8x/hXXDb/xtRby0Gr0t7nsH10V8rgo/bC56+d/Y0i
	 icg4fRl8TU7wwbyNNMUHYW5a7uIas4lqm/dNXwuo0A9qmyE/ycsJwMWvb9HGkFswmgj3B
	 ECxhellAnXkCna5QqbvfrnETdBTFQ5WXNnudOlBR7rm0H25QPDDkA0z6arggdxzQlW50S
	 UeEyUnFj1vBYoIhbENhYetuJnu0ieUVFV9FrHZhSNfzVHULdg7LQ1d4PbtRPW6E6aNTJF
	 mBuJp2oeqMODG/OU2M2gGfi/CAXZL71kpkc4hHr+Lmmv3KE501KmD7L0ZfUnNH5H5Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250732;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Momkll2VWmLhSIfGOtkp9Q3CXqNA1W62RfFPcgI7yvw=;
	b=u9gmUzIcBZQSFRSQx0vnxR7F5zhGbvK5rnipvxurFcBlkUqcOGeoi1twfIuhHNTnL+8d
	 BnTQLOVW9NZXUVBv/crh57OVPbUmLWaxtgiSMuTuPS6VpAJIS+NfJjY0O8Ecvn+oTwrUW
	 kEUFAzH3slrVGQ96Mq6NatHiOt55v6/qpsgVH0T6/CZK6rdIoPauTPOq1bHRwXE1PRdXM
	 ooelcnC433LfDEFewBGajUY41a+UxmbWPkzlUGSlOvBEzw2oOagiYheNh8zQz2pQjRZEW
	 TENTFBr4gV3FzONzLLA2wHXH/s8hv2LbGllIqwao4U1A9Zo6h/cwFZGbt16v5VUswfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=saznCypD;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EB5606A31A
	for <exfat@lists.linux.dev>; Thu, 29 Oct 2026 05:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47EB5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=saznCypD
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id DC17D1D485;
	Thu, 29 Oct 2026 05:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me DC17D1D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793250730; bh=Zb4s/bgPl5ZzVCY2Vhw0g7UjUkeVjDzKoBQSwQWYaT0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=saznCypDduXEzI6lmo8VLqR0ub3TP5rrv8Itb9gIf8w3ZCPj7NwyiSlEZWGTlAsOn
	 pyPbChd8hNXwRWZmUmJhA+cQIqStxJnSZ8RLwMHt1KUAHpL0dBKJe5ikUJeXdas/EM
	 C2OYh7wtAqCOEmG2lmTgeSjqz1s2b3ex00Kk+SwA=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id dEUuIqnV4mo7FwIA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Thu, 29 Oct 2026 05:12:09 +0000
Message-ID: <25145a8a-3138-4948-b609-b0f7726c8596@dev.snart.me>
Date: Thu, 29 Oct 2026 05:12:08 +0000
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
Subject: Re: [PATCH 5/7] fsck: add test script for EIO handling
To: Yang Wen <anmuxixixi@gmail.com>
Cc: exfat@lists.linux.dev, hyc.lee@gmail.com, linkinjeon@kernel.org,
 sofine.ljm@gmail.com
References: <20261027080628.82069-5-dxdt@dev.snart.me>
 <20261028145725.2311237-1-anmuxixixi@gmail.com>
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
In-Reply-To: <20261028145725.2311237-1-anmuxixixi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 14:57, Yang Wen wrote:
> Hi David,
Hi, Yang.

Thanks for reviewing. I really appreciate that someone is actually
taking time to review the patches of exfatprogs, which is often not
looked at. The review does seems a bit LLM-like, but if you've done the
work yourself, good work!

The added script is more of a proof of work than a practical one, just
to absolutely make sure that fsck.exfat does not modify an innocent
error-free exfat volume just because the hardware is faulty. That was
the whole point of it.
> I tested this script on Ubuntu 22.04 and found a few portability and
> prerequisite issues.
>
> First, the script failed immediately after creating the loop device:
>
>     Mapped file /tmp/tmp.WUyy32nDsS as /dev/loop6.
>     Error looking up object for device /dev/disk/by-loop-inode/?d:?d-661642
>
> The problem is this line:
>
>> +declare -r LOOP="/dev/disk/by-loop-inode/$(stat -c '%Hd:%Ld-%i' "$IMG_FILE")"
> The %Hd and %Ld stat format directives were introduced in GNU coreutils
> 9.0.  Ubuntu 22.04 has coreutils 8.32, with which the command produces
> "?d:?d-<inode>".  The loop device itself is created successfully, but
> the script passes a nonexistent path to udisksctl.
>
> Could we avoid that coreutils version dependency by looking up the loop
> device after udisksctl creates it?  For example:
>
>     LOOP=""
>     ...
>     udisksctl loop-setup --file "$IMG_FILE"
>     ec=$?
>     if [ "$ec" -ne 0 ]; then
>             exit "$ec"
>     fi
>
>     LOOP="$(losetup -j "$IMG_FILE" --noheadings --output NAME |
>             head -n 1 | tr -d '[:space:]')"
>     if [ -z "$LOOP" ] || [ ! -b "$LOOP" ]; then
>             echo "FAIL: cannot find loop device for $IMG_FILE" >&2
>             exit 1
>     fi
>     declare -r LOOP
>
> This also avoids depending on the /dev/disk/by-loop-inode symlink and
> uses the loop device that was actually created.
>
> After working around that issue, the hash command failed as well:
>
>     RHash: unknown option: --one-hash
>
> The installed version is RHash 1.4.2.  It supports CRC32C, but does not
> support --one-hash.  More importantly, the failure is hidden by the
> command substitution assigned through declare, so HASH becomes empty.
> The next hash calculation also produces an empty string and the test
> incorrectly treats the two failed calculations as matching hashes.
>
> This form works with RHash 1.4.2 and produces only the CRC32C value:
>
>     dd status=none if="$1" skip=1 |
>             rhash --printf='%{crc32c}' -
>
> Also, -C selects CRC32 rather than CRC32C in RHash 1.4.2, despite the
> comment saying that CRC32C is used.
>
> Finally, the script later failed while creating the dm-dust mapping:
>
>     device-mapper: reload ioctl on dustexfatbads0 failed: Invalid argument
>     Command failed.
>
> The kernel log gives the actual reason:
>
>     device-mapper: table: dust: unknown target type
>
> On this system:
>
>     $ grep CONFIG_DM_DUST /boot/config-$(uname -r)
>     # CONFIG_DM_DUST is not set
>
>     $ modinfo dm_dust
>     modinfo: ERROR: Module dm_dust not found.
>
> dmsetup targets consequently does not list the dust target.  The script
> currently documents the root requirement, but not the CONFIG_DM_DUST
> requirement.  Could it check for the dust target before creating the
> image and print a clear error or skip result?  Doing the prerequisite
> checks before allocating, formatting and mounting the image would also
> avoid spending time populating the filesystem when the test cannot run.
>
> It would also be useful to install an EXIT/INT/TERM trap for cleanup.
> Each of the failures above leaves the loop device and temporary image
> files behind because cleanup is called only on the successful path.
>
> Thanks.
I realised that this is something that shouldn't be done with dm-dust,
let alone with a bash script. It just doesn't scale up. If we really
want to make a test suite that could fit into the CI, we should write a
special program for this. The general gist of it is ...

 1. do a fault injection in the program itself(debug #if ... #endif),
    just like f2fs kernel driver does its fault injection
 2. use O_TMPFILE(XFAIL if not supported) and mmap()+memcmp() to assert
    failure

eliminating the need to rely on external utils and the kernel module.
The program should be light and fast enough to run it in `make check`.
Heck, maybe just make it fs-agnostic and submit it to xfstests. Why not?
The kernel devs would actually appreciate such test case.

I just didn't feel like doing it. You(or anyone else snooping) are more
than welcome to vibe code send submit patches replacing my script.
idk............ Kinda don't want to do it for now. Maybe someday, when I
don't have too much on my plate.

Thanks,
Davo
