Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03303CCFCC
	for <exfat@lists.linux.dev>; Sun, 27 Sep 2026 08:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496279; cv=none; b=ZaIk4gUarXoFFIIARAzRNGsV0gGqUIRgW8O6iYocg9tx3vlK2lnfvMN4oOn1Y/Er1V644OvEXy/Mk0hvRcvKT7Ag64mRdmv8n4AykuncFhbrY/GhanhgZQ2EljJ+9L+wbCtdY+kiJFsAvp93ZN5GaxM6Gevf/TYzzCnfw+38SYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496279; c=relaxed/simple;
	bh=kqaL7ihrMOLXwMT1cXEKvNMh4tLq+4kGfbCXFE0tXLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q0zaPDrEcJdRk9ktPGEI9o6agL2JV3xm3K8U3kNNwClMdqTqp1DTqnSObdy8R1jb9H5gBBMnMXZzsJ9arIqAtOyMhE6qhVOJxnYEkkEbZZj9AFs9mBZGzNhrL2k0rWBTPFKVM25+xymU/hiWOqmE6ur/MOiuCOB15RhRQthXUUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VDTpMXeY; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VDTpMXeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8D
	A33G3PMGkkRtLvHlImnqeYVoOOTU+86ytzFekoRVY=; b=VDTpMXeYJ9S9XxDkya
	v1LQ8SuAZvgbdjzQmGYsf/aP8PgXrp3RXy1Boc8idofvQgMIy5ZDnkOJczNcnAjX
	HUei5VJG1/sdDwIn2253170Lp5e2rpo0llH62vYb7hQp4gNgD5xA1WXDWp0h8grE
	ILenI7JVD4Qokja9hBR3pgaoo=
Received: from czl-pc (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXrkXNzbhqECuNBg--.31472S3;
	Sun, 27 Sep 2026 16:03:27 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	chenxiaosong@chenxiaosong.com,
	dxdt@dev.snart.me,
	hyc.lee@gmail.com,
	linkinjeon@kernel.org,
	liubaolin12138@163.com,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v1 1/5] exfat: advance valid_size to EOF for append writes
Date: Sun, 27 Sep 2026 16:03:00 +0800
Message-ID: <20260927080305.831641-2-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927080305.831641-1-chizhiling@163.com>
References: <20260927080305.831641-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgBXrkXNzbhqECuNBg--.31472S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF47Gr1rtF4rGr4kJw4Dtwb_yoW8Kr4fpF
	Wak3W5ArWIq3y3Gr1xGFs8Z3WrK3Z3trWxX3sYkan8ZrnFyw1fKF1UtFyUKay5t3ykJw4a
	qa1vyrWDJr17Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_9N-UUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9w9vDWq4zc+H6AAA3l

From: Chi Zhiling <chizhiling@kylinos.cn>

For an append write, the write position is recalculated by
generic_write_checks(). Therefore, the write position must be obtained
after generic_write_checks() returns.

Using the original write position to advance valid_size may cause the
valid_size update to be skipped, potentially exposing stale data.

Also move the truncate_pagecache() check below the recalculated
position, so that pos is never read before it is assigned.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index a2a9ee1a2004..b30aec858da6 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -854,8 +854,7 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
 	struct exfat_inode_info *ei = EXFAT_I(inode);
-	loff_t pos = iocb->ki_pos;
-	loff_t valid_size;
+	loff_t pos, valid_size;
 	int err;
 
 	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
@@ -863,11 +862,6 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 
 	inode_lock(inode);
 
-	if (pos > i_size_read(inode))
-		truncate_pagecache(inode, i_size_read(inode));
-
-	valid_size = ei->valid_size;
-
 	ret = generic_write_checks(iocb, iter);
 	if (ret <= 0)
 		goto unlock;
@@ -878,6 +872,11 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 		goto unlock;
 	}
 
+	pos = iocb->ki_pos;
+	if (pos > i_size_read(inode))
+		truncate_pagecache(inode, i_size_read(inode));
+
+	valid_size = ei->valid_size;
 	if (pos > valid_size) {
 		ret = exfat_extend_valid_size(inode, pos);
 		if (ret < 0 && ret != -ENOSPC) {
@@ -887,6 +886,8 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 		}
 		if (ret < 0)
 			goto unlock;
+
+		pos = valid_size;
 	}
 
 	if (iocb->ki_flags & IOCB_DIRECT)
@@ -899,9 +900,6 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 
 	inode_unlock(inode);
 
-	if (pos > valid_size)
-		pos = valid_size;
-
 	if (iocb->ki_pos > pos) {
 		ssize_t err = generic_write_sync(iocb, iocb->ki_pos - pos);
 
-- 
2.53.0

