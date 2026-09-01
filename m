Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A322D38C42F
	for <exfat@lists.linux.dev>; Tue,  1 Sep 2026 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252159; cv=none; b=FeuioUbUMVUkRXca6/72N4+PNLmhVDwwabFo7mKhN8pxCp2OHJb4euN+vDG7/EyAoAE74nfaXbZWmK+aM1WifJRfRnBUdOlIt9DsiJbmcHNRIFiROkS3wgw8AGC2GPPmwup3My1SgxRou0wVYmNQXGIkz8tJ1ZXSzd6DkX4zbEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252159; c=relaxed/simple;
	bh=Mp9L1Mkd/gFKpsrn/k/XMqgbUYslDFL/aOv3FD6xWNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q4Pp9OjDSB0ZVxE+zaRkHqqpjZR/1NRGDM4prEdmRNHJK8VSh0MZP2UgVeKnbMUCCS3j0B7zrKZENu+wlEf9vxSJ+gEHi15cjjfTXQEwHvfwnsn0eRnsO2DeD+UfM3XCNyowJi69kHxpW2gClh82HlFlof89CCXOiR343IQKhwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=sekJD3fq; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="sekJD3fq"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 385411D452;
	Tue,  1 Sep 2026 08:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 385411D452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788252156; bh=Mp9L1Mkd/gFKpsrn/k/XMqgbUYslDFL/aOv3FD6xWNc=;
	h=From:To:Cc:Subject:Date:From;
	b=sekJD3fqG+VdR/o6pzpvn6JE233pWZr0e4q68BA9nzZKw5RKAUNajzZKIgLg/6Ugy
	 Joa2ah2okDp9VrgEC3uPLTmoCz7/Jg7OIx+VoTZo0kqmNxmIAkMKT1MXE8t4R60sYn
	 cyJYrXGJ4w5mpOte4StA9logL8q+rBjR5O8Sbqt8=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id 6+XbNvqPlmqF+QMA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Tue, 01 Sep 2026 08:42:35 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 1/2] libexfat, fsck: add volume flags definitions
Date: Tue,  1 Sep 2026 08:42:18 +0000
Message-ID: <20260901084219.39898-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the rest of volume flags(ACTIVE_FAT, DIRTY, MEDIA_FAILURE,
CLEAR_TO_ZERO) from the exFAT volume format specs for cleaner code and
upcoming features.

Use VOL_DIRTY instead of the magic value(0x02) in fsck.c.

No functional change.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 fsck/fsck.c            | 4 ++--
 include/exfat_ondisk.h | 7 ++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index f1934d0..5447154 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -370,9 +370,9 @@ static int exfat_mark_volume_dirty(struct exfat *exfat, bool dirty)
 
 	flags = le16_to_cpu(exfat->bs->bsx.vol_flags);
 	if (dirty)
-		flags |= 0x02;
+		flags |= VOL_DIRTY;
 	else
-		flags &= ~0x02;
+		flags &= ~VOL_DIRTY;
 
 	exfat->bs->bsx.vol_flags = cpu_to_le16(flags);
 	if (!exfat_write_full(exfat->blk_dev->dev_fd, exfat->bs, sizeof(struct pbr), 0)) {
diff --git a/include/exfat_ondisk.h b/include/exfat_ondisk.h
index dde84d6..fdb29de 100644
--- a/include/exfat_ondisk.h
+++ b/include/exfat_ondisk.h
@@ -38,8 +38,13 @@
 
 #define PBR_SIGNATURE		0xAA55
 
-#define VOL_CLEAN		0x0000
+/* Volume flags masks */
+
+#define VOL_ACTIVE_FAT		0x0001
 #define VOL_DIRTY		0x0002
+#define VOL_MEDIA_FAILURE	0x0004
+#define VOL_CLEAR_TO_ZERO	0x0008
+#define VOL_RESERVED		0xFFF0
 
 #define DENTRY_SIZE		32 /* directory entry size */
 #define DENTRY_SIZE_BITS	5
-- 
2.55.0

