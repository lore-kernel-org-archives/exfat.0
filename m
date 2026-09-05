Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE8B4E56D0
	for <exfat@lists.linux.dev>; Sat,  5 Sep 2026 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788628275; cv=none; b=ZxUEBN0rnmvY9t28v1jCiubIojNZXY4g4OWzWAOx6S/Od78v04nd2r5slXkTKZoAYU1Ctg64MZMIKskEl7vgpOlEt4PwjUhLcP7mggQ0wR1rqOmJeFYaAHbfJo1MeV4m+kLSTIabw1NCn59AYSGZeHx9EB5wP92mjmpv4ug9AcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788628275; c=relaxed/simple;
	bh=pra9F6jW6/XJVLvZOuOu4MQjBgq6OC90I4ypiyb2yJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YsW7lcYAtNkKslAFpU0dEhPyrphu7uV7xnyszZRR48B0yZojUu2mFPxuoZwDJQW8U4wfxF4cYzcjq3N4cdbUQRJGsvHi0stW6bQbjwT9Stf7+qlMCUKJetBPULIeFZnvNkQWM0N/f0StBcj2YfA8EllmT66G+5GXLhLKxmeDgfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=g1NMmSXo; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="g1NMmSXo"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id D1B531D454;
	Sat,  5 Sep 2026 17:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me D1B531D454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788628272; bh=pra9F6jW6/XJVLvZOuOu4MQjBgq6OC90I4ypiyb2yJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g1NMmSXo2VrgGqAlUl0pt8sZ5aWT34QBA0S19+H+fk4hQsl/TFulq9CccHNJYGUyK
	 avG8NDvKMKBYZrHzp5v/dBSRqVqAJ0F99LK+oiqn/+dUQYVX1YeJTx1ecCjRj0oCTJ
	 zkQm1mm/B5a7uYxXBfQERvNSUW+rc6E4nC3SCfAQ=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id 30O2ECVNnGrEmwUA8KYfjw:T3
	(envelope-from <dxdt@dev.snart.me>); Sat, 05 Sep 2026 17:11:10 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>
Cc: exfat@lists.linux.dev,
	Hyunchul Lee <hyc.lee@gmail.com>,
	linux-kernel@vger.kernel.org,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v1 2/2] exfat: remove runtime integer division
Date: Sat,  5 Sep 2026 17:10:43 +0000
Message-ID: <20260905171043.922793-3-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905171043.922793-1-dxdt@dev.snart.me>
References: <20260905171043.922793-1-dxdt@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the arithmetic ops that compiles to the use of actual integer
division with bitwise ops. As the divisors involved are all power of
two, integer division is not necessary.

No functional change.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 fs/exfat/dir.c      | 3 ++-
 fs/exfat/exfat_fs.h | 1 +
 fs/exfat/namei.c    | 4 ++--
 fs/exfat/super.c    | 4 ++--
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index fa9abedf4d84..46514b13bebd 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -1309,7 +1309,8 @@ static int exfat_get_volume_label_dentry(struct super_block *sb,
 			es->bh = es->__bh;
 			es->bh[0] = bh;
 			es->num_bh = 1;
-			es->start_off = exfat_dentries_to_bytes(i) % sb->s_blocksize;
+			es->start_off = exfat_dentries_to_bytes(i) &
+					((u32)sb->s_blocksize - 1);
 
 			return 0;
 		}
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index a9131fe03302..41a2c7dfc479 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -232,6 +232,7 @@ struct exfat_sb_info {
 	unsigned int num_FAT_sectors; /* num of FAT sectors */
 	unsigned int root_dir; /* root dir cluster */
 	unsigned int dentries_per_clu; /* num of dentries per cluster */
+	unsigned int dentries_per_clu_bits;
 	unsigned int vol_flags; /* volume flags */
 	unsigned int vol_flags_persistent; /* volume flags to retain */
 	struct buffer_head *boot_bh; /* buffer_head of BOOT sector */
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 80f60e80786e..3c5746fc57d9 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -386,7 +386,7 @@ int exfat_find_empty_entry(struct inode *inode,
 	}
 
 	p_dir->dir = exfat_sector_to_cluster(sbi, es->bh[0]->b_blocknr);
-	p_dir->size -= dentry / sbi->dentries_per_clu;
+	p_dir->size -= dentry >> sbi->dentries_per_clu_bits;
 
 	return dentry & (sbi->dentries_per_clu - 1);
 }
@@ -638,7 +638,7 @@ static int exfat_find(struct inode *dir, const struct qstr *qname,
 	/* adjust cdir to the optimized value */
 	cdir.dir = hint_opt.clu;
 	if (cdir.flags & ALLOC_NO_FAT_CHAIN)
-		cdir.size -= dentry / sbi->dentries_per_clu;
+		cdir.size -= dentry >> sbi->dentries_per_clu_bits;
 	dentry = hint_opt.eidx;
 
 	info->dir = cdir;
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 2409e57e7370..217d150652cf 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -519,8 +519,8 @@ static int exfat_read_boot_sector(struct super_block *sb)
 		EXFAT_RESERVED_CLUSTERS;
 
 	sbi->root_dir = le32_to_cpu(p_boot->root_cluster);
-	sbi->dentries_per_clu = 1 <<
-		(sbi->cluster_size_bits - DENTRY_SIZE_BITS);
+	sbi->dentries_per_clu_bits = sbi->cluster_size_bits - DENTRY_SIZE_BITS;
+	sbi->dentries_per_clu = 1 << sbi->dentries_per_clu_bits;
 
 	sbi->vol_flags = le16_to_cpu(p_boot->vol_flags);
 	sbi->vol_flags_persistent = sbi->vol_flags & (VOLUME_DIRTY | MEDIA_FAILURE);
-- 
2.55.0

