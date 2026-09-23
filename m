Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7794EDCD3
	for <exfat@lists.linux.dev>; Wed, 23 Sep 2026 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166809; cv=none; b=K6vcWAmXZElh4iBYxiPjD8EUTe//1aDC3cRJpc0TuZsC6Y5+g5n/zfbEeNkPdL4evQz7DPiRiv/gnANs0oIb6y7OE5O3gDBEvP0v+8xEvqAU25kGRiJ6ZFcUADxudxfa2XKLPWZTGCTHfQJNmXxA7vEbMbdKXrR05jPamzKPg64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166809; c=relaxed/simple;
	bh=Kw1D7x3e0DUFoJur+dMbjUEgfL32VrgoQAFkq1DSLM8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aBFXfgMQ8bAXlnnbux/T6XfsAPJuYnag33uyJJQXXIUJD0FRTtfguodsnmE/zmDxAtMErya2hS+ZiA60fXujmYg31kkUBb3fPhdA02Mqri6HyZDgwjkENUMo5t8U+Cr3ex/YmyzewCv15VoTYXRsmbYV4tihwrKExOgqD7fQ0a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhwPqY6K; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhwPqY6K"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffdso3691885ad.1
        for <exfat@lists.linux.dev>; Wed, 23 Sep 2026 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166803; x=1790771603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bjEYBRRXH+Qyw5H6z4owKhXElfv0eipiaXkKKJThTG0=;
        b=AhwPqY6KOQpVfLG8JzwINX3uAwX2FDocHttpig5LbAjeQGn0cl5LP0c8LqcIlXtmBA
         vO9uKHlTBDy0Ww3OgZVAGV088ZyWqA/dbCM7BDreHeOoDjqsRSJ8mYnAwTT+ytMNQdz+
         FXGplqj5k1PI3C2IkOKTLMspIkBCXsFHMszii9ng7LIsOlEsJHVzR7kQ7Us5Nh2JeaLV
         2wSw5/Ty13eH32RIRIQPXjShBk8KpPiDhl3mf8tBd+gNEADFH8ieTqqCwBtpAz7i1VUM
         DCOIczdHCPiIrlqbwpMqVKYfs7RdzUcqREq80sdPJXmTPa8tEx1SB1brkEJEOp5trOBw
         QXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166803; x=1790771603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjEYBRRXH+Qyw5H6z4owKhXElfv0eipiaXkKKJThTG0=;
        b=kFGpVIf4aOnXjz+IiJ7HlUq9eTJXSIvNGT+dQ2dKszwBEFU4hQooP5JdkLh39dKjDO
         389ksCnFu1wGlQR0DlPRALViVxDmJ3H2ruQIEuSbnak0SdJtLiiAbTCanKWYAa5HQg8u
         vpMkO9Jp1Fx+yPD6bsjqr7UK8xNrhmBVoh49cCLXZxvwfv0jgbcbNJOQwa/w002qI2XV
         WnQwkB+W2qIRqoJpTxzkeyGa3r0ehu/Lt6ys3m6rEQCZ94ZXywVYzlhjhNCN+Jogssh1
         /1acpUooXS7VueVLkiov8d4cgOxvU3turwejzYLk+KVZ7chMwFAnEJzABj7PihJZdeHV
         18ZA==
X-Forwarded-Encrypted: i=1; AKwUvBzMFiOP+JxCVzs6khPVFG8HX0jluA59yZYQZBOcj78XaViuTtA1GLV6EvRYcilD/WqgJ3RDIg==@lists.linux.dev
X-Gm-Message-State: AFuF++lcU59dVsg/BnjnyXGusB0bBRtbqZRItEQReIyv9rJo8v6XozDm
	IrQT6DGb8ATtsEuLa0dm9yg50FZKhWlwLHnu7Nj4FIm4DHiB34wEmFyz
X-Gm-Gg: AYBFou23gNhO5dacso9R3/uGtLhAMwgkhLY9F1uNa1iFecHRdu8Dr8s0pdhdFPbUpTn
	ocfOuozBQUkmNHHUA6BYunTYGkj2zyPcsO+zCmNu88DQzNuwHkIptRlzzlsMTSdR2tcaMMLfjco
	IXi+yk5LJjAvhEIH2ZOy+oT0tFzQr6KhaVfoinOdHhNOX/HWNCrdm3anbg90jnELUPVBgVCf6D4
	EukQ1MTkT7B62TrSvpJDFc3PL7vvOs4az6ph1i/BL+tWfsPYnOUDIS9X+a2UIV3vpKekKLzQT83
	ZnqumR2vqglGKDYYudo/86/dgOUyXmkPdm3+dSGVlsn6eVtr/9XmUJ4ugBETTHYJGjlE5Th+TOc
	hY4Ye6q3MjA7QwzUZyxaRjkFn+L90aFFiVRbao9nHis+4G7ZJVwleiKurGwIctZUwIgGpyGiTwg
	iYwSaT124s4J8cYOBEmk2fSnwIp1fOVUr0ygTOc1f35R4W4suFA5QjBgrC09EjvvzqZo2veRib8
	lOxQmx/F+Wz
X-Received: by 2002:a17:903:4588:b0:2d9:1dee:43e3 with SMTP id d9443c01a7336-2df69d58bb4mr23419345ad.18.1790166803015;
        Wed, 23 Sep 2026 05:33:23 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm9510475ad.19.2026.09.23.05.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:33:22 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v6 0/3] exfat: speed up file creation in large directories
Date: Wed, 23 Sep 2026 20:32:57 +0800
Message-Id: <20260923123300.1626723-1-anmuxixixi@gmail.com>
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
  real                   589.48 s        15.94 s
  user                     4.72 s         4.20 s
  sys                    584.63 s        11.71 s

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

 fs/exfat/dir.c      | 293 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  28 ++++-
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |  87 +++++++++++--
 fs/exfat/super.c    |   9 ++
 5 files changed, 409 insertions(+), 9 deletions(-)

-- 
2.34.1
