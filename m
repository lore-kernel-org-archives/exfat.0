Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8883247255E
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 10:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306787; cv=none; b=rvEQeNVoiKjLHuXzaagFQtCWM8VH9SDb+tUmBIGDtoC9yB2iC89tUY8UAFqXebzQFmqSvDbbC4wbSOCmmB5qsXKhLr7ON9Yxui8gINNePW3gvp3hbMM5o/ygy3Xi1JzpMNOfmuxAxqp8LJFEFxHeM414/0vpT0eC1ZaxmF0Ndhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306787; c=relaxed/simple;
	bh=DZWCZO6Bh8geH2F8aW84d2LoIpNDP5+WVIZ7mh9f/5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JdOMQHmEKv+B6owsIodFv3jM6tpxNXUQgfcVRvbb1/xY/ScpCBPFDz4UbDxx2Yoa47BcfIoj0floBzF90yr+erjwm4n/PeTN1a162rfdEKMH1TkHCHdZRbuTxB8GTNgR1UsZ0oGnXFd5tI8u3TtFlVWjkCcUHmACVcF8ZB9P/Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PLgDbwnV; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PLgDbwnV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=le
	F2pg8mCziAz0+Aqg7R1uG1gLbSEIptaxaNYmSNJMo=; b=PLgDbwnVJKyDXhWOz/
	KbbjQqqd26i059kGqVEyMaMug62jcFlDvjduPnOMXPdc0CS+WEeLP5dWcThqOZ2Z
	OYEud78w/EPxkA+3U0VLC9FFc0G43exvH81UuRQT7cjXcq41v8MjltINhER5PYPl
	RIAGkpXyQIQP97b9y6oiMh07U=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCX0Fr7Iohq8umKRA--.44781S7;
	Fri, 21 Aug 2026 18:05:50 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [RFC PATCH v1 5/6] exfat: convert s_lock mutex to rw_semaphore using write lock
Date: Fri, 21 Aug 2026 18:05:30 +0800
Message-ID: <20260821100531.998196-6-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821100531.998196-1-chizhiling@163.com>
References: <20260821100531.998196-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCX0Fr7Iohq8umKRA--.44781S7
X-Coremail-Antispam: 1Uf129KBjvJXoWfGr1rWFWDKFWkur17uFWrGrg_yoWkWF47pr
	Z0kayvqr18X3ZrWr4kKF43ZF1Fyw1IgFW7Jryku3ZrAFyqqr129FyjvFy3ZFnYq3yxGwsY
	gFWj9r45GwsrGrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2uWdUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2x6EImqIIv7BRAAA3Y

From: Chi Zhiling <chizhiling@kylinos.cn>

Convert sbi->s_lock from a mutex to an rw_semaphore and acquire it in
write mode at every existing use site. This is a mechanical conversion
with no behavioral change, preparing the lock for read-mode access in
the iomap mapping paths so that concurrent mappings of distinct inodes
can proceed in parallel.

Lock ordering stays consistent (inode_lock -> s_lock -> bitmap_lock),
so no deadlock is introduced.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/dir.c      | 14 +++++++-------
 fs/exfat/exfat_fs.h |  2 +-
 fs/exfat/file.c     |  4 ++--
 fs/exfat/inode.c    | 10 +++++-----
 fs/exfat/iomap.c    |  4 ++--
 fs/exfat/namei.c    | 26 +++++++++++++-------------
 fs/exfat/super.c    | 10 +++++-----
 7 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index fe73b1380c5d..ea454574260e 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -223,7 +223,7 @@ static int exfat_iterate(struct file *file, struct dir_context *ctx)
 	if (err)
 		goto out;
 get_new:
-	mutex_lock(&EXFAT_SB(sb)->s_lock);
+	down_write(&EXFAT_SB(sb)->s_lock);
 
 	if (ei->flags == ALLOC_NO_FAT_CHAIN && cpos >= i_size_read(inode))
 		goto end_of_dir;
@@ -255,7 +255,7 @@ static int exfat_iterate(struct file *file, struct dir_context *ctx)
 		inum = iunique(sb, EXFAT_ROOT_INO);
 	}
 
-	mutex_unlock(&EXFAT_SB(sb)->s_lock);
+	up_write(&EXFAT_SB(sb)->s_lock);
 	if (!dir_emit(ctx, nb->lfn, strlen(nb->lfn), inum,
 			(de.attr & EXFAT_ATTR_SUBDIR) ? DT_DIR : DT_REG))
 		goto out;
@@ -266,7 +266,7 @@ static int exfat_iterate(struct file *file, struct dir_context *ctx)
 	if (!cpos && fake_offset)
 		cpos = ITER_POS_FILLED_DOTS;
 	ctx->pos = cpos;
-	mutex_unlock(&EXFAT_SB(sb)->s_lock);
+	up_write(&EXFAT_SB(sb)->s_lock);
 out:
 	/*
 	 * To improve performance, free namebuf after unlock sb_lock.
@@ -1294,7 +1294,7 @@ int exfat_read_volume_label(struct super_block *sb, struct exfat_uni_name *label
 	struct exfat_entry_set_cache es;
 	struct exfat_dentry *ep;
 
-	mutex_lock(&sbi->s_lock);
+	down_write(&sbi->s_lock);
 
 	memset(label_out, 0, sizeof(*label_out));
 	ret = exfat_get_volume_label_dentry(sb, &es);
@@ -1322,7 +1322,7 @@ int exfat_read_volume_label(struct super_block *sb, struct exfat_uni_name *label
 
 	exfat_put_dentry_set(&es, false);
 unlock:
-	mutex_unlock(&sbi->s_lock);
+	up_write(&sbi->s_lock);
 	return ret;
 }
 
@@ -1339,7 +1339,7 @@ int exfat_write_volume_label(struct super_block *sb,
 	if (label->name_len > EXFAT_VOLUME_LABEL_LEN)
 		return -EINVAL;
 
-	mutex_lock(&sbi->s_lock);
+	down_write(&sbi->s_lock);
 
 	ret = exfat_get_volume_label_dentry(sb, &es);
 	if (ret == -ENOENT) {
@@ -1376,6 +1376,6 @@ int exfat_write_volume_label(struct super_block *sb,
 	ret = exfat_put_dentry_set(&es, IS_DIRSYNC(root_inode));
 
 unlock:
-	mutex_unlock(&sbi->s_lock);
+	up_write(&sbi->s_lock);
 	return ret;
 }
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index f1505c013248..16ce508e0946 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -246,7 +246,7 @@ struct exfat_sb_info {
 
 	unsigned long s_exfat_flags; /* Exfat superblock flags */
 
-	struct mutex s_lock; /* superblock lock */
+	struct rw_semaphore s_lock; /* superblock lock */
 	struct mutex bitmap_lock; /* bitmap lock */
 	struct exfat_mount_options options;
 	struct nls_table *nls_io; /* Charset used for input and display */
diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 29c5db12288e..8abef3d2294a 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -297,7 +297,7 @@ static void exfat_truncate(struct inode *inode)
 	struct exfat_inode_info *ei = EXFAT_I(inode);
 	int err;
 
-	mutex_lock(&sbi->s_lock);
+	down_write(&sbi->s_lock);
 	if (ei->start_clu == 0) {
 		/*
 		 * Empty start_clu != ~0 (not allocated)
@@ -312,7 +312,7 @@ static void exfat_truncate(struct inode *inode)
 
 	inode->i_blocks = round_up(i_size_read(inode), sbi->cluster_size) >> 9;
 write_size:
-	mutex_unlock(&sbi->s_lock);
+	up_write(&sbi->s_lock);
 }
 
 int exfat_getattr(struct mnt_idmap *idmap, const struct path *path,
diff --git a/fs/exfat/inode.c b/fs/exfat/inode.c
index d041f893b1c3..a89826e08e1c 100644
--- a/fs/exfat/inode.c
+++ b/fs/exfat/inode.c
@@ -116,16 +116,16 @@ int exfat_write_inode(struct inode *inode, struct writeback_control *wbc)
 	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
 		return -EIO;
 
-	mutex_lock(&EXFAT_SB(inode->i_sb)->s_lock);
+	down_write(&EXFAT_SB(inode->i_sb)->s_lock);
 	ret = __exfat_write_inode(inode, wbc->sync_mode == WB_SYNC_ALL);
-	mutex_unlock(&EXFAT_SB(inode->i_sb)->s_lock);
+	up_write(&EXFAT_SB(inode->i_sb)->s_lock);
 
 	return ret;
 }
 
 void exfat_sync_inode(struct inode *inode)
 {
-	lockdep_assert_held(&EXFAT_SB(inode->i_sb)->s_lock);
+	lockdep_assert_held_write(&EXFAT_SB(inode->i_sb)->s_lock);
 	__exfat_write_inode(inode, 1);
 }
 
@@ -443,9 +443,9 @@ void exfat_evict_inode(struct inode *inode)
 
 	if (!inode->i_nlink) {
 		i_size_write(inode, 0);
-		mutex_lock(&EXFAT_SB(inode->i_sb)->s_lock);
+		down_write(&EXFAT_SB(inode->i_sb)->s_lock);
 		__exfat_truncate(inode);
-		mutex_unlock(&EXFAT_SB(inode->i_sb)->s_lock);
+		up_write(&EXFAT_SB(inode->i_sb)->s_lock);
 	}
 
 	clear_inode(inode);
diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index 0c805bf6676a..bc8bdfa9bb80 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -68,7 +68,7 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 	num_clusters = exfat_bytes_to_cluster_round_up(sbi,
 			offset + length) - exfat_bytes_to_cluster(sbi, offset);
 
-	mutex_lock(&sbi->s_lock);
+	down_write(&sbi->s_lock);
 	iomap->bdev = inode->i_sb->s_bdev;
 	iomap->offset = offset;
 
@@ -135,7 +135,7 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 
 	iomap->flags |= IOMAP_F_MERGED;
 out:
-	mutex_unlock(&sbi->s_lock);
+	up_write(&sbi->s_lock);
 	return err;
 }
 
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index f26f987a34cf..0c28040e97d6 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -565,7 +565,7 @@ static int exfat_create(struct mnt_idmap *idmap, struct inode *dir,
 	if (unlikely(exfat_forced_shutdown(sb)))
 		return -EIO;
 
-	mutex_lock(&EXFAT_SB(sb)->s_lock);
+	down_write(&EXFAT_SB(sb)->s_lock);
 	exfat_set_volume_dirty(sb);
 	err = exfat_add_entry(dir, dentry->d_name.name, TYPE_FILE, &info);
 	if (err)
@@ -592,7 +592,7 @@ static int exfat_create(struct mnt_idmap *idmap, struct inode *dir,
 
 	d_instantiate(dentry, inode);
 unlock:
-	mutex_unlock(&EXFAT_SB(sb)->s_lock);
+	up_write(&EXFAT_SB(sb)->s_lock);
 	return err;
 }
 
@@ -732,7 +732,7 @@ static struct dentry *exfat_lookup(struct inode *dir, struct dentry *dentry,
 	int err;
 	loff_t i_pos;
 
-	mutex_lock(&EXFAT_SB(sb)->s_lock);
+	down_write(&EXFAT_SB(sb)->s_lock);
 	err = exfat_find(dir, &dentry->d_name, &info);
 	if (err) {
 		if (unlikely(err != -ENOENT))
@@ -761,12 +761,12 @@ static struct dentry *exfat_lookup(struct inode *dir, struct dentry *dentry,
 		 */
 		d_move(alias, dentry);
 		iput(inode);
-		mutex_unlock(&EXFAT_SB(sb)->s_lock);
+		up_write(&EXFAT_SB(sb)->s_lock);
 		return alias;
 	}
 	dput(alias);
 out:
-	mutex_unlock(&EXFAT_SB(sb)->s_lock);
+	up_write(&EXFAT_SB(sb)->s_lock);
 	if (!inode)
 		exfat_d_version_set(dentry, inode_query_iversion(dir));
 
@@ -785,7 +785,7 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 	if (unlikely(exfat_forced_shutdown(sb)))
 		return -EIO;
 
-	mutex_lock(&EXFAT_SB(sb)->s_lock);
+	down_write(&EXFAT_SB(sb)->s_lock);
 	if (ei->dir.dir == DIR_DELETED) {
 		exfat_err(sb, "abnormal access to deleted dentry");
 		err = -ENOENT;
@@ -821,7 +821,7 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 	exfat_unhash_inode(inode);
 	exfat_d_version_set(dentry, inode_query_iversion(dir));
 unlock:
-	mutex_unlock(&EXFAT_SB(sb)->s_lock);
+	up_write(&EXFAT_SB(sb)->s_lock);
 	return err;
 }
 
@@ -838,7 +838,7 @@ static struct dentry *exfat_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	if (unlikely(exfat_forced_shutdown(sb)))
 		return ERR_PTR(-EIO);
 
-	mutex_lock(&EXFAT_SB(sb)->s_lock);
+	down_write(&EXFAT_SB(sb)->s_lock);
 	exfat_set_volume_dirty(sb);
 	err = exfat_add_entry(dir, dentry->d_name.name, TYPE_DIR, &info);
 	if (err)
@@ -867,7 +867,7 @@ static struct dentry *exfat_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	d_instantiate(dentry, inode);
 
 unlock:
-	mutex_unlock(&EXFAT_SB(sb)->s_lock);
+	up_write(&EXFAT_SB(sb)->s_lock);
 	return err ? ERR_PTR(err) : NULL;
 }
 
@@ -929,7 +929,7 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	if (unlikely(exfat_forced_shutdown(sb)))
 		return -EIO;
 
-	mutex_lock(&EXFAT_SB(inode->i_sb)->s_lock);
+	down_write(&EXFAT_SB(inode->i_sb)->s_lock);
 
 	if (ei->dir.dir == DIR_DELETED) {
 		exfat_err(sb, "abnormal access to deleted dentry");
@@ -979,7 +979,7 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	exfat_unhash_inode(inode);
 	exfat_d_version_set(dentry, inode_query_iversion(dir));
 unlock:
-	mutex_unlock(&EXFAT_SB(inode->i_sb)->s_lock);
+	up_write(&EXFAT_SB(inode->i_sb)->s_lock);
 	return err;
 }
 
@@ -1282,7 +1282,7 @@ static int exfat_rename(struct mnt_idmap *idmap,
 	if (flags & ~RENAME_NOREPLACE)
 		return -EINVAL;
 
-	mutex_lock(&EXFAT_SB(sb)->s_lock);
+	down_write(&EXFAT_SB(sb)->s_lock);
 	old_inode = old_dentry->d_inode;
 	new_inode = new_dentry->d_inode;
 
@@ -1334,7 +1334,7 @@ static int exfat_rename(struct mnt_idmap *idmap,
 	}
 
 unlock:
-	mutex_unlock(&EXFAT_SB(sb)->s_lock);
+	up_write(&EXFAT_SB(sb)->s_lock);
 	return err;
 }
 
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 491273d8eeb6..72a35f4079b4 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -45,11 +45,11 @@ static void exfat_put_super(struct super_block *sb)
 {
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 
-	mutex_lock(&sbi->s_lock);
+	down_write(&sbi->s_lock);
 	exfat_clear_volume_dirty(sb);
 	exfat_free_bitmap(sbi);
 	brelse(sbi->boot_bh);
-	mutex_unlock(&sbi->s_lock);
+	up_write(&sbi->s_lock);
 }
 
 static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
@@ -771,9 +771,9 @@ static int exfat_reconfigure(struct fs_context *fc)
 	fc->sb_flags |= SB_NODIRATIME;
 
 	sync_filesystem(sb);
-	mutex_lock(&sbi->s_lock);
+	down_write(&sbi->s_lock);
 	exfat_clear_volume_dirty(sb);
-	mutex_unlock(&sbi->s_lock);
+	up_write(&sbi->s_lock);
 
 	if (new_opts->allow_utime == (unsigned short)-1)
 		new_opts->allow_utime = ~new_opts->fs_dmask & 0022;
@@ -820,7 +820,7 @@ static int exfat_init_fs_context(struct fs_context *fc)
 	if (!sbi)
 		return -ENOMEM;
 
-	mutex_init(&sbi->s_lock);
+	init_rwsem(&sbi->s_lock);
 	mutex_init(&sbi->bitmap_lock);
 	ratelimit_state_init(&sbi->ratelimit, DEFAULT_RATELIMIT_INTERVAL,
 			DEFAULT_RATELIMIT_BURST);
-- 
2.53.0

