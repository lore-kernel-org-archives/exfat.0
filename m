Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D303B4E8B
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 10:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306790; cv=none; b=sX3NMVzf6ioVtp2T6sRBS8Um2WiTyIz54a76rMJyQxnRAuTdM1VpccwB4wS9V0cnhIdJ/o+v36L3v/SKY5zqQjecyRyrjHgrPG+wJLkM6GW5ouuQHSC6vUEW7jYffBCZRRYfcuoFbs298oZAi4/Cxq6bgueMgK7URHN4+eTMiwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306790; c=relaxed/simple;
	bh=Rg8aNP+GmG8riZKg5ALm97SxNozAbxyKD/6Sl9MeRm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJQAT2rmMnHbkfKHCWn2UgL31PeeOZlrhbkBkfBRW6pzKY7EcIK6Yo5Jepf//MHEdo1bedm6hbjvcNOvMl1sAaS4pDYYvA0iKltlhEGp4blCEuhu2xzxrFauBhoQvRCUcomjenl0q4fFg0dDj9oSR/27Q7VLWx9EyB4Vrnk/xLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jwivui1S; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jwivui1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=45
	e0F3JYLMADVB/74KsXUhFkkD4nJlLfZ7gO7cpyAb0=; b=jwivui1SxLivomLwDU
	cxb9TX22Ke/QcKap7EyX6TXBzETyF3zFYR9+d3C7pw0eWl2reSVX7+jPQmbYhmxZ
	UDCjep3O4Gs2BKMriAF1d2N3V5Wqtf8cQHnZdY1FZ/SRMUsSMunxi/i0pZB4t4tn
	p7/ArRp0NyGC95sPELmI8Y9V8=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCX0Fr7Iohq8umKRA--.44781S8;
	Fri, 21 Aug 2026 18:05:50 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [RFC PATCH v1 6/6] exfat: take s_lock in read mode for iomap mapping paths
Date: Fri, 21 Aug 2026 18:05:31 +0800
Message-ID: <20260821100531.998196-7-chizhiling@163.com>
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
X-CM-TRANSID:_____wCX0Fr7Iohq8umKRA--.44781S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF1xtr1Dtry5WFy7WF18uFg_yoW5Gw43pa
	95Ka13Kr4UX3W7WF4kGFsYvF1Fkws3KF47JF18G3ZIv39Ivr10vFy09Fy3Zw15Xw1xGr4q
	qFWYgr4Uur1fCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2XdUUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3B6EImqIIv4UpQAA3r

From: Chi Zhiling <chizhiling@kylinos.cn>

The iomap mapping paths mainly access the FAT chain of the file itself.
Concurrent mappings of distinct inodes can therefore proceed in
parallel by taking s_lock in read mode instead of write mode. The
superblock-wide state shared between files is already protected by the
preceding patches: the allocation bitmap, used_clusters and clu_srch_ptr
by bitmap_lock, and the volume dirty flag / boot sector by atomic bit
ops with a single writer on the 0 -> 1 transition.

Concurrent access to the same inode stays serialized by the exclusive
inode_lock held in exfat_file_write_iter().

Writeback takes the read lock even though it does not hold inode_lock.
Folios under writeback are marked writeback, and truncate first flushes
and truncates the page cache, so truncate cannot run concurrently with
writeback. Writeback therefore only maps clusters that are still
committed or owned by the inode and cannot race with cluster freeing.

The lock ordering remains inode_lock -> s_lock -> bitmap_lock, so this
change does not introduce any new deadlock scenarios.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/iomap.c | 4 ++--
 fs/exfat/super.c | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index bc8bdfa9bb80..147e9da01a47 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -68,7 +68,7 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 	num_clusters = exfat_bytes_to_cluster_round_up(sbi,
 			offset + length) - exfat_bytes_to_cluster(sbi, offset);
 
-	down_write(&sbi->s_lock);
+	down_read(&sbi->s_lock);
 	iomap->bdev = inode->i_sb->s_bdev;
 	iomap->offset = offset;
 
@@ -135,7 +135,7 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 
 	iomap->flags |= IOMAP_F_MERGED;
 out:
-	up_write(&sbi->s_lock);
+	up_read(&sbi->s_lock);
 	return err;
 }
 
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 72a35f4079b4..64ec4d2d1bf6 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -94,6 +94,8 @@ int exfat_set_volume_dirty(struct super_block *sb)
 {
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 
+	lockdep_assert_held(&sbi->s_lock);
+
 	if (test_and_set_bit(VOLUME_DIRTY_BIT, &sbi->vol_flags))
 		return 0;
 
@@ -104,6 +106,8 @@ int exfat_clear_volume_dirty(struct super_block *sb)
 {
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 
+	lockdep_assert_held_write(&sbi->s_lock);
+
 	if (!test_and_clear_bit(VOLUME_DIRTY_BIT, &sbi->vol_flags))
 		return 0;
 
-- 
2.53.0

