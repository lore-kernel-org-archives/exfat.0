Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498748;
	b=RX+8YyLJPWYH/lyCMXEQQUR40qg4+pbdpDI3hMJLJdL1h3R1IDNVdC1PsNYHRH2yyFtN
	 +g3JSycKhKn4GJ4EMHR34OcfIEEixfye3xtRsS3q7h+I8YA6MvivLdPUzH0cYRAlsLjYz
	 N0Rnunbq0C0wD+CoUKESBBdWKkAmKPeltBZ1vIPL4BCFyhWOiTC1kVC0+PApv1vFw7Kp6
	 P4aCplEnv9ZYH9v4zw7Llj6ArebKB/9qc/4RRPZx286ev7fN5Fm46Sb/QuGr7nAD8HSWi
	 ZFGXwzzJrALQSa0nkDYucw41KVGEERE5XYcBuAdwOoAplKDNdo1iS4F/WPBtDC8cjQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498748;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=79cFjVo0RYoSig8PK3PC2h+9xCfBunUYSGnrN8cdSOQ=;
	b=myh8uneAF78acgY31Juy8bj4Ue088fiWEzHCQjQElfGO/CbVqwbj8iu/Ym2ckgk8swj7
	 4WCbQ4iS1mAIviDd1FDMdwe1qm8wmmyl/4qy/MjufemY75VagXfB2FdV2qy8GRw7a467i
	 YUErj/K66E23pz1y3xiGOQk3CKFT+2an6v0+cDymv01oSG3t1gxTTtv2xkoFafgKpWuq7
	 djl2tAiS2ia4edBbF5NR1YDjCTNfrBz1Tl09fIpuHESNsloV5qHQJatI/uW5OvtQWLLos
	 A6bMeM7VRd0vXxu32y8jbwT4XUodj2wYsHtkRSt0c7t7CkjxxXn8LRf4S66SeTCKIow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=nLqaFaGn;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2582606A327
	for <exfat@lists.linux.dev>; Thu, 12 Nov 2026 15:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2582606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=nLqaFaGn
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 456321D47B;
	Thu, 12 Nov 2026 15:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 456321D47B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794498741; bh=8dP8r+X6Vh9PYCNHf13bFADuAaALko1Wza05x7BidbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nLqaFaGn1II4X9BQ5O0DXM8Y6VFHQzlepX6jJU/ZnUla3PcbKy/gwWTWC27Vq93R8
	 H5upw8dcRrSa1QLYnqwF3V5O2ofkobWvuwnv6PLgcfogB2kr3n49tylmkL0+MKMKOM
	 yzA2eVMsZZvOPbNVCg2INME1k3KfaKL6XsLSOQPY=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id RkGDLa/g9WoQFwIA8KYfjw:T3
	(envelope-from <dxdt@dev.snart.me>); Thu, 12 Nov 2026 15:52:20 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 3/6] lib: relocate crc.c from mkfs to lib
Date: Thu, 12 Nov 2026 15:51:42 +0000
Message-ID: <20261112155145.177216-3-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112155145.177216-1-dxdt@dev.snart.me>
References: <20261112155145.177216-1-dxdt@dev.snart.me>
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

Relocate crc functions from mkfs to lib for testing and use in other
parts of the project.

No functional change.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 include/libexfat.h  | 3 +++
 lib/Makefile.am     | 2 +-
 {mkfs => lib}/crc.c | 1 -
 mkfs/Makefile.am    | 2 +-
 mkfs/mkfs.h         | 3 ---
 5 files changed, 5 insertions(+), 6 deletions(-)
 rename {mkfs => lib}/crc.c (99%)

diff --git a/include/libexfat.h b/include/libexfat.h
index 3749086..5e4a0f6 100644
--- a/include/libexfat.h
+++ b/include/libexfat.h
@@ -505,6 +505,9 @@ void exfat_put_mbr_partition(const struct exfat_blk_dev *bd, void *dst,
 		const uint8_t ptype, uint32_t chs_limit);
 void exfat_put_bootstrap_code(const char *user_msg, void *dst, unsigned int code_offset);
 
+/* crc.c */
+uint32_t exfat_efi_crc32(const void *buf, size_t len);
+
 /*
  * Misc
  */
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 7810e9f..c6993cc 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -1,7 +1,7 @@
 AM_CFLAGS = -Wall -include $(top_builddir)/config.h -I$(top_srcdir)/include -fno-common
 noinst_LIBRARIES = libexfat.a
 
-libexfat_a_SOURCES = libexfat.c exfat_fs.c exfat_dir.c utils.c
+libexfat_a_SOURCES = libexfat.c exfat_fs.c exfat_dir.c utils.c crc.c
 
 check_PROGRAMS = tests/suite0000-bitmap tests/suite0000-dump-arch tests/suite0001-parse
 TESTS = tests/suite0000-bitmap tests/suite0000-dump-arch tests/suite0001-parse
diff --git a/mkfs/crc.c b/lib/crc.c
similarity index 99%
rename from mkfs/crc.c
rename to lib/crc.c
index 0423ecb..8a08d41 100644
--- a/mkfs/crc.c
+++ b/lib/crc.c
@@ -4,7 +4,6 @@
  */
 #include "exfat_ondisk.h"
 #include "libexfat.h"
-#include "mkfs.h"
 
 static const uint32_t crc32table_le[256] = {
 	/*-
diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
index 230b232..42426d8 100644
--- a/mkfs/Makefile.am
+++ b/mkfs/Makefile.am
@@ -3,4 +3,4 @@ mkfs_exfat_LDADD = $(top_builddir)/lib/libexfat.a $(BLKID_LIBS)
 
 sbin_PROGRAMS = mkfs.exfat
 
-mkfs_exfat_SOURCES = mkfs.c upcase.c mkfs.h crc.c
+mkfs_exfat_SOURCES = mkfs.c upcase.c mkfs.h
diff --git a/mkfs/mkfs.h b/mkfs/mkfs.h
index 4eadc96..eafffbd 100644
--- a/mkfs/mkfs.h
+++ b/mkfs/mkfs.h
@@ -140,9 +140,6 @@ bool exfat_write_mkfs_data_regions(struct exfat_blk_dev *bd,
 bool exfat_verify_mkfs_data_regions(struct exfat_blk_dev *bd,
 		const struct exfat_mkfs_data_region *r);
 
-/* crc.c */
-uint32_t exfat_efi_crc32(const void *buf, size_t len);
-
 bool exfat_open_rnddev(void);
 void exfat_close_rnddev(void);
 void exfat_gen_guid(void *out);
-- 
2.56.0

