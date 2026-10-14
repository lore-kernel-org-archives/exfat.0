Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514B0559C83
	for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991931; cv=none; b=bnUkwSeB8dpH2vzfIT3xV2tTGAlJg68TtLqa9Oh/rN9FOibh6OzQwGazWFHUvZbb/PIxQobNdCVKY0DqD2n5CUjvV8xH/JWZjESSdXIvuJiVrkHotP/2cg456jq74R5CfZczV/uTbgKycHA50FUCZmo9au9Lg6Er2582OATmT1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991931; c=relaxed/simple;
	bh=QOC45dyZRhk1gCm/AFuq8p8kaRK5WcH7tS1tOotGQFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UjSDLNVJM3jvSGu6v7I7SXCBvW0xtOtCuYZWqNf/JDfWzeGmsjz6Y3OMYzp85CeRJivbzXPKedqRsit6CDXpqq6fX5DvRdihKoqMdUJmryGzJjvZpFTUnVPOd3428mGLBCGT0M/CWsHmWT+/13w0GR9asGqUjxQ0Yif7I05p79Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJLVPhD/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJLVPhD/"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8875d220446so2215860b3a.3
        for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991924; x=1792596724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqYQDNtbsbcUiDgoE4djRgnqQUZJDbIyNNQhRZYOJpY=;
        b=RJLVPhD/6aeM3dHv/La8sPkgN1FXi1TbCOU3jJ836uxWPBteC2d6Uk2ShIFi+BfT+M
         1VKwxT1+sQdR2QuBl1tamph2x9z0mA/TBEvCv1Tc3J1ookJ9/UE+Xj4q0AAR7qBDDET7
         ZQnACHuY7592m6G2zjNC2h8RJebD04D8eKvvymqOEd/XpoV3C6rNMzc1E1HZoMfOcJhb
         26rIy80U5pqSH5lTXAN9rE/j1794+7y35FUVrEykRyuwgLkzzspDS0+9j+YdKq22M0xj
         /6XWYfMdZVSOrrXbCuyXlIu5E32nGBHT6Ht/hjAYUj1rnk0XmQlt+zS7+Bg0rQ2MZSps
         y0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991924; x=1792596724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqYQDNtbsbcUiDgoE4djRgnqQUZJDbIyNNQhRZYOJpY=;
        b=IPPSEJohRm1LXze1M7wGxVjscgQfqu5FeyqpgXVO0V0303vMUTn4tpj1qYFsLVp6mJ
         jEnIfoO2U4tC3TNKds7aDVJF6KViDBNgkI/OKiAaW6kODIK0YB3Rs7CAQVdEQN8HXwKE
         G5pDKmm9S9gMmryhCXRCUbBZ5d7zMGloDHU3vcqhdyfr4cp5k2Rdgh1oJZdxyAv5rz+M
         508x3TPSyXqZootOSxRUia24VEhI8ARITrA+ywkyGTxmi0hy1IzZ/oFc9TMosTaWiT3S
         /pa7zcVXV5gY5efPc1kxE2bDJKr5Wheo4dKokVjO0gL/ElyOtfT7bpvQ7/lftx6NZnTn
         TVag==
X-Forwarded-Encrypted: i=1; AKwUvBywa2YJyE49GMuu49Ygwg0GB/XkeRJDWoX8jKuxyuOJ5Y6Rq3EKolqbqDmihs8gqhqQAu/4pQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYI9+OUdUfYQJJuEcqpXEFuLJY4vXOzSVnzDef1thWnV8C4aW212
	J1uDZs6QVJFmLhz3GGutdCXiJZoECj9gf2W08pyxhgcnaV7zzXUy+pll
X-Gm-Gg: AYBFou0QglKQH/ElSRdQ4oVBxwUsoPTutZy6r9NFFKEfuOOfSBFLzYg2hM+GlqI6+2P
	t9lsvBSHQTcrRCVlbxI2i5AUgO5KmB/cCQYgosDaefKdev+yvP5qxubBHiogHLkaVyirzqWKd35
	cAbZ0LYK7KSJqZTQAIlxU7XWLCz13WWiS6JFKSn4A6vkBm2I2iNuqNKFYUgUV5jeVjPhYDIapLQ
	iDyvz1Q00W0edAfMCHxoZ96BxHJ3cB9FdKs0TlFxie5pwD40VZNiOy6wwZoJmVPbW8KtT2UfGFu
	liAdvo4FxPaOg0/vf3EHOgfDUAyF7HGKlSWQTfRSGFZ5cpa7rL3nDPdRSphsmJeUaK57GGTdC4t
	8aZzANCIkpKTXK2B4kfXG4OnvO8DBQyqgeqGln7SEG285TdNNc909QdtG1XXP3QMUozB0tZMlwj
	Q2Zk6Nrnddk753/ZerI+z7mgFR/4/+KVbjVgLWpdZUoeaRodbZDUA+LhFnvitBBZW7Pz/HKc89Q
	5SptHawbQ+AaQ==
X-Received: by 2002:a05:6a00:181b:b0:873:e3b4:5d4 with SMTP id d2e1a72fcca58-897c3e03dc9mr13580216b3a.2.1791991923406;
        Wed, 14 Oct 2026 08:32:03 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f51f452sm1221941b3a.1.2026.10.14.08.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:32:03 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v8 2/3] exfat: retain the next empty directory entry hint
Date: Wed, 14 Oct 2026 23:31:29 +0800
Message-Id: <20261014153130.2111500-3-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014153130.2111500-1-anmuxixixi@gmail.com>
References: <20261014153130.2111500-1-anmuxixixi@gmail.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After a Bloom filter miss skips the name scan, empty-entry allocation can
still rescan the directory from the beginning.

Calculate the next empty-entry hint when a free entry set is found, but
publish it only after the entry set is committed. Record the minimum
entry-set size for which a saved hint is valid, so a later shorter name
rescans earlier entries and can reuse smaller holes.

Retain the hint while the name filter is active and invalidate it whenever
create rollback, unlink, rmdir, rename, or move can free entries. Also
discard hints collected by positive name lookups, since such lookups can
start at hint_stat and return before scanning the beginning of the
directory.

Track the remaining root-directory chain length during volume-label scans
so any empty-entry hint published by that path remains usable across a
cluster boundary.

This preserves the fast append path during bulk creation without allowing
partial or stale hints to skip reusable directory entries.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 25 +++++++++++---
 fs/exfat/exfat_fs.h |  5 ++-
 fs/exfat/namei.c    | 81 +++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 99 insertions(+), 12 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index dcfaccdef2d8..4c36fded2412 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -1154,6 +1154,7 @@ static inline void exfat_reset_empty_hint(struct exfat_hint_femp *hint_femp)
 {
 	hint_femp->eidx = EXFAT_HINT_NONE;
 	hint_femp->count = 0;
+	hint_femp->min_entries = 0;
 }
 
 static inline void exfat_set_empty_hint(struct exfat_inode_info *ei,
@@ -1167,6 +1168,7 @@ static inline void exfat_set_empty_hint(struct exfat_inode_info *ei,
 		if (candi_empty->count == 0) {
 			candi_empty->cur = *clu;
 			candi_empty->eidx = dentry;
+			candi_empty->min_entries = num_entries;
 		}
 
 		if (entry_type == TYPE_UNUSED)
@@ -1377,6 +1379,7 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 		ei->hint_femp.cur.dir = EXFAT_EOF_CLUSTER;
 		ei->hint_femp.eidx = p_dir->size * dentries_per_clu;
 		ei->hint_femp.count = 0;
+		ei->hint_femp.min_entries = num_entries;
 	}
 
 	exfat_build_name_filter(sb, ei, p_dir);
@@ -1387,6 +1390,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 	return -ENOENT;
 
 found:
+	exfat_reset_empty_hint(&ei->hint_femp);
+
 	/* next dentry we'll find is out of this cluster */
 	if (!((dentry + 1) & (dentries_per_clu - 1))) {
 		int ret = 0;
@@ -1453,16 +1458,19 @@ static int exfat_get_volume_label_dentry(struct super_block *sb,
 {
 	int i;
 	int dentry = 0;
+	struct inode *inode = sb->s_root->d_inode;
 	unsigned int type;
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 	struct exfat_hint_femp hint_femp;
-	struct exfat_inode_info *ei = EXFAT_I(sb->s_root->d_inode);
+	struct exfat_inode_info *ei = EXFAT_I(inode);
 	struct exfat_chain clu;
 	struct exfat_dentry *ep;
 	struct buffer_head *bh;
 
 	hint_femp.eidx = EXFAT_HINT_NONE;
-	exfat_chain_set(&clu, sbi->root_dir, 0, ALLOC_FAT_CHAIN);
+	exfat_chain_set(&clu, sbi->root_dir,
+			exfat_bytes_to_cluster(sbi, i_size_read(inode)),
+			ALLOC_FAT_CHAIN);
 
 	while (clu.dir != EXFAT_EOF_CLUSTER) {
 		for (i = 0; i < sbi->dentries_per_clu; i++, dentry++) {
@@ -1476,6 +1484,7 @@ static int exfat_get_volume_label_dentry(struct super_block *sb,
 					hint_femp.cur = clu;
 					hint_femp.eidx = dentry;
 					hint_femp.count = 1;
+					hint_femp.min_entries = 1;
 				}
 			}
 
@@ -1500,7 +1509,7 @@ static int exfat_get_volume_label_dentry(struct super_block *sb,
 			return 0;
 		}
 
-		if (exfat_get_next_cluster(sb, &(clu.dir)))
+		if (exfat_chain_advance(sb, &clu, 1))
 			return -EIO;
 	}
 
@@ -1509,6 +1518,7 @@ static int exfat_get_volume_label_dentry(struct super_block *sb,
 		hint_femp.cur.dir = EXFAT_EOF_CLUSTER;
 		hint_femp.eidx = dentry;
 		hint_femp.count = 0;
+		hint_femp.min_entries = 1;
 	}
 
 	ei->hint_femp = hint_femp;
@@ -1563,7 +1573,9 @@ int exfat_write_volume_label(struct super_block *sb,
 	struct inode *root_inode = sb->s_root->d_inode;
 	struct exfat_entry_set_cache es;
 	struct exfat_chain clu;
+	struct exfat_hint_femp next_hint;
 	struct exfat_dentry *ep;
+	bool entry_allocated = false;
 
 	if (label->name_len > EXFAT_VOLUME_LABEL_LEN)
 		return -EINVAL;
@@ -1578,7 +1590,10 @@ int exfat_write_volume_label(struct super_block *sb,
 			goto unlock;
 		}
 
-		ret = exfat_find_empty_entry(root_inode, &clu, 1, &es);
+		ret = exfat_find_empty_entry(root_inode, &clu, 1, &es,
+					     &next_hint);
+		if (ret >= 0)
+			entry_allocated = true;
 	}
 
 	if (ret < 0)
@@ -1603,6 +1618,8 @@ int exfat_write_volume_label(struct super_block *sb,
 	es.modified = true;
 
 	ret = exfat_put_dentry_set(&es, IS_DIRSYNC(root_inode));
+	if (!ret && entry_allocated)
+		EXFAT_I(root_inode)->hint_femp = next_hint;
 
 unlock:
 	mutex_unlock(&sbi->s_lock);
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index 015860883fa8..d00b3235cee9 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -157,6 +157,8 @@ struct exfat_hint_femp {
 	int eidx;
 	/* count of continuous empty entry */
 	int count;
+	/* minimum entry-set size for which this hint is safe */
+	int min_entries;
 	/* the cluster that first empty slot exists in */
 	struct exfat_chain cur;
 };
@@ -639,7 +641,8 @@ extern const struct dentry_operations exfat_dentry_ops;
 extern const struct dentry_operations exfat_utf8_dentry_ops;
 int exfat_find_empty_entry(struct inode *inode,
 		struct exfat_chain *p_dir, int num_entries,
-			   struct exfat_entry_set_cache *es);
+			   struct exfat_entry_set_cache *es,
+			   struct exfat_hint_femp *next_hint);
 
 /* cache.c */
 int exfat_cache_init(void);
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 5e47ca1bf722..d8ddfc8fff2a 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -199,6 +199,54 @@ const struct dentry_operations exfat_utf8_dentry_ops = {
 	.d_compare	= exfat_utf8_d_cmp,
 };
 
+static void exfat_set_next_empty_hint(struct inode *inode,
+				      struct exfat_chain *p_dir, int dentry,
+				      int num_entries,
+				      struct exfat_entry_set_cache *es,
+				      struct exfat_hint_femp *hint_femp)
+{
+	struct exfat_sb_info *sbi = EXFAT_SB(inode->i_sb);
+	unsigned int next = dentry + num_entries;
+	unsigned int total = exfat_cluster_to_dentries(sbi, p_dir->size);
+	struct exfat_chain cur;
+
+	hint_femp->min_entries = num_entries;
+
+	if (next >= total) {
+		exfat_chain_set(&hint_femp->cur, EXFAT_EOF_CLUSTER, 0,
+				p_dir->flags);
+		hint_femp->eidx = total;
+		hint_femp->count = 0;
+		return;
+	}
+
+	cur.dir = exfat_sector_to_cluster(sbi,
+					  es->bh[es->num_bh - 1]->b_blocknr);
+	cur.flags = p_dir->flags;
+	cur.size = p_dir->size - exfat_dentries_to_cluster(sbi, next);
+	if (!(next & (sbi->dentries_per_clu - 1))) {
+		cur.size++;
+		if (exfat_chain_advance(inode->i_sb, &cur, 1)) {
+			hint_femp->eidx = EXFAT_HINT_NONE;
+			hint_femp->count = 0;
+			return;
+		}
+	}
+
+	hint_femp->cur = cur;
+	hint_femp->eidx = next;
+	hint_femp->count = 0;
+}
+
+static void exfat_invalidate_empty_hint(struct inode *inode)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
+	ei->hint_femp.eidx = EXFAT_HINT_NONE;
+	ei->hint_femp.count = 0;
+	ei->hint_femp.min_entries = 0;
+}
+
 /* search EMPTY CONTINUOUS "num_entries" entries */
 static int exfat_search_empty_slot(struct super_block *sb,
 		struct exfat_hint_femp *hint_femp, struct exfat_chain *p_dir,
@@ -295,7 +343,8 @@ static int exfat_check_max_dentries(struct inode *inode)
  */
 int exfat_find_empty_entry(struct inode *inode,
 		struct exfat_chain *p_dir, int num_entries,
-		struct exfat_entry_set_cache *es)
+		struct exfat_entry_set_cache *es,
+		struct exfat_hint_femp *next_hint)
 {
 	int dentry, ret;
 	unsigned int last_clu;
@@ -309,8 +358,9 @@ int exfat_find_empty_entry(struct inode *inode,
 	hint_femp.eidx = EXFAT_HINT_NONE;
 
 	if (ei->hint_femp.eidx != EXFAT_HINT_NONE) {
-		hint_femp = ei->hint_femp;
-		ei->hint_femp.eidx = EXFAT_HINT_NONE;
+		if (num_entries >= ei->hint_femp.min_entries)
+			hint_femp = ei->hint_femp;
+		exfat_invalidate_empty_hint(inode);
 	}
 
 	exfat_chain_set(p_dir, ei->start_clu,
@@ -385,6 +435,9 @@ int exfat_find_empty_entry(struct inode *inode,
 		inode->i_blocks += sbi->cluster_size >> 9;
 	}
 
+	exfat_set_next_empty_hint(inode, p_dir, dentry, num_entries, es,
+				  next_hint);
+
 	p_dir->dir = exfat_sector_to_cluster(sbi, es->bh[0]->b_blocknr);
 	p_dir->size -= dentry >> sbi->dentries_per_clu_bits;
 
@@ -469,6 +522,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	struct exfat_chain clu;
 	struct timespec64 ts = current_time(inode);
 	struct exfat_entry_set_cache es;
+	struct exfat_hint_femp next_hint;
 	int clu_size = 0;
 	unsigned int start_clu = EXFAT_FREE_CLUSTER;
 	bool dir_allocated = false;
@@ -484,7 +538,8 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	}
 
 	/* exfat_find_empty_entry must be called before alloc_cluster() */
-	dentry = exfat_find_empty_entry(inode, &info->dir, num_entries, &es);
+	dentry = exfat_find_empty_entry(inode, &info->dir, num_entries, &es,
+					&next_hint);
 	if (dentry < 0) {
 		ret = dentry; /* -EIO or -ENOSPC */
 		goto out;
@@ -517,6 +572,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 						   dentry, ES_ALL_ENTRIES);
 		if (!cleanup_ret) {
 			exfat_remove_entries(inode, &es, ES_IDX_FILE, false);
+			exfat_invalidate_empty_hint(inode);
 			cleanup_ret = exfat_put_dentry_set(&es,
 							   IS_DIRSYNC(inode));
 		}
@@ -525,6 +581,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 			exfat_free_cluster(inode, &clu);
 		goto out;
 	}
+	EXFAT_I(inode)->hint_femp = next_hint;
 
 	info->entry = dentry;
 	exfat_name_filter_add(inode, &uniname);
@@ -629,7 +686,8 @@ static int exfat_find(struct inode *dir, const struct qstr *qname,
 		ei->hint_stat.clu = cdir.dir;
 		ei->hint_stat.eidx = 0;
 		ei->version = (inode_peek_iversion_raw(dir) & 0xffffffff);
-		ei->hint_femp.eidx = EXFAT_HINT_NONE;
+		if (!ei->name_filter)
+			ei->hint_femp.eidx = EXFAT_HINT_NONE;
 	}
 
 	/* search the file name for directories */
@@ -805,6 +863,7 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 
 	/* update the directory entry */
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
+	exfat_invalidate_empty_hint(dir);
 
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
 	if (err)
@@ -960,6 +1019,7 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	exfat_set_volume_dirty(sb);
 
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
+	exfat_invalidate_empty_hint(dir);
 
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(dir));
 	if (err)
@@ -1035,9 +1095,10 @@ static int exfat_rename_file(struct inode *parent_inode,
 	if (old_es.num_entries < num_total_entries) {
 		int newentry;
 		struct exfat_chain dir;
+		struct exfat_hint_femp next_hint;
 
 		newentry = exfat_find_empty_entry(parent_inode, &dir,
-				num_total_entries, &new_es);
+				num_total_entries, &new_es, &next_hint);
 		if (newentry < 0) {
 			ret = newentry; /* -EIO or -ENOSPC */
 			goto put_old_es;
@@ -1069,6 +1130,7 @@ static int exfat_rename_file(struct inode *parent_inode,
 			}
 			goto put_old_es;
 		}
+		EXFAT_I(parent_inode)->hint_femp = next_hint;
 
 		exfat_remove_entries(parent_inode, &old_es, ES_IDX_FILE, false);
 		ei->dir = dir;
@@ -1096,6 +1158,7 @@ static int exfat_move_file(struct inode *parent_inode,
 	struct exfat_dentry *epmov, *epnew;
 	struct exfat_entry_set_cache mov_es, new_es;
 	struct exfat_chain newdir;
+	struct exfat_hint_femp next_hint;
 	unsigned int num_extra_entries, num_total_entries;
 
 	num_new_entries = exfat_calc_num_entries(p_uniname);
@@ -1113,7 +1176,7 @@ static int exfat_move_file(struct inode *parent_inode,
 	num_total_entries = num_new_entries + num_extra_entries;
 
 	newentry = exfat_find_empty_entry(parent_inode, &newdir,
-			num_total_entries, &new_es);
+			num_total_entries, &new_es, &next_hint);
 	if (newentry < 0) {
 		ret = newentry; /* -EIO or -ENOSPC */
 		goto put_mov_es;
@@ -1142,10 +1205,12 @@ static int exfat_move_file(struct inode *parent_inode,
 					  ES_ALL_ENTRIES)) {
 			exfat_remove_entries(parent_inode, &new_es,
 					    ES_IDX_FILE, false);
+			exfat_invalidate_empty_hint(parent_inode);
 			exfat_put_dentry_set(&new_es, false);
 		}
 		goto put_mov_es;
 	}
+	EXFAT_I(parent_inode)->hint_femp = next_hint;
 
 	exfat_remove_entries(parent_inode, &mov_es, ES_IDX_FILE, false);
 
@@ -1218,6 +1283,7 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
 	else
 		ret = exfat_move_file(new_parent_inode, &uni_name, ei);
+	exfat_invalidate_empty_hint(old_parent_inode);
 	if (!ret)
 		exfat_name_filter_add(new_parent_inode, &uni_name);
 	else
@@ -1234,6 +1300,7 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		}
 
 		exfat_remove_entries(new_inode, &es, ES_IDX_FILE, true);
+		exfat_invalidate_empty_hint(new_parent_inode);
 
 		ret = exfat_put_dentry_set(&es, IS_DIRSYNC(new_inode));
 		if (ret)
-- 
2.34.1

