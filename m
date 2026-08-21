Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAEB39B954
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306779; cv=none; b=lAInSKLEQOfGgpjAlMbnQe/Kb/WuypXUgwU5pJ5aNd96fy+LhDFyCMt6eH4CD3fYEZRWSurZLNAWl+HSpwWvxzjljmG48YJxFEjmzqRRwwH07tuvbGHix6hm4z5tlaSbd8To+Rj0zzQmvjsNU7kPkHs4YAqbX43Ky+8R+0Y6pyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306779; c=relaxed/simple;
	bh=VlYmAMAi/xPlzst7Nc4OZ9kb62wGsySceWS4p+6Dxow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WtlBBVLlgL/CcFW3vGil5QEVNB5KtgVdaKAyiJ7EGIH+j22KmIhx4leX3/tVWRwYWTWHTsoV5jWLnBNcjhiQjpIiFxwNQcQkkS0xQkB7dNLJhdTPlCmev42755qg0FOMG8WxdZec6bK2G1DSiOuTBnggjRZy1iPIXO9zI/6b5M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Rsj4NfW9; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Rsj4NfW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=+X
	WjbaraU/0TASAxInfKizYTBTS4rybQwLzEQECHPk8=; b=Rsj4NfW9gmKMBa4CtY
	sNWHJkxi5MTMOJ24Hl1x8aIUt+09ssZLQliUmtd7Fo6f3GiNHxPc0Agt0nEbB23x
	HHrOCu3vx9fY6UX9P57vOlulHX1uU+oDdJv5Kt3Mp9kzwGYA09O/mKMomEGtrChr
	1xx+9Q9evYv+CiTX4SdooCd0g=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCX0Fr7Iohq8umKRA--.44781S2;
	Fri, 21 Aug 2026 18:05:48 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [RFC PATCH 0/6] exfat: take s_lock in read mode for iomap mapping paths
Date: Fri, 21 Aug 2026 18:05:25 +0800
Message-ID: <20260821100531.998196-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCX0Fr7Iohq8umKRA--.44781S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryUJFy8ur45Kw13CF1fXrb_yoW8ZFW3pF
	W3Gw43Xr4UXa43Xrn3Cr4jqa45Ca1fKay7Xw13tw1xZws8Ar1S9FW8tF18tFyUJ348WF1a
	qF4YvryUWFsxur7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnzVbUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2x2EImqIIv3BIQAA39

From: Chi Zhiling <chizhiling@kylinos.cn>

The iomap mapping paths currently serialize all inode mappings on the
sbi->s_lock mutex. This series converts it to an rw_semaphore and takes
it in read mode on the mapping paths so that mappings of distinct inodes
proceed in parallel. The preceding patches make the paths safe to run
concurrently: bitmap_lock covers the allocation state, atomic bit ops
cover the volume dirty flag, and the FAT2 mirror copy is serialized
against writeback.

Same-inode access stays serialized by the exclusive inode_lock; writeback
does not hold it but is safe because truncate flushes and truncates the
page cache first and cannot run concurrently with writeback. The lock
ordering (inode_lock -> s_lock -> bitmap_lock) is unchanged, so no new
deadlock scenarios are introduced.

A per-inode read-write lock was also considered, but its implementation
turned out to be considerably more complex, so this series relaxes the
existing s_lock instead. Any suggestions on that approach are welcome.

The series passes the xfstests exfat suite. In Unixbench, the fstime-w
score improved from 3977196.8 to 4746349.6 (~+19%). Any comments and
suggestions are welcome.

Chi Zhiling (6):
  exfat: remove dead hint_bmap updates in I/O and truncate paths
  exfat: take bitmap_lock at the start of exfat_alloc_cluster()
  exfat: use atomic bit ops for volume dirty flag
  exfat: lock FAT2 buffer while copying mirrored FAT entries
  exfat: convert s_lock mutex to rw_semaphore using write lock
  exfat: take s_lock in read mode for iomap mapping paths

 fs/exfat/dir.c       | 14 +++++++-------
 fs/exfat/exfat_fs.h  |  5 ++---
 fs/exfat/exfat_raw.h |  4 ++--
 fs/exfat/fatent.c    | 20 +++++++++++++-------
 fs/exfat/file.c      |  8 ++------
 fs/exfat/inode.c     | 15 +++++----------
 fs/exfat/iomap.c     |  4 ++--
 fs/exfat/namei.c     | 26 +++++++++++++-------------
 fs/exfat/super.c     | 42 +++++++++++++++++++++---------------------
 9 files changed, 67 insertions(+), 71 deletions(-)

-- 
2.53.0

