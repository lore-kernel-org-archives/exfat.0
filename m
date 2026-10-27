Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088409;
	b=xyr9IuXNpdgxqgrURQYOJ7fCEQ8NhNfoAJCpwP96Ugfk0+ng3km87rcYh3Is2KIZz7Xk
	 zQOsHCgTR5pedc+I0dbOwUqXu4druCKrfNy3AzFpHpdvzcejCraKfyZ4lia0eua9NAGPG
	 vrUZ3czbpvmbJi2a8gNxnJGejzuVIMWFTwZ5jvPjSK4lSyzMa+yOvCTifQGoxboxCyLEf
	 F5zLXsNrVdSRXz2dcAKwvpxmwGyrb4KMDSqYvg+4SKNF0zxlcZX8GW2OyS1WYh5ih6xbt
	 iR8vC0qpcEOCRuwmYuiK3O7kayJLpoucEjUVOOse07hu5bU2UcwJOZ1tgfIueSgJwmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088409;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4fmoUkwtp9UHTthtDhSvAn2Iud6p7FevGZAAHDSNH5g=;
	b=Bv91k96KgNmbOuHMsQRtmU2yo/BSDoJ9yS90arsojJeDk4QOj4YeU0aJxYpMc+05/taH
	 em6VRt1s67fH8IBsx7ljWJzELwYwHWdeYN6Uz9DH+ZJuON3Yfnp+x23+MlSSC2dwYb5BJ
	 A+EWl0UJbiUr0+tPcyJEJsLfY/FJpHLQs+rnEz2fAIgD3+mr3qV7zwt416VVE7Z/iL2rL
	 xTC83n2Z1ih4VYCkczDjRMHcuftqpzNLM99s5lfoQSlA/7iwrZkxjPqBlE529R9uwytRl
	 ln/E+dyq+9rR3rL9W1e8BnNq8N7Wdyhxb1tg+CvdxdXk9oVteywBOCAYb41Ls+uu9ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=s7hc5JzY;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC1D606A322
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 08:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC1D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=s7hc5JzY
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 5716D1D485;
	Tue, 27 Oct 2026 08:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 5716D1D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793088407; bh=PYydi/tljDMOlAnG9RUQaBoMlcb9a7/UtBB0KMyxfFM=;
	h=From:To:Cc:Subject:Date:From;
	b=s7hc5JzYqcQYODZk2pMSIYFWS4SqkoM+02fdV1Sj8PRV3yoZP9VTx0PZh4GWsXf8W
	 Cx0wjV1DlrdjML/464ufLtZEMS3WEJsMJHiW8n6Rhv8UEhqtkABfy20mP1ZmJgTJcf
	 pxLAVYg5ZVxUjyBuG+3OsUyMllddxYWXvQUp7pfo=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id LI3iAZZb4Gr2bwEA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Tue, 27 Oct 2026 08:06:46 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>,
	"sofine . ljm" <sofine.ljm@gmail.com>,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 1/7] libexfat, fsck: exit() upon I/O error during fsck
Date: Tue, 27 Oct 2026 08:06:18 +0000
Message-ID: <20261027080628.82069-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.56.0
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

Add I/O error handling callback to give up fsck process when an I/O
error occurs. There are several places where I/O errors are either
improperly treated as filesystem inconsistency errors or silently
ignored.

As most of the codebase wasn't built with EIO in mind, rather than
adding EIO checks where I/O syscalls are involved, intercepting errors
in syscall wrappers through a callback to prevent further operation of
fsck seems to be a reasonable fix with low risk of regression.

Reported-by: sofine.ljm <sofine.ljm@gmail.com>
Closes: https://github.com/exfatprogs/exfatprogs/pull/394
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 fsck/fsck.c        | 28 +++++++++++++++++
 include/libexfat.h | 34 ++++++++++++++++++++
 lib/libexfat.c     | 77 +++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 134 insertions(+), 5 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 4dec837..524eef0 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2008,6 +2008,30 @@ unrec_mbr:
 	return 0;
 }
 
+static void fsck_ioerror_callback(enum exfat_what_ioerror what, int err,
+		int fd, off_t ofs, off_t size, const void *buf, void *ctx)
+{
+	const char *w_str;
+
+	if (fd != exfat_fsck.exfat->blk_dev->dev_fd)
+		return;
+
+	/* prevent recursive callbacks */
+	exfat_set_ioerror_callback(NULL, NULL);
+
+	w_str = exfat_what_ioerror_str(what);
+	assert(w_str != NULL);
+	exfat_err("ERROR: I/O error %d at %" PRIdMAX ", length %" PRIdMAX ", %s\n",
+			err, (intmax_t)ofs, (intmax_t)size, w_str);
+
+	exfat_fsync(exfat_fsck.exfat->blk_dev->dev_fd);
+
+	exit(FSCK_EXIT_OPERATION_ERROR);
+	/* Shut compiler up */
+	(void)buf;
+	(void)ctx;
+}
+
 int main(int argc, char * const argv[])
 {
 	struct fsck_user_input ui;
@@ -2166,6 +2190,8 @@ int main(int argc, char * const argv[])
 		goto err;
 	}
 
+	exfat_set_ioerror_callback(fsck_ioerror_callback, NULL);
+
 	exfat_debug("verifying root directory...\n");
 	ret = exfat_root_dir_check(&exfat_fsck);
 	if (ret) {
@@ -2191,6 +2217,8 @@ int main(int argc, char * const argv[])
 		exfat_fsck.dirty_fat = true;
 	}
 
+	exfat_set_ioerror_callback(NULL, NULL);
+
 	if (exfat_fsck.options & FSCK_OPTS_REPAIR_WRITE) {
 		ret = write_bitmap(&exfat_fsck);
 		if (ret) {
diff --git a/include/libexfat.h b/include/libexfat.h
index 65f13dd..8c18ab7 100644
--- a/include/libexfat.h
+++ b/include/libexfat.h
@@ -259,6 +259,40 @@ void exfat_init_blk_dev_info(struct exfat_blk_dev *bd);
 void exfat_deinit_blk_dev_info(struct exfat_blk_dev *bd);
 int exfat_get_blk_dev_info(struct exfat_user_input *ui,
 		struct exfat_blk_dev *bd);
+
+/* I/O Error Handling Facilities */
+
+enum exfat_what_ioerror {
+	EXFAT_IOERROR_READ,	/* [p]read() */
+	EXFAT_IOERROR_WRITE,	/* [p]write() */
+	EXFAT_IOERROR_ZERO,	/* exfat_write_zero*() or exfat_zeroout_blocks() */
+	EXFAT_IOERROR_DISCARD,	/* ioctl(..., BLK*DISCARD, ...) */
+	EXFAT_IOERROR_SYNC,	/* fsync() */
+};
+/* Convert the enum to a string of one word describing the action */
+const char *exfat_what_ioerror_str(enum exfat_what_ioerror w);
+/*
+ * I/O Error Callback Function Type
+ *
+ * err holds the errno set by the syscall. fd, ofs, size and buf are the
+ * parameters passed to the syscall. Obviously, in case of pread(), buf contains
+ * no meaningful data. In case of non-offset syscalls like read() and write(),
+ * ofs is -1. If the operation does not involve data range(in case of fsync()),
+ * ofs and size are passed as negative values. If the operation does not involve
+ * data(in case of exfat_write_zero*() and exfat_*_blocks()), buf is passed as
+ * NULL. ctx is the user context set with exfat_set_ioerror_callback().
+ */
+typedef void(*exfat_ioerror_callback_t)(enum exfat_what_ioerror what, int err,
+		int fd, off_t ofs, off_t size, const void *buf, void *ctx);
+/*
+ * Set the callback function for handling I/O errors
+ *
+ * The function will be called from the library I/O wrappers including
+ * exfat_read*(), exfat_write*(), exfat_fsync() and exfat_discard_blocks() when
+ * the underlying syscall returns an error. Set cb to NULL to disable callbacks.
+ */
+void exfat_set_ioerror_callback(exfat_ioerror_callback_t cb, void *ctx);
+
 /*
  * Load the requested size of data from the file onto buf
  *
diff --git a/lib/libexfat.c b/lib/libexfat.c
index 9cba484..6aae273 100644
--- a/lib/libexfat.c
+++ b/lib/libexfat.c
@@ -641,6 +641,46 @@ out:
 	return ret;
 }
 
+static exfat_ioerror_callback_t ioerror_cb;
+static void *ioerror_cb_ctx;
+static bool ioerror_entered;
+
+const char *exfat_what_ioerror_str(enum exfat_what_ioerror w)
+{
+	switch (w) {
+	case EXFAT_IOERROR_READ:	return "read";
+	case EXFAT_IOERROR_WRITE:	return "write";
+	case EXFAT_IOERROR_ZERO:	return "zeroing";
+	case EXFAT_IOERROR_DISCARD:	return "discard";
+	case EXFAT_IOERROR_SYNC:	return "sync";
+	}
+	return NULL;
+}
+
+void exfat_set_ioerror_callback(exfat_ioerror_callback_t cb, void *ctx)
+{
+	ioerror_cb = cb;
+	ioerror_cb_ctx = ctx;
+}
+
+/* Make sure errno is preserved before calling it! */
+static void do_ioerror_callback(enum exfat_what_ioerror what, int fd, off_t ofs,
+		off_t size, const void *buf)
+{
+	int saved_errno;
+
+	if (ioerror_cb == NULL)
+		return;
+	/* prevent recursive callback */
+	assert(!ioerror_entered);
+
+	ioerror_entered = true;
+	saved_errno = errno;
+	ioerror_cb(what, saved_errno, fd, ofs, size, buf, ioerror_cb_ctx);
+	errno = saved_errno;
+	ioerror_entered = false;
+}
+
 ssize_t exfat_read(int fd, void *buf, size_t size_in, off_t offset)
 {
 	int ret;
@@ -682,6 +722,7 @@ int exfat_read2(int fd, void *buf, off_t *size, off_t *offset)
 			io_stat.err |= EXFAT_IOSTAT_READ;
 #endif
 			ret = -errno;
+			do_ioerror_callback(EXFAT_IOERROR_READ, fd, *offset, rem, m);
 			goto out;
 		}
 		assert((size_t)size_read <= rem);
@@ -749,14 +790,15 @@ int exfat_write2(int fd, const void *buf, off_t *size, off_t *offset)
 			/* the dark corner of POSIX: we mirror glibc's defence mechanism here */
 			exfat_debug("pwrite() returned zero. This VFS is doing something fishy!");
 			ret = -EIO;
-			goto out;
+			errno = EIO;
+			goto callback;
 		}
 		if (size_written < 0) {
 #if !EXFAT_NO_IOSTATS
 			io_stat.err |= EXFAT_IOSTAT_WRITE;
 #endif
 			ret = -errno;
-			goto out;
+			goto callback;
 		}
 		assert((size_t)size_written <= rem);
 
@@ -769,6 +811,10 @@ int exfat_write2(int fd, const void *buf, off_t *size, off_t *offset)
 		if (*offset >= 0)
 			*offset += size_written;
 	}
+	goto out;
+
+callback:
+	do_ioerror_callback(EXFAT_IOERROR_WRITE, fd, *offset, rem, m);
 out:
 #if !EXFAT_NO_IOSTATS
 	exfat_getts(&ts_b);
@@ -827,6 +873,13 @@ int exfat_write_zero2(int fd, off_t size, off_t offset, size_t bs)
 			io_stat.err |= EXFAT_IOSTAT_WRITE;
 #endif
 			ret = -EIO;
+			/*
+			 * The callback could see a different errno than EIO
+			 * whilst the function returns -EIO...
+			 */
+			if (wsize == 0)
+				errno = EIO;
+			do_ioerror_callback(EXFAT_IOERROR_ZERO, fd, offset, size, NULL);
 			goto out;
 		}
 
@@ -860,6 +913,8 @@ int exfat_fsync(int fd)
 	exfat_getts(&ts_a);
 #endif
 	ret = fsync(fd);
+	if (ret)
+		do_ioerror_callback(EXFAT_IOERROR_SYNC, fd, -1, -1, NULL);
 #if !EXFAT_NO_IOSTATS
 	exfat_getts(&ts_b);
 
@@ -916,7 +971,11 @@ static int issue_blockrange_ioctl(int fd, int cmd, uint64_t start, uint64_t len)
 int exfat_discard_blocks(int fd, uint64_t start, uint64_t len)
 {
 #ifdef BLKDISCARD
-	return issue_blockrange_ioctl(fd, BLKDISCARD, start, len);
+	int ret = issue_blockrange_ioctl(fd, BLKDISCARD, start, len);
+
+	if (ret)
+		do_ioerror_callback(EXFAT_IOERROR_DISCARD, fd, start, len, NULL);
+	return ret;
 #else
 	return ENOSYS;
 #endif
@@ -925,7 +984,11 @@ int exfat_discard_blocks(int fd, uint64_t start, uint64_t len)
 int exfat_secerase_blocks(int fd, uint64_t start, uint64_t len)
 {
 #ifdef BLKSECDISCARD
-	return issue_blockrange_ioctl(fd, BLKSECDISCARD, start, len);
+	int ret = issue_blockrange_ioctl(fd, BLKSECDISCARD, start, len);
+
+	if (ret)
+		do_ioerror_callback(EXFAT_IOERROR_DISCARD, fd, start, len, NULL);
+	return ret;
 #else
 	return ENOSYS;
 #endif
@@ -934,7 +997,11 @@ int exfat_secerase_blocks(int fd, uint64_t start, uint64_t len)
 int exfat_zeroout_blocks(int fd, uint64_t start, uint64_t len)
 {
 #ifdef BLKZEROOUT
-	return issue_blockrange_ioctl(fd, BLKZEROOUT, start, len);
+	int ret = issue_blockrange_ioctl(fd, BLKZEROOUT, start, len);
+
+	if (ret)
+		do_ioerror_callback(EXFAT_IOERROR_ZERO, fd, start, len, NULL);
+	return ret;
 #else
 	return ENOSYS;
 #endif
-- 
2.56.0

