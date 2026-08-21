Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEC739E9BD
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 10:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306790; cv=none; b=ZUGDduWhi5irhxfVBKHlYlPgalgmUwgFzck4uiEYIvEyFdaJdhAv5fAS0v+7A6c+TetIowPsDDTPwroJqVmC169twdNg1MXJb7KM75Q4hjFEP2+MuLs6IhUO3HgRmWwrp/CYH8uGNYg6Gwaeamrz6csbhOjhsxwQgQgbeoJyTq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306790; c=relaxed/simple;
	bh=cnASTI9NNDIyMBrS9UbkW6KwsdVmhRG/vfKSuXvT0Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e37jGB5TflafewQSSC4w06ubKyzarCeOEfbYtgWajfOT+SbHJnQDJxW+gF2qZ48b1H66sA9lpxXtuG78NYg06+zctMNd8b9MMqtn+PpO5Q8rp9PT5hPKDO7BLIl5Ux1tIFZwKlxGQTdR/+dWksX6z+wSHH22E4y/nNGs2Lb4WF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kNt/gR5x; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kNt/gR5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gs
	BZVl/kxpcbYTSjyC0Bseh+Wstyc+ghmPRTAJECPVE=; b=kNt/gR5xfQIMueqH48
	l0/r8PrXjr/2XK/JhguJKudv2jJpMFfG3NwmO/rwkOknO6raOBMsFLLKZYd+6Kb3
	hZZSIDZHuZGxA+f67V0ZjaQKaGWmZ2YFaevuN4lMX0zz0ycOLBPCKIQ2QoYw1XaC
	8pOvIqcPVIqK1v49zAn1gmZAU=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCX0Fr7Iohq8umKRA--.44781S4;
	Fri, 21 Aug 2026 18:05:49 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [RFC PATCH v1 2/6] exfat: take bitmap_lock at the start of exfat_alloc_cluster()
Date: Fri, 21 Aug 2026 18:05:27 +0800
Message-ID: <20260821100531.998196-3-chizhiling@163.com>
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
X-CM-TRANSID:_____wCX0Fr7Iohq8umKRA--.44781S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFyftF15ZFWrXrWkWr18Grg_yoW8Wry7pr
	47Ca45GrZ5Xan7WF4UKrn5Zr1ruw4kWw45JrW3J3WjyFn0yrsY9r9FqF15Za1jkw4xJanF
	qryYgw4ruanFka7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDtxfUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2x2EImqIIv3BLwAA3z

From: Chi Zhiling <chizhiling@kylinos.cn>

Acquire sbi->bitmap_lock at the top of exfat_alloc_cluster() so the
used_clusters/clu_srch_ptr validation and updates are covered by the
lock, removing a window where the early checks raced with concurrent
allocations.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/fatent.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/exfat/fatent.c b/fs/exfat/fatent.c
index a8b11e2ce43f..2db959669563 100644
--- a/fs/exfat/fatent.c
+++ b/fs/exfat/fatent.c
@@ -427,19 +427,22 @@ int exfat_alloc_cluster(struct inode *inode, unsigned int num_alloc,
 	struct super_block *sb = inode->i_sb;
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 
+	mutex_lock(&sbi->bitmap_lock);
+
 	total_cnt = EXFAT_DATA_CLUSTER_COUNT(sbi);
 
 	if (unlikely(total_cnt < sbi->used_clusters)) {
 		exfat_fs_error_ratelimit(sb,
 			"%s: invalid used clusters(t:%u,u:%u)\n",
 			__func__, total_cnt, sbi->used_clusters);
-		return -EIO;
+		ret = -EIO;
+		goto unlock;
 	}
 
-	if (num_alloc > total_cnt - sbi->used_clusters)
-		return -ENOSPC;
-
-	mutex_lock(&sbi->bitmap_lock);
+	if (num_alloc > total_cnt - sbi->used_clusters) {
+		ret = -ENOSPC;
+		goto unlock;
+	}
 
 	hint_clu = p_chain->dir;
 	/* find new cluster */
@@ -516,8 +519,8 @@ int exfat_alloc_cluster(struct inode *inode, unsigned int num_alloc,
 done:
 			sbi->clu_srch_ptr = hint_clu;
 			sbi->used_clusters += p_chain->size;
-			mutex_unlock(&sbi->bitmap_lock);
-			return 0;
+			ret = 0;
+			goto unlock;
 		}
 
 		hint_clu = new_clu + 1;
-- 
2.53.0

