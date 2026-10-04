Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5E43F4835
	for <exfat@lists.linux.dev>; Sun,  4 Oct 2026 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109223; cv=none; b=ZmXW1ozezdzSOst4ePLdK4MyU6Ub2cPmfhD6Adm2gPLNyhGAz41ldtNqv3fm18aYo5XRgjagmIP81KGa8w0UjJB2K7IgXgjJ1Zejp9A3fAFLFuEkjyG5rl8YUWfFMQTjao1BT6aJj1NcxbLsOfBBkIjiJXUiYnpdPmmAhePHpFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109223; c=relaxed/simple;
	bh=CrUpV4Po0EeWIACrkZem110RME0jXVbE3nTwfdvsvbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CE3nfqcn6vS7fmeunC8wBPPt3brdekOBiNU0ZtIcml9zr4qUBCU2rl+4DBGEFH4ep/MFPzNOhdVsk1+6eIzE22YZz5U+e7czeWAEBiy9Gq4N1UxrWPJ1gJ5wR6S7kqfVzhdsVCy1xE85+LJOfq5A35HCzRsc/vKeXXNDdXcyWyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=J4qgWIQH; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="J4qgWIQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dh
	EyjVmJU9T5SUUQGBPxLZjCqpzghX3Uf9k7KFvl5QE=; b=J4qgWIQHOc5mhWL21U
	dMo5idnyDNCn+YEdnJpx1WGq/7Q8ncF/lT0oHy9vvnLmFeUkAeYRjUej0tdT7R0m
	oZfyyTSv6yY8onfEClRfd2xMSOzX8lkbRVAMvvj1XRlmeRtcvP2u1mXUF6cYki+R
	KO+ae/CJw14VsWPqo+yWjxOfY=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3361AKMJqYRaTCQ--.22355S2;
	Sun, 04 Oct 2026 18:19:45 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 0/4] exfat: fix VDL tracking bugs
Date: Sun,  4 Oct 2026 18:19:29 +0800
Message-ID: <20261004101934.1975655-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3361AKMJqYRaTCQ--.22355S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr15ur47Kw1rJw1UuFyDJrb_yoW8AFy5pa
	9xK3WfGrWDK34xZryfuw4ft3WY9w1fXw17Wr93t348Arn0yr12yFWjqFWrK3y3t393K3W2
	qr4qqFyrGFnrC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXXoxUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9wNlA2rCKEPlPQAA3J

From: Chi Zhiling <chizhiling@kylinos.cn>

exFAT tracks a valid data length (VDL) as exfat_inode_info.valid_size:
below it is valid data, at or above it is a hole that the read paths
zero-fill.  It is read without the inode lock (->iomap_begin and the
buffered-read bio completion) and updated from the write, mmap and
truncate paths, so it must only move forward, and only once the data has
actually been copied and the folio dirtied.  This series fixes the bugs
around that invariant:

 - An O_APPEND write uses the caller's offset instead of the position
   recalculated by generic_write_checks(), so valid_size may not be
   advanced to EOF.

 - Truncate does not hold mapping->invalidate_lock, so it can race with
   an mmap write faulting a page back in for the same range.

 - exfat_zero_new_range() does not dirty non-uptodate pages, so some of
   the zeroed blocks are never written back.

Patch 4 converts valid_size and zeroed_size to monotonic atomic counters
as a prerequisite for updating valid_size from contexts that do not hold
i_rwsem.

This series was split from:
https://lore.kernel.org/exfat/20261003033032.1775311-1-chizhiling@163.com/T/#t
The other patches still need some improvement.

Changes in v2:
Rebase onto the latest dev branch.

Chi Zhiling (4):
  exfat: advance valid_size to EOF for append writes
  exfat: hold the invalidate lock while truncating
  exfat: dirty all new pages when extending valid_size
  exfat: make valid_size and zeroed_size atomic

 fs/exfat/exfat_fs.h |  60 +++++++++++++++++-
 fs/exfat/file.c     | 144 ++++++++++++++------------------------------
 fs/exfat/inode.c    |  16 ++---
 fs/exfat/iomap.c    |  27 ++++-----
 fs/exfat/namei.c    |   4 +-
 5 files changed, 127 insertions(+), 124 deletions(-)

-- 
2.53.0

