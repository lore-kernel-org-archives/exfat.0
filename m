Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE3B2AD35
	for <exfat@lists.linux.dev>; Sat,  3 Oct 2026 03:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790998288; cv=none; b=TFTytJf89czVjfY2yr1KvrJAc2D1dgxn+95HviljghXu5GOIe9G3tgG1K9gKnJn7HKv0LqTj5urQDM0H43bdMdVZ041MmEbIKYVfuq/4ScWHHrPI8ykuPW3eT+w6Mff/NY4QGUIPuVdPIT1uLW52758lLFEGnUGX6aG6hGJqrrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790998288; c=relaxed/simple;
	bh=CrX3AGucEnZgu4U8omznNMPekAJYbuNgCrfdqhONyF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MKIBmtHgk8TncrnXUY8WHdcg52m4pDRjIgPd8lgzoM8B5cBgq5aOTsul4byQ+X9b1+ci3eVdBZx9jYFM3nB5b6UxGhEbw2V8LjFCj3QRaOajbx0YS0wSDe0hJhbgVbs9a3fuGTgw0bT3JPwJUGFbVUuab5Lmp2mGOf7A+dOsklI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Mc7L07Kq; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Mc7L07Kq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=6p
	YKceQcqMOS05tuaHL7k+OTrHpfnfXwj+RFhbLwTGs=; b=Mc7L07Kq5RIQg5mxpc
	5iHf9pM36IQYwNJejrnGXWAPz8g6sA9lON/E0HUOgJrE/I8gvSw/hxtNoclzB5qI
	kHIvrs0hwoQY0gAUx6S8kpO28/KxNdl2vlWpEQXG8AyW95e78IspIE1VDIuP0bdt
	oJBRzmbLokulm/NHxjD1X2uIA=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCXTnLfdsBqOdNwCA--.32914S2;
	Sat, 03 Oct 2026 11:30:41 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	chenxiaosong@chenxiaosong.com,
	dxdt@dev.snart.me,
	hyc.lee@gmail.com,
	linkinjeon@kernel.org,
	liubaolin12138@163.com,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 0/7] exfat: fix valid_size handling and locking
Date: Sat,  3 Oct 2026 11:30:25 +0800
Message-ID: <20261003033032.1775311-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXTnLfdsBqOdNwCA--.32914S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryUKF4fGw1xZw43Xr4xJFb_yoW8Xr18p3
	9Ik3WfWrWYy34fZr1Syw1rJa45uw1rXFy3WrnxJ34rAryavr18Aa1Ig3yxWrWUt3s3Kw1U
	tw1DJF18KFnrC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjPfdUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3AOgPmrAduOPAQAA3w

From: Chi Zhiling <chizhiling@kylinos.cn>

valid_size marks the on-disk up-to-date (VDL) region of an exFAT file.
Data below it is valid; data at or above it is a hole that reads
zero-fill, so valid_size must be advanced in the window where the data
actually becomes valid.

Patches 1-3 fix the standalone bugs (append offset, truncate vs mmap
locking, dirtying of newly zeroed pages), patch 4 makes valid_size and
zeroed_size monotonic atomic counters as a prerequisite, and patches 5-7
advance valid_size under the folio lock and drop i_rwsem from
->page_mkwrite.

Link: https://lore.kernel.org/exfat/10029d6f-13cc-4d17-a2f9-b093a8339dde/T/#t

V1: https://lore.kernel.org/exfat/59056131-e3bd-4003-8c30-0a356cf0bd82@163.com/

Chi Zhiling (7):
  exfat: advance valid_size to EOF for append writes
  exfat: hold the invalidate lock while truncating
  exfat: dirty all new pages when extending valid_size
  exfat: make valid_size and zeroed_size atomic
  exfat: publish valid_size under the folio lock for buffered writes
  exfat: advance valid_size while zeroing new ranges
  exfat: drop i_rwsem from exfat_page_mkwrite

 fs/exfat/exfat_fs.h |  60 +++++++++++++++-
 fs/exfat/file.c     | 166 +++++++++++++++-----------------------------
 fs/exfat/inode.c    |  16 +++--
 fs/exfat/iomap.c    |  36 +++++++---
 fs/exfat/iomap.h    |   1 +
 fs/exfat/namei.c    |   4 +-
 6 files changed, 151 insertions(+), 132 deletions(-)

-- 
2.53.0

