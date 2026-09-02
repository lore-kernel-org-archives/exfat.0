Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCE24A015B
	for <exfat@lists.linux.dev>; Wed,  2 Sep 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362728; cv=none; b=Kxue8oKNTJdBMUDiEoPfimig9PmsnHRBcdvKX0pcVvXIQLIcaGE2IpxaVYl+qAP3KKMjxe8hXpgFrBUKZDgTopgq/ikbNjgCwXcXy0SHD1VHoaE4VI3Dl/WZdHS9kQxcZKoMavuwctTZ/AVY2S9mDrqUFpZY50JswItbCJKt2uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362728; c=relaxed/simple;
	bh=aMg4PXn5HEM8ak8x0Key+79Q1orD1vUyBFVwxuKOuGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RParCGvzEGgHKBgo3O+W85WO/oI4/eq/mGoap3O2tJR/hBLjQ66Afv+TjK0o/Hd63ib+Ya930BJVEOTaYSHTU9FnmPZklFvsK3N3OWYy8BZD8kNBJs+OT9H1e+AVjnpHU/g70+cqTkzVxfAGtrIMIukwNr1gyZ3VZNvtEQVIqos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csEN8/SO; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csEN8/SO"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398a5aad413so1114690a91.3
        for <exfat@lists.linux.dev>; Wed, 02 Sep 2026 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362726; x=1788967526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5RQxJa362c562lFaD0IiEpuR9Ozz62fsCp9txC6PprM=;
        b=csEN8/SOZe/GvQyvEjRC6szHE07AeVU8IlJBxJHWlchjsrzEzlENLTcC88cSK8dEph
         aMFFziVlx+NEGJ1kwM0qyrh7Zvndj/shJKZ0v8c401HKZ2A4nHOTPOQc9NmG83wd6zVR
         9ivwzm3xPUh5Xvcng6sP3Si5BXnY+1BbZF2rv79BXQzTTvZSjlEI5IpaMH5JhBb11iQN
         d0OwaS6MCuIu5/kqHm7rldfABUWK9j1QEKwlaMAeOUwE5iUMFGu2xDHTBnBsoxQMCdx+
         XO3j9/KmGqi0KGevF2itcdFZq+KW9x3Z5igK/0HL6KiBF9u2XwfAILUsBIMfsLz41mZu
         Dsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362726; x=1788967526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RQxJa362c562lFaD0IiEpuR9Ozz62fsCp9txC6PprM=;
        b=KBv/+ma0aAB3L9ex6CP8YZItl9nF8vnKfnd29bpcstJGshUWbn/IDxb9+pG6+bkCoP
         DlEC8Vj1FrIAuqWil7NX52+djS+YFfiXIlMeLbNDmX4IAG+epsuBaJbUAJHq4gwCREmb
         lE2INZ7vmdotVARMRZJIuIjGBiUDoWFyozCxLEtAOJVtJ/g+baz30t9O6qLjyd+OMago
         NeDhlHf+mrbEVjH1vC4XLzVCbQ7tHFMZuwnDpgwdeTYE+H8qdU9YrFWnW0CNtiSsz7xM
         JhOkYeJ2FCaDPJhh2lRhJ0KGau+Ry4vFfylDVY0cz3o5bCI9fak78yQQMQdlXQc9OpUi
         E4AQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIqK44r/nC704B0hyHSCMI+TDNYQZSmc+d4GvVPYFRmFAH93gpJpVZfluV6AsolDOllPPgbA==@lists.linux.dev
X-Gm-Message-State: AFuF++ndpQsaQue/jxo2p3pyTNmtI1BEXlG+U+py46c9UEUgCjsAK9+l
	OBV4uEJ+DRLxmWmy9eJAITI8/GayI4UOMJOHj+Dl1w52ROM3YaVh9XIR
X-Gm-Gg: AYBFou0tiW7g2/JV2+T1Q0L8AjCLdgaESK08PkX8vPuGBbg+YVDQj5khlQnJJLXwFgC
	3kVRm2HgBwUpPtEnOREiI2Wqqmvge6XT5Qir0dXbGFVH0uv0xPow/x0DSYMOoLlRQ/Mr3H/VdrX
	MQufEsn1q7Ja0mWiPmZr7Vc2ZEeM1aFo+hlRtCZ4r0+giuDGmO/DzDmvC6083tjFi8aGrTabZE1
	h/Ca4uslGAkk6m6pxc/MFla0S5ordJzkMi5QOXWCnFuDAU8xfXg0pDLQmSRvNlUJdn9BSY/48cK
	Uwbehlz6SbN7693gtNfziq4nVkCy8A2MQzUGk0BhIl6ynJKivr1bR7dclsQNVDWYp9c6vnVLex+
	z1KjJIV8QEBYXpjInLgSnMPkCxiQ5QRTcq38FLPQQM/9KsPhHHFcYLr5FUSEXLyhqq7TEzx7Ipw
	T/YFSZWY1T4+YjRcu3heYaWVG1ndesd1iSsM2s4tU844KTdYHPkHUY3C6AF3KBPgfI7vYFJ5CgH
	Q==
X-Received: by 2002:a17:90a:ec85:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39aedc3b980mr8823059a91.0.1788362725765;
        Wed, 02 Sep 2026 08:25:25 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd21e9dsm12359242a91.4.2026.09.02.08.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:25:24 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v3 0/3] exfat: speed up file creation in large directories
Date: Wed,  2 Sep 2026 23:24:52 +0800
Message-Id: <20260902152455.1273557-1-anmuxixixi@gmail.com>
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
Patch 2 retains and correctly invalidates the next-empty-entry hint. Patch 3
adds the LRU and shrinker used to reclaim filters under memory pressure.

Test environment:
  QEMU TCG multi-thread, 4 vCPUs, 6 GiB RAM
  4 GiB exFAT image, 32 KiB clusters

Creating 20,000 empty files improved from 589.48 seconds to 5.33 seconds,
which is a 110.6-fold speedup.

Changes in v3:
- Split the change into Bloom filter, empty-entry hint, and shrinker patches.
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

 fs/exfat/dir.c      | 279 ++++++++++++++++++++++++++++++++++++++++++++
 fs/exfat/exfat_fs.h |  23 ++++
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |  58 ++++++++-
 fs/exfat/super.c    |   9 ++
 5 files changed, 369 insertions(+), 1 deletion(-)

-- 
2.34.1
