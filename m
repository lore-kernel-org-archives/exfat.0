Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293731;
	b=ygAz5+zOL60/ms0HdALouwhaSeFv+Q2AU5rEWHFfLFKvbKR9VbnwdvIg1B31Afphee+h
	 obh71wftsvFkJ6mnaO7DtxfADO5mGM9yN6X3PDzlW81NNrZuEFxg37Fq0T/LjPZo54fTb
	 mxLp52SGcInieBnscjfX5VuTLVtFobJeJlBYg6sYXEtorBgnOBZHCer4k0UOmg0ZG0uwC
	 iIxeF8sJyjyZJQ/QCA82TbHBQq2Z/solEB68l8PjH+0OOTKjZGCfL77glhknYwg0rlrFu
	 mduUZVp95uVi/WtRo7wyjqAbk09eon921pE3nLAtz9mPp7HUThpbjo/il1JWyJ6McVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293731;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CAw42781NxeoRbb8+lQ1OeAlD4HexrZV/fmkNXPwCzk=;
	b=aAXIaS4hhAzxnXYIdFrXILYijzrWfrL8OlP7lAE5+EFolqfQlU38nE3BgxLmCEXlARNd
	 Rt8opbx+It8enDhRhye+WqmLnINkbJugiD65vCPFRbTssE5fxX9gfEewibQhpRmVQuBQv
	 jeihj4X7X9KywMJSbaezAy9vwPa/KEM8wwIgqDRrOu5omSnzMHd8Rafnu3R+e3iMhVRwb
	 2OY9sfOfSmXE+gM9q8md4PfjeItdbH7hUxV0IH2sIhtyQDyJjQ4RwpvQjsgsAglRjDSED
	 TqpDP1jdMcdt1wDDZa/ASWJeQ0+nQIsAqVkp6bYY68SqwDAMf5YR0Xu24jq5hI+Wvpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b="pJhs/ep3";
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7EB606A321
	for <exfat@lists.linux.dev>; Tue, 10 Nov 2026 06:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E7EB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=pJhs/ep3
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id D47E11D47B;
	Tue, 10 Nov 2026 06:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me D47E11D47B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794293724; bh=ItVpGvMoPFhkOQwno/k4hWkNFTn03+W/5fLCFJkfBP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJhs/ep3I/pzTgLwbRkHiOVAjDEFQFGENnrzYxvQrwccfN/D1mvypeX3ESdZSKqd8
	 qjFJvs5LyM/LfZ3ZcWLJgmB4cqgyDtcmVl92q3micCAwzyudcGnTthRyV5jUDzj4gp
	 7ceEerNWYMLupKyNJWZ0kfcsYIc0gzfBTgbGdcS0=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id /GyMLta/8mq/UAEA8KYfjw:T3
	(envelope-from <dxdt@dev.snart.me>); Tue, 10 Nov 2026 06:55:22 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 2/7] lib: make exfat_parse_guid() library function
Date: Tue, 10 Nov 2026 06:54:36 +0000
Message-ID: <20261110065441.63590-3-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110065441.63590-1-dxdt@dev.snart.me>
References: <20261110065441.63590-1-dxdt@dev.snart.me>
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

Make exfat_parse_guid(), which was previously set_guid(), a library
function for upcoming features. Take an extra param type for error
messages.

No functional change.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 include/libexfat.h |  2 ++
 lib/libexfat.c     | 13 ++++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/libexfat.h b/include/libexfat.h
index 1364d25..3749086 100644
--- a/include/libexfat.h
+++ b/include/libexfat.h
@@ -386,6 +386,8 @@ DECLARE_PARSE_NUM(long, exfat_parse_long);
 DECLARE_PARSE_NUM(long long, exfat_parse_longlong);
 #undef DECLARE_PARSE_NUM
 
+int exfat_parse_guid(__u8 *guid, const char *input, const char *type);
+
 /*
  * Parse a software version string
  *
diff --git a/lib/libexfat.c b/lib/libexfat.c
index 3484a48..af96884 100644
--- a/lib/libexfat.c
+++ b/lib/libexfat.c
@@ -1294,14 +1294,17 @@ out:
 	return err;
 }
 
-static int set_guid(__u8 *guid, const char *input)
+int exfat_parse_guid(__u8 *guid, const char *input, const char *type)
 {
 	__u8 buf[EXFAT_GUID_LEN];
 	int i, j, zero_len = 0;
 	int len = strlen(input);
 
+	if (type == NULL)
+		type = "GUID";
+
 	if (len != EXFAT_GUID_LEN * 2 && len != EXFAT_GUID_LEN * 2 + 4) {
-		exfat_err("invalid format for volume guid\n");
+		exfat_err("invalid format for %s\n", type);
 		return -EINVAL;
 	}
 
@@ -1318,7 +1321,7 @@ static int set_guid(__u8 *guid, const char *input)
 			 (i == 8 || i == 13 || i == 18 || i == 23))
 			continue;
 		else {
-			exfat_err("invalid character '%c' for volume GUID\n", ch);
+			exfat_err("invalid character '%c' for %s\n", ch, type);
 			return -EINVAL;
 		}
 
@@ -1334,7 +1337,7 @@ static int set_guid(__u8 *guid, const char *input)
 	}
 
 	if (zero_len == EXFAT_GUID_LEN * 2) {
-		exfat_err("%s is invalid for volume GUID\n", input);
+		exfat_err("%s is invalid for %s\n", input, type);
 		return -EINVAL;
 	}
 
@@ -1398,7 +1401,7 @@ int __exfat_set_volume_guid(struct exfat_dentry *dentry, const char *guid)
 	memset(dentry, 0, sizeof(*dentry));
 	dentry->type = EXFAT_GUID;
 
-	err = set_guid(dentry->dentry.guid.guid, guid);
+	err = exfat_parse_guid(dentry->dentry.guid.guid, guid, "volume GUID");
 	if (err)
 		return err;
 
-- 
2.56.0

