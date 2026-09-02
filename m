Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8DE4A8A34
	for <exfat@lists.linux.dev>; Wed,  2 Sep 2026 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362748; cv=none; b=bpTmSTz5N3ZddhQjRC2HpD9SSbBU+3KcBms4ktYAeVfbxdLojN727FlyrMAkkpRiVxl8fpq1wnDJC7/ieF+03swNJWCunOGZMcv8K5VyVwi2MqXv4ejBdqNtmgMTgfwx10hfzLukqBHnIDKKfeagJxKzJBfEEZshEc53TFJLibs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362748; c=relaxed/simple;
	bh=eV++YHSYLH97mvqang/bv+b6/cf5SSX/9cfvxcjxKQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dNhEBcvZKlWwIbDHVVaJxaWdo+665m37eUx3DK7pUpKEz+9ByyDlpjKbeHBPaiPZO1TEDYnL+qKQtXqo//fRIOA054VOpP4vMJPS7V+lG7kHCB8o2esU0aKSHIsx74WEU5BKDgbKzzK4cY4bAyTXchppt3MQO4bSVCsAulATMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLFQ3NgZ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLFQ3NgZ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so159578a12.2
        for <exfat@lists.linux.dev>; Wed, 02 Sep 2026 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362746; x=1788967546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWFKIedgYv9yHKxOFWuvh3g0Aa0J3QdCQirkmfefCog=;
        b=WLFQ3NgZqu4Uf5ZDWMIB7qbXGLYyBd4/qWm1Yk6in3IR3YfoQlmAM0Ly2/w4n+8+f2
         rq5nnSuVYNpmk1lqf8YWcWT0znq38UQKbAQVzDR5YTLm4uvcVdFW+MGmTlSFLo+ypC4D
         zDBYIRbqt9m7FrGUCVrDMTb8ktJnZzwURSXt4u7IpRa2oMAK53/tzZl1eSKg9NpTmjLn
         WR7+pcLaaHm8aQ8TzmG6U5EKAMNz4kRwfwMgdGSdeb82CspEKAK9WF56aDo68O92m0dp
         BBTiptKG9XDTIVxcVAsq0QAe8zYZadm8CPDRAYWEzKn1eumTGSilGxe9Fdnh6iKzwPvq
         cMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362746; x=1788967546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dWFKIedgYv9yHKxOFWuvh3g0Aa0J3QdCQirkmfefCog=;
        b=ik+jmnCOlADV/+eHt2mxXBk6NhijzAdsIGsNhKJ+asY/3NLpaz+NlzC+wH7ytm9bdd
         LxbEC+8zDfqp9NR7nRpVcVOVuoaq/dKPnoFnefnptK7dHespY5yeuF5PlR1iphl6mTGG
         p20n/NDRhCMag/z+rNHsSevs7shtXISwyakxhYP/NImYHw04b6u5WkNiMbQvCMF/c5Ul
         F/OrdOP5LgAonxYcLi4c9/syQ65OXOf/EUwkmbGRtqNUT/IxvvfZJGyR1nastdYpS/bx
         1KewMz90QNlh+MIQVZs7s2lbeETgbo5kqvlIYhW/BoozI1eFxPN5ni9u0/KxhH73xKHS
         xykQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzmfANO22LwoPEXO8+qcMcpMsLeV+IVy8OOf38Hjdp/a+kNhbnSu8qGd/HvSLzSzIpgwghZw==@lists.linux.dev
X-Gm-Message-State: AFuF++m1SAdQi8C6geTwEnHD9WXfzF6Fot1Sf6/jmdHMaQhtSaVHgIRn
	I6gxIwHjud/zOWoMqfAiWci06MjMR9MQ6t7dgE0tGzsVjpchGvj7tFX5
X-Gm-Gg: AYBFou0EC9ljWLGhYl3VxrnmJY4kH+ziMCWxlToOLGUwOzZ58WZ7yCZ5CB/VA/zgYJo
	H7NdfYs//ZSuw080vT93gNl4OvN5OfuYEAwM9kBU7xDNsBJVW/y4Ae4PbZx62KZOZVYBBdNA2xt
	3Nq04Q+k8pxlBwtQk6NtpU+yYfaXFSzZHUVEvzaoPSpMBEe+DHisOaApX83LXBG/xO+Xf9zFfPe
	lsxnCPS7n9JktHZjnXZiEFZo9fBTvQy8uc+gNZ1hi6DIJD6VKSEQcOWLVelcL48tQo2zVcbNfvA
	JC7Q9CxCGbwwpi9+XIofBTQ7BcBs02kjNfCd8OnXdKbW95jTIu2OjIvGYtA2a10RYG/lZhVbt1y
	46B7X16o3hYWWJ5YreJUUvHCTZIA77QapPPFa9t+fs8xMN23mzmZOa08PHDZt/jpqbgVbBT9JcS
	+b9ch4NVDltNEGCm1pzT8s/oTZ3ZxC8iu21THKehd1pPRD5S3vt84tMcF9vV4OJmFcJVPFN7Kfk
	g==
X-Received: by 2002:a17:90b:4d06:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39aedec7bd8mr7717304a91.2.1788362745721;
        Wed, 02 Sep 2026 08:25:45 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd21e9dsm12359242a91.4.2026.09.02.08.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:25:45 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v3 2/3] exfat: retain the next empty directory entry hint
Date: Wed,  2 Sep 2026 23:24:54 +0800
Message-Id: <20260902152455.1273557-3-anmuxixixi@gmail.com>
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

After a Bloom filter miss skips the name scan, finding an empty entry can
still rescan the directory from the beginning.

Advance the empty-entry hint past each newly allocated entry set and retain
it while the name filter is active. Invalidate the hint whenever create
rollback, unlink, rmdir, rename, or move can free entries, so the next
allocation rediscovers earlier holes.

This preserves the fast append path during bulk creation without allowing
stale hints to cause unbounded directory growth.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/namei.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 96f33226f2c0..56772167ba5d 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -199,6 +199,50 @@ const struct dentry_operations exfat_utf8_dentry_ops = {
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
+					  es->bh[es->num_bh - 1]->b_blocknr);
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
+static void exfat_invalidate_empty_hint(struct inode *inode)
+{
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
+	ei->hint_femp.eidx = EXFAT_HINT_NONE;
+	ei->hint_femp.count = 0;
+}
+
 /* search EMPTY CONTINUOUS "num_entries" entries */
 static int exfat_search_empty_slot(struct super_block *sb,
 		struct exfat_hint_femp *hint_femp, struct exfat_chain *p_dir,
@@ -385,6 +429,8 @@ int exfat_find_empty_entry(struct inode *inode,
 		inode->i_blocks += sbi->cluster_size >> 9;
 	}
 
+	exfat_set_next_empty_hint(inode, p_dir, dentry, num_entries, es);
+
 	p_dir->dir = exfat_sector_to_cluster(sbi, es->bh[0]->b_blocknr);
 	p_dir->size -= dentry / sbi->dentries_per_clu;
 
@@ -516,6 +562,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 						   dentry, ES_ALL_ENTRIES);
 		if (!cleanup_ret) {
 			exfat_remove_entries(inode, &es, ES_IDX_FILE, false);
+			exfat_invalidate_empty_hint(inode);
 			cleanup_ret = exfat_put_dentry_set(&es,
 							   IS_DIRSYNC(inode));
 		}
@@ -628,7 +675,8 @@ static int exfat_find(struct inode *dir, const struct qstr *qname,
 		ei->hint_stat.clu = cdir.dir;
 		ei->hint_stat.eidx = 0;
 		ei->version = (inode_peek_iversion_raw(dir) & 0xffffffff);
-		ei->hint_femp.eidx = EXFAT_HINT_NONE;
+		if (!ei->name_filter)
+			ei->hint_femp.eidx = EXFAT_HINT_NONE;
 	}
 
 	/* search the file name for directories */
@@ -803,6 +851,8 @@ static int exfat_unlink(struct inode *dir, struct dentry *dentry)
 
 	/* update the directory entry */
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
+	exfat_invalidate_empty_hint(dir);
+
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
 	if (err)
 		goto unlock;
@@ -957,6 +1007,8 @@ static int exfat_rmdir(struct inode *dir, struct dentry *dentry)
 	exfat_set_volume_dirty(sb);
 
 	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
+	exfat_invalidate_empty_hint(dir);
+
 	err = exfat_put_dentry_set(&es, IS_DIRSYNC(dir));
 	if (err)
 		goto unlock;
@@ -1138,6 +1190,7 @@ static int exfat_move_file(struct inode *parent_inode,
 					  ES_ALL_ENTRIES)) {
 			exfat_remove_entries(parent_inode, &new_es,
 					    ES_IDX_FILE, false);
+			exfat_invalidate_empty_hint(parent_inode);
 			exfat_put_dentry_set(&new_es, false);
 		}
 		goto put_mov_es;
@@ -1214,6 +1267,7 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
 	else
 		ret = exfat_move_file(new_parent_inode, &uni_name, ei);
+	exfat_invalidate_empty_hint(old_parent_inode);
 	if (!ret)
 		exfat_name_filter_add(new_parent_inode, &uni_name);
 
@@ -1228,6 +1282,8 @@ static int __exfat_rename(struct inode *old_parent_inode,
 		}
 
 		exfat_remove_entries(new_inode, &es, ES_IDX_FILE, true);
+		exfat_invalidate_empty_hint(new_parent_inode);
+
 		ret = exfat_put_dentry_set(&es, IS_DIRSYNC(new_inode));
 		if (ret)
 			goto del_out;
-- 
2.34.1

