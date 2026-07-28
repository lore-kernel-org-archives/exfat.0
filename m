Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D992673AA
	for <exfat@lists.linux.dev>; Tue, 28 Jul 2026 05:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218149; cv=none; b=lnTYSIwxEQAw1qjYjxFuT53OE516DGu9bV7JqEU4l5+3m+eEIbGMDrZmSnVTaytAnHtAO4AGTY6JJpa05iSWfdxv95M2OPKrCXmoKj12XRbXbvgF5DqrDMxX3HP0Wcux85JNok39O0XSjFi1kNLEm6rLp6qLu1lQvX2t5VgL/cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218149; c=relaxed/simple;
	bh=PVFNsjXy3KhevkCqjqpwcQn+bOimS5eeFrgHtz5cPvU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RoeFqTPIWZuou+jMnVfDXDXALlqZlDF7q+R7aR6w412wYTgK4kEodrbCFv8TL6ndOuxVl9+a2eZfDKGmQFKG+Kq+pzS12PtqjPSr++xHdATyuS8DdO2sfIP4AtazzzjVZWLnXuiWCTCs2TNS+61wVb+yu/xyRrINh+Nldg0UnTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=b2H2aucw; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="b2H2aucw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1785218124;
	bh=XRgXKrW/jRdFKYjQLUAA/7JzT4IZsGcpKP0YjSK/9hg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=b2H2aucwI4OlwPIULf6SE+J4ykhblOGt+nvL0Itq2n73CYM0RW+DnqvuabMXQH3F0
	 eVU6kboTgB6nB0thnC70gqkMbaN3POrsF+slZGkThoRkS9I7C7K0sKRJ61L/5vwzin
	 lyvUY8cWH5YanGALVCmT/eh5UuZeZ2psCc0QsDKI=
X-QQ-mid: zesmtpgz5t1785218107tbc766ac6
X-QQ-Originating-IP: lz1KmpGRMzc/GtvZn0nouWuqmgOJuK8cHchzYh3BoOk=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Jul 2026 13:55:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4916161328863682001
EX-QQ-RecipientCnt: 6
From: Yichong Chen <chenyichong@uniontech.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] exfat: clean up new entry on add entry failure
Date: Tue, 28 Jul 2026 13:55:04 +0800
Message-Id: <20260728055504.412284-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OUwDEvzsARlMqfQ0TmF/Qa/Rk4c1HitDu8OcoiInuJG2w18obAfYeqnx
	+TLJnK+0VH/ACUzbEMqILlGMk6z2cZhtHuO0mTW8FgoRptM5KIdFr2hCCK7hl8jK1Q5XjtA
	xXEYYu+XWocKZhlZxTd5Tth49d/+oOoCKIldlcbMs/GmGbHurNTtf22WVLpqofi3/p30bWI
	idX26GrMuv06r57h7qqg4DbmHFIGfWUVycYcv+43zyKefFhZTSN9ZzbretcJWhzQDpSvWjc
	AVUDDeATA9svnH4RmkH+hG9YU9YG8qoq58+W7lQ8KzTTr4jWMhm/LMfhsEscbLqBG3Eqtb9
	HB0oruapAKHryhnWBcV41Gjc6afLiVEyJSAaVHSjcrEeKdclqjeGOGbf/V67zoMU2rKjL2C
	U9BReCI+IvGTRLe1LqjZlicTjHBXHAgJoQ9si2VSdG9rMxjN/D9YjdGOadDDcYN+3ov+D3F
	lt5BVvnrSkbD/pjDMIMsgbj7bk4zX181OgmsRFHrtmyhEcR0/CDGYtjZeZAsdGUDOE5ImOt
	voylVowwwl5h/6Z2InotuFmvLdYcf3psLhQSECTORnvCq4qGVbvOj9v8IpfDhwS1W5oOFry
	u+PAk9YMJaLTrUyU1Ux3r+AdayaCMxbfsUvKiLN5Quvw0tS+jrvQ1ZLT64OTKC8uwMesGLE
	23//Quzg7h4zVDAo51TWlVU27Fc1fpy3w59Dh7cGNDOWYg1VZlkNgTLKGdFx1c9GH4iTQyl
	D/ljzeGs8+HRr2zyI8CXUPe3vME/emAsa7N/yHTVgokqX6zGHm4l9DPojFdlnGDnI6sz02i
	tb5lF/Iim5rIMzDEno60VMZKBncibOhmK/N8+hvHEBCZXBQ1KsyG1FxCcLdVkPNZsIiYoaO
	REbSJ/DsKX63PmuSxR4cBtQwC0JQL4pzIkOImTk+/+5Ny4xfTAbZKe9N9ykqvQue+VFTPi/
	tBCwDrZ2BbaSZJgEZ7eMwJYpcjv9WUQ/QyrxOeF4RhZOdEGQhe007CON1Aw5FAp8oZUBEpm
	6xUx4IJUxrRgvEOy540z9BUlQKGndX+A56tfR+wRMJvqFw+oH4e03bg3TM1BV1usEAGbFgd
	SOWKOcCWMcHLZMQvchiSUg=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

exfat_add_entry() initializes a new directory entry set before writing
it with exfat_put_dentry_set().  If the write fails, mkdir/create returns
an error but a partially written entry may be left behind.

For non-zero-size directories, the failure also happens after a cluster
has been allocated for the new directory.  That cluster needs to be
released if the mkdir fails.

Clean up the new entry best-effort and free the newly allocated directory
cluster when one was allocated.

Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/exfat/namei.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 038bc6fed681..7bd745090f92 100644
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
@@ -507,8 +509,16 @@ static int exfat_add_entry(struct inode *inode, const char *path,
 	exfat_init_ext_entry(&es, num_entries, &uniname, NULL, 0);
 
 	ret = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
-	if (ret)
+	if (ret) {
+		if (!exfat_get_dentry_set(&es, sb, &info->dir, dentry,
+					  ES_ALL_ENTRIES)) {
+			exfat_remove_entries(inode, &es, ES_IDX_FILE, false);
+			exfat_put_dentry_set(&es, false);
+		}
+		if (dir_allocated)
+			exfat_free_cluster(inode, &clu);
 		goto out;
+	}
 
 	info->entry = dentry;
 	info->flags = ALLOC_NO_FAT_CHAIN;
-- 
2.51.0

