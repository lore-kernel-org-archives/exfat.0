Received: from mail-pz2-f13.google.com (mail-pz2-f13.google.com [74.125.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63013446CA
	for <exfat@lists.linux.dev>; Sat, 19 Sep 2026 15:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789831408; cv=none; b=seFDOkm20rkaKMWVd8BZ+G42TXq1by+MfFU7Xf8+Le3AlD/2y9D/mdcZJDgNHUFx7Aqdvt9jgf9ZJS67LCceLZbl52InqrrRXEm77QwYov0Yu2A2bgt7REQhfjwL9iV3dnYAy0eM9Tz5qkOWZAVRTJAFM3asop/HzvZnqeX3U+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789831408; c=relaxed/simple;
	bh=Yqaq1Hk7u4nrzYHc+3CVcf4COPL1wBi/iltVI2RQc7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C+3YkrKbORO6pvMfF+MwyyVD1KISpigOA/bvsvVkd9xspLsQz8FVKMxSi8BeDGpHj50mb5WvdFN5fIHDZ3YmSOT9oTYxMH4QJgPTFWQhFWBJ+AzRCbhNQCa+y0PVS4rhaOpzRNJtKNQ8sV92qr+l8SyN5H5OkDGWX4Msrjjqn2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThcGk5ZY; arc=none smtp.client-ip=74.125.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThcGk5ZY"
Received: by mail-pz2-f13.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so1092509a12.3
        for <exfat@lists.linux.dev>; Sat, 19 Sep 2026 08:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789831406; x=1790436206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qR79KzzQEHA1BCgom4FGsnXuKP2YSduNO1GGm9Xb7l8=;
        b=ThcGk5ZYU2ElQwxQhKYgFnI03UIeKzMkbHkvWhATrhTfLydypqS20eVlttzrhCETlJ
         Ap/uQchV47g7ysiKi0WtvpYZNFqamY8jXbKGjiCSE7Czeu9WHVSLktzX8HHgp3cWmjPl
         TqmeaRg5IYGlk3KEuZEDwRipcnlwb0XK4Xqoi+vI5mDF0LmPEIMIR/nvm9n+i7DDokZ9
         0Ye6Ir+I4wTX0aMEVx0QFYYTkkWej/RqPEEyce2AKunQyNhqHNxmo87DT2SRwCCMWeEU
         D63aLqEmBrfV6wY22UgQDzfPSnr/niUj0RTHMEe6IkdT7m+MpTCbcn7sNxSpyqrUz6A7
         bWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789831406; x=1790436206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qR79KzzQEHA1BCgom4FGsnXuKP2YSduNO1GGm9Xb7l8=;
        b=TAPfoaitbFGR67siT8kIf5EQSTHULs2A1WjHvirnXdMeNcPQsssxGpIdtQ+rhd4MTS
         tlF36vTtxQlL3U+Ffvid12KQm7vP/VQ3zfeYi7xFIIPAuq4ym+Nna/8ZDlWCC1eOkhLt
         8xKNTSlgkm/7tTlPTAdu5KJ+Yq5zIxJi78MA219CR3ZdNjTcrElJzVqJ3BQipMigZG8l
         iTnnW+O4s4PcHRc3seTHcnjr+WNCfLBtomR/hawzbkf//TaEybEPBmC+qm+TLHGFUXww
         E6dVe0uRxDs2B1+Nxpx28QX8lQPMh1icDmdkyBwxUiEYxG65SQJDjBzmvX2uykyUzHDj
         INng==
X-Forwarded-Encrypted: i=1; AKwUvBwjL6UsR/suoNfl7giZCbyRhov5TQwUHJj6D84AmnDQO5xzw0+O8v3Mjzpt4jNbCQF23w1fpg==@lists.linux.dev
X-Gm-Message-State: AFuF++m4tsTCDyi7KbzTXg3gDXraup0bXWNfdrrpYILibo8ie3VBdWC3
	hz/p2uihl9gfO6FT1kRy7yRR9o1kamB7u7R68+1pchyPUGvMzTNeHO5Y
X-Gm-Gg: AYBFou2fqUxxbhnJV6srIBQX6YPJMTyCDY5qd/bJHK4WrHx2EMkkFtd2wq0XrPf2g09
	NHQuMNIUiofiNmB5jeYK/7I8PfdDDhZWmaHfm69ojaFmFCekhZPGmnlDq4N+0Y8zushMPSH+LpH
	XzwuY4ySVtG5marVM/iZTnpcJEr7CCP9bf9oQuaoCGO0gvVz3gfqBGuhenEWDnts3yl10CivgQ6
	1RT2k08LK/evbkpD/+hVK4cJLwHdjC6KnpFDR1iHYzNNioXQnVcTB1HTXKyiEk4QAgTjf4GYOSM
	zYi0GeqOn9WQAbSWyRAsVfSinUVcUqzDHiR1Fsana6PJZCQ3IQPerUJ+zyBqJfqRL7/BUwzGCQu
	h6pfFnD1Krqk9dnhb6CUCaOMaqNt+v6vTiyx0kuWr3/17ENNIZO6OdHNUdFK50Emy/f6sXZ9pgT
	aCgkSSVVZ+ZzIgJwsE/bFd4X3hSM/SuSemqAKUIl0cK/4aDKvdethOa2GdshIdrYrGdJNdAbzaD
	dHGZ+kZYXwc+oGslB3+0F0=
X-Received: by 2002:a17:90b:548d:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39e54d11d8dmr10521409a91.18.1789831405770;
        Sat, 19 Sep 2026 08:23:25 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0309d5760sm326230a91.4.2026.09.19.08.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 08:23:24 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v5 3/3] exfat: reclaim name filters under memory pressure
Date: Sat, 19 Sep 2026 23:22:40 +0800
Message-Id: <20260919152240.1507914-4-anmuxixixi@gmail.com>
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
