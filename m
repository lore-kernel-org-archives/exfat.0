Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088412;
	b=iJNNp7Lv8km94bAnbKFgjOzTI4dHzGMOf5TzDnLpv87b3GKT5x7H9qRUpXtqlSWH1tI4
	 zMljQFrcBelmlJBWk17qEeZTogycnVzDXD90hosZVt/TLKUbWG0SLnxolijlWmV44Y72Z
	 atXhApKzCcPxcyl16eRm9xdysuI4PBpE7CSB3IXCgDflg5omrEAVGAFD2pzIS9aMS4j4J
	 RXvhjxrw99/Q0h2nMiOa2bLnoUEw1BuNMc0JApxWLQupw79FGx7IsMmfTB0BqoUdMvdRj
	 7kRhx0TzI0jKwGGlnO8GyM0C2QYZgqZ+fvZicGathiWDmL9P8NTFqEnrj05VGPMyeUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088412;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dR0m/UTr46pkPnlDcJhQ1vNPNFF+vLIDs4JvrFoeVk8=;
	b=SlskGdmPNuAsNd1QftOxkLqivGP9sZ/WIcVrpzbHYpPpuO1EdequtDQ5NsbPeKep8SZB
	 ZFMHlYt22B6NKBin0+jDsmKsLYzyuzCOcZ8vFEA06tBpTLakgnNwzvZbyagOeEDLN8HEq
	 PlNNFnyxjtrKFNhFcM6/puOWq+a547tf2Waj99N6sXdKfxL4L4sPJxi/lVIOTVdFOYsas
	 l2w3SbhH2xuBLBooeQvX2mCWXYzR6fkxYCowIWdOP9/4ewRvn9QMkEUWkGEK/OSMiZRrD
	 r5vfNgDsSnT0VyBWG9I+zyVZFpF6Lyr/VMVHHbhqIgpMQ1WViMKptYotHvri5W1Rr7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=e+KgNeOK;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028FD606A31E
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 08:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 028FD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=e+KgNeOK
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 727521D47C;
	Tue, 27 Oct 2026 08:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 727521D47C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793088410; bh=Vt3o+98yRSVQX+O/3j0J6LEErIpt8aOfFaGWJ4wZAAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+KgNeOKp5vZ+jqm8oaAA2K72LUKbOk97RylCz1znFL6wj6DdflpQ8I5qIjIGbll+
	 B2MRuDdCUZUwC1iwEa/GnBvVn2+utDncr/WssQObLuqDXE0ADOuLxw7V/p1Rpv0Fe6
	 u4v9MFWnWxLYVUWou+aFiYIFsYSJmMz7DLfeHqAk=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id LI3iAZZb4Gr2bwEA8KYfjw:T3
	(envelope-from <dxdt@dev.snart.me>); Tue, 27 Oct 2026 08:06:49 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>,
	"sofine . ljm" <sofine.ljm@gmail.com>,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 3/7] fsck: fix missing line ending in error messages
Date: Tue, 27 Oct 2026 08:06:20 +0000
Message-ID: <20261027080628.82069-3-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027080628.82069-1-dxdt@dev.snart.me>
References: <20261027080628.82069-1-dxdt@dev.snart.me>
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

Fix missing or erroneous new line chararcter(\n) in error messages.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 fsck/fsck.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 524eef0..bde12f0 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -287,7 +287,7 @@ static int root_check_clus_chain(struct exfat *exfat,
 		exfat_bitmap_set(exfat->alloc_bitmap, clus);
 
 		if (exfat_get_inode_next_clus(exfat, node, clus, &next)) {
-			exfat_err("ERROR: failed to read the fat entry of root");
+			exfat_err("ERROR: failed to read the fat entry of root\n");
 			goto out_trunc;
 		}
 
@@ -1790,7 +1790,7 @@ static int rescue_orphan_clusters(struct exfat_fsck *fsck)
 	/* build a template dentry set */
 	err = exfat_build_file_dentry_set(exfat, name, 0, &dset, &dcount);
 	if (err) {
-		exfat_err("failed to create a temporary file in LOST+FOUNDn");
+		exfat_err("failed to create a temporary file in LOST+FOUND\n");
 		goto out;
 	}
 	dset[1].dentry.stream.flags |= EXFAT_SF_CONTIGUOUS;
-- 
2.56.0

