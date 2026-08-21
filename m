Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D23472F81
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 10:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306789; cv=none; b=gimgtPzoPaZRNrEI7aB5yP500bhLVQa7iBtm7Cod1p6ivFvxCBI/28f6eVEI3h0BqenJn/7ut0aXT+Wvat5+ae62clKNC7pj1WUNKocFAND3wJVU1SGKL5OHnIAyYcCHcuVufXlgxV0g2w0XmnJWSR4oLiY45LLPTICNls8pFsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306789; c=relaxed/simple;
	bh=3pHytC5W1iaPKvgjIDJOsJhN+T7PeLFM3FhBfRKFzIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/fA5eEn01V4vMCri21SYKhR99xtL6XH8bxHna5czTrvDLMhYgIN8QmokjnjRUKNjU6Je9UTBsgDqFbK/zuEJk8rp66LACXhCXh3MBuNc2ecOvbwkVKaMCUluCHHLOtUfivkfkprliQMJd0UmIyI4lzZWk8ce8xQSthM/doORQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=S5mgI/3k; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="S5mgI/3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=j2
	ssn6cZSg9CgKxjgsMw4fWNsLvCQcbmWr4c+fVdioc=; b=S5mgI/3k8bKzFlZ7A6
	bUDQMTPXELWfg4kit/ZfD74Rs49R3Mii843cHaV/AL1+koPjHRqoRqp/O5Xop+IY
	HatrCANDJ0ENFXrk47tFMf5fUE68FjePm7nK3ev6DUybXTPgLLHmaGFUanWChIAS
	oJnXQWVXL6JV9YPvqvzKpyODM=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCX0Fr7Iohq8umKRA--.44781S3;
	Fri, 21 Aug 2026 18:05:49 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [RFC PATCH v1 1/6] exfat: remove dead hint_bmap updates in I/O and truncate paths
Date: Fri, 21 Aug 2026 18:05:26 +0800
Message-ID: <20260821100531.998196-2-chizhiling@163.com>
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
X-CM-TRANSID:_____wCX0Fr7Iohq8umKRA--.44781S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFy7CFykZr4kXr1Duw1xKrg_yoW8Aw43pr
	s3Gay8KanxXa4UuF409r4DZa4ay3Z3GFWDXFWIkryUJr9Iyr1F9FWjyFyUua1UGw4rury2
	qFy5Wr1UWrnxGrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UNL0OUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+B2EImqIIv3VYgAA3J

From: Chi Zhiling <chizhiling@kylinos.cn>

hint_bmap is only consumed by exfat_readdir() during directory
iteration. exfat_map_cluster() runs on the file I/O path (via iomap)
and never reaches directory iteration, and __exfat_truncate() only
resets the hint when the inode is already being evicted, so drop
them along with the now-unused local_clu_offset.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c  | 4 ----
 fs/exfat/inode.c | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index a2a9ee1a2004..29c5db12288e 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -278,10 +278,6 @@ int __exfat_truncate(struct inode *inode)
 	/* clear exfat cache */
 	exfat_cache_inval_inode(inode);
 
-	/* hint information */
-	ei->hint_bmap.off = EXFAT_EOF_CLUSTER;
-	ei->hint_bmap.clu = EXFAT_EOF_CLUSTER;
-
 	/* hint_stat will be used if this is directory. */
 	ei->hint_stat.eidx = 0;
 	ei->hint_stat.clu = ei->start_clu;
diff --git a/fs/exfat/inode.c b/fs/exfat/inode.c
index ccd13630187e..d041f893b1c3 100644
--- a/fs/exfat/inode.c
+++ b/fs/exfat/inode.c
@@ -144,7 +144,6 @@ int exfat_map_cluster(struct inode *inode, unsigned int clu_offset,
 	struct super_block *sb = inode->i_sb;
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 	struct exfat_inode_info *ei = EXFAT_I(inode);
-	unsigned int local_clu_offset = clu_offset;
 	unsigned int num_to_be_allocated = 0, num_clusters;
 
 	num_clusters = exfat_bytes_to_cluster(sbi, exfat_ondisk_size(inode));
@@ -234,10 +233,6 @@ int exfat_map_cluster(struct inode *inode, unsigned int clu_offset,
 			*balloc = true;
 	}
 
-	/* hint information */
-	ei->hint_bmap.off = local_clu_offset;
-	ei->hint_bmap.clu = *clu;
-
 	return 0;
 }
 
-- 
2.53.0

