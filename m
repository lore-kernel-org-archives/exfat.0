Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793498246;
	b=K5gI5aFRlXY64KG8lufFUjHcHoURrawTxhyAF+IbrwzsHTTS0/wwjLnk5QGro07zoeu5
	 yoEA5UEbYaFFvSuyZ71KiHumSk9+BypLs4cXFqciwWw5iHpgdUnEKCABMeEGWivbBlzkz
	 QfRnCksV6w2fp0jvtd5hfJGwPqkGKVdyW0Lj6Sq6A2ovTmNZRcmTE8iePX45ajh3O5Jnk
	 9+1kl9m+h0OqA+bc9vlPjrA/J5RS53eb5IEES2aGm/h72EaUrjUcb40dh64L66PQStwQK
	 H8i3RHOf8j4Tt2DDLi7gQnhiYDYY8G2VWTU3MtEUSA85RndsCVA84M5e4ToOyUMC1dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793498246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9AHT+4uPvWe1t1h3zSSbp4rofXCcWo8UcjGq3mTB8UM=;
	b=TsP4vL7RfM8KpsSn1SWCHQZFvP2AfWwCDdOmcAAjnKqoEnsTMWgv48pzNq60vib7aei+
	 NKdLf8uYdT5lHRoYfseWgC1d2mbEjBJ9S/BGjFVXlAQq8oo4SOLLKy14D3tg1xb8grEPU
	 Xe8UABcZNTWwSal8eNyhjHwGx8In/K8KCyr83e4rvNUU0xypNdmCXwJdIx+IMEzHL5QAe
	 ynLg7ILHo0qdeSsP7QRss5YwAcppGzOG8FlsYzLjmkHHVkp6/MyQs84Tdge6BBkk3BGvK
	 DqXdhX1icMkc4Jd21QaPKOY90IcMOMhFb1NrFjOloglI624XErKYSNBKJCQeA/Lx4zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqovdYU9;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7F60A2607
	for <exfat@lists.linux.dev>; Sun,  1 Nov 2026 01:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CB7F60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqovdYU9
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11948965e9.2
        for <exfat@lists.linux.dev>; Sat, 31 Oct 2026 18:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793498245; x=1794103045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AHT+4uPvWe1t1h3zSSbp4rofXCcWo8UcjGq3mTB8UM=;
        b=yqovdYU95DsXBqNs8ObhfwVaopEBfZhUdOhJXDiG2K9tlVf1JGiSvgq+n30do3YxHS
         Bp0J0XlDqTDcdX4tAyQ1nMzmKYo4e+FvhwFWxSkzBjvFaw5sVgokO7ANyR+QYP2W5W7w
         dPVG1N8Wy11cHkAjlLZKdCPoQ5J8FO1Nvg9ZcCUHeRmqZOpCzM5DJeiw/LSg95MU0UyA
         qFwnvHT57ScVVIoO9p2/LQWxeoA7clLftRUWtAUHYxAewDnkCR+GZ/2AbPAdQKTP4lL+
         MH/eqBHGmB2EgT8045CCyWotDOzcYULKlgqel0mC+RbPCtCceHZ5oPShh14U4+zYfqU4
         ZMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793498245; x=1794103045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9AHT+4uPvWe1t1h3zSSbp4rofXCcWo8UcjGq3mTB8UM=;
        b=q1Dp3px7ElAvpXC++4nolLrNrq1ahgPJyZj6Djjnb25VyQAHtuZnDV800TuBGglFCP
         kZ8ybbN8XpnWE2SQj0hVDV1T0irP6EKEQuR7DSsZqnbrCJeGM+Yy260p2Kr0oSc+vUey
         N7+qk8XPTPXSXBl59bLj98WZQPKPd+DxwXIcTRNZVIqWNUOEAzO6NWWtOPqe9uyFiKk0
         2mCx+f/UO4NFyJA5Qn6MszJ9gAX0xMA2B6z3p/VLIMLQl3ZVPDZLfJE+o9y6MlOo+lmV
         jB8gNmQv5tjeUE6EJNPlKGFRoOHtXT44dXRyelHesKWq1L7Ue3Lf9AkygmfpdpbqvsSb
         F/zA==
X-Forwarded-Encrypted: i=1; AKwUvBy7AADsiOSE7Za6VYluBbNpZJgT+d+0VhUkA6fqSB/8dXCCjHFAMee8YoTcoYZLIqBbSj7IIQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK1lyisDN/gUsIG1XG3J0erzoqGA9IyXwuZuTdu2cX6R6dei+Q0
	QyejG3dR3UfsMrckV0heUPPfqRZrqyxXXOOp9KdEZMKeR2q+/fC0uQNc
X-Gm-Gg: AYBFou3GTq0PY01KZP9H9W/QYkP2I3l6tnFHYjiuK8hMw5nH3DnAnAr/SG1aPzLFZRp
	vgpuwJ5P9Of5pumnuT7wd+r2ZXjozAVqz48+0H5rDET1eUP1oAdn1pyDDZTxZ2FO6wCaeuNkb2h
	HN5A6hyivo/HyjH9Tgcm5T4+Yg63VIYGwtxDSdU7yIBA0eupvgc0DCRyi9t+MoE35JK1A0MEuyF
	VPQwpU1zAPH15ndUy3L94PtbdT/eIzbcRLuq434e2WhiC0AcFyGtJRn5w9+VbG2C/+BhBkWcSi1
	RZefkTSzPE3oavh6g1XsQOxda6Zl8Fnnqsh2U12oaJqK4rgP8vlf1glhFpPoCAMuAqrC9/rlJT5
	MA/S3vH8Ka/i6z7fr6rXFhRmumdNGLwXZASzDcWxlTKmIzXJZ+ke9ZyqaoRjQTDoD/CzTKCeaik
	7RgxPEQpj43sLJ4a/8xBlF+gFSqi7T72LCG1XaCeVpEIFJy+7xc1nSnUJPQPgk4xdzCIn2Da181
	SlmOhQXfzA5YbnqFHq5/Rufy9f6D187SvWG1ZFsq39FOoGJw20uzd1fy8KqhZjduAUTw7CAl64B
	3swZ21hJXFzgDEI1u5g30rkl
X-Received: by 2002:a05:600c:3ba0:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ac151a84f0mr142228025e9.3.1793498244682;
        Sat, 31 Oct 2026 18:57:24 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm273532835e9.11.2026.10.31.18.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 18:57:23 -0700 (PDT)
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
Subject: [RFC PATCH v3 2/5] vfs: add fileattr_has_fsx_mask()
Date: Sun,  1 Nov 2026 02:55:48 +0100
Message-ID: <20261101015551.786044-3-koray.fra@gmail.com>
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

Add fileattr_has_fsx_mask() as a helper to let filesystems check for
unsupported xflags while allowing supported ones. Can be used in the
same way as fileattr_has_fsx().

Also make fileattr_has_fsx() a wrapper around fileattr_has_fsx_mask().

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.4.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 include/linux/fileattr.h | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index 0b93f9609284..16acc61c9af1 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -64,6 +64,23 @@ int copy_fsxattr_to_user(const struct file_kattr *fa, struct fsxattr __user *ufa
 void fileattr_fill_xflags(struct file_kattr *fa, u32 xflags);
 void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
 
+/**
+ * fileattr_has_fsx_mask - check for extended flags/attributes
+ * @fa:				fileattr pointer
+ * @allowed_xflags_mask:	additional xflags permitted
+ *
+ * Return: true if any attributes are present that are not represented in
+ * ->flags or @allowed_xflags_mask.
+ */
+static inline bool fileattr_has_fsx_mask(const struct file_kattr *fa,
+					 u32 allowed_xflags_mask)
+{
+	return fa->fsx_valid &&
+		((fa->fsx_xflags & ~(FS_XFLAG_COMMON | allowed_xflags_mask)) ||
+		 fa->fsx_extsize != 0 || fa->fsx_projid != 0 ||
+		 fa->fsx_cowextsize != 0);
+}
+
 /**
  * fileattr_has_fsx - check for extended flags/attributes
  * @fa:		fileattr pointer
@@ -73,9 +90,7 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
  */
 static inline bool fileattr_has_fsx(const struct file_kattr *fa)
 {
-	return fa->fsx_valid &&
-		((fa->fsx_xflags & ~FS_XFLAG_COMMON) || fa->fsx_extsize != 0 ||
-		 fa->fsx_projid != 0 ||	fa->fsx_cowextsize != 0);
+	return fileattr_has_fsx_mask(fa, 0);
 }
 
 int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
-- 
2.56.0

