Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A908322A2E
	for <exfat@lists.linux.dev>; Mon, 17 Aug 2026 06:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786947663; cv=none; b=UOVRLbRRM6qTEE1pyS5ZixglqbgNEqu4zEdNy9kHQjA4r2J2rabTaF3IrUL/1r9JBurxPw5OypE3NOJEw+HYzBAkvAzm/rA4ALU0I2t7RCq1fA++d6qyF9KU20iEsTcx6c8pTThbAxtR/ZNGrtF80aN8ljLRYHJWUXYVOi3oax0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786947663; c=relaxed/simple;
	bh=afEqyZzIGlFpynjLFv+vUH044/DeEYBxP29i16b5pJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MhuLcQssMtTdHjhsFJoHWqDHNxDn1yf4dr18BkOZK3r74Q9aPhryPrlk14Q8Jrl29kr/HhkmtQQbT6VtS1cS24GbjHUJM6RJICyeVAFWfLJY4DOW4/X4G3Jo8vA21ivHr4xZgetKt0uIX7iINIBkqGvwmOUpy2mNlAVhA6Eb+e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aoT6gXj0; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aoT6gXj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=w0
	6RhH82O6gK2EoyujZFF9cX8EogHMKCRT3lH/hLJwY=; b=aoT6gXj0Kwm9NGHU+J
	KCgfQ0Y+YI0VU23SQ12UTEmEPCxA6i7RePib6iwPWke/jHjclWmJUtlqvXriwkjY
	LBwQVtV70OlN9tivcBLoRmQ0TExcPuNCTgXx3VsGTHar4EJcbatKotWT/FZlp18k
	c6elIDxMi9YgZzgapzS1I4NxM=
Received: from czl-pc (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3DPw7qIJqA8EeNg--.33513S2;
	Mon, 17 Aug 2026 14:20:44 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH] exfat: replace truncate_lock with inode_lock
Date: Mon, 17 Aug 2026 14:20:33 +0800
Message-ID: <20260817062033.440506-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgD3DPw7qIJqA8EeNg--.33513S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF1DAw4kWF1UKF4rCryDWrg_yoW5Gw15pw
	sxGa4rKw48Xa4qgr1kuF4DX3WYv3WfKay7J3W8ZwnFvryDAr1S9FyjyFyUZF4jqw4kWw4Y
	qFs8tr4UXrnxGrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPsqZUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2xx0EmqCqDwZRAAA3A

From: Chi Zhiling <chizhiling@kylinos.cn>

Remove the per-inode truncate_lock and rely on inode_lock instead.
exfat_setattr() truncates under inode_lock (held exclusively by the
VFS callers), and exfat_aop_bmap() now takes inode_lock shared to
exclude a concurrent truncate, providing the same mutual exclusion
with a single lock.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/exfat_fs.h | 2 --
 fs/exfat/file.c     | 2 --
 fs/exfat/inode.c    | 5 ++---
 fs/exfat/super.c    | 1 -
 4 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index fa30ab9d8564..a9131fe03302 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -298,8 +298,6 @@ struct exfat_inode_info {
 	loff_t zeroed_size;
 	/* hash by i_location */
 	struct hlist_node i_hash_fat;
-	/* protect bmap against truncate */
-	struct rw_semaphore truncate_lock;
 	struct inode vfs_inode;
 	/* File creation time */
 	struct timespec64 i_crtime;
diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 1c1524caaaf7..a2a9ee1a2004 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -413,7 +413,6 @@ int exfat_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		 * about to be freed.
 		 */
 		inode_dio_wait(inode);
-		down_write(&EXFAT_I(inode)->truncate_lock);
 		truncate_setsize(inode, attr->ia_size);
 
 		/*
@@ -421,7 +420,6 @@ int exfat_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		 * is already written by it, so mark_inode_dirty() is unneeded.
 		 */
 		exfat_truncate(inode);
-		up_write(&EXFAT_I(inode)->truncate_lock);
 	} else
 		mark_inode_dirty(inode);
 
diff --git a/fs/exfat/inode.c b/fs/exfat/inode.c
index 89826aea5e1e..ccd13630187e 100644
--- a/fs/exfat/inode.c
+++ b/fs/exfat/inode.c
@@ -291,10 +291,9 @@ static sector_t exfat_aop_bmap(struct address_space *mapping, sector_t block)
 {
 	sector_t blocknr;
 
-	/* exfat_get_cluster() assumes the requested blocknr isn't truncated. */
-	down_read(&EXFAT_I(mapping->host)->truncate_lock);
+	inode_lock_shared(mapping->host);
 	blocknr = iomap_bmap(mapping, block, &exfat_iomap_ops);
-	up_read(&EXFAT_I(mapping->host)->truncate_lock);
+	inode_unlock_shared(mapping->host);
 	return blocknr;
 }
 
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 388db271c6bf..a9ea36ba2693 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -195,7 +195,6 @@ static struct inode *exfat_alloc_inode(struct super_block *sb)
 	if (!ei)
 		return NULL;
 
-	init_rwsem(&ei->truncate_lock);
 	return &ei->vfs_inode;
 }
 
-- 
2.53.0

