Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BF3429CEC
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300719; cv=none; b=N2cZGbhxA1KgIAG2N7YhPxFvli9IcLiuNaRfiu2D75sTIOG47JFk/2hR0kj7n79xcD+4TQrOpIonC9qZPxsygH2n0iUhWU0HLWn2FzxonEyRcn36B2dfgkWC2/hD9jNx19zYT3WoNXNkaTOb5m6LQ7EBwYR08LFBkn2kXV3Fugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300719; c=relaxed/simple;
	bh=hNXPBqvOxucwMT+DkgEwPyXr9OmX/RGUzmMfM/2Pdcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xoau882bmxmEoSQ2+GIgSRCRjhvW4RwMgs9K1QPgxeGFvmVcRqwixIK5yzsl4OMQ8sLKkosgXLW5m8sk8vZI9EnP5m1er7J7mujw5vrMABAz8wkXmx4qcGf7gcsmTr+N4XwrlVBHOUiSWE4Rv6R/E+DMNwGteo6cw+yLuYIh0V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=mutWMUB9; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="mutWMUB9"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id A60551D45A;
	Fri, 21 Aug 2026 08:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me A60551D45A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787300714; bh=hNXPBqvOxucwMT+DkgEwPyXr9OmX/RGUzmMfM/2Pdcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mutWMUB95big/DgbzHI8VGmJX0t8SH4b0GlzaFh2Gqgew6Zg/0qDmTCQmT5boM9D9
	 +hsi7YWjblrGUBaZJHfFy/UcAzZ1WM8T90KoSh/Dl81LmhbL26KKQpVid7MAIZBhci
	 pw4GsjvYaQwHL5X2fk0BZPbi7xEyAvs5gk8ZUzK4=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id dbwxCGgLiGqVUgAA8KYfjw:T2
	(envelope-from <dxdt@dev.snart.me>); Fri, 21 Aug 2026 08:25:13 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 1/1] mkfs: set MAP_NORESERVE to force overcommit in exfat_map_blankmem()
Date: Fri, 21 Aug 2026 17:24:54 +0900
Message-ID: <20260821082454.9976-2-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821082454.9976-1-dxdt@dev.snart.me>
References: <20260821082454.9976-1-dxdt@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without the mmap() flag MAP_NORESERVE, the function still fails on
memory contraint systems because the kernel reserves VSZ including the
swap space even though the actual space required is only about 128
KB(0xFFFFFFF4 512-byte clusters divided by 8). Not using the flag
defeats the purpose of mapping /dev/zero.

Add MAP_NORESERVE to the flags when calling mmap() so that the kernel
disregards the VSZ available on the system when creating the mapping.

Also add comments on the reasoning behind the use of /dev/zero instead
of MAP_ANONYMOUS.

Fixes: dbffb9d29c86 ("mkfs: reduce RSS memory footprint for huge bitmap")
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 include/libexfat.h | 10 +++++++---
 lib/libexfat.c     |  4 ++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/libexfat.h b/include/libexfat.h
index 8dbb8ea..5126371 100644
--- a/include/libexfat.h
+++ b/include/libexfat.h
@@ -329,8 +329,11 @@ void exfat_close_fd_devzero(void);
  * EBADFD if exfat_open_fd_devzero() has been called successfully, or any other
  * errno set in mmap().
  *
- * Note that /dev/zero mapping do not count towards committed memory. See
- * vm.overcommit for detail.
+ * Note that /dev/zero mappings do not count towards committed memory. See
+ * vm.overcommit for detail. /dev/zero is used instead of MAP_ANONYMOUS for
+ * portability reasons(the behaviour of shared read-only anonymous mapping is
+ * not well-defined). However, on Linux, it should be equivalent to allocating
+ * memory through MAP_ANONYMOUS.
  *
  * For rw version of this function, see exfat_map_blankmem().
  */
@@ -340,7 +343,8 @@ const void *exfat_map_zeromem(const size_t len, bool *mapped);
  * zeros(e.g. allocation bitmap).
  *
  * The function has the exact same semantics as exfat_map_zeromem(), except that
- * it calls mmap() with PROT_READ|PROT_WRITE and MAP_PRIVATE.
+ * it calls mmap() with PROT_READ|PROT_WRITE and MAP_PRIVATE|MAP_NORESERVE if
+ * and only if supported by the platform.
  */
 void *exfat_map_blankmem(const size_t len, bool *mapped);
 /*
diff --git a/lib/libexfat.c b/lib/libexfat.c
index efd50ea..8212d76 100644
--- a/lib/libexfat.c
+++ b/lib/libexfat.c
@@ -1303,9 +1303,9 @@ void *exfat_map_blankmem(const size_t len, bool *mapped)
 	int prot = -1;
 	int flags = -1;
 
-#ifdef _POSIX_MAPPED_FILES
+#if defined(_POSIX_MAPPED_FILES) && defined(MAP_NORESERVE)
 	prot = PROT_READ|PROT_WRITE;
-	flags = MAP_PRIVATE;
+	flags = MAP_PRIVATE|MAP_NORESERVE;
 #endif
 	return exfat_do_map_zerodev(len, mapped, prot, flags);
 }
-- 
2.55.0

