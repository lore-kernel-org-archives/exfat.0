Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080082;
	b=HE0giJG1Zln1EeOFx61FAqfGrZtaX89l7wO7bAb2jhACRRa7DDlNoT6ueX9N7roLTwKa
	 XXSLEDrrizq2xE5nxuE9cMpq43V1w1Ax71B+3awvUTLmrfau6M6G9OmyuOOBHlCJSN/dn
	 mL6JpIKZZ/PkQRUaM/z1qjyh5Y0RaM9zL8cMtZumHxt3gbmeKHmVZrDQFg1hhx+wgYIkg
	 6HQtY+xIJuU/MG1tmX97I68JOWkZJaHq6dk/oyhc6FmdShjgBqIh1XFuaN9Ms02CU5M+5
	 khkFPgrqlOniw6rezDaXBn4It+GggzyUogafnr6n6G6XiqgGhy07uBCb8bjW+CRZRsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080082;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=019gv+p6FE/TXCVWnfPGsl4wC8HfaqtkupjKjiggRag=;
	b=owoJau44Vrcsw3p60ezj3Vbd8emdJ/GyGuvUTsA93FsLfZjqMHk9bc8AtM5Zh6LKqFlk
	 3ShOd46SCnum8X7ZPjipI+joHy6d+xAHZIB5Cqb1LdkBUFEnvYKmnrpEU3VD54GZDgW6l
	 LZ1Jzmf9ClVTMb5/USpdEE5sYyZMTxvmpgUjog4c5l5FeqSHphcnm8CzyOddH+FnKyVgl
	 hGSy+mW7vx62MGxQgJ6gV35DjtK9jgDkb2dO4d30zaoFi67l8fWUgS1ZX9Z6xldYU9an4
	 a99r9XApeGr3wjqYNwkYrCftzZ6ukZRrtHUKZT6i7IN9Au4yekpYanURR8sCPpfuZZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cGkODmUr;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2CE606A31A
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 05:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A2CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cGkODmUr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=01
	9gv+p6FE/TXCVWnfPGsl4wC8HfaqtkupjKjiggRag=; b=cGkODmUr7/IT0TvHmf
	DFKc0MPgNOJe6U0IGYqcKuJPriX82TjTb64h15usoGdrAIMTucmsC58LsnTPaADH
	KP4cOpj6aXbyWa+IcYG242c0pDYsiSjR7AgPido9wM8GkdR6PnZkTYAy25i8hW8j
	h4W7UTRdyC8Zvy8njLEQnGcPY=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3F3wBO+BqPZ5dCw--.55178S2;
	Tue, 27 Oct 2026 13:47:47 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: linux-kernel@vger.kernel.org,
	exfat@lists.linux.dev
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2] exfat: drain dirty pages after forced shutdown
Date: Tue, 27 Oct 2026 13:47:40 +0800
Message-ID: <20261027054740.1148201-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:_____wD3F3wBO+BqPZ5dCw--.55178S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr47AF17Xw4UAF15try8Grg_yoW5Cr4kpw
	s0kasrGr4qq3W7Wrs7WFyDZ3W0k3WfKFWxJFyrua98Xr9Iyr1jkFyUKFy09F45KwnxCrWj
	qFs09348J3srCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnzVbUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9wOhP2rgOwMdjAAA3J

From: Chi Zhiling <chizhiling@kylinos.cn>

A forced shutdown sets EXFAT_FLAGS_SHUTDOWN, after which
exfat_writepages() returns -EIO.  Pages dirtied before the shutdown can
then never be written back, so a writer throttled in
balance_dirty_pages() while extending valid_size sleeps forever.

Stuck stack:
  balance_dirty_pages+0x4f0/0xb40
  exfat_prepare_valid_range+0x43/0x140
  exfat_file_write_iter+0x413/0x520
  iter_file_splice_write+0x32d/0x5a0
  direct_splice_actor+0x51/0x270
  splice_direct_to_actor+0xf5/0x270
  do_splice_direct+0x76/0xc0
  vfs_copy_file_range+0x244/0x710
  __do_sys_copy_file_range+0xe6/0x240
  do_syscall_64+0x106/0x5f0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f

Do not reject writeback up front.  Reject it per folio from
->writeback_range() instead: iomap then ends writeback and clears the
dirty state without issuing I/O, which lets the dirty limits drain and
unblocks the writer.

Write syscalls and page faults are still rejected in
exfat_file_write_iter() and exfat_page_mkwrite().  A write that is
already in progress may continue to dirty folios; writeback retires
them without I/O as described above.

Fixes: f761fcdd289d0 ("exfat: Implement sops->shutdown and ioctl")
Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c  | 3 +++
 fs/exfat/inode.c | 3 ---
 fs/exfat/iomap.c | 7 ++++++-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 1386149916bb..c358899e77f3 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -975,6 +975,9 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 	vm_fault_t ret;
 	loff_t new_valid_size, mmap_valid_size, fault_page_start;
 
+	if (exfat_forced_shutdown(inode->i_sb))
+		return vmf_fs_error(-EIO);
+
 	if (!inode_trylock(inode))
 		return VM_FAULT_RETRY;
 
diff --git a/fs/exfat/inode.c b/fs/exfat/inode.c
index 5129df1e79b4..4bea9e9deb94 100644
--- a/fs/exfat/inode.c
+++ b/fs/exfat/inode.c
@@ -283,9 +283,6 @@ static int exfat_writepages(struct address_space *mapping,
 		.ops		= &exfat_writeback_ops,
 	};
 
-	if (unlikely(exfat_forced_shutdown(mapping->host->i_sb)))
-		return -EIO;
-
 	return iomap_writepages(&wpc);
 }
 
diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index e50ecbfbfbe0..2089da8439e4 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -261,11 +261,16 @@ const struct iomap_ops exfat_write_iomap_ops = {
 static ssize_t exfat_writeback_range(struct iomap_writepage_ctx *wpc,
 		struct folio *folio, u64 offset, unsigned int len, u64 end_pos)
 {
+	struct inode *inode = wpc->inode;
+
+	if (exfat_forced_shutdown(inode->i_sb))
+		return -EIO;
+
 	if (offset < wpc->iomap.offset ||
 	    offset >= wpc->iomap.offset + wpc->iomap.length) {
 		int error;
 
-		error = __exfat_iomap_begin(wpc->inode, offset, len,
+		error = __exfat_iomap_begin(inode, offset, len,
 				0, &wpc->iomap, false);
 		if (error)
 			return error;
-- 
2.53.0

