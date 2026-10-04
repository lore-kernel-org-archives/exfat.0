Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248493A6B8E
	for <exfat@lists.linux.dev>; Sun,  4 Oct 2026 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122235; cv=none; b=EPK0wRCJLAhGroQHpBpNFYtVrHr9kTqrdSuXBDZSnCgvloz7LMQoZE150sSGtW6Kbz+QuuUSRfk1KyXsPUiJ2hUXQJe826W18JNQ3zD/1X9uzCCJB9x1emRKzKtleaFe+0VQVAzAtM+LuGMDH/MyK/UDFK9rRxqb8UPMumBnzWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122235; c=relaxed/simple;
	bh=SmxUTOeEsimMY8T3cjYKxgxa1vpCHX8vtgV/32XIEI8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CyaFZtz86ve/UH+74N0skeGlCxDW6T/4pl3r0M3pl3lstaefvtSHQvF5Z/lBbWlvugvh5sW0nSpEZm038i7NpbaHpVYOCf7Jqx5MkDusw1X9W0MWnCck9vRdduyL88VhXiVyhN9jcOMHIySTn5JRAzjptKgKkEwFce1DMT2KTqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLj47p+a; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLj47p+a"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso542317a91.1
        for <exfat@lists.linux.dev>; Sun, 04 Oct 2026 06:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791122228; x=1791727028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3trMBMZpfagYUlTL9p0CjVeAP3RgTgdYRSlV/47ZPto=;
        b=KLj47p+a7ubwpz/AWJnIINYoe2+daJQPm2TgcjYfUmkZ/Ip7nuFc4Zm54wWks9KTiZ
         sjOmUA99iXQ4TQbdMp44qKEkJWWQ1q7YqShzPF54Pk2/PGH3rOlGAn8Jx9vJXhAQqxOj
         d/zahQUZIRbDcUPOj4KKrmP+0AZpGzLG+XcIlViWbci4gO+J16XUA5Obi3INBMIS+YrU
         pZKLvm9df7IN0ooPwRYHkmvTx/kLcAC33DSYiIUai6kgwwb0JDysFgJhgtN8oGhvZBW6
         aZcSwpbl1ohG0BykZr1oOunw76FSYH5Uxi0W0PQ2BdKre+78fphRx+bg8yxy8h9K2E3E
         3skA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122228; x=1791727028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3trMBMZpfagYUlTL9p0CjVeAP3RgTgdYRSlV/47ZPto=;
        b=WCUNYbxK4O1o3fjGgbIS9iyynPhekn6M1tTvaAxqQETUvOoExIkZ8crE01mvzrC0VO
         0r4xW2AIh+4jM+P0751uexObDrqvleOVe1qT4KuAOUufzPpo/4Rv2Qo00rPSlFWvZoA6
         6Y8rxNh3dbmy09Ost2q1z76Np9/lNosYPItUtXQ0TP1HUXFTnUruf4JYtFBTHe+ypnPf
         5xDCZY9Inm+xtwauQlGi5Aa4V1flANfFtCS+uFu2tR2pgjrQoNbH4eLGNFHgdr1E13to
         zsTkLLlEpypgCzN9WPTxsFsq1srNqq1n/+p/hXNNB/A521Cplo0T/GsO30kMhQmYxvCi
         mVnw==
X-Forwarded-Encrypted: i=1; AKwUvByhtJFt562tGfdzEbPtk7jUfVpPnpnBs6v+8xB8shwRE0KCJrmAKhxzq02Vrs2tEYyoAvTuTw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJZ08MDnd9kG+zG4Ka4RmL+IgRV93tPnEN26HdJMkRkU/OT7M9+
	10Y6YaE4CFsd9l7IIXCDtykODCnpUc6qVgSBGtkSdqb1S7OfJN8qY549
X-Gm-Gg: AYBFou2SEWq//C5O9jEmo+87OP/Z6P3NBhdfuDFdbcKjBWODvJaCNu7opMFwuMGRjT0
	i4F5sVpFFBK4ocH4DdrEueCtVBbYhFXqXbD1QYbb++U/ZqyJ07FIubW1U+uDemFG1fJzyxFe6EL
	27RPb2K26XFQvYCEtiW6OWxnrKwnHO0F+qaLoFQYAB5tNrYAyNSBu5BwEkll6E/20oqy9lTE86r
	Oc+0QYRxCdnQV8hkBMjXvvSqfHSG/L9Nb5D7x/atlnWeIfiHqIucaiZmC/tmZ9RBs8WMIyFmNqa
	a5FlNz+EmQ7jf+i5/isM69h284YI+MtUR5V4JN75atJvRVR+E5koTrHN9Dsp/sThdu9XJbto8YR
	cZgSds83VswHpzS+1/sCRfSyBmOaQbqpa1qbObKesQ4LO1TJi/+gK5WZC7kbJyNEgMFkcPRDYwe
	3IDY5izwgqdWtIKjIGaABIRX0szqjQEDcCeYZByuJ84eaTLv8ZbzPH+56mii41ydGsAqdPW6cK6
	rLmwNrPn7RpDU6ciORsm74=
X-Received: by 2002:a17:90b:588c:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3a6ceec73c7mr7128120a91.67.1791122228364;
        Sun, 04 Oct 2026 06:57:08 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7cd433sm6876358a91.15.2026.10.04.06.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 06:57:08 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v7 1/3] exfat: add a Bloom filter for negative name lookups
Date: Sun,  4 Oct 2026 21:56:36 +0800
Message-Id: <20261004135638.1888530-2-anmuxixixi@gmail.com>
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
 fs/exfat/namei.c    |   9 ++-
 fs/exfat/super.c    |   1 +
 5 files changed, 208 insertions(+), 3 deletions(-)

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
index 41a2c7dfc479..e0314635924a 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -120,6 +120,11 @@ enum {
 #define DIR_CACHE_SIZE		\
 	(DIV_ROUND_UP(ES_MAX_ENTRY_NUM << DENTRY_SIZE_BITS, SECTOR_SIZE) + 1)
 
+#define EXFAT_NAME_FILTER_MIN_DENTRIES	1024
+#define EXFAT_NAME_FILTER_BITS_PER_DENTRY	4
+#define EXFAT_NAME_FILTER_MIN_ORDER	12
+#define EXFAT_NAME_FILTER_MAX_ORDER	25
+
 /* Superblock flags */
 #define EXFAT_FLAGS_SHUTDOWN	1
 
@@ -136,6 +141,8 @@ struct exfat_uni_name {
 	unsigned char name_len;
 };
 
+struct exfat_name_filter;
+
 /* directory structure */
 struct exfat_chain {
 	unsigned int dir;
@@ -285,6 +292,8 @@ struct exfat_inode_info {
 	struct exfat_hint hint_stat;
 	/* hint for first empty entry */
 	struct exfat_hint_femp hint_femp;
+	/* Complete, in-memory Bloom filter of directory names */
+	struct exfat_name_filter *name_filter;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -620,6 +629,12 @@ int exfat_read_volume_label(struct super_block *sb,
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
index 3c5746fc57d9..84045b704303 100644
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
 
@@ -803,7 +805,6 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 
 	/* update the directory entry */
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
-
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
 	if (err)
 		goto unlock;
@@ -958,7 +959,6 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	exfat_set_volume_dirty(sb);
 
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
-
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(dir));
 	if (err)
 		goto unlock;
@@ -1216,6 +1216,10 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
 	else
 		ret = exfat_move_file(new_parent_inode, &uni_name, ei);
+	if (!ret)
+		exfat_name_filter_add(new_parent_inode, &uni_name);
+	else
+		exfat_name_filter_free(new_parent_inode);
 
 	if (!ret && new_inode) {
 		struct exfat_entry_set_cache es;
@@ -1228,7 +1232,6 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		}
 
 		exfat_remove_entries(new_inode, &es, ES_IDX_FILE, true);
-
 		ret = exfat_put_dentry_set(&es, IS_DIRSYNC(new_inode));
 		if (ret)
 			goto del_out;
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

