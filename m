Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183B7239085
	for <exfat@lists.linux.dev>; Thu, 20 Aug 2026 04:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787200549; cv=none; b=pyAGtiOWbk3Hv/1xZkTzzEjHsjl5cvrJxbgY2JPoOQd6SjkmFJlibBr6FH9kn/i01S9UlbwZPD799ebt/xpJqaRnt6J8PZK5MxKF8K/lnlPD9kPUl7/exKEmwUWvnpkX3BObb479n8azplF/HdrjggfEEmLx0qDxuIOgBF+KnIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787200549; c=relaxed/simple;
	bh=1lLcau8Es/ljx1WgmXopQYH5RUKLcLemzf/DN7QNMfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afbqczgcY1J6CW16BQK0kBYYIeNqzvwnbB9arsiQ7pzqcnPVv7xquC56GLX/0YwYNyolOYzmviwF6ENDE7XbFfhI7z+/82xOEFX7GV1a/mlU0DTzbe0UAIxzD2ZwtJMFScoC+pSXfnq/6pHoOeFlRq8IF0ejeH/bXeYjeE01yiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=pL0MsYtx; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="pL0MsYtx"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id AAD8B667AA;
	Thu, 20 Aug 2026 04:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me AAD8B667AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787200546; bh=1lLcau8Es/ljx1WgmXopQYH5RUKLcLemzf/DN7QNMfc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pL0MsYtxHwoGj8zUxW1p8s0+O4NcuGXfhy9j6BLxnVDhQAu8ufpVK6P1RRM/D7Kli
	 7rjBEazWFSU/xN5uEydZyo8f3oEqoGZIB09w3WB9SktP9TOpfhRieMRd3qVZ87I8l+
	 ZBmiORD5zBCluYNtodMHTcdCfhpVZvorhukHjObQ=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id 4mdSFiGEhmrttggA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Thu, 20 Aug 2026 04:35:45 +0000
Message-ID: <720e8992-b309-43ff-8f09-0612179e48bc@dev.snart.me>
Date: Thu, 20 Aug 2026 13:35:42 +0900
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] treewide: run internal library tests in "make check"
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sam James <sam@gentoo.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 exfat@lists.linux.dev
References: <20260820042827.169131-1-dxdt@dev.snart.me>
 <20260820042827.169131-3-dxdt@dev.snart.me>
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
In-Reply-To: <20260820042827.169131-3-dxdt@dev.snart.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/20/26 13:28, David Timber wrote:
> The library tests were intended to be used internally for dev purposes,
> but users have suggested that they should be run when "make check" is
> run.
>
> Hook up the test programs to the TESTS target. "./configure
> --enable-tests" now only hooks up the test programs to the
> noinst_PROGRAMS target. "./configure --enable-tests" is not required to
> run the test programs using "make check".
>
> Fix stray "enable_tests=yes" output in ./configure script due to a
> missing comma.
>
> Run make check in the "Test building exfatprogs on arbitrary directory"
> step in the Github Actions CI pipelines.
>
> Please do not close #391 as the fsck test cases should be run as well.
> This is not an easy fix and further work is being done to achieve this.
>
> Link: https://github.com/exfatprogs/exfatprogs/issues/391
> Suggested-by: Sam James <sam@gentoo.org>
> Signed-off-by: David Timber <dxdt@dev.snart.me>
> ---
>  .github/workflows/c-cpp.yml | 2 +-
>  configure.ac                | 2 +-
>  lib/Makefile.am             | 7 ++++---
>  lib/tests/run-all.sh        | 3 +++
>  4 files changed, 9 insertions(+), 5 deletions(-)
>  mode change 100755 => 100644 lib/tests/run-all.sh
For reasons unknown, my text editor changed the file permissions. Will
reroll tomorrow.

