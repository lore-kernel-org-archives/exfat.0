Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CABF314B63
	for <exfat@lists.linux.dev>; Sat,  5 Sep 2026 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587453; cv=none; b=DpfXc2mGKJcJBalCnTQMkbG1JkrKkrbCC9WMZsNTRkVE+Wr4StuWkQo4RpUe2H5zFpT9OBc+ecDfybiwMs3lGh7EUgnhWoiaQYwhpZBqNk6rQG65Qkjn97RgyUvxVHA0Cp/2anDstItpaDV3a7FP/G780CtM/Gg5l7QsXiz2SDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587453; c=relaxed/simple;
	bh=sOvNVYUlS8zqbh1Zwc5XTznuzu7Y+ytmADiIq0k9xMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1RipSKC8Sn5NHKQk8yQSBR8GBIrZIU3dIQWdh6czVXVW+MKMbHZsRekpmZgKTXLbPV4HePHFTjShbGRV+n/ME5qa/UN02JgDj/De2a7U4Oy3Vg76QYrhULXoAva2p4L/0sy7TLmnZGB3bfnLbdh1uZuClLJC6Kioz9z3fAnaeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jL3RHJC+; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jL3RHJC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mL
	MHfxsinIov2tZIZ9ZpyoYNskFS6JdaI/+yXD8jT/M=; b=jL3RHJC+RjT/QDaDks
	+sp1EirmdciFtcJArSgmaxSRNYUtYuwF1tTowDk6QsXh7ShZu3Dx3QA8UkcDfR/L
	9lWUdtGIFyehZ4i529EfHWdkF8Ts/ZgCl+eBXlU4iogYaBWuD8RGAM2obUCklHtB
	Zjchiu8V/2Dg9tIm9aUPJbaq0=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAnswumrZtqq78tAw--.49294S4;
	Sat, 05 Sep 2026 13:50:31 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH 2/2] exfat: take bitmap_lock at the start of exfat_alloc_cluster()
Date: Sat,  5 Sep 2026 13:49:51 +0800
Message-ID: <20260905054951.674766-3-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905054951.674766-1-chizhiling@163.com>
References: <20260905054951.674766-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnswumrZtqq78tAw--.49294S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw4xCrW3KryfKryDXw47Arb_yoW8Zr18pr
	WYy3W5Kr45Xan7WF48Krn5ZFyruw4kWFW5JrW3X3Wjyrs0vrsYgryqqFn8uFyjkws7Ja9F
	qryYga18uFZFka7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlmhrUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9wcWs2qbraerKQAA3s

From: Chi Zhiling <chizhiling@kylinos.cn>

exfat_alloc_cluster() checks sbi->used_clusters against the total
number of data clusters before acquiring sbi->bitmap_lock. A concurrent
allocation can update sbi->used_clusters after the check but before
the lock is acquired, making the check stale. This can allow the
allocation to proceed even though there are not enough free clusters,
causing it to fail partway through.

Acquire sbi->bitmap_lock before checking sbi->used_clusters so that
the free-space check and subsequent cluster allocation are serialized
with concurrent allocations.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/fatent.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/exfat/fatent.c b/fs/exfat/fatent.c
index a6728c361289..3c8bdc131f6f 100644
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
 		if (p_chain->size == num_alloc) {
 done:
 			sbi->clu_srch_ptr = hint_clu;
-			mutex_unlock(&sbi->bitmap_lock);
-			return 0;
+			ret = 0;
+			goto unlock;
 		}
 
 		hint_clu = new_clu + 1;
-- 
2.53.0

