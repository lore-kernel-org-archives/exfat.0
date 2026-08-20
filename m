Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0B37DE89
	for <exfat@lists.linux.dev>; Thu, 20 Aug 2026 15:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238331; cv=none; b=VEcLV/ECRA4AR5jmUGqdvRPBlH4KAecn324ERS+wlIMnTRQVaQeZuctuvQEUqGeGV3hIDb56B88jMiCngmoYPRKdolzRfZ0QijFlq2aEWszJe+xgK9EK/zA4CF7dVVWzcjYniCAHYNmL+t0k9t6mjwq2sUGzye6PwnT6DRF9ifg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238331; c=relaxed/simple;
	bh=fMYxSuCY6iGRFI2KgAN8qOHp2QzpJGCm5lUftP+6Bg8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A59Ym5xi/DP0+L1lI5699T7OI3u5kP0uIftR3QRS+ACp9FbecEWZenShLZaOacbYxjG2Yj4adSaLe2vGCLQahKm+Ukaud5hZvS0ZwFd6e7OlWy29QuFPY8HY5zlmbxwsyaNcEEixwQ8LRiqw0IYwXLH3psjiGT2o84lO/IofJBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvD/d/Pj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvD/d/Pj"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84eb992a881so1874350b3a.2
        for <exfat@lists.linux.dev>; Thu, 20 Aug 2026 08:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787238329; x=1787843129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqAf/q7AmWO4rJpKMJoDO/uFBbFBe1Gy+Wc1TuBqrgQ=;
        b=GvD/d/PjuxxW/E/7tFh7IAxpJPUIhOd+KYcuY+hDBTjn4Awy6bph70uZvIBAx3Yoq0
         +MPggFLKaH2FVsKXUQYzqV2XOyinUfE8895AJ4qmt4bIMgOnBPdjqZnwXlKLsf+het+D
         GGOI1GClfgWOQKSxkM4ML7ayPWtYL2B71AyJltSOWKrKKoRALXb1Fn96XVwRELkdklw5
         EqdXLU7SkwIwwOkZjHrOjgHWh08TO2NOd4ipu8vFK0vlWPL6ACCT6OTqWf46JOSa5wNt
         KyJHOe7XfSXqYiqIOzK7zdQLUK0LRrSnsdc9oeh1quFXqwRbveBlhCW7qHF21b9jd7f0
         mS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787238329; x=1787843129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqAf/q7AmWO4rJpKMJoDO/uFBbFBe1Gy+Wc1TuBqrgQ=;
        b=Wo4tABWVqbCHb+PDJiVR+ipyDKcIfm2lfNUDn1M6vLCRRlnIC0HWFC8Qv3rA/22YB9
         1OUtkyn0LPO4kujWLOPbyVE0HLzml+kexgaa7haMdNFZGWIMOwQSl4z7oOKNWOktRKrp
         owb6DSdNnKCsPkYmHEGUILxDofBp2u2njZITpWmlbSdbUn5terewWzRyhPAYPK7GFWrf
         mDE5hXTjOO6hxIx9vGBVIUd/uz4JZrQJaRA62PvQWmdTfpTCLprLJQiyVxBKTDFxzDKs
         FI5mp1Y1ESO7Pe9zUeCbVsBLdXBSR7cdez0hGFeP9/6F8mDl8+/WHTlPvf6przjy+g/6
         bQyg==
X-Forwarded-Encrypted: i=1; AHgh+RrjO/rwTRifsoONfCoqyqLqEGj+oq2981l77xI7tA73g8z5a3FeagWE8FazDtJZ/z5LnaHa4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyHiKqqNdFLdqHA/AARF0khdqGmUG1JMtg29mNA/TvUWPfdRD8
	0elkLqfyfdB3cevwmtUrhuFae8gZyGY3KEeiOmPald5iGNwqyt9AU7d5
X-Gm-Gg: AR+sD12snChz3I8aJH/JHQuHI/EumHUqKYLADEcrR6cg6aO7+jrRD43NtmxDM0YyMYw
	X0tSi2xiZOztADCaNdSh6PM6H3JVxZA3bikfZ3XYUIF3r3SQqRR7QUav6JQZGe0qb/qZ2mkIhrM
	DUfcAPsAe3rwOGLVVJ3WmdvjRuBda1QMKwKcty3emTKFbGRxCqYuxq2nZhA7nwz7ZSXUDkEAKhV
	+Vs48XKklZI+nFgEOUm8tKccRaExDWLdiz/R6uD9QCcJKME6qCp+5Yvzxrp+EvZJvGCRYEFsT7f
	5xJEG2mXZ/rq68z4/Jfykgq5fcVLmTbPxIuywt0g77hxNjKVVJyl2L+B8z02gChIchpQstBNTp2
	WBfbgTFOCTdYa06gWrBkfJCWiR7rj94vXdN4pzdaJD06NVKakR2y1SgGjftleek9ETIxkfsE83c
	cAWXgqldQtTbEiZMYNp+Aq2IDRuSLz25qaXlKSApWUHbg8Xzj3rFa/YqwuJAp/A/DqrpFeOqdit
	A==
X-Received: by 2002:a05:6a00:368f:b0:84e:f90e:492f with SMTP id d2e1a72fcca58-851d382f530mr24516163b3a.7.1787238329115;
        Thu, 20 Aug 2026 08:05:29 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3618744sm1784982b3a.33.2026.08.20.08.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 08:05:28 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH] exfat: validate vendor allocation directory entries
Date: Thu, 20 Aug 2026 23:05:08 +0800
Message-Id: <20260820150508.736275-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exfat entry validator checks the type and ordering of benign secondary
entries, but does not validate Vendor Allocation entry fields. In addition,
exfat_find() reads only the first two entries, allowing malformed trailing
Vendor Allocation entries to bypass validation.

Validate the allocation flags, VendorGuid, FirstCluster, DataLength, and
NoFatChain extent. Read the complete entry set during lookup so malformed
Vendor Allocation entries are rejected.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c   | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 fs/exfat/namei.c |  3 ++-
 2 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index fe73b1380c5d..951261bd8e55 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -678,11 +678,53 @@ enum exfat_validate_dentry_mode {
 	ES_MODE_GET_BENIGN_SEC_ENTRY,
 };
 
-static bool exfat_validate_entry(unsigned int type,
-		enum exfat_validate_dentry_mode *mode)
+static bool exfat_validate_vendor_alloc(struct super_block *sb,
+		struct exfat_dentry *ep)
+{
+	struct exfat_sb_info *sbi = EXFAT_SB(sb);
+	u8 flags = ep->dentry.vendor_alloc.flags;
+	u32 start_clu = le32_to_cpu(ep->dentry.vendor_alloc.start_clu);
+	u64 size = le64_to_cpu(ep->dentry.vendor_alloc.size);
+	u64 max_size = EXFAT_CLU_TO_B((u64)EXFAT_DATA_CLUSTER_COUNT(sbi), sbi);
+	u64 num_clusters;
+
+	/* AllocationPossible is required for Vendor Allocation entries. */
+	if (!(flags & ALLOC_POSSIBLE))
+		return false;
+
+	/* The null GUID does not identify a valid vendor allocation. */
+	if (!memchr_inv(ep->dentry.vendor_alloc.vendor_guid, 0,
+			sizeof(ep->dentry.vendor_alloc.vendor_guid)))
+		return false;
+
+	if (!start_clu)
+		return !size && !(flags & (ALLOC_NO_FAT_CHAIN ^ ALLOC_FAT_CHAIN));
+
+	if (!is_valid_cluster(sbi, start_clu) || size > max_size)
+		return false;
+
+	if ((flags & ALLOC_NO_FAT_CHAIN) == ALLOC_NO_FAT_CHAIN) {
+		if (!size)
+			return false;
+
+		num_clusters = DIV_ROUND_UP_ULL(size, sbi->cluster_size);
+		if (num_clusters > sbi->num_clusters - start_clu)
+			return false;
+	}
+
+	return true;
+}
+
+static bool exfat_validate_entry(struct super_block *sb,
+		struct exfat_dentry *ep, enum exfat_validate_dentry_mode *mode)
 {
+	unsigned int type = exfat_get_entry_type(ep);
+
 	if (type == TYPE_UNUSED || type == TYPE_DELETED)
 		return false;
+	if (type == TYPE_VENDOR_ALLOC &&
+	    !exfat_validate_vendor_alloc(sb, ep))
+		return false;
 
 	switch (*mode) {
 	case ES_MODE_GET_FILE_ENTRY:
@@ -836,7 +878,7 @@ int exfat_get_dentry_set(struct exfat_entry_set_cache *es,
 	/* validate cached dentries */
 	for (i = ES_IDX_STREAM; i < es->num_entries; i++) {
 		ep = exfat_get_dentry_cached(es, i);
-		if (!exfat_validate_entry(exfat_get_entry_type(ep), &mode))
+		if (!exfat_validate_entry(sb, ep, &mode))
 			goto put_es;
 	}
 	return 0;
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index a4dc83b5949c..80f60e80786e 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -645,7 +645,8 @@ static int exfat_find(struct inode *dir, const struct qstr *qname,
 	info->entry = dentry;
 	info->num_subdirs = 0;
 
-	if (exfat_get_dentry_set(&es, sb, &cdir, dentry, ES_2_ENTRIES))
+	/* Validate the complete set, including recognized benign entries. */
+	if (exfat_get_dentry_set(&es, sb, &cdir, dentry, ES_ALL_ENTRIES))
 		return -EIO;
 	ep = exfat_get_dentry_cached(&es, ES_IDX_FILE);
 	ep2 = exfat_get_dentry_cached(&es, ES_IDX_STREAM);
-- 
2.34.1

