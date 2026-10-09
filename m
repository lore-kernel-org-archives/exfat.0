Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0830049D5A8
	for <exfat@lists.linux.dev>; Fri,  9 Oct 2026 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538917; cv=none; b=u61fkt0NJN0SrbkaPn+Bg/BOgcR9od2D/XnAwyQpI5WgtJ5oejtZd9OeWuYu9dlKq2c446FxsG2IIgzObZMqkLKhl61cquY7nSikgtOK71X64I3nGXMRWZXFeKTnRjRKGi1zI6jAh8Zmtk5PRuwVYb9yVhAozgCLvgrrxUyqf7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538917; c=relaxed/simple;
	bh=V+j+Anp8GyyWs81jNLTLZD14njbyzPBqJ1PR3EV0DOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p8pNiYlsjWEEYSUAsnvxkCfBcmAg1PlCIzyfAXbLkHlYw5nvV2iLJMKkRReB9wSyt+e2uZd3Q2pRPEcQoyiAYSORCUyhAipeeGIntPufmLwUs011GxaCEUxU/sLF4C4/3F/iFsaLSPyADoV9iX6CpmFjenHgqayd0Lh+lJ3g9hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=q80Z6uVA; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="q80Z6uVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1791538904; x=1823074904;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rAjwrtbHwf7nrpLFc+O0gQY1kNWsu+pqV/BPaBmEek0=;
  b=q80Z6uVAWkevpBvpMLGOXGdCMXPMcxWINI1Fzy7RAjVpJwjH4RzE+cFf
   rRIeAGTl69Uapaka0rOXYK97r228edfP7I9nDBCjhvqgCCJp38lSbjWsb
   AN9AgK6K6KwD4Un3EbzH02WqaJa502cXiRuyLKHTl0y+l8BUsBwz40CkW
   IFqUevvAUC7qqLXdSqH6wNzwkV/pn2S+CS4Uv/pmDA7hKpMeoGboZPvPO
   XkxRwLpj/GrblrppmIclq+1/HaB8pIxiA3KeMkusFJXHl8MQ0YgwGcn+f
   gnu+oPAjryx7uu4iBGRCF6qlPwu1DaYXpf4s1g1/5CsJLctwTDmxc7nCj
   Q==;
X-CSE-ConnectionGUID: 7GHiDs+5TT+31tC2/Rv9/A==
X-CSE-MsgGUID: GaQ6gpmnQZ6fIdR4id+cYQ==
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Oct 2026 18:31:35 +0900
X-CSE-ConnectionGUID: O8kf2ZvmTvqe58NpQlJ0RQ==
X-CSE-MsgGUID: wY+UZJhQT2+YOwZ44SLY+g==
X-IronPort-AV: E=Sophos;i="6.27,148,1786978800"; 
   d="scan'208";a="71293994"
Received: from unknown (HELO cscsh-7000014390..) ([43.82.111.225])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP; 09 Oct 2026 18:31:34 +0900
From: Yuezhang Mo <Yuezhang.Mo@sony.com>
To: exfat@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com,
	dxdt@dev.snart.me,
	Yuezhang Mo <Yuezhang.Mo@sony.com>
Subject: [PATCH v2] exfat: mark straddling folio RO and zero the post-EOF range
Date: Fri,  9 Oct 2026 17:30:22 +0800
Message-ID: <20261009093020.1018892-3-Yuezhang.Mo@sony.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When extending a file across a non-page-aligned EOF, the folio
containing the old EOF must be marked RO so that subsequent mmap
writes trigger ->page_mkwrite() and update valid_size.

The straddling folio remains mapped to the same filesystem block
after the file is extended. As a result, the existing writable PTE
may remain in place, allowing mmap writes to bypass ->page_mkwrite()
and leave valid_size unchanged.

Furthermore, writes to the post-EOF range may occur between
truncate_pagecache() and locking the folio, so the post-EOF range
should be zeroed after marking the straddling folio RO.

Introduce exfat_pagecache_isize_extended() to mark the straddling
folio RO and zero the post-EOF range after clearing writable mapping.
This ensures that data written beyond the old EOF before the extension
is not exposed as valid file data, and that subsequent mmap writes
trigger ->page_mkwrite() to update valid_size.

Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
Signed-off-by: Yuezhang Mo <Yuezhang.Mo@sony.com>
---

v1: https://lore.kernel.org/all/20260930104332.4022207-2-Yuezhang.Mo@sony.com/

 fs/exfat/file.c | 60 +++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 7 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index d24f0650bfc88..ffc49eab77fe5 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -17,11 +17,59 @@
 #include <linux/fileattr.h>
 #include <linux/iomap.h>
 #include <linux/pagemap.h>
+#include <linux/rmap.h>
 
 #include "exfat_raw.h"
 #include "exfat_fs.h"
 #include "iomap.h"
 
+/*
+ * Unlike pagecache_isize_extended(), this function does not skip
+ * the straddling folio when the filesystem block size is >= PAGE_SIZE
+ * or when 'from' and 'to' fall within the same filesystem block
+ * (i.e. to <= rounded_from).
+ *
+ * exFAT needs to handle these cases to ensure that the straddling
+ * folio is marked RO and the post-EOF range is zeroed.
+ */
+static void exfat_pagecache_isize_extended(struct inode *inode, loff_t from,
+		loff_t to)
+{
+	struct folio *folio;
+
+	WARN_ON(to > inode->i_size);
+	if (!(from & (PAGE_SIZE - 1)))
+		return;
+
+	folio = filemap_lock_folio(inode->i_mapping, from >> PAGE_SHIFT);
+	/* Folio not cached? Nothing to do */
+	if (IS_ERR(folio))
+		return;
+	/*
+	 * See folio_clear_dirty_for_io() for details why folio_mark_dirty()
+	 * is needed.
+	 */
+	if (folio_mkclean(folio))
+		folio_mark_dirty(folio);
+
+	/*
+	 * The post-eof range of the folio must be zeroed before it is exposed
+	 * to the file. Writeback normally does this, but since i_size has been
+	 * increased we handle it here.
+	 */
+	if (folio_test_dirty(folio)) {
+		unsigned int offset, end;
+
+		offset = from - folio_pos(folio);
+		end = min_t(unsigned int, to - folio_pos(folio),
+			    folio_size(folio));
+		folio_zero_segment(folio, offset, end);
+	}
+
+	folio_unlock(folio);
+	folio_put(folio);
+}
+
 static int exfat_cont_expand(struct inode *inode, loff_t size)
 {
 	int ret;
@@ -32,8 +80,6 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
 	struct exfat_chain clu;
 	loff_t oldsize = i_size_read(inode);
 
-	truncate_pagecache(inode, oldsize);
-
 	ret = inode_newsize_ok(inode, size);
 	if (ret)
 		return ret;
@@ -84,12 +130,12 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
 	/* Expanded range not zeroed, do not update valid_size */
 	i_size_write(inode, size);
 	/*
-	 * When extending file size, call truncate_pagecache() first,
-	 * then update i_size, and call pagecache_isize_extended()
-	 * to ensures the straddling folio is properly marked RO so
-	 * page_mkwrite() is called and post-EOF area is zeroed.
+	 * When extending file size, call exfat_pagecache_isize_extended()
+	 * after updating i_size to ensures the straddling folio is
+	 * properly marked RO so page_mkwrite() is called and post-EOF
+	 * area is zeroed.
 	 */
-	pagecache_isize_extended(inode, oldsize, inode->i_size);
+	exfat_pagecache_isize_extended(inode, oldsize, size);
 
 	inode->i_blocks = round_up(size, sbi->cluster_size) >> 9;
 	mark_inode_dirty(inode);
-- 
2.43.0

