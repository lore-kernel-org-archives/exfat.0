Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADB843CEFE
	for <exfat@lists.linux.dev>; Wed, 23 Sep 2026 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166821; cv=none; b=cWTestKNAtxpF3h/G31JAhNlK4uqHLhiNoHfv7vBElFu8qGzi7nh6Zl0nRG3wEjpgpbnxLysgOLxO8Ab8cTNRPOTOuJgi4pfq/UhoOHczU1zxF62AnDGF/JZBBpr65a9OyYG94fY0rdvz4YrutchfLYI2ViR0OF/wIciEHwFxKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166821; c=relaxed/simple;
	bh=NgUdDd1JzQo0Y023VbbGxYFxCUtQ+JWNda0iLPrCCiw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qJRgvj1PlsXd3nLaGNhuvKopLjn4r8eMmz05fUZgZdcR8MycHh/Ve8zGy4t+82JAnLv5qW6IrXvSCwvyXVW94Ms1Sa8I4cFi4sibRyKJQpx7XSgcjcmvN7OatU83FjbFrrahqgwL5iSUhCwlC7b45x0PPLYAOpCQEwL/m3j6CT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vr21t2JU; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vr21t2JU"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b43b20bso3936115ad.1
        for <exfat@lists.linux.dev>; Wed, 23 Sep 2026 05:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166814; x=1790771614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jESetB1H5u5xF2KQ3sWXmhFOEqlKjQmaiAkNv9ckpCg=;
        b=Vr21t2JUGryQdkg1+9jM19Toat+aYJc5SAUeZxi90OiBy34n6o3pu3/blp2ElryiZy
         3QOUeEtMw4yVH9S+u3xKrHIftV5nc/9quEZqaduqKgJTiJgkxt2CMmc//MJcOPuRxNnN
         PJqWCLQtjVcyf4hVpXPpE23pKF+eiP3pDFJfi/eIuAKUY3bbudkjL0NbCpldr7QUMKBA
         vxE+h7VnWBvY2IFy46uqDi4G89XJl0HLJgsG+v3JKLcaqi4qS34+LXKZuWkCCTu00pwb
         gqW7z6x/Zc2QnWtSJKeWvllQe+OB4UVqNfLWi1TRkpP+/KjNJSzUjR6O02pJw8RiYYd2
         dp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166814; x=1790771614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jESetB1H5u5xF2KQ3sWXmhFOEqlKjQmaiAkNv9ckpCg=;
        b=i4jULjnEvcsCNBjGKzHAeL5F6dFBRCw3jcTwfwGvxFwwblUk+srD0KGTywcjffS4HK
         lMCMdMJ8quhwBh+1KN3++KbBh9p5FsEzkFaRwttduwv8qI9Y/WKu9IT5BNF9USeuYI8e
         68c1TlVqEELaZe24Yer5e67YzPcKQ2wrSNSqtfxciy23WbtS3/GiMmGSWL/zVMdlKF2Y
         2rvZ83ZN/jdRTd3GNw1nCpPPHMJqtBYrYk2pbP1JBGDge+4+sWcMtZnjQbE5JRAB5943
         1y7bCsZZ+HuuJbF2064/wjKUa7dmPcEWCVa/4m7zRopWDh/5+VKLQbgcqhOwqMqI2YeA
         ruRQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1ySwok1DmZDma0hgIFk/zvT20BtcZztBP6ac1g4aSblovVvQKpLATcS987U0/Wvw2+lo9xA==@lists.linux.dev
X-Gm-Message-State: AFuF++kgxi6kv39yvBbac9Yz27lTOCkl2CuKxpQYqUh4wKPgY+6BK1ax
	UKS17ACnOV6p1U5CFWG1mE0xS1KHE1SWV7rDFSRlxBMds90vAiAKdoOs
X-Gm-Gg: AYBFou3gHSmTDTspgrlvs7OSN/IxBrbVOVpSOFxhzZv2hHKEFXsuiE+WGGhtGd8dOFw
	/4DBTeX8ux0ZMNBGXR15ZhGjHfBIhiiiFdxChN1K+wiEuLvDzn/SKKtxUjRYBqVDuagjm57Jybq
	fWgz9Y7zt2Y7OmP3cZsw3DaRwDUR8C2kuuTHpqJMEe64RpXYrz02uWwhkNyJG2P1YoRkEbT4Dlj
	OQNoUMPIx8+fokQcfHW+QvEIElAoD7sxnaFyE0cnv2p+Zv5h7CL99lNO68kzoGOxv2e0dHfxvPg
	LqJ/t9eFeb8+9q3CwTHJM8DXldrZRWbfLeD2DkZ8k9rz4OU8i4xzSoNLydAIw/FG9vHTrefZulw
	fVtHJnBIItUauhf9Tj7w+j68bDVeAfoID4wH+9Mtyc+AhIoiobyRk29wO105DlJLG5BxcK5SGh2
	3zudm+XkSedjnoAWtn1wvjLXW20HuicBeotC1/J/v26rnOg35APwT78SNSwtDb04sG2ZR9gnRDd
	7W0we73xN6E
X-Received: by 2002:a17:902:fc85:b0:2dd:c053:ec74 with SMTP id d9443c01a7336-2df69dc7525mr21266475ad.39.1790166808848;
        Wed, 23 Sep 2026 05:33:28 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm9510475ad.19.2026.09.23.05.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:33:28 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v6 1/3] exfat: add a Bloom filter for negative name lookups
Date: Wed, 23 Sep 2026 20:32:58 +0800
Message-Id: <20260923123300.1626723-2-anmuxixixi@gmail.com>
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

Negative name lookups scan a directory from the beginning. Repeating this
scan before creating each file makes bulk creation approach O(N^2).

Add a 64 KiB per-directory Bloom filter. Build it lazily after a directory
reaches 1024 on-disk entries. A definite miss skips the directory scan,
while a possible match follows the normal lookup path so hash collisions
cannot affect correctness.

Invalidate the filter if a new entry set cannot be committed. Do the same
when writing a renamed or moved entry reports an error, because the entry
may already have reached disk.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 140 ++++++++++++++++++++++++++++++++++++++++++++
 fs/exfat/exfat_fs.h |  13 ++++
 fs/exfat/inode.c    |   1 +
 fs/exfat/namei.c    |   9 ++-
 fs/exfat/super.c    |   1 +
 5 files changed, 161 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index 46514b13bebd..0c5648e23e20 100644
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
@@ -1035,6 +1171,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 
 	if (num_entries < 0)
 		return num_entries;
+	if (!exfat_name_filter_maybe_contains(&ei->vfs_inode, p_uniname))
+		return -ENOENT;
 
 	dentries_per_clu = sbi->dentries_per_clu;
 
@@ -1196,6 +1334,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 		ei->hint_femp.count = 0;
 	}
 
+	exfat_build_name_filter(sb, ei, p_dir);
+
 	/* initialized hint_stat */
 	hint_stat->clu = p_dir->dir;
 	hint_stat->eidx = 0;
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index 41a2c7dfc479..899b276f105b 100644
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
 
@@ -285,6 +290,8 @@ struct exfat_inode_info {
 	struct exfat_hint hint_stat;
 	/* hint for first empty entry */
 	struct exfat_hint_femp hint_femp;
+	/* Complete, in-memory Bloom filter of directory names */
+	unsigned long *name_filter;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -620,6 +627,12 @@ int exfat_read_volume_label(struct super_block *sb,
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

