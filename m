Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498747;
	b=FFJzV9jckNV9KgpWmoqqMk7P2l5jgHLX+PtRTNZM4zBPd8WaBZutrsVbtRTEFpa+Bilh
	 rGfRlb20na1n9UYU+q+uP+sU3dxg8NspVMbuQWwBk9lO5n6DwtyadQd7cJWWVt3wDIK90
	 PCy5zTr26MhCt7ACRVv5m7berg0U/eydof1UfJUxeXYAAE2fkRRLwp7Gs3HZU1LajwMOr
	 q2rxtQEQyP7lnxTzuEFRrbf8RSIJ0E689IBXYsoIIkxo5xSFHjLHX5PzcOmeHEd4EyeJI
	 whpsVFTtgdjhKokGhfV45e/2ZGFWTrPj1MdJu+HlNHA1u3T+z3fOAcQnTFIukvY+RoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498747;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aKpGTdkiMMHoFzTr6sjbxgfqtIPyW92Wk8/nD1u57RE=;
	b=T7jmW5ACxecB3k7eaYuy2WV/y21GDpa6xqcozZUO8VxAPTolzdLNKObJan/z3pqQSNgy
	 H7ygfVUsHdVhXuv/aIhowdXvggNQBAcf0U9Idf4XZtxvKPJ+sDStCGiZvG9BZ/6Tja3L9
	 Yi1WQJK4mLv7givaRFVVupe92Am9/32jI+ZxTnGNJ/FHj/MQtyFXTbtF2M9syAts6C/13
	 0g1RiKacJB57fkC7NaDjjXtPjImL7v0hV4esxGzsyGa2xg43fzp6tbbVfPg80yaxAo5L0
	 RGXEcNyOhAMsWlc5hj6KQgO/NISD0nNA03WTEwBrgZzj1COmo5i2SlKyBRrAhRo9t/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b="R/6qA/Tt";
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E1C606A32A
	for <exfat@lists.linux.dev>; Thu, 12 Nov 2026 15:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04E1C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=R/6qA/Tt
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 3E9CF1D47A;
	Thu, 12 Nov 2026 15:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 3E9CF1D47A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794498739; bh=Vcvvl//xkxLtvN1ZObhmwOTUFIhq2f9cp8UBoj3g8Yo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R/6qA/Tt88i5QK4XmH6Rt6Zr7FMgPR5UAvOW288GJPAb/5ySQJPO7g/h0x4UdaL3D
	 Q2N1ESEQNiyuHhW7CnyRE7bYGocBxDYvwYNrM04WTCqjvmJx5hYYyQXtk/qJy5aHbw
	 YqukyIgPOR9Q8nRumDxyftP3gPhu4QdTGQemyIi4=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id RkGDLa/g9WoQFwIA8KYfjw:T2
	(envelope-from <dxdt@dev.snart.me>); Thu, 12 Nov 2026 15:52:18 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v0 2/6] lib: add unaligned memory access test
Date: Thu, 12 Nov 2026 15:51:41 +0000
Message-ID: <20261112155145.177216-2-dxdt@dev.snart.me>
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

To ensure that exfatprogs is supported on CPUs without unaligned memory
access support, add the unaligned memory access "spike" test in
suite0000-dump-arch.c to log the result in CI. On MIPS and SPARC, it
should say:

  Unaligned access: CRASH(3)

Also, remove unnecessary linking of libexfat.a.

Cc: Yang Wen <anmuxixixi@gmail.com>
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 lib/Makefile.am                 |  1 -
 lib/tests/suite0000-dump-arch.c | 80 ++++++++++++++++++++++++++++++++-
 2 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/lib/Makefile.am b/lib/Makefile.am
index 484f0b2..7810e9f 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -7,7 +7,6 @@ check_PROGRAMS = tests/suite0000-bitmap tests/suite0000-dump-arch tests/suite000
 TESTS = tests/suite0000-bitmap tests/suite0000-dump-arch tests/suite0001-parse
 
 tests_suite0000_dump_arch_SOURCES = tests/suite0000-dump-arch.c
-tests_suite0000_dump_arch_LDADD = libexfat.a
 
 tests_suite0000_bitmap_SOURCES = tests/suite0000-bitmap.c
 tests_suite0000_bitmap_LDADD = libexfat.a
diff --git a/lib/tests/suite0000-dump-arch.c b/lib/tests/suite0000-dump-arch.c
index a658013..90a484f 100644
--- a/lib/tests/suite0000-dump-arch.c
+++ b/lib/tests/suite0000-dump-arch.c
@@ -4,11 +4,16 @@
  * tested. The actual CPU arch being tested is not identified and the code is
  * arch agnostic for future proofing.
  *
- * The program always returns zero.
+ * The program should always return zero.
  */
 #include <stdio.h>
+#include <stdlib.h>
 #include <inttypes.h>
 #include <limits.h>
+#include <assert.h>
+#include <unistd.h>
+#include <signal.h>
+#include <sys/wait.h>
 #include <config.h>
 
 #ifdef WORDS_BIGENDIAN
@@ -17,8 +22,32 @@
 #define IS_BIGENDIAN	(0)
 #endif
 
+/*
+ * Intentionally access the unaligned memory.
+ *
+ * Do not make this static otherwise the compiler could align the memory access
+ * pattern.
+ */
+__attribute__((noinline))
+int do_misaligned_access(void *m)
+{
+	volatile int *a = (int *)((char *)m + 0);
+	volatile int *b = (int *)((char *)m + sizeof(int));
+
+	return *a - *b;
+}
+
+static void handle_sigbus(int signum)
+{
+	_exit(3);
+}
+
 int main(void)
 {
+	pid_t child;
+	int wstatus = 0;
+	int child_ec;
+
 	printf(	"\n"
 		"CHAR_BIT:  %d\n"
 		"BIGENDIAN: %d\n"
@@ -37,5 +66,54 @@ int main(void)
 		sizeof(long),
 		sizeof(long long));
 
+	fflush(stdout);
+	fflush(stderr);
+
+	child = fork();
+	if (child < 0) {
+		perror("fork()");
+		abort();
+	} else if (child == 0) {
+		struct sigaction sa = { .sa_handler = handle_sigbus, };
+		struct __attribute__((packed)) {
+			char stuff;
+			int a;
+			int b;
+		} m_misaligned = {
+			.a = 123,
+			.b = 123,
+		};
+		struct __attribute__((packed)) {
+			int a;
+			int b;
+		} m_aligned = {
+			.a = 123,
+			.b = 123,
+		};
+
+		/*
+		 * Not really necessary to catch this, but modern distros with crash report daemon
+		 * might detect the crash and complain. Let's not annoy the user.
+		 */
+		sigaction(SIGBUS, &sa, NULL);
+
+		/*
+		 * Call the function with both memory so that the compiler won't
+		 * make only one aligned variant. As the function is globally
+		 * visible, it has no choice but to generate unaligned variant.
+		 * Aliasing a globally visible function is in violation of C
+		 * specs(dlopen()).
+		 */
+		return
+			do_misaligned_access(((char *)&m_misaligned) + 1) +
+			do_misaligned_access(&m_aligned);
+	}
+
+	waitpid(child, &wstatus, 0);
+	assert(WIFEXITED(wstatus));
+
+	child_ec = WEXITSTATUS(wstatus);
+	printf("Unaligned access: %s(%d)\n", child_ec == 0 ? "ABLE" : "CRASH", child_ec);
+
 	return 0;
 }
-- 
2.56.0

