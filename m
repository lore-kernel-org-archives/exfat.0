Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F9C3939CE
	for <exfat@lists.linux.dev>; Sun,  4 Oct 2026 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122223; cv=none; b=G+cWvCs/09A9y2HKaL9JVu9yyfKSSIE08HEzNN96aIhJVWfYkWtVHlmIFh2XA5Wz2uYABj+9vq6qOOL+4MtSbffHQOr69ShHDiIStH3eX140oN2u8D6xdZ3xXoc1gzNG8/xafFfjzS7ProjOm7abACvrE8qTEkghy1vxsKyOoTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122223; c=relaxed/simple;
	bh=pmFKQECN/1g2BouKe8+oDUfj61IJz+zyRJ4LXn804/c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E48lt/wpOHacKmBixbOz4YG9Pnr0CzD9gN78B72fEHWWAEyjQgkqhN5zA8ewT2SrMhuHaJ9r+AGXeULvm5/uvlT78DC2/guVf+yF90x8YtpPLmDciw+kvqBQX5oOvsk6FaBO5d92Le6WQ46fXnY0HdRRuOGwGG76zH87BKMv7mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbv8KGML; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbv8KGML"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so293264a91.1
        for <exfat@lists.linux.dev>; Sun, 04 Oct 2026 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791122221; x=1791727021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+DO1yEzfxyadFeHcANw8jUbpWw6KMN2IhkWPDLISq9c=;
        b=bbv8KGMLKVbO+5S9QOMGAR4mlfhzB+5Rk/ps//kDSIiMR974u14IOVVgiNsk/keA9v
         Hoym3k7fHNyBCZY9McLkKBpz+aDYFNx6HWjJe8S0rGX3XT47uKbxRlSQ2zFAaD1gg2zO
         T9Nhi53mmPvJyhveycsUKZ/870dzZfhN4dQTz2Y4SihrVMJuXlX9qWDykbWfQmvDG2Fh
         QKrmdjHiGC7Y6cYRWg/B6AfIhLI5LHcgkyL/imlvVr7sm5E+OI4Roxbbaqoic30/gYzK
         RTdc3agvQGGRrmR5MXZp0vCUX9LX1KuQEvpwNmx+DQ5WJJ/MfjvfcdgmREcW70DHxB+P
         vP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122221; x=1791727021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+DO1yEzfxyadFeHcANw8jUbpWw6KMN2IhkWPDLISq9c=;
        b=EbF2HJ5yZ2PaKvvrEwdF9t45xUQx3tyasRH+KISe+Qx1h0T18Ikqdpr2xtPPV1V0uT
         1NBw+IyfisNK+4RyQnRKu3SogmzKSZCBtZHYvwiARCTzMl887S6U/HkSIMdzhWxojxZZ
         OD2CE0enGKaGBEV+5aww3q9NjnQWmbHhNsSSsxwE1Jz2tJZ/OWVd+wTvmFS+BEWLlN0m
         gAF9m35Www/uvcOCBvPKt4GfwGXIho264J0q05rYmZPSjEkXYozDNeHEJ0CXVNATDLCo
         ql3u+INh0w4yROHRs5uhJ7XssHeL4JDYLX0N+EOgNA5jaBEDxUJAcW0PBPfo+qUTIedg
         Q9GA==
X-Forwarded-Encrypted: i=1; AKwUvBzED2mjVPeUgAsOCN+Gf6Mx/DsqfQrKdZRa2rQNv8V/4iRXt4DZSHH8uMcapQY4eACgKjWMmw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKbD4eg8gMRwE17/+4pNevjviMsYwGT5FFNXOnaCThZ/AlyJrPc
	mSh9gvNoZ++E9O7YCQ3VuGwYB3V1WpnfwVratjVstqMMo8NazNc9+F6i
X-Gm-Gg: AYBFou1AEe7snyNsNx/LZUCQ1P4rpn9DeB0l9CnrzmcCHNKT81+yli5Lq3y9awSlfDG
	02JsG4a1mnW6/J86lnHMMj2JViaxvrYwdltjYdjlTTikZKgmJRtSv5l+EpQ2H8mQdtb8Xv99edr
	Rybl+MOVlIuQ8X238+mHjVgBsjGqnjcU5goT6ZhawqY2lt6P8ZcXvOElkWro3qfFj3XrFua1zt1
	7LBcHP4bwsBfD54CH5tvIACtU2sXFh0xh8aG5oW28StXmrcgOZ5hrdfyAb9Mm2fAHigng4H0XNV
	o3aH1uEeBSlsEX81FlT5g+zk2tN5NsmL6/A33FlaSu6WO84dbnGsqJmkUqDV/6XN6X+F94uSgH+
	3rBJ1fwmjms8jbUdwvSqhafnNmIKTy5D1B+Vfv6kvpNNdyBHl/NI3FOyM5BBKVAy17UZzxCwmDu
	K2uO+X16i+QdfuX+njAt2sZf8LoY8Ag07Hhk7hdv1Tapmf8aITTpl7D7BsMY/ISyD/yKxIqAfOx
	xdmSpDyS5n2
X-Received: by 2002:a17:90a:1c17:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3a6f1d26a1dmr3124752a91.58.1791122221416;
        Sun, 04 Oct 2026 06:57:01 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7cd433sm6876358a91.15.2026.10.04.06.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 06:57:00 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v7 0/3] exfat: speed up file creation in large directories
Date: Sun,  4 Oct 2026 21:56:35 +0800
Message-Id: <20261004135638.1888530-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Negative name lookups and empty-entry allocation can repeatedly scan a
directory from the beginning. Bulk creation in a large directory therefore
approaches O(N^2).

This series separates the optimization into three independently reviewable
steps. Patch 1 adds the Bloom filter used to reject definite name misses.
Patch 2 retains and correctly invalidates the next-empty-entry hint.
Patch 3 adds the LRU and shrinker used to reclaim filters under memory
pressure.

Test environment:
  QEMU TCG multi-thread, 4 vCPUs, 6 GiB RAM
  4 GiB exFAT image, 32 KiB clusters

The measured results were:

                         Before          After
  real                   589.48 s        30.09 s
  user                     4.72 s         3.40 s
  sys                    584.63 s        26.65 s


Changes in v7:
- Size each Bloom filter from the allocated directory size, using four bits
  per on-disk entry and clamping the bitmap between 512 bytes and 4 MiB.
- Track set bits and discard a filter when one third of its bits are set or
  directory growth requires a larger bitmap. Rebuild it lazily after a
  later complete negative lookup.
- Account reclaimable filters in pages so shrinker accounting follows their
  dynamic allocation sizes.
- Preserve the shrinker core's scan budget and return SHRINK_STOP when the
  LRU is already empty, preventing repeated no-progress scans.

Changes in v6:
- Invalidate the name filter when committing a new entry set fails, before
  attempting rollback. Despite the reported write error, the new name may
  already have reached disk.
- Move rename/move error invalidation into the Bloom filter patch so that
  each patch remains correct when applied independently.

Changes in v5:
- Rebase the series onto the exFAT maintainer's dev branch.
- Treat every non-negative exfat_find_empty_entry() return value as a
  successful allocation in the volume-label path.
- Record the minimum entry-set size for which a saved empty-entry hint is
  valid. A shorter entry set now rescans from the beginning and can reuse a
  smaller hole that an earlier, longer entry set could not use.

Changes in v4:
- Publish the next-empty-entry hint only after the directory entry set is
  successfully committed, so post-allocation failures cannot skip an unused
  slot.
- Invalidate the destination name filter when rename or move fails because
  the new entry may already exist on disk.

Changes in v3:
- Split the change into Bloom filter, empty-entry hint, and shrinker
  patches.
- Accept filenames containing exactly 255 UTF-16 code units while building
  the Bloom filter.
- Invalidate the empty-entry hint in every path that can free directory
  entries, preventing stale hints from skipping earlier holes.

Changes in v2:
- Move exfat_name_filter_free() to exfat_evict_inode() because
  ->free_inode() may run from an RCU callback in softirq context.

Yang Wen (3):
  exfat: add a Bloom filter for negative name lookups
  exfat: retain the next empty directory entry hint
  exfat: reclaim name filters under memory pressure

 fs/exfat/dir.c      | 352 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  30 +++-
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |  87 ++++++++++-
 fs/exfat/super.c    |   9 ++
 5 files changed, 470 insertions(+), 9 deletions(-)

-- 
2.34.1
