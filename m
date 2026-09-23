Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1B751AEF1
	for <exfat@lists.linux.dev>; Wed, 23 Sep 2026 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166842; cv=none; b=e26Sz8dz5gJyk+xTioINyvWupyZXqnraf1vSfn5vxm2yTTcUETeEVlUgbqufF1SpJS1QrL/mJa/io/L5mIh4ogDzcTkyCIKsEGIJVluhRsYLCMZF1FKxa1tK0y4QucJKLaf4bfpfXcign5n/KMuSHN083m8inCJRUMJWG/rudho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166842; c=relaxed/simple;
	bh=Yqaq1Hk7u4nrzYHc+3CVcf4COPL1wBi/iltVI2RQc7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YphZAY71YhDJGOnPEeKrdWr2QHb1y/UXEX1pGi+UaDKaGwqV1RRvvcX8yVswKTQgCdXQ5iXRTx3G2RsZFnejXZRjOAqsTHFKc+gKwWx4WDIQGohdsUvxcte2uNutITSLQ6pEreJ+oI6ta67NnOowVGIrw/+YZd+X57ktZo6bzzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndjw/e0/; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndjw/e0/"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca06a25so3604265ad.2
        for <exfat@lists.linux.dev>; Wed, 23 Sep 2026 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166835; x=1790771635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qR79KzzQEHA1BCgom4FGsnXuKP2YSduNO1GGm9Xb7l8=;
        b=ndjw/e0/IFF94Y/CWndybJcqlGMQ3wuYS6d+c0GRCVf67dTc57XmG/5+AyTwN0KWdc
         WU6SIJrarwFREzyB45B2xGkGhA+aM3BSilEbOoXxs08o79FqIWA38jN7eY6UfucdSksy
         ySq5h21SuFlTHj/+GLRSGdrjVDPKxebUp/9AXrApPmq6P3ZQwlpB+9qs8/jT5xPswbcM
         WuKKe34X59TiH/EdIjd2esQo4dDzAYOq+eT1SSOOJJMXu5Zw+mJUrSRMs2ymVwtGHUNu
         m7elWzwjTb977Qvi2iHrsCXYrRmph92KWhy+KbenCOQ7afpht8mCDUXdIK16Mgt2q70n
         Zwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166835; x=1790771635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qR79KzzQEHA1BCgom4FGsnXuKP2YSduNO1GGm9Xb7l8=;
        b=qYt1p2q+6EFgMmm8Cq5Fjdkq2gr4JWk3mRYzO4bmR+FwjrR0KvUjP4+7lvt+xQ1xJr
         HavUm6OReS1soM8th7G0d7qTiD+qFqWRHqtEd3xCoNIRmu9Z9ngPj3QiYOg/ASen/qU+
         Vga4SzI9F3ftUoTsKPeaw1pf7QFE7xmU91a0I5G6c7ML5TquAWOdELyWIWQ6oZS4cw7a
         jzcJovp3xA9vjmNCLr8WVHXI+QkZXrrAMsDjAq//2qSUt0y44T3DKqVA947b7/uNJTwn
         3kYGKrWF5owJuIZ5GLqUR4McVvZRLpr7dreW8yQNKHmfBXSzdne5xOd+8wY9ETaHNQD+
         JqdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpBl4k6ubNy9VuG83NzDQCr3bXrcLMnW6tloeFoP8SONxn8ROxBht4mwrE9GqFIMrSuCHouQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mgGAplPzddxv3iRlCbpMUJcMB/GLYFR3lkRf7sq5uRNWnfC1me
	NMk+3RiXul9GJ4BmVYt4WB36lkZQCtFo4GB4MOZIZ9Z7jCLBQJUZlCYf
X-Gm-Gg: AYBFou1KxHzbFhgkfp68QBu6DhiKId4wim/b5UPdz3O32I8CMC0XBGxYQieUqS/ggH3
	BSlQeO94tRYPta+4V7LvTyWTKRUxPGkKBOSePnk+yhm85Ldp7onJ4dmRKS2T7rEBxXzp8X6mH55
	CfALrxximT2xO+UqyRuZ9euxwjsTt8aU7J14o57d312Yz7lPQWQfoVVHRIXSCdEXiQr7bdnwANw
	9oE1YOsHdZK6VXd5x7x7lffr76b4wx0wQRDebqPhdV3rir6E6k6MqtzsEh1FVRB8djvns/yO29P
	zrse/lg+1wa9RXGsOPAfRwY74nvvNvvx/eFLDPHHXf+dlKMCa+8NcFJR3mdmNz0X+SQkf6GAY5J
	gtckHCHQ4ixIRrVPHwsd52w+GjKM/aXESxrKa60c7miRM9EWJq8rRgV423sM5NH8Q7BDT9WVom7
	BVQHIr4B7IbDIF51ZXrjWxNhlTTDW4n63C36zm0sNanwvt5htdCFcFmojkeQ9srqST7DdRAlmH2
	3ycFMyXaqzJ
X-Received: by 2002:a17:903:2f8c:b0:2dd:c053:e0f8 with SMTP id d9443c01a7336-2df69de16b5mr21644485ad.39.1790166831747;
        Wed, 23 Sep 2026 05:33:51 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm9510475ad.19.2026.09.23.05.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:33:51 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v6 3/3] exfat: reclaim name filters under memory pressure
Date: Wed, 23 Sep 2026 20:33:00 +0800
Message-Id: <20260923123300.1626723-4-anmuxixixi@gmail.com>
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

Each active large directory can hold a 64 KiB name filter. Add a
per-superblock LRU and shrinker so filters can be reclaimed when memory is
tight.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 145 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  10 +++
 fs/exfat/super.c    |   8 +++
 3 files changed, 160 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index 08b7a50de871..013b7e43a289 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -9,6 +9,7 @@
 #include <linux/buffer_head.h>
 #include <linux/filelock.h>
 #include <linux/hash.h>
+#include <linux/shrinker.h>
 #include <linux/stringhash.h>
 
 #include "exfat_raw.h"
@@ -91,12 +92,144 @@ static void exfat_name_filter_indexes(struct super_block *sb,
 			     EXFAT_NAME_FILTER_ORDER);
 }
 
+static unsigned long *
+exfat_name_filter_detach_locked(struct exfat_sb_info *sbi,
+				struct exfat_inode_info *ei)
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
 void exfat_name_filter_free(struct inode *inode)
 {
 	struct exfat_inode_info *ei = EXFAT_I(inode);
+	struct exfat_sb_info *sbi;
+	unsigned long *filter;
 
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
+	unsigned long count;
+
+	spin_lock(&sbi->name_filter_lock);
+	count = sbi->name_filter_count;
+	spin_unlock(&sbi->name_filter_lock);
+
+	return count ? count : SHRINK_EMPTY;
+}
+
+static unsigned long
+exfat_name_filter_scan_objects(struct shrinker *shrinker,
+			       struct shrink_control *sc)
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
+				      struct exfat_inode_info,
+				      name_filter_lru);
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
+				      struct exfat_inode_info,
+				      name_filter_lru);
+		filter = exfat_name_filter_detach_locked(sbi, ei);
+		spin_unlock(&sbi->name_filter_lock);
+		kvfree(filter);
+	}
 }
 
 bool exfat_name_filter_maybe_contains(struct inode *inode,
@@ -108,6 +241,7 @@ bool exfat_name_filter_maybe_contains(struct inode *inode,
 	if (!ei->name_filter)
 		return true;
 
+	exfat_name_filter_touch(ei);
 	exfat_name_filter_indexes(inode->i_sb, name, indexes);
 	return test_bit(indexes[0], ei->name_filter) &&
 	       test_bit(indexes[1], ei->name_filter) &&
@@ -123,6 +257,7 @@ void exfat_name_filter_add(struct inode *inode,
 	if (!ei->name_filter)
 		return;
 
+	exfat_name_filter_touch(ei);
 	exfat_name_filter_indexes(inode->i_sb, name, indexes);
 	__set_bit(indexes[0], ei->name_filter);
 	__set_bit(indexes[1], ei->name_filter);
@@ -145,7 +280,7 @@ static void exfat_build_name_filter(struct super_block *sb,
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 	int i;
 
-	if (ei->name_filter ||
+	if (!sbi->name_filter_shrinker || ei->name_filter ||
 	    exfat_bytes_to_dentries(i_size_read(inode)) <
 					EXFAT_NAME_FILTER_MIN_DENTRIES)
 		return;
@@ -195,7 +330,11 @@ static void exfat_build_name_filter(struct super_block *sb,
 	}
 
 complete:
+	spin_lock(&sbi->name_filter_lock);
 	ei->name_filter = filter;
+	list_add_tail(&ei->name_filter_lru, &sbi->name_filter_lru);
+	sbi->name_filter_count++;
+	spin_unlock(&sbi->name_filter_lock);
 	return;
 abort:
 	kvfree(filter);
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index 3bbfa7092c0d..b3edb6fdfca6 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -14,6 +14,8 @@
 #include <uapi/linux/exfat.h>
 #include <linux/buffer_head.h>
 
+struct shrinker;
+
 #define EXFAT_ROOT_INO		1
 
 /*
@@ -263,6 +265,11 @@ struct exfat_sb_info {
 
 	spinlock_t inode_hash_lock;
 	struct hlist_head inode_hashtable[EXFAT_HASH_SIZE];
+	/* Protects name_filter_lru and name_filter_count. */
+	spinlock_t name_filter_lock;
+	struct list_head name_filter_lru;
+	unsigned long name_filter_count;
+	struct shrinker *name_filter_shrinker;
 	struct rcu_head rcu;
 };
 
@@ -294,6 +301,7 @@ struct exfat_inode_info {
 	struct exfat_hint_femp hint_femp;
 	/* Complete, in-memory Bloom filter of directory names */
 	unsigned long *name_filter;
+	struct list_head name_filter_lru;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -635,6 +643,8 @@ bool exfat_name_filter_maybe_contains(struct inode *inode,
 void exfat_name_filter_add(struct inode *inode,
 			   const struct exfat_uni_name *name);
 void exfat_name_filter_free(struct inode *inode);
+void exfat_name_filter_shrinker_register(struct super_block *sb);
+void exfat_name_filter_shrinker_unregister(struct super_block *sb);
 
 static inline int exfat_chain_advance(struct super_block *sb,
 		struct exfat_chain *chain, unsigned int step)
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 4924f0fad836..465e33c9ba49 100644
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
+	sbi->name_filter_count = 0;
+	sbi->name_filter_shrinker = NULL;
 	ratelimit_state_init(&sbi->ratelimit, DEFAULT_RATELIMIT_INTERVAL,
 			DEFAULT_RATELIMIT_BURST);
 
-- 
2.34.1

