Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293729;
	b=oFKVYrsn3Bxh19x5iVGjmx2+K3jzzTV9ZET0Ng4F0Tr5QM7AIMDNOJbfc+x4HetBcHC9
	 IHIY+bRGwpc/B1gaMCzuhxeN/5OmGkkuJvajX2kAu5arWWpr2AuRrDBLZagdz9quxgpIs
	 LjicCYEmN6D2QXsEC4Dyfsqyo993I/wjL88rZvSPMPquU8Y0PjvnyckbzBpR5ibyt1WWT
	 v8TY4zHstInoDUrfamYm1txAzBGwKWhDqkRuLSH+2O+Dm6ldwM4lwr7ZUCszPi0FVvvvy
	 rz2H41dqdgfDK7TDtG8fgg0RWwNgaee3kYvZgKnzpQY+Xnv6JgrEDgLDrthlJOuHdGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293729;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r6FstySD1JVhuLVk+vSaDt0Gs4t8X/kRTk5trecs9tw=;
	b=KqKbxmNWrA8asHMPbH4AwdfQc1rtZpLizxftb0JkEJwdB8LAbvDZWw4i9uw5yMbaVUOa
	 4rbWmDJsnAAsRdsmAdpNASCNcVuRxue1Z413TLfcw6/gPYTwBRiQaNp31q+Ja63tYAGDd
	 mbDspp7wDU3sXe7w7XG0QR+ctRUoJxLLGPqlDPqGBz3GUTUIsHYjvvNvnOIya4g3TRHkL
	 i2OwZztn/rNHwTEeT+I8UQKPGu3lAkQstE9D+JgG5fmOzV6CYgznuOu3OYtt+aH45/XIh
	 dRGTDxsrUhwb/oM9mSws5y+zpgPSckaeQQFcuUNT+OnqV7j1fwFOvpeHSkc9VQYFZhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=wNkqR5Ne;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB2F606A321
	for <exfat@lists.linux.dev>; Tue, 10 Nov 2026 06:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AB2F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=wNkqR5Ne
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 7860E1D47D;
	Tue, 10 Nov 2026 06:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 7860E1D47D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794293727; bh=yGCAvcNnISyL/R0uUVj7Rn/YyQsVnNZyJ5TH8xVF1ok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wNkqR5NeLDxVDNPsoNmWTl+9SgHlpB0I2FljZ/jnKnl+fylzLvrv9XQDZ63FfGI4E
	 FrLLpF4uwzbJjQ9W/raPclZXTZrPc03M0cwwWnV1D0TO0kOddb7tTC550pRNer+7iv
	 T3b43ZYtHDFz8bZhTx6CNw7nXTO9og6i8i9T+EUk=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id /GyMLta/8mq/UAEA8KYfjw:T5
	(envelope-from <dxdt@dev.snart.me>); Tue, 10 Nov 2026 06:55:26 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 4/7] mkfs: set disk signature of protective MBR to zero
Date: Tue, 10 Nov 2026 06:54:38 +0000
Message-ID: <20261110065441.63590-5-dxdt@dev.snart.me>
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

According to Intel's UEFI specs 2.10, the disk signature in protective
MBR of GPT should be set to zero. The mkfs.exfat implementation
incorrectly sets it to the fixed value of 0xA2A0.

Because the value is not converted from little endian to host endian,
the value on disk ended up different depending on the host's endianness,
preventing mkfs.exfat from generating the exact same data structures
even if all the GUIDs and the volume serial are fixed.

LE hosts(i686 and x86_64):

    0000 01B0: 00 00 00 00 00 00 00 00  A2 A0 00 00 00 00 00 00

BE hosts(SPARC 64):

    0000 01B0: 00 00 00 00 00 00 00 00  A0 A2 00 00 00 00 00 00

This patch fixes the endian confusion introduced in the original patch
by always using the value of zero.

Fixes: 0844be34e702 ("mkfs: add partition table creation support for Windows compatibility")
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 mkfs/mkfs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mkfs/mkfs.c b/mkfs/mkfs.c
index 6c8bd76..fe3e416 100644
--- a/mkfs/mkfs.c
+++ b/mkfs/mkfs.c
@@ -132,7 +132,6 @@ static int build_gpt(struct exfat_blk_dev *bd, const struct exfat_user_input *ui
 	int ret = 0;
 	unsigned long long req_size = 0;
 	unsigned long long first_usable, first_aligned, last_usable, last_aligned, part_sec_cnt;
-	uint16_t serial;
 	uint8_t *mbr = calloc(1, sector);
 	struct exfat_gpt_header *head_main = calloc(1, bd->sector_size);
 	struct exfat_gpt_header *head_backup = calloc(1, bd->sector_size);
@@ -237,7 +236,6 @@ static int build_gpt(struct exfat_blk_dev *bd, const struct exfat_user_input *ui
 	/* The first GPT entry */
 
 	memcpy(&arr[0].partition_type_guid, EXFAT_GPT_PART_TYPE, 16);
-	memcpy(&serial, &arr[0].partition_type_guid, 2);
 	if (finfo.gpt.has_part_guid)
 		memcpy(&arr[0].unique_partition_guid, &finfo.gpt.part_guid, EXFAT_GUID_LEN);
 	else
@@ -247,7 +245,7 @@ static int build_gpt(struct exfat_blk_dev *bd, const struct exfat_user_input *ui
 
 	/* Protective MBR */
 	exfat_put_bootstrap_code(ui->bootcode_msg, mbr, 0);
-	exfat_put_mbr_partition(bd, mbr, serial, 1, false, 0xEE, 0xFFFFFF);
+	exfat_put_mbr_partition(bd, mbr, 0, 1, false, 0xEE, 0xFFFFFF);
 	mbr[510] = 0x55;
 	mbr[511] = 0xAA;
 
-- 
2.56.0

