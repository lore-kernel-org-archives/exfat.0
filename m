Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B926548A2D7
	for <exfat@lists.linux.dev>; Wed,  2 Sep 2026 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351976; cv=none; b=pCX7GPW6i+adDKY9uqppwqNp0mFnzFbXAE+HaTRXQXWhn+cuRRdtL4i/T+/0V47z0MJqRjlH6V408gwMJ3jSCVql9P1tFMswUugBCCnW7S5BKLJqXQ+7Kkslk/1guoxNY7yXpVaaqEQnApbNnGif8nmOtOutfDj1mbZRdiPWwRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351976; c=relaxed/simple;
	bh=DFlYfcg5wRgmjIJkCWAa4k825zFfwu+4dL29SfSS4hE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/W8CHS6ahi7MtjILo3jiQObItxKPnEJADlnJ9M0ECZ5xrjwbs6UCWoLZxY52XO+PbLT4kBq1TfX+sm2yIH7SknFF/WMPLD3zMrMdumLbqhDYizyLbyevvUIAlwqVrzCkSVkQGtMKcCeI9IV2LxXjm/0GU56AFHLXiEpRK0Y5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=Og0yGbkt; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="Og0yGbkt"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 547491D452;
	Wed,  2 Sep 2026 12:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 547491D452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788351973; bh=DFlYfcg5wRgmjIJkCWAa4k825zFfwu+4dL29SfSS4hE=;
	h=From:To:Cc:Subject:Date:From;
	b=Og0yGbkthVsY06dtzhHZgbe3Vf67YYjCH7A1KcOV//gp+NBKjNTIamVd7333HjVi6
	 dtB79VRVC1TM+qCuWQDj75FMQgZXHEJOM8HhIwyHLPZudv8FvhiOTrxOVS4rUuncmW
	 XUzMaXHbgLImbuqPIQRZpYHMvNXHSVNiJZJ1YS40=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id tcNjA+QVmGrUZQQA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Wed, 02 Sep 2026 12:26:12 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH] mkfs: set perc_in_use to 0xFF
Date: Wed,  2 Sep 2026 12:25:51 +0000
Message-ID: <20260902122551.14090-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, mkfs.exfat always sets the perc_in_use field in the boot
header to zero. This is not the correct behaviour since there is always
going to be used clusters for the volume structures like the allocation
bitmap and upcase table.

perc_in_use is only an advisory field. As the number of used clusters
are determined later on during the formatting process, it's not worth
risking a huge code change just for correctness. Therefore, to avoid
confusion, set it to 0xFF which is the magic value that should be
interpreted as "not known" according to the spec.

As the Linux kernel exfat driver currently does not modify perc_in_use
at all, unless the volume is mounted by an implementation that modifies
it, it will always be read as 0. Setting it to 0xFF should somewhat
alleviate the issue because the user would at least know it's not valid.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 mkfs/mkfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mkfs/mkfs.c b/mkfs/mkfs.c
index 0bc4876..609654b 100644
--- a/mkfs/mkfs.c
+++ b/mkfs/mkfs.c
@@ -388,6 +388,7 @@ static void exfat_setup_boot_sector(struct pbr *ppbr,
 	pbsx->fs_version[0] = 0;
 	pbsx->fs_version[1] = 1;
 	pbsx->phy_drv_no = 0x80;
+	pbsx->perc_in_use = 0xFF;
 	memset(pbsx->reserved2, 0, 7);
 
 	memset(ppbr->boot_code, 0, 390);
-- 
2.55.0

