Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B404376A0C
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 06:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787292494; cv=none; b=kLV8ZbJaCJ/7Yy+w8D8H7TlkfRzVAitla5uLQODpPRe2jQitajc0uWDHo8ox9xV1XeZZskxaH2xv2tHb4Y7ha1dENcIlECRkzWbNh44+M1MXj/6sZus6dWEgs64ubmVB1yFSAPe7TOIWoQ7/FGXOcIl2bVQj6LeEIWurjefZPD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787292494; c=relaxed/simple;
	bh=bbC4f2VUGbYb825YI28KGn2/H/NXh2T+RFuomrfjm74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyxMcIK57T2TxCpnVeHWPhUic4RbAvfU5ZFTO38UqJXrBZAloFkNkn81iNXwVdOM6wSqmlSKhSnLwhm6Vn/Bq1U3XYbUkOsORhCJ3Cs1JXwr9ltC8Qny6L/txW8KPMBooSl2nIwwGXm5lU77C1p7CsEFn/FQmDQawg7kaeIXGV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=Ed86w+aX; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="Ed86w+aX"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id D0DA91D45F;
	Fri, 21 Aug 2026 06:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me D0DA91D45F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787292485; bh=bbC4f2VUGbYb825YI28KGn2/H/NXh2T+RFuomrfjm74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ed86w+aXHgKbZbyuzPfenZU/GoKYnB7A0mr0yFMcfkgs7L2oShrGymx2Gr3RMjoCM
	 lotXo+F3GZspvFS6Dou7PMcwQrLleuJO8KD6rYCcNrYRyewvUlphaO2FJ0YW0d31B4
	 JB/IawlzYNPndJE6orcPknGxyw0hXga2FFSjPVMk=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id xh2MOkHrh2puSgAA8KYfjw:T3
	(envelope-from <dxdt@dev.snart.me>); Fri, 21 Aug 2026 06:08:04 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>,
	Sam James <sam@gentoo.org>
Subject: [PATCH v2 2/2] treewide: run internal library tests in "make check"
Date: Fri, 21 Aug 2026 15:07:41 +0900
Message-ID: <20260821060741.92772-3-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821060741.92772-1-dxdt@dev.snart.me>
References: <20260821060741.92772-1-dxdt@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The library tests were intended to be used internally for dev purposes,
but users have suggested that they should be run when "make check" is
run.

Hook up the test programs to the TESTS target. "./configure
--enable-tests" now only hooks up the test programs to the
noinst_PROGRAMS target. "./configure --enable-tests" is not required to
run the test programs using "make check".

Fix stray "enable_tests=yes" output in ./configure script due to a
missing comma.

Run make check in the "Test building exfatprogs on arbitrary directory"
step in the Github Actions CI pipelines.

Please do not close #391 as the fsck test cases should be run as well.
This is not an easy fix and further work is being done to achieve this.

Link: https://github.com/exfatprogs/exfatprogs/issues/391
Suggested-by: Sam James <sam@gentoo.org>
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 .github/workflows/c-cpp.yml | 2 +-
 configure.ac                | 2 +-
 lib/Makefile.am             | 7 ++++---
 lib/tests/run-all.sh        | 3 +++
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-cpp.yml
index d332f04..a95f420 100644
--- a/.github/workflows/c-cpp.yml
+++ b/.github/workflows/c-cpp.yml
@@ -220,7 +220,7 @@ jobs:
         BUILD_DIR="$(pwd)"
         "${CONFIG_SCRIPT}"
         make -j$((`nproc`+1))
-        sudo make install
+        sudo make check install
         popd
 
         rm -rf "$BUILD_DIR"
diff --git a/configure.ac b/configure.ac
index ab6fb5d..99bad24 100644
--- a/configure.ac
+++ b/configure.ac
@@ -52,7 +52,7 @@ PKG_CHECK_MODULES([BLKID], [blkid >= 2.20], [AC_DEFINE([HAVE_BLKID], [1], [Defin
 	[PKG_CHECK_MODULES([EXT2_BLKID], [blkid], [AC_DEFINE([HAVE_EXT2_BLKID], [1], [Define if libblkid is from libext2])])])
 
 AC_ARG_ENABLE([tests],
-	AS_HELP_STRING([--enable-tests], [build internal test programs])
+	AS_HELP_STRING([--enable-tests], [always build internal test programs (not just for "make check")]),
 	[enable_tests=yes]
 )
 AM_CONDITIONAL([ENABLE_TESTS], [test "x$enable_tests" = xyes])
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 90c09c1..4e9a183 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -3,9 +3,8 @@ noinst_LIBRARIES = libexfat.a
 
 libexfat_a_SOURCES = libexfat.c exfat_fs.c exfat_dir.c utils.c
 
-if ENABLE_TESTS
-
-noinst_PROGRAMS = tests/suite0000-bitmap tests/suite0001-parse
+check_PROGRAMS = tests/suite0000-bitmap tests/suite0001-parse
+TESTS = tests/suite0000-bitmap tests/suite0001-parse
 
 tests_suite0000_bitmap_SOURCES = tests/suite0000-bitmap.c
 tests_suite0000_bitmap_LDADD = libexfat.a
@@ -13,4 +12,6 @@ tests_suite0000_bitmap_LDADD = libexfat.a
 tests_suite0001_parse_SOURCES = tests/suite0001-parse.c
 tests_suite0001_parse_LDADD = libexfat.a
 
+if ENABLE_TESTS
+noinst_PROGRAMS = $(check_PROGRAMS)
 endif
diff --git a/lib/tests/run-all.sh b/lib/tests/run-all.sh
index 86e08da..332199a 100755
--- a/lib/tests/run-all.sh
+++ b/lib/tests/run-all.sh
@@ -1,4 +1,7 @@
 #!/bin/sh
+# Note: this is only a convenience script for running test suites with Valgrind.
+# This is used in the CI pipelines(Github Actions). For normal cases, the tests
+# may be run with `make check` as well.
 
 main()
 {
-- 
2.55.0

