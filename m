Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E730550DAF
	for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991916; cv=none; b=XBUmQmtw7f/mFzDlJMI5A3fVF7DhE/uRcQBlJ08LlQhVJ/EDkH2YPh20rrtB12vRevD488Xj3S88pDzTKg+ZtUjfMXQcI/RH4iZGBQaUKvaxnLSPpb7vfkaPkfjHMTqQ5syqSpDF5XAuJoIfegw188i5fpBJ+WIItXgXNtM0ouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991916; c=relaxed/simple;
	bh=GWS96uhwvjD8pBeUxeNzx3Q9nm3IjXH+MmITVGTRSps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U/THbJBwsEN85ZpMBbAqGEO1Lrfyyd33oYRkD/vgAmKmif4VjQU+Sq2ae0mZL28tJmOrmMQZg/ze6vSLLDVk2hfYfC1JTX3YSQokiwSKCh3/LBr+HE+TVgKvWglvM/URurK9tAa1VFcvn2Q99NRGzcrYSCs5Q/R/UP6SsWLLuFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVCdO7yu; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVCdO7yu"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-887fb6c0ad1so251527b3a.0
        for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991913; x=1792596713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yA0cwHPsMUsglcT0cBHl9/S80mGW6LWbt4CaYradWFw=;
        b=QVCdO7yuDUUcKeLm0Cj25+wydzk2/nB54W98hHe3hKCDe8zKVN8SKGinWHka2bdEKU
         iN/pUEepLNn7LkKqYwtrmQTQnsHU3EQvKABWDpVl7yqvEhnDozql7Hv+Ja3jCU1L5XJG
         AT1WF/Hpln+00F4Hq0KG38bGUxZnP7mqc6abtbIhflCZ990XrehDsgwJ51dvmn798xUE
         w+gslvYxP1dRPdL6u5qtWAQzMiKEWX42wwrxtOGB4vgydTqUV9GuAWgxSm2It89l73lT
         rcoWlHQ87utrWBCVU3Gdx+bNMBEwQYITRTeoZQpi887Y+P4LV+vbMcqeN4JxMlb83w0d
         D/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991913; x=1792596713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yA0cwHPsMUsglcT0cBHl9/S80mGW6LWbt4CaYradWFw=;
        b=JiRT2+ycqTyW0p7AsZdV4Ej6YOGai8SqFJ6MeiN+M2ENKbC6yoWttF1B0owZKFhGR1
         /JZ3532W7mVKVDArPJADk14dpB1GmGkJbbaDCuFIO95HEcvrh9QNyVQ5//zHIjVwo1Ef
         J1i/4lDBTKSkc8AdNo0JRcRSmVWlm4YAmtHj6fPxMNQ7W1j9HIkJh+if22SBcLmJI3uF
         cppG3tXGBa6M8Z3p9oHNLYI1KkMgx1JtoKlDwPids3K4I/NCA0IS0pPPtadvo6VugAOW
         FkjRlyk4WL79FHqspxlDDA7qYCuflRbb2aZEMyuxC/Yfp1L/wTun4Wv81tz+GyrSN0lI
         bMjw==
X-Forwarded-Encrypted: i=1; AKwUvByhQnG++sK+FBIqM6OSiCxUy152GyKfPicpDRxPaoF/DIgB52ZK7a0qw6wuyBsHWSomH8IZJQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIdXTZoLdgFXSt2uZZN8wYiiFYgd/vYyke7urhpA/EhlzkFES/B
	o8XYh7LBPhQLcw4ssrpASZgT5pOk27EVYxaUohCNwFGlMCDi/Evd/XND
X-Gm-Gg: AYBFou2obBoUAglF3aZDQqIpNMS9bZFcDClMGAJGAxNIzX8aARJ8jRcUF9Bc/BI2Usg
	phSc0m14vyDhASUfoDCg171LVay87iKOA9l/om4/6s84j4R488eibD6up5NEuYxreCnNC/nM0+b
	mRlWnw0fz9865LPYDW9bQ8rQhchRXP+ay7EUGyJR8WSAFj+xCuYuUDMmd2t+p4MN++k7KK6qBcY
	7jVg18sQBM1YBvEnNzgyYjABIcvpZVgutSYKcSYOKAAQw+IxfxTxqdxPT6pl1gzlJJjCuAM1yks
	rY4IpOIF30lBpjVdBr1MN0dCSGhnd5lpI1xdj/oJpCR+pw8GRt2rmY75vIw4hONjLpqbqNdQ+s1
	8BdOhrYpdkBcqgK6jmXODS7h6Modk3ZBRPfndOn1pA3cvxiT5dnJ0nEQgvT1zRM1frtgnHm3llE
	poxLP/tAA9YPP8bSq1WA6d0pNK0Nt1933IJHJk/lODnll+eGJwZptYm+Clo7npJ+aUe8wAHN3A9
	79dUbCoBttE
X-Received: by 2002:a05:6a00:4c08:b0:891:3e34:e080 with SMTP id d2e1a72fcca58-897c6c248f5mr14126170b3a.24.1791991912400;
        Wed, 14 Oct 2026 08:31:52 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f51f452sm1221941b3a.1.2026.10.14.08.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:31:51 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v8 0/3] exfat: speed up file creation in large directories
Date: Wed, 14 Oct 2026 23:31:27 +0800
Message-Id: <20261014153130.2111500-1-anmuxixixi@gmail.com>
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

                         Previous baseline   Patched v8
  real                   589.48 s            30.27 s
  user                     4.72 s             3.40 s
  sys                    584.63 s            26.83 s

The unpatched baseline is a previously recorded result and was not rerun.
The patched run created 20,000 files; fsck.exfat reported a clean image.

Changes in v8:
- Rebase the series onto exfat/dev at 8e431c3bce0b.
- Drop unrelated blank-line changes from the Bloom-filter patch.
- Discard empty-entry hints collected by positive name lookups, since a
  lookup can start at hint_stat and return before scanning the directory
  prefix.
- Track the remaining root-directory chain length during volume-label scans
  so their empty-entry hints remain valid across cluster boundaries.
- Remove a reclaimed filter from the LRU before clearing the inode pointer,
  so the lockless free fast path cannot observe a linked but pointerless
  filter during teardown.

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

 fs/exfat/dir.c      | 363 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  30 +++-
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |  87 ++++++++++-
 fs/exfat/super.c    |   9 ++
 5 files changed, 478 insertions(+), 12 deletions(-)

base-commit: 8e431c3bce0bb51802fc79b10225cc90a15f15d1
-- 
2.34.1
