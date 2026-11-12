Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498750;
	b=2hrsYwA5hhyUUUQ2b+CH6heX+BsCs08mkjSHte0p4sZT59PWfHqLO20Auijolq3R30tE
	 l++iZfqh+mnfUsLflotTJne/bQ7kuuWYuqSbSX1k3Wf3fHl5MGbArBpeSXUEqhvASJDyZ
	 zC8Ub2vNZghA0MFNCHHhu9nP/PvYPebFq6EN7KWGua6bSbxorbgPb7tRZSfrWCoPbVFCL
	 lTVWwp93lNflQSwHUOnrIk5NhK4jHfNOHu8C0yyyF61K6aiIef2814X95VujaE/th75V/
	 MH9UnUkKudO0tVpLc7ykfxF9PnscHyFkL0fYaLL28izxx/GM5ylceMbBnkqH9e8vGCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498750;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=irWktLQeySdAZxxJKc18Dkd4RbmdR/sQhOyTkLTl+pk=;
	b=FyhQ4HLY0/TYFnvS6/qxIQIEflBCrtHRjg7zfpqc7enXoNtxHS7LmY6KXijradhi9eL7
	 MLO75VUd/o9zFOiPKTJuqS/+qKmR7wkIm3bcNjvwT+Br4OE/wBJXEncLzE/6d2bzFm6tF
	 zOJFGadBSZUZirJ+skj3MPUrYoqFHdewhrN2aDVTxKlhetNohlIUM53XpnAbivgxYgrvP
	 OxQ2cLF6e60fw7LTfayHC6TpXFbYOGSC5CrX9RtnImuyJMe6i1uE3KvKjTdM90fRNMjpM
	 bsPR4tZyVDqhb/PvcCEP9SXp8nvYuqf9Aa7zF69f4RhOWV/gBOJ+CJ4hsLCwh6p4EWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=tsr48+QX;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC670606A321
	for <exfat@lists.linux.dev>; Thu, 12 Nov 2026 15:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC670606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=tsr48+QX
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 175621D47C;
	Thu, 12 Nov 2026 15:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 175621D47C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794498743; bh=QXidgolQD7uSH2bAt7QRqErGbivMYfpbkQbljPgQOXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tsr48+QXSpuWqBCFuIP6MAozWCaPZMLMwRQfyVHTvsidxf3ZQQEQW172TnbnDrzLQ
	 QJNofVLClaUnGgdXwgUQzdpXHOWZB+yQTDHFPBADleBXFfOYo6Xo5AC1Rfmh0rJby5
	 ju6+gTt0XQa7Un5rquf8ELCQgKoEUnxeIH+nbOuE=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id RkGDLa/g9WoQFwIA8KYfjw:T4
	(envelope-from <dxdt@dev.snart.me>); Thu, 12 Nov 2026 15:52:21 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 4/6] lib: rename and export crc32 functions
Date: Thu, 12 Nov 2026 15:51:43 +0000
Message-ID: <20261112155145.177216-4-dxdt@dev.snart.me>
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

Rename crc32_le_base() to exfat_crc32_le_base() and make it a library
function for upcoming features. Rename exfat_efi_crc32() to
exfat_calc_crc32() as it's for calculating IEEE 802-3 CRC32(0x04C11DB7)
in general.

No functional change.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 include/libexfat.h | 3 ++-
 lib/crc.c          | 6 +++---
 mkfs/mkfs.c        | 6 +++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/libexfat.h b/include/libexfat.h
index 5e4a0f6..cf44b07 100644
--- a/include/libexfat.h
+++ b/include/libexfat.h
@@ -506,7 +506,8 @@ void exfat_put_mbr_partition(const struct exfat_blk_dev *bd, void *dst,
 void exfat_put_bootstrap_code(const char *user_msg, void *dst, unsigned int code_offset);
 
 /* crc.c */
-uint32_t exfat_efi_crc32(const void *buf, size_t len);
+uint32_t exfat_crc32_le_base(uint32_t crc, const void *m, size_t len);
+uint32_t exfat_calc_crc32(const void *buf, size_t len);
 
 /*
  * Misc
diff --git a/lib/crc.c b/lib/crc.c
index 8a08d41..5cf8f86 100644
--- a/lib/crc.c
+++ b/lib/crc.c
@@ -56,7 +56,7 @@ static const uint32_t crc32table_le[256] = {
 };
 
 /* From Linux kernel lib/crc/crc32-main.c */
-static inline uint32_t crc32_le_base(uint32_t crc, const void *m, size_t len)
+uint32_t exfat_crc32_le_base(uint32_t crc, const void *m, size_t len)
 {
 	const uint8_t *p = m;
 
@@ -66,7 +66,7 @@ static inline uint32_t crc32_le_base(uint32_t crc, const void *m, size_t len)
 }
 
 /* From Linux kernel block/partitions/efi.c */
-uint32_t exfat_efi_crc32(const void *buf, size_t len)
+uint32_t exfat_calc_crc32(const void *buf, size_t len)
 {
-	return (crc32_le_base(~0L, buf, len) ^ ~0L);
+	return (exfat_crc32_le_base(~0L, buf, len) ^ ~0L);
 }
diff --git a/mkfs/mkfs.c b/mkfs/mkfs.c
index fe3e416..3371373 100644
--- a/mkfs/mkfs.c
+++ b/mkfs/mkfs.c
@@ -278,7 +278,7 @@ static int build_gpt(struct exfat_blk_dev *bd, const struct exfat_user_input *ui
 	head_main->num_partition_entries = EXFAT_GPT_ENTRY_CNT;
 	head_main->sizeof_partition_entry = EXFAT_GPT_ENTRY_SIZE;
 	head_main->partition_entry_array_crc32 = 0;
-	head_main->partition_entry_array_crc32 = exfat_efi_crc32(arr, EXFAT_GPT_ENTRY_ARR_SIZE);
+	head_main->partition_entry_array_crc32 = exfat_calc_crc32(arr, EXFAT_GPT_ENTRY_ARR_SIZE);
 	exfat_print_gpt_header(exfat_debug, "main", head_main);
 	exfat_debug("GPT header partition_entry_array_crc32: 0x%08"PRIx32"\n",
 			head_main->partition_entry_array_crc32);
@@ -299,9 +299,9 @@ static int build_gpt(struct exfat_blk_dev *bd, const struct exfat_user_input *ui
 	gpt_header_to_le(head_main);
 	gpt_header_to_le(head_backup);
 	head_main->header_crc32 = 0;
-	head_main->header_crc32 = exfat_efi_crc32(head_main, sizeof(*head_main));
+	head_main->header_crc32 = exfat_calc_crc32(head_main, sizeof(*head_main));
 	head_backup->header_crc32 = 0;
-	head_backup->header_crc32 = exfat_efi_crc32(head_backup, sizeof(*head_backup));
+	head_backup->header_crc32 = exfat_calc_crc32(head_backup, sizeof(*head_backup));
 	exfat_debug("GPT main   header header_crc32: 0x%08"PRIx32"\n", head_main->header_crc32);
 	exfat_debug("GPT backup header header_crc32: 0x%08"PRIx32"\n", head_backup->header_crc32);
 	head_main->header_crc32 = cpu_to_le32(head_main->header_crc32);
-- 
2.56.0

