Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB33370D6D
	for <exfat@lists.linux.dev>; Sun, 27 Sep 2026 08:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496261; cv=none; b=POlMx7R4juGviUs7PeQuiZHU6GKH8lTjukzZVffWHLn0PmSh7HvJZy2UWXGTwwMe3gOnw5tbmy78Pez3NaOycTwVfyv4PAilA1+N+r1Jr2mFHRCUN3SJCGZPFhrjkSVEdcv2MZ0mwcOt71wIwH50FYE9brGAAY8lD1/fuNC01jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496261; c=relaxed/simple;
	bh=SbtIRR21/c11KTsXvSDZlPJ5WjrW7xSLoOk2lbW4Ljw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZzO8Nqcoyf5P69k9fjnuO6zyyd4iDoGN+KF9wYxydAO1I3IM5eYFExGf8Jeo0o7zBzvkIqxU+WsBTu5N0DA5+8oQtIhdQlLiZD/rb0tJVs8rJQM7Sdl6CpEgeBSdtk/nYkuACZRe8gEPRxV882+g3GNXbMr5eM+DgZU3qfo4TKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T9ma12Ce; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T9ma12Ce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=h+
	jBEtt+Uycrx/t7AgF6SWV6Qx/Q9OzXsZBdC6utnHw=; b=T9ma12Cehe5SrcP3Pa
	qoAtLkGqsIkx3BHO56JAlNxO280Hr2MxEb9fBe3e46Tcd8pEXKip35KB5BMZDX2j
	HRAK23caGo+MohaNd8MflOOSRVUFHC9OqE2xctqxbbclPmdYwZjWsUZMCAUTuH7l
	UlsnsP3QqfQ+iwn1DtjLEAPZQ=
Received: from czl-pc (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXrkXNzbhqECuNBg--.31472S2;
	Sun, 27 Sep 2026 16:03:26 +0800 (CST)
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
Subject: [PATCH v1 0/5] exfat: fix valid_size handling and locking
Date: Sun, 27 Sep 2026 16:02:59 +0800
Message-ID: <20260927080305.831641-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgBXrkXNzbhqECuNBg--.31472S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF45JrWUAF4xZr15AFyxXwb_yoW8Aw4fpa
	9Ik3W3GrWjy34fur1fZ3W8Xa45uw1fWr13Gr9xt348ArnIkr1Fvr1UKayI9rWUt3s7tw12
	vw1qqrW8G3ZrGr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjQ6JUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9w9vDWq4zc+H4gAA3v

From: Chi Zhiling <chizhiling@kylinos.cn>

valid_size marks the on-disk up-to-date region of an exFAT file. It is
advanced from the write path, from read/zeroing completion, and via
truncate, while it is read without i_rwsem from ->iomap_begin and from bio
completion context. This series fixes several races and stale-data windows
that follow from that split ownership.

Patches 1-2 are self-contained fixes: an append write may be moved to EOF
by generic_write_checks(), so valid_size must be advanced using the
recalculated position; and exfat_zero_new_range() must mark non-uptodate
pages dirty so the whole page is written back.

Patches 3-4 are prerequisites for patch 5: truncate now holds the
invalidate lock so it is mutually exclusive with mmap writes, and
valid_size/zeroed_size become atomic so they can be read safely outside
i_rwsem. Patch 5 then takes exfat_page_mkwrite() out from under i_rwsem,
since blocking on the inode lock under mmap_lock could deadlock and its
VM_FAULT_RETRY result is not honored, and advances valid_size under the
folio lock to keep the page cache and valid_size consistent.

Link: https://lore.kernel.org/exfat/10029d6f-13cc-4d17-a2f9-b093a8339dde@163.com/T/#t

Chi Zhiling (5):
  exfat: advance valid_size to EOF for append writes
  exfat: dirty all new pages when extending valid_size
  exfat: hold the invalidate lock while truncating
  exfat: make valid_size and zeroed_size atomic
  exfat: use folio lock to protect valid_size

 fs/exfat/exfat_fs.h |  60 ++++++++++++++-
 fs/exfat/file.c     | 183 ++++++++++++++++----------------------------
 fs/exfat/inode.c    |  16 ++--
 fs/exfat/iomap.c    |  36 ++++++---
 fs/exfat/iomap.h    |   1 +
 fs/exfat/namei.c    |   4 +-
 6 files changed, 160 insertions(+), 140 deletions(-)

-- 
2.53.0

