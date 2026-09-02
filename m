Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2061035F602
	for <exfat@lists.linux.dev>; Wed,  2 Sep 2026 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362741; cv=none; b=bsnIrz6Mw/e3DvTlhRnzdIzrIs69cicT5/gbVhe1kcIJYdpBb3e5yiRtMPZy9Ay5nbd1YMB+cIW624l4sQBvNvXKY12DysjycMIHFCEroPuKw1JI91Rk79I6f+UGNKtuK9mTDIqTUe6mxhtEEDxv7FH9WKPIVGJcz9cBCnQgQK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362741; c=relaxed/simple;
	bh=vdnxUDzAMzKxj1Sl6XAuhDSq9GQuOcAfHPdObwwi9lg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IxFPw3ZYjjvbbM+LcgNXbc4Sccr6eDNCtXYZFi4iGhABm2lFR1NBhKHMeajIldKAyvfTnMF2iFjfGEqT+3l69M3SlhC7q+yflVC3yqbJdYXXTfwFUgsfdyEKaWgOSkFwCf/jBKaW5+5cHLnH8E1PTPGdpj0/XPPMqtPeBARJlKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShBdzmOd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShBdzmOd"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1426784a91.2
        for <exfat@lists.linux.dev>; Wed, 02 Sep 2026 08:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362739; x=1788967539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKUQ99wuylFJvuvslMRQYoPvh++T8GD2C+XNyd/ppOc=;
        b=ShBdzmOdyd7BuadZpi8ou50z8hhC5b9OlFMKTGgGNULISN1D1sCuSZaNyo3xmN8niK
         RNbdiQGKOoeIeAKL5XEwjgNNHIqIPxx0VdWtOpTRdvrenN69Q6vq99tUtg4PBh90clMS
         j8wQ0zOtCr58ylbWDeORCZOY0OrhUTFpNwrWo8i8bv0Wphk6iLVG4U0muchf2sBM95H+
         uNeERFupFRpzXi2zNrpB3zPQ18WA2+To82En30tKF+9UOoJdB4rghHd2T7uZbgij3JWN
         34Elpqa8eTFf6lJZjkHBgHY47y2PUDWA+ykldk9WaA5ESPS/iKsvGEVtST55zsfTi5H7
         sGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362739; x=1788967539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKUQ99wuylFJvuvslMRQYoPvh++T8GD2C+XNyd/ppOc=;
        b=gDsrGxdGPcoQNq5M5IsPYnQmLaBf6POi9JwfQbIB3Nrm1evM72fAaaPGUFWo2RsyhS
         eO+0OCG9piNbJvxeyJkYnCPRk+9RvgVaXRSFsAsM3AKhL+03AJAdfh4trDF87xIbuGyG
         QC53l6k38PKB2zEuMxFH7oT/p641nW0vxJlyUlwaaReeyBo2kUe2izqcVSNkRG3SDaef
         WYI9pSOA7zhOPIhWw9/s+fy6CLwmlk9sMa8qzmghna5rCFXEanZ7gWGSeNAr24RK5AE4
         9NcbQ0++sbmrc9AhfC0k+wZUICTneONuAan/P5kkqiFQHy/wyt6LWWcU0Y7PfbAne3oU
         eQRA==
X-Forwarded-Encrypted: i=1; AKwUvByLWZ5mGhT9hW/6bWp6PARPyztbu/YAaGyw8H/W4lo9nLhGPbTHMPYeOvf1oUZ6M41fjm2oVg==@lists.linux.dev
X-Gm-Message-State: AFuF++m4nX9eYdrM3cb36yxsmminomI7r6QjEVO3oBs4OmdRLO6j1CQ4
	Y5TGxLk6q6jg8YzwUJc46xmW9JAIdtS7Ehlb4foEgkyeH7nQ2D63CHq9
X-Gm-Gg: AYBFou3b6zF6kSqRhugNWaBzfsT/7gfpJTiHZLKUEYQzEYs6nmJAf0+K8XUFPOvuD7R
	FXW2UJ65u+lRyh8hV6Hp6+D3PlCGnSbEHSU7CRMYlonphkFDXhQsxvNXca0atc9h2brUT4JKeO0
	lk5ex6BDyZB1Aw3Ss1wgXRlMavwyVGJB9rBXQRLFwQodOBwaFLPSKkTteXv3weDu2QUoRo17nZn
	dMBwEHyG3rKdQQCzmJTnD5OlL0/X4CALf9YkjTC2pHlCRhXMW8Gsr7y1G/SayUlk66tfTQJknn9
	M8wVA1we9dern3cn9VXw0wWcsKN1BaNNDU99kKkXvwxsN6qJq7LxFyfW7aCC7oAgq3Xy0rJe+NS
	ODuDHAJuJ4FjKKmKTfG80j1rPagnk8E449pKdDgAYXtjmGfasi78djFj0OX5AgIUaZhOx2rF1pT
	bIJH1I7FM6W5Kzc2mOUIAgF5AE0dAVBVUDA/UdEIbwhlVxd4DALMy0o2rt/KyBiVBo1OsmIDbwt
	g==
X-Received: by 2002:a17:90b:2604:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39aedce056cmr8573120a91.0.1788362739146;
        Wed, 02 Sep 2026 08:25:39 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd21e9dsm12359242a91.4.2026.09.02.08.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:25:37 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v3 1/3] exfat: add a Bloom filter for negative name lookups
Date: Wed,  2 Sep 2026 23:24:53 +0800
Message-Id: <20260902152455.1273557-2-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902152455.1273557-1-anmuxixixi@gmail.com>
References: <20260902152455.1273557-1-anmuxixixi@gmail.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Negative name lookups scan a directory from the beginning. Repeating this
scan before creating each file makes bulk creation approach O(N^2).

Add a 64 KiB per-directory Bloom filter. Build it lazily after a directory
reaches 1024 on-disk entries. A definite miss skips the directory scan,
while a possible match follows the normal lookup path so hash collisions
cannot affect correctness.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 140 ++++++++++++++++++++++++++++++++++++++++++++
 fs/exfat/exfat_fs.h |  13 ++++
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |   6 +-
 fs/exfat/super.c    |   1 +
 5 files changed, 158 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index fe73b1380c5d..5145f09bcee6 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -8,6 +8,8 @@
 #include <linux/bio.h>
 #include <linux/buffer_head.h>
 #include <linux/filelock.h>
+#include <linux/hash.h>
+#include <linux/stringhash.h>
 
 #include "exfat_raw.h"
 #include "exfat_fs.h"
@@ -65,6 +67,140 @@ static int exfat_get_uniname_from_ext_entry(struct super_block *sb,
 	return 0;
 }
 
+static u32 exfat_name_filter_hash(struct super_block *sb,
+				  const struct exfat_uni_name *name)
+{
+	unsigned long hash = init_name_hash(NULL);
+	int i;
+
+	for (i = 0; i < name->name_len; i++)
+		hash = partial_name_hash(exfat_toupper(sb, name->name[i]), hash);
+
+	return end_name_hash(hash);
+}
+
+static void exfat_name_filter_indexes(struct super_block *sb,
+				      const struct exfat_uni_name *name,
+				      unsigned int indexes[3])
+{
+	u32 hash = exfat_name_filter_hash(sb, name);
+
+	indexes[0] = hash_32(hash, EXFAT_NAME_FILTER_ORDER);
+	indexes[1] = hash_32(hash ^ 0x9e3779b9U, EXFAT_NAME_FILTER_ORDER);
+	indexes[2] = hash_32(rol32(hash, 16) ^ 0x85ebca6bU,
+			     EXFAT_NAME_FILTER_ORDER);
+}
+
+void exfat_name_filter_free(struct inode *inode)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
+	kvfree(ei->name_filter);
+	ei->name_filter = NULL;
+}
+
+bool exfat_name_filter_maybe_contains(struct inode *inode,
+				      const struct exfat_uni_name *name)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+	unsigned int indexes[3];
+
+	if (!ei->name_filter)
+		return true;
+
+	exfat_name_filter_indexes(inode->i_sb, name, indexes);
+	return test_bit(indexes[0], ei->name_filter) &&
+	       test_bit(indexes[1], ei->name_filter) &&
+	       test_bit(indexes[2], ei->name_filter);
+}
+
+void exfat_name_filter_add(struct inode *inode,
+			   const struct exfat_uni_name *name)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+	unsigned int indexes[3];
+
+	if (!ei->name_filter)
+		return;
+
+	exfat_name_filter_indexes(inode->i_sb, name, indexes);
+	__set_bit(indexes[0], ei->name_filter);
+	__set_bit(indexes[1], ei->name_filter);
+	__set_bit(indexes[2], ei->name_filter);
+}
+
+/*
+ * Build a complete filter only after a directory becomes large enough for
+ * repeated negative linear lookups to matter. A filter hit is never trusted:
+ * it only allows definite misses to skip the on-disk scan.
+ */
+static void exfat_build_name_filter(struct super_block *sb,
+				    struct exfat_inode_info *ei,
+				    struct exfat_chain *p_dir)
+{
+	unsigned long *filter;
+	struct exfat_chain clu;
+	unsigned int clu_count = 0;
+	struct inode *inode = &ei->vfs_inode;
+	struct exfat_sb_info *sbi = EXFAT_SB(sb);
+	int i;
+
+	if (ei->name_filter ||
+	    exfat_bytes_to_dentries(i_size_read(inode)) <
+					EXFAT_NAME_FILTER_MIN_DENTRIES)
+		return;
+
+	filter = kvzalloc(EXFAT_NAME_FILTER_BYTES, GFP_NOFS);
+	if (!filter)
+		return;
+
+	exfat_chain_dup(&clu, p_dir);
+	while (clu.dir != EXFAT_EOF_CLUSTER) {
+		for (i = 0; i < sbi->dentries_per_clu; i++) {
+			struct exfat_uni_name name = { };
+			struct exfat_dentry *ep;
+			struct buffer_head *bh;
+			unsigned int type;
+			unsigned int indexes[3];
+			int len;
+
+			ep = exfat_get_dentry(sb, &clu, i, &bh);
+			if (!ep)
+				goto abort;
+
+			type = exfat_get_entry_type(ep);
+			brelse(bh);
+			if (type == TYPE_UNUSED)
+				goto complete;
+			if (type != TYPE_FILE && type != TYPE_DIR)
+				continue;
+
+			if (exfat_get_uniname_from_ext_entry(sb, &clu, i, name.name))
+				goto abort;
+			for (len = 0; len <= MAX_NAME_LENGTH && name.name[len]; len++)
+				;
+			if (!len || len > MAX_NAME_LENGTH)
+				goto abort;
+			name.name_len = len;
+			exfat_name_filter_indexes(sb, &name, indexes);
+			__set_bit(indexes[0], filter);
+			__set_bit(indexes[1], filter);
+			__set_bit(indexes[2], filter);
+		}
+
+		if (exfat_chain_advance(sb, &clu, 1))
+			goto abort;
+		if (unlikely(++clu_count > EXFAT_DATA_CLUSTER_COUNT(sbi)))
+			goto abort;
+	}
+
+complete:
+	ei->name_filter = filter;
+	return;
+abort:
+	kvfree(filter);
+}
+
 /* read a directory entry from the opened directory */
 static int exfat_readdir(struct inode *inode, loff_t *cpos, struct exfat_dir_entry *dir_entry)
 {
@@ -992,6 +1128,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 
 	if (num_entries < 0)
 		return num_entries;
+	if (!exfat_name_filter_maybe_contains(&ei->vfs_inode, p_uniname))
+		return -ENOENT;
 
 	dentries_per_clu = sbi->dentries_per_clu;
 
@@ -1153,6 +1291,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 		ei->hint_femp.count = 0;
 	}
 
+	exfat_build_name_filter(sb, ei, p_dir);
+
 	/* initialized hint_stat */
 	hint_stat->clu = p_dir->dir;
 	hint_stat->eidx = 0;
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index a9131fe03302..5187dee47cf1 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -120,6 +120,11 @@ enum {
 #define DIR_CACHE_SIZE		\
 	(DIV_ROUND_UP(ES_MAX_ENTRY_NUM << DENTRY_SIZE_BITS, SECTOR_SIZE) + 1)
 
+#define EXFAT_NAME_FILTER_ORDER		19
+#define EXFAT_NAME_FILTER_BITS		BIT(EXFAT_NAME_FILTER_ORDER)
+#define EXFAT_NAME_FILTER_BYTES		(EXFAT_NAME_FILTER_BITS >> 3)
+#define EXFAT_NAME_FILTER_MIN_DENTRIES	1024
+
 /* Superblock flags */
 #define EXFAT_FLAGS_SHUTDOWN	1
 
@@ -284,6 +289,8 @@ struct exfat_inode_info {
 	struct exfat_hint hint_stat;
 	/* hint for first empty entry */
 	struct exfat_hint_femp hint_femp;
+	/* Complete, in-memory Bloom filter of directory names */
+	unsigned long *name_filter;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -619,6 +626,12 @@ int exfat_read_volume_label(struct super_block *sb,
 int exfat_write_volume_label(struct super_block *sb,
 			     struct exfat_uni_name *label);
 
+bool exfat_name_filter_maybe_contains(struct inode *inode,
+				      const struct exfat_uni_name *name);
+void exfat_name_filter_add(struct inode *inode,
+			   const struct exfat_uni_name *name);
+void exfat_name_filter_free(struct inode *inode);
+
 static inline int exfat_chain_advance(struct super_block *sb,
 		struct exfat_chain *chain, unsigned int step)
 {
diff --git a/fs/exfat/inode.c b/fs/exfat/inode.c
index ccd13630187e..0d0c6f817775 100644
--- a/fs/exfat/inode.c
+++ b/fs/exfat/inode.c
@@ -445,6 +445,7 @@ struct inode *exfat_build_inode(struct super_block *sb,
 void exfat_evict_inode(struct inode *inode)
 {
 	truncate_inode_pages_final(&inode->i_data);
+	exfat_name_filter_free(inode);
 
 	if (!inode->i_nlink) {
 		i_size_write(inode, 0);
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index a4dc83b5949c..96f33226f2c0 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -526,6 +526,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	}
 
 	info->entry = dentry;
+	exfat_name_filter_add(inode, &uniname);
 	info->flags = ALLOC_NO_FAT_CHAIN;
 	info->type = type;
 
@@ -802,7 +803,6 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 
 	/* update the directory entry */
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
-
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
 	if (err)
 		goto unlock;
@@ -957,7 +957,6 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	exfat_set_volume_dirty(sb);
 
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
-
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(dir));
 	if (err)
 		goto unlock;
@@ -1215,6 +1214,8 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
 	else
 		ret = exfat_move_file(new_parent_inode, &uni_name, ei);
+	if (!ret)
+		exfat_name_filter_add(new_parent_inode, &uni_name);
 
 	if (!ret && new_inode) {
 		struct exfat_entry_set_cache es;
@@ -1227,7 +1228,6 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		}
 
 		exfat_remove_entries(new_inode, &es, ES_IDX_FILE, true);
-
 		ret = exfat_put_dentry_set(&es, IS_DIRSYNC(new_inode));
 		if (ret)
 			goto del_out;
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index a9ea36ba2693..f73cf2d02365 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -195,6 +195,7 @@ static struct inode *exfat_alloc_inode(struct super_block *sb)
 	if (!ei)
 		return NULL;
 
+	ei->name_filter = NULL;
 	return &ei->vfs_inode;
 }
 
-- 
2.34.1
