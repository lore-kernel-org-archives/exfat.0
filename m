Received: from jpms-ob02-os7.noc.sony.co.jp (jpms-ob02-os7.noc.sony.co.jp [211.125.139.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A672F4B4867
	for <exfat@lists.linux.dev>; Wed, 30 Sep 2026 10:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765700; cv=none; b=WpAVMfZnPAm960nNuAe+aplk9YqJbv1QWxF3hfUOgmLJwKzKCKvdQojYCX4QFL9tQZMxjjnXyMnYwael3Z8ZFh5hu0WvwVasjWUKnzAZd4wEypjSefYGNw+Gpf2vTt0jNk45W3vbS59cNL2xh1q7bcThCmvIloMSFhpMq7uCZKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765700; c=relaxed/simple;
	bh=M9f6BL3BIKwS06qEWRvsUeVOddfXPpWyNZ2LQfUpEks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=apr+APtwZKJ7giBXsB/q+JtvdXXPzlKR7gY00evHcNG/gzswLzrSCMRmmjED6z6R9688Ol1wVKpW6CuZ8rbhYCBIPz5rQ9tGhjwDyympnej16w+bZh8XkzVZtZofZ5v9rjOXNNdJIdUONETOdugWysK31a+Kgc81VawwPnYByi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=sKBdYQ1c; arc=none smtp.client-ip=211.125.139.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="sKBdYQ1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1790765693; x=1822301693;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pD/q+MNX5kFxSsXpUE+Q60a0j5CpSIlDJd2jT1oUFCM=;
  b=sKBdYQ1cNpQN9rVnPy65320eYcqF2+cZqOkVkMQW/xP/c+G4Y4GAojfx
   8Ks7+ezjmeUUumrk2o33/oAXmQSFbKx4ndSvhNWQ6eqcCaQis7vs1LRUY
   RlHu043A+w7036GYZqJpNyh2QAiub8S5B0f+T7JnvGMVe55fK8Ek70nV+
   18oHeKaBBAD1v+HYtOrXRko34+xiTW6D79R/v+ppClSDh1MNVVo9xJ07g
   Wo1kf+tZcfeJL3KjdAmqpSEkurN0lM/7U/AUBvcIGsMnJT2+I9vLSQuxg
   WIpJ22CFkIlWuFAB46hG3Aom3uS/4U6j1EPB6edytgsavRwtmXnI4XTYi
   Q==;
X-CSE-ConnectionGUID: G6CqKkXtSEG8Y8j8sua+Sg==
X-CSE-MsgGUID: INj7lixRRAaYRggAIQj3Jw==
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 30 Sep 2026 19:44:42 +0900
X-CSE-ConnectionGUID: Iq9fMEkFTJqVBeDmszgO4g==
X-CSE-MsgGUID: /qy11t9OQxubzPlVGYcI4w==
X-IronPort-AV: E=Sophos;i="6.27,132,1786978800"; 
   d="scan'208";a="70395633"
Received: from unknown (HELO cscsh-7000014390..) ([43.82.111.225])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP; 30 Sep 2026 19:44:42 +0900
From: Yuezhang Mo <Yuezhang.Mo@sony.com>
To: exfat@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com,
	dxdt@dev.snart.me,
	Yuezhang Mo <Yuezhang.Mo@sony.com>
Subject: [PATCH v1] exfat: mark straddling folio RO for 4K block size
Date: Wed, 30 Sep 2026 18:43:33 +0800
Message-ID: <20260930104332.4022207-2-Yuezhang.Mo@sony.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The maximum file system block size supported by exFAT is 4096 bytes.
When extending a file whose EOF is not page aligned, the straddling
folio must be marked RO so that a subsequent mmap write can trigger
->page_mkwrite() and extend the valid data size.

This is normally handled by pagecache_isize_extended(), which marks
the straddling folio RO when the filesystem block size is smaller
than 4K. However, pagecache_isize_extended() returns early when the
filesystem block size is PAGE_SIZE:

    if (from >= to || bsize >= PAGE_SIZE)
        return;

As a result, on an exFAT filesystem with a 4K block size, the PTE
for the straddling folio remains writable after a file extension.
A subsequent mmap write operation that modifies the straddling folio
beyond the old EOF, will not trigger ->page_mkwrite(), leaving
valid_size unchanged.

This was found by running xfstests generic/030 on a block device with
a 4096-byte sector size: the test fails without this fix and passes
with it.

Fix this by marking the straddling folio RO in exfat_cont_expand()
when the filesystem block size is 4K and the old EOF is not page
aligned. This mirrors what pagecache_isize_extended() does for smaller
filesystem block sizes.

Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
Signed-off-by: Yuezhang Mo <Yuezhang.Mo@sony.com>
---
 fs/exfat/file.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index a2a9ee1a20048..390bfae3f3aa4 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -17,6 +17,7 @@
 #include <linux/fileattr.h>
 #include <linux/iomap.h>
 #include <linux/pagemap.h>
+#include <linux/rmap.h>
 
 #include "exfat_raw.h"
 #include "exfat_fs.h"
@@ -91,6 +92,20 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
 	 */
 	pagecache_isize_extended(inode, oldsize, inode->i_size);
 
+	if (i_blocksize(inode) >= PAGE_SIZE && (oldsize & (PAGE_SIZE - 1))) {
+		struct folio *folio;
+
+		folio = filemap_lock_folio(inode->i_mapping,
+				oldsize >> PAGE_SHIFT);
+		if (!IS_ERR(folio)) {
+			if (folio_mkclean(folio))
+				folio_mark_dirty(folio);
+
+			folio_unlock(folio);
+			folio_put(folio);
+		}
+	}
+
 	inode->i_blocks = round_up(size, sbi->cluster_size) >> 9;
 	mark_inode_dirty(inode);
 
-- 
2.43.0

