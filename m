Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498748;
	b=GKBrla6i5euEbIZ6oN6WwKOWZMOlTAyptubuHDF2aVJsqPu374BaPXSm0LhoOAAT9T0i
	 eLsOaK0rWnLEYkZ+9FxKEYTB3QFVnXyvZYTuO+CjJpgPrpr+kg1TZaLAU1mQwNjye2TFo
	 Rd24P8bTaJKSWpNmHnawRir3SVIJuCvN50Axb7lN0nW1STdRbN793d2Gf6qlHCcCYCDLB
	 CtWy9o9ymgdrbplp60LhM1VQJJ9i4ETl+ymYUBFephiiC4ay9yt4IZJ+/xdTeifOpukqq
	 ulkvnmx6keqxz6Zqd/QXeD+GEbDW+nco1W9eF8jpGy/Zd29Ixz3BuFfApDgTA5eJiAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498748;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WpYaoRhVaNZejDEWe7+MDJ3hgceW0gtA8DqF0O9Dy/g=;
	b=aY7nPCYte0qSCcs0vxSjzL9RjxoZiXYs8DkaFtP+d8woao14h5Ib3nblA4LGXXeBStcd
	 5n8dDSOACUFXcyRHyKIm7uhLKum3m3UklISy48jDZwslhMpbWlySByI6sy0lSI2AgnQfv
	 36oYBeQnPF8kaR7+BpPsZBUNwsOlF4OA88Iqge8pa03RuqLh+T12L25y7j8GrfXHrXvxL
	 bK8so9gA7NRVXbv/4fesYmDj7YQD52MBMDDQXNkqlVklO7TQcQjC8FGkqxO1fJF58q1ON
	 WmqN98LZSzhAZhoMnVqUUqzIyZES7WjlH+dpdnxWGo5GKt+x44io12QPLYxkoyjLFGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=xgnXL4rR;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDE3606A31C
	for <exfat@lists.linux.dev>; Thu, 12 Nov 2026 15:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DDE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=xgnXL4rR
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id B0C4A1CC1B;
	Thu, 12 Nov 2026 15:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me B0C4A1CC1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794498747; bh=w3TNGLGSiByQV9qi81Oq/Is81otnqRXXG2pw5V9kpGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xgnXL4rRgnaRWJPz0DupIuP79xZbmW6LC2T/+6IFjHrOl/GLTzQDbdFvukVyzj42k
	 uDXUU/3+RVJQhbQAsHfMF++j+XrqRnW3S1VHw2dL74wH4XIK5eamWwV2aM79kzdkmg
	 yf8LT0JNB1ReYUNXPsJEdUwu5JVFyWvBXY3PcRIA=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id RkGDLa/g9WoQFwIA8KYfjw:T6
	(envelope-from <dxdt@dev.snart.me>); Thu, 12 Nov 2026 15:52:25 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>,
	Reziya Saimaiti <reziya.saimaiti@insta360.com>
Subject: [PATCH v0 6/6] fsck: use CRC32 and tsearch() for duplicate filename detection
Date: Thu, 12 Nov 2026 15:51:45 +0000
Message-ID: <20261112155145.177216-6-dxdt@dev.snart.me>
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

Currently, the standard exFAT 16-bit file name hashing algorithm is used
with a bitmap to detect duplicate file names. As the 16-bit address
space is too small, the O(N) fallback by rewinding de_iter almost always
happens when the directory being checked is well-populated.

Alongside the existing 16-bit hashing for integrity check, also
calculate the CRC32 of file names using the facilities introduced in
commit 0844be34e702 ("mkfs: add partition table creation support for
Windows compatibility"). Use tsearch() and tfind() to map the CRC32
values to detect duplicate file names. CRC32 provides good enough
distribution in most use cases.

At the cost of reducing the chance of O(N) fallback search to near zero,
the use of binary tree increases memory footprint significantly. For
checking a directory containing 65K files, about 4MB of RSS is consumed
on 64-bit machines. The memory consumption will be much lower on 32-bit
machines as the data is mostly made up of pointers.

Performance and memory footprint impact:

pre-patch:

	exfatprogs version : 1.4.3 (2026-08-14)
	/dev/mmcblk0p1: clean. directories 5, files 62819
		Command being timed: "fsck.exfat /dev/mmcblk0p1"
		Elapsed (wall clock) time (h:mm:ss or m:ss): 0:46.95
		Maximum resident set size (kbytes): 3324
		File system inputs: 23584

Patch applied:

	exfatprogs version : 1.4.4 (2026-11-10)
	/dev/mmcblk0p1: clean. directories 5, files 62819
		Command being timed: "./fsck/fsck.exfat /dev/mmcblk0p1"
		Elapsed (wall clock) time (h:mm:ss or m:ss): 0:00.56
		Maximum resident set size (kbytes): 4376
		File system inputs: 23584

Link: https://github.com/LineageOS/issues/issues/712
Closes: https://github.com/exfatprogs/exfatprogs/pull/396
Cc: Reziya Saimaiti <reziya.saimaiti@insta360.com>
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 fsck/fsck.c         | 61 +++++++++++++++++++++++++++++++++++----------
 fsck/fsck.h         | 12 ++++++++-
 include/exfat_dir.h |  3 ++-
 lib/exfat_dir.c     | 13 ++++++++++
 4 files changed, 74 insertions(+), 15 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 4f22a0e..634248d 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -4,6 +4,13 @@
  *   Copyright (C) 2020 Hyunchul Lee <hyc.lee@gmail.com>
  */
 
+/* Enable tdestroy() */
+#ifdef __linux__
+#define _GNU_SOURCE
+#else
+#define _BSD_SOURCE
+#endif
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
@@ -14,6 +21,7 @@
 #include <locale.h>
 #include <assert.h>
 #include <fcntl.h>
+#include <search.h>
 
 #include "exfat_ondisk.h"
 #include "libexfat.h"
@@ -711,12 +719,30 @@ static int handle_duplicated_filename(struct exfat_de_iter *iter,
 			ER_DE_DUPLICATED_NAME, "filename is duplicated");
 }
 
+/* Util functions for name_hash_tree */
+
+static void hash_tree_freef(void *ptr)
+{
+	/* Do nothing: no memory is dynamically allocated on our end */
+	(void)ptr;
+}
+
+static int hash_tree_compf(const void *a, const void *b)
+{
+	if ((uintptr_t)a == (uintptr_t)b)
+		return 0;
+	if ((uintptr_t)a < (uintptr_t)b)
+		return -1;
+	return 1;
+}
+
 static int check_name_dentry_set(struct exfat_de_iter *iter,
 				 struct exfat_inode *inode)
 {
 	struct exfat_dentry *stream_de;
 	size_t name_len;
 	__u16 hash;
+	uint32_t hash_crc32;
 	int ret = 0;
 
 	exfat_de_iter_get(iter, 1, &stream_de);
@@ -746,6 +772,7 @@ static int check_name_dentry_set(struct exfat_de_iter *iter,
 	}
 
 	hash = exfat_calc_name_hash(iter->exfat, inode->name, (int)name_len);
+	hash_crc32 = exfat_calc_name_hash_crc32(iter->exfat, inode->name, (int)name_len);
 	if (cpu_to_le16(hash) != stream_de->stream_name_hash) {
 		if (repair_file_ask(iter, NULL, ER_DE_NAME_HASH,
 				    "the name hash of a file is wrong")) {
@@ -757,10 +784,18 @@ static int check_name_dentry_set(struct exfat_de_iter *iter,
 		}
 	}
 
-	if (BITMAP_GET(iter->name_hash_bitmap, hash)) {
+	if (tfind((void *)(uintptr_t)hash_crc32, iter->name_hash_tree, hash_tree_compf))
 		ret = handle_duplicated_filename(iter, inode);
-	} else
-		BITMAP_SET(iter->name_hash_bitmap, hash);
+	else {
+		void *inserted = tsearch((void *)(uintptr_t)hash_crc32,
+					 iter->name_hash_tree, hash_tree_compf);
+
+		if (inserted == NULL) {
+			exfat_err("failed to allocate memory\n");
+			/* Returning -ENOMEM here results in incorrect behaviour :( */
+			exit(FSCK_EXIT_OPERATION_ERROR);
+		}
+	}
 
 	return ret;
 }
@@ -1471,9 +1506,11 @@ static int read_children(struct exfat_fsck *fsck, struct exfat_inode *dir)
 	else if (ret)
 		return ret;
 
-	de_iter->name_hash_bitmap = fsck->name_hash_bitmap;
-	memset(fsck->name_hash_bitmap, 0,
-			EXFAT_BITMAP_SIZE(EXFAT_MAX_HASH_COUNT));
+	if (fsck->name_hash_tree != NULL) {
+		tdestroy(fsck->name_hash_tree, hash_tree_freef);
+		fsck->name_hash_tree = NULL;
+	}
+	de_iter->name_hash_tree = &fsck->name_hash_tree;
 
 	while (1) {
 		ret = exfat_de_iter_get(de_iter, 0, &dentry);
@@ -1612,12 +1649,6 @@ static int exfat_filesystem_check(struct exfat_fsck *fsck)
 		return -ENOENT;
 	}
 
-	fsck->name_hash_bitmap = malloc(EXFAT_BITMAP_SIZE(EXFAT_MAX_HASH_COUNT));
-	if (!fsck->name_hash_bitmap) {
-		exfat_err("failed to allocate name hash bitmap\n");
-		return -ENOMEM;
-	}
-
 	list_add(&exfat->root->list, &exfat->dir_list);
 
 	while (!list_empty(&exfat->dir_list)) {
@@ -1646,7 +1677,11 @@ static int exfat_filesystem_check(struct exfat_fsck *fsck)
 	}
 out:
 	exfat_free_dir_list(exfat);
-	free(fsck->name_hash_bitmap);
+	if (fsck->name_hash_tree != NULL) {
+		tdestroy(fsck->name_hash_tree, hash_tree_freef);
+		fsck->name_hash_tree = NULL;
+	}
+
 	return ret;
 }
 
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 5ed758e..6e621e6 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -34,7 +34,17 @@ struct exfat_fsck {
 	bool			dirty:1;
 	bool			dirty_fat:1;
 
-	char *name_hash_bitmap;
+	/*
+	 * btree of CRC32 of file names in the current subdirectory
+	 *
+	 * Unlike the traditional use, the key is the CRC32 value itself rather
+	 * than a pointer to a dynamically allocated memory. This is a hack that
+	 * depends on the fact that Linux(and most OSes) support starts from
+	 * 32-bit CPUs. In other words, void * type must be able to hold
+	 * uint32_t. This might not be always the case(eg. IBM S390), although
+	 * the hashing should work just fine with fewer bits.
+	 */
+	void *name_hash_tree;
 	struct progress_bar progress_bar;
 };
 
diff --git a/include/exfat_dir.h b/include/exfat_dir.h
index 6edb072..57a2ebe 100644
--- a/include/exfat_dir.h
+++ b/include/exfat_dir.h
@@ -28,7 +28,7 @@ struct exfat_de_iter {
 #define INVALID_NAME_NUM_MAX	9999999
 	unsigned int		invalid_name_num;
 
-	char *name_hash_bitmap;		/* bitmap of children's name hashes */
+	void **name_hash_tree;		/* btree of children's name hashes */
 };
 
 struct exfat_lookup_filter {
@@ -106,6 +106,7 @@ void exfat_calc_dentry_checksum(struct exfat_dentry *dentry,
 uint16_t calc_dentry_set_checksum(struct exfat_dentry *dset, int dcount);
 uint16_t exfat_calc_name_hash(struct exfat *exfat,
 			      __le16 *name, int len);
+uint32_t exfat_calc_name_hash_crc32(struct exfat *exfat, __le16 *name, int len);
 
 int exfat_find_free_cluster(struct exfat *exfat, int clu_count,
 		clus_t *new_clu);
diff --git a/lib/exfat_dir.c b/lib/exfat_dir.c
index 28f4b36..9b63b04 100644
--- a/lib/exfat_dir.c
+++ b/lib/exfat_dir.c
@@ -657,6 +657,19 @@ uint16_t exfat_calc_name_hash(struct exfat *exfat,
 	return chksum;
 }
 
+uint32_t exfat_calc_name_hash_crc32(struct exfat *exfat, __le16 *name, int len)
+{
+	uint16_t ch;
+	uint32_t crc = ~0L;
+
+	while (len-- > 0) {
+		ch = exfat->upcase_table[le16_to_cpu(*name++)];
+		crc = exfat_crc32_le_base(crc, &ch, sizeof(ch));
+	}
+
+	return (crc ^ ~0L);
+}
+
 static void unix_time_to_exfat_time(time_t unix_time, __u8 *tz, __le16 *date,
 				    __le16 *time, __u8 *time_ms)
 {
-- 
2.56.0

