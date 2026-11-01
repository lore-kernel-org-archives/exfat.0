Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793498253;
	b=lLl1iLOPt0bN40N/wx9OFdW/YZoPftQwJVcz7boAKDmAOHnJ8fhht8pmZ9UPY3YfF091
	 0rcfynGChS42D55YPF2Bu2DnpWbsPFMmhn8rLhrgUI0UpU9SMc32BxAO4xstZOUyPKkMe
	 qJ6NqXJ5pRa6e2tw94aPr5pIunIBiuZEklH45ZCvF63If1RpiJQVENATCwDmfCqKOXtNb
	 vbriHShNgi88XgERa/fMzKY8eIz2nC0x0Bq2JikwpCqnRFHKq27kdqZNBC+A6Sy5KigPT
	 Tt8hVZBxaPE/HXFVWiu7axbUkyrtcEA5NyTwTfrgk5IHo3ek9rh4C+MN11FYvTxXpxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793498253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p8gqfUFSv+Rji6NVZjPl0fEsf893Obde69tyzuNJ1VA=;
	b=NIle7pHu6ROw6yK5XVZhWMrM42Ll48INJ3EfcbTpAslo/Bkz0/4N/B+uS0yl2xNia0dn
	 wBGswBPud0tIUoKLHzB9VYtW7QCAb40VdqDjR+Gs5jKPDpvFnuVgtdGHqjGtbyj8VjgPC
	 9SHRBe5l1WQMO2W0tRFgRKYagJwxsZuk4d7p3lRovm38IhbYrWGS6L88z7/S+lz06NasB
	 qTf6L2Drly+hBdVWBTkfUygpRtGfhKqjJ+Z99Y0PNwgGepk+jKSOsKYYbMR62cc+QcMTj
	 LWRmjd+r0VcNRBI38H5IGf9eYEGyZtUuiOVSFJ4xb2XPwvDE8OT8OWI0mFoML8GRWtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1+JwzIA;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDC160A3816
	for <exfat@lists.linux.dev>; Sun,  1 Nov 2026 01:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDC160A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1+JwzIA
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so11766655e9.1
        for <exfat@lists.linux.dev>; Sat, 31 Oct 2026 18:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793498251; x=1794103051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8gqfUFSv+Rji6NVZjPl0fEsf893Obde69tyzuNJ1VA=;
        b=e1+JwzIABe//C0MnLCRGQx8z0PtJWdQbhiFrtur/FiLY1LlakN2eej/MRMpaQ5sA0C
         npC2rUNZfVADq5reHslZuoA6iKBThuSzmpTxPVUCWG/VZNUKGyAKbnIFKvtnvDNeYTeN
         2si1+OHWcibbwFgJvmW1VFfGMaag3//Yy1em2vwO0gEg/lcmViwMEF5h5fpDM45IpXT1
         pBZfN49wzIsChZZnB53+KZBcuFASB1c8RDhxKgr7WwIJBcRs+DBCjcfRSc7pzftS95Yz
         Z5Q6HwB1h4l+4N1HzUWNy7cH/F0LdIyKzeo/ukQlNXXewplofti1OyhqPtRWto1nUva7
         EPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793498251; x=1794103051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p8gqfUFSv+Rji6NVZjPl0fEsf893Obde69tyzuNJ1VA=;
        b=FCt/eYfN9yIp19yKaSc9I/yniV3t9IOwGkig3k8J9f4JzChmKw3B4STNWZLICo7o7x
         2ztNJhijvkktjUa8XX0o1P8IpPlfd7Jhr5zGRtB3XNUO955MUdOi9tf8OU3Dyv1gZq4P
         3l2ItyczP7eF6E/NkjQ8Ic3L6xcOphkNez1jGXaLEP7bjtXNuVRah1Pe/5+H1kURmfv2
         FDfEq4i3g6IEZaoMYVaLz5gWV8oR5F14l0YW3hmpUCFIpxp0/X2bZjtXeOsXwIOoV1Tk
         iK6Uaskwr9DaQcMDCi97DSZpCvlJpSXh2hiyUSHSp6S7AZpUafJMswvKZa0f4N6hI++m
         1DIg==
X-Forwarded-Encrypted: i=1; AKwUvByilEggSzsJCOj4hp/BxdLyaJDjQ9yePupXwxUzUJNKil9Ea4jiJ9IUuMSFaAsVKwbGqWk/0w==@lists.linux.dev
X-Gm-Message-State: AFq9FYKHLVFluv4TBr4gqaaeoTVl1A85UkpmjMmO5wjiyQ5vvdAG31UM
	zyOJK5o68b9+mE3yUHyY1oW3u/NtbdLSSY2AvzZLeHYt7XQdGdvranKn
X-Gm-Gg: AYBFou29QW9J/OiUZDX/f7kqUBVgTPcapUzF2OULiVU04rXEXJEWVJp3W4+yge5Lo/q
	OoXKHoJNAT+8SnWthT3BWdMfmmq9UVY5b/fdbJEHaGqIswSTEyGAaLtIBjQMBNQrWCjXFMjTb7B
	N62B5Em3ArNpQJLWJNFqHVhaE+6gXGMunGIrCRWuB0ToMiYVVh8b9SGyS5cLwNQQRGCexEIK0hX
	jlc3jPEjr3bmV7HFWDPUvjO5b4NscN2uQHQACkpodprcu3BZ96YovuP5ittYnJgsC9nLrWqDErF
	/T8AZfdvQsYvPNOlbUfV+utFR/e7pneqiVMlJGTy/vKtjXyJvjbH/jCZRaxl9cS0CmbkyBuiOf+
	LVKR8zsgAaU9vpyjs/4LVuVkIBzHo8QXBMC8wX5H40pJerO7ukjHGhaxPMtnzzgaYvtGD1J6Rjc
	sLcXnHCKeEFw2i5AG5m8leQ6U4sg8El1LqBTiny9nbcUWxAZ4J+QaOa5UUb8bKZbc50h612QlKY
	kwZBtXzFA2UfU57YHoKtL8Mtw+uycA2sGr7CdQ1xOqiT+sbs79IB649OlIKWDG8oqp/TQYNtYSg
	hAV4zatcG91fI/kxzTrW6hBF
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr144286495e9.17.1793498251133;
        Sat, 31 Oct 2026 18:57:31 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm273532835e9.11.2026.10.31.18.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 18:57:29 -0700 (PDT)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Chris Mason <mason@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chuck Lever <cel@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v3 4/5] exfat: make crtime user-settable using ptime
Date: Sun,  1 Nov 2026 02:55:50 +0100
Message-ID: <20261101015551.786044-5-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101015551.786044-1-koray.fra@gmail.com>
References: <20261101015551.786044-1-koray.fra@gmail.com>
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

Since exFAT supports user-settable file creation timestamps, map
provenance time (ptime) to exFAT file creation time (crtime) using the
newly introduced ptime API (in commit "vfs: add provenance time
(ptime)").

To do this, implement exfat_fileattr_set(), set .fileattr_set to it for
both file_inode and dir_inode operations and update exfat_fileattr_get()
and exfat_getattr().

The timestamp is now retrievable by using file_getattr() or statx(), and
is settable by using file_setattr() with the FS_XFLAG_PTIME flag.

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/exfat/exfat_fs.h |  2 ++
 fs/exfat/file.c     | 36 +++++++++++++++++++++++++++++++++++-
 fs/exfat/namei.c    |  1 +
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index eee573d1697c..aff96afa258a 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -619,6 +619,8 @@ int exfat_getattr(const struct mnt_idmap *idmap, const struct path *path,
 		  unsigned int query_flags);
 struct file_kattr;
 int exfat_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
+int exfat_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
+		       struct file_kattr *fa);
 int exfat_file_fsync(struct file *file, loff_t start, loff_t end, int datasync);
 long exfat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
 long exfat_compat_ioctl(struct file *filp, unsigned int cmd,
diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 1386149916bb..70e226cb4ab7 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -384,15 +384,20 @@ int exfat_getattr(const struct mnt_idmap *idmap, const struct path *path,
 
 	generic_fillattr(idmap, request_mask, inode, stat);
 	exfat_truncate_atime(&stat->atime);
-	stat->result_mask |= STATX_BTIME;
+	stat->result_mask |= (STATX_BTIME | STATX_PTIME);
 	stat->btime.tv_sec = ei->i_crtime.tv_sec;
 	stat->btime.tv_nsec = ei->i_crtime.tv_nsec;
+	stat->ptime.tv_sec = ei->i_crtime.tv_sec;
+	stat->ptime.tv_nsec = ei->i_crtime.tv_nsec;
 	stat->blksize = EXFAT_SB(inode->i_sb)->cluster_size;
 	return 0;
 }
 
 int exfat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 {
+	struct inode *inode = d_backing_inode(dentry);
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
 	/*
 	 * exFAT compares filenames through an upcase table, so lookup
 	 * is always case-insensitive. Long names are stored in UTF-16
@@ -400,6 +405,11 @@ int exfat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	 */
 	fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
 	fa->flags |= FS_CASEFOLD_FL;
+
+	fa->fsx_ptime.tv_sec = ei->i_crtime.tv_sec;
+	fa->fsx_ptime.tv_nsec = ei->i_crtime.tv_nsec;
+	fa->fsx_xflags |= FS_XFLAG_PTIME;
+
 	return 0;
 }
 
@@ -485,6 +495,29 @@ int exfat_setattr(const struct mnt_idmap *idmap, struct dentry *dentry,
 	return error;
 }
 
+int exfat_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
+		      struct file_kattr *fa)
+{
+	struct inode *inode = d_backing_inode(dentry);
+	struct exfat_inode_info *ei = EXFAT_I(inode);
+
+	if (fileattr_has_fsx_mask(fa, FS_XFLAG_PTIME))
+		return -EOPNOTSUPP;
+
+	if (fa->flags & ~FS_CASEFOLD_FL)
+		return -EOPNOTSUPP;
+
+	if (fa->fsx_xflags & FS_XFLAG_PTIME) {
+		ei->i_crtime.tv_sec = fa->fsx_ptime.tv_sec;
+		ei->i_crtime.tv_nsec = fa->fsx_ptime.tv_nsec;
+	}
+
+	inode_set_ctime_current(inode);
+	mark_inode_dirty(inode);
+
+	return 0;
+}
+
 /*
  * modified ioctls from fat/file.c by Welmer Almesberger
  */
@@ -1110,4 +1143,5 @@ const struct inode_operations exfat_file_inode_operations = {
 	.setattr	= exfat_setattr,
 	.getattr	= exfat_getattr,
 	.fileattr_get	= exfat_fileattr_get,
+	.fileattr_set	= exfat_fileattr_set,
 };
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 68ddb9c5504f..15ec7f1942c8 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -1349,4 +1349,5 @@ const struct inode_operations exfat_dir_inode_operations = {
 	.setattr	= exfat_setattr,
 	.getattr	= exfat_getattr,
 	.fileattr_get	= exfat_fileattr_get,
+	.fileattr_set	= exfat_fileattr_set,
 };
-- 
2.56.0

