Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA762E229F
	for <exfat@lists.linux.dev>; Wed, 29 Jul 2026 02:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.80.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292004; cv=none; b=MOK90ah1aI0nXJdhZ3yZXhxNcPtU2F7SJN5jhwh9J4Xi1Oe4VIdLv+StQZbRnl8Jyjli/ne44QZTCmFrEztn9nBFCf93/I7MXHzqI5xHP+JJlQnrHEuQ1zn8TK4d3JCfDUuf1lMudjXaLvw1Ydv7kU0d1MRP5Dy9X8QZHFOD46I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292004; c=relaxed/simple;
	bh=b+OL+XHXq5O938cnPTFVZJ/T0MdsnNyfyNenUx+wkYU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QHxOAs6QYAlruPKkp/3MjkSkah3ti+f6hvc4oL9YCmzvIl+Qydy6Bs19vR4ZoccLDEXpnob2IxVwDT8VyihUZSaRapnFSHMie4bC5wYKScUi5qex2WnmuRKkPToI1qPnimFZ1GhxmHQDITx6G6Wt3THCccQn2ZQ99hvvYpf1JCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=TKf4Y1Df; arc=none smtp.client-ip=43.155.80.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="TKf4Y1Df"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1785291963;
	bh=+kC2rmXOTsN1qYrmT+Cmgmgca8sIJvBq47wGnCGOFvc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=TKf4Y1DfymQuyShpYU8inDyQvwEObBGnokExA38nCaozEj/GSw0HpXC/5HbTosZGG
	 g6AwZqm4bO8iOO7JBZtL0y41KhXQ/70RhmvGkUDvem8tUagpC2/dEVqKgK26A6PswM
	 zg6n4XGB6Wx4XGtLHTbr2IUFzpxcVnTjAMMKvRO8=
X-QQ-mid: zesmtpsz5t1785291947t4c08ec04
X-QQ-Originating-IP: M1xnfbH8Ou3tOnTU3G52kIyDBTjOUDtRpFpnKRWxsU0=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Jul 2026 10:25:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9844805559983529343
EX-QQ-RecipientCnt: 6
From: Yichong Chen <chenyichong@uniontech.com>
To: linkinjeon@kernel.org
Cc: sj1557.seo@samsung.com,
	yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH v2] exfat: clean up new entry on add entry failure
Date: Wed, 29 Jul 2026 10:25:43 +0800
Message-Id: <20260729022543.469171-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MIzUghsjsbalDAFyLKhRZv4TIKIribH1JSc4S7BUqHr04ZaUHBFgxXRQ
	LnHcDVeYgMOORBNSLIsAKHo/eSTfgllLtu7/t8J1GfXaLkvCp9QgFgfQK1MoyLILwf1G0Ke
	4z0n571Wt2v78rgvmabDSXg+N1s4e392/64L4C4W7/DUviTLgDOLy6T721WBOgmj58gFYXU
	j6+FHelLAJ+HbGT1rOEZAnmksVZrLkuvA3DSPoYAW658dvycpJ1UE+1+aGjD9m4aDnVN6mB
	OjT2SlFmZZqUstv8jjK+f9cl/6yfaYLxJS01w2EX1nQUb/MtzV/dV7rjd3ICyyn277ryTSM
	4Yft9OmEmru4cUd+VOsHCbwBVomPg3uD/GAO0b9H+0shAeyGfUpI0k3/eYiE7PhlTPWGekk
	3wHuhKoEG4KgbdL1dDs9Ua6UTtaT6Zeyxl5ufiZrO98QjmzvHJCRvn4ivyAWmbLyCScvxcA
	bHjZlWqpluZq13sSTXaOaD0eoPNeiA6EMtKDvjhM0Oy9iwYmKUvXH+LUx6IUe1IWHQkL4AG
	gXPFln/W1ejVj+rNgPPG/TZMXL5wACjYtL6wFDg98gfyP+dcpmnH9uwgZjHMKcWhliMpQHS
	eUcOzlV8grBQnryvKsotVIUeRIbn4sjmFJzDZriVPJZbNhPdX6dfpKzCoxeFomS/nZHlgzQ
	+jIRMUUD0RVoQKgWy5B7vFjhiGDxLenI0RVL9wWn1VUjio+GUQp/GMRLFZMtxB4of7YNnTj
	p4ijz1S/TWCYEtSuF6SaGF/ecGYrcMdjCSJadHh0i/M0hxutKyYiK2VmVqsbVot9/DCqO/q
	2oLpSAlyKJuJvrsQLgBqEyOik8zzygPR55KfjDFPxkP5AatRdFcEN+SV+v5nGJZDmxMx4l6
	l2xhrP9Gj+v9P5nZtTrD3FKL+/MddR6Up6vK9XvolFRpqzgBnSwR9hzc26WF14GVzqqLBSA
	PpYzJQOOTCfxs96fENVSHa007UyhQ/yxxoHMCt32Ny7ENsbQuP/X0OGJRgdvmtoIjKVbAAj
	C4gB606RGOR6SrcOuxafV7tEosZCw=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

exfat_add_entry() initializes a new directory entry set before writing it
with exfat_put_dentry_set().  If the write fails, mkdir/create returns an
error but a partially written entry may be left behind.

For non-zero-size directories, the failure also happens after a cluster
has been allocated for the new directory.  Clean up the new entry
best-effort, and free the newly allocated directory cluster only when the
cleanup writeback succeeds.  This avoids freeing a cluster that may still
be referenced by an on-disk entry if the cleanup fails.

Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
v2:
- Free the newly allocated directory cluster only after entry cleanup
  succeeds, as suggested by Namjae Jeon.

 fs/exfat/namei.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 038bc6fed681..a4dc83b5949c 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -471,6 +471,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	struct exfat_entry_set_cache es;
 	int clu_size = 0;
 	unsigned int start_clu = EXFAT_FREE_CLUSTER;
+	bool dir_allocated = false;
 
 	ret = exfat_resolve_path(inode, path, &uniname);
 	if (ret)
@@ -497,6 +498,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 		}
 		start_clu = clu.dir;
 		clu_size = sbi->cluster_size;
+		dir_allocated = true;
 	}
 
 	/* update the directory entry */
@@ -507,8 +509,21 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	exfat_init_ext_entry(&es, num_entries, &uniname, NULL, 0);
 
 	ret = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
-	if (ret)
+	if (ret) {
+		int cleanup_ret;
+
+		cleanup_ret = exfat_get_dentry_set(&es, sb, &info->dir,
+						   dentry, ES_ALL_ENTRIES);
+		if (!cleanup_ret) {
+			exfat_remove_entries(inode, &es, ES_IDX_FILE, false);
+			cleanup_ret = exfat_put_dentry_set(&es,
+							   IS_DIRSYNC(inode));
+		}
+
+		if (!cleanup_ret && dir_allocated)
+			exfat_free_cluster(inode, &clu);
 		goto out;
+	}
 
 	info->entry = dentry;
 	info->flags = ALLOC_NO_FAT_CHAIN;
-- 
2.51.0
