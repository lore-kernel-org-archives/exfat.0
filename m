Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481784C77BC
	for <exfat@lists.linux.dev>; Thu,  8 Oct 2026 14:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471367; cv=none; b=e6LhYltXLdr7aZ/8+djRbj37tZv1vn85X5S6SwqRy8VZlj7rCK1mTj+D/7mWZfofAg7XCfVVJJ3ggIHnWc9FQtUqLOaw4KzG6JWB2uOOMhUEe2OsPSdeuWVAivokbKW0rkKg6Y/cRAp6X1MZqob/wTkYjttGNjbOdR8P/v6r89I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471367; c=relaxed/simple;
	bh=nc/FVxg1sFN+TrmY63666tzYmYLlN/qhIK9ljZIomJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OZCjU4gelMErkOeuCsi3Ax9JFi8uh6ARKCK6pzxMbDvWjSTiN2jKenvMFSI7IQ8UG+9XDk8rcCrsNOcIGMUiCesm3yaUVVFNnYb+scBswXa0sHND3a21OVOjppeqcaRRTHMgfYkjf65MOGnAN+lrmzmwS8sFIc+h6OG0aW2aSKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qn+8sxnr; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qn+8sxnr"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a4c47bb6e3so1675448a91.1
        for <exfat@lists.linux.dev>; Thu, 08 Oct 2026 07:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791471351; x=1792076151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMxs149Obj+1IVXQDsp7aGJ9lQj6oBgq2AnYxYm/I6w=;
        b=Qn+8sxnrJLndEuHLBiSdQjiyLVFR+Z5xRXTweHfUwX7Z/e6RMbH0kSIUCYe7BJVDbh
         pvfjItPyK2TzA1NxOVCi5oYPE3U89COsmx8d9O09iVtoQxrbKinaOZu5O/eo3eYyW7rD
         A5EmBEd31ah43qExnr8rHSojLHsScRrCs46503SyShAX6/IxNOYYmm3+kHmfplOZw5SI
         bgyiQQePud8X8OmO9tLlzfQHBiFdXj40GunvW9kkvIVNisrLG15/DZprOvdfft9oXRmG
         BkwYAky+cb+38RIpHU+2lqYhVJXPr1CCVAobT93zeXwXlhYlekpEub1YDuNZOeQfqV66
         qGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471351; x=1792076151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMxs149Obj+1IVXQDsp7aGJ9lQj6oBgq2AnYxYm/I6w=;
        b=iCDgljF9+uM8s3FGAhhWchdg0yEmRD1uiilP1Yk5a/ja7SrkT2Dy+UAtssZvDDmE0T
         eE9+9EIg5QYzO7IfMZ381328dn9egDkjfSmJxa8HAT4S1CswtAPCahdgLvRdCvRlF72E
         nbQUa73yjf8K0lDXUF6qSSholwbiv1vtdU2qkcZYeZstqLJ7+uYDV9rw4k2WStgtC3Rn
         p3DTFROWplgAxIB0bbcGX0oqphFDjS48U6J1SYSrozp8/Wd8f9qMBMblGaq3iVlkED8R
         5pwYWqDwnbi5CWsygKkLYUqLODIspPwhBuYMQIxjRQN9A41AqRFBB+t8PTr2/5cNWh7W
         hLdg==
X-Forwarded-Encrypted: i=1; AKwUvBzzZu8TweIzAoGnMr5+InJGcR8JyFIHUgl3ne/v9q6heDAcdg9NwooC0fqKxWp0XGBwnMV11Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYI4HBlqPT94G6q8uWLa9S10HVTzf9uC0fP2SCTw/Ub0y2Jw0aio
	uMNStUuUFWT2/MQb4TA1hRonSGuYb5zujUbUeAcsMlo2bZQVe/iy6uqU
X-Gm-Gg: AYBFou1VdjY1a9AcO31lbt0ABduzLeMc2A5an2zZi7G9M7KpURiu+FuBU/ELTtM3KEu
	pklcdBDcZTcnEzMBadIcec40fmFZL5IdzwIxtHGZKBWTuP5ekZT7AscZEZZRrH38XLIXutfliSf
	12sOUywKGksqJP3ICxKhA8r4amnyFljOxgfk50gB6Qwe9/8TBbc1owqWub+RCe8xwD9EkNDX+Lz
	3hdfLerTDyrVGgj8gKODf1zjXkjS/Nfns1ttdOELrTOF2dH0D7cfQSMXEVO0W1q2soOQ7atEGM5
	Z4MaOOOR+L5Rz9auhLwqEae0CvKTmCpWx4FYpAMmv3HWGiTzUrijLLkOjtisw5REU+r5VL24Lo9
	BXzIN+32SsXEFJUImTzpCRPshomGZPyTh2PHEmCFoISjddpc8zFnUsB4jsXgXmC+QKKmZRzTshw
	07a2dZFvj/Ts+7ofW9oTzC7H45y3s/C7oSfw1lxbU2rTPR81aqCDS+2gfyaGZliu3nN6ZLHjhXB
	1bAtWB39AyC
X-Received: by 2002:a17:90b:1811:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3a8a1bbf16dmr5251862a91.45.1791471351465;
        Thu, 08 Oct 2026 07:55:51 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab12e6b7f9sm1071596a91.3.2026.10.08.07.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:55:51 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v2 1/2] fsck: validate boot-sector shift values before use
Date: Thu,  8 Oct 2026 22:55:24 +0800
Message-Id: <20261008145525.1950813-2-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008145525.1950813-1-anmuxixixi@gmail.com>
References: <20261008145525.1950813-1-anmuxixixi@gmail.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sect_size_bits and sect_per_clus_bits are read from untrusted media.
Using invalid values in shift expressions can result in undefined
behavior before the existing size checks reject them.

Validate both fields before using them in EXFAT_SECTOR_SIZE() or
EXFAT_CLUSTER_SIZE().

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fsck/fsck.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 5447154..3be783a 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -414,6 +414,20 @@ static int read_boot_region(struct exfat_blk_dev *bd, struct pbr **pbr,
 		goto err;
 	}
 
+	if (bs->bsx.sect_size_bits < 9 || bs->bsx.sect_size_bits > 12) {
+		if (verbose)
+			exfat_err("invalid sector size bits: %u\n",
+				  bs->bsx.sect_size_bits);
+		goto err;
+	}
+
+	if (bs->bsx.sect_per_clus_bits > 25 - bs->bsx.sect_size_bits) {
+		if (verbose)
+			exfat_err("invalid sectors per cluster bits: %u\n",
+				  bs->bsx.sect_per_clus_bits);
+		goto err;
+	}
+
 	ret = boot_region_checksum(bd->dev_fd, bs_offset, sect_size);
 	if (ret < 0)
 		goto err;
-- 
2.38.0.windows.1

