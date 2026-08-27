Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5B0385D6A
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863320; cv=none; b=ddHkKX5oGmGOG4c7TRivrIPy0UMhe+jHyfh/ZlOg7tVtjqPhBweL3QvNm/5A6NRmJBoilMBNqwtvALjGv2f4IE1xHBk3B+jxaavw6UlNcmlsy8QExI+JyaHoi6h09Nvci0hxPsvEDB+xUohVvt5yTinC/rs8lGoCsnICPR6G7fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863320; c=relaxed/simple;
	bh=QXcrRku7MjDn1264OY5o2ugt2l6IOHyNgUibjWA7WvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LF/imqV+ilykHwlpKbmG/CeBCRFziOkNkV6kGJN9YOhvIr31NWs91xAIKfdx0PjW3/t/KUPdAyYAJ8ALcS+e0IaBKKBu4lRvVUTdY/cuPuQ/OxHoS5Tc3qNeKQcJQ1vzNxJI0VBsAhf/FYgySdm+PmW1qoXj9+Gu+DVIHo933UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=YRjx/ZRq; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="YRjx/ZRq"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 1AC8727B37;
	Thu, 27 Aug 2026 20:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 1AC8727B37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787863303; bh=QXcrRku7MjDn1264OY5o2ugt2l6IOHyNgUibjWA7WvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YRjx/ZRqOFZaMAQBwfmwbgi4KqL0X0tdFKmSSZT8SKjNYEZvB+50HQ5OcFpyeoUkn
	 6MUMFX32iNla52EvJjdpwLFyi7Q5SBOHyiXEQp/9/SRu74dRHMm29G5iZ9tBRLYkAX
	 x33vzjzBgvRU9fD6/JmlYowprlC88HNIVmdYRBU8=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id rDNIOvygkGosiAIA8KYfjw:T8
	(envelope-from <dxdt@dev.snart.me>); Thu, 27 Aug 2026 20:41:41 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 7/8] mkfs: use BLKZEROOUT for disk zeroing out
Date: Fri, 28 Aug 2026 05:39:53 +0900
Message-ID: <20260827204056.222099-8-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827204056.222099-1-dxdt@dev.snart.me>
References: <20260827204056.222099-1-dxdt@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To prevent meaningless buffer copy from userspace to kernel for zeroing
out the entire disk, use BLKZEROOUT ioctl.

If the underlying transport protocol has efficient method of conveying
zeros such as SCSI WRITE_SAME and NVME Write Zeroes, the underlying
kernel driver should be able to use the command to zero out the regions
of the storage device. If not, the kernel should fallback to issuing
write command with buffer filled with zeroes which is still a win since
no significant amount of data is copied between the user and kernel
space.

Abstract the existing stepping algorithm as the new function
iterate_over_disk() for BLKDISCARD and BLKZEROOUT. Select the write size
using a crude linear algorithm based on the size of the target device.
The possible values are generally much larger than the previous fixed
value(cluster size) for greater efficiency.

If run with the option -q, be quiet. If the option -v is used more than
once, interpret that as raising the print level to and above
EXFAT_TRACE0. In order to trace the progress of BLKDISCARD and
BLKZEROOUT of the entire disk, run `mkfs.exfat -vv ...`

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 mkfs/mkfs.c | 165 ++++++++++++++++++++++++++++++++++++----------------
 mkfs/mkfs.h |   1 +
 2 files changed, 115 insertions(+), 51 deletions(-)

diff --git a/mkfs/mkfs.c b/mkfs/mkfs.c
index 58f8ace..ea67bf5 100644
--- a/mkfs/mkfs.c
+++ b/mkfs/mkfs.c
@@ -1135,29 +1135,124 @@ static int exfat_build_mkfs_info(struct exfat_blk_dev *bd, struct exfat_user_inp
 	return 0;
 }
 
+/*
+ * The block discarding/zeroing happens in smaller batches so it can be
+ * interrupted prematurely
+ */
+static int iterate_over_disk(int fd, uint64_t len, const uint64_t step,
+		int (*foreach_step)(int fd, uint64_t start, uint64_t len),
+		const char *human_name, const char *api_name)
+{
+	uint64_t offset = 0;
+	uint64_t tmp_step;
+	int err;
+
+	/* The same check seen in the kernel */
+	assert(step && (step & 511) == 0);
+
+	while (offset < len) {
+		tmp_step = len - offset;
+		if (step < tmp_step)
+			tmp_step = step;
+
+		err = foreach_step(fd, offset, tmp_step);
+		/*
+		 * We intentionally ignore errors from the ioctl. It is not
+		 * necessary for the mkfs functionality but just an
+		 * optimization. However we should stop on error.
+		 */
+		if (err == 0) {
+			if (offset == 0) {
+				if (human_name != NULL)
+					exfat_info("%s blocks: ", human_name);
+				exfat_debug("%s: ", api_name);
+			}
+			exfat_trace(0, "%"PRIu64"-%"PRIu64"\n", offset, offset + tmp_step);
+			fflush(stdout);
+		} else {
+			exfat_debug("%s: %s\n", api_name, strerror(err));
+			if (offset > 0 && human_name != NULL)
+				exfat_info("\n");
+			return err;
+		}
+
+		offset += tmp_step;
+	}
+	if (offset > 0 && human_name != NULL)
+		exfat_info("done\n");
+
+	return 0;
+}
+
 static int exfat_zero_out_disk(struct exfat_blk_dev *bd,
-		struct exfat_user_input *ui)
+		struct exfat_user_input *ui, const bool quiet)
 {
 	int ret = 0;
 	bool mapped = false;
 	const void *zm = NULL;
-	const size_t iosize = ui->cluster_size;
+	size_t iosize;
 	unsigned long long target_zerolen;
 
-	assert(iosize > 0);
+	assert(ui->cluster_size > 0);
 
 	if (ui->quick)
 		target_zerolen = MIN(bd->size, EXFAT_HEAD_ZERO_OUT);
 	else
 		target_zerolen = bd->size;
 
-	exfat_info("Zeroing out %llu bytes: ", target_zerolen);
-	fflush(stdout);
+	if (!quiet) {
+		exfat_info("Zeroing out %llu bytes: ", target_zerolen);
+		fflush(stdout);
+	}
 
+	if (bd->isblk) {
+/*
+ * When mmap() fails, the memory will be calloc()'d so we can't be so generous
+ * here.
+ *
+ * The write speed of SSDs goes up to few TB's. 32MB may seem so small, but
+ * that's still 32K syscalls/NVME commands per second, which is not that much on
+ * modern systems.
+ *
+ * Can't go over 64MB because modern consumer HDDs are still stuck at ~100MB/s.
+ */
+		if (bd->size >= 1024ULL * GB)
+			/* >= 1TB: 32MB */
+			iosize = 32 * MB;
+		else if (bd->size >= 256ULL * GB)
+			/* >= 256GB: 16MB */
+			iosize = 16 * MB;
+		else if (bd->size >= 64ULL * GB)
+			/* >= 64GB: 8MB */
+			iosize = 8 * MB;
+		else
+			/* 1MB("legacy" devices) */
+			iosize = 1 * MB;
+
+/*
+ * Notes on cache coherency issues with BLKZEROOUT ioctl
+ *
+ * Historically, it seems that the Linux kernel suffered from cache coherency
+ * issues with BLKZEROOUT. However, it shouldn't affect mkfs.exfat because mkfs
+ * doesn't read the existing data on the target device after performing foreign
+ * filesystem detection. Except for the case of -C option, mkfs only writes to
+ * the device. For -C option, mkfs accesses the device via O_DIRECT so it's not
+ * affected by the cache coherency issue.
+ *
+ * Link: https://lwn.net/Articles/702632/
+ */
+		ret = iterate_over_disk(bd->dev_fd, target_zerolen, iosize,
+				exfat_zeroout_blocks, NULL, "BLKZEROOUT");
+		if (ret == 0)
+			goto done;
+	}
+
+	/* File and ENOTTY fallback: this is buffered I/O */
+	iosize = ui->cluster_size;
 	ret = exfat_write_zero2(bd->dev_fd, target_zerolen, 0, iosize);
 	if (ret)
 		goto out;
-
+done:
 	if (ui->verify) {
 		off_t ofs = 0, rem = target_zerolen;
 
@@ -1185,7 +1280,8 @@ out:
 	if (ret)
 		exfat_err("write failed(errno : %d)\n", errno);
 	else {
-		exfat_info("done\n");
+		if (!quiet)
+			exfat_info("done\n");
 		exfat_debug("zero out written size : %llu\n", target_zerolen);
 	}
 
@@ -1270,53 +1366,17 @@ alloc_err:
 }
 
 static void exfat_discard_dev(struct exfat_blk_dev *bd,
-		struct exfat_user_input *ui)
+		struct exfat_user_input *ui, const bool quiet)
 {
-	uint64_t offset = 0;
-	uint64_t tmp_step;
-	int err;
-	/* Discard the device 2G at a time */
-	const uint64_t step = 2ULL << 30;
-	const uint64_t count = bd->num_sectors * bd->sector_size;
-
 	if (!ui->discard || !bd->isblk) {
 		exfat_debug("no-discard requested or the device is a file\n");
 		return;
 	}
 
-	/*
-	 * The block discarding happens in smaller batches so it can be
-	 * interrupted prematurely
-	 */
-	while (offset < count) {
-		tmp_step = count - offset;
-		if (step < tmp_step)
-			tmp_step = step;
-
-		err = exfat_discard_blocks(bd->dev_fd, offset, tmp_step);
-		/*
-		 * We intentionally ignore errors from the discard ioctl. It is
-		 * not necessary for the mkfs functionality but just an
-		 * optimization. However we should stop on error.
-		 */
-		if (err == 0) {
-			if (offset == 0) {
-				exfat_info("Discarding blocks: ");
-				exfat_debug("BLKDISCARD: ");
-			}
-			exfat_debug("%"PRIu64"-%"PRIu64" ", offset, offset + tmp_step);
-			fflush(stdout);
-		} else {
-			exfat_debug("BLKDISCARD: %s\n", strerror(err));
-			if (offset > 0)
-				exfat_info("\n");
-			return;
-		}
-
-		offset += tmp_step;
-	}
-	if (offset > 0)
-		exfat_info("done\n");
+	/* Discard the device 2G at a time */
+	iterate_over_disk(bd->dev_fd, bd->size, 2ULL << 30,
+			exfat_discard_blocks, quiet ? NULL : "Discarding",
+			"BLKDISCARD");
 }
 
 static int make_exfat(struct exfat_blk_dev *bd, struct exfat_user_input *ui)
@@ -1560,7 +1620,10 @@ int main(int argc, char *argv[])
 			quiet = true;
 			break;
 		case 'v':
-			print_level = EXFAT_DEBUG;
+			if (print_level < EXFAT_DEBUG)
+				print_level = EXFAT_DEBUG;
+			else
+				print_level++;
 			break;
 		case '?':
 		case 'h':
@@ -1652,13 +1715,13 @@ int main(int argc, char *argv[])
 	if (ret)
 		goto out;
 
-	exfat_discard_dev(&bd, &ui);
+	exfat_discard_dev(&bd, &ui, quiet);
 	/*
 	 * Zeroing out still needs to be conducted as per JESD84-B51 6.6.9:
 	 * "content of an explicitly erased memory range shall be ‘0’ or ‘1’
 	 * depending on different memory technology,"
 	 */
-	ret = exfat_zero_out_disk(&bd, &ui);
+	ret = exfat_zero_out_disk(&bd, &ui, quiet);
 	if (ret)
 		goto out;
 
diff --git a/mkfs/mkfs.h b/mkfs/mkfs.h
index ffebf82..c93685d 100644
--- a/mkfs/mkfs.h
+++ b/mkfs/mkfs.h
@@ -10,6 +10,7 @@
 
 #define MIN_NUM_SECTOR			(2048)
 #define EXFAT_MAX_CLUSTER_SIZE		(32*1024*1024)
+/* MUST be multiple of 512 */
 #define EXFAT_HEAD_ZERO_OUT		(0x10000)
 
 #define EXFAT_GPT_ENTRY_SIZE		(128UL)
-- 
2.55.0

