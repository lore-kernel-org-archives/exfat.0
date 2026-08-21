Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C0C36998C
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 06:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787292492; cv=none; b=R6IZnCsvbDrbkkJgXycUWqtxlczIYT3gdEuzoV20elV4jo/EH+6cQyDQrg0ymhyf11ybqrAHfp/KRLECmyLp6AgdV4kDwrrx+Y+bLBXyr7EPfOzYF15e52JAKqkEVrcjDTAaqcQAnb/JD/6MN1tkq/oLIsyETu9mT+E5prQyKFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787292492; c=relaxed/simple;
	bh=1wfidxq5kX4aryTwTdVuLKp1dypTqEGBLP81GL/Sv24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RWK+30apvKKmyPijxpcFAS0GNJ4fkvthcCIxNhn6hryaOEjPA+zDIqIHcnquYnHmAYu7sCdQb9xtlW1TtFR19ccEU4sviVWPcK+mP0RuKiOiJN4zCcUfp1OSXAThwnCh9kD+xoD3Avekqwf0Mlwlq7zStg0pcz/3hIlRKN1OiGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=M0Chh4XF; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="M0Chh4XF"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 4BE661D455;
	Fri, 21 Aug 2026 06:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 4BE661D455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787292483; bh=1wfidxq5kX4aryTwTdVuLKp1dypTqEGBLP81GL/Sv24=;
	h=From:To:Cc:Subject:Date:From;
	b=M0Chh4XF5ob1xQrmBWaMvjMEZODlUX7/VI7NaOeOrjVgTJdd865UQj+FnvPAfaTJT
	 eNMOCdaAcm0Ud4Ec9k0CCO1nA52rh9SXrvGl+B6CjSvCS0stvSElZnATd5pIZEaldQ
	 fDRGPpamtW6N5jb1DicJtT4m13zMqcOZn15VkccY=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id xh2MOkHrh2puSgAA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Fri, 21 Aug 2026 06:08:02 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v2 0/2] exfatprogs: remove sscanf(), add "make check" support
Date: Fri, 21 Aug 2026 15:07:39 +0900
Message-ID: <20260821060741.92772-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

continued from Github PR #386

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
 create mode 100644 lib/tests/suite0001-parse.c

-- 
2.55.0

