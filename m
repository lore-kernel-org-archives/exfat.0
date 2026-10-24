Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792815371;
	b=hg8UCmsF/sgQBpwXRYUqKYJOyjKBakIQXXKJn9KXASqOCN8ZqDFU3Xpkc8qTgdTKs6Pm
	 gr0vZrNrIhaKarko62GJmsVVbowA5f7mS6Yq3aQjiwEzerM4baKNxOsgbpqnV/8ecdfpS
	 3N3Vd7EFYYVhnDFq6KeWkBVDjw5RpwzqWigCU6VsNVaWFgydJj3L7u/zxn0dzAYlZopv0
	 hqHixAJD/GlyO7+0hk8m7rI+ZGdzUwUNI7BPzi4H3bLjo564ps0tX7knqvFI/QKN8BkQd
	 b3zYjWNZtEWsTH5zH84DyulU5EIA33bE3bvsDSMZQe7fgQEs0FYhrHLGNNtkhJK1fSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792815371;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=SXl4qXucUpO2nRk0H166peGBD4WqAsS2yMHoUvCRwQg=;
	b=bgb+x9+bsZCWYhrw18vYZdgF1aIR6FZWCGulAb7L8uqv8/zeaMQ2dQc/hi/K9rJw4bZK
	 ozvK1fDFTnMNj8WSRyJ2jArk54kbWjZmhjFeYwdk0KkPU5PQUacE7lTSvV5RRYO7fMReu
	 DCBreSi7B9SiMJWvK3Nf1f4LBRAaFK25O5CadTQemzRBpikx8B2OWoujy7iUFh7+4PClh
	 n1DTUACLrc/3Y9k4B1Xfu2jxrOFZGlr07Wvgety+30k9llUOKdBVk895wssVXkHCXOXex
	 JcRq7cG1o8mBoXfQ7qh34Zh637rtL29s9hskDF+4E29B4r0fwbzKh14A4ItMYRuri/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0mT3LLS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C24D606A31A
	for <exfat@lists.linux.dev>; Sat, 24 Oct 2026 04:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0mT3LLS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CDB1F031E0
	for <exfat@lists.linux.dev>; Sat, 24 Oct 2026 04:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792815369;
	bh=SXl4qXucUpO2nRk0H166peGBD4WqAsS2yMHoUvCRwQg=;
	h=From:Date:Subject:To:Cc;
	b=Z0mT3LLSeT6yje8JLdBIclFMFTrObCGmlEEl0wms4Z1ArBshq/rV9L+kZ4FpjwLRD
	 Jl4OckrDOvjhlyJfz5SA1KkHuCSzfrrnohXHBK8fJMPrCb2cjvnTlS2jkLLBULTeG/
	 mOiNkvo4Rfxlwkt0XVRgoNau4a5lcUomF8EBnsgmWb+ced1lnfpXGfFlkMO5VeGfkZ
	 81DUoiURec6ZRWxB7t+oG0VWdz7RUId6M/uKAS8m7o2JUrUzBAXydL4MEK8utfMU/3
	 Ce0oYRr1PkSsr3IFMyo8uPjop3bY3RmvOvehv4x4QItB4TC2CqRMQNqT2eJ7KvwhKx
	 QJrpaBvMCGK8Q==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so1934257a12.2
        for <exfat@lists.linux.dev>; Fri, 23 Oct 2026 21:16:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx7zBcRu4mUfGYOH98zQOQ2k21o8rFkjWhOkr2Mg6HDKiS4B3j40naqUmCSSBHPyhe+W1uOuw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKEIUAC4oXQIN47cLHn9ZLDWXIVgjP+NP49vhlZf86SDr73z61D
	kJud5C2f0PuFHviabCVVcOO3utWw02VAqoa4VEZcduvf3h98kGLwrv9Sl7ePZYkHYtLrMgzK+oo
	SPfWgLqdo0cFAyntaWT9r5YQGjm8zqw4=
X-Received: by 2002:a17:907:3f12:b0:c42:3a77:80e5 with SMTP id
 a640c23a62f3a-c46bde874e3mr100513066b.29.1792815368522; Fri, 23 Oct 2026
 21:16:08 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 24 Oct 2026 13:15:56 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-2zfKDx1oKG7f1d=xo+ptVN-NiWGuhON-JvCmcDipLRg@mail.gmail.com>
X-Gm-Features: AclHuK9pUClzoJ27m0y6KV8X9QDCEne1rP3ViC8dAZ3mP8-yh8GHc1Mm5R-Zc1E
Message-ID: <CAKYAXd-2zfKDx1oKG7f1d=xo+ptVN-NiWGuhON-JvCmcDipLRg@mail.gmail.com>
Subject: [GIT PULL] exfat update for 7.4-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sungjong Seo <sj1557.seo@samsung.com>, "Yuezhang.Mo" <Yuezhang.Mo@sony.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is exfat update pull request for v7.4-rc1. I add a description of
this pull request below. Please pull exfat with following ones.

Thanks!

The following changes since commit 4a8bdffce502d70405391a7ac38bac6dcef94749:

  Merge tag 'x86_tdx_for_7.4-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (2026-10-20
12:17:47 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git
tags/exfat-for-7.4-rc1

for you to fetch changes up to 8534eb11ac056dc2ca08007cf76d3ae7cbe42684:

  exfat: fix reading a directory whose FAT chain is longer than its
size (2026-10-21 08:28:32 +0900)

----------------------------------------------------------------
- Use the recalculated append position when advancing valid_size, dirty
  all pages involved in valid-data extension, and zero invalid tails on
  partial overwrites. Write-protect the folio spanning the old EOF and
  zero its post-EOF range when extending a file, ensuring subsequent mmap
  writes advance valid_size.

- Make valid_size and zeroed_size atomic to prevent torn reads and lost
  updates. Hold the invalidate lock during truncation, and drain in-flight
  direct I/O before buffered writes, buffered fallback, and page-cache
  operations that extend valid_size.

- Fall back to single-cluster allocation when a buffered write cannot
  allocate its entire range, allowing writes to consume the remaining
  free space and return a short count.

- Free clusters allocated beyond EOF after failed or short writes to
  prevent leaked space and spurious ENOSPC errors on later writes or
  file extensions.

- Clean block-device buffer aliases when allocating clusters so delayed
  directory metadata writeback cannot overwrite file data after cluster
  reuse.

- Update used_clusters as each cluster is allocated so partial-allocation
  cleanup keeps free-space accounting consistent. Acquire bitmap_lock
  before checking available space to serialize the check with allocation.

- Use swap-specific iomap operations to report allocated extents beyond
  valid_size as unwritten during swap activation, retaining byte-accurate
  SEEK_HOLE and SEEK_DATA reporting in regular I/O.

- Check allocation flags, vendor GUIDs, cluster numbers, data lengths,
  and contiguous extents in Vendor Allocation directory entries. Read
  complete entry sets during lookup so malformed trailing entries cannot
  bypass validation.

- Follow directory FAT chains to their actual end when the recorded size
  is too small, supporting devices that leave directory sizes stale.
  Handle reads after seeking past the directory end.

- Clear the volume dirty flag during remount only when switching to
  read-only without SB_FORCE. Update percent_in_use when changing volume
  flags, reporting unknown usage while the volume is dirty or persistent
  flags prevent marking it clean.

- Replace runtime division by powers of two with bit operations.

- Document supported mount options, and exfatprogs, and add
  the documentation path to MAINTAINERS.

----------------------------------------------------------------
Chi Zhiling (7):
      exfat: fix used_clusters accounting during cluster allocation
      exfat: take bitmap_lock at the start of exfat_alloc_cluster()
      exfat: clear the volume dirty flag only when remounting read-only
      exfat: advance valid_size to EOF for append writes
      exfat: hold the invalidate lock while truncating
      exfat: dirty all new pages when extending valid_size
      exfat: make valid_size and zeroed_size atomic

David Timber (2):
      exfat: update percent_in_use field when updating volume flags
      exfat: remove runtime integer division

Hengyu Liang (3):
      exfat: fix a large buffered write failing when the volume is nearly full
      exfat: free clusters beyond EOF when a write fails or is short
      exfat: fix reading a directory whose FAT chain is longer than its size

Jiale Yao (1):
      exfat: drain in-flight DIO before buffered writes

Namjae Jeon (4):
      exfat: map allocated extents for swap activation
      exfat: doc: add documentation
      MAINTAINERS: add exFAT documentation
      exfat: zero invalid tail on partial overwrites

Nicolas Falesy (1):
      exfat: clean stale bdev buffers of newly allocated clusters

Yang Wen (1):
      exfat: validate vendor allocation directory entries

Yuezhang Mo (1):
      exfat: mark straddling folio RO and zero the post-EOF range

 Documentation/filesystems/exfat.rst | 117 ++++++++++++++++
 Documentation/filesystems/index.rst |   1 +
 MAINTAINERS                         |   1 +
 fs/exfat/dir.c                      |  52 +++++++-
 fs/exfat/exfat_fs.h                 |  89 ++++++++++--
 fs/exfat/fatent.c                   |  46 +++++--
 fs/exfat/file.c                     | 260 ++++++++++++++++++++----------------
 fs/exfat/inode.c                    |  16 ++-
 fs/exfat/iomap.c                    |  81 +++++++++--
 fs/exfat/namei.c                    |  11 +-
 fs/exfat/super.c                    |  30 ++++-
 11 files changed, 535 insertions(+), 169 deletions(-)
 create mode 100644 Documentation/filesystems/exfat.rst
