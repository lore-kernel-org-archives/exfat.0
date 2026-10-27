Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088411;
	b=ldqu8Nc3JSrtqvfYSRgl+QEobp4O5/bqi3IClZ27E+vLLQPhDrAAccQwRN2tQhx25Rjb
	 nLyTM7zmNx4wNZxbRVew7tso94l4fM01FGIUsHtvDl5aHxEKmMlXMifLytvW8x4QCeFUE
	 87MBnKjBTknkobmhG/g6W1PgRr4PoqTPaiD0amNX6dhrv03No6rYEIRGCmHJm0xOx1C/A
	 6FHAqvIM6DDdrU05kTtyCXRFkOygZQBkEMz7gwmjAK3drys5Ccs3f+pG06QD1oqziHdLQ
	 usq3Xf1IB/z1z6e6Yj4LzPam6FukehT/7aAXnHi2ZvDaZWXmyVAxqtFFO2SLcATJgBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088411;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AZKHjrWRnWrb9+v9bBy9+4tlLLLPK47aypkqzvIG1NQ=;
	b=awA7yDheqpS4zzMVRPze2MAArDGx/rYEXP5mYGBuMBtE/U9IDy/MDBySMaiWxIYxmSdA
	 JHotoonBmG80nm8L12K5/vi14zEWVruQ+1Jfn0FvwMwjosnQDvy0veaz24a1j9pG8kKC2
	 d9hNTY/aNJW01TA4O9UjIPffKxTEwTZA0ittl48Hy4boUXMLrEpzsoVAXFHN/PTu9/Zsh
	 56+771s9iY5OdSadeYQZdOOd/tivE4Ef5sNp4e9B2apxZ9xcaRlol41VOhwXeZfvOr0p7
	 m5D8OlzniJUPU8Z9lljlKllMm/RLAmgnSKQq3uW+qyjpGCuvmHfawrnVVWcuSlewejg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=fccJxKth;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B7B606A31E
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 08:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B7B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=fccJxKth
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id E039E1D47B;
	Tue, 27 Oct 2026 08:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me E039E1D47B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793088409; bh=uU2FA3AN0M5uTRP90fMfZJqwfcW4XI5A9/THANMLT1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fccJxKthScxH+qe9msbd6SkY4r0DluS5ET8a/mHzhy4BcOKgv9cCAtmq2gnP5VCwN
	 cC298sE1kM6jQ+N8s2tVuQrKalm4PYOAobVOTo8hL/BdqF0nrwcqAWfr2vYd7oIwSx
	 mH/9ltTSBL/I7kHe4V69UrN8qmcOf/9TURohGpyg=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id LI3iAZZb4Gr2bwEA8KYfjw:T2
	(envelope-from <dxdt@dev.snart.me>); Tue, 27 Oct 2026 08:06:47 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>,
	"sofine . ljm" <sofine.ljm@gmail.com>,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 2/7] exfat2img: refactor restore_from_stdin()
Date: Tue, 27 Oct 2026 08:06:19 +0000
Message-ID: <20261027080628.82069-2-dxdt@dev.snart.me>
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

Remove meaningless declaration and assignment of in_fd, which is a
macro constant integer value of 0. Remove the dead if statement. This
commit ammends the original commit introduced the changes.

No functional change.

Fixes: f70ad717db2a ("Refactor libexfat and minor fix in exfat2img and mkfs")
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 exfat2img/exfat2img.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/exfat2img/exfat2img.c b/exfat2img/exfat2img.c
index e1e4a37..3b8feb8 100644
--- a/exfat2img/exfat2img.c
+++ b/exfat2img/exfat2img.c
@@ -747,7 +747,7 @@ static ssize_t read_stream(int fd, void *buf, size_t len)
 
 static int restore_from_stdin(struct exfat2img *ei)
 {
-	int in_fd, ret = 0;
+	int ret = 0;
 	unsigned char cc;
 	unsigned int clu, end_clu;
 	unsigned int cc_clu_count;
@@ -757,13 +757,7 @@ static int restore_from_stdin(struct exfat2img *ei)
 	off_t in_start_off;
 	size_t len;
 
-	in_fd = STDIN_FILENO; /* POSIX spec mandates stdin == 0 */
-	if (in_fd < 0) {
-		exfat_err("failed to get fd from stdin\n");
-		return in_fd;
-	}
-
-	if (read_stream(in_fd, &ei_hdr, sizeof(ei_hdr)) != (ssize_t)sizeof(ei_hdr)) {
+	if (read_stream(STDIN_FILENO, &ei_hdr, sizeof(ei_hdr)) != (ssize_t)sizeof(ei_hdr)) {
 		exfat_err("failed to read a header\n");
 		return -EIO;
 	}
@@ -787,7 +781,7 @@ static int restore_from_stdin(struct exfat2img *ei)
 	out_end_off_excl = le32_to_cpu(ei_hdr.heap_clus_offset);
 	while (out_start_off < out_end_off_excl) {
 		len = MIN(out_end_off_excl - out_start_off, clus_size);
-		if (read_stream(in_fd, ei->dump_cluster, len) != (ssize_t)len) {
+		if (read_stream(STDIN_FILENO, ei->dump_cluster, len) != (ssize_t)len) {
 			exfat_err("failed to read first meta region. %llu ~ %llu\n",
 				  (unsigned long long)in_start_off,
 				  (unsigned long long)in_start_off + len);
@@ -810,7 +804,7 @@ static int restore_from_stdin(struct exfat2img *ei)
 	/* restore heap clusters */
 	clu = 0;
 	while (clu < le32_to_cpu(ei_hdr.cluster_count)) {
-		if (read_stream(in_fd, &cc, sizeof(cc)) != (ssize_t)sizeof(cc)) {
+		if (read_stream(STDIN_FILENO, &cc, sizeof(cc)) != (ssize_t)sizeof(cc)) {
 			exfat_err("failed to read cc at %llu\n",
 				  (unsigned long long)in_start_off);
 			ret = -EIO;
@@ -819,7 +813,7 @@ static int restore_from_stdin(struct exfat2img *ei)
 		in_start_off += 1;
 
 		if (cc == EI_CC_COPY_2 || cc == EI_CC_SKIP_2) {
-			if (read_stream(in_fd, &t_cc_clu_count, EI_CC_PAYLOAD_LEN) !=
+			if (read_stream(STDIN_FILENO, &t_cc_clu_count, EI_CC_PAYLOAD_LEN) !=
 			    (ssize_t)EI_CC_PAYLOAD_LEN) {
 				exfat_err("failed to read cc cluster count at %llu\n",
 					  (unsigned long long)in_start_off);
@@ -840,7 +834,7 @@ static int restore_from_stdin(struct exfat2img *ei)
 		if (cc == EI_CC_COPY_1 || cc == EI_CC_COPY_2) {
 			end_clu = clu + cc_clu_count;
 			while (clu < end_clu) {
-				if (read_stream(in_fd, ei->dump_cluster,
+				if (read_stream(STDIN_FILENO, ei->dump_cluster,
 						clus_size) != (ssize_t)clus_size) {
 					exfat_err("failed to read range %llu ~ %llu\n",
 						  (unsigned long long)in_start_off,
-- 
2.56.0

