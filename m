Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498747;
	b=eBkR9Ln2VWR18/kA8KCZr0yZEH1E0ZzJfQUoAnRS0TOEwp2sHtKmQB4QHkyjK1oPeE6A
	 v4OJV5CzpvRKarkNpUEcIk1CYt85tc0z/jiAUF+S239izbVcM0THoYZCpFvXnWHmrl16/
	 7wjSY0PknfljlCDXkxtNEwqyPp2Ggdv44nwyLDQpTI/SgXDmqMHYU88BfOgqwv2oGXrWy
	 XPpG5x1hIVR0YnL4xHp9fXYW0/OXEhqXdPfSct9ibMGv1RyXDP6ow2ZHSQlSyysCJieZf
	 aFwgSw9vPy4ig7kl+65zDH+BJ++9Sdr2dosoG4UcwQGRTWZ/kyeIxIIwhFxzl9++kBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498747;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RvC+0pqGYJV4e9stC9dec78YM3w5NlfpwhcdDC3FXzg=;
	b=gb8MosxSmocVPatBwscGM6Sa+ty2xZMGHmwNf2J7cOYwpF4RdDpPToY/ydmQ644gHHVV
	 vCEa9wX/lr+au/AjpKroYAH0G3jJiFMk98/0YfCOeFlSpjmhSkumRsVIvwjTEqwnfKkUz
	 /GhGEvFZSlBMv/9NzeEyU7NerqJpKmtDl5JKfJArQSVxkA8XFemEiPQKgOdxqBe58CLXN
	 YMP5w1O7+3AXWJsuUhR00Lobl1EXtpf1Sr8cmWa95BK8XP3Uo/sOxmnCaqCVCY0RtluTG
	 CE2luejT5W6XKAj5an09fZVTSgU1U2cosLvp3h01qUz0290BxIWjkFsKKqOnDCb81lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=uVMljwRF;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A13606A323
	for <exfat@lists.linux.dev>; Thu, 12 Nov 2026 15:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A13606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=uVMljwRF
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id DEB651D47D;
	Thu, 12 Nov 2026 15:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me DEB651D47D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794498745; bh=N2vfnpsHONG46iiqcts9Hd2PufYQ5Ej1oalfBotBhgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uVMljwRFOydebLgdoZVSPd/9Wia/QqpGUmN6bGxqDMdM6+IJJEuddsP7jQO/k+8Gr
	 sA8QhIbcky0Y0GmMUlvz6QQXKlXaiJXFgk3Tc4aNJ5ymU1C+PwRkvSduHoALltLNKC
	 9hD9H2W7gIaJ68GTdQNeinqmO4XwnLGoaOyL0fTA=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id RkGDLa/g9WoQFwIA8KYfjw:T5
	(envelope-from <dxdt@dev.snart.me>); Thu, 12 Nov 2026 15:52:23 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 5/6] lib: add CRC32 tests
Date: Thu, 12 Nov 2026 15:51:44 +0000
Message-ID: <20261112155145.177216-5-dxdt@dev.snart.me>
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

Add lib/tests/suite0002-crc for checking correctness of CRC32
calculation and benchmarking performance and memory footprint. This is
in preparation for using CRC32 as duplicate filename handling.

No functional change.

Benchmark result on RPI 3(BCM2837):

	$ /usr/bin/time -v ./lib/tests/suite0002-crc

	=== IMG_XXXX.jpg, exFAT ===
	collisions:	9234 out of 10000 (92%)
	elapsed:	0.022618742s
	=== IMG_XXXX.jpg, CRC32 ===
	collisions:	0 out of 10000 (0%)
	elapsed:	0.029111054s
	=== IMG_YYYYMMDD_hhmmss.jpg, exFAT ===
	collisions:	49120 out of 65536 (74%)
	elapsed:	0.287861648s
	=== IMG_YYYYMMDD_hhmmss.jpg, CRC32 ===
	collisions:	1213 out of 65536 (1%)
	elapsed:	0.378736875s
	...
		Maximum resident set size (kbytes): 3924

Link: https://github.com/LineageOS/issues/issues/712
Link: https://github.com/exfatprogs/exfatprogs/pull/396
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 lib/Makefile.am           |  15 +-
 lib/tests/suite0002-crc.c | 299 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 312 insertions(+), 2 deletions(-)
 create mode 100644 lib/tests/suite0002-crc.c

diff --git a/lib/Makefile.am b/lib/Makefile.am
index c6993cc..e9a21db 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -3,8 +3,16 @@ noinst_LIBRARIES = libexfat.a
 
 libexfat_a_SOURCES = libexfat.c exfat_fs.c exfat_dir.c utils.c crc.c
 
-check_PROGRAMS = tests/suite0000-bitmap tests/suite0000-dump-arch tests/suite0001-parse
-TESTS = tests/suite0000-bitmap tests/suite0000-dump-arch tests/suite0001-parse
+check_PROGRAMS = \
+	tests/suite0000-bitmap \
+	tests/suite0000-dump-arch \
+	tests/suite0001-parse \
+	tests/suite0002-crc
+TESTS = \
+	tests/suite0000-bitmap \
+	tests/suite0000-dump-arch \
+	tests/suite0001-parse \
+	tests/suite0002-crc
 
 tests_suite0000_dump_arch_SOURCES = tests/suite0000-dump-arch.c
 
@@ -14,6 +22,9 @@ tests_suite0000_bitmap_LDADD = libexfat.a
 tests_suite0001_parse_SOURCES = tests/suite0001-parse.c
 tests_suite0001_parse_LDADD = libexfat.a
 
+tests_suite0002_crc_SOURCES = tests/suite0002-crc.c
+tests_suite0002_crc_LDADD = libexfat.a
+
 if ENABLE_TESTS
 noinst_PROGRAMS = $(check_PROGRAMS)
 endif
diff --git a/lib/tests/suite0002-crc.c b/lib/tests/suite0002-crc.c
new file mode 100644
index 0000000..4b88b73
--- /dev/null
+++ b/lib/tests/suite0002-crc.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * CRC function sanity checks and viability check for filename hashing
+ */
+/* Enable tdestroy() */
+#ifdef __linux__
+#define _GNU_SOURCE
+#else
+#define _BSD_SOURCE
+#endif
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <inttypes.h>
+#include <assert.h>
+#include <time.h>
+#include <search.h>
+
+#include "exfat_ondisk.h"
+#include "libexfat.h"
+
+static void test_crc32_sanity(void)
+{
+	/* This is just a sequence of randomly generated bytes. It bears no meaning. */
+	static const uint8_t test_data[] = {
+		0x67, 0x20, 0x8d, 0x66, 0xb0, 0x96, 0x7d, 0xa4,
+		0xf2, 0xc4, 0x44, 0x04, 0x3d, 0x0a, 0x15, 0xb9,
+		0xfa, 0xc0, 0x92, 0xc8, 0x03, 0x17, 0xcc, 0xcb,
+		0x37, 0x03, 0x7a, 0x50, 0x05, 0xda, 0xb4, 0xd3,
+		0x40, 0xb5, 0xb0, 0xeb, 0x3d, 0x15, 0x6c, 0x44,
+		0xac, 0x8a, 0x5c, 0x25, 0xd6, 0x14, 0x6c, 0xad,
+		0xcf, 0x1e, 0x4e, 0xe3, 0x38, 0x33, 0xb9, 0xec,
+		0xe6, 0x4f, 0x63, 0x76, 0x85, 0xcb, 0x26, 0xd7,
+		0x6a, 0x3a, 0xbc, 0x3a, 0x7c, 0x8b, 0x0f, 0x0d,
+		0x51, 0x8d, 0xea, 0xae, 0xe3, 0x2e, 0x53, 0xbb,
+		0xb1, 0x38, 0x23, 0xac, 0xf3, 0xf5, 0xb4, 0xd4,
+		0xd4, 0x63, 0x7b, 0x83, 0xc8, 0xd5, 0x1d, 0xe1,
+		0xe6, 0x41, 0x71, 0xb1, 0xef, 0x67, 0x9c, 0x3a,
+		0x6e, 0x42, 0xe3, 0x42, 0xec, 0xb7, 0x41, 0xd3,
+		0x36, 0x4c, 0x9a, 0x5a, 0x91, 0x82, 0x15, 0x98,
+		0x55, 0x56, 0xf6, 0xa4, 0x0c, 0xc2, 0x7e, 0xa9,
+		0x89, 0x52, 0xf3, 0x12, 0x44, 0x18, 0xb1, 0x3b,
+		0x53, 0xbf, 0xf9, 0x9f, 0x30, 0xff, 0x5d, 0x8b,
+		0x5c, 0xe4, 0x93, 0x5d, 0x2f, 0x10, 0x38, 0xa7,
+		0xd4, 0x9a, 0xa1, 0x51, 0x39, 0x3c, 0x53, 0xa8,
+		0x7e, 0x37, 0xd0, 0x70, 0x61, 0xc4, 0xc8, 0x21,
+		0x7c, 0x7f, 0x51, 0xe1, 0xff, 0x3a, 0xa9, 0x6b,
+		0x25, 0xe1, 0xbb, 0x65, 0x6f, 0x2b, 0x44, 0xc1,
+		0x38, 0x7c, 0x3f, 0x88, 0xf7, 0xa4, 0xb3, 0xcd,
+		0x3a, 0xe7, 0x4d, 0x00, 0xa1, 0x18, 0xd5, 0x84,
+		0xb4, 0x15, 0x79, 0xcc, 0x82, 0xa0, 0x5f, 0x44,
+		0xb2, 0xef, 0x27, 0xfb, 0x30, 0x18, 0x9e, 0x29,
+		0xe4, 0xb7, 0x17, 0x41, 0xd6, 0x20, 0x80, 0xba,
+		0xf1, 0x10, 0xf1, 0x75, 0xf5, 0xb6, 0x88, 0x57,
+		0x30, 0x2b, 0x45, 0xb1, 0x66, 0x21, 0x1e, 0x81,
+		0x8a, 0x0f, 0x58, 0x6b, 0xd2, 0x36, 0xa8, 0x5a,
+		0x72, 0x1e, 0xe9, 0x08, 0x27, 0xc6, 0x3a, 0x03,
+		0x73, 0xa9, 0x9a, 0x1c, 0xa1, 0xf9, 0x4e, 0xbb,
+		0x86, 0xa7, 0x3b, 0xd8, 0xcc, 0xcb, 0xd8, 0x4f,
+		0xcf, 0xa6, 0x0c, 0x7c, 0xa1, 0x33, 0x22, 0x36,
+		0x7b, 0x28, 0x5f, 0x5f, 0x18, 0x47, 0x93, 0xa6,
+		0x58, 0x70, 0x89, 0xe6, 0xe1, 0xc5, 0xa3, 0x2d,
+		0x0e, 0x3e, 0xea, 0x2c, 0x29, 0x87, 0x10, 0x48,
+		0x6d, 0xf3, 0x51, 0x2d, 0x4b, 0x6d, 0x98, 0x0d,
+		0xe2, 0x3e, 0xdc, 0x44, 0x76, 0xba, 0x32, 0xff,
+		0x6e, 0x13, 0x4a, 0xc6, 0xb0, 0xb4, 0x6a, 0xb1,
+		0xab, 0xd7, 0xa7, 0xef, 0xfc, 0xf7, 0x3e, 0x53,
+		0x9b, 0x6f, 0x8d, 0x77, 0x30, 0xde, 0x0a, 0x78,
+		0x2d, 0x26, 0xfa, 0x46, 0xdc, 0x25, 0x91, 0x75,
+		0x2f, 0x6e, 0x02, 0x8e, 0xb0, 0xe1, 0x99, 0x03,
+		0x5a, 0x1a, 0x56, 0x82, 0x3f, 0x1d, 0x4d, 0xe5,
+		0x82, 0x69, 0xa9, 0x34, 0xcc, 0x29, 0x8a, 0x24,
+		0x1f, 0x5d, 0x33, 0x0a, 0xed, 0x17, 0x15, 0x3f,
+		0xb0, 0x48, 0x18, 0x01, 0xab, 0x44, 0x93, 0xab,
+		0x8f, 0x81, 0x06, 0xe2, 0xce, 0xc5, 0xaf, 0x90,
+		0x38, 0x12, 0x12, 0x38, 0x4c, 0x7a, 0x4b, 0xbb,
+		0x84, 0xf3, 0x67, 0xba, 0x18, 0xdb, 0x76, 0x3e,
+		0x78, 0x76, 0xa3, 0x17, 0x58, 0xf9, 0xe4, 0x5f,
+		0x6e, 0xd2, 0x91, 0xde, 0xd3, 0xba, 0x96, 0x54,
+		0x42, 0x84, 0xa0, 0x03, 0x90, 0xa6, 0xda, 0x6d,
+		0x85, 0x26, 0xf5, 0x62, 0x2a, 0x0c, 0x2f, 0xab,
+		0xd6, 0xfc, 0x1b, 0xd8, 0x9f, 0x3b, 0xbc, 0x99,
+		0x8b, 0x3a, 0xd5, 0x5b, 0xf3, 0xf7, 0xa8, 0x53,
+		0x3e, 0xd3, 0x4f, 0xd6, 0x51, 0xf4, 0x43, 0x2a,
+		0x71, 0xd3, 0xe4, 0x1f, 0x83, 0x3d, 0x31, 0x61,
+		0xbe, 0xb5, 0x75, 0xc6, 0x67, 0x6d, 0x9c, 0x98,
+		0xe4, 0x49, 0x31, 0x93, 0x68, 0x64, 0xfa, 0x30,
+		0x3d, 0xb5, 0x19, 0xc4, 0xd3, 0xaf, 0xd7, 0x48,
+		0x0e, 0x9d, 0x75, 0x1b, 0xfa, 0x9c, 0xe9, 0x59,
+		0x42, 0xaa, 0x70,
+	};
+
+	assert(sizeof(test_data) == 515);
+	assert(exfat_calc_crc32(test_data, 512) == 0x471ADF83);
+	assert(exfat_calc_crc32(test_data, 513) == 0x3E260774);
+	assert(exfat_calc_crc32(test_data, 514) == 0xB3573659);
+	assert(exfat_calc_crc32(test_data, 515) == 0x900320D7);
+}
+
+static void to_utf16_filename(uint16_t *dst, const char *ascii, size_t len)
+{
+	while (len--)
+		*dst++ = (uint16_t)(*ascii++);
+}
+
+static void tree_freef(void *ptr)
+{
+	/* do nothing */
+	(void)ptr;
+}
+
+static int tree_compf(const void *a, const void *b)
+{
+	if ((uintptr_t)a == (uintptr_t)b)
+		return 0;
+	if ((uintptr_t)a < (uintptr_t)b)
+		return -1;
+	return 1;
+}
+
+static uintptr_t crc32_filename(const uint16_t *filename, size_t len)
+{
+	return exfat_calc_crc32(filename, (size_t)len * 2);
+}
+
+/*
+ * The exFAT standard hashing for establishing baseline
+ *
+ * This is not quite the same as no upcase table is used.
+ */
+static uintptr_t hash_exfat_filename(const uint16_t *filename, size_t len)
+{
+	uint16_t ch, chksum = 0;
+
+	while (len--) {
+		ch = *filename++;
+
+		/* use += to avoid promotion to int; UBSan complaints about signed overflow */
+		chksum = (chksum << 15) | (chksum >> 1);
+		chksum += ch & 0xFF;
+		chksum = (chksum << 15) | (chksum >> 1);
+		chksum += ch >> 8;
+	}
+
+	return chksum;
+}
+
+/*
+ * Simple LCG
+ *
+ * Please do not involve randomness in tests. The exact same filenames must be
+ * sampled across all platforms.
+ */
+
+static uint32_t our_rand_state;
+
+static uint32_t our_rand(void)
+{
+	return (our_rand_state = our_rand_state * 134775813 + 1);
+}
+
+static char filename[256];
+static unsigned int filename_cnt;
+
+static void reset_states(void)
+{
+	our_rand_state = 1;
+	filename_cnt = 0;
+}
+
+static int get_next_img_filename(void)
+{
+	int ret;
+
+	if (filename_cnt > 9999)
+		return -1;
+
+	ret = snprintf(filename, sizeof(filename), "IMG_%04u.jpg", filename_cnt++);
+	assert(0 < ret && ret <= 255);
+
+	return ret;
+}
+
+/*
+ * Nutcase scenario: simulate an Android phone with huge DCIM gallery
+ * of 64K files(max number of files in a directory in FAT32). Most
+ * implementations will probably struggle to populate a directory that big
+ * anyways.
+ */
+static int get_next_img_filename_android(void)
+{
+	int ret;
+	unsigned int year, month, day, hour, min, sec;
+
+	if (filename_cnt > 65535)
+		return -1;
+	filename_cnt++;
+
+	/* Year: 2020 ~ 2026 */
+	year = 2020 + (our_rand() % 7);
+	month = 1 + (our_rand() % 12);
+	day = 1 + (our_rand() % 31); /* don't care if there are 31 days in February :) */
+	hour = our_rand() % 24;
+	min = our_rand() % 60;
+	sec = our_rand() % 60;
+
+	ret = snprintf(filename, sizeof(filename), "IMG_%04u%02u%02u_%02u%02u%02u.jpg",
+			year, month, day, hour, min, sec);
+	assert(0 < ret && ret <= 255);
+
+	return ret;
+}
+
+static void benchmark_filename_hashing(const char *testname,
+		int (*get_next_filename)(void),
+		uintptr_t (*hash_filename)(const uint16_t *filename, size_t len))
+{
+	void *tree = NULL;
+	unsigned int i = 0, collisions = 0;
+	__le16 utf16_filename[255];
+	int len;
+	uintptr_t hash;
+	void *inserted;
+	bool col;
+	struct timespec ts[3];
+
+	reset_states();
+
+	printf("=== %s ===\n", testname);
+
+	clock_gettime(CLOCK_MONOTONIC, ts + 0);
+
+	while ((len = get_next_filename()) > 0) {
+		i++;
+		to_utf16_filename(utf16_filename, filename, (size_t)len);
+
+		hash = hash_filename(utf16_filename, len);
+
+		col = tfind((void *)hash, &tree, tree_compf) != NULL;
+		if (col)
+			collisions++;
+		else {
+			inserted = tsearch((void *)hash, &tree, tree_compf);
+			assert(inserted != NULL);
+		}
+
+		exfat_trace(0, "%s: 0x%08" PRIxMAX "%c\n",
+				filename, (uintmax_t)hash, col ? '*' : ' ');
+	}
+	tdestroy(tree, tree_freef);
+
+	clock_gettime(CLOCK_MONOTONIC, ts + 1);
+	ts[2].tv_sec = ts[1].tv_sec - ts[0].tv_sec;
+	ts[2].tv_nsec = ts[1].tv_nsec - ts[0].tv_nsec;
+	if (ts[2].tv_nsec < 0) {
+		ts[2].tv_sec--;
+		ts[2].tv_nsec += 1000000000L;
+	}
+
+	printf("collisions:	%u out of %u (%u%%)\n", collisions, i, collisions * 100 / i);
+	printf("elapsed:	%lu.%09lus\n",
+			(unsigned long)ts[2].tv_sec, (unsigned long)ts[2].tv_nsec);
+}
+
+int main(void)
+{
+	/* Enable debug trace via env var */
+	const char *vl_str = getenv("EXFAT_DEBUG");
+
+	if (vl_str != NULL) {
+		long vl;
+
+		if (exfat_parse_long(vl_str, &vl) == 0 && vl >= 0)
+			print_level = vl;
+	}
+
+	/* Basic CRC32 test */
+	test_crc32_sanity();
+
+	/* Benchmark hashing image files names commonly found in digital cameras */
+	benchmark_filename_hashing("IMG_XXXX.jpg, exFAT",
+				   get_next_img_filename, hash_exfat_filename);
+	benchmark_filename_hashing("IMG_XXXX.jpg, CRC32",
+				   get_next_img_filename, crc32_filename);
+
+	/*
+	 * Benchmark hashing image files names in Android phones
+	 *
+	 * As the LCG used for testing is not perfect, there will be 1212 dupes.
+	 * This is left as-is intentionally. The effective collision rate is
+	 * zero(no collision in 64323 unique samples).
+	 */
+	benchmark_filename_hashing("IMG_YYYYMMDD_hhmmss.jpg, exFAT",
+				   get_next_img_filename_android, hash_exfat_filename);
+	benchmark_filename_hashing("IMG_YYYYMMDD_hhmmss.jpg, CRC32",
+				   get_next_img_filename_android, crc32_filename);
+
+	return 0;
+}
-- 
2.56.0

