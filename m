Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293728;
	b=BWsXEbE4RGyMreR6ECc64gf5TUhQnKIkUVsQi7kd45E6LMD8mnzgCD1ttrflDKX+um9E
	 4ngdt8QrSXRTV55csLL9QH/ma4Tw2Hl1j8K/ebGv9+u6TG/XRhUAZnJiDTb+qejaShU8H
	 XVEpEP+3HLVBeQLL1UWxh9nWD8QVcNiViKqKgIVPa7GfTeZieEgPxlFRXC9Nzq0ITdXf5
	 drKxYbX26a4pFbrObfZYlSJumbv9BT71u8Ehm/Oel8/2cO7yGj0NjTopCwjqUlhGgucof
	 GxnnJw8PqCY2JHot0X2p35XKSITCAdMckbegoYxIT77bYYryB4Xp5Ulic/wDWdnrhCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293728;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vKLthIkewwGyHKgVjvyn5hpXzrq2zN8uk6YZYWd1An4=;
	b=SZ/qxwaInwqt6UYe4VtSKDS26vLz06D2+aTGe/zdsFFlCSktoItDTHM+VuaMiXsKef8H
	 CICe5Ds0XLW86hgaJkoYYhuFVR/ZQJgwMFk/Mb/Sn9W5c/Q68PAJUEmRN07bLonn26T8M
	 H3Xn29zcZ+XF6inV6ruynkgwg7/HRKRz4AGYQFl34R5KI5UpZ6xOvi+UtjPijr6ATNTVp
	 ExryJe/vZAE7swRgPZ/CgRJY8wuFB24r6pypdgEQfb9qdiD+IsRgpjlC+yID/PzBYE2ku
	 c+A0r+SAsItEcysXMDPiqFfkjrnCZACnIzBU8p88+l/ILBWoNRH4Ys5Dngsw8eRdHFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=SuraAZ6q;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B2C606A321
	for <exfat@lists.linux.dev>; Tue, 10 Nov 2026 06:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60B2C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=SuraAZ6q
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 3C0D51D485;
	Tue, 10 Nov 2026 06:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 3C0D51D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794293720; bh=yKQk59d0XKuNpemliHnvmGSDoJF32twjJF9vz2GQ4v0=;
	h=From:To:Cc:Subject:Date:From;
	b=SuraAZ6qHN73otLnznU/cO0qf5dUOQ/0NLFIXH6zAlNAHUQFKxbw4kp2RvcS+v/Wp
	 Hp/Vuf+aQIm8LQ6i9eYfg6hEJFyenD/qB3nTnndxFw88+hXn+zb5BEjtdnPLZ4SPex
	 VEGbgnagrzD5tNEvPP8pKSNB56Gx0H/AeZyuj3Pg=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id /GyMLta/8mq/UAEA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Tue, 10 Nov 2026 06:55:18 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 0/7] mkfs: make mkfs.exfat deterministic to reduce CI runtime
Date: Tue, 10 Nov 2026 06:54:34 +0000
Message-ID: <20261110065441.63590-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses rather wasteful use of Github Actions runners.
mkfs.exfat can now be run in a mode that doesn't involve any randomness
(ie. deterministic) so that tests in the CI pipeline can expect volume
images with the identical contents every time. Other randomness
generated and tests unrelated to exfatprogs are removed. Moving forward,
the CI pipelines should focus on testing exfatprogs code, not other
external implementations like Linux kernel or Microsoft Windows.

In action:

  1. https://github.com/dxdxdt/exfatprogs/actions/runs/42765932946/attempts/1
  2. https://github.com/dxdxdt/exfatprogs/actions/runs/42765932946

On the first run, the generated images are consolidated and then tested
on Windows runners. On the subsequent run, the cached images are
restored and diff'd. The Windows runners are not run as the diff script
reports that both cached and generated images are identical.

---

The series also includes a patch that fixes a minor endianness confusion
in GPT structure creation code. This is only fixed to make the tests
work and there should be no real-life impact whatsoever(the disk
signature in protective MBR seems to be ignored by all OSes).

This series doesn't fix any serious bug and there are some memory errors
and fsck stability issues reported by users so I wouldn't recommend
releasing the features in a timely manner.

On removing the stress tests in CI:

I'm planning on building CI pipelines focusing on the Linux kernel fs
implementation that involve snooping on the
patches(https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git/),
running xfstests and publishing the result. I've already made a couple
of repo mirrors using CI with other providers(just in case Github
decides to go kaput overnight):

  - https://codeberg.org/exfat-dev/exfatprogs-releases
  - https://codeberg.org/exfat-dev/exfatprogs

The tests should also the cover cases that are specific to exFAT in
addition to xfstests. That goes without saying.

The prototype will be hosted on a Github repo. However, I do strongly
feel that the tests deserve to be run on real hardware including USB
thumb drives, sdcards and external HDDs as they're the ones exFAT is
usually used on.


David Timber (7):
  README.md: update build prerequisite packages
  lib: make exfat_parse_guid() library function
  mkfs: add -i/--volume-serial, --disk-guid and --part-guid options
  mkfs: set disk signature of protective MBR to zero
  CI: add mkfs entropy test
  CI: generate images in deterministic manner to reduce runtime
  CI: remove stress test

 .github/workflows/c-cpp.yml | 277 +++++++++++++++++++++++++-----------
 README.md                   |   4 +-
 include/libexfat.h          |   2 +
 lib/libexfat.c              |  13 +-
 manpages/mkfs.exfat.8       |  26 +++-
 mkfs/mkfs.c                 |  67 ++++++---
 mkfs/mkfs.h                 |  14 +-
 scripts/diff-images.py      | 134 +++++++++++++++++
 8 files changed, 426 insertions(+), 111 deletions(-)
 create mode 100755 scripts/diff-images.py

-- 
2.56.0

