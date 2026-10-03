Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA0E15665C
	for <exfat@lists.linux.dev>; Sat,  3 Oct 2026 03:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790998289; cv=none; b=MXY2/MhevvsTWhwf2h9BzNZejL7imfrDZMkN3S8yEOQGMQfXvYPeiDpNY6CaywqVr1Vu4lX/ysfkuWCkkGB3KKCtE5FSpesANOsCAvOFk7NvEUjQnSWWI0mv2wUzzuSbsQz2DbqLMSXT3mW3bh/nphN2AokBhUaoan1hsQYKtNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790998289; c=relaxed/simple;
	bh=x+SyX/2UyUp5F/RathMEnkorgJUMPh4nptR11vCtD4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tfp7E2Lq+5f48afERCVMSimBBGoVVkDz4DfF9LfHASlbRS7ZaymgXXInjX3aQO/cnaHtEbiy9B4NHEpUbFRSLlidTN0NRHHh5nJnmyIjh7mg+8DBA9u+UXJx+3iIHyMI0Fvln+ull15CVOd8lI0o79u3kM8kg1ijL3l2RbAoCJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AQv1f6a/; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AQv1f6a/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pF
	RGHzIn+da/mBuHaNgxNy+G5bu/CnYpKU9A6UvT1V0=; b=AQv1f6a/n7FyhB74el
	1OOX2CUHXhasxbGmDl6EiVnUHsEKvPf3OeGb+sK3y7ze+EXeaEQFrEv/zJkk2iPg
	sUdU9RCWndaaPpGx/7T+NeOZoa88dIAdqs/Py3iMLzsUK5CgFuVcZSVZBWfbMhNS
	oZY3P7dz+m40QQRQykhqjr3GY=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCXTnLfdsBqOdNwCA--.32914S9;
	Sat, 03 Oct 2026 11:30:45 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	chenxiaosong@chenxiaosong.com,
	dxdt@dev.snart.me,
	hyc.lee@gmail.com,
	linkinjeon@kernel.org,
	liubaolin12138@163.com,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 7/7] exfat: drop i_rwsem from exfat_page_mkwrite
Date: Sat,  3 Oct 2026 11:30:32 +0800
Message-ID: <20261003033032.1775311-8-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003033032.1775311-1-chizhiling@163.com>
References: <20261003033032.1775311-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXTnLfdsBqOdNwCA--.32914S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF15Gw1UCF1UZFWkKrWDCFg_yoW8Kw4rpr
	y3G3yDGwsrX398Wrn7Grn5Z3WY93WrtrWxury5W3WvvrsrJ34xtFW8KrWkua1Yywn5Xw4j
	qF4YyrW8ZwnFg3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHyIUUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9wWhP2rAduVV+QAA35

From: Chi Zhiling <chizhiling@kylinos.cn>

exfat_page_mkwrite() takes i_rwsem with inode_trylock() and returns
VM_FAULT_RETRY when that fails.  The MM subsystem does not propagate
VM_FAULT_RETRY from ->page_mkwrite(), so the fault still completes and
the page becomes writable without exfat_page_mkwrite() ever advancing
valid_size.

Blocking on i_rwsem is not an option either: ->page_mkwrite() runs under
mmap_lock, so waiting for i_rwsem would create an mmap_lock -> i_rwsem
ordering that can deadlock.

Now that valid_size is advanced under the folio lock, i_rwsem is no
longer needed here.  Take mapping->invalidate_lock shared, which
serializes the fault against truncate, and advance valid_size after
iomap_page_mkwrite() has returned the locked folio.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/file.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index d92997dc8eec..8eadaa7b9275 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -893,8 +893,9 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 	vm_fault_t ret;
 	loff_t new_valid_size, mmap_valid_size, fault_page_start;
 
-	if (!inode_trylock(inode))
-		return VM_FAULT_RETRY;
+	sb_start_pagefault(inode->i_sb);
+	file_update_time(vmf->vma->vm_file);
+	filemap_invalidate_lock_shared(inode->i_mapping);
 
 	mmap_valid_size = ((loff_t)vmf->pgoff + 1) << PAGE_SHIFT;
 	fault_page_start = ((loff_t)vmf->pgoff) << PAGE_SHIFT;
@@ -914,8 +915,8 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 			err = exfat_zero_new_range(inode, zeroed_size,
 					fault_page_start);
 			if (err < 0) {
-				inode_unlock(inode);
-				return vmf_fs_error(err);
+				ret = vmf_fs_error(err);
+				goto out;
 			}
 		}
 
@@ -929,17 +930,12 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 		mark_inode_dirty(inode);
 	}
 
-	sb_start_pagefault(inode->i_sb);
-	file_update_time(vmf->vma->vm_file);
-
-	filemap_invalidate_lock_shared(inode->i_mapping);
 	ret = iomap_page_mkwrite(vmf, &exfat_iomap_ops, NULL);
 	if (ret == VM_FAULT_LOCKED)
 		exfat_advance_valid_size(ei, new_valid_size);
-
+out:
 	filemap_invalidate_unlock_shared(inode->i_mapping);
 	sb_end_pagefault(inode->i_sb);
-	inode_unlock(inode);
 
 	return ret;
 }
-- 
2.53.0

