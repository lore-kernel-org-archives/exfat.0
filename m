Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819556;
	b=X/qj1KRTEyoIIGGK2d5r7pmN3peIxC28kALGlZGUrXHJvnuxZRab0D+RaRHmzA4/Gaba
	 4VZCRQPIvH1rKI97twvekJtYD9cOCwAliH9PU/a+egVNRd3FnB4QNx/N2usXp8EOyAT51
	 cMyarQVZwJ2YqHyzx6hyjd0AaRaqyBCyj46sHwsSli5tgcIa3eZV7G4rrwhL/HoGa9Irl
	 m61aDZ/Bap53eBpKI92+ox05MjSOOhc9Hr13e8Wkl3+PU7398c9dliwkJ8JN61bOl7urJ
	 TeCak5+0dQM1meKZ8dOflAE+v93neHYrzLsgtkgm7iFWuociqge/4fQMJfPCU4P9ygA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819556;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=U2saAtZWcXBIwZFXVYwyAX+JkhAmBRTGW/WXX2GuG1c=;
	b=pf1LIz8OC92j484q3306oUn4eK43LSq8TzH7wuH1pcsCycFFlCk3pu5tizQ/aTZBmoQA
	 pOLuB/H+Aktwo85lKk9qZQUNujRbLVzmXRgF16mzHvCixHC77suI/1bliJ/ItS83IQXfq
	 u1JI9Jd15T/pFBmKnKr3aYHkphXCEuNuFFfPk/38javR7c1B5ZBkgFy2ZRWCa9Fz4RmBH
	 qqZgeDvqmbGm8glr1BFZr8mO0ucN9Jws+KZodJHs+3PC3jmjmllxPf9K+4ONZIrX7g9Yp
	 Q06x1ENaDIDrmyLAXmgViTuqSuFcQu/OHqZjZSS06nheE3NCAtbh5oTz5upBXljjUJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kqZ28SZt;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A2606A88A
	for <exfat@lists.linux.dev>; Mon, 16 Nov 2026 08:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672A2606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kqZ28SZt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=U2
	saAtZWcXBIwZFXVYwyAX+JkhAmBRTGW/WXX2GuG1c=; b=kqZ28SZtn2ATvdNReJ
	NXcUpbgVMPr7pTuli8tzOHozXmWOJDYENOA7HX7Fklrjb+pnL6FQhZ1+iZsm5iPT
	nSMm21quO7oHkLvCfhNvJcSn64rUSsnIApwmYxwvc6xJf7CI22aEGiQLQQXV8ZXE
	fv49z2smWxVXLRcCjJLScyI0s=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAH5iLPxfpqqlTnHw--.59228S6;
	Mon, 16 Nov 2026 16:58:59 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v4 4/5] exfat: serialize file expansion with mmap write faults
Date: Mon, 16 Nov 2026 16:57:51 +0800
Message-ID: <20261116085752.3908082-5-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116085752.3908082-1-chizhiling@163.com>
References: <20261116085752.3908082-1-chizhiling@163.com>
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAH5iLPxfpqqlTnHw--.59228S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWrWr4UWFWUXrWfGr15Jwb_yoW8Ar15pr
	W5Gws5JFs8X34rur1v93WDZw1Y9a4xWFZrZa4Svan3AF95tr109an5tryjyFWUtws7Gr4j
	qFs0qFy7W3WDGw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07je_M3UUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+BP+nGr6xdOQtgAA3p

From: Namjae Jeon <linkinjeon@kernel.org>

File expansion changes allocation and i_size while mmap write faults
can initialize the invalid range. Cleaning only the old EOF folio does
not serialize the whole expansion with those faults.

Wait for direct I/O and hold invalidate_lock exclusively across cluster
allocation, EOF cleanup and the i_size update. Apply this to the common
expansion path used by ftruncate and fallocate.

Fixes: 98431d2cd1eb ("exfat: mark straddling folio RO and zero the post-EOF range")
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 fs/exfat/file.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 47e95b14d570..0d1eeeeffa76 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -81,7 +81,7 @@ static void exfat_pagecache_isize_extended(struct inode *inode, loff_t from,
 	folio_put(folio);
 }
 
-static int exfat_cont_expand(struct inode *inode, loff_t size)
+static int __exfat_cont_expand(struct inode *inode, loff_t size)
 {
 	int ret;
 	unsigned int num_clusters, new_num_clusters, last_clu;
@@ -158,6 +158,17 @@ static int exfat_cont_expand(struct inode *inode, loff_t size)
 	return -EIO;
 }
 
+static int exfat_cont_expand(struct inode *inode, loff_t size)
+{
+	int ret;
+
+	inode_dio_wait(inode);
+	filemap_invalidate_lock(inode->i_mapping);
+	ret = __exfat_cont_expand(inode, size);
+	filemap_invalidate_unlock(inode->i_mapping);
+	return ret;
+}
+
 /*
  * Preallocate space for a file. This implements exfat's fallocate file
  * operation, which gets called from sys_fallocate system call. User space
-- 
2.53.0

