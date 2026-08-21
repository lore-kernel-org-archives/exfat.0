Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001A046AA9B
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306790; cv=none; b=Qfw8rw91Jm7ObzOQPEoiZsZergMn8ZXlaiEZ6tdeq2O70Q1LBRG/7KbrRmli+u8vzRI2CIEwOAwT3HYHq4yNRvBJ9oCGVLMaVEY809o5PvZVFmycQrkguAJrQu/R8IrJq5rMjbFUSwumviti0RnChcYhmO+OQL6SUjLCar/1ReE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306790; c=relaxed/simple;
	bh=7b4cthY1+0Q2u/grTK+sXWNz7xCT0Pn4BRzc/YZh2RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BKfrIhuLIqrwd2UGyJlrOEy7SfC+Aa8vHhZyaLeUIWCeMrg7FqW3w5MfCpNxG1Vqzjf0jlicOTvZs8JQqrI1JVbDW0CY1avSKNsjSSLZN6N1V3IBGy8h5wOuJ3FqMoaExeQcD2a2m5VOaplygPDjmVcMgzIVaGueCC2ZRHKTcqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hQyhK453; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hQyhK453"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=t/
	5pUE4Bfaq2HTnv7QgbHtJJrsNc4LPB3ttB7GtLyw4=; b=hQyhK453ZBEQ5h+5l3
	IDUU/zFmG/bV8xmA1vmDrVqz6wOzn1ol6MQqKv14TS5psA/8FoQ14hByxsHUYos9
	9Q23w2ImCNiSETavM2SQqy87ffd952rirvhf8dJ8vuLBKH4P0VDqaS+uGL4zN9bw
	TBHgBWGbUtuNHddrmebqp2EPs=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCX0Fr7Iohq8umKRA--.44781S6;
	Fri, 21 Aug 2026 18:05:49 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [RFC PATCH v1 4/6] exfat: lock FAT2 buffer while copying mirrored FAT entries
Date: Fri, 21 Aug 2026 18:05:29 +0800
Message-ID: <20260821100531.998196-5-chizhiling@163.com>
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
X-CM-TRANSID:_____wCX0Fr7Iohq8umKRA--.44781S6
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyfAF4UurWrCFy8uFyDKFg_yoWkCFcE9r
	92kay8G3s0yayrJ3WkZF1qqr13Ka18ur18Wry7CFy5W3sFy39xXrWDCr1qkasFya47Xrsx
	Arn5Wrs0k3WFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0eT5PUUUUU==
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3B2EImqIIv0UmQAA3X

From: Chi Zhiling <chizhiling@kylinos.cn>

exfat_mirror_bh() updates the FAT2 buffer without serializing the copy
against writeback. Once s_lock is converted to a read-write lock,
multiple read-side operations may run concurrently with writeback.
This can allow writeback to observe a partially updated FAT2 block.

Lock the destination buffer while copying the FAT entry data to
serialize the update with writeback and prevent torn FAT2 writes.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/fatent.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/exfat/fatent.c b/fs/exfat/fatent.c
index 2db959669563..f6ad2825ad19 100644
--- a/fs/exfat/fatent.c
+++ b/fs/exfat/fatent.c
@@ -24,7 +24,10 @@ static int exfat_mirror_bh(struct super_block *sb, struct buffer_head *bh)
 		c_bh = sb_getblk(sb, sec2);
 		if (!c_bh)
 			return -ENOMEM;
+		/* Serialize the copy with writeback to avoid a torn FAT2 write */
+		lock_buffer(c_bh);
 		memcpy(c_bh->b_data, bh->b_data, sb->s_blocksize);
+		unlock_buffer(c_bh);
 		err = exfat_update_bh(c_bh, sb->s_flags & SB_SYNCHRONOUS);
 		brelse(c_bh);
 	}
-- 
2.53.0

