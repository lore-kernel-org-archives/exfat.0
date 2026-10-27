Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092479;
	b=G8YYESv3wIV1ZDbJRKBNLvB2P9OxRKiD+GKlmIpwSotKedhONsXEWRlfratswXNvFiSq
	 MAAHcz8W3gs0QzfbV2w459yxcs46NMc6f96kWFf/n0qooxyyx64Kc/WYbB/aDYB9sG90B
	 NjhOwJBsnFt/jL2mNtJvwvuWlNs4keUSaa4kK240hOU8+/cnZBmu6VdardcsBxlzHyZXg
	 se6FqIrWDulp3PsU1YCByj+1bEKqRJm6pHfYjV5Iare3gXhLUmNGS5S9ksVaEyQLWsO8V
	 rgdrJ66iJ4BWplG0zhkJRNhLPzMaPhZAYzHHrF4Z16PbtvfgxEG5IiGQRYgfHH1HPOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FdRV4XTc4pYPAaF+rtb7+DdwwT3YYcSdn8k9Rp0yoGA=;
	b=VVORpUJYFHyK9zB4oboGgf6AdrWqJqIenhZE7dQe+9ewkP1s3nPMsmZn1jY5jEWpBlxX
	 YQn2nWbR3LTD6o/Tj9eHFB/X5IIb7JyWAJYeoxsfMJbUjnd91m613bJIO4RzJ6h3PhQAy
	 sgZVlv8YqwsdS7UCc3PA5agqWnLObM7Wy42OplM7/SZ4Nc+d666toyWgtiWAcg34RO9+F
	 WLgFRhksRF5c1a5K702swsVU82wTGNohpyqBvuFv/Vs3IUkI+DNryDpdV1j++Avy3rhpX
	 9fB+6reaHE808MiU7v5mnYUQzCCTZmlFYG7ZgsscV/QgaaNnAU7CoePbR+8JaVo+ZLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gmWYePG7;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24227606A31D
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 09:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24227606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gmWYePG7
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-369ef2c6802so371080eec.1
        for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 02:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793092477; x=1793697277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FdRV4XTc4pYPAaF+rtb7+DdwwT3YYcSdn8k9Rp0yoGA=;
        b=gmWYePG7fOA2MIoDGcYemKQVssLKVo/p+WBTdo9O2vjLnGlOR+7nIQnQ1+bKsJMT/p
         pgGzuTlKKHhVqCtbBg5Ff7dIffygd8wpqZMg2VbTO6oVF3aTe1g/8215ZNZE60FEG8R8
         iGxIL0gIoXdzeiybpZmGdbym9PqCegeb7QBu9icwtnityCLNUaRlojfsLBa+oxW3NchO
         bcEZevNtGtcUSUEGlVTP1fFJegOuYItQp4ZB7iZPqhWE7G8zpQbTjFqIRfW1TBxkLTtS
         2l129/AWP1No1qEhnfVZtebfj9nYRAUOgLjnGIup457C5AAGuXsMzHDyY/zOECLdHbmC
         8rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092477; x=1793697277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdRV4XTc4pYPAaF+rtb7+DdwwT3YYcSdn8k9Rp0yoGA=;
        b=fooLvpwQbdZOT7iZPFz7lz61EanUrcY7mN71dqcz/bDFl1h8ZhJ0ZnUU8hXzDzr5Ck
         fKe/e6rjhM/9Ym67iBAih72fneEKM3zxn/pjXb0eEfcZAW2P/8aB/wvRgEbncnoJWbCI
         cQFDrcFPWGJ6zehVYzj6Z++H81F4txq/N1Azqd6LYpIokenNkCKiayHXrBgij7283u0s
         VMpCR0SyaXsX4Vmwo5n90QTnGH3X46Fw6q62+UvDE0yIAix0newEB9k8+/5uDH7rNEeT
         /t2MRmv4MnoSQIMhx/xyJ2TEAoW5lyw0xqr9I0vVcfvgCsdcjDnKAl8eP1kOgPdcyaVa
         BlCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaebf0CtqwdRLdkWSrmIPvg11RrRNn42ep82FprbM6UPdPPTWanwM338140F//Wf3g9hWizQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLBD6HsU0l1Gq2uFGMJt/mebDeXdS7+yst7gvj0n+MbEDREgwfT
	MFv7cdjT7ePcgpeMdBGlchMcM4HNWBsmp9+Lnzdd+nPQT8KT01K8O6Ii
X-Gm-Gg: AYBFou0AKaW9c8V/YJnHJWeEJaBa4AgNC9oBNaS6+I520NIUcf6iNKk0sMCuGu98Nbk
	98ZWIMp8KDhuYY8OCuZCVRMqXcBqJUsCOQWXDBClCzoGqJdCn6Bvp5Yt5Y0VUcvJ05GjVjG/ZYJ
	cH3topq9s504p43Wlyigwv5gNqqFXRRZZr9M45tVe2hOdED+3BemVfBr9BGYC/oNmMns1uNvWxb
	X/3tftiamMy3pBqqAfEYvz9WlkL9P9BlqH6UTovhDoyqxuI9LQK6ksgQxE6kyzkkatKviyQraWu
	9N9e9fvA02Wk2Vlls2BKQ4TFXbEqKCR2qIzT4zsKjcE9jzQfG4FDHr6qlxb86RwGkUQQjIhS7xT
	HK6IZxZs4Pi+Gp+40OR4Mfl+yxolPuTqlQQfoGxe8Iz+G+JXa5u/r9PFYS6j2wwRwSlbIe/fKHo
	laUS9XEimluIjWd02H5/8XKX0+OAdL/F3KrkdEDC2Wo1PL2c8tKpbCrtIrw3nJNf6utS3v+1/Pp
	sUbL4qUPTd7n1Ys3+aUTNqDOfV6AZoz5Zqszak5iUAFa3vBcrEbVyEMF+191MhfG0YI7/Yfez57
	zK7BNHo=
X-Received: by 2002:a05:7301:5383:b0:369:f644:fac0 with SMTP id 5a478bee46e88-36a0f55dbc6mr2798061eec.8.1793092476796;
        Tue, 27 Oct 2026 02:14:36 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee72c0sm48508417eec.29.2026.10.27.02.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:14:36 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linkinjeon@kernel.org
Cc: sj1557.seo@samsung.com,
	yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jlayton@kernel.org,
	jack@suse.cz,
	dennylin0707@gmail.com
Subject: [PATCH] exfat: preserve creation times during rename
Date: Tue, 27 Oct 2026 09:13:53 +0000
Message-ID: <20261027091353.74642-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

exfat_rename() resets the destination parent directory's i_crtime after
every successful rename. A normal mv within that directory therefore
changes its STATX_BTIME, and the new creation time is also written to
disk. Moving a child does not recreate its parent directory.

The function also resets i_crtime on an overwritten target inode. An
application holding an open file descriptor can observe its birth time
change even though it still refers to the same inode.

Remove both creation-time updates. simple_rename_timestamp() already
updates the modification and change times required by rename, while
creation times should remain unchanged. Jeff Layton questioned these
updates during the timestamp accessor conversion, but they remain in
the current implementation.

Fixes: 5f2aa075070c ("exfat: add inode operations")
Suggested-by: Jeff Layton <jlayton@kernel.org>
Link: https://lore.kernel.org/r/bb698e294b0d4dbbbad4b94048693360010b8010.camel@kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/exfat/namei.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 68ddb9c5504f..d01280570f70 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -1293,7 +1293,6 @@ static int exfat_rename(const struct mnt_idmap *idmap,
 
 	inode_inc_iversion(new_dir);
 	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
-	EXFAT_I(new_dir)->i_crtime = current_time(new_dir);
 	exfat_truncate_inode_atime(new_dir);
 	if (IS_DIRSYNC(new_dir) && size != i_size_read(new_dir))
 		exfat_sync_inode(new_dir);
@@ -1331,7 +1330,6 @@ static int exfat_rename(const struct mnt_idmap *idmap,
 			exfat_warn(sb, "abnormal access to an inode dropped");
 			WARN_ON(new_inode->i_nlink == 0);
 		}
-		EXFAT_I(new_inode)->i_crtime = current_time(new_inode);
 	}
 
 unlock:
-- 
2.43.0

