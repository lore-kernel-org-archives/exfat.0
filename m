Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC883B4404
	for <exfat@lists.linux.dev>; Wed, 23 Sep 2026 12:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166831; cv=none; b=OtazPYPKXDu3gPk/R2ZSiizsSbZua/fxMAMiQ+Mr3LQ1jruY0XGrQHlhkwLuIqbJTBkmdJBBAnSyeI3UzCVKdnLDEhPXE9hiK+29cmbKUF8RsU0X1kvTt154etdq1etAYRH+Yx8kyezmLfPm2Y8bhoRYUNs/sddV78/hyNk6kx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166831; c=relaxed/simple;
	bh=6l9516gS2SUOGkjg72Rqa9sj7iRiVKbXCTIgAWWsGz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cfb/Qqw0n1ganhnxIECjlup0igPBCC2jd+xDfVo4kYX0tQyN0Qm5Z2miH45pOSL5uFVnDj3jmAdoKTXlRJQSGwXcscjdQztcHKhEaBOROK0ip/OoNYcE7veAv/3lscyE/B7tjY0S8J0lNzSaiPQPbTIgY+Q2xoffjH0e+G81n+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODBBpns5; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODBBpns5"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0b25dso4949485ad.2
        for <exfat@lists.linux.dev>; Wed, 23 Sep 2026 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166825; x=1790771625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvsVBGUxkg9/q08FYuaFBexA0miT2gtZIuRNd0MYRn4=;
        b=ODBBpns5/UzByOTGv/FDgJYOi+0pKfWcJAAagzloev11sXGNKmb5Q0mhl4XkNdGAqh
         fjp3nTLW1FDdcN0mpkV6D/TkrBbOGFn3EHRgX38EnBHP46JssfrvVSKxVSk3x9p2b/pU
         3fQMQ9sv1VjhCDI+NQpf2E+aVHxNa46a9u/zILs6f2XlTttXBWEo4qS2WzeTp6Obk88N
         d1c921Cnht66rDIuRiTWIjpePDEM6XjHUHxYegP/fLZ85WpctjTV2Ana9uxpxVYCwL1w
         2vyuBX6qKz8a5NlvpqfQ3Z/ZHN1mnbTkE6+KdjMtBw5JL+fkc4DNI9zV1hksXdNl5IE5
         8g9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166825; x=1790771625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AvsVBGUxkg9/q08FYuaFBexA0miT2gtZIuRNd0MYRn4=;
        b=maTndA/f0VG4Ku5JLH6GZoPQnYspY7j8S5TEFMYHCFTDzdwH+zDfEi63JEYeUVXPO/
         JVoHsVGUIQANRjWJCeqp5+k6YaC6ojSPKMcBLbV5sTlL3QaQ/mU6gXQMYuhz2a/SM5qF
         cLXSSuxrD7NjaMABIQWlQz2SC7LOUZbDU3G7zPw2BK5t8/x09bsaW6ZG9hXc2xl79Jhr
         O9QzlPvywMGNB0niJqFGKmsjm+fkgdBIp/pxxjDeNRCkx1Xbcn/pp+/gp5KfzW/WCnHj
         zDvfnmrMtvyqfp5LslUuHsGw0CXOadev9Du4pBWKO32d/Bq6ANP6LTPgEtcU2D2VRLnf
         aFew==
X-Forwarded-Encrypted: i=1; AKwUvBxq/+WiXa8BOPtupQ40WW4cgnSkCwGja1noToHufKJgLWt3dnJr2aUxxTZp3AlPouWfvaX3Cw==@lists.linux.dev
X-Gm-Message-State: AFuF++lFJ8AKNZJ3VCGtXWZYgVk987XtX+LXz2Ncx5Ps6Xltq6UuP3pR
	wvuuslUdc9xhhX+Wasnn6SESfXUVwgVsiufK0lPTvVesF9dCXoX4Nfsu
X-Gm-Gg: AYBFou14lzQmRSGcZ9j7df5v2mcCMmr5GAtJ6Dtvnl30PIvnCIkzwzw13YJghX/vUfs
	TE0JkCNOAaJlWWWIRImZRP9N5RlGoGzs1+ZhmnWtpvtcassMj3fIapRJ1+8jc+dojomCFkM6qlR
	g1lFne6yFc2ozKKA/fmgzxJJnnNOnt5BKb9kdbe7uDN1bYvS+8ohgeW/XYuAXBwcVl4RP3z0qR+
	4XjDi0mPFytICLmWwxvv+L3FNP6gd/gvpmQHoxJCtWDphLVNvN7Bgj4oMUWOmBErq3uyfT3fcb1
	fKJwWNvGbR4il58eEjzBHpanHHxDjJ5QjTYWc3HfBgzxqq7Nl5eC181TpuBfi4pExqtfcNRBDuL
	x7SGYiKocsp21COWMVRU5ATVEbaSCoOboDJswrqvMSLrRRRuCMgAyn5EflXN9CANqlYZ8BUh8Kc
	vpjbKmKg/mRIKCxSfsGIVdjNvztcZJuwAdtDGO8mn6eiFqZsVBJMW8lK6Sz7oXB8QmfuVAKmuH8
	U5nI62IExLz
X-Received: by 2002:a17:902:cecf:b0:2dd:c100:312e with SMTP id d9443c01a7336-2df69dd595amr21612535ad.42.1790166824794;
        Wed, 23 Sep 2026 05:33:44 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm9510475ad.19.2026.09.23.05.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:33:44 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v6 2/3] exfat: retain the next empty directory entry hint
Date: Wed, 23 Sep 2026 20:32:59 +0800
Message-Id: <20260923123300.1626723-3-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923123300.1626723-1-anmuxixixi@gmail.com>
References: <20260923123300.1626723-1-anmuxixixi@gmail.com>
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
index 0c5648e23e20..08b7a50de871 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -1109,6 +1109,7 @@ static inline void exfat_reset_empty_hint(struct exfat_hint_femp *hint_femp)
 {
 	hint_femp->eidx = EXFAT_HINT_NONE;
 	hint_femp->count = 0;
+	hint_femp->min_entries = 0;
 }
 
 static inline void exfat_set_empty_hint(struct exfat_inode_info *ei,
@@ -1122,6 +1123,7 @@ static inline void exfat_set_empty_hint(struct exfat_inode_info *ei,
 		if (candi_empty->count == 0) {
 			candi_empty->cur = *clu;
 			candi_empty->eidx = dentry;
+			candi_empty->min_entries = num_entries;
 		}
 
 		if (entry_type == TYPE_UNUSED)
@@ -1332,6 +1334,7 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 		ei->hint_femp.cur.dir = EXFAT_EOF_CLUSTER;
 		ei->hint_femp.eidx = p_dir->size * dentries_per_clu;
 		ei->hint_femp.count = 0;
+		ei->hint_femp.min_entries = num_entries;
 	}
 
 	exfat_build_name_filter(sb, ei, p_dir);
@@ -1431,6 +1434,7 @@ static int exfat_get_volume_label_dentry(struct super_block *sb,
 					hint_femp.cur = clu;
 					hint_femp.eidx = dentry;
 					hint_femp.count = 1;
+					hint_femp.min_entries = 1;
 				}
 			}
 
@@ -1464,6 +1468,7 @@ static int exfat_get_volume_label_dentry(struct super_block *sb,
 		hint_femp.cur.dir = EXFAT_EOF_CLUSTER;
 		hint_femp.eidx = dentry;
 		hint_femp.count = 0;
+		hint_femp.min_entries = 1;
 	}
 
 	ei->hint_femp = hint_femp;
@@ -1518,7 +1523,9 @@ int exfat_write_volume_label(struct super_block *sb,
 	struct inode *root_inode = sb->s_root->d_inode;
 	struct exfat_entry_set_cache es;
 	struct exfat_chain clu;
+	struct exfat_hint_femp next_hint;
 	struct exfat_dentry *ep;
+	bool entry_allocated = false;
 
 	if (label->name_len > EXFAT_VOLUME_LABEL_LEN)
 		return -EINVAL;
@@ -1533,7 +1540,10 @@ int exfat_write_volume_label(struct super_block *sb,
 			goto unlock;
 		}
 
-		ret = exfat_find_empty_entry(root_inode, &clu, 1, &es);
+		ret = exfat_find_empty_entry(root_inode, &clu, 1, &es,
+					     &next_hint);
+		if (ret >= 0)
+			entry_allocated = true;
 	}
 
 	if (ret < 0)
@@ -1558,6 +1568,8 @@ int exfat_write_volume_label(struct super_block *sb,
 	es.modified = true;
 
 	ret = exfat_put_dentry_set(&es, IS_DIRSYNC(root_inode));
+	if (!ret && entry_allocated)
+		EXFAT_I(root_inode)->hint_femp = next_hint;
 
 unlock:
 	mutex_unlock(&sbi->s_lock);
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index 899b276f105b..3bbfa7092c0d 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -154,6 +154,8 @@ struct exfat_hint_femp {
 	int eidx;
 	/* count of continuous empty entry */
 	int count;
+	/* minimum entry-set size for which this hint is safe */
+	int min_entries;
 	/* the cluster that first empty slot exists in */
 	struct exfat_chain cur;
 };
@@ -581,7 +583,8 @@ extern const struct dentry_operations exfat_dentry_ops;
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

