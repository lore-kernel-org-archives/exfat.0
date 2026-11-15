Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765845;
	b=xvCPkuFDbwDatL2RPVWNzUIcdY0efygZ0z2W63USM8o/NOZobA2GspuJbUP1GSORFyZS
	 48V5N41YSB/rTG76K+9QM/bc6IocEcvDmjzTWSOqetO/zJjiOYVl392RJQZMF354fsGw3
	 Fnz6H7tlFTCMY9Uo+UKNHhcJ5IJzl0mY/cCchM5/NPvZqhwe+3gy39a9P0cXNG14uq2kK
	 5/XXnBlI9elIAX0IDt3zwnKnYn/XM0U9xqJK50DMhhczwGCS8BrfnGITbo9z9pKdjKbNY
	 J3j/vVXqlov4GLtdrEAQfshlfSRBNWNnEmG27YPCcqKjQOj8s0vXG6UPV6EAQG4sZfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jCob8yxVUbZMrzUJynGorNZ6cDsRus7pIoTivcXFIek=;
	b=j02i4W1w6h5Yn1gXkbAVkUZoWs6r4+4e6taTLpRivNKHEMpzUF3LV7LFDLleAKjD6oUp
	 RR1IZbU0JT7mg6v2ZRkjSyf0uzRuKNoLH2vQ0CqrT9GcIuaAJQ3gEJgHUjTifpBqzlmSL
	 101Q2eVVlaBCbqgQ5w46tvpv53RP/0HmlNdptAkB5RxtSRXkkIxE6wJXTBKsaldS9uK+w
	 1imV4aasdRCqhNXRwdKzEdXBR3NaQ5JI9A0AOttLffAZc6D55YZ+ZeRudcREsKjKVOSby
	 AKJ/umGknK0Lh6692ej1/E50/655/WwyXU/nxcTaz3oGw/SwkT/0oi0lUH6uH19kB4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAa1Kgm4;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54468606A8AE
	for <exfat@lists.linux.dev>; Sun, 15 Nov 2026 18:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54468606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAa1Kgm4
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e10a70540so1411313f8f.1
        for <exfat@lists.linux.dev>; Sun, 15 Nov 2026 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765844; x=1795370644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCob8yxVUbZMrzUJynGorNZ6cDsRus7pIoTivcXFIek=;
        b=ZAa1Kgm4CoZOu+Kv9Q7YmDXLfp+YEx5DbtFMYvKqrKKX70AxK1GWNnusmpTAOju/k3
         qJRPdU8iU9TkoffTxHQBuwl7M7jBmgAoT8MEPq3IlQexELierfXGL98DzbDJNG7t7kLZ
         6nMnWkMWjFax+plQplFeEJFrnBYpKu5WCZDpH4lX6J6+OjvO4+umVhwUW0bP+VtbcRKD
         /Dm5WdeP5I6yuQ2O5LvoiUGHmMikr4R6Z7/yBYrlzqwTuXDGK8M5K2XS2K6XEA/qWeUw
         wJVTY4Wbfr36BaeDiyKIiPf5/aHwIW7j6LPWLQ61pgF3fj4w6amygZESAWRqJeOLPQD0
         hQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765844; x=1795370644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jCob8yxVUbZMrzUJynGorNZ6cDsRus7pIoTivcXFIek=;
        b=SB/m6l/+qMdHtxVmPBUV26RnuUvNkqTekYaTEX0eKwvZTd5nazobxhW1U07neFx3In
         nGkRSeAgVVuujcDEe+snFymUCiY1CM+TXFVS2RSwvmyt9jrvb+TMISXwasSYnRI6e4ph
         1vAyFbTvwsZxgIhDkk5J7iJVF/34X2lCho8fhXK8ypOk02a3WaDzXpzdF+po1fnqnwUd
         jLJyKnLh6uRU73AAqjqj29475gkWwT/ReNr7pa8zK2ZVvxRaKv5KyfnHFUvfP7UhcQ/E
         TdX/ax+B6pcaGBWz1tGon/xLL41mxLMKsfjG+6cavF5TAX7+k5UK6bH6mUuwNcubwm84
         5Xjg==
X-Forwarded-Encrypted: i=1; AL+hErEEk/GXCb3y/4BV7b537FVe89I34FGgbMQPXh688Z1kiainYBDITyXHvAkkQNovcplkq8Cmug==@lists.linux.dev
X-Gm-Message-State: APuU4Z81+y9q33FSicervISeG1jXEJME4JTWdWPAsjW35JaKi8ZtxsE3
	jwRU173hTujYyj+aEffzdyuh0otgtfASt4RB7zGke2nDYcV0TxbS1cqK
X-Gm-Gg: AYBFou27EL0cWyt646TWNIbPOq+u2U1p0zfAsSj3yQwuCD8cGSXTIl5RA85FMONhjCA
	b/S5WiH1G1suIDA5paUGalxGI66AR923mofrN9NmQp3YawnttE+hDPr31jYTGhWa3vSvCbWYfes
	2S2/gy/nkkPPpSvABNtku2a2B1bjcfNN3Ycp5BYTZz7st9kqXFeqgFk6ODw9S6oAJoMiyuPmuOO
	avQh1G1wvVEEudrGtm7Y87kCKDSaTCMQF/KDirS1OJd5BOnH/k6nuoOfL302KpFpZdZsVXe0wcR
	8j61R2/ECOtAXW+fS+yD63N4Us81MQwnQqrRf8l7Ffmro8TNPT/quOGKYt8Pw7Vi/qaqoIdqam7
	fgnB6yelcLhf61Y19TmMg7AhiuDeChkjCUQ3Yr20/mQfxSmorN8qlGm8yxFgsWzjRYrRU7B5tN9
	ioGzQ148wGhTuMNsnvY4LGwW6cCjkqdoX3axr12JLzvKCzn13q2D37FU5QaE+UkVqrHMhe7vxiJ
	w8ediE9QaUrRKe7EniFV2oSjwBmvekkmHkDCgkZsLTw525lwmcNYGKK017wPfAybCAi1Q7WkZ+Q
	YmJlB0dh9kFZL6off6CF74Zt
X-Received: by 2002:a05:6000:1841:b0:48f:d7cd:a5ac with SMTP id ffacd0b85a97d-49c6b97336emr21325466f8f.0.1794765843381;
        Sun, 15 Nov 2026 10:04:03 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm17980448f8f.58.2026.11.15.10.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:04:02 -0800 (PST)
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
Subject: [RFC PATCH v4 02/10] vfs: add fileattr_has_fsx_mask()
Date: Sun, 15 Nov 2026 19:03:35 +0100
Message-ID: <20261115180343.576773-3-koray.fra@gmail.com>
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
index 42b92ccdc583..ba7ed3b387d8 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -65,6 +65,23 @@ int copy_fsxattr_to_user(const struct file_kattr *fa, struct fsxattr __user *ufa
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
@@ -74,9 +91,7 @@ void fileattr_fill_flags(struct file_kattr *fa, u32 flags);
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

