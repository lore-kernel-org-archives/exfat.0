Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F4A377A8A
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 20:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863311; cv=none; b=EU//MLvyMfSBlSUMir7ffrFFEFEZiIQmgIOSs24GL8zx5IHq/N02U19vCTmZxgF0+D59obmA3j57BJcTuPPGRzzuI9hUbZziGC5y/KxXPFSLRKR+ItPgQ1GxtmEZDnl+HfnVS25tySXuWdOxKPMjD/TIhF/4seghUC9luWP55XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863311; c=relaxed/simple;
	bh=dm24otsT6LfpGiRa3F0o9Z7jG8TpAhlds78hRVhU7Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=af3cacKnWNgVhu9S1XhwJ2Nq9BAk43PUy1bYdYcwyFlXiagUQpUU3eqljefb6mhu5NAAY0P4E467Xu/UMi85ocqGZiZa1JxKLdLDx9Fim8/v1IiCgSCp+MKFxcR/d1ixNKussqe1pwO8+O9ltnTtcGQR3RTYimOscgfTddJeNjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=wEYFRVab; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="wEYFRVab"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 5004627B34;
	Thu, 27 Aug 2026 20:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 5004627B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787863299; bh=dm24otsT6LfpGiRa3F0o9Z7jG8TpAhlds78hRVhU7Rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wEYFRVabM0SwwgWoQgiMzxvVYet8m4hDHtcDtyFvDo6Y2YIrDNAnyBS/fZAziSAxF
	 NLveJsoWX04FSZU6MsT6bCF5G8LaH9CaG5wFx9qkxc4Z0y5wYojy9bnDOQuJpAbxo7
	 Sk/RH7sDLFdjf/Q0IuSxmFSJyYh4FJjHenEeprwg=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id rDNIOvygkGosiAIA8KYfjw:T5
	(envelope-from <dxdt@dev.snart.me>); Thu, 27 Aug 2026 20:41:38 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 4/8] libexfat: refactor exfat_bad_char()
Date: Fri, 28 Aug 2026 05:39:50 +0900
Message-ID: <20260827204056.222099-5-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827204056.222099-1-dxdt@dev.snart.me>
References: <20260827204056.222099-1-dxdt@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove check_bad_utf16_char() and elect exfat_bad_char() as the standard
function for checking bad characters in exfat file names. No functional
change, no significant change in machine code.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 include/libexfat.h | 20 +++++++++++++++++++-
 lib/libexfat.c     | 18 +-----------------
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/include/libexfat.h b/include/libexfat.h
index e12cbf0..554b03d 100644
--- a/include/libexfat.h
+++ b/include/libexfat.h
@@ -232,7 +232,25 @@ unsigned int exfat_count_used_clusters(const void *bitmap, const size_t size,
 
 void show_version(void);
 
-wchar_t exfat_bad_char(wchar_t w);
+static inline bool exfat_bad_char(unsigned short w)
+{
+	switch (w) {
+	case 0x0022: /* QUOTATION MARK:    (") */
+	case 0x002A: /* ASTERISK:          (*) */
+	case 0x002F: /* FORWARD SLASH:     (/) */
+	case 0x003A: /* COLON:             (:) */
+	case 0x003C: /* LESS-THAN SIGN:    (<) */
+	case 0x003E: /* GREATER-THAN SIGN: (>) */
+	case 0x003F: /* QUESTION MARK:     (?) */
+	case 0x005C: /* BACKSLASH:         (\) */
+	case 0x007C: /* PIPE:              (|) */
+		return true;
+	}
+
+	/* Control characters */
+	return w < 0x0020;
+}
+
 void boot_calc_checksum(const unsigned char *sector, size_t size,
 		bool is_boot_sec, __le32 *checksum);
 void exfat_init_user_input(struct exfat_user_input *ui);
diff --git a/lib/libexfat.c b/lib/libexfat.c
index 9baef6f..0fe989f 100644
--- a/lib/libexfat.c
+++ b/lib/libexfat.c
@@ -257,15 +257,6 @@ unsigned int exfat_count_used_clusters(const void *bitmap, const size_t size,
 	return ret;
 }
 
-
-wchar_t exfat_bad_char(wchar_t w)
-{
-	return (w < 0x0020)
-		|| (w == '*') || (w == '?') || (w == '<') || (w == '>')
-		|| (w == '|') || (w == '"') || (w == ':') || (w == '/')
-		|| (w == '\\');
-}
-
 void boot_calc_checksum(const unsigned char *sector, size_t size,
 		bool is_boot_sec, __le32 *checksum)
 {
@@ -2013,19 +2004,12 @@ int exfat_cmp_swver(const unsigned short *in_a, const unsigned short *in_b)
 	return 0;
 }
 
-static inline int check_bad_utf16_char(unsigned short w)
-{
-	return (w < 0x0020) || (w == '*') || (w == '?') || (w == '<') ||
-		(w == '>') || (w == '|') || (w == '"') || (w == ':') ||
-		(w == '/') || (w == '\\');
-}
-
 int exfat_check_name(__le16 *utf16_name, int len)
 {
 	int i;
 
 	for (i = 0; i < len; i++) {
-		if (check_bad_utf16_char(le16_to_cpu(utf16_name[i])))
+		if (exfat_bad_char(le16_to_cpu(utf16_name[i])))
 			break;
 	}
 
-- 
2.55.0

