Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793498244;
	b=n1zSJuafXHJ2RE/imFUYMHEOAUPeP/NMMhoIrUn8ACbcDyFMwdV/kAjUUwXoaXdCH5IA
	 sB2pSizMiswZZQ/wzmNWDLtPwvYpUrPqI3LPTEq/SMM/hlmkFvBpqd/h2XDf4AR2dCbL7
	 T2HoZdB25qtcyeT8hpt3L7VHptbpXRg7ZDCPqqRo4hQOApL11wccpfgz8hMJyDDxqFA9O
	 a4iqXPbr6xBSQ4B/Rn2ryKCX+AyQZnWavwIp1xw+UL1gtaAoldHBbcJvKemzbB1sLXoFt
	 TVjOUuyEpK/Cy9bP8tc5TKIBTtzaMtEJvfWs9SEGpU39lGufpwDQ17zaLaGoJHLyHzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793498244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HjxZWeiY3BNoKLFLjn9gfnGpTfHowaS1Ix4espIgNNc=;
	b=Oiqr6bWLwFNvh689soAF+SgfusgCdloDuWCMKWQapmqowzC5K62Bap0gSftPBomvwbtL
	 TL8RncdwbrBwKwW2r0pvQiw2XTxm+Qbp3T30fnC5nOIYj962zZEtpex2FbWzqSDzB5Oj1
	 Pcw5BWQUkI8/InM7GutMtppB8LS2pXdUqu9czxKa7XH4OaofQuDf3jfJScxngkb2BTats
	 DhiA2XW24vQdYtj5BKyjSabDPeFhb9kt5dNKthFHjYuwya8MdCoi/2CnrcNqvIHqFoM3J
	 JB09sTd2cGBXSG4s6bo1wX0WXufudFY5k+poz0SU9gpcbLsMeNYzQxlz8bSjArHDcSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HOhBTXWT;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF63A606A33E
	for <exfat@lists.linux.dev>; Sun,  1 Nov 2026 01:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF63A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HOhBTXWT
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so21124345e9.0
        for <exfat@lists.linux.dev>; Sat, 31 Oct 2026 18:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793498242; x=1794103042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjxZWeiY3BNoKLFLjn9gfnGpTfHowaS1Ix4espIgNNc=;
        b=HOhBTXWTkReP5V3rHH1BrTHRr5lsK0EHy6ORH2V+AZkKGgijKCw9OVgYIunV1VgNqu
         f6w6Ud2l5vD4cjZSfvG+vYmNfwcC/Ih1nwmm5K7570MTuCc6benVO80vf6NgT/yR55Xj
         rQJ6/Zqa52geb9IlAWqr6zw3OmXpCkkxxi6goI0f0nMVR6ipiW0wmduialScEHLc1N9S
         x9enqnEilfmlRte4Mvoalfy3KRWfd2s9Q+vxj9i+g8b5ikNezPkdy7all6fwwnpTDaHB
         6JTXfRryQ9WebaR1kv9tqSzETvbaGcVqsEsxi+Rry+eV+mmX4vRzJ/q7N1IXGfucYv6o
         KNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793498242; x=1794103042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjxZWeiY3BNoKLFLjn9gfnGpTfHowaS1Ix4espIgNNc=;
        b=2ZtwuaMZlV3TUq3+f0tpIjgW2PMcVilRzdc4QXkDp/aEorvlXB45S4OIgw/E7Mt29E
         WccA9PQNJkTEXSH4g3P2BkK+R8ApcdCNKTrGq7YY3JQHOlLmhuhObKs6ARcxNO1ujZbW
         DHnfdPWXdj5BIPDLP64/YMApemr7TbmQ7dhhYxlNXmACyQYL/mV5AXw1VhXflOva6Tug
         bzg8248903WWw4WzvEUR2ETjyMkIzOq9gFTTXkb9XwNddSsfiNc6zWk3BqEpmfDn3d3I
         FvSRr9UWmliXnBHPedI1feuYryJw7yEagJHStTdmDtgxyv7qbOQ7XuBOR/kACWZUj5ut
         UZog==
X-Forwarded-Encrypted: i=1; AKwUvBxiV97JJdewfj2BGmXhFib9hTX+VTrLnGQFPq9Q7VsfE/+AB80xBKzLftGWnpdSEKSWiY6HJw==@lists.linux.dev
X-Gm-Message-State: AFq9FYL094otz+SeuaxoV0STrNKl4IWtoVJ5TxmuCkNX/rBla/bTKEeW
	b5gxFi/jeDViq0R2UPVRnCnZhiQMImVoWVKJfbko3pCqBASh67CUFkR7ZmWLvWhDHaHpGw==
X-Gm-Gg: AYBFou0CN30wjo1Gq03fg9EeK9UN0u92KOGXMdjK5b4Gw/GB0dVdOPB8czFPm/i1umj
	BMZs/hKscVDeGNqDqdG0L1vDzXZzMmRSljdrQF62ubfQNfP9T+9wICycjIXlSxWwLSZ9GjGogB4
	u6KVfcSgLH6S54ArmIKArQ5Ux++gZnz5AgBJtWvFliiuptVbAqJfIID5tHau4ZcUKLcwY79kc85
	bmzTyzkEWTtZMLPmvU752vAYm31qAkGyuV2wcFvtu3UDuJ39fVTRs7HQgPI7XSkoJT8MWI66YSv
	yBfvI4vrQ/sxrGvE8sGC4iItoMAsb3k9VE+FusCN356Nn4QW9tu+eAcTCPfO8nzKiaghk1iEDXz
	MQfW9Aqg+OssWT1cttWo51XCoW2P9Bhtd3df+Anw2z2wz6Nv2OBIoAAXbABvb1xug5Q7kogvuDW
	rkoKTqbTlIlmnUtomwBRc9X48EJx0HB1TgVlRlSoZX6bbSgND1ub/kMinsiLIXM8nJ74CqsnHVp
	Duj6xwg++0RU6gh9e4h5TnMidcnbyEkOgtLoJ6H11FkwHOobiXAXz7uCKZoUHt+tT63tqRvg7eC
	7TKBKmREFzoyLgjPFUIVMc74
X-Received: by 2002:a05:600c:3f0f:b0:4a2:1612:636e with SMTP id 5b1f17b1804b1-4ac16bc4645mr143132385e9.5.1793498242131;
        Sat, 31 Oct 2026 18:57:22 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm273532835e9.11.2026.10.31.18.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 18:57:21 -0700 (PDT)
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
Subject: [RFC PATCH v3 1/5] vfs: add provenance time (ptime)
Date: Sun,  1 Nov 2026 02:55:47 +0100
Message-ID: <20261101015551.786044-2-koray.fra@gmail.com>
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

Add provenance time (ptime), indicating the time when a file or
directory was created. This is user-settable via file_setattr() and
retrievable via statx(2) (using STATX_PTIME) or file_getattr().

The semantics of when to preserve this new timestamp are the same as
mtime, the idea being that there is a correspondence like this:

ctime <-> btime
mtime <-> ptime

so every operation (copying, moving, ...) that currently preserves mtime
should also preserve ptime.

Furthermore, in order to avoid the legacy FS_IOC_FSSETXATTR accepting
FS_XFLAG_PTIME, add an FS_FILE_ATTR_XFLAGS_MASK mask to support new
xflags, and use it in fileattr_to_file_attr()/file_attr_to_fileattr() to
allow ptime to be used with the file_setattr()/file_getattr() syscalls.

[ This is a re-implementation of the initial patch[1] by Sean Smith
  <defendthedisabled@gmail.com>, following the advice[2] from Darrick J.
  Wong <djwong@kernel.org> of using file_setattr() instead of updating
  utimensat() ]

[1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@gmail.com
[2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/file_attr.c            | 33 +++++++++++++++++++++++++++++++--
 fs/stat.c                 |  2 ++
 include/linux/fileattr.h  |  5 +++++
 include/linux/stat.h      |  1 +
 include/uapi/linux/fs.h   |  8 +++++++-
 include/uapi/linux/stat.h |  7 ++++++-
 6 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 833e03810b24..c0645cb22bf3 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -102,7 +102,7 @@ EXPORT_SYMBOL(vfs_fileattr_get);
 static void fileattr_to_file_attr(const struct file_kattr *fa,
 				  struct file_attr *fattr)
 {
-	__u32 mask = FS_XFLAGS_MASK;
+	__u32 mask = FS_FILE_ATTR_XFLAGS_MASK;
 
 	memset(fattr, 0, sizeof(struct file_attr));
 	fattr->fa_xflags = fa->fsx_xflags & mask;
@@ -110,6 +110,8 @@ static void fileattr_to_file_attr(const struct file_kattr *fa,
 	fattr->fa_nextents = fa->fsx_nextents;
 	fattr->fa_projid = fa->fsx_projid;
 	fattr->fa_cowextsize = fa->fsx_cowextsize;
+	fattr->fa_ptime_sec = fa->fsx_ptime.tv_sec;
+	fattr->fa_ptime_nsec = fa->fsx_ptime.tv_nsec;
 }
 
 /**
@@ -141,15 +143,20 @@ EXPORT_SYMBOL(copy_fsxattr_to_user);
 static int file_attr_to_fileattr(const struct file_attr *fattr,
 				 struct file_kattr *fa)
 {
-	__u64 mask = FS_XFLAGS_MASK;
+	__u64 mask = FS_FILE_ATTR_XFLAGS_MASK;
 
 	if (fattr->fa_xflags & ~mask)
 		return -EINVAL;
 
+	if (fattr->fa_pad != 0)
+		return -EINVAL;
+
 	fileattr_fill_xflags(fa, fattr->fa_xflags & ~FS_XFLAG_RDONLY_MASK);
 	fa->fsx_extsize = fattr->fa_extsize;
 	fa->fsx_projid = fattr->fa_projid;
 	fa->fsx_cowextsize = fattr->fa_cowextsize;
+	fa->fsx_ptime.tv_sec = fattr->fa_ptime_sec;
+	fa->fsx_ptime.tv_nsec = fattr->fa_ptime_nsec;
 
 	return 0;
 }
@@ -232,6 +239,20 @@ static int fileattr_set_prepare(struct inode *inode,
 	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
 		return -EINVAL;
 
+	if (fa->fsx_xflags & FS_XFLAG_PTIME) {
+		if (!(old_ma->fsx_xflags & FS_XFLAG_PTIME))
+			return -EOPNOTSUPP;
+
+		if ((unsigned long)fa->fsx_ptime.tv_nsec >= NSEC_PER_SEC)
+			return -EINVAL;
+
+		fa->fsx_ptime = timestamp_truncate(fa->fsx_ptime, inode);
+
+		if (!timespec64_equal(&old_ma->fsx_ptime, &fa->fsx_ptime) &&
+		    (fa->flags & old_ma->flags) & (FS_APPEND_FL | FS_IMMUTABLE_FL))
+			return -EPERM;
+	}
+
 	/*
 	 * It is only valid to set the DAX flag on regular files and
 	 * directories on filesystems.
@@ -293,6 +314,7 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 			fa->fsx_nextents = old_ma.fsx_nextents;
 			fa->fsx_projid = old_ma.fsx_projid;
 			fa->fsx_cowextsize = old_ma.fsx_cowextsize;
+			fa->fsx_ptime = old_ma.fsx_ptime;
 		} else {
 			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
 		}
@@ -423,6 +445,10 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const char __user *, filename,
 		return error;
 
 	fileattr_to_file_attr(&fa, &fattr);
+
+	if (usize < FILE_ATTR_SIZE_VER1)
+		fattr.fa_xflags &= ~FS_XFLAG_PTIME;
+
 	error = copy_struct_to_user(ufattr, usize, &fattr,
 				    sizeof(struct file_attr), NULL);
 
@@ -459,6 +485,9 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const char __user *, filename,
 	if (error)
 		return error;
 
+	if ((fattr.fa_xflags & FS_XFLAG_PTIME) && usize < FILE_ATTR_SIZE_VER1)
+		return -EINVAL;
+
 	error = file_attr_to_fileattr(&fattr, &fa);
 	if (error)
 		return error;
diff --git a/fs/stat.c b/fs/stat.c
index a2e63c6c45b7..e426f41253f6 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -728,6 +728,8 @@ cp_statx(const struct kstat *stat, struct statx __user *buffer)
 	tmp.stx_ctime.tv_nsec = stat->ctime.tv_nsec;
 	tmp.stx_mtime.tv_sec = stat->mtime.tv_sec;
 	tmp.stx_mtime.tv_nsec = stat->mtime.tv_nsec;
+	tmp.stx_ptime.tv_sec = stat->ptime.tv_sec;
+	tmp.stx_ptime.tv_nsec = stat->ptime.tv_nsec;
 	tmp.stx_rdev_major = MAJOR(stat->rdev);
 	tmp.stx_rdev_minor = MINOR(stat->rdev);
 	tmp.stx_dev_major = MAJOR(stat->dev);
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 09e32b84e02a..0b93f9609284 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -35,6 +35,10 @@
 	(FS_XFLAG_COMMON | FS_XFLAG_RDONLY_MASK | FS_XFLAG_VALUES_MASK | \
 	 FS_XFLAG_DIRONLY_MASK | FS_XFLAG_MISC_MASK)
 
+/* Flags only for fa_ fields */
+#define FS_FILE_ATTR_XFLAGS_MASK \
+	(FS_XFLAGS_MASK | FS_XFLAG_PTIME)
+
 /*
  * Merged interface for miscellaneous file attributes.  'flags' originates from
  * ext* and 'fsx_flags' from xfs.  There's some overlap between the two, which
@@ -49,6 +53,7 @@ struct file_kattr {
 	u32	fsx_nextents;	/* nextents field value (get)	*/
 	u32	fsx_projid;	/* project identifier (get/set) */
 	u32	fsx_cowextsize;	/* CoW extsize field value (get/set)*/
+	struct timespec64 fsx_ptime; /* provenance (settable birth) time */
 	/* selectors: */
 	bool	flags_valid:1;
 	bool	fsx_valid:1;
diff --git a/include/linux/stat.h b/include/linux/stat.h
index 9c5709132862..69d2ecfd1bf2 100644
--- a/include/linux/stat.h
+++ b/include/linux/stat.h
@@ -48,6 +48,7 @@ struct kstat {
 	struct timespec64 mtime;
 	struct timespec64 ctime;
 	struct timespec64 btime;			/* File creation time */
+	struct timespec64 ptime;	/* File provenance (user-settable creation) time */
 	u64		blocks;
 	u64		mnt_id;
 	u64		change_cookie;
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index a46c33692aa2..c00e72fcfa3e 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -229,10 +229,14 @@ struct file_attr {
 	__u32 fa_nextents;	/* nextents field value (get)   */
 	__u32 fa_projid;	/* project identifier (get/set) */
 	__u32 fa_cowextsize;	/* CoW extsize field value (get/set) */
+	__s64 fa_ptime_sec;	/* provenance (settable birth) time (seconds) */
+	__u32 fa_ptime_nsec;	/* provenance (settable birth) time (nanoseconds) */
+	__u32 fa_pad;
 };
 
 #define FILE_ATTR_SIZE_VER0 24
-#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
+#define FILE_ATTR_SIZE_VER1 40
+#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
 
 /*
  * Flags for the fsx_xflags field
@@ -261,6 +265,8 @@ struct file_attr {
  */
 #define FS_XFLAG_CASEFOLD	0x00040000	/* case-insensitive lookups */
 #define FS_XFLAG_CASENONPRESERVING 0x00080000	/* case not preserved */
+
+#define FS_XFLAG_PTIME		0x00100000	/* provenance time */
 #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
 
 /* the read-only stuff doesn't really belong here, but any other place is
diff --git a/include/uapi/linux/stat.h b/include/uapi/linux/stat.h
index 1686861aae20..f3a1013ba022 100644
--- a/include/uapi/linux/stat.h
+++ b/include/uapi/linux/stat.h
@@ -187,7 +187,11 @@ struct statx {
 	__u32	__spare2[1];
 
 	/* 0xc0 */
-	__u64	__spare3[8];	/* Spare space for future expansion */
+	/* Data provenance (creation) time */
+	struct statx_timestamp	stx_ptime;
+
+	/* 0xd0 */
+	__u64	__spare3[6];	/* Spare space for future expansion */
 
 	/* 0x100 */
 };
@@ -219,6 +223,7 @@ struct statx {
 #define STATX_SUBVOL		0x00008000U	/* Want/got stx_subvol */
 #define STATX_WRITE_ATOMIC	0x00010000U	/* Want/got atomic_write_* fields */
 #define STATX_DIO_READ_ALIGN	0x00020000U	/* Want/got dio read alignment info */
+#define STATX_PTIME		0x00040000U	/* Want/got stx_ptime */
 
 #define STATX__RESERVED		0x80000000U	/* Reserved for future struct statx expansion */
 
-- 
2.56.0

