Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E471472F7F
	for <exfat@lists.linux.dev>; Tue, 13 Oct 2026 03:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862766; cv=none; b=kGRExzIlmHy8KCzKOki+60LTxQR6ed1cyLMhvNJz3gsEWbDhdTi2YfoIq+t+txXI/1PWysW8CysAEagexqqdwfaw8MXyn+OjIn1jjcvXqjL9laEyx6Cz+EuDM8AlUdL1Y728aDYCkRqhZjmST/GwgwNKXHQ8S8Lhyj20K8hGULs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862766; c=relaxed/simple;
	bh=gAyZDWcv6rY49lZXy6om99aAELziLYtn/h2iXUdSumc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTNbxkHUyzjVCpCFGwmVC1s8wAkCymLjner/n+17zRb5Vog/wIWBiyWcnxx6pXU8T2nyEfoww6X7HO1BQMiBXM0HL6bSABLHKdaCdhGuext57RKV+eF7wnhtcKbhNv7GZR9ibQOkf4SlzJgSXSuUrlgyBeABFqOjUxlpWHW9pZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ersl3xfh; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ersl3xfh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Na
	TkgkQ0XIR3RV1Qt+TsEU267B6JuNja9vKJMGurrCk=; b=Ersl3xfhlx6FjCkNvG
	pSWPgaevEb+lIf4pnagbBuVWHu25f302TLD/rKlPp1EjMfyDJO2/c8ZwnZhVRg2N
	w/34yg0c3xigfBDclixQVNu+2xA72BgeoA6TiFDo8vbxtqPk1j1UP9rsArv/C5Tu
	3RocMxzRjifxu39eO7GE/SdK0=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3fwTKp81qBFXLEQ--.23138S6;
	Tue, 13 Oct 2026 11:38:54 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 4/7] exfat: drop i_rwsem from exfat_page_mkwrite
Date: Tue, 13 Oct 2026 11:38:34 +0800
Message-ID: <20261013033837.2748258-5-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013033837.2748258-1-chizhiling@163.com>
References: <20261013033837.2748258-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fwTKp81qBFXLEQ--.23138S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF15Gw1UCF1UZFWkKrWDCFg_yoW5JFyDpF
	y3Cw48WwsrX398Wrn7Wrn5u3WY93ZaqFWxur98u3WvvrsFy34xtay8KrWkuF4aywn3Xw4j
	qF4YyrW8ZrnFg3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UR6wtUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC2w4ryGrNp86OwAAA32

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
index 6f7b50c7a075..a8c1f4757678 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -969,8 +969,9 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 	loff_t new_valid_size, mmap_valid_size, fault_page_start;
 	bool dirty = false;
 
-	if (!inode_trylock(inode))
-		return VM_FAULT_RETRY;
+	sb_start_pagefault(inode->i_sb);
+	file_update_time(vmf->vma->vm_file);
+	filemap_invalidate_lock_shared(inode->i_mapping);
 
 	mmap_valid_size = ((loff_t)vmf->pgoff + 1) << PAGE_SHIFT;
 	fault_page_start = ((loff_t)vmf->pgoff) << PAGE_SHIFT;
@@ -990,17 +991,13 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 			err = exfat_prepare_valid_range(inode, zeroed_size,
 					fault_page_start);
 			if (err < 0) {
-				inode_unlock(inode);
-				return vmf_fs_error(err);
+				ret = vmf_fs_error(err);
+				goto out;
 			}
 		}
 		dirty = true;
 	}
 
-	sb_start_pagefault(inode->i_sb);
-	file_update_time(vmf->vma->vm_file);
-
-	filemap_invalidate_lock_shared(inode->i_mapping);
 	ret = iomap_page_mkwrite(vmf, &exfat_iomap_ops, NULL);
 	if (ret == VM_FAULT_LOCKED && dirty) {
 		exfat_advance_valid_size(ei, new_valid_size);
@@ -1008,10 +1005,9 @@ static vm_fault_t exfat_page_mkwrite(struct vm_fault *vmf)
 				round_up(new_valid_size, i_blocksize(inode)));
 		mark_inode_dirty(inode);
 	}
-
+out:
 	filemap_invalidate_unlock_shared(inode->i_mapping);
 	sb_end_pagefault(inode->i_sb);
-	inode_unlock(inode);
 
 	return ret;
 }
-- 
2.53.0

