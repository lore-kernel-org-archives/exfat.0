Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E658B38553F
	for <exfat@lists.linux.dev>; Thu, 20 Aug 2026 04:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787200628; cv=none; b=PPGdVmfk4dItTltyBTtKEN5cnWfbv9k0k25iFpJ6xPEu9IhIi2KGM/U9lT3EAqKmyoXwXzvELypCa+RQeV59YsZkd2QLhI6j3Lx5N1utYqaKafWFLk2iglDyKJjIZclnqkNRUHfyGuu66pJpv0k3oAx9eYE3HewYL4wG667Fd4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787200628; c=relaxed/simple;
	bh=5rVdSxyqbmS2gwRTU5TLaS9XAytFQz3w3mFuy//ky8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgO7DRB/+FuA/1zvwcQ9shZeCConZpy7fzC6R7J7+yg+MI4U00t+6KHJf69vOnO8Vwx+NjoYgwVrDObpiGkpPZedH8XuaRjuHKw3SrfRbHVkXJyk1tWetzcyQl48uC5Z419owNfSPBBbwIytECjWoqjlYYIJ/OtdhdR0Y+UMyNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=rk/Km/rf; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="rk/Km/rf"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id CE41E667A3;
	Thu, 20 Aug 2026 04:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me CE41E667A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787200121; bh=5rVdSxyqbmS2gwRTU5TLaS9XAytFQz3w3mFuy//ky8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rk/Km/rfuMtVYD7lvsi+uX5JKxK1rQTowtyeHlqoThujW6LBvN5Cg3Sg3AlX4D89c
	 AAI60CKu0dTgfW7ofP21OB4+8HUndtfcwJ4nny+uJSKCLvXOWN/jzCyIb08XYJIBpk
	 0kKhuYF3XwV1D2QLYbjmV76oCWmgPLhEwOmYHLlk=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id 8EY5BXeChmphtggA8KYfjw:T2
	(envelope-from <dxdt@dev.snart.me>); Thu, 20 Aug 2026 04:28:40 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sam James <sam@gentoo.org>,
	Hyunchul Lee <hyc.lee@gmail.com>,
	exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 1/2] libexfat: remove use of sscanf()
Date: Thu, 20 Aug 2026 13:28:26 +0900
Message-ID: <20260820042827.169131-2-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820042827.169131-1-dxdt@dev.snart.me>
References: <20260820042827.169131-1-dxdt@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Due to a bug inherent in the C programming language itself, the *scanf()
functions are unsafe because they exhibit undefined behaviour in error
cases. The recent patches introduced functions that use sscanf(),
leading to some input sanitisation issues.

Remove the use of sscanf() by replacing it with strto*() functions. Add
additional exfat_parse_*() functions using macros. exfat_parse_*()
functions including exfat_parse_ulong() do not modify errno on success.

Add tests to refactor exfat_cmp_kernel_ver().

The environment variables that take boolean values are now properly
validated before use. The boolean environment variables now accept
non-decimal(%d) integer values.

Link: https://github.com/exfatprogs/exfatprogs/pull/380#discussion_r3671267926
Suggested-by: Hyunchul Lee <hyc.lee@gmail.com>
Fixes: 5ab91a8d949b ("Do not run on pre-2.6 Linux kernel")
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 include/libexfat.h          |  41 ++++++++++++-
 lib/Makefile.am             |   5 +-
 lib/libexfat.c              | 117 ++++++++++++++++++++++++------------
 lib/tests/suite0001-parse.c | 101 +++++++++++++++++++++++++++++++
 4 files changed, 222 insertions(+), 42 deletions(-)
 create mode 100644 lib/tests/suite0001-parse.c

diff --git a/include/libexfat.h b/include/libexfat.h
index b343621..effa13b 100644
--- a/include/libexfat.h
+++ b/include/libexfat.h
@@ -317,7 +317,46 @@ int exfat_o2c(struct exfat *exfat, off_t device_offset,
 bool exfat_heap_clus(struct exfat *exfat, clus_t clus);
 int exfat_root_clus_count(struct exfat *exfat);
 int read_boot_sect(struct exfat_blk_dev *bdev, struct pbr **bs);
-int exfat_parse_ulong(const char *s, unsigned long *out);
+
+#define DECLARE_PARSE_NUM(OUT_T, NAME) int NAME(const char *s, OUT_T *out)
+DECLARE_PARSE_NUM(unsigned long, exfat_parse_ulong);
+DECLARE_PARSE_NUM(unsigned long long, exfat_parse_ulonglong);
+DECLARE_PARSE_NUM(long, exfat_parse_long);
+DECLARE_PARSE_NUM(long long, exfat_parse_longlong);
+#undef DECLARE_PARSE_NUM
+
+/*
+ * Parse a software version string
+ *
+ * Process a string until it encounters an invalid character. If at least one
+ * valid version number is parsed, output with the numbers parsed. Otherwise,
+ * return -1 and errno is set to EINVAL.
+ *
+ * Note that the function was originally implemented to parse Linux kernel
+ * version strings, which can be followed by an arbitrary user-supplied string
+ * (aka. CONFIG_LOCALVERSION). Therefore, the function stops processing when it
+ * encounters the trailing garbage(local version) in the string.
+ *
+ * For example, following strings are all valid:
+ *
+ *   "6.1.157-android14-11-gbd23337e42e7-ab14791245":	6.1.157
+ *   "6.6.77-8.el10.altarch.aarch64+64k":		6.6.77
+ *   "7.0.8-200.fc44.x86_64":				7.0.8
+ *   "6.17.0-1019-aws":					6.17.0
+ *
+ * And including(although confusingly):
+ *
+ *   "2foo.6":		2.0.0
+ *   "2.6foo.3":	2.6.0
+ *   "2.":		2.0.0
+ *   "2.6.":		2.6.0
+ *
+ * The Linux kernel versions are always in 3 numbers. However, the function also
+ * accepts version strings with 1 and 2 numbers for future use and correctness.
+ */
+int exfat_parse_swver(const char *in, unsigned short *out);
+int exfat_cmp_swver(const unsigned short *a, const unsigned short *b);
+
 int exfat_check_name(__le16 *utf16_name, int len);
 /*
  * Read back from the target device to confirm the successful write.
diff --git a/lib/Makefile.am b/lib/Makefile.am
index cdef6ef..90c09c1 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -5,9 +5,12 @@ libexfat_a_SOURCES = libexfat.c exfat_fs.c exfat_dir.c utils.c
 
 if ENABLE_TESTS
 
-noinst_PROGRAMS = tests/suite0000-bitmap
+noinst_PROGRAMS = tests/suite0000-bitmap tests/suite0001-parse
 
 tests_suite0000_bitmap_SOURCES = tests/suite0000-bitmap.c
 tests_suite0000_bitmap_LDADD = libexfat.a
 
+tests_suite0001_parse_SOURCES = tests/suite0001-parse.c
+tests_suite0001_parse_LDADD = libexfat.a
+
 endif
diff --git a/lib/libexfat.c b/lib/libexfat.c
index ff0b25b..9cbb17f 100644
--- a/lib/libexfat.c
+++ b/lib/libexfat.c
@@ -167,9 +167,9 @@ static int get_intbool_envvar(const char *name)
 	const char *env = getenv(name);
 
 	if (env != NULL) {
-		int v = -1;
+		long v = -1;
 
-		if (sscanf(env, "%d", &v) == 1)
+		if (exfat_parse_long(env, &v) == 0)
 			return v != 0;
 	}
 
@@ -466,39 +466,16 @@ static bool exfat_dir_has_child(const int at, const char *path)
 static int exfat_cmp_kernel_ver(const unsigned short *req)
 {
 	struct utsname uts;
-	unsigned short v[3] = { 0, };
-	unsigned long long nreq = 0, nhost = 0;
+	unsigned short parsed[3];
 	int ret;
 
-	ret = uname(&uts);
-	if (ret)
-		return -1;
-
-	switch (count_dots(uts.release, 65)) {
-	case 0:
-		ret = sscanf(uts.release, "%hu", v) != 1;
-		break;
-	case 1:
-		ret = sscanf(uts.release, "%hu.%hu", v + 0, v + 1) != 2;
-		break;
-	default:
-		ret = sscanf(uts.release, "%hu.%hu.%hu", v + 0, v + 1, v + 2) != 3;
-	}
-	if (ret) {
-		errno = EINVAL;
+	if (uname(&uts) || exfat_parse_swver(uts.release, parsed))
 		return -1;
-	}
-
-	exfat_debug("Kernel version: %hu.%hu.%hu\n", v[0], v[1], v[2]);
 
-	nreq  |= (unsigned long long)req[0] << 32;
-	nreq  |= (unsigned long long)req[1] << 16;
-	nreq  |= (unsigned long long)req[2];
-	nhost |= (unsigned long long)v[0]   << 32;
-	nhost |= (unsigned long long)v[1]   << 16;
-	nhost |= (unsigned long long)v[2];
+	exfat_debug("Kernel version: %u.%u.%u\n", parsed[0], parsed[1], parsed[2]);
 
-	return nreq > nhost ? 1 : 0;
+	ret = exfat_cmp_swver(req, parsed);
+	return ret > 0 ? 1 : 0;
 }
 
 int exfat_get_blk_dev_info(struct exfat_user_input *ui,
@@ -1959,20 +1936,80 @@ err:
 	return err;
 }
 
-int exfat_parse_ulong(const char *s, unsigned long *out)
-{
-	char *endptr;
-
-	errno = 0;
+/* Abstraction for exfat_parse_*() */
+#define DEFINE_PARSE_NUM(OUT_T, NAME, STRTO_F)		\
+	int NAME(const char *s, OUT_T *out)		\
+	{						\
+		const int saved_errno = errno;		\
+		int ret = 0;				\
+		char *endptr = NULL;			\
+							\
+		errno = 0;				\
+		*out = STRTO_F(s, &endptr, 0);		\
+		if (errno)				\
+			ret = -errno;			\
+		if (s == endptr || *endptr != '\0')	\
+			ret = -EINVAL;			\
+							\
+		errno = saved_errno;			\
+		return ret;				\
+	}
+
+DEFINE_PARSE_NUM(unsigned long, exfat_parse_ulong, strtoul)
+DEFINE_PARSE_NUM(unsigned long long, exfat_parse_ulonglong, strtoull)
+DEFINE_PARSE_NUM(long, exfat_parse_long, strtol)
+DEFINE_PARSE_NUM(long long, exfat_parse_longlong, strtoll)
+
+#undef DEFINE_PARSE_NUM
+
+int exfat_parse_swver(const char *in, unsigned short *out)
+{
+	const int saved_errno = errno;
+	char *endptr = NULL;
+	unsigned long v;
+	unsigned short ret[3] = {0};
+
+	if (*in == 0)
+		goto inval;
+
+	for (size_t i = 0; i < 3 && *in != 0; i++) {
+		errno = 0;
+		v = strtoul(in, &endptr, 10);
+		if (errno != 0 || in == endptr || v > UINT16_MAX)
+			goto inval;
+		ret[i] = (unsigned short)v;
+
+		if (*endptr == '.')
+			in = endptr + 1;
+		else
+			break;
+	}
 
-	*out = strtoul(s, &endptr, 0);
+	out[0] = ret[0];
+	out[1] = ret[1];
+	out[2] = ret[2];
+	errno = saved_errno;
+	return 0;
+inval:
+	errno = EINVAL;
+	return -1;
+}
 
-	if (errno)
-		return -errno;
+int exfat_cmp_swver(const unsigned short *in_a, const unsigned short *in_b)
+{
+	uint64_t a = 0, b = 0;
 
-	if (s == endptr || *endptr != '\0')
-		return -EINVAL;
+	a |= (uint64_t)in_a[0] << 32;
+	a |= (uint64_t)in_a[1] << 16;
+	a |= (uint64_t)in_a[2];
+	b |= (uint64_t)in_b[0] << 32;
+	b |= (uint64_t)in_b[1] << 16;
+	b |= (uint64_t)in_b[2];
 
+	if (a < b)
+		return -1;
+	else if (a > b)
+		return 1;
 	return 0;
 }
 
diff --git a/lib/tests/suite0001-parse.c b/lib/tests/suite0001-parse.c
new file mode 100644
index 0000000..26cb906
--- /dev/null
+++ b/lib/tests/suite0001-parse.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include "exfat_ondisk.h"
+#include "libexfat.h"
+
+#include <assert.h>
+
+#define SET_SWVER(o, a, b, c)		\
+	do {				\
+		(o)[0] = (a);		\
+		(o)[1] = (b);		\
+		(o)[2] = (c);		\
+	} while (0)
+
+static void test_swver_cmp(void)
+{
+	unsigned short first[3], second[3];
+#define CMP_VER(a, b, c, CMP, d, e, f)\
+	do {								\
+		SET_SWVER(first, (a), (b), (c));			\
+		SET_SWVER(second, (d), (e), (f));			\
+		assert(exfat_cmp_swver(first, second) CMP 0);		\
+	} while (0)
+
+	CMP_VER(0, 0, 0, ==, 0, 0, 0);
+	CMP_VER(2, 6, 0, ==, 2, 6, 0);
+	CMP_VER(1, 2, 3, ==, 1, 2, 3);
+
+	CMP_VER(2, 6, 0, >, 2, 0, 0);
+	CMP_VER(2, 6, 0, >, 2, 4, 0);
+	CMP_VER(2, 6, 0, >, 2, 4, 999);
+
+	CMP_VER(0, 0, 1, <, 65535, 65535, 65535);
+	CMP_VER(2, 6, 0, <, 2, 6, 1);
+	CMP_VER(2, 6, 0, <, 3, 0, 0);
+	CMP_VER(2, 6, 0, <, 7, 0, 0);
+	CMP_VER(2, 6, 0, <, 7, 2, 0);
+	CMP_VER(2, 6, 0, <, 7, 1, 8);
+	CMP_VER(2, 6, 0, <, 6, 18, 44);
+	CMP_VER(2, 6, 0, <, 6, 12, 103);
+	CMP_VER(2, 6, 0, <, 6, 6, 151);
+	CMP_VER(2, 6, 0, <, 6, 1, 182);
+	CMP_VER(2, 6, 0, <, 5, 15, 215);
+	CMP_VER(2, 6, 0, <, 5, 10, 0);
+}
+
+static void test_swver_parse(void)
+{
+	unsigned short ver[3];
+	int ret;
+#define EXPECT_VER(s, a, b, c)\
+	do {									\
+		ret = exfat_parse_swver((s), ver);				\
+		assert(ret == 0);						\
+		assert((a) == ver[0] && (b) == ver[1] && (c) == ver[2]);	\
+	} while (0)
+
+	assert(exfat_parse_swver("", ver));
+	assert(exfat_parse_swver("asd", ver));
+	assert(exfat_parse_swver("asd-1.2.3", ver));
+	assert(exfat_parse_swver("0.0.0", ver) == 0);
+	assert(exfat_parse_swver("7.1.8-200.fc44.x86_64", ver) == 0);
+	assert(exfat_parse_swver("2.6.0", ver) == 0);
+	assert(exfat_parse_swver("2.6.0aaaa", ver) == 0);
+
+	EXPECT_VER("6.1.157-android14-11-gbd23337e42e7-ab14791245", 6, 1, 157);
+	EXPECT_VER("5.4.242-32179049-abG990EXXSNHZF5", 5, 4, 242);
+	EXPECT_VER("6.6.77-8.el10.altarch.aarch64+64k", 6, 6, 77);
+	EXPECT_VER("7.1.8-200.fc44.x86_64", 7, 1, 8);
+	EXPECT_VER("7.0.8-200.fc44.x86_64", 7, 0, 8);
+	EXPECT_VER("6.17.0-1019-aws", 6, 17, 0);
+	EXPECT_VER("6.18.39-0-virt", 6, 18, 39);
+	EXPECT_VER("0.18.39-0-virt", 0, 18, 39);
+	EXPECT_VER("6.0.39-0-virt", 6, 0, 39);
+	EXPECT_VER("2foo.6", 2, 0, 0);
+	EXPECT_VER("2.6foo.3", 2, 6, 0);
+	EXPECT_VER("2.", 2, 0, 0);
+	EXPECT_VER("2.6.", 2, 6, 0);
+	EXPECT_VER("0", 0, 0, 0);
+	EXPECT_VER("42", 42, 0, 0);
+
+	/*
+	 * Note that the following case doesn't happen on Linux because the
+	 * Linux kernel always returns a version in three numbers:
+	 *
+	 *   "7.0.0" not "7" (although the tarball would be named "7.0")
+	 *   "7.1.0" not "7.1" (although the tarball would be named "7.1")
+	 *
+	 * The following test is only for correctness in implementation so that
+	 * there's no confusion in the future with values from other software.
+	 */
+	EXPECT_VER("6.77-8.el10.altarch.aarch64+64k", 6, 77, 0);
+#undef EXPECT_VER
+}
+
+int main(void)
+{
+	test_swver_cmp();
+	test_swver_parse();
+
+	return 0;
+}
-- 
2.55.0

