Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765856;
	b=Aw6Pae1H6pilC+8l68fsrLLg+SGMs7dw69FzwuSm3EtFta9UvZokJtujQn2hevPb8U5J
	 G43RAL4nobu/CuF7gUMiz4MNbPFA+W99SyYcyowL3YyOOkL4RLmdWNDw/nqf+T3mDmaTi
	 1ZlLBN/MAR8Vc/IvyLrjeE0eGMozhyOftWMPQ0JPaAxfQ6iimV+l93It+jNxGbx8Nx4Mf
	 X/Xnze46i7g16NLdCj/QyCP2dqQvWEg2qrr2pdLDsuFyIXsztCQPSL5n2uQ1hjm08CPL9
	 FV0wbBuGLC8RXFUHTQ++mIcJpLT48KNNo5MNPVmh+6WGhGN7DZtFFjiwEGqXsT2JojQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dt00QcB/UAbcoWfb+Nc1N3msJVe+tAMzrHb6Fo7W5/Y=;
	b=SyhzE6kHCE6rld278IgavJiLJHtUK4d0EmQcMl1R2EbIh6ER7ZVZqyyBCJ4pJ6wePHh5
	 nKeaACENP/tdTqpzvY0yfiRTjQ6sol9cjvbkUiPR4z7K/LN4aZINq+50v/QZW+PPEszbu
	 zKnPABw7anVtNtsOD/Va3YCk3QVugDwTPOw8BEjSIY6HQanr76aZe10pLHdhrEEyU6JQt
	 BJNgwilmi0B60tt1xQA+k3Pbx9wwXOmn4fPdcHofA7TPn7WIaA7NxPV81tojLwvlpHrwy
	 XlIIOyLIj3E9w6TrcnZL8QHOMq8in5tQh6LVsVCiDmrLfcUnyA1CIAiz9g8zlkW4zWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnWKGNfv;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0987D60A383C
	for <exfat@lists.linux.dev>; Sun, 15 Nov 2026 18:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0987D60A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnWKGNfv
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491d1f66968so472652f8f.0
        for <exfat@lists.linux.dev>; Sun, 15 Nov 2026 10:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765852; x=1795370652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dt00QcB/UAbcoWfb+Nc1N3msJVe+tAMzrHb6Fo7W5/Y=;
        b=fnWKGNfvu1NLmZJ+NtYa7PY5XM6BavYk3zvZ1ZOKtrRk59Sfa5KCnc9rjVH5+N/JSm
         Z2omgy8HpSzdHl83O6F2DEFZK7XPtuZGA04M6v+IMoBOuA3RO0rp8oRkToihwUqRsxEh
         2hwmYKkgCYlRt1G+LvYYeIHjQ0BC5IhwNk8t7fYL6G9YwsGRtq9m2u8PLAxgYJLQ56/Y
         WxWXvOHbFmbIP5w0cSYkEufc5xgvXeQygrdMQUJqfIt90/9e7a4T1XfNz1BIAvMYW3gW
         9MPpLC5NGYdNHK+BfeyL3hP23ikFqan3PDnMPLtgtqeKO+FkfduNfEGigBt7CVZXJ21F
         H8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765852; x=1795370652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dt00QcB/UAbcoWfb+Nc1N3msJVe+tAMzrHb6Fo7W5/Y=;
        b=JcR7bWIocx4GaQkyXQr02qLoDXKOwboNI36p8rEsnwJ5Ul/pI8a66R/iftzzveyqfl
         zUgIUuwBIWsErPuDIixZJvhhzvcrL4lFbtt4eBzqjwjVtJy5C3yL6xL1RtXTBRXSmk7h
         4LMf/+113T267ZZiGFzzUyHlz0cj9C+BQvQiDyo3zxjFd4T1P2LVC0K0hIe5snbe57gJ
         7DBtK9lPvmf/JyFBM6ctriGqw2WSnHFoBw1cdxHa4yKoALeuNw0OVRLziSLiMSQbR/me
         CINA7DAgp+uClqPa4GoY7BfnrakWnOtw0MxemB9yy1Hyro3tpRdyMuI7OG8cIoY9iv9m
         uYjw==
X-Forwarded-Encrypted: i=1; AL+hErGWiMOHEKovhxfZuyei3Ug1H495Zr7ky3oCTuAr3MeFThnShGVoaQcnlL/bqxAklnmSDoeGvA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/rh5TA82shTI2jTFqEkaJbKjtagx2HivjmkUSfBwNZaw8KLPSU
	ZndRYk4LaC+kbShh4xAzT9TtiODLP1wcMr8OgDeCZUJ9CeCFcsCrrQnz
X-Gm-Gg: AYBFou3WMVzrjL+b2W3O5K4aPTiHumI56aDBwO5QQbf5RoAbG+al6HeG5LTwPoOHJLm
	EDvmIsigy4gyNzbEdm/1u7oGZ0Bk+JjoZWm+GIx3ypoJoK/M8C7AZwGoLG50YjWFsA/fJ7jS+qP
	OszlpGSt2uVepAf5VaLgABtBVEkjI/JnXKgv3FJ+GPUrvMEeLFfZAWBx2JJOvd3P+86XCQ6p+Jn
	ZhjktuUfx9P1bfmGnpbHDgCoXrMr+akuPpajIUHcb57DP/nbSbXlow7QO0cHRyyJHEpffTeKRLm
	ywKsVBvu0UFoI+kCedh+SsDpow0aNyZeLJtMW82nF2xs3g6bhmTyK5w8gvG/jw5xST6+qsJ1XcO
	aKCBnD6K16JpjWC1/Pu+RR2Hau8sRboOKFCc9ycLYTZXyu5n21vbXciMsfocHM0jtR2/34O5odI
	lj/PR2LYAq5jhDlx/BEsgkCaQmMjjhNDxqX0MGmqs8n2nmebx/7CGlf1Z13nVYKAHB7S77OzHPe
	LDYZ3rUl3WlWOtwfj6Bucd0kHN3fbvM666Le8udvyQhQHWnp+E2n7D8D9AWq4DLWiGUktdTMJS1
	i/DodBHR2EkwXCEswJ2cMpYl
X-Received: by 2002:a05:6000:4022:b0:49e:1601:2fb1 with SMTP id ffacd0b85a97d-49e1601310bmr10387323f8f.24.1794765852233;
        Sun, 15 Nov 2026 10:04:12 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm17980448f8f.58.2026.11.15.10.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:04:11 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Paulo Alcantara <pc@manguebit.org>
Cc: Chris Mason <mason@kernel.org>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v4 06/10] vfs: add __vfs_fileattr_set_locked() for inode_lock()'d callers
Date: Sun, 15 Nov 2026 19:03:39 +0100
Message-ID: <20261115180343.576773-7-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115180343.576773-1-koray.fra@gmail.com>
References: <20261115180343.576773-1-koray.fra@gmail.com>
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

Currently there is no way for a caller to invoke vfs_fileattr_set()
while holding an inode lock without having the kernel go into deadlock.

Fix this by moving the vfs_fileattr_set() logic into
__vfs_fileattr_set_locked() and making vfs_fileattr_set() a simple
wrapper that only handles the inode lock.

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/file_attr.c           | 139 +++++++++++++++++++++++----------------
 include/linux/fileattr.h |   2 +
 2 files changed, 86 insertions(+), 55 deletions(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 12610fb6a751..063c81fbfa6a 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -288,6 +288,89 @@ static int fileattr_set_prepare(struct inode *inode,
 	return 0;
 }
 
+/**
+ * __vfs_fileattr_set_locked - change miscellaneous file attributes while
+ * holding the inode lock
+ *
+ * @idmap:	idmap of the mount
+ * @dentry:	the object to change
+ * @fa:		fileattr pointer
+ *
+ * Same as vfs_fileattr_set(), but caller must hold the inode lock.
+ *
+ * Return: 0 on success, or a negative error on failure.
+ */
+int __vfs_fileattr_set_locked(const struct mnt_idmap *idmap, struct dentry *dentry,
+			      struct file_kattr *fa)
+{
+	struct inode *inode = d_inode(dentry);
+	struct file_kattr old_ma = {};
+	int err;
+
+	if (!inode->i_op->fileattr_set)
+		return -ENOIOCTLCMD;
+
+	if (!inode_owner_or_capable(idmap, inode))
+		return -EPERM;
+
+	err = vfs_fileattr_get(dentry, &old_ma);
+	if (err)
+		return err;
+
+	/* initialize missing bits from old_ma */
+	if (fa->flags_valid) {
+		/* FS_IOC_SETFLAGS */
+		fa->fsx_xflags |= (old_ma.fsx_xflags & FS_XFLAGS_MASK) &
+				  ~FS_XFLAG_COMMON;
+		fa->fsx_extsize = old_ma.fsx_extsize;
+		fa->fsx_nextents = old_ma.fsx_nextents;
+		fa->fsx_projid = old_ma.fsx_projid;
+		fa->fsx_cowextsize = old_ma.fsx_cowextsize;
+		fa->fsx_ptime = old_ma.fsx_ptime;
+	} else {
+		/*
+		 * Preserve unmasked xflags when running file_setattr()
+		 * with a mask, which doesn't need a read-modify-write
+		 * so these attributes would be set to 0.
+		 *
+		 * With FS_IOC_FSSETXATTR or mask == 0 (legacy mode)
+		 * this is not needed as userspace does
+		 * read-modify-write already.
+		 */
+		if (fa->fsx_xflags_mask) {
+			fa->fsx_xflags |= old_ma.fsx_xflags &
+					  ~fa->fsx_xflags_mask;
+			fileattr_fill_xflags(fa, fa->fsx_xflags &
+					     ~FS_XFLAG_RDONLY_MASK);
+			if (!(fa->fsx_xflags_mask & FS_XFLAG_EXTSIZE))
+				fa->fsx_extsize = old_ma.fsx_extsize;
+			if (!(fa->fsx_xflags_mask & FS_XFLAG_PROJID))
+				fa->fsx_projid = old_ma.fsx_projid;
+			if (!(fa->fsx_xflags_mask & FS_XFLAG_COWEXTSIZE))
+				fa->fsx_cowextsize = old_ma.fsx_cowextsize;
+		}
+		fa->flags |= old_ma.flags & ~FS_COMMON_FL;
+
+		/* xflags not present in fsxattr */
+		if (!(fa->fsx_xflags_mask & FS_XFLAG_PTIME))
+			fa->fsx_ptime = old_ma.fsx_ptime;
+	}
+
+	err = fileattr_set_prepare(inode, &old_ma, fa);
+	if (err)
+		return err;
+	err = security_inode_file_setattr(dentry, fa);
+	if (err)
+		return err;
+	err = inode->i_op->fileattr_set(idmap, dentry, fa);
+	if (err)
+		return err;
+	fsnotify_xattr(dentry);
+
+	return 0;
+}
+EXPORT_SYMBOL(__vfs_fileattr_set_locked);
+
 /**
  * vfs_fileattr_set - change miscellaneous file attributes
  * @idmap:	idmap of the mount
@@ -308,7 +391,6 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 		     struct file_kattr *fa)
 {
 	struct inode *inode = d_inode(dentry);
-	struct file_kattr old_ma = {};
 	int err;
 
 	if (!inode->i_op->fileattr_set)
@@ -318,60 +400,7 @@ int vfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 		return -EPERM;
 
 	inode_lock(inode);
-	err = vfs_fileattr_get(dentry, &old_ma);
-	if (!err) {
-		/* initialize missing bits from old_ma */
-		if (fa->flags_valid) {
-			/* FS_IOC_SETFLAGS */
-			fa->fsx_xflags |= (old_ma.fsx_xflags & FS_XFLAGS_MASK) &
-					  ~FS_XFLAG_COMMON;
-			fa->fsx_extsize = old_ma.fsx_extsize;
-			fa->fsx_nextents = old_ma.fsx_nextents;
-			fa->fsx_projid = old_ma.fsx_projid;
-			fa->fsx_cowextsize = old_ma.fsx_cowextsize;
-			fa->fsx_ptime = old_ma.fsx_ptime;
-		} else {
-			/*
-			 * Preserve unmasked xflags when running file_setattr()
-			 * with a mask, which doesn't need a read-modify-write
-			 * so these attributes would be set to 0.
-			 *
-			 * With FS_IOC_FSSETXATTR or mask == 0 (legacy mode)
-			 * this is not needed as userspace does
-			 * read-modify-write already.
-			 */
-			if (fa->fsx_xflags_mask) {
-				fa->fsx_xflags |= old_ma.fsx_xflags &
-						  ~fa->fsx_xflags_mask;
-				fileattr_fill_xflags(fa, fa->fsx_xflags &
-						     ~FS_XFLAG_RDONLY_MASK);
-				if (!(fa->fsx_xflags_mask & FS_XFLAG_EXTSIZE))
-					fa->fsx_extsize = old_ma.fsx_extsize;
-				if (!(fa->fsx_xflags_mask & FS_XFLAG_PROJID))
-					fa->fsx_projid = old_ma.fsx_projid;
-				if (!(fa->fsx_xflags_mask & FS_XFLAG_COWEXTSIZE))
-					fa->fsx_cowextsize = old_ma.fsx_cowextsize;
-			}
-			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
-
-			/* xflags not present in fsxattr */
-			if (!(fa->fsx_xflags_mask & FS_XFLAG_PTIME))
-				fa->fsx_ptime = old_ma.fsx_ptime;
-		}
-
-		err = fileattr_set_prepare(inode, &old_ma, fa);
-		if (err)
-			goto out;
-		err = security_inode_file_setattr(dentry, fa);
-		if (err)
-			goto out;
-		err = inode->i_op->fileattr_set(idmap, dentry, fa);
-		if (err)
-			goto out;
-		fsnotify_xattr(dentry);
-	}
-
-out:
+	err = __vfs_fileattr_set_locked(idmap, dentry, fa);
 	inode_unlock(inode);
 	return err;
 }
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index ba7ed3b387d8..7ff62ee27e58 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -97,6 +97,8 @@ static inline bool fileattr_has_fsx(const struct file_kattr *fa)
 int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
 int vfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 		     struct file_kattr *fa);
+int __vfs_fileattr_set_locked(const struct mnt_idmap *idmap, struct dentry *dentry,
+			      struct file_kattr *fa);
 int ioctl_getflags(struct file *file, unsigned int __user *argp);
 int ioctl_setflags(struct file *file, unsigned int __user *argp);
 int ioctl_fsgetxattr(struct file *file, void __user *argp);
-- 
2.56.0

