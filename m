Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498746;
	b=nRd2txrG4vr/Y3f49h5dzuAP0CFrr7BhP5CMaB3RnmMKcPmetCLaNKv6Z0s5ch4tLFfN
	 pGgT+/Z/akPslGD3PB18QbxqVy57SKHcb+C8JDhCKPrVFi/mCtW/UMRyvZkr3u+UZIm2O
	 2Sa7nQGjg95Ev497g7T2aS9emVLfakPOe9fFKzLwPrbSmf9qcX1PJUZGB5lGSX1uXaUK1
	 AZDulb68FD65GcuoNBANueQ4DaeScIQWaRteJlD+UK5IKgReUQJ8DKZuPVvBr2PSPQKO3
	 yzprNSBFeEADJCFlVfG0tOSihC3o7NjFpRiJvqk8zVtyGWM+AAWZgrg9unXgK8wPHzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498746;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xRlTguQB2zTno2kcsMnKzj84XjDOoqAXsvyOCYYo1g8=;
	b=vlicYqv2u8Fg0faJ4OwzALplEu5IN7YzGvV8xdx3N8dfZzqobGwEtJVvmzSxmXKpFjPa
	 PIbqqa68WU8oLnXEUsZxXtdhBduxR5bRvg3CQB5n71HKeFo0mDfctka/1q6yPs3qTG4zm
	 VajMbJk7w2JLxfNZecTFmZF8cWPGrMxwdsa/CelIoiXjb0dZf7thn10T0dzbGQFpCNlwT
	 2lKp85EgkxSGhfEdnjJm+w7XxZMfc09DysJqXPEdjbE7HBt7EWwX3+5zyFwRdYeJn3//D
	 YIDJ5UpUWn79In0pLGCzjFuZmAR3VEqCujSOpMWkHogF3PpmcMVjoo4Dgy1AsWset5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=dP94DIK2;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC0606A321
	for <exfat@lists.linux.dev>; Thu, 12 Nov 2026 15:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEBC0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=dP94DIK2
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 373C51D485;
	Thu, 12 Nov 2026 15:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 373C51D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794498737; bh=uMOvVKf+FcUXbLKW+lbvem8S6JiRyI2uTY5UOLE0I8g=;
	h=From:To:Cc:Subject:Date:From;
	b=dP94DIK2y3XigwgN3w1kTmJiru4PQWj0rM5lR+M7ho+Lmp41VyCoI+fEv/kQRW7qs
	 +tLgxy7UGHjfT+OMVJPdbl3MPI6Ych/tzaj+fes3OEBqG8wilFatn2ppj31kTesyI9
	 wiWmMfHppCEw2DmMjU0avfnAReUNOO6CD8FoU9sg=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id RkGDLa/g9WoQFwIA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Thu, 12 Nov 2026 15:52:15 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v0 1/6] treewide: add missing newline characters
Date: Thu, 12 Nov 2026 15:51:40 +0000
Message-ID: <20261112155145.177216-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.56.0
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

Add missing newline characters in error messages.

Cc: Yang Wen <anmuxixixi@gmail.com>
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 defrag/defrag.c | 2 +-
 lib/libexfat.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/defrag/defrag.c b/defrag/defrag.c
index 0ac671f..00c60fc 100644
--- a/defrag/defrag.c
+++ b/defrag/defrag.c
@@ -193,7 +193,7 @@ static int add_virtual_node(struct cluster_info_set *set, uint32_t data)
 		new_size = (offset + index + VIRT_SPACE_ALIGN) * sizeof(uint32_t);
 		new_next_clus = realloc(set->next_clus, new_size);
 		if (new_next_clus == NULL) {
-			exfat_err("memory run out in %s", __func__);
+			exfat_err("memory run out in %s\n", __func__);
 			return -ENOMEM;
 		}
 		set->next_clus = new_next_clus;
diff --git a/lib/libexfat.c b/lib/libexfat.c
index af96884..c242c1c 100644
--- a/lib/libexfat.c
+++ b/lib/libexfat.c
@@ -1990,7 +1990,7 @@ int exfat_root_clus_count(struct exfat *exfat)
 		exfat_bitmap_set(exfat->alloc_bitmap, clus);
 
 		if (exfat_get_inode_next_clus(exfat, node, clus, &next)) {
-			exfat_err("ERROR: failed to read the fat entry of root");
+			exfat_err("ERROR: failed to read the fat entry of root\n");
 			return -EIO;
 		}
 
-- 
2.56.0

