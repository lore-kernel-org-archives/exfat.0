Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5675931717D
	for <exfat@lists.linux.dev>; Sat, 19 Sep 2026 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789831382; cv=none; b=QmZDUyHKIyY3p+nNItwnmFqhevSiC/ekTY2C7LvHYpqhS2yLo8abeEDR8DcNdvr7MYWkkJHcyOSDbuJT6xHYuqrL4aOJZz+Wp8qM9E/VmDisJudn/tyXElwRxhE+Pb2W2rJV4xNQONHYURcn/PfOwabH9aw/yPb/0M3A7/AfDmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789831382; c=relaxed/simple;
	bh=YneO4YqKWZJJNx8URZWytY1r1294muS0vegwG1HwU80=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OgOzQCs2mdEep6q42oIHxgJ26sAH9kLKMf4WYgaDlgK+A6l0E6nbdH78+VApuIzdsg1IrjpAzS8UaxWOHk0nRCxWqXtlv0t5F6AXVsN5QqWpI+668d0zgRqrhrkYmVxWk6FDNT6a6yD17Rv93Detoi8UzVFeq8WULOmPX4Dry1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8ZBCPnY; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8ZBCPnY"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba92so1591272a91.0
        for <exfat@lists.linux.dev>; Sat, 19 Sep 2026 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789831380; x=1790436180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xXc9ZRujKMefBJqLeunvblEf0+32BLmaVOIFNTZhBI=;
        b=M8ZBCPnYXE4wvb3xzl4R+UM6IdaVdrbZ+HZKu7sX683GYpPK2u2WakrGU3aIdBSN8z
         ehP9HFmuExIgtVMKiNthzb9xSW4q61GV/Nkp1VlU67jToSD9buHfrevJh5FWIidMEYIF
         FtsViK61QgaiuNA6eWADilYf4tnNlygdkWzLJY0fNWucTKQIgTmpA4gXQQuXRgEkINg7
         UiAetIafAq1sBEXOnVXjGTLRVIA83A/YsPR/djU2y03ohZPpHnFemZ25BUNpVntNnARh
         J4q99+bEz+aoX7GVZ/qJq+NjTML5+H5T58AoqUdGlEZ/zLDDFtnSo1EpvaAGPZjMSUaL
         zBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789831380; x=1790436180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xXc9ZRujKMefBJqLeunvblEf0+32BLmaVOIFNTZhBI=;
        b=pq+hpCJOsoAdHu+2omSOSxsbxMb5Puk9b9CZssty76EJu3Jmru0ile0oe5JeqcYRBT
         R1w6cUVG3M/A7d/FQwiFN5W6ft55flMVUcio8Pjm+T88844TR+r9yJNf9MsEDdB6h2wm
         aFjQ/o1d5Ed8VHl5CjyjQn8vaK8js7hoaPwlfvopXWVpCZEZuMIN3mhYpZj1aIGLHu6u
         GF6QdM5jmw4Wz1M6XnG0kwzkFbhEe5KVr2W+gX3cZk0/O53e+10/mZo+LT4PXbWOC1oU
         yc8SkuvRox8Bl32wRQ4zFJg9JlJ+weQpFfXS3bSnqK6ITjNizebtzW5zym2gl3r4ESha
         OxyQ==
X-Forwarded-Encrypted: i=1; AKwUvByEA0nc9OGP3rp9ksBMfbF4EAQQGqwE5UgwAUTrqz3r0V/bu5vvPyot9Lq2+p9BjK6xhnQjEg==@lists.linux.dev
X-Gm-Message-State: AFuF++la0JYpvX927wksrlG2l1O3EwbOACabcwY1nS3FzYUyWsVrs4vR
	LK/CcA/bGxqbJ3zwLlyMPcniIX9E9wspiGKSm6eBRNa/B0UIfAnM1ZW8
X-Gm-Gg: AYBFou11j46Lgz9i4KXX0DT5wKF0o7adefX48gV5zyqF5WoK/PU4dFeXEjp+6yBGdYb
	FjcbX9ldLVnrxa4yhOSe1FDofZ25eLNKLRivOYKNv14A4MVSwXVsCSqYwLp5pqo7VG8WLCyFSJ3
	SJ3frv8HT0nJIPjqEFdk0/mj3vDjz0VUOBUOrvTfPsH4jxzMrNJzfywtmFEeET4Mdxe2/yX2yeO
	v2F41Ala8oOwk0mLTNApTZbK6V4GwcqEn+IDzXpShE32C/q44fZwNxjgjOJmUOWsXKdNKkwF1iy
	h8EPW+k48hLIiWK1fWTc29S7vQZrm7siD6DwCmJgYkubMApKW8zJOovtJD84h0L1bBtdlWOswVn
	wL+YvbFN5LU2OSuDORhmU09aBqaZpGB62AAu1DBVDsdxBBGO5sROAly6ByUjdAlG57Yd78e3TX4
	yY3zYnbot6Uwa61hq2OciKXqzOJfNeq6ZOuwhJc/MccQ4eGlmQbWC3aRw/ivnnlB+C3mAy9Tzg2
	0NSCPFGjSCb
X-Received: by 2002:a17:90b:2d0c:b0:39e:6c6a:208f with SMTP id 98e67ed59e1d1-39e6c6a2272mr3466876a91.48.1789831380501;
        Sat, 19 Sep 2026 08:23:00 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0309d5760sm326230a91.4.2026.09.19.08.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 08:22:59 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v5 0/3] exfat: speed up file creation in large directories
Date: Sat, 19 Sep 2026 23:22:37 +0800
Message-Id: <20260919152240.1507914-1-anmuxixixi@gmail.com>
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

 fs/exfat/dir.c      | 293 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  28 ++++-
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |  86 +++++++++++--
 fs/exfat/super.c    |   9 ++
 5 files changed, 408 insertions(+), 9 deletions(-)

-- 
2.34.1
