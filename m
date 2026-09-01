Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AEB1D5CC9
	for <exfat@lists.linux.dev>; Tue,  1 Sep 2026 08:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252160; cv=none; b=nYWn0hbIZ2WNwx1L/plWDpeyItOXROWdHZufDPkQJLtHYGxEINWjHBNR8cBzR7y7UBTjZ/IbqTCDWVgbaaaxZ2A3zX+uQ3ErtIUQtLi9nUTESA98NVJWgF9iF8yJFJBdTiPLYZp5skn44wrA7CPB4BQBxqUXHY0PNH/T7q14zfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252160; c=relaxed/simple;
	bh=l18wPYBZtorPEnF3LGVRByugKovE50WaDTgmXLgQ39I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lamkXXUAhq2N7zGLCRFYDcdMLQ3pW4tnd2vOi0XnykriEbgudN09hPPndTKhuKoCXU2aoXW3KyL5pdo450RXNa8J/2MMtpXErWzz3C05TzvLKfOH+SrOYf4+gm0fybr7FWUMhx3z9d4fi6BazpBUYyAqmNzV+N8kUwnn4OiJWrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=YJI2yhfw; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="YJI2yhfw"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 696EF1D454;
	Tue,  1 Sep 2026 08:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 696EF1D454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788252157; bh=l18wPYBZtorPEnF3LGVRByugKovE50WaDTgmXLgQ39I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YJI2yhfw+/WQ6uj37PKxveWFWhuozX+pP9OzBFIG2QPFk2yERIjTGFfO3QOjrg2SO
	 IQf+agX2LnmfXHF75JxVLjewol6ngWzM+CR30t5LEyf9Gu2vrN4dCYB7sDAUwlr3rj
	 T0rhsH5hR9Th7I9JQguM8+9ce57hoDjmLfSwye/0=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id 6+XbNvqPlmqF+QMA8KYfjw:T2
	(envelope-from <dxdt@dev.snart.me>); Tue, 01 Sep 2026 08:42:36 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 2/2] dump: show all fields of exFAT volume header
Date: Tue,  1 Sep 2026 08:42:19 +0000
Message-ID: <20260901084219.39898-2-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901084219.39898-1-dxdt@dev.snart.me>
References: <20260901084219.39898-1-dxdt@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print the rest of the values in the volume header

  - fs_version: as 2-byte raw hex values
  - vol_flags: the four bit flags as attribute strings, the rest of the
    reverve bytes as 2-byte hex values
  - num_fats
  - phy_drv_no: as 1-byte hex value
  - perc_in_use
  - reserved2: as 7-byte hex values

Especially, being able to inspect vol_flags without mounting the volume
or through hexdump should be incredibily useful. Other niche fields that
are almost never used like num_fats, fs_version and ACTIVE_FAT should be
useful for catching weird non-standard exFAT implementations in the
wild.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 dump/dump.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index d55d561..efa892a 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -86,6 +86,17 @@ static int exfat_read_dentry(struct exfat *exfat, struct exfat_inode *inode,
 	return 0;
 }
 
+#define VOLUME_FLAGS_STR_SIZE (46)
+
+static void volume_flags_tostr(const uint16_t vol_flags, const size_t size, char *out)
+{
+	snprintf(out, size, "%s%s%s%s",
+		vol_flags & VOL_ACTIVE_FAT ?	"ACTIVE_FAT " :		"",
+		vol_flags & VOL_DIRTY ?		"DIRTY " :		"",
+		vol_flags & VOL_MEDIA_FAILURE ?	"MEDIA_FAILURE " :	"",
+		vol_flags & VOL_CLEAR_TO_ZERO ?	"CLEAR_TO_ZERO " :	"");
+}
+
 static int exfat_show_fs_info(struct exfat *exfat)
 {
 	struct pbr *ppbr;
@@ -98,6 +109,8 @@ static int exfat_show_fs_info(struct exfat *exfat)
 	int ret;
 	char *volume_label;
 	off_t off;
+	char vol_flags_str[VOLUME_FLAGS_STR_SIZE];
+	uint16_t vol_flags;
 
 	ppbr = exfat->bs;
 	if (memcmp(ppbr->bpb.oem_name, "EXFAT   ", 8) != 0) {
@@ -120,6 +133,10 @@ static int exfat_show_fs_info(struct exfat *exfat)
 		return -EINVAL;
 	}
 
+	vol_flags = le16_to_cpu(pbsx->vol_flags);
+	vol_flags_str[0] = 0;
+	volume_flags_tostr(vol_flags, sizeof(vol_flags_str), vol_flags_str);
+
 	bd->sector_size_bits = pbsx->sect_size_bits;
 	bd->sector_size = 1 << pbsx->sect_size_bits;
 
@@ -128,18 +145,24 @@ static int exfat_show_fs_info(struct exfat *exfat)
 	root_clu = le32_to_cpu(pbsx->root_cluster);
 
 	exfat_info("-------------- Dump Boot sector region --------------\n");
-	dump_field("Volume Length(sectors)", "%" PRIu64,
-			le64_to_cpu(pbsx->vol_length));
-	dump_field("FAT Offset(sector offset)", "%u",
-			le32_to_cpu(pbsx->fat_offset));
-	dump_field("FAT Length(sectors)", "%u",
-			le32_to_cpu(pbsx->fat_length));
+	dump_field("Volume Length(sectors)", "%" PRIu64, le64_to_cpu(pbsx->vol_length));
+	dump_field("FAT Offset(sector offset)", "%u", le32_to_cpu(pbsx->fat_offset));
+	dump_field("FAT Length(sectors)", "%u", le32_to_cpu(pbsx->fat_length));
 	dump_field("Cluster Heap Offset (sector offset)", "%u", clu_offset);
 	dump_field("Cluster Count", "%u", total_clus);
 	dump_field("Root Cluster (cluster offset)", "%u", root_clu);
 	dump_field("Volume Serial", "0x%x", le32_to_cpu(pbsx->vol_serial));
+	dump_field("Version", "%02x%02x", pbsx->fs_version[0], pbsx->fs_version[1]);
+	dump_field("Volume Flags", "%s%04x", vol_flags_str, vol_flags & VOL_RESERVED);
 	dump_field("Bytes per Sector", "%u", 1 << pbsx->sect_size_bits);
 	dump_field("Sectors per Cluster", "%u", 1 << pbsx->sect_per_clus_bits);
+	dump_field("Number of FATs", "%u", pbsx->num_fats);
+	dump_field("Drive Select (advisory)", "%02x", pbsx->phy_drv_no);
+	dump_field("Percent in Use (advisory)", "%u", pbsx->perc_in_use);
+	dump_field("Reserved", "%02x%02x%02x%02x%02x%02x%02x",
+			pbsx->reserved2[0], pbsx->reserved2[1], pbsx->reserved2[2],
+			pbsx->reserved2[3], pbsx->reserved2[4], pbsx->reserved2[5],
+			pbsx->reserved2[6]);
 
 	bd->cluster_size =
 		1 << (pbsx->sect_per_clus_bits + pbsx->sect_size_bits);
-- 
2.55.0

