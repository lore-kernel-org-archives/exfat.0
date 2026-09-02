Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94C746D56E
	for <exfat@lists.linux.dev>; Wed,  2 Sep 2026 12:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350554; cv=none; b=mRIkObDdbZMf7ZmwfTl32oqikJP5FrD/2lEoGlQaRuOSjED35/glmD/GJ6YV8xiEpbuarog/Aeig6AMtZQ0bOg70GWRs8sSVz3mB9jckvizNcOeWo0tBZGagiU2gNO4xZ1UBXeT2ewkmqrS/YSTHAUA9pA5ULgVOkTL+teJVu40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350554; c=relaxed/simple;
	bh=ts9vTFHY6jPPtqT4a6CWblQbYYCnjXoYJtui0TBKrbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRrLwIi13pqBuVjbVgF0/5jBRR6LYgdPyCGiMZXVL54s4UUX018xulhjdPXlwIIbm2rVwKeBCSwDc/TTz8vsz55zhkfR9mLBe0+OcfGfzpmEm/5p7SsvC0bYXw5UBf2vQG8oI4veR8IvnROm1uyXAhq6VvNmkpukstM2huUOC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=lOtxlKh6; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="lOtxlKh6"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 4B6161D452;
	Wed,  2 Sep 2026 12:02:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 4B6161D452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788350532; bh=ts9vTFHY6jPPtqT4a6CWblQbYYCnjXoYJtui0TBKrbs=;
	h=From:To:Cc:Subject:Date:From;
	b=lOtxlKh6Z19aLc6WUxxxmPj9D0SFXNbt1RFUwo4D5lcYVj2nnkHnJVFAsz2xqv0h3
	 WltRPVj/FG8b6xu6IS6qE7ofRTWvREk7Zz8wBu+fj58NMu8rkS3bEqvFDyeQcFg306
	 Yz+9J0ckf++qiSNOuniJHhiW1deCmON4kzz3oELQ=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id tWlVO0IQmGoYZAQA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Wed, 02 Sep 2026 12:02:11 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>
Cc: exfat@lists.linux.dev,
	Hyunchul Lee <hyc.lee@gmail.com>,
	David Timber <dxdt@dev.snart.me>
Subject: [RFC PATCH v0] exfat: update percent_in_use field when updating volume flags
Date: Wed,  2 Sep 2026 12:01:43 +0000
Message-ID: <20260902120143.7158-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the exfat fs implementation does not modify the
percent_in_use in the boot sector header at all. Although the field is
only an advisory field for situations where bit counting is not
feasible, not updating the field at all can cause confusion if the
the value is actually exposed to the user.

Calculate the value using integer arithmetic only when the dirty flag is
cleared. If the dirty flag is set, set to 0xFF.

It is set to 0xFF when mounting under the assumption that the number of
used clusters will change - this is basically what is recommended in the
SD Association's specs.

When clearing the dirty flag, if overridden by
sbi->vol_flags_persistent, set to 0xFF. This is intentional because if
there are orphan clusters, the calculated value would be incorrect and
correcting the fs error is fsck.exfat's job.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 fs/exfat/super.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index a9ea36ba2693..3df11164889a 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -69,16 +69,32 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
 	return 0;
 }
 
+static inline __u8 exfat_calc_perc_in_use(const struct exfat_sb_info *sbi)
+{
+	const unsigned long long total_clus = EXFAT_DATA_CLUSTER_COUNT(sbi);
+	unsigned long long ret = sbi->used_clusters;
+
+	ret *= 100;
+	ret /= total_clus;
+	return (__u8)ret;
+}
+
 static int exfat_set_vol_flags(struct super_block *sb, unsigned short new_flags)
 {
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 	struct boot_sector *p_boot = (struct boot_sector *)sbi->boot_bh->b_data;
+	__u8 new_piu;
 
 	/* retain persistent-flags */
 	new_flags |= sbi->vol_flags_persistent;
 
+	if (new_flags & VOLUME_DIRTY)
+		new_piu = 0xFF;
+	else
+		new_piu = exfat_calc_perc_in_use(sbi);
+
 	/* flags are not changed */
-	if (sbi->vol_flags == new_flags)
+	if (sbi->vol_flags == new_flags && new_piu == p_boot->percent_in_use)
 		return 0;
 
 	sbi->vol_flags = new_flags;
@@ -90,6 +106,7 @@ static int exfat_set_vol_flags(struct super_block *sb, unsigned short new_flags)
 		return 0;
 
 	p_boot->vol_flags = cpu_to_le16(new_flags);
+	p_boot->percent_in_use = new_piu;
 
 	set_buffer_uptodate(sbi->boot_bh);
 	mark_buffer_dirty(sbi->boot_bh);
-- 
2.55.0

