Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09F73939B9
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 20:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863313; cv=none; b=nbYZeP1e6AmNSqrBYZONGnkATdgdOk7fGU7xqPP6YIgUgmHJM51qKah85jssfOrjWb7hYEhXXc02W9u0YwlNwkKEQf32BqtmyGDBb4qpwu3GMp3CgqzQamUeh/S2YmGMkSsYMT5k/6Qtc8sK8zQNMhhqMyQwuYzdbAHFuatOIHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863313; c=relaxed/simple;
	bh=fTtzkGpv9bIwPLJlFPDhQM4uL/q7lSIkxfC/Ql9Jjmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mhNAEH8mri6YXhlNG22HT4aLAxSrDvTWCI76ov2YK/93hqlHxqNbDQFoIe6J2ZyylBCzI69YX7+8wZ+rElio9DiO70Bej+SlQM8BRhc+PCTTqj/dudVsFDhe40BgFcy2ywkb0Jo5vNZm/KmHQmrzgFujnhjtUXsZdhkhcxz3ZPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=ohelBRGz; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="ohelBRGz"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 437C91D451;
	Thu, 27 Aug 2026 20:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 437C91D451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787863294; bh=fTtzkGpv9bIwPLJlFPDhQM4uL/q7lSIkxfC/Ql9Jjmw=;
	h=From:To:Cc:Subject:Date:From;
	b=ohelBRGzvqiTfLjiDEkKKxDARLISsTOFNgAwDt6rnUQN6s8BLkdbiHiUyCp9RW8wb
	 OUr9zSBTdr/ljLB5k3TNgFQ1fnGDIOzO8sIvKWthH4yRBX0cCA4YSY5Z5eRb9FbpB2
	 I7tRPTUn+U+XT/LXCFlMOnSbCmPDIYSFAiOOMi5M=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id rDNIOvygkGosiAIA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Thu, 27 Aug 2026 20:41:33 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 0/8] exfatprogs: optimise mkfs zeroing out and fix stdio output
Date: Fri, 28 Aug 2026 05:39:46 +0900
Message-ID: <20260827204056.222099-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following is the performance impact profiling. I don't have a spare NVME
SSD to test with so I used AWS EC2 :(

Your contributions welcome.

I'm sure pgsteal_* in /proc/vmstat can be used as yet another metric on
a busy host, but I didn't bother to go that far to collect that data.

UAS:

  - Host: Raspberry Pi 4 Model B Rev 1.5
  - Device: Samsung BAR+ 64GB (via USB 3.0)
  - Target partition size: 1998585856 bytes

  Pre-patch:

          System time (seconds): 4.54
          Percent of CPU this job got: 7%
          Elapsed (wall clock) time (h:mm:ss or m:ss): 1:05.14
          Maximum resident set size (kbytes): 3200
          Voluntary context switches: 10297
          Involuntary context switches: 978
          File system inputs: 2168
          File system outputs: 3903664

  Post-patch:

          System time (seconds): 0.29
          Percent of CPU this job got: 0%
          Elapsed (wall clock) time (h:mm:ss or m:ss): 0:56.49
          Maximum resident set size (kbytes): 3200
          Voluntary context switches: 5792
          Involuntary context switches: 1322
          File system inputs: 2224
          File system outputs: 176

NVME:

  - Host: AWS EC2 c7gd.medium
  - Device: "locally attached" SSD volume
  - Size: 59000000000 bytes

  Pre-patch:

          System time (seconds): 22.64
          Percent of CPU this job got: 0%
          Elapsed (wall clock) time (h:mm:ss or m:ss): 45:47.70
          Maximum resident set size (kbytes): 2792
          Voluntary context switches: 227200
          Involuntary context switches: 7352
          File system inputs: 1360
          File system outputs: 115235032

  Post-patch:

          System time (seconds): 1.14
          Percent of CPU this job got: 0%
          Elapsed (wall clock) time (h:mm:ss or m:ss): 26:08.06
          Maximum resident set size (kbytes): 2788
          Voluntary context switches: 56409
          Involuntary context switches: 60
          File system inputs: 1727
          File system outputs: 656

David Timber (8):
  exfat2img, treewide: do not clobber stdout
  mkfs, fsck: refactor getopt_long() return values
  treewide: fix factual errors and reduce column length of usage message
  libexfat: refactor exfat_bad_char()
  libexfat: add exfat_secerase_blocks() and exfat_zeroout_blocks()
  libexfat: add exfat_trace()
  mkfs: use BLKZEROOUT for disk zeroing out
  mkfs: issue POSIX_FADV_NOREUSE before zeroing out

 dump/dump.c           |  14 +--
 exfat2img/exfat2img.c |   2 +-
 fsck/fsck.c           |  14 ++-
 include/libexfat.h    |  33 +++++-
 label/label.c         |   6 +-
 lib/libexfat.c        | 114 +++++++++++++------
 mkfs/mkfs.c           | 254 +++++++++++++++++++++++++++++-------------
 mkfs/mkfs.h           |   1 +
 tune/tune.c           |  18 +--
 9 files changed, 316 insertions(+), 140 deletions(-)

-- 
2.55.0

