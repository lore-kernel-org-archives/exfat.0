Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E271C32C94A
	for <exfat@lists.linux.dev>; Sat,  5 Sep 2026 17:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788628273; cv=none; b=qzj3jhwHr5IlhubE3tSr87f6V3OvA7coiPOi7Fk6FvKV2mXWqXvpgM1cugo+5zE/RPv/U5Klcw72RApJi22aWp5OyVBpEipqVY5ddYR7xKN23oVB7VU20QkbIWlkhrNowXeMBtjkBqcErUdZWvBO8DQr2Gpz6pPC/muZU5+spc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788628273; c=relaxed/simple;
	bh=ZcpigCO04nwSFMw9aDXCYxAPZsH9b//hAQGEEKo49DY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3bOhZB2jtGOYh3I5AKpw7Yom5OT9/CHVSzTvg+omr9jMZWw7l5BUSWHL33DjYy5rfTj+zscuvGPbPG9OtHSB+zwUxwERGYKQXtmrdZHSZdiXdi11CEY4RMzVSa1cLOGScLnVHgDVlX5ZEl7CC6Nv7ldff69JmhbPc1ibYOLPX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=h2K11CSO; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="h2K11CSO"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 3AEDA1D452;
	Sat,  5 Sep 2026 17:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 3AEDA1D452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788628270; bh=ZcpigCO04nwSFMw9aDXCYxAPZsH9b//hAQGEEKo49DY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h2K11CSOkc5qM/OzFTB5DDm6VfjDH2YN/JaAmTAXNKNJ6YRcYVhGz3GMiRSR1D/d1
	 l1C+lMvwuyjCocyZQKQJSjJ+JNsfHPEQbGkI5r5LZqkC2KnOPfYRppWSpTku/prSAM
	 bIDK4UxiFXlQ6fgy/GLfj0zgvCFT8uROfbJ0U0HY=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id 30O2ECVNnGrEmwUA8KYfjw:T2
	(envelope-from <dxdt@dev.snart.me>); Sat, 05 Sep 2026 17:11:09 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>
Cc: exfat@lists.linux.dev,
	Hyunchul Lee <hyc.lee@gmail.com>,
	linux-kernel@vger.kernel.org,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v1 1/2] exfat: update percent_in_use field when updating volume flags
Date: Sat,  5 Sep 2026 17:10:42 +0000
Message-ID: <20260905171043.922793-2-dxdt@dev.snart.me>
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
 fs/exfat/super.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index a9ea36ba2693..2409e57e7370 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -18,6 +18,7 @@
 #include <linux/nls.h>
 #include <linux/buffer_head.h>
 #include <linux/magic.h>
+#include <linux/math.h>
 
 #include "exfat_raw.h"
 #include "exfat_fs.h"
@@ -69,16 +70,28 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
 	return 0;
 }
 
+static inline __u8 exfat_calc_perc_in_use(const struct exfat_sb_info *sbi)
+{
+	return (__u8)mul_u64_u32_div(sbi->used_clusters, 100,
+			EXFAT_DATA_CLUSTER_COUNT(sbi));
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
@@ -90,6 +103,7 @@ static int exfat_set_vol_flags(struct super_block *sb, unsigned short new_flags)
 		return 0;
 
 	p_boot->vol_flags = cpu_to_le16(new_flags);
+	p_boot->percent_in_use = new_piu;
 
 	set_buffer_uptodate(sbi->boot_bh);
 	mark_buffer_dirty(sbi->boot_bh);
-- 
2.55.0

