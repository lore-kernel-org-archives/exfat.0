Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C215920E023
	for <exfat@lists.linux.dev>; Sun,  4 Oct 2026 02:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791082789; cv=none; b=Xds4odys1/sTOj0kY7oJELfLgpaaoSLFV1kBgWnp+d27vzv+U/1oiBd7My5FlkB4BWRXHk+zKBFrZaoH/GP6DpqM2FVh9B3TmS+byQ3Z6MDHRfzrSquiF72s4hJOn2dvjy60tAQcEE6RCcSGwQP1f2pv0v6LMeBIeUdPa7W1hC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791082789; c=relaxed/simple;
	bh=DQEGPL0sJiIevbEEl6cXB0XP/D9IVuBPPkikZMTbS4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dZdhrML4ZSAwZVHOdKuNxDX35jZBs5PL2BpAkq6P0piB4cU6bFIwSb2d7VtBZ7JZPmCP2CGepjv1QLvxKM+PS3gdp9gR68LOaZvCizBTsrFPP5Sv2XbbgJpvzFd9oHVXDATpB0U0Fr13UPAkQoa45Qy06Q7kY2iJ7YnRQhpkYQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hjLZq+Qh; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hjLZq+Qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=EL
	F5A/GLLBvIP+UWXVTG79PIal5/PwJaYOFeHUDKhCo=; b=hjLZq+Qhm1UmNXPgEt
	REcdGtgogoN+TUiZ0rin7LoJTwSpl8DjO98hrZ0agVMQ2v+yHpmvbgy7KpdBmYMW
	/LtDPmYHdEH4ZAkE/ycib7VGt/3qKnzYbDyOi74mBWvgpzRdHcNWRJqmF6XvvQzJ
	nZF9beIVkoglZwEwJqqlgm9rw=
Received: from czl-pc (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgB3HLn9wMFqhREUCg--.6715S2;
	Sun, 04 Oct 2026 10:59:09 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH 0/4] exfat: fix VDL tracking bugs
Date: Sun,  4 Oct 2026 10:59:03 +0800
Message-ID: <20261004025907.1899933-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgB3HLn9wMFqhREUCg--.6715S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr15ur47Kw1rJw1UuFyDJrb_yoW8AFWUpa
	y3K3WfGrWDK34xZryfZw1rt3WY9w1fXr17Wr93t348ArnIkrn7AFWjqFWFg3y5t3s3G3W2
	qF4qqFWrKFnrGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UWv35UUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3B96GGrBwP-wlQAA3Q

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

Chi Zhiling (4):
  exfat: advance valid_size to EOF for append writes
  exfat: hold the invalidate lock while truncating
  exfat: dirty all new pages when extending valid_size
  exfat: make valid_size and zeroed_size atomic

 fs/exfat/exfat_fs.h |  60 +++++++++++++++++-
 fs/exfat/file.c     | 144 ++++++++++++++------------------------------
 fs/exfat/inode.c    |  16 ++---
 fs/exfat/iomap.c    |  20 +++---
 fs/exfat/namei.c    |   4 +-
 5 files changed, 123 insertions(+), 121 deletions(-)


base-commit: 216426aff8f69379f03337857551ca0ed3190361
-- 
2.53.0

