Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18585505FC
	for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991920; cv=none; b=V2gQPrOI+FuMRRyTCs/VqgIu9ZHTYsmJDEYsO84KTce36K97BMFUyEMbtBE0CmmkGsmYAyNNFxR09drf4iLc7mrGYDBzqe85zeujD10naEBlOouX3ohPTaHfpoT97joJHHnLMqcbRShyZvAcsjRs8LVHsnlHmyCIITE0XzNc0BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991920; c=relaxed/simple;
	bh=6wsE1JkPjRxp32+2uIIe6GTdzBiDlLnaEpdPEY5j+vU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YeO1sTQ61HyvN2OWxdRrqeOV7W5dx5XHoqG9gH+D4Zj6cE8RuynW7RhQsjCuVxRM4/th+gFu12/UAkw5pYc0Qsug9j5X0shz/XF6PAmt+dWcFeqpbLkyw+o98+9ngKYdc+xQl45CrW9kFexXe8v86x4Mub10U2AXUu7jeX2l9aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8I7qUwY; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8I7qUwY"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8935f42e8f0so357502b3a.2
        for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991918; x=1792596718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIicrRKO6vWGicC4hEBx1Yph9A2GmZDZvg5/3dXyuEo=;
        b=R8I7qUwYhLmpJlz0fb/ndmfOv7VgFzmTHjkMhNyaU1p02fIp7OJqlaF2enJ3UVKoDR
         8UziQEPrUTn0Mh1cI81FvFr/FBwaMDXpjk3AeJ2e5Xv3Tscyuk3+Aebh0lbVSZ6dG7Sm
         QSyWUw/qfl/tlaSt4tYcN8EQXju/luv56QuLNXL6YD6MlI0CZ3M8DDIyTTbgkE5od5e7
         GhTUukuWp4V9XiS6YmRekwP7TnJ0TS7oJbf1YFDmCAUJwvyIeCDLq30Fft/f79VjrCwI
         2upELRVuDR3nFhKJjFMmCVMbQfL1CCTIpsYUAHux4/JXJsurisLBx3iUiEDYGeO7LEOp
         BEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991918; x=1792596718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIicrRKO6vWGicC4hEBx1Yph9A2GmZDZvg5/3dXyuEo=;
        b=CXSo5/I5yAojbyu+Ai/+MIfXYoUKvw40fhO/NiD8wYvNw/HVmchlchOBQ0hvL+aR+c
         va0WeYEN0mS9p2G5A1g3HyFV6n9rCXYoUsqksrZ0TLIfW4V8fYzaqlygJF2ukvMuXRxu
         y1gd1dZLJJoSHpgJfRd2GYFnvyuSCSjQE9iRIg9/rjhe+Sma8LQeJo4WzDXapMeyBmXb
         dJVPgm7B3QSfODE9bH9P6+BrQqr4lWb3s+S0rBaAzA+XE11sLpiCnjejOO4oS4L7V4UW
         qW6zipYYzhFAgW2eYAKfuyD1lDxan0VbCNYNwIs8OfvOOk/QOsA33rWFh49MXdz4SUD1
         nsyA==
X-Forwarded-Encrypted: i=1; AKwUvBzaiSaqngvVBvRDhTrTJuBppcHkRWJQBptkZRq/Qkm3AymVDdn/bUNAzccr8W1Tqcloqfpa4g==@lists.linux.dev
X-Gm-Message-State: AFq9FYIPADKKPOclN7XjmIMBVE9Q+K/4f0W+px5m1c1w0kW+oEBMOC+s
	RVKKFpQK4jufsYVUizHjDyK/ltSKBTUNnLOP8jVxwK5YyopBhRVuXbMd
X-Gm-Gg: AYBFou3FllYpRuGRM6iAzN19aNOSPgDQKySHA27RRBy4g3YP8/6jmZTgxuY2GFJ+JxE
	aY2XQlhpGaPgXsWpehG6VcAEPPDZGlT+MhG3D6ey9MLTlpAp9LE3xiku+guGNhaDQ2PQh6fOTaM
	6ak9w2w+7Qw4MnpRtzz8afsdjXUZDDaraD26duw8hyuLKFjrJokjsLSzIIXfIpvjg+Hkhg/u46v
	zU8kaT3GkRWYf1/fhlGqN/o4Wj+dY9DjzN+qbuQxrA/ewdrZhZGIKvK4juKf/bTgupT6nmuI5Fm
	SxnTFkFCP21kSf1LiDKlYkCpzXRyHlEamLzwg8G5DvmY1r9H0fuEWJldZRMcunR9Ix4/PBVn4dR
	ijOPHNbp9Ltb3UmrJP8rKwyl04kwggC6ynDx9Fk2y0wJLHo20HmM+NkJv5TwmfVOwxpsznsg+Wy
	tj8Ts+c59eipsNuV7Frz+bO8t+SO5q1TX/pKhCMZZaaes2uV/jqiIkjgzBHznpre/iXQklBhf5z
	tZYSm3yLb+e
X-Received: by 2002:a05:6a00:9a3:b0:84e:909:ac03 with SMTP id d2e1a72fcca58-897c64433eamr13113915b3a.10.1791991918295;
        Wed, 14 Oct 2026 08:31:58 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f51f452sm1221941b3a.1.2026.10.14.08.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:31:57 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v8 1/3] exfat: add a Bloom filter for negative name lookups
Date: Wed, 14 Oct 2026 23:31:28 +0800
Message-Id: <20261014153130.2111500-2-anmuxixixi@gmail.com>
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

Negative name lookups scan a directory from the beginning. Repeating this
scan before creating each file makes bulk creation approach O(N^2).

Add a per-directory Bloom filter and build it lazily after a directory
reaches 1024 on-disk entries. Size its bitmap at four bits per on-disk
entry, rounded up to a power of two and clamped between 512 bytes and
4 MiB. A definite miss skips the directory scan, while a possible
match follows the normal lookup path, so hash collisions cannot affect
correctness.

A short name needs at least three directory entries, so four bits per entry
provide at least 12 bits per name. A 512-byte bitmap covers about 340 short
names with a 1.07% false-positive rate, while one million short names use a
2 MiB bitmap with a 0.44% rate. The maximum directory uses at most a 4 MiB
bitmap.

Track the number of set bits exactly. Drop a filter when one third of its
bits are set, where the estimated false-positive rate is 3.70%, or when
directory growth requires a larger filter. Rebuild it after a later
complete negative lookup. Also invalidate the filter when committing a new
entry set fails, or when writing a renamed or moved entry reports an error,
because an entry can reach disk before failure is reported.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 185 ++++++++++++++++++++++++++++++++++++++++++++
 fs/exfat/exfat_fs.h |  15 ++++
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |   6 ++
 fs/exfat/super.c    |   1 +
 5 files changed, 208 insertions(+)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index 46514b13bebd..dcfaccdef2d8 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -8,10 +8,19 @@
 #include <linux/bio.h>
 #include <linux/buffer_head.h>
 #include <linux/filelock.h>
+#include <linux/hash.h>
+#include <linux/log2.h>
+#include <linux/stringhash.h>
 
 #include "exfat_raw.h"
 #include "exfat_fs.h"
 
+struct exfat_name_filter {
+	u32 nr_set_bits;
+	u8 order;
+	unsigned long bitmap[];
+};
+
 static int exfat_extract_uni_name(struct exfat_dentry *ep,
 		unsigned short *uniname)
 {
@@ -65,6 +74,178 @@ static int exfat_get_uniname_from_ext_entry(struct super_block *sb,
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
+				      u8 order,
+				      unsigned int indexes[3])
+{
+	u32 hash = exfat_name_filter_hash(sb, name);
+
+	indexes[0] = hash_32(hash, order);
+	indexes[1] = hash_32(hash ^ 0x9e3779b9U, order);
+	indexes[2] = hash_32(rol32(hash, 16) ^ 0x85ebca6bU,
+			     order);
+}
+
+static u8 exfat_name_filter_order(struct inode *inode)
+{
+	u64 dentries = exfat_bytes_to_dentries(i_size_read(inode));
+	u64 bits;
+
+	dentries = clamp_t(u64, dentries,
+			   EXFAT_NAME_FILTER_MIN_DENTRIES,
+			   MAX_EXFAT_DENTRIES);
+	bits = dentries * EXFAT_NAME_FILTER_BITS_PER_DENTRY;
+
+	return clamp_t(unsigned int, fls64(bits - 1),
+			EXFAT_NAME_FILTER_MIN_ORDER,
+			EXFAT_NAME_FILTER_MAX_ORDER);
+}
+
+static bool exfat_name_filter_set(struct exfat_name_filter *filter,
+				  const unsigned int indexes[3])
+{
+	unsigned long nr_bits = BIT(filter->order);
+	int i;
+
+	for (i = 0; i < 3; i++)
+		if (!__test_and_set_bit(indexes[i], filter->bitmap))
+			filter->nr_set_bits++;
+
+	return filter->nr_set_bits >= nr_bits / 3;
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
+	struct exfat_name_filter *filter = ei->name_filter;
+	unsigned int indexes[3];
+
+	if (!filter)
+		return true;
+
+	exfat_name_filter_indexes(inode->i_sb, name, filter->order, indexes);
+	return test_bit(indexes[0], filter->bitmap) &&
+	       test_bit(indexes[1], filter->bitmap) &&
+	       test_bit(indexes[2], filter->bitmap);
+}
+
+void exfat_name_filter_add(struct inode *inode,
+			   const struct exfat_uni_name *name)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+	struct exfat_name_filter *filter = ei->name_filter;
+	unsigned int indexes[3];
+
+	if (!filter)
+		return;
+
+	if (exfat_name_filter_order(inode) > filter->order) {
+		exfat_name_filter_free(inode);
+		return;
+	}
+
+	exfat_name_filter_indexes(inode->i_sb, name, filter->order, indexes);
+	if (exfat_name_filter_set(filter, indexes))
+		exfat_name_filter_free(inode);
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
+	struct exfat_name_filter *filter;
+	struct exfat_chain clu;
+	unsigned int clu_count = 0;
+	struct inode *inode = &ei->vfs_inode;
+	struct exfat_sb_info *sbi = EXFAT_SB(sb);
+	u8 order;
+	int i;
+
+	if (ei->name_filter ||
+	    exfat_bytes_to_dentries(i_size_read(inode)) <
+					EXFAT_NAME_FILTER_MIN_DENTRIES)
+		return;
+
+	order = exfat_name_filter_order(inode);
+	filter = kvzalloc(struct_size(filter, bitmap,
+				      BITS_TO_LONGS(BIT(order))), GFP_NOFS);
+	if (!filter)
+		return;
+	filter->order = order;
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
+			exfat_name_filter_indexes(sb, &name, order, indexes);
+			if (exfat_name_filter_set(filter, indexes))
+				goto abort;
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
@@ -1035,6 +1216,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 
 	if (num_entries < 0)
 		return num_entries;
+	if (!exfat_name_filter_maybe_contains(&ei->vfs_inode, p_uniname))
+		return -ENOENT;
 
 	dentries_per_clu = sbi->dentries_per_clu;
 
@@ -1196,6 +1379,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 		ei->hint_femp.count = 0;
 	}
 
+	exfat_build_name_filter(sb, ei, p_dir);
+
 	/* initialized hint_stat */
 	hint_stat->clu = p_dir->dir;
 	hint_stat->eidx = 0;
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index 43c034532ec5..015860883fa8 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -121,6 +121,11 @@ enum {
 #define DIR_CACHE_SIZE		\
 	(DIV_ROUND_UP(ES_MAX_ENTRY_NUM << DENTRY_SIZE_BITS, SECTOR_SIZE) + 1)
 
+#define EXFAT_NAME_FILTER_MIN_DENTRIES	1024
+#define EXFAT_NAME_FILTER_BITS_PER_DENTRY	4
+#define EXFAT_NAME_FILTER_MIN_ORDER	12
+#define EXFAT_NAME_FILTER_MAX_ORDER	25
+
 /* Superblock flags */
 #define EXFAT_FLAGS_SHUTDOWN	1
 
@@ -137,6 +142,8 @@ struct exfat_uni_name {
 	unsigned char name_len;
 };
 
+struct exfat_name_filter;
+
 /* directory structure */
 struct exfat_chain {
 	unsigned int dir;
@@ -286,6 +293,8 @@ struct exfat_inode_info {
 	struct exfat_hint hint_stat;
 	/* hint for first empty entry */
 	struct exfat_hint_femp hint_femp;
+	/* Complete, in-memory Bloom filter of directory names */
+	struct exfat_name_filter *name_filter;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -676,6 +685,12 @@ int exfat_read_volume_label(struct super_block *sb,
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
index 5129df1e79b4..fde110da74ee 100644
--- a/fs/exfat/inode.c
+++ b/fs/exfat/inode.c
@@ -447,6 +447,7 @@ struct inode *exfat_build_inode(struct super_block *sb,
 void exfat_evict_inode(struct inode *inode)
 {
 	truncate_inode_pages_final(&inode->i_data);
+	exfat_name_filter_free(inode);
 
 	if (!inode->i_nlink) {
 		i_size_write(inode, 0);
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 86c8c18d363f..5e47ca1bf722 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -512,6 +512,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	if (ret) {
 		int cleanup_ret;
 
+		exfat_name_filter_free(inode);
 		cleanup_ret = exfat_get_dentry_set(&es, sb, &info->dir,
 						   dentry, ES_ALL_ENTRIES);
 		if (!cleanup_ret) {
@@ -526,6 +527,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	}
 
 	info->entry = dentry;
+	exfat_name_filter_add(inode, &uniname);
 	info->flags = ALLOC_NO_FAT_CHAIN;
 	info->type = type;
 
@@ -1216,6 +1218,10 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
 	else
 		ret = exfat_move_file(new_parent_inode, &uni_name, ei);
+	if (!ret)
+		exfat_name_filter_add(new_parent_inode, &uni_name);
+	else
+		exfat_name_filter_free(new_parent_inode);
 
 	if (!ret && new_inode) {
 		struct exfat_entry_set_cache es;
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 4943cef97741..4924f0fad836 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -209,6 +209,7 @@ static struct inode *exfat_alloc_inode(struct super_block *sb)
 	if (!ei)
 		return NULL;
 
+	ei->name_filter = NULL;
 	return &ei->vfs_inode;
 }
 
-- 
2.34.1

