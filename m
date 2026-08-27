Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD1392C2A
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 20:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863320; cv=none; b=dC+eUeFKUGAN7DE4Ry44t4AtL4AvBNH/U+nZQyXm+NWu+J/P1ZA3e4mo4OT+TOcrrPtr7dC5roAa3C558/UjKfphyEQcNG7szPSC/p/fcqgI0afaZLrL4Jjv1qI+YMuj7v8cu3TBzfM1lBNbRJx87QXjrizj8VbZyK7Qis7iid4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863320; c=relaxed/simple;
	bh=UgTNeTVR30W6OrMG80Rk9bj67qX67T8jDtCs/aZr4Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWVVY8k4xkkFG7vRDtlgpmLlgFy6C81vhhNf8o+X+bAwVePwpHOm3sq+9SIA5pAbAJAgPP8awf6Zj2nB1Y6wY372h4oEsg+zXgNcxwglUiB2+TeJO/gyPEqBJjOYSACpqefvuuqNm/YgZJkzskiPfz2RODQ0UTKtaNMTFwdLZ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=sMMLLpQI; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="sMMLLpQI"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id CEF5C27B36;
	Thu, 27 Aug 2026 20:41:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me CEF5C27B36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787863301; bh=UgTNeTVR30W6OrMG80Rk9bj67qX67T8jDtCs/aZr4Pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sMMLLpQICthYoyIsUA4vJxMOx0xPbMxgMkDL+dhqMwkTR4CrsX+RwVrKkdOSxOiVJ
	 sAagu9MTDhOkCNsR9RW3T4lHlAcWWP2hV9trYBZjuh63HZMUuM1mVF6k8DVkv+e+8q
	 bJlw5ss8u0s328x2EdSFS3MzW+A1jy8nFaYtcH70=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id rDNIOvygkGosiAIA8KYfjw:T7
	(envelope-from <dxdt@dev.snart.me>); Thu, 27 Aug 2026 20:41:40 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 6/8] libexfat: add exfat_trace()
Date: Fri, 28 Aug 2026 05:39:52 +0900
Message-ID: <20260827204056.222099-7-dxdt@dev.snart.me>
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

Add the macro function exfat_trace(), a higher print level than
exfat_debug() for debug trace.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 include/libexfat.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/libexfat.h b/include/libexfat.h
index 9dc1542..fbf0668 100644
--- a/include/libexfat.h
+++ b/include/libexfat.h
@@ -498,6 +498,7 @@ extern unsigned int print_level;
 #define EXFAT_ERROR	(1)
 #define EXFAT_INFO	(2)
 #define EXFAT_DEBUG	(3)
+#define EXFAT_TRACE0	(4)
 
 #define exfat_msg(level, dir, fmt, ...)					\
 	do {								\
@@ -513,6 +514,9 @@ extern unsigned int print_level;
 #define exfat_debug(fmt, ...)	exfat_msg(EXFAT_DEBUG, stdout,		\
 					"[%s:%4d] " fmt, __func__, 	\
 					__LINE__, ##__VA_ARGS__)
+#define exfat_trace(N, fmt, ...)	exfat_msg(EXFAT_TRACE0 + (N),	\
+					stdout, "[%s:%4d] " fmt,	\
+					__func__, __LINE__, ##__VA_ARGS__)
 
 #define exfat_print_guid(f, msg, guid)					\
 		f("%s: %02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x\n",\
-- 
2.55.0

