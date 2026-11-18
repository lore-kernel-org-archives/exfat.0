Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967103;
	b=A2bq22JVZuHXyGAvDDsf6qZv0eSPz1ZaaXxP06CO789ShhvWg7UKiVpwFJ9RERJcc1Wr
	 U6DqcbHqJmTx5V8wT+srOFmoBIYklVvfTJRi9qYaVaOi6bxvHzuv7cxCkfX5CGYUTsFVj
	 hTJ36j9kaWj4k59S7V8HYoEX6M5IEYuIo42br8ZCuxxUem1DmyZQVKtCeG9Y8Loe55cVC
	 7+2DyZwHMpIJkHyiWRkAOdVaB4dUhLLpVN4+0UIbeR1MAbCm88KXVWj1U0BdH9mmONWSP
	 RTow2sLYYxoa8y3iLc981EHlbrXUum3WX9QDqh4jbaWQjhRPI9zUxXY6w86xjeUOdkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967103;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ITUp8NIvhldWsNi8iytcAhNIizGkjNIfj+Yb6zk179c=;
	b=v4MaMpM4keUhZgCq5RejIL0jM1XoG0xRMRHBnkNaAEJvWQUab3vZEaBGl0ikZhAyYaq7
	 Yiviwhdwoj5uT0ZLXVJoXQwWxw8EXAk0FcdAhn0hQfONtfnqyLrjQrjfb7JmMtBvHv1JS
	 fPcQoowoO4pCMCIbgGqeGufYqB+U8YPU/jtzb9awWXsbHaY2FbZyk3cXtEahR06dxnK4d
	 JNxyP9zbQFzQSiKV9jBn+d2MvZ2GHHs7yhXw8LnRm3/vGdmdjfdqAxHKVnA3Nn9I4oDNk
	 DHYXScrL+CgTNzoH9T3s7sgxWWTL/vZH6eZB9MjakNH17P7XZj+6GMa5YtGGR/QFmXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pfbPMQeu;
	arc=none smtp.remote-ip=95.215.58.139
Received: from mta1.migadu.com (out-139.mta1.migadu.com [95.215.58.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8423A606A31C
	for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 01:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8423A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pfbPMQeu
X-Envelope-To: exfat@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=YP2d+xxYOufR4KpdbNEU0c25RfRJ3bUPYwDDxUg1ss0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794967100; v=1; x=1795571900;
 b=pfbPMQeu8fmztMdKVjg4yw1xEBv1cDSP+jby47+6LCH9+3g3EdVNpvt+ZHddmB51kqo9WVkT
 lHywH4/f5ShnbmEDjtocDa9t4u7mpZvva6OtwKhMbUQ2WmOJsqWY86IBi9foPJUhR+rL03D4XXj
 utg4Dy9WrFUm7urzjVfKvJio=
X-Envelope-To: exfat@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 01de500fc65dbef3;
	Wed, 18 Nov 2026 01:58:20 +0000
X-Mizu-Trace-ID: 01de500fc65dbef3
X-Migadu-Flow: FLOW_OUT
From: Youling Tang <youling.tang@linux.dev>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>
Cc: Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@163.com>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v2] exfat: hold s_lock for cluster-chain updates in __exfat_cont_expand()
Date: Wed, 18 Nov 2026 09:58:02 +0800
Message-ID: <20261118015802.899847-1-youling.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Youling Tang <tangyouling@kylinos.cn>

__exfat_cont_expand() allocates clusters, appends them to the FAT chain
and updates ei->start_clu, ei->flags and i_blocks without holding
sbi->s_lock.  Readers such as writeback call exfat_map_cluster() with
s_lock held but without inode_lock, so they are not serialized against
the expansion and can observe the chain metadata mid-update.

Hold s_lock around the cluster allocation, chain append and i_blocks
update.  This nests inside the invalidate_lock held by
exfat_cont_expand(), matching the order used by exfat_truncate().  i_size
is published via exfat_pagecache_isize_extended(), which takes the
straddling folio lock; since writeback takes folio lock -> s_lock, this
must happen after s_lock is released to avoid inverting the lock order.
i_blocks is therefore updated first, under s_lock, which also ensures a
reader never sees i_size beyond the allocated chain.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
v2: rebase onto exfat/dev and adapt to __exfat_cont_expand().

 fs/exfat/file.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 9dfd99ad9265..c7991e98a07a 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -105,6 +105,7 @@ static int __exfat_cont_expand(struct inode *inode, loff_t size)
 	if (ret)
 		return ret;
 
+	mutex_lock(&sbi->s_lock);
 	num_clusters = exfat_bytes_to_cluster(sbi, exfat_ondisk_size(inode));
 	/* integer overflow is already checked in inode_newsize_ok(). */
 	new_num_clusters = exfat_bytes_to_cluster_round_up(sbi, size);
@@ -116,7 +117,7 @@ static int __exfat_cont_expand(struct inode *inode, loff_t size)
 		exfat_chain_set(&clu, ei->start_clu, num_clusters, ei->flags);
 		ret = exfat_find_last_cluster(sb, &clu, &last_clu);
 		if (ret)
-			return ret;
+			goto unlock;
 
 		clu.dir = last_clu + 1;
 	} else {
@@ -130,7 +131,7 @@ static int __exfat_cont_expand(struct inode *inode, loff_t size)
 	ret = exfat_alloc_cluster(inode, new_num_clusters - num_clusters,
 			&clu, inode_needs_sync(inode), false);
 	if (ret)
-		return ret;
+		goto unlock;
 
 	/* Append new clusters to chain */
 	if (num_clusters) {
@@ -147,15 +148,19 @@ static int __exfat_cont_expand(struct inode *inode, loff_t size)
 	ei->flags = clu.flags;
 
 out:
+	inode->i_blocks = round_up(size, sbi->cluster_size) >> 9;
 	inode_set_mtime_to_ts(inode, inode_set_ctime_current(inode));
+	mutex_unlock(&sbi->s_lock);
+
 	/*
 	 * When extending file size, call exfat_pagecache_isize_extended()
 	 * to update i_size and ensure the straddling folio is properly
 	 * marked RO so page_mkwrite() is called and post-EOF area is zeroed.
+	 *
+	 * It takes the folio lock; call it without s_lock (writeback uses
+	 * folio lock -> s_lock).
 	 */
 	exfat_pagecache_isize_extended(inode, oldsize, size);
-
-	inode->i_blocks = round_up(size, sbi->cluster_size) >> 9;
 	mark_inode_dirty(inode);
 
 	if (IS_SYNC(inode))
@@ -165,7 +170,10 @@ static int __exfat_cont_expand(struct inode *inode, loff_t size)
 
 free_clu:
 	exfat_free_cluster(inode, &clu);
-	return -EIO;
+	ret = -EIO;
+unlock:
+	mutex_unlock(&sbi->s_lock);
+	return ret;
 }
 
 static int exfat_cont_expand(struct inode *inode, loff_t size)
-- 
2.43.0

