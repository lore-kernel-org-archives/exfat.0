Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E79E39DBC5
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306786; cv=none; b=TciV68PABBD17OG2TBCCaRHiladT9oag+NOykA2XAmlL45AT3b2bkUCMU++vNlIT3WuF5qtG3NQTTcDRkTJU0mDSITCovFhcJa+Khh8U7667d69xsuVcpjFfiZOfavGbW6pwPdW74AbovxaS6/6IvzMQB7HlD7gFFdGm1bVg8Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306786; c=relaxed/simple;
	bh=2RsmOyichIyZPhhyF8xkhB/QBWU7fplblmFqj5PVJiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEQF9S4uYSJmsaJ2l86B0aRpO3FwCtpgIBN3rbxOM8WWcryd1pNUlFvgP3y7BOIsgFS/ckHme+2Z+C2mnifEordodBxW1jbZECac8UXZntNXa3D9mBPelfxxFwapXNO7TEy8HitIIOoPyz1AhdBAjTyIaipYfchh+ZHHX0XbDno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KZnglMo/; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KZnglMo/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=u/
	hnK46qkikKl7QWKcVhN2hitJ+i2z3Li5CjKXAsqz0=; b=KZnglMo/1ScN61pXty
	hDP83Kt2CBHPQjchlxn/TYph/SUwy2IWC4YuExf5y49kQmWzfu//Y3Ac8G+b9llj
	OcvBCGZFJGyx5qkeWfIuYwHR4Avn9AJVW98JkZZkn+8px+ftCGkDb9+0ZeIG3N5h
	edmDQslS2guQQvhr25HatnZ54=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCX0Fr7Iohq8umKRA--.44781S5;
	Fri, 21 Aug 2026 18:05:49 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [RFC PATCH v1 3/6] exfat: use atomic bit ops for volume dirty flag
Date: Fri, 21 Aug 2026 18:05:28 +0800
Message-ID: <20260821100531.998196-4-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821100531.998196-1-chizhiling@163.com>
References: <20260821100531.998196-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCX0Fr7Iohq8umKRA--.44781S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxurykZF45KF4kWr18WF15urg_yoWrtw4fpF
	4kKayrKayUt3WUXw4DJrs8AayfC34xWay3Cryfu34Dtry3G3W0vry8ta4SvF15Xwn7C3Wj
	qas0yrn5uFnrGFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlHqcUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9x2EImqIIv3hpQAA31

From: Chi Zhiling <chizhiling@kylinos.cn>

After converting s_lock to a reader-writer lock, multiple operations can
execute concurrently under the read lock. As a result, multiple threads may
concurrently update sbi->vol_flags, causing a race in the existing
read-modify-write sequence.

Convert sbi->vol_flags to an unsigned long bitmap and use
test_and_set_bit() / test_and_clear_bit() to atomically update the volume
dirty bit. Only the thread performing the 0 -> 1 transition updates the
boot sector, avoiding concurrent unsynchronized modifications of vol_flags
and the boot-sector buffer.

Remove vol_flags_persistent, since the bitmap can directly retain the
MEDIA_FAILURE state while preserving the complete 16-bit on-disk volume
flags field when writing it back.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/exfat_fs.h  |  3 +--
 fs/exfat/exfat_raw.h |  4 ++--
 fs/exfat/super.c     | 28 ++++++++++++----------------
 3 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index a9131fe03302..f1505c013248 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -232,8 +232,7 @@ struct exfat_sb_info {
 	unsigned int num_FAT_sectors; /* num of FAT sectors */
 	unsigned int root_dir; /* root dir cluster */
 	unsigned int dentries_per_clu; /* num of dentries per cluster */
-	unsigned int vol_flags; /* volume flags */
-	unsigned int vol_flags_persistent; /* volume flags to retain */
+	unsigned long vol_flags; /* volume flags (bitmap) */
 	struct buffer_head *boot_bh; /* buffer_head of BOOT sector */
 
 	unsigned int map_clu; /* allocation bitmap start cluster */
diff --git a/fs/exfat/exfat_raw.h b/fs/exfat/exfat_raw.h
index ec70cd35bba0..222fee5c2adf 100644
--- a/fs/exfat/exfat_raw.h
+++ b/fs/exfat/exfat_raw.h
@@ -14,8 +14,8 @@
 
 #define EXFAT_MAX_FILE_LEN	255
 
-#define VOLUME_DIRTY		0x0002
-#define MEDIA_FAILURE		0x0004
+#define VOLUME_DIRTY_BIT	1
+#define MEDIA_FAILURE_BIT	2
 
 #define EXFAT_EOF_CLUSTER	0xFFFFFFFFu
 #define EXFAT_BAD_CLUSTER	0xFFFFFFF7u
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index a9ea36ba2693..491273d8eeb6 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -69,27 +69,18 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
 	return 0;
 }
 
-static int exfat_set_vol_flags(struct super_block *sb, unsigned short new_flags)
+static int exfat_sync_vol_flags(struct super_block *sb)
 {
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 	struct boot_sector *p_boot = (struct boot_sector *)sbi->boot_bh->b_data;
 
-	/* retain persistent-flags */
-	new_flags |= sbi->vol_flags_persistent;
-
-	/* flags are not changed */
-	if (sbi->vol_flags == new_flags)
-		return 0;
-
-	sbi->vol_flags = new_flags;
-
 	/* skip updating volume dirty flag,
 	 * if this volume has been mounted with read-only
 	 */
 	if (sb_rdonly(sb))
 		return 0;
 
-	p_boot->vol_flags = cpu_to_le16(new_flags);
+	p_boot->vol_flags = cpu_to_le16((unsigned short)READ_ONCE(sbi->vol_flags));
 
 	set_buffer_uptodate(sbi->boot_bh);
 	mark_buffer_dirty(sbi->boot_bh);
@@ -103,14 +94,20 @@ int exfat_set_volume_dirty(struct super_block *sb)
 {
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 
-	return exfat_set_vol_flags(sb, sbi->vol_flags | VOLUME_DIRTY);
+	if (test_and_set_bit(VOLUME_DIRTY_BIT, &sbi->vol_flags))
+		return 0;
+
+	return exfat_sync_vol_flags(sb);
 }
 
 int exfat_clear_volume_dirty(struct super_block *sb)
 {
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 
-	return exfat_set_vol_flags(sb, sbi->vol_flags & ~VOLUME_DIRTY);
+	if (!test_and_clear_bit(VOLUME_DIRTY_BIT, &sbi->vol_flags))
+		return 0;
+
+	return exfat_sync_vol_flags(sb);
 }
 
 static int exfat_show_options(struct seq_file *m, struct dentry *root)
@@ -509,7 +506,6 @@ static int exfat_read_boot_sector(struct super_block *sb)
 		(sbi->cluster_size_bits - DENTRY_SIZE_BITS);
 
 	sbi->vol_flags = le16_to_cpu(p_boot->vol_flags);
-	sbi->vol_flags_persistent = sbi->vol_flags & (VOLUME_DIRTY | MEDIA_FAILURE);
 	sbi->clu_srch_ptr = EXFAT_FIRST_CLUSTER;
 
 	/* check consistencies */
@@ -526,9 +522,9 @@ static int exfat_read_boot_sector(struct super_block *sb)
 		return -EINVAL;
 	}
 
-	if (sbi->vol_flags & VOLUME_DIRTY)
+	if (test_bit(VOLUME_DIRTY_BIT, &sbi->vol_flags))
 		exfat_warn(sb, "Volume was not properly unmounted. Some data may be corrupt. Please run fsck.");
-	if (sbi->vol_flags & MEDIA_FAILURE)
+	if (test_bit(MEDIA_FAILURE_BIT, &sbi->vol_flags))
 		exfat_warn(sb, "Medium has reported failures. Some data may be lost.");
 
 	/*
-- 
2.53.0

