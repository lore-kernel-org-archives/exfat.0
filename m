Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3663F5275A1
	for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991934; cv=none; b=cPt8dqjdvTDqw0ErFVPB5rg1rs2H7kDaEsWZoZyAKXDe09ZCxColxnDZRuxEPccMeZKYBJDxCLrjSImG0vrHhulRzP/+UhSBw5/NinXfup8rGEHibUouaVCqGuHhKzVgFGVCViYOnCNrJeGjTQS51mGrVYRnmJoFJtvrD1DyQpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991934; c=relaxed/simple;
	bh=XQsneU3xqmTVNbKsfGxKF7tM9c8BtVYj+AuD/RC2FWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NzbxRBOsd4W8lPrkGlI66KgatTcUDyFsPCEAhSxl94VVqiJ4ms/cHawSrvNHCc1JPZ0uzsscU71ju6+uLesb2ewU6a87kPEvX+VDWlqyJIKZaxtNX1bfN18TY+eqrmUkW2waxT1G2uoxCsn/aYAlHHCCXcKq3ywwcCFM+TjQFNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dY75SAa+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dY75SAa+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-887a58523e6so1280753b3a.3
        for <exfat@lists.linux.dev>; Wed, 14 Oct 2026 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991931; x=1792596731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4gwh2fQvNe08kbDMKrdanW71GXiZ18Ym48/T8PhpJo=;
        b=dY75SAa+AIMejEtWzo9dtGxCBXuKYmOgjY70KipwbThl7WslSxbaw1ufBvjY49L8nk
         IrfGJ4kk18a9w5U2pz0K6cLYwLXuFoBH5yF74Mimn0NPLBWPmsBy8ZNKBHS1N3/K5d+o
         OtD1xdV7PEl9td7OK/Q7ZDQAU0zN3AwnsfObYROZgt2f1fMSNoazfjV/5RRyHMKOzuof
         QxvxzypKTDjP1TE2Bh4QHBoaFh2+FGWcSZwUUav6H64Jj2dBcazKeu0NAAl9eGC3+7d2
         2j8ORKPKf/4kIIbGimjS21xHgnD08kEI3jxv6/e4JyCaooGeRhluf9XTsMq89sUoQTlE
         FmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991931; x=1792596731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H4gwh2fQvNe08kbDMKrdanW71GXiZ18Ym48/T8PhpJo=;
        b=qFD4RPLfydLJXl4HY/RWFmx556vGIHERPfU9nBgU7wIa6DPKjyJnHvSHpqewIwqkvy
         XU9BvYwZOTpcluhttO+W6TKkbLxcCOh4AIJ6fQeMPH2RB1FAVQanBTUPzHDtmy+D8Ikm
         mc+B/aJfKpKG7QWs8C2HeS1ZQHq0/mP7t5I2VI+aLOjR5iRBILMkQbtrQktkGC5dEfEa
         nQtmVXx2Vte611ke5TWNv4nVAofF9/kAVGv+j6IcMfsL+hEIRkcDaIfX+r9zQtJqquOY
         YCwGbMjqz8yN4RbWItE1ffVevASD9K3ntMasfo0ByiY7CJDfoc8MqqTX7LYrwh1RmYgX
         uFjw==
X-Forwarded-Encrypted: i=1; AKwUvByw9JPVTK5cJPYbS1WSP54o92hZmBzJLz2jaFFmgvN2aoP+pMMBFIj1WRSluDdh2+zRmyimBg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLjJtRoOX2tuA9aVXTw3kFvLgT0tOUXJY4eveh0EVNckIsp9mPM
	HZ/Tq4zEwg26HvqrXMCitIaaWRBscYUEWdLmHjMBSLtw9Et2Yf6WB9mZ
X-Gm-Gg: AYBFou2+RtyGAUrtUHtYz6wM2jbdAXj68AFjV7M0+bFIrCASu6zpyHVq8UvadNxeVJN
	vzu0ddbdTGFlR44sj2Z7GBu16klRtDy8Tztny82DxkT9QfBpjJZLMnqiSsWXTxk592fCetDKMz0
	rjJmxs9U13V52/psfYt9ftw4OYhQqPHPGr6naiexhCfe5vT5NqVp/KzkvzJ8ZhxWKMOCFUqz75r
	vwy+k884+kDBxoCEwUsUPAqgB3B1FlKdZaPCVajKUpWpQ8+kWgBImqP1YtUR2W7L+OYqd7J6zrZ
	n/3S4K9lDFWHBU3d4At36WPdhEbBaEa3ZYc87RS8F+Ck5es8SKVlHT8O656hFZ2XC9Wh/SIJd+5
	+UfBCbhO7godJHWNVJDK8W32efxP5SnJhgUPtXXhyb8E8k0vI7YrPv8nEIVzUyYDHQncIGe08ii
	EJSksfKy3qbl+73duTuECYCmTvrzzMQIJEBC/INgM8VzoCEp6njSFtcL/etgPUzq75LkKmf7Nee
	MWF4slHNoD3Mxly6H1w6q4=
X-Received: by 2002:a05:6a00:218e:b0:891:6d3e:3992 with SMTP id d2e1a72fcca58-897c7ccb7dcmr12544259b3a.46.1791991931331;
        Wed, 14 Oct 2026 08:32:11 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f51f452sm1221941b3a.1.2026.10.14.08.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:32:07 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v8 3/3] exfat: reclaim name filters under memory pressure
Date: Wed, 14 Oct 2026 23:31:30 +0800
Message-Id: <20261014153130.2111500-4-anmuxixixi@gmail.com>
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

Each active large directory can hold a dynamically sized name filter with a
bitmap of up to 4 MiB. Add a per-superblock LRU and shrinker so filters can
be reclaimed when memory is tight. Account reclaimable filters in pages so
reclaim cost tracks their differing allocation sizes.

Keep the scan budget initialized by the shrinker core instead of replacing
it with the number of filters freed. If the LRU is already empty, return
SHRINK_STOP. This guarantees that do_shrink_slab() either consumes its scan
budget or stops, even when the LRU becomes empty before nr_to_scan is
satisfied.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 159 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  10 +++
 fs/exfat/super.c    |   8 +++
 3 files changed, 174 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index 4c36fded2412..bc99f2d6739e 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -10,6 +10,7 @@
 #include <linux/filelock.h>
 #include <linux/hash.h>
 #include <linux/log2.h>
+#include <linux/shrinker.h>
 #include <linux/stringhash.h>
 
 #include "exfat_raw.h"
@@ -127,12 +128,158 @@ static bool exfat_name_filter_set(struct exfat_name_filter *filter,
 	return filter->nr_set_bits >= nr_bits / 3;
 }
 
+static unsigned long
+exfat_name_filter_nr_pages(const struct exfat_name_filter *filter)
+{
+	size_t size = struct_size(filter, bitmap,
+				  BITS_TO_LONGS(BIT(filter->order)));
+
+	return DIV_ROUND_UP(size, PAGE_SIZE);
+}
+
+static struct exfat_name_filter *
+exfat_name_filter_detach_locked(struct exfat_sb_info *sbi,
+				struct exfat_inode_info *ei)
+{
+	struct exfat_name_filter *filter = ei->name_filter;
+
+	if (!filter)
+		return NULL;
+
+	list_del_init(&ei->name_filter_lru);
+	ei->name_filter = NULL;
+	sbi->name_filter_pages -= exfat_name_filter_nr_pages(filter);
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
 void exfat_name_filter_free(struct inode *inode)
 {
 	struct exfat_inode_info *ei = EXFAT_I(inode);
+	struct exfat_sb_info *sbi;
+	struct exfat_name_filter *filter;
 
-	kvfree(ei->name_filter);
-	ei->name_filter = NULL;
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
+static unsigned long
+exfat_name_filter_count_objects(struct shrinker *shrinker,
+				struct shrink_control *sc)
+{
+	struct exfat_sb_info *sbi = shrinker->private_data;
+	unsigned long pages;
+
+	spin_lock(&sbi->name_filter_lock);
+	pages = sbi->name_filter_pages;
+	spin_unlock(&sbi->name_filter_lock);
+
+	return pages ? pages : SHRINK_EMPTY;
+}
+
+static unsigned long
+exfat_name_filter_scan_objects(struct shrinker *shrinker,
+			       struct shrink_control *sc)
+{
+	struct exfat_sb_info *sbi = shrinker->private_data;
+	unsigned long freed = 0;
+	bool empty = false;
+
+	/* Avoid reclaim recursion from a GFP_NOFS allocation under s_lock. */
+	if (!mutex_trylock(&sbi->s_lock)) {
+		sc->nr_scanned = 0;
+		return SHRINK_STOP;
+	}
+
+	while (freed < sc->nr_to_scan) {
+		struct exfat_inode_info *ei;
+		struct exfat_name_filter *filter;
+
+		spin_lock(&sbi->name_filter_lock);
+		if (list_empty(&sbi->name_filter_lru)) {
+			spin_unlock(&sbi->name_filter_lock);
+			empty = true;
+			break;
+		}
+
+		ei = list_first_entry(&sbi->name_filter_lru,
+				      struct exfat_inode_info,
+				      name_filter_lru);
+		filter = exfat_name_filter_detach_locked(sbi, ei);
+		spin_unlock(&sbi->name_filter_lock);
+
+		freed += exfat_name_filter_nr_pages(filter);
+		kvfree(filter);
+		cond_resched();
+	}
+
+	mutex_unlock(&sbi->s_lock);
+	if (empty && !freed) {
+		sc->nr_scanned = 0;
+		return SHRINK_STOP;
+	}
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
+		struct exfat_name_filter *filter;
+
+		spin_lock(&sbi->name_filter_lock);
+		if (list_empty(&sbi->name_filter_lru)) {
+			spin_unlock(&sbi->name_filter_lock);
+			break;
+		}
+
+		ei = list_first_entry(&sbi->name_filter_lru,
+				      struct exfat_inode_info,
+				      name_filter_lru);
+		filter = exfat_name_filter_detach_locked(sbi, ei);
+		spin_unlock(&sbi->name_filter_lock);
+		kvfree(filter);
+	}
 }
 
 bool exfat_name_filter_maybe_contains(struct inode *inode,
@@ -145,6 +292,7 @@ bool exfat_name_filter_maybe_contains(struct inode *inode,
 	if (!filter)
 		return true;
 
+	exfat_name_filter_touch(ei);
 	exfat_name_filter_indexes(inode->i_sb, name, filter->order, indexes);
 	return test_bit(indexes[0], filter->bitmap) &&
 	       test_bit(indexes[1], filter->bitmap) &&
@@ -161,6 +309,7 @@ void exfat_name_filter_add(struct inode *inode,
 	if (!filter)
 		return;
 
+	exfat_name_filter_touch(ei);
 	if (exfat_name_filter_order(inode) > filter->order) {
 		exfat_name_filter_free(inode);
 		return;
@@ -188,7 +337,7 @@ static void exfat_build_name_filter(struct super_block *sb,
 	u8 order;
 	int i;
 
-	if (ei->name_filter ||
+	if (!sbi->name_filter_shrinker || ei->name_filter ||
 	    exfat_bytes_to_dentries(i_size_read(inode)) <
 					EXFAT_NAME_FILTER_MIN_DENTRIES)
 		return;
@@ -240,7 +389,11 @@ static void exfat_build_name_filter(struct super_block *sb,
 	}
 
 complete:
+	spin_lock(&sbi->name_filter_lock);
 	ei->name_filter = filter;
+	list_add_tail(&ei->name_filter_lru, &sbi->name_filter_lru);
+	sbi->name_filter_pages += exfat_name_filter_nr_pages(filter);
+	spin_unlock(&sbi->name_filter_lock);
 	return;
 abort:
 	kvfree(filter);
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index d00b3235cee9..472e341e4d7d 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -15,6 +15,8 @@
 #include <uapi/linux/exfat.h>
 #include <linux/buffer_head.h>
 
+struct shrinker;
+
 #define EXFAT_ROOT_INO		1
 
 /*
@@ -266,6 +268,11 @@ struct exfat_sb_info {
 
 	spinlock_t inode_hash_lock;
 	struct hlist_head inode_hashtable[EXFAT_HASH_SIZE];
+	/* Protects name_filter_lru and name_filter_pages. */
+	spinlock_t name_filter_lock;
+	struct list_head name_filter_lru;
+	unsigned long name_filter_pages;
+	struct shrinker *name_filter_shrinker;
 	struct rcu_head rcu;
 };
 
@@ -297,6 +304,7 @@ struct exfat_inode_info {
 	struct exfat_hint_femp hint_femp;
 	/* Complete, in-memory Bloom filter of directory names */
 	struct exfat_name_filter *name_filter;
+	struct list_head name_filter_lru;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -693,6 +701,8 @@ bool exfat_name_filter_maybe_contains(struct inode *inode,
 void exfat_name_filter_add(struct inode *inode,
 			   const struct exfat_uni_name *name);
 void exfat_name_filter_free(struct inode *inode);
+void exfat_name_filter_shrinker_register(struct super_block *sb);
+void exfat_name_filter_shrinker_unregister(struct super_block *sb);
 
 static inline int exfat_chain_advance(struct super_block *sb,
 		struct exfat_chain *chain, unsigned int step)
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 4924f0fad836..26b25cc86d1c 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -46,6 +46,7 @@ static void exfat_put_super(struct super_block *sb)
 {
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 
+	exfat_name_filter_shrinker_unregister(sb);
 	mutex_lock(&sbi->s_lock);
 	exfat_clear_volume_dirty(sb);
 	exfat_free_bitmap(sbi);
@@ -210,6 +211,7 @@ static struct inode *exfat_alloc_inode(struct super_block *sb)
 		return NULL;
 
 	ei->name_filter = NULL;
+	INIT_LIST_HEAD(&ei->name_filter_lru);
 	return &ei->vfs_inode;
 }
 
@@ -746,6 +748,8 @@ static int exfat_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto free_table;
 	}
 
+	exfat_name_filter_shrinker_register(sb);
+
 	return 0;
 
 put_inode:
@@ -845,6 +849,10 @@ static int exfat_init_fs_context(struct fs_context *fc)
 
 	mutex_init(&sbi->s_lock);
 	mutex_init(&sbi->bitmap_lock);
+	spin_lock_init(&sbi->name_filter_lock);
+	INIT_LIST_HEAD(&sbi->name_filter_lru);
+	sbi->name_filter_pages = 0;
+	sbi->name_filter_shrinker = NULL;
 	ratelimit_state_init(&sbi->ratelimit, DEFAULT_RATELIMIT_INTERVAL,
 			DEFAULT_RATELIMIT_BURST);
 
-- 
2.34.1

