Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557261;
	b=fuKLcKStsc3h5zYk9HAZPx6y2xwk5ddgFbBA/iWL5bfqXo/NLtHq0blzaoEyr+1uB29m
	 /W693GXmWEkM+HkpNQdbXkaiDhLoSNG7we8JAOTIFT4/hm49NnsNcc7+P6TGghHViX6V7
	 +2kqhluwyArDbbyfEhKF1tS0rhsWd6eMIdfew5U8wA3ap9T2078No5POf3t5y7NS1JSXG
	 BNQ8+0i34r357E20TTnA0ysyvfT0DVFLYE05mk7tsYnaic4wRzNI4xHvQvCOz0tVo1apg
	 iHhS67DkA5rXzBEqLR1REFOhjbpjhFDgcjaD91Dm1FJegTVPQ0oZ+0z6CabMfRlgjWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557261;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=19BiyJv2TJqRN2UvAv1orgjEi8HKoYAug4YesSOKGKQ=;
	b=CULDIJO+ohh27eAjitEE1mWJndCX8ixzmLkt0AnOZMiH+zUfcbCaM9BLR0Qgbmo4bwBE
	 78ESUfDtV8Ha+OmPlh3lnDUutx46mwP4wtA6PG4IrwEnDTCUsQhWoq1PVi0sPWPXD9pII
	 lc3ArEmBhZPblPmgkxOLTFTaUYxyoYh/PSE+hwNMQsgveh91SuGBkXtJfGGjARYzib2R4
	 UzHde2INeoJyNXiYm8RDldSOfKcvRtE1du1bHVKj+OesgmBU2T4ATjyxEjYjZPQTqhaQB
	 MaOjfNMTLMjoi8llaT9avCScOMjdzzsUcZQ4iGDZ1upUwJUS314ujIULDY9/kHPtQ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gJGslOZF;
	arc=none smtp.remote-ip=95.215.58.6
Received: from mta1.migadu.com (out-6.mta1.migadu.com [95.215.58.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40151606A33E
	for <exfat@lists.linux.dev>; Fri, 13 Nov 2026 08:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40151606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gJGslOZF
X-Envelope-To: exfat@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Cyd/q2FWnL6fCplGVrk2zL863EUO2BEQhbDkjI28sqw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794557259; v=1; x=1795162059;
 b=gJGslOZFcET2e8cohA4BP1sWcMlOO/AN9Evc5Gj07GzN7Z3lEJn+b9IvRTRZ3WVdIExlMXAv
 Tw59DydII7GlM1J1HjWMImOT6IftJKE9S+732IsmXl5zhVDNxb56oqU7Wup0IZUQIzmt+fgdLSr
 5cYo0kSp3uOvQNdh80e9/0GM=
X-Envelope-To: exfat@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 74ef592acf403f59;
	Fri, 13 Nov 2026 08:07:39 +0000
X-Mizu-Trace-ID: 74ef592acf403f59
X-Migadu-Flow: FLOW_OUT
From: Youling Tang <youling.tang@linux.dev>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>
Cc: Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@163.com>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Youling Tang <tangyouling@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] exfat: don't map EXFAT_EOF_CLUSTER as a physical cluster
Date: Fri, 13 Nov 2026 16:06:57 +0800
Message-ID: <20261113080658.2440516-3-youling.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113080658.2440516-1-youling.tang@linux.dev>
References: <20261113080658.2440516-1-youling.tang@linux.dev>
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

From: Youling Tang <tangyouling@kylinos.cn>

exfat_map_cluster() reports a hole by returning success with
*clu == EXFAT_EOF_CLUSTER for !create.  __exfat_iomap_begin() does not
check that sentinel and converts it into a physical address far beyond
the device.  A writeback that races with the i_size/i_blocks window in
exfat_cont_expand() can hit this: it submits a bio past the end of the
device, and fsync() or msync() returns -EIO.  If the resulting iomap
length is zero, iomap_add_to_ioend() can loop on a zero-length bio and
hang a concurrent truncate.

When a range starts before the end of the cluster chain but extends past
it, exfat_map_cluster() returns the sentinel for the whole range.  Map
the valid prefix first and only report the part beyond the chain as a
hole.  Otherwise a writeback that straddles the end of the chain would
skip valid dirty data.

Report the remaining range as a hole instead of turning the sentinel
into an address, matching the old exfat_get_block() behavior.

Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
Cc: stable@vger.kernel.org
Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 fs/exfat/iomap.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index 11823591b3a8..d6b420f615d4 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -74,6 +74,22 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 	iomap->bdev = inode->i_sb->s_bdev;
 	iomap->offset = offset;
 
+	if (!may_alloc) {
+		unsigned int ondisk_clusters =
+			exfat_bytes_to_cluster(sbi, exfat_ondisk_size(inode));
+		unsigned int clu_offset =
+			exfat_bytes_to_cluster(sbi, offset);
+
+		/*
+		 * exfat_map_cluster() returns the EOF sentinel for the whole
+		 * range if it extends past the cluster chain.  Map the valid
+		 * prefix first so the hole only covers the part beyond it.
+		 */
+		if (clu_offset < ondisk_clusters &&
+		    num_clusters > ondisk_clusters - clu_offset)
+			num_clusters = ondisk_clusters - clu_offset;
+	}
+
 	err = exfat_map_cluster(inode, exfat_bytes_to_cluster(sbi, offset),
 			&cluster, &num_clusters, may_alloc, &balloc);
 	if (err == -ENOSPC && !(flags & IOMAP_DIRECT)) {
@@ -90,6 +106,19 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 	if (err)
 		goto out;
 
+	/*
+	 * exfat_map_cluster() reports a hole by returning success with
+	 * EXFAT_EOF_CLUSTER.  Return it as a hole instead of turning the
+	 * sentinel into a physical address.
+	 */
+	if (!may_alloc && cluster == EXFAT_EOF_CLUSTER) {
+		iomap->type = IOMAP_HOLE;
+		iomap->addr = IOMAP_NULL_ADDR;
+		iomap->offset = offset;
+		iomap->length = length;
+		goto out;
+	}
+
 	cluster_offset = exfat_cluster_offset(sbi, offset);
 	cluster_length = exfat_cluster_to_bytes(sbi, num_clusters);
 
-- 
2.43.0

