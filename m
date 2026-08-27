Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9503932C3
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 20:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863311; cv=none; b=DILdtMeN+wavs/5Yb28KTTI059aqu//fzlYuVUSAP2wluaNMqF+M4Mp7/62Pwm6LPbZC8l6cuAj7JNlGYf5Od/BoCafmbT1R2nsbEiRoxVYaBHqq1zAlAcWyhBeoKCu+VVrKXxwhXKLci3XUqILGxIA4m0L23rI1TKmK4f2gM0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863311; c=relaxed/simple;
	bh=Plahl6rmDJaRFh+JAocjzCKfd79HpcLceGsKn2CGjE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXbXxROhqcvG0XH6AIjS2ytUQ6ZQPiRPegOcUnMBA1AEY2I8/KwShorIA8MEU2d/taoXfldfDvJGQNk8gJTb7jrsJeapoPrBdDL5yU8KKUo/XiloMSd1Pglem9aQ5cmsrXmj/H0lzeli15l2lmDxJ+OLSOjoL/cw3xmHwmxdON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=Wb2i1BLw; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="Wb2i1BLw"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 0FD151D454;
	Thu, 27 Aug 2026 20:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 0FD151D454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787863297; bh=Plahl6rmDJaRFh+JAocjzCKfd79HpcLceGsKn2CGjE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wb2i1BLw0PkhJYeet9nJaVEBN4Y6iR3QmEDCII4PYmWKfHWYm8vP1MyCiyFlaXFkf
	 8+6kYUZ7E2R+KlzohENTVuGnsl+2NI08E6TfBcJHlCMA/tFM0tjxfBn1cgb/26Bwkw
	 cv2JKTvNAB0LwM0Z+U/sU2Utusal+E58Hi+0lCSc=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id rDNIOvygkGosiAIA8KYfjw:T4
	(envelope-from <dxdt@dev.snart.me>); Thu, 27 Aug 2026 20:41:36 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 3/8] treewide: fix factual errors and reduce column length of usage message
Date: Fri, 28 Aug 2026 05:39:49 +0900
Message-ID: <20260827204056.222099-4-dxdt@dev.snart.me>
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

The usage string took too many columns. This is not ideal even with
modern terminal emulators. Reduce it to 80.

Fix the factual errors in the usage message of mkfs.

  - "Overwrite an existing non-exFAT filesystem" -> "Overwrite existing
    filesystem": mkfs fails if run without the -F option if exFAT is
    detected(the whole point of filesystem detection is to prevent
    unintentional data loss)
  - "Verify written filesystem metadata by read-back" -> "Verify written
    data by read-back": written zeros are also verified

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 dump/dump.c   | 14 ++++++--------
 label/label.c |  6 +++---
 mkfs/mkfs.c   | 35 ++++++++++++++++++-----------------
 tune/tune.c   | 18 +++++++++---------
 4 files changed, 36 insertions(+), 37 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index ee8c36f..d55d561 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -36,14 +36,12 @@
 static void usage(void)
 {
 	fprintf(stderr, "Usage: dump.exfat\n");
-	fprintf(stderr, "\t-d | --dentry-set=path                Show directory entry set\n");
-	fprintf(stderr, "\t-c | --cluster-chain                  Show cluster chain\n");
-	fprintf(stderr,
-		"\t-s | --scan-dir=dir-path              Scan and show directory entry sets\n");
-	fprintf(stderr,
-		"\t-r | --recursive                      Scan and show directory entry sets recursively\n");
-	fprintf(stderr, "\t-V | --version                        Show version\n");
-	fprintf(stderr, "\t-h | --help                           Show help\n");
+	fprintf(stderr, "\t-d | --dentry-set=path    Show directory entry set\n");
+	fprintf(stderr, "\t-c | --cluster-chain      Show cluster chain\n");
+	fprintf(stderr, "\t-s | --scan-dir=dir-path  Scan and show directory entry sets\n");
+	fprintf(stderr, "\t-r | --recursive          Scan and show directory entry sets recursively\n");
+	fprintf(stderr, "\t-V | --version            Show version\n");
+	fprintf(stderr, "\t-h | --help               Show help\n");
 
 	exit(EXIT_FAILURE);
 }
diff --git a/label/label.c b/label/label.c
index 55eb0fb..d017a83 100644
--- a/label/label.c
+++ b/label/label.c
@@ -18,9 +18,9 @@
 static void usage(void)
 {
 	fprintf(stderr, "Usage: exfatlabel\n");
-	fprintf(stderr, "\t-i | --volume-serial                  Switch to volume serial mode\n");
-	fprintf(stderr, "\t-V | --version                        Show version\n");
-	fprintf(stderr, "\t-h | --help                           Show help\n");
+	fprintf(stderr, "\t-i | --volume-serial  Switch to volume serial mode\n");
+	fprintf(stderr, "\t-V | --version        Show version\n");
+	fprintf(stderr, "\t-h | --help           Show help\n");
 
 	exit(EXIT_FAILURE);
 }
diff --git a/mkfs/mkfs.c b/mkfs/mkfs.c
index 492094f..58f8ace 100644
--- a/mkfs/mkfs.c
+++ b/mkfs/mkfs.c
@@ -848,23 +848,24 @@ static int exfat_create_root_dir(struct exfat_blk_dev *bd,
 static void usage(void)
 {
 	fputs("Usage: mkfs.exfat\n"
-		"\t-L | --volume-label=label                              Set volume label\n"
-		"\t-U | --volume-guid=guid                                Set volume GUID\n"
-		"\t-s | --sector-size=size(or suffixed by 'K')            Specify sector size\n"
-		"\t-c | --cluster-size=size(or suffixed by 'K' or 'M')    Specify cluster size\n"
-		"\t-b | --boundary-align=size(or suffixed by 'K' or 'M')  Specify boundary alignment\n"
-		"\t     --pack-bitmap                                     Move bitmap into FAT segment\n"
-		"\t     --upcase=file                                     Specify up-case table binary file\n"
-		"\t     --bootcode-msg=message                            Specify custom message in MBR bootstrap code\n"
-		"\t-P | --partition-table=auto|none|mbr|gpt               Specify partition table\n"
-		"\t-f | --full-format                                     Full format\n"
-		"\t-F | --force                                           Overwrite an existing non-exFAT filesystem\n"
-		"\t-C | --check-written                                   Verify written filesystem metadata by read-back\n"
-		"\t-K | --no-discard                                      Do not discard blocks\n"
-		"\t-V | --version                                         Show version\n"
-		"\t-q | --quiet                                           Print only errors\n"
-		"\t-v | --verbose                                         Print debug\n"
-		"\t-h | --help                                            Show help\n",
+		"\t-L | --volume-label=label                 Set volume label\n"
+		"\t-U | --volume-guid=guid                   Set volume GUID\n"
+		"\t-s | --sector-size=size[K]                Specify sector size\n"
+		"\t-c | --cluster-size=size[K|M]             Specify cluster size\n"
+		"\t-b | --boundary-align=size[K|M]           Specify boundary alignment\n"
+		"\t     --pack-bitmap                        Move bitmap into FAT segment\n"
+		"\t     --upcase=file                        Specify up-case table binary file\n"
+		"\t     --bootcode-msg=message               Specify custom message in MBR\n"
+		"\t                                          bootstrap code\n"
+		"\t-P | --partition-table=auto|none|mbr|gpt  Specify partition table\n"
+		"\t-f | --full-format                        Full format\n"
+		"\t-F | --force                              Overwrite existing filesystem\n"
+		"\t-C | --check-written                      Verify written data by read-back\n"
+		"\t-K | --no-discard                         Do not discard blocks\n"
+		"\t-V | --version                            Show version\n"
+		"\t-q | --quiet                              Print only errors\n"
+		"\t-v | --verbose                            Print debug\n"
+		"\t-h | --help                               Show help\n",
 		stderr);
 
 	exit(EXIT_FAILURE);
diff --git a/tune/tune.c b/tune/tune.c
index 274643e..f26b6ab 100644
--- a/tune/tune.c
+++ b/tune/tune.c
@@ -18,15 +18,15 @@
 static void usage(void)
 {
 	fprintf(stderr, "Usage: tune.exfat\n");
-	fprintf(stderr, "\t-l | --print-label                    Print volume label\n");
-	fprintf(stderr, "\t-L | --set-label=label                Set volume label\n");
-	fprintf(stderr, "\t-u | --print-guid                     Print volume GUID\n");
-	fprintf(stderr, "\t-U | --set-guid=guid                  Set volume GUID\n");
-	fprintf(stderr, "\t-i | --print-serial                   Print volume serial\n");
-	fprintf(stderr, "\t-I | --set-serial=value               Set volume serial\n");
-	fprintf(stderr, "\t-V | --version                        Show version\n");
-	fprintf(stderr, "\t-v | --verbose                        Print debug\n");
-	fprintf(stderr, "\t-h | --help                           Show help\n");
+	fprintf(stderr, "\t-l | --print-label       Print volume label\n");
+	fprintf(stderr, "\t-L | --set-label=label   Set volume label\n");
+	fprintf(stderr, "\t-u | --print-guid        Print volume GUID\n");
+	fprintf(stderr, "\t-U | --set-guid=guid     Set volume GUID\n");
+	fprintf(stderr, "\t-i | --print-serial      Print volume serial\n");
+	fprintf(stderr, "\t-I | --set-serial=value  Set volume serial\n");
+	fprintf(stderr, "\t-V | --version           Show version\n");
+	fprintf(stderr, "\t-v | --verbose           Print debug\n");
+	fprintf(stderr, "\t-h | --help              Show help\n");
 
 	exit(EXIT_FAILURE);
 }
-- 
2.55.0

