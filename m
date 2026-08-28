Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6148E471423
	for <exfat@lists.linux.dev>; Fri, 28 Aug 2026 14:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929145; cv=none; b=CZvd1VypljGKcyxfynPWrVazrKckQNM/j4SWEPvFigyI/vo/QEJrXOCzct+RmPtDpRGUdniB9TJoDk8VLoKE5HJZHanZML0wAF5rcOURVSqF5+pq7kMa4qQ5eKN4/Wj7bOdqxmwoMkHGqNGpSguujHjmJT6niz7WdPt8vqrL0hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929145; c=relaxed/simple;
	bh=WAC0BZyf3XDU8BREQrOa1Ssc+2WwO8TMI0W5W0RmrAc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZlqZXM9mzdisGys9l1h+jE8qU9R914ZuvQgO/1YiWz/FUY/Q6MFNMhWuedFT4C0SYPLPugp3yUpMrEGxUbm7QirxE7DdFjmLj/+i3EmVJFA8Lo02ovyM2CCQ22yaLEy8+i5e6TilTUfo0ldRN2CdqqjgCet82pFVPgDiy25lbDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLz7yZBv; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLz7yZBv"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1050547a91.2
        for <exfat@lists.linux.dev>; Fri, 28 Aug 2026 07:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787929142; x=1788533942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7xqH8BpeNFukXywkuuUrWsBTL6ZriYdy/ftH6jbRUI=;
        b=aLz7yZBv06uOneEwiDA/roZpLWyDBEr9bGr3JptFoJKsyFWD7dqSapBqb67mApI1lB
         2TawaA/PYLytrtdzE3FIOJr2hcYzGXCZDvQR35RZbD2p+sNMGJjwGjOhusXccqu3t8k5
         GVdqiwlqvsQm2xTB7dl8LqBrQ61U0ssqiiPd3WmHKpbhU4APLdN0woWOzpYiG5n2EcS4
         WNsHG4Zo/m7Ptnyfs49JJ16oRJWxlZUmwVuySVA/fXjI0R0IVeYJhqc3fG3zgvR4zLTU
         jccodmTSsiB6h3/CWiJxy5ipkPpWnWGYdLTE4Eq1woUkWseotr7FSAUB0rpRQneMVOeh
         mmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787929142; x=1788533942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7xqH8BpeNFukXywkuuUrWsBTL6ZriYdy/ftH6jbRUI=;
        b=KgwXQNB6tZGQhS9H5+c8yJLMeRD0L057U2YV2t3oTaTWcLyoLIBvcNT1jQnbIrmiLn
         6Zn9npw/CElXzWBWdhKP/VSCTEXDkOUE0S318NLFPHH3Q9NZs4wXwnJ7TJF6z9mH7htq
         GKTqSgMdRkAZZ5uve/usVb63gcHpCLb1pyGSe/lhFAqB+shBIovh/B+EVQ8Ynb5M01x1
         e9WYrlRPCEJoUt5tX9QsTkelkMKoknye3tO5RVx60/D8czrgcHO1kL0xUgzCFyg5JzMe
         elw3aR+sviOGNSUkOh5264zdSv0LCx2Jbrw/s4m6C0ORC4bX4974g/gWxkFWCBq30j+Q
         mAFA==
X-Forwarded-Encrypted: i=1; AHgh+RpbBl/Hk2hnMhNNfqeF6rnq68cKVKnmoHuMEW/m87+j+tmsauSJgkZIN/VJahh8Yea37Xlgyw==@lists.linux.dev
X-Gm-Message-State: AFuF++lVNuQN0BS8/tXL1BJ47e6lqG50dNEHUn7B2yvZcKhp6IPuZRbm
	5dDLK0AWnpa8VjE1BEiy33ZSPXMubQvgG35sm2b0EoJs0pbeTzMTnrsF
X-Gm-Gg: AR+sD133XDAf/MFZriHhvFWZlwBk9GyY+YGCQLg1KCyYhw0J8X2huDSRNccq4dwsH9G
	oCxb4hUIxeL2ZyxI2s+31evGiwLGZQT0tKip5bVa44nc51nlQid7QsKEXjmN1AkvMFKCYOq1n9Z
	lbqMR/r8s2OF426uLI/0MjsfByVUdlsCL8a7ifSGjAWBYi0HT2P8iRpVKCGwbpr6I/A+k4Mg9ID
	kBlp59hov/QrwKiyTNImfE6McHvCN66SMWdiNKv63ZT7wiIgOa9mt2Y5vQBHfWVFR1x7CBS+yJm
	EzulO/LEeyb4t21u6mFxj0Cq4UCcYcHL6+Tzhs2GqcmNhs1viiqoS0Moh05Y8K1qMoTVuKwgf3O
	JUh+YTwRggqhvZ5ZEZy3e6FchUT8oyqFHGKCkculK55RZHo3tp9PPQRRc5u1WJ0Go8PnjSVMRQY
	uZiKaEBQqu5r9oHq1hooMZgvQvvaDf6rbEfxezrdlRzyygFk3382XUGdaRV77ySsL7RKSr7FORJ
	Q==
X-Received: by 2002:a17:90b:3c8a:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-396d10076e9mr15750246a91.13.1787929141588;
        Fri, 28 Aug 2026 07:59:01 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1992435sm7926670a91.13.2026.08.28.07.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:59:01 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH] exfat: speed up file creation in large directories
Date: Fri, 28 Aug 2026 22:58:38 +0800
Message-Id: <20260828145838.1187356-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Negative name lookups scan a directory from the beginning. Repeating
this scan before creating each file makes bulk file creation approach
O(N^2).

Add a 64 KiB per-directory Bloom filter and retain the next empty entry
found during directory scans. A definite Bloom filter miss skips the
directory scan, while a possible match falls back to the normal lookup
path, preserving correctness in the presence of hash collisions.

To avoid overhead for small directories, build the filter lazily when a
directory reaches 1024 on-disk directory entries. A filter reclaimed
under memory pressure is rebuilt on demand.

Manage the filters using a per-superblock LRU and shrinker so that filters
for inactive directories can be reclaimed under memory pressure.

Test environment:
  QEMU TCG multi-thread, 4 vCPUs, 6 GiB RAM
  4 GiB exFAT image, 32 KiB clusters

Test script:
  mount -t exfat /dev/vda /mnt/test
  time sh -c '
          i=0
          while [ "$i" -lt 20000 ]; do
                  : > "/mnt/test/f.$i" || exit 1
                  i=$((i + 1))
          done
  '

The measured results were:

                         Before          After
  real                   589.48 s         5.33 s
  user                     4.72 s         2.28 s
  sys                    584.63 s         3.03 s

The elapsed time was reduced by 99.10%, from 589.48 seconds to
5.33 seconds, corresponding to a 110.6-fold speedup.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 280 ++++++++++++++++++++++++++++++++++++++++++++
 fs/exfat/exfat_fs.h |  22 ++++
 fs/exfat/namei.c    |  44 ++++++-
 fs/exfat/super.c    |  10 ++
 4 files changed, 355 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index fe73b1380c5d..6df74bcab4b5 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -8,6 +8,9 @@
 #include <linux/bio.h>
 #include <linux/buffer_head.h>
 #include <linux/filelock.h>
+#include <linux/hash.h>
+#include <linux/shrinker.h>
+#include <linux/stringhash.h>
 
 #include "exfat_raw.h"
 #include "exfat_fs.h"
@@ -65,6 +68,279 @@ static int exfat_get_uniname_from_ext_entry(struct super_block *sb,
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
+static unsigned long *exfat_name_filter_detach_locked(
+					struct exfat_sb_info *sbi,
+					struct exfat_inode_info *ei)
+{
+	unsigned long *filter = ei->name_filter;
+
+	if (!filter)
+		return NULL;
+
+	ei->name_filter = NULL;
+	list_del_init(&ei->name_filter_lru);
+	sbi->name_filter_count--;
+	return filter;
+}
+
+static void exfat_name_filter_touch(struct exfat_inode_info *ei)
+{
+	struct exfat_sb_info *sbi = EXFAT_SB(ei->vfs_inode.i_sb);
+
+	spin_lock(&sbi->name_filter_lock);
+	if (ei->name_filter)
+		list_move_tail(&ei->name_filter_lru, &sbi->name_filter_lru);
+	spin_unlock(&sbi->name_filter_lock);
+}
+
+void exfat_name_filter_free(struct inode *inode)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+	struct exfat_sb_info *sbi;
+	unsigned long *filter;
+
+	if (!READ_ONCE(ei->name_filter))
+		return;
+
+	sbi = EXFAT_SB(inode->i_sb);
+	spin_lock(&sbi->name_filter_lock);
+	filter = exfat_name_filter_detach_locked(sbi, ei);
+	spin_unlock(&sbi->name_filter_lock);
+	kvfree(filter);
+}
+
+static unsigned long exfat_name_filter_count_objects(
+					struct shrinker *shrinker,
+					struct shrink_control *sc)
+{
+	struct exfat_sb_info *sbi = shrinker->private_data;
+	unsigned long count;
+
+	spin_lock(&sbi->name_filter_lock);
+	count = sbi->name_filter_count;
+	spin_unlock(&sbi->name_filter_lock);
+
+	return count ? count : SHRINK_EMPTY;
+}
+
+static unsigned long exfat_name_filter_scan_objects(
+					struct shrinker *shrinker,
+					struct shrink_control *sc)
+{
+	struct exfat_sb_info *sbi = shrinker->private_data;
+	unsigned long freed = 0;
+
+	/* Avoid reclaim recursion from a GFP_NOFS allocation under s_lock. */
+	if (!mutex_trylock(&sbi->s_lock)) {
+		sc->nr_scanned = 0;
+		return SHRINK_STOP;
+	}
+
+	while (freed < sc->nr_to_scan) {
+		struct exfat_inode_info *ei;
+		unsigned long *filter;
+
+		spin_lock(&sbi->name_filter_lock);
+		if (list_empty(&sbi->name_filter_lru)) {
+			spin_unlock(&sbi->name_filter_lock);
+			break;
+		}
+
+		ei = list_first_entry(&sbi->name_filter_lru,
+					struct exfat_inode_info,
+					name_filter_lru);
+		filter = exfat_name_filter_detach_locked(sbi, ei);
+		spin_unlock(&sbi->name_filter_lock);
+
+		kvfree(filter);
+		freed++;
+		cond_resched();
+	}
+
+	mutex_unlock(&sbi->s_lock);
+	sc->nr_scanned = freed;
+	return freed;
+}
+
+void exfat_name_filter_shrinker_register(struct super_block *sb)
+{
+	struct exfat_sb_info *sbi = EXFAT_SB(sb);
+	struct shrinker *shrinker;
+
+	shrinker = shrinker_alloc(SHRINKER_NONSLAB,
+				  "exfat-name-filter:%s", sb->s_id);
+	if (!shrinker) {
+		exfat_warn(sb, "failed to allocate name filter shrinker");
+		return;
+	}
+
+	shrinker->count_objects = exfat_name_filter_count_objects;
+	shrinker->scan_objects = exfat_name_filter_scan_objects;
+	shrinker->private_data = sbi;
+	shrinker_register(shrinker);
+	sbi->name_filter_shrinker = shrinker;
+}
+
+void exfat_name_filter_shrinker_unregister(struct super_block *sb)
+{
+	struct exfat_sb_info *sbi = EXFAT_SB(sb);
+	struct shrinker *shrinker = sbi->name_filter_shrinker;
+
+	sbi->name_filter_shrinker = NULL;
+	shrinker_free(shrinker);
+
+	for (;;) {
+		struct exfat_inode_info *ei;
+		unsigned long *filter;
+
+		spin_lock(&sbi->name_filter_lock);
+		if (list_empty(&sbi->name_filter_lru)) {
+			spin_unlock(&sbi->name_filter_lock);
+			break;
+		}
+
+		ei = list_first_entry(&sbi->name_filter_lru,
+					struct exfat_inode_info,
+					name_filter_lru);
+		filter = exfat_name_filter_detach_locked(sbi, ei);
+		spin_unlock(&sbi->name_filter_lock);
+		kvfree(filter);
+	}
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
+	exfat_name_filter_touch(ei);
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
+	exfat_name_filter_touch(ei);
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
+	if (!sbi->name_filter_shrinker || ei->name_filter ||
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
+			if (exfat_get_uniname_from_ext_entry(sb, &clu, i,
+							 name.name))
+				goto abort;
+			for (len = 0; len < MAX_NAME_LENGTH && name.name[len]; len++)
+				;
+			if (!len || len == MAX_NAME_LENGTH)
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
+	spin_lock(&sbi->name_filter_lock);
+	ei->name_filter = filter;
+	list_add_tail(&ei->name_filter_lru, &sbi->name_filter_lru);
+	sbi->name_filter_count++;
+	spin_unlock(&sbi->name_filter_lock);
+	return;
+abort:
+	kvfree(filter);
+}
+
 /* read a directory entry from the opened directory */
 static int exfat_readdir(struct inode *inode, loff_t *cpos, struct exfat_dir_entry *dir_entry)
 {
@@ -992,6 +1268,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 
 	if (num_entries < 0)
 		return num_entries;
+	if (!exfat_name_filter_maybe_contains(&ei->vfs_inode, p_uniname))
+		return -ENOENT;
 
 	dentries_per_clu = sbi->dentries_per_clu;
 
@@ -1153,6 +1431,8 @@ int exfat_find_dir_entry(struct super_block *sb, struct exfat_inode_info *ei,
 		ei->hint_femp.count = 0;
 	}
 
+	exfat_build_name_filter(sb, ei, p_dir);
+
 	/* initialized hint_stat */
 	hint_stat->clu = p_dir->dir;
 	hint_stat->eidx = 0;
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index a9131fe03302..bc4e2213c4a7 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -14,6 +14,8 @@
 #include <uapi/linux/exfat.h>
 #include <linux/buffer_head.h>
 
+struct shrinker;
+
 #define EXFAT_ROOT_INO		1
 
 /*
@@ -120,6 +122,11 @@ enum {
 #define DIR_CACHE_SIZE		\
 	(DIV_ROUND_UP(ES_MAX_ENTRY_NUM << DENTRY_SIZE_BITS, SECTOR_SIZE) + 1)
 
+#define EXFAT_NAME_FILTER_ORDER		19
+#define EXFAT_NAME_FILTER_BITS		BIT(EXFAT_NAME_FILTER_ORDER)
+#define EXFAT_NAME_FILTER_BYTES		(EXFAT_NAME_FILTER_BITS >> 3)
+#define EXFAT_NAME_FILTER_MIN_DENTRIES	1024
+
 /* Superblock flags */
 #define EXFAT_FLAGS_SHUTDOWN	1
 
@@ -255,6 +262,10 @@ struct exfat_sb_info {
 
 	spinlock_t inode_hash_lock;
 	struct hlist_head inode_hashtable[EXFAT_HASH_SIZE];
+	spinlock_t name_filter_lock;
+	struct list_head name_filter_lru;
+	unsigned long name_filter_count;
+	struct shrinker *name_filter_shrinker;
 	struct rcu_head rcu;
 };
 
@@ -284,6 +295,9 @@ struct exfat_inode_info {
 	struct exfat_hint hint_stat;
 	/* hint for first empty entry */
 	struct exfat_hint_femp hint_femp;
+	/* Complete, in-memory Bloom filter of directory names */
+	unsigned long *name_filter;
+	struct list_head name_filter_lru;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -619,6 +633,14 @@ int exfat_read_volume_label(struct super_block *sb,
 int exfat_write_volume_label(struct super_block *sb,
 			     struct exfat_uni_name *label);
 
+bool exfat_name_filter_maybe_contains(struct inode *inode,
+				      const struct exfat_uni_name *name);
+void exfat_name_filter_add(struct inode *inode,
+			   const struct exfat_uni_name *name);
+void exfat_name_filter_free(struct inode *inode);
+void exfat_name_filter_shrinker_register(struct super_block *sb);
+void exfat_name_filter_shrinker_unregister(struct super_block *sb);
+
 static inline int exfat_chain_advance(struct super_block *sb,
 		struct exfat_chain *chain, unsigned int step)
 {
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index a4dc83b5949c..80a72d24d394 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -199,6 +199,42 @@ const struct dentry_operations exfat_utf8_dentry_ops = {
 	.d_compare	= exfat_utf8_d_cmp,
 };
 
+static void exfat_set_next_empty_hint(struct inode *inode,
+				      struct exfat_chain *p_dir, int dentry,
+				      int num_entries,
+				      struct exfat_entry_set_cache *es)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+	struct exfat_sb_info *sbi = EXFAT_SB(inode->i_sb);
+	unsigned int next = dentry + num_entries;
+	unsigned int total = exfat_cluster_to_dentries(sbi, p_dir->size);
+	struct exfat_chain cur;
+
+	if (next >= total) {
+		exfat_chain_set(&ei->hint_femp.cur, EXFAT_EOF_CLUSTER, 0,
+				p_dir->flags);
+		ei->hint_femp.eidx = total;
+		ei->hint_femp.count = 0;
+		return;
+	}
+
+	cur.dir = exfat_sector_to_cluster(sbi,
+			es->bh[es->num_bh - 1]->b_blocknr);
+	cur.flags = p_dir->flags;
+	cur.size = p_dir->size - exfat_dentries_to_cluster(sbi, next);
+	if (!(next & (sbi->dentries_per_clu - 1))) {
+		cur.size++;
+		if (exfat_chain_advance(inode->i_sb, &cur, 1)) {
+			ei->hint_femp.eidx = EXFAT_HINT_NONE;
+			return;
+		}
+	}
+
+	ei->hint_femp.cur = cur;
+	ei->hint_femp.eidx = next;
+	ei->hint_femp.count = 0;
+}
+
 /* search EMPTY CONTINUOUS "num_entries" entries */
 static int exfat_search_empty_slot(struct super_block *sb,
 		struct exfat_hint_femp *hint_femp, struct exfat_chain *p_dir,
@@ -385,6 +421,8 @@ int exfat_find_empty_entry(struct inode *inode,
 		inode->i_blocks += sbi->cluster_size >> 9;
 	}
 
+	exfat_set_next_empty_hint(inode, p_dir, dentry, num_entries, es);
+
 	p_dir->dir = exfat_sector_to_cluster(sbi, es->bh[0]->b_blocknr);
 	p_dir->size -= dentry / sbi->dentries_per_clu;
 
@@ -526,6 +564,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	}
 
 	info->entry = dentry;
+	exfat_name_filter_add(inode, &uniname);
 	info->flags = ALLOC_NO_FAT_CHAIN;
 	info->type = type;
 
@@ -627,7 +666,8 @@ static int exfat_find(struct inode *dir, const struct qstr *qname,
 		ei->hint_stat.clu = cdir.dir;
 		ei->hint_stat.eidx = 0;
 		ei->version = (inode_peek_iversion_raw(dir) & 0xffffffff);
-		ei->hint_femp.eidx = EXFAT_HINT_NONE;
+		if (!ei->name_filter)
+			ei->hint_femp.eidx = EXFAT_HINT_NONE;
 	}
 
 	/* search the file name for directories */
@@ -1215,6 +1255,8 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
 	else
 		ret = exfat_move_file(new_parent_inode, &uni_name, ei);
+	if (!ret)
+		exfat_name_filter_add(new_parent_inode, &uni_name);
 
 	if (!ret && new_inode) {
 		struct exfat_entry_set_cache es;
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index a9ea36ba2693..28b55618c6f5 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -45,6 +45,7 @@ static void exfat_put_super(struct super_block *sb)
 {
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 
+	exfat_name_filter_shrinker_unregister(sb);
 	mutex_lock(&sbi->s_lock);
 	exfat_clear_volume_dirty(sb);
 	exfat_free_bitmap(sbi);
@@ -195,11 +196,14 @@ static struct inode *exfat_alloc_inode(struct super_block *sb)
 	if (!ei)
 		return NULL;
 
+	ei->name_filter = NULL;
+	INIT_LIST_HEAD(&ei->name_filter_lru);
 	return &ei->vfs_inode;
 }
 
 static void exfat_free_inode(struct inode *inode)
 {
+	exfat_name_filter_free(inode);
 	kmem_cache_free(exfat_inode_cachep, EXFAT_I(inode));
 }
 
@@ -731,6 +735,8 @@ static int exfat_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto free_table;
 	}
 
+	exfat_name_filter_shrinker_register(sb);
+
 	return 0;
 
 put_inode:
@@ -826,6 +832,10 @@ static int exfat_init_fs_context(struct fs_context *fc)
 
 	mutex_init(&sbi->s_lock);
 	mutex_init(&sbi->bitmap_lock);
+	spin_lock_init(&sbi->name_filter_lock);
+	INIT_LIST_HEAD(&sbi->name_filter_lru);
+	sbi->name_filter_count = 0;
+	sbi->name_filter_shrinker = NULL;
 	ratelimit_state_init(&sbi->ratelimit, DEFAULT_RATELIMIT_INTERVAL,
 			DEFAULT_RATELIMIT_BURST);
 
-- 
2.34.1

