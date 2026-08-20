Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A39E385D6E
	for <exfat@lists.linux.dev>; Thu, 20 Aug 2026 04:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787200628; cv=none; b=FSAscanYNS+zRxYHJ1DVbo/CoBiJ3xQ7T678ncUUrgc+4UHPSqS+nqFdmnpb5KZrEV13Net7eTV2aQsXUf1K9ewo15YZ3ZQ9NgryLJiibomJPWRLEWvI+9q8PrWpOCCnnH6k+ESmHZX4ti1V8keUTQKvCd72dPXB28eJflfRYFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787200628; c=relaxed/simple;
	bh=wcI6vT5mA5bMgemsBB067TkLEf4XaAcRTLKYQObd56g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ckf2X9OmAoRp69ChMzYd9vrA5n/WE+CTQb6hdi+DqjXqNqbtguqOP526nlr/48Uim8eJc10RNTL0QbiYuZ9kZNb/q5KEb9lBcn+2SiTnPOfj6eoiYhcvMNxdk4wwt8/CKTIOtzfFLidhNhaSrngph5+ejgKzdAc8HJH+fnBZKhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=ad+l7KxZ; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="ad+l7KxZ"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 665409180;
	Thu, 20 Aug 2026 04:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 665409180
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787200120; bh=wcI6vT5mA5bMgemsBB067TkLEf4XaAcRTLKYQObd56g=;
	h=From:To:Cc:Subject:Date:From;
	b=ad+l7KxZ/9ixcemirRWH+w8YfQMlqsRKu82HfD3iAzaiUBL7288AaEDPS9BIkziZC
	 qkkzfj1d1+6EeMbGdgkmxcIusuvuKf4Z0/AXf2j7N9BIRBUSC6cYm8iWIC8dsJzB1n
	 dvZ3jA82Z1PYhSVrGRAnDk4xh+BPNhOhaLKd90gQ=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id 8EY5BXeChmphtggA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Thu, 20 Aug 2026 04:28:39 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sam James <sam@gentoo.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 0/2] remove sscanf(), add "make check" support
Date: Thu, 20 Aug 2026 13:28:25 +0900
Message-ID: <20260820042827.169131-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1, continued from Github PR #386

Changes from v0:

  - confirmed no behaviour change in exfat_parse_ulong() according to
    the x86 disassembly (other than saved_errno)
  - boolean environment variables now accept non-decimal integer values
    (updated commit message clear up the confusion for reviewers)
  - trailing garbage characters after an integer value in boolean
    environment variables are now rejected(this is the intended
    behaviour Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>)
  - `make check` now runs test programs in lib/tests/
    (./configure --enable-tests not required)
  - Run `make check` in Github Actions
  - Add missing comma in configure.ac

The previous implementation of exfat_cmp_kernel_ver() misbehaves in some
cases and this is why we should move away from *scanf(). The change in
behaviour is intentional and correct.

There's no regression in exfat_cmp_kernel_ver() for Linux kernel version
strings because the Linux kernel always returns the version in 3 numbers
(make kernelversion). The new implementation is the one I originally
intended. The test case should cover all the possible sane values for
kernel version strings.

David Timber (2):
  libexfat: remove use of sscanf()
  treewide: run internal library tests in "make check"

 .github/workflows/c-cpp.yml |   2 +-
 configure.ac                |   2 +-
 include/libexfat.h          |  41 ++++++++++++-
 lib/Makefile.am             |  10 ++-
 lib/libexfat.c              | 117 ++++++++++++++++++++++++------------
 lib/tests/run-all.sh        |   3 +
 lib/tests/suite0001-parse.c | 101 +++++++++++++++++++++++++++++++
 7 files changed, 230 insertions(+), 46 deletions(-)
 mode change 100755 => 100644 lib/tests/run-all.sh
 create mode 100644 lib/tests/suite0001-parse.c

-- 
2.55.0

