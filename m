Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C2131F9A8
	for <exfat@lists.linux.dev>; Sat, 19 Sep 2026 15:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789831402; cv=none; b=dxFDMzZEYgV6PvE2IGFYRNZbP3NwUkSCpIsHCffZPV75PVvRwYucJTXanHnJ/XcEehyGVVczWqmA8HcSvOGQlYG2hjrOXeqjIcKRcW9HBsgZ/LkkxzL9nJsx/bphjtCy7BBK66GFfd8O1wLAJUTrQxMb5EKcYnMUhyaxD0LKBBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789831402; c=relaxed/simple;
	bh=cIewCEDVPIV/7wNBrK2e4PdFrYXVEVX9ES+kWxB+nKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BStaUPknb5p7oRseCiigSfFKYqPSIeiHqL6gxO3x4pjd66ALBm1WJybZdVh42q6xTWcjI70GvEENEomFd0meZiUocdG4Z8B+Jfl9byGFXPs67+V479RT58hQm0QuopYxdxE8W4LomHD2oJ6AfEA91xIarRpDs6IgMs8JGQYcL4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHNb9WG2; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHNb9WG2"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1757651a91.2
        for <exfat@lists.linux.dev>; Sat, 19 Sep 2026 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789831399; x=1790436199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=du4V1DlmNl3hSpBenYXBBV0U8i2Xi5UFZbT98xYhvQo=;
        b=KHNb9WG2ifHTcjrw3+12wsh2XKATkZbw7z+d12Ay9+u0Wqw1LTDH8dy8VYEhAhMTLd
         jv1N9Wx6YMSEQTgZ6izpteXmOU2V0IlZ/agdIE2sZhKrTYAZJNbrrFJrlHFX0Z/p347I
         6mb0AetRu+MTu1bRgTu/DcZHsFv8iPATvIDUyZllkotpMuBhqTeXQNiA865GS4O1mTwB
         B82aqZEK4MxT5QutR/Mkzh9FEFOSzQNga9f9rAkFhxA1k34dteheovk223gITvOyw9QM
         9OZ2rqgzlOC1R8kVfn72M5u/Grs7LikDdmvcQ0GDVpD801BpiAi2tovENPJ4sv6SDukX
         r12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789831399; x=1790436199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=du4V1DlmNl3hSpBenYXBBV0U8i2Xi5UFZbT98xYhvQo=;
        b=KxFWTTVAy76aqXbXfzhNC/5OVAhElvVtOcNWy7LfCc5zwdNCXUQnHUkClLpDrC7neJ
         c2xDDLvQbAU+dSPsOtpZ4jaRS6gFGvyn5z0w3XVJP4vn3wkIVdt+FnqaauEzaaByWL6u
         1z/yK1OQLdq+6+Jt5t3lPENzgDkhaSWfRZh84Q0VTpju4Ili5F7nc+oTC0mKyzCQp/NA
         U9wzQVbibzEemOu9mUoQhkOLaXd9BPyXwID5j6y4FZ4QpF8Qff6Z7qpiK2rxYY9VxIR7
         nar6EVw+lu9WZbIXx78v1D9TJpRLwnEocUKHbpTHfhG6kH8jxgWXauhRbrmsDVNXSYfT
         oiLw==
X-Forwarded-Encrypted: i=1; AKwUvByotNo7wISp+t4A58/Jb+gzYkO5rD3sCbO7fsyEc3HNEoOi4iF168/BrqXbv7SX8+Y9Kg40Ew==@lists.linux.dev
X-Gm-Message-State: AFuF++mSVdSOYstYkPHZXkDl7Msi+yxjl2qZxlpy3iLnubmcf8OdjsG5
	2aP0AFksSqOSuL5Jnc3gpUKG5hPQ93wKVsDue/p2YUydyIo5TJTl+ONo
X-Gm-Gg: AYBFou2xmx9NVwp1Oq8Xyxem3AUl7oDMoHSHIhwEg1DboziOY+N6DlfvJfH4ZpMJvIl
	ccPpnYjoa8IX9Rrz/94ui0Qk2Dnrtyj8oredshMXYTYYH/Y5xKxrftC0eKYsOtA+AMAv6HZUYa3
	slgRdQML++kYzAC0D8giVkxmRPpof5KPpDyKg9Mjn89SAjEBZx55cTco6TX01NcbJay78E5kxqy
	oVs7+7Cn5BONxAFPaphtw8p06KuOymY/bbtbzQL0OobEGR5tmuO20J4XV2b+0UkePnGMHG9GB6K
	s8AVYa7XB3sqVzlrC1NuWWXxWrokH8YmjOEaXsGnNCOQbBUqJ0Z9dWFy4V+05HDPA9F7cSOBgqi
	UdclQv/zwjY8ezEkmcdFNtU3XyUBwLeCkk0/6DPAmHKX/0eEenDj7RuZP9zLmKM2XLJdLjSPek8
	Jqhv5aTnEoDO+HxJ27UDJ0OJ7iw7BBm/26qETF665yspTrkXarqKa9wfhyegXlXK2qk+q1ZADGu
	ObhF1veP9Yx
X-Received: by 2002:a17:90b:5784:b0:39e:6c68:c779 with SMTP id 98e67ed59e1d1-39e6c68ca1emr4003563a91.47.1789831399409;
        Sat, 19 Sep 2026 08:23:19 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0309d5760sm326230a91.4.2026.09.19.08.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 08:23:18 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v5 2/3] exfat: retain the next empty directory entry hint
Date: Sat, 19 Sep 2026 23:22:39 +0800
Message-Id: <20260919152240.1507914-3-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919152240.1507914-1-anmuxixixi@gmail.com>
References: <20260919152240.1507914-1-anmuxixixi@gmail.com>
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
invalidate the destination name filter on rename or move errors because
the new entry may already exist on disk.

This preserves the fast append path during bulk creation without allowing
stale hints or filters to hide or skip reusable directory entries.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 14 +++++++-
 fs/exfat/exfat_fs.h |  5 ++-
 fs/exfat/namei.c    | 86 +++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 96 insertions(+), 9 deletions(-)

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
index 83ded3b52a8c..6745cbce0c6d 100644
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
@@ -516,6 +571,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 						   dentry, ES_ALL_ENTRIES);
 		if (!cleanup_ret) {
 			exfat_remove_entries(inode, &es, ES_IDX_FILE, false);
+			exfat_invalidate_empty_hint(inode);
 			cleanup_ret = exfat_put_dentry_set(&es,
 							   IS_DIRSYNC(inode));
 		}
@@ -524,6 +580,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 			exfat_free_cluster(inode, &clu);
 		goto out;
 	}
+	EXFAT_I(inode)->hint_femp = next_hint;
 
 	info->entry = dentry;
 	exfat_name_filter_add(inode, &uniname);
@@ -628,7 +685,8 @@ static int exfat_find(struct inode *dir, const struct qstr *qname,
 		ei->hint_stat.clu = cdir.dir;
 		ei->hint_stat.eidx = 0;
 		ei->version = (inode_peek_iversion_raw(dir) & 0xffffffff);
-		ei->hint_femp.eidx = EXFAT_HINT_NONE;
+		if (!ei->name_filter)
+			ei->hint_femp.eidx = EXFAT_HINT_NONE;
 	}
 
 	/* search the file name for directories */
@@ -804,6 +862,8 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 
 	/* update the directory entry */
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
+	exfat_invalidate_empty_hint(dir);
+
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
 	if (err)
 		goto unlock;
@@ -958,6 +1018,8 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	exfat_set_volume_dirty(sb);
 
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
+	exfat_invalidate_empty_hint(dir);
+
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(dir));
 	if (err)
 		goto unlock;
@@ -1032,9 +1094,10 @@ static int exfat_rename_file(struct inode *parent_inode,
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
@@ -1066,6 +1129,7 @@ static int exfat_rename_file(struct inode *parent_inode,
 			}
 			goto put_old_es;
 		}
+		EXFAT_I(parent_inode)->hint_femp = next_hint;
 
 		exfat_remove_entries(parent_inode, &old_es, ES_IDX_FILE, false);
 		ei->dir = dir;
@@ -1093,6 +1157,7 @@ static int exfat_move_file(struct inode *parent_inode,
 	struct exfat_dentry *epmov, *epnew;
 	struct exfat_entry_set_cache mov_es, new_es;
 	struct exfat_chain newdir;
+	struct exfat_hint_femp next_hint;
 	unsigned int num_extra_entries, num_total_entries;
 
 	num_new_entries = exfat_calc_num_entries(p_uniname);
@@ -1110,7 +1175,7 @@ static int exfat_move_file(struct inode *parent_inode,
 	num_total_entries = num_new_entries + num_extra_entries;
 
 	newentry = exfat_find_empty_entry(parent_inode, &newdir,
-			num_total_entries, &new_es);
+			num_total_entries, &new_es, &next_hint);
 	if (newentry < 0) {
 		ret = newentry; /* -EIO or -ENOSPC */
 		goto put_mov_es;
@@ -1139,10 +1204,12 @@ static int exfat_move_file(struct inode *parent_inode,
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
 
@@ -1215,8 +1282,11 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
 	else
 		ret = exfat_move_file(new_parent_inode, &uni_name, ei);
+	exfat_invalidate_empty_hint(old_parent_inode);
 	if (!ret)
 		exfat_name_filter_add(new_parent_inode, &uni_name);
+	else
+		exfat_name_filter_free(new_parent_inode);
 
 	if (!ret && new_inode) {
 		struct exfat_entry_set_cache es;
@@ -1229,6 +1299,8 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		}
 
 		exfat_remove_entries(new_inode, &es, ES_IDX_FILE, true);
+		exfat_invalidate_empty_hint(new_parent_inode);
+
 		ret = exfat_put_dentry_set(&es, IS_DIRSYNC(new_inode));
 		if (ret)
 			goto del_out;
-- 
2.34.1
