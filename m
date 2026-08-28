Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E8442FAE
	for <exfat@lists.linux.dev>; Fri, 28 Aug 2026 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921536; cv=none; b=uh8hI4VxCUxwUOYrG36DQP8eiofr9S9Ugj3k01qNQs+1LQjj+MPmkngzpiGnrfRuQCd4KZrU1vzW1BRq9k7HFi/l2DfNKeolnEyDFw/qccSdqpZCcMapw//YzD1vQ1eP57E8zqIw+WpWDMAFdGMQYdBv7u8hZXAtxQVtIOY4aNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921536; c=relaxed/simple;
	bh=Lr/J4nGhI9HZ4GSCYB+anX3yEcdzujAGysyvFKQ/4YM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mj5L+prSx7+qsyW2fURAbah2LD25lLNYowYeuyMviHReo0eUDhuZIiUh5wDNZF6rZlRgL1sbaIXiG4SSo5Nlu2epr7wsCHShNovT81uRnJGu+gOWCNV8dYBqfof5LcxpeyXofyPn48fjBvzRfgmI4WIt3sYZ/jA9mWPUFJCPzSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3/F9pVA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3/F9pVA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d5cad1a6baso8042855ad.3
        for <exfat@lists.linux.dev>; Fri, 28 Aug 2026 05:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787921533; x=1788526333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6Y49Yh/U2ojB/h29Am3d6mLztrp1swbHOleDiTE2qg=;
        b=c3/F9pVA9P2DTWu+9ThapUyCokzkty6NjI6tPVQOIhnDPfWCUT3NcJIC5iNjEY+2XE
         3AdcAKo6nXIPT8iAPjulGQWX06XrGI8ACXJ+ArGwWalAVocsi9ODuLK1zDoPDMOcIzOW
         t0WU7IEoeoZq5uX0nC9fzpgEk8J/JXiB7Py96niIVzOKfEFJegSukSXVIT41pI5Llk+q
         k+TQXRC7sJPLC1CPa7Wjdoa8MHPUaeX8c9VlRD50C3CUwM5ntKnq9CdyjEX8iBZMNy0s
         ZvwJmW5lxRFYceZ27GVeBcqgZtIMc8it+111eYuM0pLFwHI+f3PHkydhA1VZOvbLW9XD
         EwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921533; x=1788526333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6Y49Yh/U2ojB/h29Am3d6mLztrp1swbHOleDiTE2qg=;
        b=VoAOvK9d5Ul/xTf+LJDquGEisgHtzN+9sHZv8qZY/no6stVpxLZjB2iGLSUVpNCTdG
         lQLVivwm+MrwBPSAFZis+QM8yzyDhb7P6v4wq/G+hyrXUhd3vrXVA4mNDsQLzft6XQrP
         u7jKt4UJUKxrhR9ICxOAXTYZx8DwV1DnUoGMTPG4f22UfogrKYnxHBSwPz0iVPYhCtTt
         0lscPpGjQG4eu4TXBkS/tSyz+cpgSREcjjYzYsCbPEdgBeltCNlECjBTidbfXz2OA+SI
         2hZzfQLmJDlrhQzeVaUYyyb3hVTJx3e38uAyrGrG3UHGSJORFl4tCyCXPG4q0G/kxuvH
         +ldA==
X-Forwarded-Encrypted: i=1; AHgh+RrekiW5Dmqs1H8ADIXNzmELmrG5KQ9oOdsrXLcesJ3ialWa5bEDsBm0MSeF8iCMExL0VQU8qA==@lists.linux.dev
X-Gm-Message-State: AFuF++kfGJUYionjVm6L1FgBLOfY1cKGYG+N/9WwAJztQEfenaOKV9JT
	lp6SMamIjnuHr9ThhVCuyCP2nVkYMggCMaDiGS0f8eAAUWV44zH35M9z
X-Gm-Gg: AR+sD10KWArRVgCv3OjI5F3lpFTz424k1dlPfxpdUXGviccya7bpEaouT/VhloXCyrs
	/ktglDKG94aVmIx7gBzb5Ld7FJYQ6n8kLvfRFgmGzLujZQhHWhjxtaZVk97N5BLW+57bAwWKmzD
	n/1QYBwo9uk1yM7rEGVilFZYXSCBcGiVmQHtTR5nK159/39ZGXq4P+uRCiW1oh/z5JMKcAqXwT/
	wBDDhSQRLfZOWNVxttXOfbqESexX+odwo7zzVd6zzdTVAWJ5KrvFU/+EtIWhkY5460Qh9pYYSnB
	RW/IgRCXE04QaMUo8ooD5wkrwvbH7Ehu+1jsG7rqy+OdrfbjOFRi0327RJzE+m8q1eOS4XXbAxr
	ScpwQsUG4PYY7rtJmKsy7jhTuaeug49wAaP7S7S8aEDPDTAqMSqYLOH+U0mEuz6Zl1ICi0nQAxk
	fbbCQvSxx8LBLISxladv5uObIecP/Uox5f5a+UO6cTPMI+lvVBHbA4XgfLIJ4JNavZPnDJchO9L
	g==
X-Received: by 2002:a17:903:2385:b0:2d6:df31:5bd0 with SMTP id d9443c01a7336-2d74deec50bmr145248605ad.10.1787921532632;
        Fri, 28 Aug 2026 05:52:12 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fbb27sm4761385ad.9.2026.08.28.05.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:52:12 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v2] exfat: validate vendor allocation directory entries
Date: Fri, 28 Aug 2026 20:51:54 +0800
Message-Id: <20260828125154.1104851-1-anmuxixixi@gmail.com>
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
 fs/exfat/dir.c   | 49 +++++++++++++++++++++++++++++++++++++++++++++---
 fs/exfat/namei.c |  3 ++-
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index fe73b1380c5d..fa9abedf4d84 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -678,11 +678,54 @@ enum exfat_validate_dentry_mode {
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
+	u64 max_size = exfat_cluster_to_bytes(sbi,
+			(u64)EXFAT_DATA_CLUSTER_COUNT(sbi));
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
@@ -836,7 +879,7 @@ int exfat_get_dentry_set(struct exfat_entry_set_cache *es,
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

