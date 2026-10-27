Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088417;
	b=f2DF/XgPN26HfPJmS25f9hv+s/3G0tCsjtwXC8iLfcMJMcSAdxZmmLEbknexCPfHYpfi
	 TV1So2LltBhdut49o9qxYF68HL1j/HtmZkKOE9IfILldfkfOFHMwp1E5TUk4nuHwdOH2J
	 n5wGL7YQTJeD8iY8OTExu9E5Bj009rFD3mzQoI2nav73dvDVtqyJJ6tZ69Eo9T4mswBbh
	 ITeccU/LEpHfEcK322HgSK863NOoefStZ1l+orWoNSqgkbCsrbG59G+KVtx0F8ajVoZ6M
	 S8wqwsReoBR01Prb3QFafc7GTieO1GrjvObwtCHFn5MArW5ocg6ePUZGuB9Ee8zxBOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088417;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2genvBb+VE97dCUafXd1HmiNadZz7xFkkCm0mbZYDVM=;
	b=DzaYCvUhiAMAU/CQ5Ij4IGMKYHQN7llup2o/ceiEokqpyqhxhbY1pvN0MuZYb03sVGTN
	 PmsqZe1JJcP9i8FKsd1gT+GD6f/xPaZEFLutXu8rsNXqwz6HOTHW16eZGw1U3NuI4JFFP
	 G4VOx8zXcUBGHnlrT7GRx8QBTk3huCeHznk/4hqhZzJasQJZBQ+XpdSeibMOOfg4NJoEb
	 cE9EDyKL8Vec48QPuA2JQh4AH9Umljyq7WKC3sYgKr3PBBuz+o2F+L8NJSGf93nsnw8lM
	 WKywNbGtA83Q5VGtZPUB0bzi38rVgV1ntA5Ghz3uW4cdl2g6iudSGmDn15fkPGiEmsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=a5KNUCr8;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967B8606A326
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 08:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=a5KNUCr8
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 225C71D47C;
	Tue, 27 Oct 2026 08:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 225C71D47C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793088415; bh=crqdj5hcbB/wKd7Njw7op5pGsjaKpcwTftNfj2+0SUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a5KNUCr8BiyAGrrWjh0407bWFHJb4t8ftqX17LXgUIKeoJPEPyzbkZoSbW+2g4Lr9
	 JvLXwBfo+NhAlkCLp7td4Dt2NPA3HL/lya2j8muPeBGFb08yZNsBBveXH+RBETQChu
	 2VqH9BEFTfYgeLrx7jAxYUlTcDBLS9ixx7T3a0ow=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id LI3iAZZb4Gr2bwEA8KYfjw:T6
	(envelope-from <dxdt@dev.snart.me>); Tue, 27 Oct 2026 08:06:53 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>,
	"sofine . ljm" <sofine.ljm@gmail.com>,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 6/7] tests: add suite0000-dump-arch for CPU arch info
Date: Tue, 27 Oct 2026 08:06:23 +0000
Message-ID: <20261027080628.82069-6-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027080628.82069-1-dxdt@dev.snart.me>
References: <20261027080628.82069-1-dxdt@dev.snart.me>
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

Add a dummy test suite for recording information on the CPU arch being
tested on the CI pipeline. This is for porting the project to new
hardware platforms.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 lib/Makefile.am                 |  7 ++++--
 lib/tests/suite0000-dump-arch.c | 41 +++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 lib/tests/suite0000-dump-arch.c

diff --git a/lib/Makefile.am b/lib/Makefile.am
index 4e9a183..484f0b2 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -3,8 +3,11 @@ noinst_LIBRARIES = libexfat.a
 
 libexfat_a_SOURCES = libexfat.c exfat_fs.c exfat_dir.c utils.c
 
-check_PROGRAMS = tests/suite0000-bitmap tests/suite0001-parse
-TESTS = tests/suite0000-bitmap tests/suite0001-parse
+check_PROGRAMS = tests/suite0000-bitmap tests/suite0000-dump-arch tests/suite0001-parse
+TESTS = tests/suite0000-bitmap tests/suite0000-dump-arch tests/suite0001-parse
+
+tests_suite0000_dump_arch_SOURCES = tests/suite0000-dump-arch.c
+tests_suite0000_dump_arch_LDADD = libexfat.a
 
 tests_suite0000_bitmap_SOURCES = tests/suite0000-bitmap.c
 tests_suite0000_bitmap_LDADD = libexfat.a
diff --git a/lib/tests/suite0000-dump-arch.c b/lib/tests/suite0000-dump-arch.c
new file mode 100644
index 0000000..a658013
--- /dev/null
+++ b/lib/tests/suite0000-dump-arch.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Prints attributes like integer widths and endianness to record the arch being
+ * tested. The actual CPU arch being tested is not identified and the code is
+ * arch agnostic for future proofing.
+ *
+ * The program always returns zero.
+ */
+#include <stdio.h>
+#include <inttypes.h>
+#include <limits.h>
+#include <config.h>
+
+#ifdef WORDS_BIGENDIAN
+#define IS_BIGENDIAN	(1)
+#else
+#define IS_BIGENDIAN	(0)
+#endif
+
+int main(void)
+{
+	printf(	"\n"
+		"CHAR_BIT:  %d\n"
+		"BIGENDIAN: %d\n"
+		"uintptr_t: %zu\n"
+		"size_t:    %zu\n"
+		"short:     %zu\n"
+		"int:       %zu\n"
+		"long:      %zu\n" /* for detecting LLP64 model(MSVC) */
+		"long long: %zu\n",
+		CHAR_BIT,
+		IS_BIGENDIAN,
+		sizeof(uintptr_t),
+		sizeof(size_t),
+		sizeof(short),
+		sizeof(int),
+		sizeof(long),
+		sizeof(long long));
+
+	return 0;
+}
-- 
2.56.0

