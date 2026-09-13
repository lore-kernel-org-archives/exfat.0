Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF967391832
	for <exfat@lists.linux.dev>; Sun, 13 Sep 2026 14:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789309425; cv=none; b=Srb9Hu82kIRps0+wlPZhoAJMqS4hE0DcU05sn8ogItV2eY5CKyJ22/QTr0HrE+nRg6IP2Msrl6hdoWvgjbLUyLV9jUeY13UJdLdfgyVxWbDLw2LN+OgoV+JJ5chJhRK1RoJHeyz+5XdQ/Aug6zV9cDlcbep7tQlU0YC7E11Eg9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789309425; c=relaxed/simple;
	bh=e2HDJRdd2+hJqcjvKMthttlGV8EVLKR/HAVzwxVBO2k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WYhAid2Py6AAI97cqRoC5g4SciaCZ0PskjBokVYsdojhV34PHHujcrcLEuPiyUrwx12cZwdrYN45HytgSo/+CgK869pJdfLSOyXenKvzlqhqf7spVZab+ousUq76WhL1RhSKVEq3BIethCe1Ls9jIQqlOF1umtnSKJhp2pKCg4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcO2TEjl; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcO2TEjl"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3718616a91.2
        for <exfat@lists.linux.dev>; Sun, 13 Sep 2026 07:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789309424; x=1789914224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NNdYTq05HzZvTrlRKfAdsbtptyKt0LqomzUVZOXk5ck=;
        b=XcO2TEjlYo09mw6Ef3zPqpipXshdIUhLnlB+cz5yWqv4F686CSBhscZnamGUVw0iWq
         GoWOpcJ3tcN4tdmf0stSCyWY/H7b88R1zUv6QhTIGbqAAcceSkFQ+b6cii7MlLg+No5R
         DfY/kzTE8fbGgKtDhpY4y+x4ZqdUGFst5jVWotbUX5sUhaS/e1BnprVbjdm2JesP6cRk
         g70+mMrJu43s+BXCdjxizsLEUz7TVPwgXlGqZ01897cRrlsxnnetzxvJiEkh8d1eRTMT
         0+jbBEheo8qqPlZd0BW+6ByqYK8N8BgR1aC3SrGrN/dfCLuIlpgtWJPrrk/z6CAzHu2C
         xzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789309424; x=1789914224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNdYTq05HzZvTrlRKfAdsbtptyKt0LqomzUVZOXk5ck=;
        b=JQUMBFCWkW8l4r42qbCYmOVZc94nF/mm+9J1PHZIhtoEg2+okMEJZOk14LtVtEvbN/
         7HiLh76wNB6SxKMyp6D9c+CmE9BwusSvdux0x2fnX7S5abJKOe6ZtjI1a/R6UmQgvJnj
         8osED1sFJp+3XnqUa35UwE6otzTYAZqvu0JHOF+OxVI/TIbCPXJ9Cq1BUE04lE4EK4lP
         WHaEd8EKaDgwf9PDTLuzvvQzuJrwDxElY+8oHEuOPO5UmWRdtQh5SnYjChF+eakmiloH
         p6OM5s9PKkdakuFUDtdn1y4dbMN6sPGG4qClqjdlKo2pJNCvclBLYeMMcz1RKYb87gJY
         m28g==
X-Forwarded-Encrypted: i=1; AKwUvByE4uWQK+VZIQvislUYUq1JaWu0uS6hqhHUbdlcWDry9SBsvq1q9iS6A3JOqOpuRkC0uxR2iw==@lists.linux.dev
X-Gm-Message-State: AFuF++mkm9+Ncziv92Re3oFvLF9XwiF+uv+TFnIChj6qY4DIvvnOxpUv
	nO90IN04ta4dRNm+wRqTjPbRK+GpGrPPO7FvNS/3jB7AbOOTwMLoDOWL
X-Gm-Gg: AYBFou02l33NaJbjRLTp8XG2+DlZ0sSi9yNxmHmWHAmrecFI5RkGk4X3VF6nHOcGN4Q
	Gkku4Sc+cs1aS4jfWh2kkxcqA4XTN/rNBP1MPeMktBJmVPOq747iD2xwZ/ZmeLQoCrHjA05h6la
	5NkFpsyiupq51Vo1KztFGhkIHY8lQg+5Gl0TUG/B05U2phIDOIU/1Iu8UNJrEsRh4spP7Lk7KER
	NapGWR+MlkSfon40drzJ68m/pzPnwRFj5BD3eyvk7O2h/hD9ABAggouKOQeRo9S1KAw/+xNJV0C
	J8qAVFv5HXmCnYUBCZt3vdhhIBQhmcIlKanWdGzy0Hx0XYEfU89IruLLVhO81Pt912ghXO/5nSA
	ZaqvtqyPHxiWVbJLhANhFyhFwYUwnyc75GdhrYXBN/dXtJAX+4gerzDEE0S3kGXgRcR90jS2sPB
	NQ7Wdh3kRuiyfPoNtrhmU5RGm8uBRGQQwC4Z/uke7MOeENivqG0V551ecGNbZLrbRyQ73+CJZtm
	/CAf43+wfcQ
X-Received: by 2002:a17:90b:4990:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39d9c0acc23mr23740786a91.14.1789309423918;
        Sun, 13 Sep 2026 07:23:43 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dbca4c9a5sm2900843a91.0.2026.09.13.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:23:43 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v4 0/3] exfat: speed up file creation in large directories
Date: Sun, 13 Sep 2026 22:23:11 +0800
Message-Id: <20260913142314.1400062-1-anmuxixixi@gmail.com>
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
Patch 3 adds the LRU and shrinker used to reclaim filters under
memory pressure.

Test environment:
  QEMU TCG multi-thread, 4 vCPUs, 6 GiB RAM
  4 GiB exFAT image, 32 KiB clusters

The measured results were:

                         Before          After
  real                   589.48 s        15.94 s
  user                     4.72 s         4.20 s
  sys                    584.63 s        11.71 s

This is a 37.0-fold speedup.

Changes in v4:
- Publish the next-empty-entry hint only after the directory entry set is
  successfully committed, so post-allocation failures cannot skip an unused
  slot.
- Invalidate the destination name filter when rename or move fails because
  the new entry may already exist on disk.

Changes in v3:
- Split the change into Bloom filter, empty-entry hint, and
  shrinker patches.
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

 fs/exfat/dir.c      | 288 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  26 +++-
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |  78 +++++++++++-
 fs/exfat/super.c    |   9 ++
 5 files changed, 395 insertions(+), 7 deletions(-)

-- 
2.34.1

