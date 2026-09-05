Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997CE260580
	for <exfat@lists.linux.dev>; Sat,  5 Sep 2026 05:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587450; cv=none; b=kRxtjsSwSZ9WYQnq/Tuew548bpWfcK93XcjXILDIy+z8RqA1KIprBVagep1x97cRnzTuMrGwpw1Tk6TD0I2H8txLPGRXw7QPuLflYXTH8n9ZJ1/+5DDaYTkVqcYF02/FQGDg+ZwWU7YdXQH5ORil915/UUx5CJzyOOC7mpXHQWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587450; c=relaxed/simple;
	bh=YvgPDATokHN3T7GyE3lGp8+hLVivd+jT76jGntq6OkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7cqT28XC/4/KzmmJ/EeMni0XLXH6KJ02vQ7JElRHkjPGeVVRSTo3Etc8K3PvccvbIlzg1d/vfuPeUlleZzxqlmqHIcPVi4fTX5d8sflwHcR5bPcYLy538hQ2aEVasDsrh+uEMdfL8JjJz0bCKouFNisZIPXkhxycs9LHgFhHGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cRObNSzM; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cRObNSzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nJ
	HBdIVAkzhqsT5G2+dFhD52KoDX9XjMyY3A3x06H8o=; b=cRObNSzMCjp25Oi2HN
	NzW7adUUPnfe5ORS8Xmwavjw5vlv5GC3FFkilB1/b/driv8PnqJcqExQIrdHe8fu
	eNQORHS552II9hjTR3Y8JdhbaxrG3y3UvK/qFIBTmfUzM4wHc2SSd2srrGeykd12
	TJ9/jFocEzFCrymmV3j7RW1jo=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAnswumrZtqq78tAw--.49294S3;
	Sat, 05 Sep 2026 13:50:31 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH 1/2] exfat: fix used_clusters accounting during cluster allocation
Date: Sat,  5 Sep 2026 13:49:50 +0800
Message-ID: <20260905054951.674766-2-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905054951.674766-1-chizhiling@163.com>
References: <20260905054951.674766-1-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnswumrZtqq78tAw--.49294S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar1kXw1UCw48ZrWUXryrWFg_yoW8ZF1xpr
	W0kw15Jrs8Xan7Cr4UGr1kXa45Cw4rWF15Gay5JrnFkFn8ur4v9Fyqqrs8ua9F9w48AFZF
	qryqkw1j9a9xCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jfzVbUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9wcWs2qbraerJgAA3j

From: Chi Zhiling <chizhiling@kylinos.cn>

In the current exfat_alloc_cluster(), p_chain->size is incremented as
each cluster is allocated so that the partially allocated chain can
be freed by __exfat_free_cluster() on the error path.

However, sbi->used_clusters is still updated only after all clusters
have been allocated, while __exfat_free_cluster() unconditionally
subtracts the number of freed clusters from sbi->used_clusters.
Therefore, when allocation fails partway through, the partially
allocated clusters are subtracted from sbi->used_clusters even
though they were never added to it. This corrupts the free-space
accounting and can cause sbi->used_clusters to underflow.

Increment sbi->used_clusters together with p_chain->size as each
cluster is allocated. This keeps the accounting consistent with
__exfat_free_cluster() on both the success and error paths.

This issue is caught by generic/476 with 256k cluster size:

    Ran: generic/476
    Failures: generic/476
    Failed 1 of 1 tests

    *** fsck.exfat output ***
    ERROR: <path>: more clusters are allocated. truncate to N bytes
    ...
    /dev/vdc: corrupted. directories 331, files 526
    /dev/vdc: files corrupted 9, files fixed 0
    *** end fsck.exfat output ***

Fixes: d5c514b6a0c0 ("exfat: fix the newly allocated clusters are not freed in error handling")
Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/fatent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/exfat/fatent.c b/fs/exfat/fatent.c
index a8b11e2ce43f..a6728c361289 100644
--- a/fs/exfat/fatent.c
+++ b/fs/exfat/fatent.c
@@ -509,13 +509,13 @@ int exfat_alloc_cluster(struct inode *inode, unsigned int num_alloc,
 			}
 		}
 		p_chain->size++;
+		sbi->used_clusters++;
 
 		last_clu = new_clu;
 
 		if (p_chain->size == num_alloc) {
 done:
 			sbi->clu_srch_ptr = hint_clu;
-			sbi->used_clusters += p_chain->size;
 			mutex_unlock(&sbi->bitmap_lock);
 			return 0;
 		}
-- 
2.53.0

