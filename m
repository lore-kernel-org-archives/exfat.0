Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB1943B4B8
	for <exfat@lists.linux.dev>; Sun,  4 Oct 2026 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122236; cv=none; b=qhZX3jwjdYabAt8RdcR07weU9lNj+qr4XV/Thxz2hFbdzSvqYak+FuQokFS4pwTCGWPw7iA/aUGRZABCG7lEOmKKnP13vM4Ls27t3A8Hr6MsI3fD5BJ52ViEsdV4IL84KfQvtV4+ua7Zh7zoKMGC1C6LM4vf4c9oPraKQGUrZq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122236; c=relaxed/simple;
	bh=aXA1wNDZdlm7yE00zEdsPIPMRj7yKuxdzHiZYd7eXDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k3nDZvIzYMV9LwCP1bVkHNFli8b6A6Kb+q7IQeer5fmwggF9kl3d3oEOf/mFEU64qkINFsks/Bw3ExlF6j7KAl/3RFLKR+KDALJrhypa3k3/g4Yd7Ns1yI42+2Xj4hufAZmoZ0s7zpTXs56LbqYA6HzkxYMbKVw6v16UdbRW904=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zvio/boZ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zvio/boZ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a49623b865so443333a91.0
        for <exfat@lists.linux.dev>; Sun, 04 Oct 2026 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791122234; x=1791727034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nTC5sAvWfFjxhQC+7XoFqRQwCT6gwFwNodP+fuSFLE=;
        b=Zvio/boZ+dm4bfPcMbz4rEr2pJqUupd17dlcIbNaE5mczY+FnpDA3Et7rgSMkcIhe2
         Ky+Usc6QvKy+3kQqLvHPI9XUvfkV7TNcnp01e2xyUvTm5DRYGdxoX335vrr9tswTC95U
         /7TB3QnldnbDZaCMEYCWiJTATGs8b2pef/nmWzUXN00fIqLSZgkIZq349rZsfwnXyN+d
         HGYivvMSd0yT5GemdGg91D06P0DR+4y3q/ssfJI7hip7yz29EjuXr6ZnSIdnkeTeR5/I
         Lyd8f5YLHUYl/avE/ofiy6p9lgimHJQSD0BrsTcepITtSiBXp+UBIxa3qUAwWxthhip4
         2rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122234; x=1791727034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nTC5sAvWfFjxhQC+7XoFqRQwCT6gwFwNodP+fuSFLE=;
        b=D1+ehTe2R/RDRa3XssPAiBwbFYZ/J/dZ5knoYB2xZloCsEq1cW57S+6NvhGWcp5ZDU
         mcz6n/VC9woqSeBk0rF2D42m04UuWjdkE+MsG4Z/mI98KQ7/vXz3sZrKHxLoWpC4xGvk
         H6wwsrXp1dNFxw3JFe0r2cK4DgbrWjTrrgJF4tEfKyu6dAEk9wX6/l/Jh/4XJZRjUcTZ
         rVEy74hLqIUzPYcwDobzM/vcwT6Hx/ICxZOY2uhq7tu3yyiuWeFId5EKIUfxOO9PJLxG
         whdZAH1TP8I+yrlWld7+gK1mbXLIKV1/o3RSEWoqIZLTO72YaTcbGT1LBZf/TZbypBcr
         b8AA==
X-Forwarded-Encrypted: i=1; AKwUvByi80OBI9wnanPY/7AikqP1SXGPI++CQSJEnTckvdbAS1scuWHEKf+R74vyruAEsNmtn6Iyow==@lists.linux.dev
X-Gm-Message-State: AFq9FYLLeFKlDrnHa/cztNBrjiVsbH2kmEvJSYjHzPCEVz/Fei+ntd4u
	ShkQzH7in7Tr0Kd/gdISSQf4oiEBH5YgzL5yB6rlE2P7d/nxKGnGGBwiDaao3u/q+3o=
X-Gm-Gg: AYBFou1Od6Cx2xtIpa1nBj0vJBkME1DtGy43TmwCBYRZKK4Vl1O2WwrroQo6YRSjs/m
	vClZ0Z2Cp0DmhkvD3Fspa4teDYzoxN30ttay7VziNxN0yT1epbGGPsHiYYJPM8bC/VlQsaQ0IVy
	tnxQoPSexrtL+6Ge6t2+xwF2Fu/Gc40JS/QkPK8LK5iVT2BXTRyhA0ft7KiLoZKjJl4q6dog3le
	ytNmJ9r9j+y8GWGX286wtjg7ijELExWLZNcSvXmO8SvSMriMyAqQQ++b7BxchE4f323LO3QwcsD
	xcDgruNlToZ4wtZbfwaQp3csel11AHKU1Qdyd8zyz0JkUpL5Gsc6Z4iJy+/WTR5w0WFTTLdVvcz
	ol+y+o81vcr11yh4ZMquKrQC1tjWidm6zp48OGKZjPO4xSAz5w8MjpCu0aj93YJ5gFw/1BWgGC8
	MV+j/pKYAGFU7r2cVrSGdlG01aGAc6q8qtoce4d+P4ktEg5SAA+2o7hw5mIKt7Ya9qVEyg63uKO
	8ia6n8k0eh0eag1Yv5Dduo=
X-Received: by 2002:a17:90b:554c:b0:3a8:185:cf39 with SMTP id 98e67ed59e1d1-3a80185d71amr115311a91.6.1791122233814;
        Sun, 04 Oct 2026 06:57:13 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7cd433sm6876358a91.15.2026.10.04.06.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 06:57:13 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v7 2/3] exfat: retain the next empty directory entry hint
Date: Sun,  4 Oct 2026 21:56:37 +0800
Message-Id: <20261004135638.1888530-3-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004135638.1888530-1-anmuxixixi@gmail.com>
References: <20261004135638.1888530-1-anmuxixixi@gmail.com>
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
create rollback, unlink, rmdir, rename, or move can free entries.

This preserves the fast append path during bulk creation without allowing
stale hints to skip reusable directory entries.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 14 +++++++-
 fs/exfat/exfat_fs.h |  5 ++-
 fs/exfat/namei.c    | 84 +++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 94 insertions(+), 9 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index dcfaccdef2d8..9f9183116784 100644
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
@@ -1476,6 +1479,7 @@ static int exfat_get_volume_label_dentry(struct super_block *sb,
 					hint_femp.cur = clu;
 					hint_femp.eidx = dentry;
 					hint_femp.count = 1;
+					hint_femp.min_entries = 1;
 				}
 			}
 
@@ -1509,6 +1513,7 @@ static int exfat_get_volume_label_dentry(struct super_block *sb,
 		hint_femp.cur.dir = EXFAT_EOF_CLUSTER;
 		hint_femp.eidx = dentry;
 		hint_femp.count = 0;
+		hint_femp.min_entries = 1;
 	}
 
 	ei->hint_femp = hint_femp;
@@ -1563,7 +1568,9 @@ int exfat_write_volume_label(struct super_block *sb,
 	struct inode *root_inode = sb->s_root->d_inode;
 	struct exfat_entry_set_cache es;
 	struct exfat_chain clu;
+	struct exfat_hint_femp next_hint;
 	struct exfat_dentry *ep;
+	bool entry_allocated = false;
 
 	if (label->name_len > EXFAT_VOLUME_LABEL_LEN)
 		return -EINVAL;
@@ -1578,7 +1585,10 @@ int exfat_write_volume_label(struct super_block *sb,
 			goto unlock;
 		}
 
-		ret = exfat_find_empty_entry(root_inode, &clu, 1, &es);
+		ret = exfat_find_empty_entry(root_inode, &clu, 1, &es,
+					     &next_hint);
+		if (ret >= 0)
+			entry_allocated = true;
 	}
 
 	if (ret < 0)
@@ -1603,6 +1613,8 @@ int exfat_write_volume_label(struct super_block *sb,
 	es.modified = true;
 
 	ret = exfat_put_dentry_set(&es, IS_DIRSYNC(root_inode));
+	if (!ret && entry_allocated)
+		EXFAT_I(root_inode)->hint_femp = next_hint;
 
 unlock:
 	mutex_unlock(&sbi->s_lock);
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index e0314635924a..70f4e2d4ac81 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -156,6 +156,8 @@ struct exfat_hint_femp {
 	int eidx;
 	/* count of continuous empty entry */
 	int count;
+	/* minimum entry-set size for which this hint is safe */
+	int min_entries;
 	/* the cluster that first empty slot exists in */
 	struct exfat_chain cur;
 };
@@ -583,7 +585,8 @@ extern const struct dentry_operations exfat_dentry_ops;
 extern const struct dentry_operations exfat_utf8_dentry_ops;
 int exfat_find_empty_entry(struct inode *inode,
 		struct exfat_chain *p_dir, int num_entries,
-			   struct exfat_entry_set_cache *es);
+			   struct exfat_entry_set_cache *es,
+			   struct exfat_hint_femp *next_hint);
 
 /* cache.c */
 int exfat_cache_init(void);
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 84045b704303..0ab018b2e24a 100644
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
@@ -805,6 +863,8 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 
 	/* update the directory entry */
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
+	exfat_invalidate_empty_hint(dir);
+
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
 	if (err)
 		goto unlock;
@@ -959,6 +1019,8 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	exfat_set_volume_dirty(sb);
 
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
+	exfat_invalidate_empty_hint(dir);
+
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(dir));
 	if (err)
 		goto unlock;
@@ -1033,9 +1095,10 @@ static int exfat_rename_file(struct inode *parent_inode,
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
@@ -1067,6 +1130,7 @@ static int exfat_rename_file(struct inode *parent_inode,
 			}
 			goto put_old_es;
 		}
+		EXFAT_I(parent_inode)->hint_femp = next_hint;
 
 		exfat_remove_entries(parent_inode, &old_es, ES_IDX_FILE, false);
 		ei->dir = dir;
@@ -1094,6 +1158,7 @@ static int exfat_move_file(struct inode *parent_inode,
 	struct exfat_dentry *epmov, *epnew;
 	struct exfat_entry_set_cache mov_es, new_es;
 	struct exfat_chain newdir;
+	struct exfat_hint_femp next_hint;
 	unsigned int num_extra_entries, num_total_entries;
 
 	num_new_entries = exfat_calc_num_entries(p_uniname);
@@ -1111,7 +1176,7 @@ static int exfat_move_file(struct inode *parent_inode,
 	num_total_entries = num_new_entries + num_extra_entries;
 
 	newentry = exfat_find_empty_entry(parent_inode, &newdir,
-			num_total_entries, &new_es);
+			num_total_entries, &new_es, &next_hint);
 	if (newentry < 0) {
 		ret = newentry; /* -EIO or -ENOSPC */
 		goto put_mov_es;
@@ -1140,10 +1205,12 @@ static int exfat_move_file(struct inode *parent_inode,
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
 
@@ -1216,6 +1283,7 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
 	else
 		ret = exfat_move_file(new_parent_inode, &uni_name, ei);
+	exfat_invalidate_empty_hint(old_parent_inode);
 	if (!ret)
 		exfat_name_filter_add(new_parent_inode, &uni_name);
 	else
@@ -1232,6 +1300,8 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		}
 
 		exfat_remove_entries(new_inode, &es, ES_IDX_FILE, true);
+		exfat_invalidate_empty_hint(new_parent_inode);
+
 		ret = exfat_put_dentry_set(&es, IS_DIRSYNC(new_inode));
 		if (ret)
 			goto del_out;
-- 
2.34.1

