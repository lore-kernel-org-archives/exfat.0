Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC77372B50
	for <exfat@lists.linux.dev>; Thu,  3 Sep 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427620; cv=none; b=gNw1o95ejjt/yBDuUE8nJiVs+MOBa998u2z+Y1ZmddXnvaA9b9aMbk0k0Wn/aU/+9L2AsD7kUEnphM4RyGbWo3at8NGDvJfECMg/yDLCDSygtmynID/h9bKGGkzBYgndSEJRZ/dpOFYBU/61VrojOTGwqKJmM6PaZLohX0SSDNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427620; c=relaxed/simple;
	bh=jPKw7QduCaJBI6bek1bq7fG/2eKp6dEaYhlCkbzbcNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/SE8Ewxwjf5ejj4qKfJqSaYg1AhpPI8c/TPAKxS9MndmPnSDJ9hC1QqTa7czOMKEm87T6L4Qk8TwUlObN+2YAGyX+VrVclrhH3GDFeG2+L3gd8jdR46AU8SB2HsW5QDOcIJVlCEbv9rku6c2gzi6FFps0wWuah78qKEyEgT9qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T4MypING; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T4MypING"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5j
	SImAzUaatrdCdOJLu38AvNhLHkwQrh0ygEjAW4SFw=; b=T4MypINGGFhAN7j4Kb
	nvoFJuYPXvUr1e8OlMQrkMugZN6zWkkslfJj2JoQnYsFqrM9TAnHkjJqE6CPILyd
	Un71u8HPgkq8SK4020ul9jpY6QRgJ36THsdZJJmhH3WgKa/X74rW65KM67VUpvds
	Q00ZscmEyF9IF83qEm+PC1F4o=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3P0hMPZlqmaJtAQ--.18608S2;
	Thu, 03 Sep 2026 17:26:37 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH] exfat: clear the volume dirty flag only when remounting read-only
Date: Thu,  3 Sep 2026 17:26:23 +0800
Message-ID: <20260903092623.301981-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P0hMPZlqmaJtAQ--.18608S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF48AF17Jw4DZry3Xr18Zrb_yoW8ur4DpF
	ZakayjgrWkGa18uFsrCF4xWryFk34xCF43Jry8Z3W5Xr98Zr9I9ryavFy5ZF4DZ3s3Ka1F
	vrW0kFy5XF17GaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j089NUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9w1jAWqZPU2ZOQAA37

From: Chi Zhiling <chizhiling@kylinos.cn>

exfat_reconfigure() does not hold s_lock while calling
sync_filesystem(). Therefore, the filesystem can become dirty again
between the sync and clearing the volume dirty flag, leaving a dirty
filesystem with a clean volume flag.

Holding s_lock across sync_filesystem() is not an option because it can
lead to a deadlock: writeback takes s_lock in exfat_write_inode().
Instead, clear the volume dirty flag only when remounting the filesystem
read-only, where no writer can modify the filesystem after the sync.

For a normal read-only remount, reconfigure_super() calls
sb_prepare_remount_readonly() before ->reconfigure(), which returns
-EBUSY if any writer is still active. Afterwards
sb_start_ro_state_change() sets sb->s_readonly_remount, so
mnt_get_write_access() fails with -EROFS and no new writer can start
until the reconfiguration finishes. Therefore no writer can race with
the sync and the clearing.

Forced remounts are different: with SB_FORCE, reconfigure_super() skips
sb_prepare_remount_readonly(), so the writers active at that moment are
not blocked and can still dirty the filesystem after the sync. Do not
clear the volume dirty flag in this case.

Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
---
 fs/exfat/super.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index a9ea36ba2693..268732571837 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -775,9 +775,12 @@ static int exfat_reconfigure(struct fs_context *fc)
 	fc->sb_flags |= SB_NODIRATIME;
 
 	sync_filesystem(sb);
-	mutex_lock(&sbi->s_lock);
-	exfat_clear_volume_dirty(sb);
-	mutex_unlock(&sbi->s_lock);
+
+	if ((fc->sb_flags & (SB_FORCE | SB_RDONLY)) == SB_RDONLY) {
+		mutex_lock(&sbi->s_lock);
+		exfat_clear_volume_dirty(sb);
+		mutex_unlock(&sbi->s_lock);
+	}
 
 	if (new_opts->allow_utime == (unsigned short)-1)
 		new_opts->allow_utime = ~new_opts->fs_dmask & 0022;
-- 
2.53.0

