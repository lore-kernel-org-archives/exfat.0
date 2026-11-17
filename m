Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895285;
	b=j4qHHO+YlZQfCmo3a7bGFEbP46rV7IrdKBaWdkC0RuTEnEoTki5EWa50DI5hdgrJQw9U
	 2hPygMuPSBJAwSmnlMDy4Y4FqdQh970H6sp4CoVCKB9WyRpcbZAedW3f2KFqhrpV661iP
	 W1VV+is7rrWaTGO9kbrEXVSKoL/enk5njsyS7DjCiMIMlx6fVCRB0R+VeQcDoy3RhuVKK
	 +o8zNasc7PhenEXsIXyWBriKBc6h/fydEJBZ3AH61XdALw6qN5+umaJO2ODGP6dd2pl/Y
	 3xOq8kACkg0GDS0AARyctsOQorjQNTR57bPfH/zhwwg/VaqqjJvyo2lraWwDZgHjyew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895285;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jpD36F91Y9IfdiFgh+/Lwnl5mIj+NvYpPUDqUPGnUgY=;
	b=be5BLYa4bAZonSHkis9uAFPPKY6lONjUbrdu2ZT9R8YI8YtgaCt8UVlkqBpuTzwtcuDF
	 /DEDoJmvObXmdG7Yr54SgZO8e/DrJrcL9ockD/QvXIAeLuTd1Djglisv55eNoL6EGLutz
	 dFHxLJuvBdRelwcx11Sd7IrDVwjzhksQuWwQoKoGmfiZMDDzdJLt6b1VyCx86GkvyOeEY
	 ViSW3mqc6IJx/DK2f6Z6/LcwRPfYtI0sfsE0kuBLqOFW33MLjf67EZP0pM4QdrhzLjhv1
	 4QPlf+fEqJcTam7GkRfv9Q+qR2FYXpnWb1vsCcvJusrw5VRmygCnJEoA+6kyLIfL22A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PrbgTbDz;
	arc=none smtp.remote-ip=91.218.175.243
Received: from mta0.migadu.com (out-243.mta0.migadu.com [91.218.175.243])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B12606A31C
	for <exfat@lists.linux.dev>; Tue, 17 Nov 2026 06:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B12606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PrbgTbDz
X-Envelope-To: exfat@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=82NUFJ1X4NDA1qOTuvJUv8iUvdArPHmXkqAjokjhNOg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794895282; v=1; x=1795500082;
 b=PrbgTbDzz0ufL7DVXUrrCXunjVFpS/q23xOHAbuItacnAUkyycKj4FIbe6/e/VR0/V8MHE/z
 1eKUeh/xeI1LkX+tEckIhz3pzky/ZJhZybY+XQ5X2sDr45as/cOXXX0PMYRN2IMB4CCSDdXWwLF
 pa0WGbAQ8iw2kk7WWQwOZGIM=
X-Envelope-To: exfat@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 62e7e980c127810b;
	Tue, 17 Nov 2026 06:01:22 +0000
X-Mizu-Trace-ID: 62e7e980c127810b
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
Subject: [PATCH] exfat: hold s_lock for cluster-chain updates in exfat_cont_expand()
Date: Tue, 17 Nov 2026 14:00:55 +0800
Message-ID: <20261117060055.341277-1-youling.tang@linux.dev>
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

exfat_cont_expand() allocates clusters, appends them to the FAT chain
and updates ei->start_clu, ei->flags and i_blocks without holding
sbi->s_lock.  Readers such as writeback call exfat_map_cluster() with
s_lock held but without inode_lock, so they are not serialized against
cont_expand() and can observe the chain metadata mid-update.

Hold s_lock around the cluster allocation, chain append and i_blocks
update.  i_size is published via exfat_pagecache_isize_extended(), which
takes the straddling folio lock; since writeback takes folio lock ->
s_lock, this must happen after s_lock is released to avoid inverting the
lock order.  i_blocks is therefore updated first, under s_lock, which
also ensures a reader never sees i_size beyond the allocated chain.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 fs/exfat/file.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 435bbef288b8..de335c278caf 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -95,6 +95,7 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
 	if (ret)
 		return ret;
 
+	mutex_lock(&sbi->s_lock);
 	num_clusters = exfat_bytes_to_cluster(sbi, exfat_ondisk_size(inode));
 	/* integer overflow is already checked in inode_newsize_ok(). */
 	new_num_clusters = exfat_bytes_to_cluster_round_up(sbi, size);
@@ -106,7 +107,7 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
 		exfat_chain_set(&clu, ei->start_clu, num_clusters, ei->flags);
 		ret = exfat_find_last_cluster(sb, &clu, &last_clu);
 		if (ret)
-			return ret;
+			goto unlock;
 
 		clu.dir = last_clu + 1;
 	} else {
@@ -120,7 +121,7 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
 	ret = exfat_alloc_cluster(inode, new_num_clusters - num_clusters,
 			&clu, inode_needs_sync(inode), false);
 	if (ret)
-		return ret;
+		goto unlock;
 
 	/* Append new clusters to chain */
 	if (num_clusters) {
@@ -137,15 +138,20 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
 	ei->flags = clu.flags;
 
 out:
+	/* Update i_blocks before i_size so mappings never exceed the chain. */
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
@@ -155,7 +161,10 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
 
 free_clu:
 	exfat_free_cluster(inode, &clu);
-	return -EIO;
+	ret = -EIO;
+unlock:
+	mutex_unlock(&sbi->s_lock);
+	return ret;
 }
 
 /*
-- 
2.43.0

