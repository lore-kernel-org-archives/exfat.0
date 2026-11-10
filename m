Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293728;
	b=m7sRJK2Z4wEf0OD3TSF8y1n3gLWFgG1Od6ytPQiCBba44H6Gjy0cIPZ1LlGuEFr/U6jO
	 kGjaXByaZUb2AF7iIim9ruuTl9+0ONQ9+50EmWcj8AsRNcRmq9jbgKN7ynV7zsQ1Cd2qG
	 WH80f/XixWbjexILl6C8N4gE4covMKW+byd/u/8fSiD9DVePwf8lmfGuYfboQH+vDlJ8O
	 sq2q2/MHaNid0n0BaZNq9xB9ZzGF5NI/TnRoLGfBX4gGiKQlnTzNn2ZsZxFRd1esmud6z
	 kav5UffFdTrFmDA656jhKPrdi3PbUuQPJtpJcDxRnYixax9HJ+3GmrvfWAtXp0hqWmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293728;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A93f3B/rjFmmKdpaKkv1JZPUA9u2OKwn2ltZNSl8jkE=;
	b=OsWIc9hoJ6ARf5fewtrxq1qx5KU2f4sMpoFmav6iJF9UZz+7DOdA33liubSv45hhLX2F
	 XbcS2nFVPYMG9ktZvtDhLp9fozB+9suIRYOFCCMq2bq5AV6/7fIesIIUWDfmBCbdb+ysT
	 1GZqFVz885+M3kn+dKnd9joshIWBuD1xFlrYeWzQP0dngWlFCITzBHYoFRdt223tS4Wvm
	 VoED1JWIZCWt1Nop4zwgxJe2A3629UDN7pYXXfvnXfl5oZWiNI2KpbciUv13eQm5Qnf6Z
	 7Pgr/InaLkDFK/DVLucvD8mzEcbUbYbB3i2kyzu9q78uWLMrlPJVpbfNKat/NgUmqdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b="V/6Fxmvn";
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C16606A325
	for <exfat@lists.linux.dev>; Tue, 10 Nov 2026 06:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C16606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=V/6Fxmvn
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id A5AC51D47C;
	Tue, 10 Nov 2026 06:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me A5AC51D47C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794293726; bh=WvCfLbaZJ9HyJk1GA876AUCFFqrGtsTrHCeS/pYFatI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V/6FxmvnzcbFfl1GjW1iJkQv0WHfbAhZ5VZ9nDe9pFvl1RwEFceTTjqKtVw9wOBj0
	 Au8ctTWrsHQTxgZYP817LdDFoemqs9gHjiHgMBW/E0rSSCdEAgUmn+OL6KE9TY0es6
	 ghM2HiNAj80aE+Na0JCvsstG/+y2SlYNp9UzNiYQ=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id /GyMLta/8mq/UAEA8KYfjw:T4
	(envelope-from <dxdt@dev.snart.me>); Tue, 10 Nov 2026 06:55:24 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 3/7] mkfs: add -i/--volume-serial, --disk-guid and --part-guid options
Date: Tue, 10 Nov 2026 06:54:37 +0000
Message-ID: <20261110065441.63590-4-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110065441.63590-1-dxdt@dev.snart.me>
References: <20261110065441.63590-1-dxdt@dev.snart.me>
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

The purpose of these options is to provide a way to make fsck.exfat
deterministic for testing purposes. For example, if the size and serial
of the volume are constant, mkfs.exfat produces the volume with exact
same contents. This makes it possible for tests to cache the previous
result and the skip expensive verification process if there's no change
in the generated images.

  $ truncate -s 32M a.img
  $ truncate -s 32M b.img
  $ mkfs.exfat -F -i 0x12345678 a.img
  ...
  $ mkfs.exfat -F -i 0x12345678 b.img
  ...
  $ sha256sum -b a.img b.img
  e293574fd06bfe9ed6e6d399c856387cf07dad4fe4a82f7605741e41a12ba2a5 *a.img
  e293574fd06bfe9ed6e6d399c856387cf07dad4fe4a82f7605741e41a12ba2a5 *b.img

  $ ./mkfs/mkfs.exfat -i 0x12345678 -F -Pgpt\
      --disk-guid=9129413c-768c-416e-8212-3c0688c2b396\
      --part-guid=dae52c4e-bb76-4759-9088-c25867217218\
        a.img
  ...
  $ ./mkfs/mkfs.exfat -i 0x12345678 -F -Pgpt\
      --disk-guid=9129413c-768c-416e-8212-3c0688c2b396\
      --part-guid=dae52c4e-bb76-4759-9088-c25867217218\
        b.img
  $ sha256sum -b a.img b.img
  b05dcf981ae6c622b07e3eb15d64fc54d7d2ffe86329a719c3001a711e719fe4 *a.img
  b05dcf981ae6c622b07e3eb15d64fc54d7d2ffe86329a719c3001a711e719fe4 *b.img

Also, fix a typo in manpages/mkfs.exfat.8 ("hypenized" -> "hyphenized").

Link: https://github.com/exfatprogs/exfatprogs/issues/392
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 manpages/mkfs.exfat.8 | 26 +++++++++++++++++-
 mkfs/mkfs.c           | 63 ++++++++++++++++++++++++++++++++++---------
 mkfs/mkfs.h           | 14 +++++++---
 3 files changed, 85 insertions(+), 18 deletions(-)

diff --git a/manpages/mkfs.exfat.8 b/manpages/mkfs.exfat.8
index 88085de..837ec5d 100644
--- a/manpages/mkfs.exfat.8
+++ b/manpages/mkfs.exfat.8
@@ -22,9 +22,16 @@ mkfs.exfat \- create an exFAT filesystem
 .B \-U
 .I volume_guid
 ] [
+.B \-i
+.I volume_serial
+] [
 .B \-P
 .I type
 ] [
+.B \-\-disk\-guid\fR=\fIguid\fR
+] [
+.B \-\-part\-guid\fR=\fIguid\fR
+] [
 .B \-\-pack\-bitmap
 ] [
 .B \-\-upcase\fR=\fIfile\fR
@@ -163,11 +170,28 @@ Specifies the volume label to be associated with the exFAT filesystem.
 .TP
 .BR \-U ", " \-\-volume\-guid =\fIguid\fR
 Specifies the volume GUID to be associated with the exFAT filesystem.
-It can be given in the standard, hypenized UUID format like
+It can be given in the standard, hyphenized UUID format like
 \fBaaaabbbb-cccc-dddd-eeee-ffff00001111\fR. Note: The volume GUID cannot be used
 to set the the 8-letter ID reported by \fIblkid\fR or used as
 the filesystem UUID in \fB/etc/fstab\fR.
 .TP
+.BR \-i ", " \-\-volume\-serial =\fIserial\fR
+Specifies the volume serial of the exFAT filesystem. The volume serial is an
+unsigned 32-bit integer. It can be represented either in hexadecimal or decimal
+format. In the former case, the number must be prefixed with "0x" (for example,
+0xdeedbeef). The default is a number which depends on the filesystem creation
+time.
+.TP
+.BR \-\-disk\-guid =\fIguid\fR
+Specifies the disk GUID to be associated with the GUID partition table(GPT).
+If GPT is not used for the new exFAT volume, the GUID is only validated but not
+used.
+.TP
+.BR \-\-part\-guid =\fIguid\fR
+Specifies the partition GUID to be associated with the GUID partition
+table(GPT). If GPT is not used for the new exFAT volume, the GUID is only
+validated but not used.
+.TP
 .B \-\-pack\-bitmap
 Attempts to relocate the exFAT allocation bitmap so that it ends at the
 alignment boundary immediately following the FAT rather than beginning at that
diff --git a/mkfs/mkfs.c b/mkfs/mkfs.c
index 609654b..6c8bd76 100644
--- a/mkfs/mkfs.c
+++ b/mkfs/mkfs.c
@@ -36,13 +36,9 @@ static int fd_rnddev = -1;
 /* random serial generator based on current time */
 static unsigned int get_new_serial(void)
 {
-	struct timespec ts;
+	struct timespec ts = {};
 
-	if (clock_gettime(CLOCK_REALTIME, &ts)) {
-		/* set 0000-0000 on error */
-		ts.tv_sec = 0;
-		ts.tv_nsec = 0;
-	}
+	clock_gettime(CLOCK_REALTIME, &ts);
 
 	return (unsigned int)(ts.tv_nsec << 12 | ts.tv_sec);
 }
@@ -238,14 +234,14 @@ static int build_gpt(struct exfat_blk_dev *bd, const struct exfat_user_input *ui
 	}
 
 	/* fill in the data */
-
-	exfat_open_rnddev(); /* Some good entropy, please. */
-
 	/* The first GPT entry */
 
 	memcpy(&arr[0].partition_type_guid, EXFAT_GPT_PART_TYPE, 16);
 	memcpy(&serial, &arr[0].partition_type_guid, 2);
-	exfat_gen_guid(&arr[0].unique_partition_guid);
+	if (finfo.gpt.has_part_guid)
+		memcpy(&arr[0].unique_partition_guid, &finfo.gpt.part_guid, EXFAT_GUID_LEN);
+	else
+		exfat_gen_guid(&arr[0].unique_partition_guid);
 	arr[0].starting_lba = first_aligned;
 	arr[0].ending_lba = last_aligned;
 
@@ -276,7 +272,10 @@ static int build_gpt(struct exfat_blk_dev *bd, const struct exfat_user_input *ui
 	head_main->alternate_lba = bd->num_sectors - 1;
 	head_main->first_usable_lba = first_usable;
 	head_main->last_usable_lba = last_usable;
-	exfat_gen_guid(&head_main->disk_guid);
+	if (finfo.gpt.has_disk_guid)
+		memcpy(&head_main->disk_guid, &finfo.gpt.disk_guid, EXFAT_GUID_LEN);
+	else
+		exfat_gen_guid(&head_main->disk_guid);
 	head_main->partition_entry_lba = regions[EXFAT_GPT_DATA_REGION_M_ARR].ofs / sector;
 	head_main->num_partition_entries = EXFAT_GPT_ENTRY_CNT;
 	head_main->sizeof_partition_entry = EXFAT_GPT_ENTRY_SIZE;
@@ -851,6 +850,9 @@ static void usage(void)
 	fputs("Usage: mkfs.exfat\n"
 		"\t-L | --volume-label=label                 Set volume label\n"
 		"\t-U | --volume-guid=guid                   Set volume GUID\n"
+		"\t-i | --volume-serial=serial               Set volume serial\n"
+		"\t     --disk-guid=guid                     Set disk GUID (if GPT)\n"
+		"\t     --part-guid=guid                     Set partition GUID (if GPT)\n"
 		"\t-s | --sector-size=size[K]                Specify sector size\n"
 		"\t-c | --cluster-size=size[K|M]             Specify cluster size\n"
 		"\t-b | --boundary-align=size[K|M]           Specify boundary alignment\n"
@@ -876,11 +878,16 @@ enum longopt_num {
 	LON_PACK_BITMAP = CHAR_MAX + 1,
 	LON_UPCASE_FILE,
 	LON_BOOTCODE_MSG,
+	LON_DISK_GUID,
+	LON_PART_GUID,
 };
 
 static const struct option opts[] = {
 	{"volume-label",	required_argument,	NULL,	'L' },
 	{"volume-guid",		required_argument,	NULL,	'U' },
+	{"volume-serial",	required_argument,	NULL,	'i' },
+	{"disk-guid",		required_argument,	NULL,	LON_DISK_GUID },
+	{"part-guid",		required_argument,	NULL,	LON_PART_GUID },
 	{"sector-size",		required_argument,	NULL,	's' },
 	{"cluster-size",	required_argument,	NULL,	'c' },
 	{"boundary-align",	required_argument,	NULL,	'b' },
@@ -1131,7 +1138,6 @@ static int exfat_build_mkfs_info(struct exfat_blk_dev *bd, struct exfat_user_inp
 	finfo.root_start_clu = finfo.ut_start_clu + clu_len / ui->cluster_size;
 	finfo.root_byte_off = finfo.ut_byte_off + clu_len;
 	finfo.root_byte_len = sizeof(struct exfat_dentry) * 3;
-	finfo.volume_serial = get_new_serial();
 
 	return 0;
 }
@@ -1545,8 +1551,10 @@ int main(int argc, char *argv[])
 
 	setlocale(LC_ALL, "");
 
+	finfo.volume_serial = get_new_serial();
+
 	opterr = 0;
-	while ((c = getopt_long(argc, argv, "n:L:U:s:c:b:P:fFCKVqvh", opts, NULL)) != EOF)
+	while ((c = getopt_long(argc, argv, "n:L:U:s:c:b:P:fFCKVqvhi:", opts, NULL)) != EOF)
 		switch (c) {
 		/*
 		 * Make 'n' option fallthrough to 'L' option for for backward
@@ -1645,6 +1653,33 @@ int main(int argc, char *argv[])
 				goto out;
 			}
 			break;
+		case 'i':
+		{
+			unsigned long n = 0;
+
+			if (exfat_parse_ulong(optarg, &n) || n > UINT_MAX) {
+				exfat_err("not a volume serial: %s\n", optarg);
+				ret = -EINVAL;
+				goto out;
+			}
+
+			finfo.volume_serial = (unsigned int)n;
+			break;
+		}
+		case LON_DISK_GUID:
+			if (exfat_parse_guid(finfo.gpt.disk_guid.b, optarg, "disk GUID")) {
+				ret = -EINVAL;
+				goto out;
+			}
+			finfo.gpt.has_disk_guid = true;
+			break;
+		case LON_PART_GUID:
+			if (exfat_parse_guid(finfo.gpt.part_guid.b, optarg, "partition GUID")) {
+				ret = -EINVAL;
+				goto out;
+			}
+			finfo.gpt.has_part_guid = true;
+			break;
 		case 'V':
 			version_only = true;
 			break;
@@ -1920,6 +1955,8 @@ void exfat_gen_guid(void *out)
 	struct timespec ts[2] = { 0, };
 	uint8_t zm[16] = { 0, };
 
+	exfat_open_rnddev();
+
 	/* static_assert(sizeof(rnd) == 16); */
 
 	for (int i = 0; i < 10; i++) {
diff --git a/mkfs/mkfs.h b/mkfs/mkfs.h
index c93685d..4eadc96 100644
--- a/mkfs/mkfs.h
+++ b/mkfs/mkfs.h
@@ -32,6 +32,10 @@ struct exfat_mkfs_data_region {
 	void *data;
 };
 
+struct exfat_guid {
+	uint8_t b[16];
+};
+
 struct exfat_mkfs_info {
 	struct {
 		struct {
@@ -62,16 +66,18 @@ struct exfat_mkfs_info {
 	unsigned int volume_serial;
 
 	struct {
+		struct exfat_guid disk_guid;
+		struct exfat_guid part_guid;
+
 		void *mbr;
 		struct exfat_gpt_header *head_main;
 		struct exfat_gpt_header *head_backup;
 		struct exfat_gpt_entry *arr;
 		struct exfat_mkfs_data_region regions[EXFAT_GPT_DATA_REGION_CNT];
-	} gpt;
-};
 
-struct exfat_guid {
-	uint8_t b[16];
+		bool has_disk_guid:1;
+		bool has_part_guid:1;
+	} gpt;
 };
 
 struct exfat_gpt_header {
-- 
2.56.0

