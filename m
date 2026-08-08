Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05D32941A
	for <exfat@lists.linux.dev>; Sat,  8 Aug 2026 07:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786172749; cv=none; b=bUaFVk5CCd0cgkpWO5dE4ABtC0BpaohIcnXevnbAKqpUnpOPuQUNqi0+3hkLu/uwlYrMPinvSsFK7skGV60yWuYQ/KFKqWMBMDkzHvoIDVVtPzKJNINMPsH8WWWqEO8kgxnWPijxRgVX6OXEFmfHw8I/lO2X2J3FyhXvejv+CcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786172749; c=relaxed/simple;
	bh=FZ4p+jWVA5hbqs6tej6lneNNujM4PP1tbpjrVWAuKk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cmuVjLZ9FM5Vks84mVoLZZbiw1J/aA+nTTPh0EtgPkQHTww7X8A/xTVRrJh6pkOWwRSbmBtez6gJUJzTObGye1HZkv8cjpbpdzjDkcziEfCCiSLV9gsDGG0a2Uw36NwX5RrwJRLojbImoipjGGpW3ZO8LaBHnddNnQmqdZXkxgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=TCfomSZt; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="TCfomSZt"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id D2FF49180;
	Sat,  8 Aug 2026 06:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me D2FF49180
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1786172309; bh=FZ4p+jWVA5hbqs6tej6lneNNujM4PP1tbpjrVWAuKk8=;
	h=From:To:Cc:Subject:Date:From;
	b=TCfomSZtlLTXBEE6Do4vNQLZ6DTaE+ovcn9/KTrwNbSImZn38Vew+yFbgQGOXaqyP
	 ZmNYjt4tTE9fE50JuopK38V+7LLp/QK4CTezHjf5YkYafnpMlTlz0R6tVqTmxMFiP7
	 VjS7eaRYo7Xvny2EEvxpVyGVNopp1vGB8oItGguQ=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id VZFqIJTTdmpp2QMA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Sat, 08 Aug 2026 06:58:28 +0000
From: David Timber <dxdt@dev.snart.me>
To: Hyunchul Lee <hyc.lee@gmail.com>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH] libexfat: fix return value of exfat_check_written_data()
Date: Sat,  8 Aug 2026 15:58:06 +0900
Message-ID: <20260808065806.34730-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In exfat_check_written_data(), the return value of posix_memalign() is
only used to check if the memory allocation failed and the errno is
returned from the function. However, according to posix_memalign(3),
errno shouldn't be set by posix_memalign() at all.

Overflows and invalid allocation lengths are already checked with
assert() beforehand. Therefore, EINVAL should never be returned from
posix_memalign(). So, always return -ENOMEM if allocation fails.

Note that currently, this patch doesn't really fix any issue because
with all the current Linux libc implementations(glibc and musl), errno
is set for ENOMEM cases in posix_memalign() anyway. This patch is only
to fix potential undefined behaviour on other POSIX platforms in the
future.

Fixes: 78e398e37ba5 ("exfatprogs: Fix and improve verify written zeros (memory optimisations)")
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 lib/libexfat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libexfat.c b/lib/libexfat.c
index 8e23aca..6eda5dd 100644
--- a/lib/libexfat.c
+++ b/lib/libexfat.c
@@ -1209,7 +1209,7 @@ int exfat_check_written_data(struct exfat_blk_dev *bd,
 	assert(aligned_len > 0 && aligned_len >= (off_t)len);
 
 	if (posix_memalign(&verify, sector, (size_t)aligned_len))
-		return -errno;
+		return -ENOMEM;
 	memset(verify, 0, (size_t)aligned_len);
 
 	if (buf == NULL) {
-- 
2.55.0

