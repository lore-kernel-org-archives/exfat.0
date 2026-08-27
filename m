Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A8C3911C9
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 20:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863320; cv=none; b=nWqOxIKJv7mKkqsCD0KcGVMU8b76CinKpbeUZ7paYIyHJ9TpWhhNi3bokESrvXUdka1u34eV/W/M7YTpzdo+xhhtESuhZZMSBySH7atPSjB7wyTdBBvtOzxQNyeJIaS4GWdjjVlPEHknaqsS2zpzjkhm18QCWZC6Tn8XAy0FIMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863320; c=relaxed/simple;
	bh=C4D0FZEd8gtYPchm9Fdkd51EJ/4hQwkWGHjaeRl7HIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4nenvWhNjBeFBAvjoDel6msEENue3YuxGDP8v8YpwvwVojZciYJK2EWFFP5Axh0p+fhyZK//82lbP6LJFAPezXKuWBiGwGnzEfiBJhJQFmNC4uveVN4kL6wtL4UYct9NqgSvxwk1FBTGYCsVLhXpgN2+N6usIbaDv5epmTB6+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=YoK4UJig; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="YoK4UJig"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 8FAE127B35;
	Thu, 27 Aug 2026 20:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 8FAE127B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787863300; bh=C4D0FZEd8gtYPchm9Fdkd51EJ/4hQwkWGHjaeRl7HIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YoK4UJigVvAsJqLZkq2Pt0aE2EP5w6KC+cA7c5AbfVOHUIBze2KYWDebjchJwHIFZ
	 xUYesuKQJDWudw1WquWnxEY+/c1+2JXhjtxSC4lQeYpfdwi+IX7DSgHLUR4flDtXmA
	 QkFkEfFXfdRk7JflSiUUoXklU7amvC6tIdJV4xjY=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id rDNIOvygkGosiAIA8KYfjw:T6
	(envelope-from <dxdt@dev.snart.me>); Thu, 27 Aug 2026 20:41:39 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 5/8] libexfat: add exfat_secerase_blocks() and exfat_zeroout_blocks()
Date: Fri, 28 Aug 2026 05:39:51 +0900
Message-ID: <20260827204056.222099-6-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827204056.222099-1-dxdt@dev.snart.me>
References: <20260827204056.222099-1-dxdt@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the wrapper functions for BLKSECDISCARD and BLKZEROOUT. In IO stats,
BLKSECDISCARD and BLKDISCARD are accounted using the same variables
because, in practice, only either one of them will be used in a single
program run. As a way of determining which one is used, the bit
EXFAT_IOSTAT_SECURE is set in io_stat.err to save memory.

Do not require BLKDISCARD at compile time to support libc from kernel
version 2.6.x era.

No functional change in the utils as of yet.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 include/libexfat.h |  9 +++++
 lib/libexfat.c     | 94 ++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 87 insertions(+), 16 deletions(-)

diff --git a/include/libexfat.h b/include/libexfat.h
index 554b03d..9dc1542 100644
--- a/include/libexfat.h
+++ b/include/libexfat.h
@@ -299,7 +299,16 @@ bool exfat_write_full(int fd, const void *buf, size_t size, off_t offset);
 int exfat_write_zero(int fd, off_t size, off_t offset);
 int exfat_write_zero2(int fd, off_t size, off_t offset, size_t bs);
 int exfat_fsync(int fd);
+/* BLKDISCARD wrapper */
 int exfat_discard_blocks(int fd, uint64_t start, uint64_t len);
+/*
+ * BLKSECDISCARD wrapper (for sdcards that support it)
+ *
+ * Link: https://lwn.net/Articles/395147/
+ */
+int exfat_secerase_blocks(int fd, uint64_t start, uint64_t len);
+/* BLKZEROOUT wrapper (for devices that support it) */
+int exfat_zeroout_blocks(int fd, uint64_t start, uint64_t len);
 
 size_t exfat_utf16_len(const __le16 *str, size_t max_size);
 ssize_t exfat_utf16_enc(const char *in_str, __u16 *out_str, size_t out_size);
diff --git a/lib/libexfat.c b/lib/libexfat.c
index 0fe989f..9cba484 100644
--- a/lib/libexfat.c
+++ b/lib/libexfat.c
@@ -99,6 +99,10 @@ const char *dummy_bootcode_msg = DEFAULT_DUMMY_BOOTCODE_MSG;
 #define EXFAT_IOSTAT_WRITE	(0x02)
 #define EXFAT_IOSTAT_DISCARD	(0x04)
 #define EXFAT_IOSTAT_SYNC	(0x08)
+#define EXFAT_IOSTAT_ERRMASK	(0x0F)
+#define EXFAT_IOSTAT_ZEROOUT	(0x10)
+/* When set in err, BLKSECDISCARD was involved in discard stats */
+#define EXFAT_IOSTAT_SECURE	(0x20)
 
 static struct {
 	/* --- cacheline #1 --- */
@@ -116,6 +120,10 @@ static struct {
 		off_t len;
 		struct timespec time;
 	} discard;
+	struct {
+		off_t len;
+		struct timespec time;
+	} zero;
 	int err;
 	int ovf;
 } io_stat;
@@ -864,7 +872,7 @@ int exfat_fsync(int fd)
 	return ret;
 }
 
-int exfat_discard_blocks(int fd, uint64_t start, uint64_t len)
+static int issue_blockrange_ioctl(int fd, int cmd, uint64_t start, uint64_t len)
 {
 	uint64_t range[2] = { start, len };
 #if !EXFAT_NO_IOSTATS
@@ -872,19 +880,66 @@ int exfat_discard_blocks(int fd, uint64_t start, uint64_t len)
 
 	exfat_getts(&ts_a);
 #endif
-	if (ioctl(fd, BLKDISCARD, &range) < 0)
+	if (ioctl(fd, cmd, &range) < 0)
 		return errno;
 #if !EXFAT_NO_IOSTATS
 	exfat_getts(&ts_b);
-
 	exfat_tssub(&ts_b, &ts_a, &ts_b);
-	exfat_tsadd(&ts_b, &io_stat.discard.time, &io_stat.discard.time);
-	io_stat.discard.len = exfat_iostat_ofsadd(io_stat.discard.len, len, EXFAT_IOSTAT_DISCARD);
+
+#if defined(BLKSECDISCARD) && defined(BLKDISCARD)
+	if (cmd == BLKSECDISCARD) {
+		io_stat.err |= EXFAT_IOSTAT_SECURE;
+		cmd = BLKDISCARD;
+	}
+#endif
+	switch (cmd) {
+#ifdef BLKDISCARD
+	case BLKDISCARD:
+		exfat_tsadd(&ts_b, &io_stat.discard.time, &io_stat.discard.time);
+		io_stat.discard.len = exfat_iostat_ofsadd(io_stat.discard.len,
+							  len, EXFAT_IOSTAT_DISCARD);
+		break;
+#endif
+#ifdef BLKZEROOUT
+	case BLKZEROOUT:
+		exfat_tsadd(&ts_b, &io_stat.zero.time, &io_stat.zero.time);
+		io_stat.zero.len = exfat_iostat_ofsadd(io_stat.zero.len, len,
+						       EXFAT_IOSTAT_ZEROOUT);
+		break;
+#endif
+	}
 #endif
 
 	return 0;
 }
 
+int exfat_discard_blocks(int fd, uint64_t start, uint64_t len)
+{
+#ifdef BLKDISCARD
+	return issue_blockrange_ioctl(fd, BLKDISCARD, start, len);
+#else
+	return ENOSYS;
+#endif
+}
+
+int exfat_secerase_blocks(int fd, uint64_t start, uint64_t len)
+{
+#ifdef BLKSECDISCARD
+	return issue_blockrange_ioctl(fd, BLKSECDISCARD, start, len);
+#else
+	return ENOSYS;
+#endif
+}
+
+int exfat_zeroout_blocks(int fd, uint64_t start, uint64_t len)
+{
+#ifdef BLKZEROOUT
+	return issue_blockrange_ioctl(fd, BLKZEROOUT, start, len);
+#else
+	return ENOSYS;
+#endif
+}
+
 size_t exfat_utf16_len(const __le16 *str, size_t max_size)
 {
 	size_t i = 0;
@@ -2234,36 +2289,43 @@ void exfat_print_iostat(void)
 	if (get_intbool_envvar("EXFAT_PRINT_IOSTAT") <= 0)
 		return;
 
-	invalid = io_stat.err | io_stat.ovf;
+	invalid = (io_stat.err & EXFAT_IOSTAT_ERRMASK) | io_stat.ovf;
 	exfat_tsadd(&total, &io_stat.time.read, &total);
 	exfat_tsadd(&total, &io_stat.time.write, &total);
 	exfat_tsadd(&total, &io_stat.time.sync, &total);
 	exfat_tsadd(&total, &io_stat.discard.time, &total);
+	exfat_tsadd(&total, &io_stat.zero.time, &total);
 
 	fprintf(stderr, "IO stats:\n"
-			"  read:    %ld.%06lds %lld %s%s\n"
-			"  write:   %ld.%06lds %lld %s%s\n"
-			"  discard: %ld.%06lds %lld %s\n"
-			"  sync:    %ld.%06lds %s\n"
+			"  read:    %ld.%06lds %lld%s%s\n"
+			"  write:   %ld.%06lds %lld%s%s\n"
+			"  discard: %ld.%06lds %lld%s%s\n"
+			"  zero:    %ld.%06lds %lld%s\n"
+			"  sync:    %ld.%06lds%s\n"
 			"  total:   %ld.%06lds\n"
 			"  valid:   %s\n",
 			(long)io_stat.time.read.tv_sec,
 			(long)io_stat.time.read.tv_nsec / 1000,
 			(long long)io_stat.len.read,
-			io_stat.err & EXFAT_IOSTAT_READ ? "ERR" : "",
-			io_stat.ovf & EXFAT_IOSTAT_READ ? "OVF" : "",
+			io_stat.err & EXFAT_IOSTAT_READ ? " ERR" : "",
+			io_stat.ovf & EXFAT_IOSTAT_READ ? " OVF" : "",
 			(long)io_stat.time.write.tv_sec,
 			(long)io_stat.time.write.tv_nsec / 1000,
 			(long long)io_stat.len.write,
-			io_stat.err & EXFAT_IOSTAT_WRITE ? "ERR" : "",
-			io_stat.ovf & EXFAT_IOSTAT_WRITE ? "OVF" : "",
+			io_stat.err & EXFAT_IOSTAT_WRITE ? " ERR" : "",
+			io_stat.ovf & EXFAT_IOSTAT_WRITE ? " OVF" : "",
 			(long)io_stat.discard.time.tv_sec,
 			(long)io_stat.discard.time.tv_nsec / 1000,
 			(long long)io_stat.discard.len,
-			io_stat.ovf & EXFAT_IOSTAT_DISCARD ? "OVF" : "",
+			io_stat.err & EXFAT_IOSTAT_SECURE ? " SEC" : "",
+			io_stat.ovf & EXFAT_IOSTAT_DISCARD ? " OVF" : "",
+			(long)io_stat.zero.time.tv_sec,
+			(long)io_stat.zero.time.tv_nsec / 1000,
+			(long long)io_stat.zero.len,
+			io_stat.ovf & EXFAT_IOSTAT_ZEROOUT ? " OVF" : "",
 			(long)io_stat.time.sync.tv_sec,
 			(long)io_stat.time.sync.tv_nsec / 1000,
-			io_stat.err & EXFAT_IOSTAT_SYNC ? "ERR" : "",
+			io_stat.err & EXFAT_IOSTAT_SYNC ? " ERR" : "",
 			(long)total.tv_sec,
 			(long)total.tv_nsec / 1000,
 			invalid ? "false" : "true");
-- 
2.55.0

