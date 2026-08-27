Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28E43939BF
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 20:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863312; cv=none; b=bw9Zs1/f/ZZc/HdKrqtRHFvkll6Ynk+Y5Vm8O2IkWpIX81IP9VTKvco62D07P85R86+9SL2i/3whm4AL9UET1+7tfza9FYTUqUIqG+f0nDuKLiFJuoTC1LRJUV1p8rzKwuMQaI2fOvqlBZYmxUj4c+P3vwXW+AaKfV+kzLaUr/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863312; c=relaxed/simple;
	bh=vVni0rmQWSmVyA1RKxa8YhABalBmO0xWSiIALBoM3DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dz8y0caMCI5CqBnRDiX7tJisgJ+JXn4HNPQYQSZznDf4P+oipLycKcIvYw/y0hgCu4ARjPEuwPj2D15MowilDDzzFHSL6BMbwR11TJNc+UktNpHmJ5fK2UU6SYQ0+DnTtcdmNtGki82/7GrlTGz9kposIiVKr2ifsbjw5wmXfn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=jv93YuY1; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="jv93YuY1"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id C391C25444;
	Thu, 27 Aug 2026 20:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me C391C25444
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787863296; bh=vVni0rmQWSmVyA1RKxa8YhABalBmO0xWSiIALBoM3DA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jv93YuY125mQfHVAm/RmebU/e/9gSyIduvorzSCI6uqgn0bWgsJ1d99arMxTHhBf6
	 Bx6n3AupJr3wPsMZdMKvj1vtPUfFRsAOk8Aoe6tiNeyyhUJ7b4EVKdOT1y5BsT+v2C
	 fuCiHXdTuFVkAlBpAqkV+RQXO9+Hwxkj2JBAfzmM=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id rDNIOvygkGosiAIA8KYfjw:T3
	(envelope-from <dxdt@dev.snart.me>); Thu, 27 Aug 2026 20:41:35 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 2/8] mkfs, fsck: refactor getopt_long() return values
Date: Fri, 28 Aug 2026 05:39:48 +0900
Message-ID: <20260827204056.222099-3-dxdt@dev.snart.me>
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

Replace longopt ids with enum for the return values of getopt_long() for
cleaner code. No functional change.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 fsck/fsck.c | 14 ++++++++------
 mkfs/mkfs.c | 20 +++++++++++---------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 2f75415..f1934d0 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -48,8 +48,10 @@ struct exfat_fsck exfat_fsck;
 struct exfat_stat exfat_stat;
 struct path_resolve_ctx path_resolve_ctx;
 
-#define OPTID_PUT_MBR	(128 + 0)
-#define OPTID_CLEAR_MBR	(128 + 1)
+enum longopt_num {
+	LON_PUT_MBR = CHAR_MAX + 1,
+	LON_CLEAR_MBR,
+};
 
 static struct option opts[] = {
 	{"repair",		no_argument,		NULL,	'r' },
@@ -63,8 +65,8 @@ static struct option opts[] = {
 	{"?",			no_argument,		NULL,	'?' },
 	{"ignore-bad-fs",	no_argument,		NULL,	'b' },
 	{"progress",		no_argument,		NULL,	'P' },
-	{"put-mbr",		no_argument,		NULL,	OPTID_PUT_MBR },
-	{"clear-mbr",		no_argument,		NULL,	OPTID_CLEAR_MBR },
+	{"put-mbr",		no_argument,		NULL,	LON_PUT_MBR },
+	{"clear-mbr",		no_argument,		NULL,	LON_CLEAR_MBR },
 	{NULL, 0, NULL, 0}
 };
 
@@ -2026,12 +2028,12 @@ int main(int argc, char * const argv[])
 		case 'P':
 			ui.options |= FSCK_OPTS_PROGRESS_BAR;
 			break;
-		case OPTID_PUT_MBR:
+		case LON_PUT_MBR:
 			if (exfat_fsck.mbr)
 				usage(argv[0]);
 			exfat_fsck.mbr = 1;
 			break;
-		case OPTID_CLEAR_MBR:
+		case LON_CLEAR_MBR:
 			if (exfat_fsck.mbr)
 				usage(argv[0]);
 			exfat_fsck.mbr = -1;
diff --git a/mkfs/mkfs.c b/mkfs/mkfs.c
index 2d0533a..492094f 100644
--- a/mkfs/mkfs.c
+++ b/mkfs/mkfs.c
@@ -870,9 +870,11 @@ static void usage(void)
 	exit(EXIT_FAILURE);
 }
 
-#define PACK_BITMAP	(CHAR_MAX + 1)
-#define UPCASE_FILE	(CHAR_MAX + 2)
-#define BOOTCODE_MSG	(CHAR_MAX + 3)
+enum longopt_num {
+	LON_PACK_BITMAP = CHAR_MAX + 1,
+	LON_UPCASE_FILE,
+	LON_BOOTCODE_MSG,
+};
 
 static const struct option opts[] = {
 	{"volume-label",	required_argument,	NULL,	'L' },
@@ -880,9 +882,9 @@ static const struct option opts[] = {
 	{"sector-size",		required_argument,	NULL,	's' },
 	{"cluster-size",	required_argument,	NULL,	'c' },
 	{"boundary-align",	required_argument,	NULL,	'b' },
-	{"upcase",		required_argument,	NULL,	UPCASE_FILE },
-	{"bootcode-msg",	required_argument,	NULL,	BOOTCODE_MSG },
-	{"pack-bitmap",		no_argument,		NULL,	PACK_BITMAP },
+	{"upcase",		required_argument,	NULL,	LON_UPCASE_FILE },
+	{"bootcode-msg",	required_argument,	NULL,	LON_BOOTCODE_MSG },
+	{"pack-bitmap",		no_argument,		NULL,	LON_PACK_BITMAP },
 	{"full-format",		no_argument,		NULL,	'f' },
 	{"force",		no_argument,		NULL,	'F' },
 	{"check-written",	no_argument,		NULL,	'C' },
@@ -1512,13 +1514,13 @@ int main(int argc, char *argv[])
 			}
 			ui.boundary_align = ret;
 			break;
-		case UPCASE_FILE:
+		case LON_UPCASE_FILE:
 			ui.upcase.file = optarg;
 			break;
-		case PACK_BITMAP:
+		case LON_PACK_BITMAP:
 			ui.pack_bitmap = true;
 			break;
-		case BOOTCODE_MSG:
+		case LON_BOOTCODE_MSG:
 			ui.bootcode_msg = optarg;
 			/* A long message will just get truncated silently. */
 			break;
-- 
2.55.0

