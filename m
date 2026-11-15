Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765848;
	b=SipIMwU0sxSWtdg6roSLg66NIgh4Qb6wuyFdGWiFqKiIIHQslYxdegFGFF+fCpicCKss
	 LFcsqXTOF4Bu0KyyHxHbUbmCiN5HKzlh5/cqaFskpDADiOkpbvOvn8zJm7lURrIg+KPV+
	 YSXQG+K1WB8Ezzp0u9jXB9FbscTMTRjSABsn62IFSxjX9iYXRq4Zy1XfLirC1LX2ACE+7
	 J5g2fR0iZD8vLULr8bG6z97e1RGavR+nNByU36lbCc+1Ib4NbWtVA1tiecj0q8jkAPsPZ
	 VqRr7WB2uwfRNdnAeJEoAyv+fLRB7OOD8t/yR23eX+9Ij0IUZWJ4A6CRc9ovnSQ1Ybw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2ER6/NO7zpzo2Xjo4XaIJ1M2igxcKQmZBMoJ1KN6Ri4=;
	b=BnyO/jNgsDJUwFoy6I2VIjtQR6ULYmwCkgCBAfuoCfTU0ocIrb+d+BYt/zx+FSuBIegb
	 DgLdxfzbkmcSWcn2eiE8IWfPs3HIRaYkZSh+vXbYvR1vnZeW49RWQseb5Ai4TCtzqI4Qy
	 cTvuBOA3iC1LO+lmUIqKuq7+SUGcY3TG7IHYJAoRPh6D2g9Bo2TPYrKutS95QyjjS/tED
	 273sYLQVmha+5QYnGx4CKfBosCoG4TOd6YnbkXSmwo2m7lIJovnLL5HWhtCrcr5NRmkln
	 Z+XdU0zJKE1PPyc57wbWK9DTwbeB+Fj2AFHQaro+aPE9hARtwDnM5rP7MDUNkUstCsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lnd6KREC;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABDF60A2619
	for <exfat@lists.linux.dev>; Sun, 15 Nov 2026 18:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ABDF60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lnd6KREC
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so3000925f8f.0
        for <exfat@lists.linux.dev>; Sun, 15 Nov 2026 10:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765846; x=1795370646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ER6/NO7zpzo2Xjo4XaIJ1M2igxcKQmZBMoJ1KN6Ri4=;
        b=lnd6KREC5g2gTnk9StDpeeFvXZIvySfDHMghWW6ZY2XoKFgUNPBEayRo8jKh5nmXhr
         5ku8IVo+NLog+jreT00yOO+u0Ddw0nkTd17RFb3rXn3auIuDaUdMz0Z7pLI39GK3lH6O
         UXpF/Oqxv0aXAYnYEVWrr2EqSRi9GRYqdFfU8OHwU9abs1mlC+unoU2EpcX25ZvZoFAT
         KMvYjDXEz2SPMFTCA5tRp13cGvH0F9xjsKcgRzvBH+NQKSytcaom5/5JTgnSc7AJvI6n
         L98+WXQPDCj8Lr48Rz3f2m1WH2vR5roN8jYwNUc0Cx0jrTzZf/aZdZkUQCU73065k8XM
         ZC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765846; x=1795370646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ER6/NO7zpzo2Xjo4XaIJ1M2igxcKQmZBMoJ1KN6Ri4=;
        b=XF9zWqRNp42z/SXDlUO0iewpsBq0A6Dgs8pzQ9RgPAhT8j6SpHbbvCA5PEccBfDxG9
         a7KC4d3AV9UDYR/s6S7liA+yVPbVTOFkbTehQu0SP5rfJZ60NtBadVzFuHpthoajEPdt
         sm6NpEfk4vfCF3WZyOAARBQFYNUoMQqQYmBsRC9s9BppObzxkKev7RyedZuUmNOwft5G
         SpXrn/l5Kfdg1bQ4jWb6hgO57xtgmz1/9GAXfhwMdlXmuSiQwN0fJDMu4rj+d0l/LuC9
         ZKZxz3TFgAa6bG5NVcF4w1n3b1RtVLxtTWdlexJdpc/FtY8A6EaYrfheJ5SDZLONXywn
         uDWQ==
X-Forwarded-Encrypted: i=1; AL+hErH1rFR24W7ZlXgzzxcQ59MWt96PXWggkaTd3yek0ZhQvW7r9xTKG3NCqTCaJNp4Oc0ZNaLQUQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/SpEA7nGWQDI2yAh5zenmbPAW/ibe8iR5Q8IlKecluwe2BPYam
	NKvh9d/tH6rVFEXXjFvgwPO8jooydofnncAm7QbRBqbxMbvnKkA+TWAa
X-Gm-Gg: AYBFou3Ub90JN/sgtDzKfR1nxhH6r19jcBqNOJxK+Dr6RFUNAD30fEPiwx3hKNMtoZN
	C5d+kcFSAWox5FBNiFCGvpjseAuGTlxCdZ74YdRoeuhhzLA9n50TosjxlDGaAm9XMHjRDKU8Uru
	jeyG99N+nIrUOZT5FdSMbF7tyh35Cj/PAZugPAcv3i+7qsKDyznhAEB7xg2G7YD18q3Td0doOOU
	Uq09GiEwjhVSlw2pELbOppCS7RBI3ltq3zQTNtf2vB7lbNuXgEDsbUDkGXBB55adAkA1Iju32pM
	TXwkDQCgtAObTRzQb/w0VCmygI51znZnWyHiyMjeebsl2LLKWGNBB8Lxdhsqv7rcbsjh9N5BTvQ
	Z+/VXqukHAeOw6DSI8Rud19KL7gAQBJ6amAm5Atr4P8B9ZBh1Km6lLyD6cLL7DKAamiHrOPjyov
	2pZyBdOk8i3b5qevRy5Ksze3vZ4d+G7SHV7MyPntXnFyWew5sT11YTJq3rBvOIW6rgB7O3xTT+Y
	272QhPZLtQlfk8sOKeb2xB8IoDCdESipJN6gCFqTBmZ31DEE+NzLnCv9JvZNqHrdmZ7s5joA6e4
	5GDTjH4dNWTlc+4nNVPvkt7V
X-Received: by 2002:a5d:5d88:0:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-49c70ed8eaamr19692466f8f.18.1794765845937;
        Sun, 15 Nov 2026 10:04:05 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm17980448f8f.58.2026.11.15.10.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:04:05 -0800 (PST)
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
Subject: [RFC PATCH v4 03/10] ntfs3: make crtime user-settable using ptime
Date: Sun, 15 Nov 2026 19:03:36 +0100
Message-ID: <20261115180343.576773-4-koray.fra@gmail.com>
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

Since NTFS supports user-settable file creation timestamps, map
provenance time (ptime) to NTFS file creation time (crtime) by using the
newly introduced ptime API (in commit "vfs: add provenance time
(ptime)").

To do this, update ntfs_fileattr_[gs]et(), ntfs_getattr() and make it
persist to disk in ni_write_inode().

The timestamp is now retrievable by using file_getattr() or statx(), and
is settable by using file_setattr() with the FS_XFLAG_PTIME flag.

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/ntfs3/file.c    | 20 ++++++++++++++++++--
 fs/ntfs3/frecord.c |  8 +++++++-
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 6c84a3e1c7fe..1a9301006154 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -90,6 +90,8 @@ static int ntfs_ioctl_fitrim(struct ntfs_sb_info *sbi, unsigned long arg)
 	return 0;
 }
 
+#define NTFS_SUPPORTED_XFLAGS		(FS_XFLAG_PTIME)
+
 /*
  * ntfs_fileattr_get - inode_operations::fileattr_get
  */
@@ -124,6 +126,11 @@ int ntfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 
 	fileattr_fill_flags(fa, flags);
 
+	fa->fsx_ptime.tv_sec = ni->i_crtime.tv_sec;
+	fa->fsx_ptime.tv_nsec = ni->i_crtime.tv_nsec;
+	fa->fsx_xflags |= FS_XFLAG_PTIME;
+	fa->fsx_xflags_mask |= FS_XFLAG_PTIME;
+
 	return 0;
 }
 
@@ -142,7 +149,10 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 	if (unlikely(is_bad_ni(ni)))
 		return -EINVAL;
 
-	if (fileattr_has_fsx(fa))
+	if (fileattr_has_fsx_mask(fa, NTFS_SUPPORTED_XFLAGS))
+		return -EOPNOTSUPP;
+
+	if (fa->fsx_xflags_mask & ~NTFS_SUPPORTED_XFLAGS)
 		return -EOPNOTSUPP;
 
 	if (flags & ~(FS_IMMUTABLE_FL | FS_APPEND_FL | FS_NODUMP_FL))
@@ -154,6 +164,11 @@ int ntfs_fileattr_set(const struct mnt_idmap *idmap, struct dentry *dentry,
 	if (flags & FS_APPEND_FL)
 		new_fl |= S_APPEND;
 
+	if (fa->fsx_xflags_mask & FS_XFLAG_PTIME) {
+		ni->i_crtime.tv_sec = fa->fsx_ptime.tv_sec;
+		ni->i_crtime.tv_nsec = fa->fsx_ptime.tv_nsec;
+	}
+
 	inode_set_flags(inode, new_fl, S_IMMUTABLE | S_APPEND);
 
 	/* Save nodump flag to return in ntfs_getattr. */
@@ -275,8 +290,9 @@ int ntfs_getattr(const struct mnt_idmap *idmap, const struct path *path,
 	if (unlikely(is_bad_ni(ni)))
 		return -EINVAL;
 
-	stat->result_mask |= STATX_BTIME;
+	stat->result_mask |= (STATX_BTIME | STATX_PTIME);
 	stat->btime = ni->i_crtime;
+	stat->ptime = ni->i_crtime;
 	stat->blksize = ni->mi.sbi->cluster_size; /* 512, 1K, ..., 2M */
 
 	if (inode->i_flags & S_IMMUTABLE)
diff --git a/fs/ntfs3/frecord.c b/fs/ntfs3/frecord.c
index 16ac847de48d..5e4f743a5930 100644
--- a/fs/ntfs3/frecord.c
+++ b/fs/ntfs3/frecord.c
@@ -3215,6 +3215,13 @@ int ni_write_inode(struct inode *inode, int sync, const char *hint)
 		}
 
 		/* Update the access times if they have changed. */
+		ts = ni->i_crtime;
+		dup.cr_time = kernel2nt(&ts);
+		if (std->cr_time != dup.cr_time) {
+			std->cr_time = dup.cr_time;
+			modified = true;
+		}
+
 		ts = inode_get_mtime(inode);
 		dup.m_time = kernel2nt(&ts);
 		if (std->m_time != dup.m_time) {
@@ -3250,7 +3257,6 @@ int ni_write_inode(struct inode *inode, int sync, const char *hint)
 		    (modified || (ni->ni_flags & NI_FLAG_UPDATE_PARENT))
 		    /* Avoid __wait_on_freeing_inode(inode). */
 		    && (sb->s_flags & SB_ACTIVE)) {
-			dup.cr_time = std->cr_time;
 			/* Not critical if this function fail. */
 			re_dirty = ni_update_parent(ni, &dup, sync);
 
-- 
2.56.0

