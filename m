Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785800;
	b=ycHUkBcaIj/y4f3xyP1FEpw9KW+Tqlp2K5J06YKGkTrNayNpKk/8V16yZ7y0gu9AH21H
	 AraHEERZOnu5VEryAWNFrnobzbleJjpWzfHOBAoY7TbalQ0IKCKbURmZgtLi+6l42Yv8/
	 moyu3KahH6+lhP9RTCEzq/nmKJN3SO0UncYYmMTR84Zr6cuxhT+9NC1HwA+ibWhpaJiQ6
	 9RwEDTFHiKOKHA47SeWoQAGe31U8aExbRqQI/eXGvaq1P7560XVjSaZybozFErDvZu76N
	 e5HIRpZhJrwffpw1wfEXlHW7gs9QcRFehokTH9ujKtAqAkurC/chjlKnhMnCBfkhYkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NcwS9ywJAKNcIxqmkMqTgnwEg0S9L8CF0TElYM20qnI=;
	b=zgK/YqMr0whIdhAzAX/1xn9rLYGmmXoSBkpeAEoeKcaBBISR8U8OJLgTKwayXUJ2FUms
	 AeNebTVCfGmXKNNScTWEWmXaTFN9QcSokZfPf0LuxqPC+8w5dfkFZjqeCyEGUMPdoMgIa
	 5b/LICAddtBTFoKIUhjiLt1N49ei0U5KFvZGg7KjLyqLKq1ARPNGE5wbGAugIhUeWpR6/
	 uenPI/nhKhVF6FA94grZw5UhoNvIueQ/0mBbHP652BW/kB8s6U+ApD0vM4YAHoxnJSxiA
	 nzuhv2Bdq/FWIL5k0mx+QQxQAW6yk3jtqXKTrFsp81bloCunNOYS+sv9P2lVBd6h8AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ukL+9K4M;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59C3606A326
	for <exfat@lists.linux.dev>; Wed,  4 Nov 2026 09:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A59C3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ukL+9K4M
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso739419eec.0
        for <exfat@lists.linux.dev>; Wed, 04 Nov 2026 01:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785799; x=1794390599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NcwS9ywJAKNcIxqmkMqTgnwEg0S9L8CF0TElYM20qnI=;
        b=ukL+9K4MoLw0pHMY4Y59WlcfKPAO8U7n0k3Wx53ZLmGePLHLLOgq9tKf7efi/wvyWZ
         mRV/PUepuwu//rZbVsNIHPzbsQiWBu5+ClQ0D7C26ey1F8QX2+0uK/kAsMj2uJ1j8n2o
         TM/M6GI2Wr+SNj/0seMwpkfNfPniHzHs4HQQW/Ehb6+eOTfAt7vWEpqtC2cTd2CiAiok
         ac0S8epcaYlhcT+4JSoFBai+x3pwPXJDb/FVkKbEVmzJMJbhNtIb8eDI8idqlNFFbkku
         ZUXsC05jUCGjxO0Pi/tpSEtWr/ydiGEY275pDakoIFmISZIGeoAEGJdAxUIpg3lR0vb7
         fR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785799; x=1794390599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcwS9ywJAKNcIxqmkMqTgnwEg0S9L8CF0TElYM20qnI=;
        b=0JO26H+VjQyc/vsFZ16vMm3npf8RuUILC0ht1u7vZu042v103R5PxZP/fqzItGdQAt
         Np/tYRd/KH7FUVoTUzbe99fIS6kB5q+5FIM2Hh0aDHzbdCuDuj01vJTPxwU2wa9M5mEl
         MPtjD9g16MphgIHxH1y5mL3M99vvJf5C0ctvC/YiNtK9LaL4Xv7gZLD+u0Hcew9bsQ8b
         YEqEI/E7MqBbfObtkoS7yEnkeBKaoBftSobT1F8UUHos5bQq1E5E+7T25xMvYZ5A92iG
         HzvISDEEtQvZ5x2L/8cIJEcm7+QR5v6tFmQoibt9j7r+GUjgPDNp9ft1TkFE8KpEpObf
         x0xw==
X-Forwarded-Encrypted: i=1; AKwUvBwqC9qXUnejP+WIqQ16bWk/VjWHaTAaMMS3XtjnuMPowMdTfCaXlJsfi/Und58DJyinUiLtGA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8M3owvv3PHIvfjFmoBLdS0sB47dYHNFiraQgoq7nCNWMdGJZc6
	wfBGub2rt/yxl+MfOh1+LfiT+EQvrYxJ+UPeU0KIt732GfudtnTLEJOm
X-Gm-Gg: AYBFou3oNYmBClatU99E4P+5uNO6WlCdsNL695a9Jv+RYKok9E3FaJIo6h2DoovGnae
	HNcfE87csrRSVHsnnL7wqxoVa6G8qmckZUAWmJLzCDmmPsObSrXFRQ1ZSVyOhVdSrNFQiNN/jUG
	015O77F8uTpcRK4VRVZGM2iNle6jMgrzF/3zxZJSiSKMmg1SmZrXjV1w2jV8/94L+a3Yc4nvSN6
	kKvTNIK8yoZxi4U2PwgnOmXrN38O0i4D1BO1st4+MhGb/NPyNUuBOWyxyywUVC0Kz0em6NFjJAN
	lNfq+1QwoNtg9Gb/5v/uW3c5IXcr2ghtBceJe/K2WIYQU1G3FHPuvnR5TcABcNQZV/LfMa1AQay
	jQz61GiYmacS4qE06IesnZ2+ahPqYNuoi5H96F3M7ZBl8vWptCR0Gai4AFkAUu0wmI0GKPyRSeK
	rkW0wUaZ+dPl3RlL1TK0Xl9n5n26I8CzMn/2H8+IFRW9dWU2NwTP5cvTgrwdRewy8azOEiQuofy
	e8H1tsHiv8KT3zo/hophbOvk+EAE4ZxVG/v4lOCxQS25NxK2lvX2oOzuO5tSkGVIokdvKS7btKD
	Uz8L5UI7yMC2Zh+MRBjCzs1WVz4rygVzBiaeECagaMwJv0H1Fhkm9dXgtoNsSbg=
X-Received: by 2002:a05:693c:2512:b0:369:fa7c:aee9 with SMTP id 5a478bee46e88-36a423f54a1mr22508608eec.19.1793785798462;
        Wed, 04 Nov 2026 01:49:58 -0800 (PST)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3989670sm8205216eec.25.2026.11.04.01.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:49:57 -0800 (PST)
From: Wenjie Qi <qwjhust@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH] exfat: enable buffered RWF_DONTCACHE
Date: Wed,  4 Nov 2026 17:49:51 +0800
Message-ID: <20261104-exfat-dropbehind-v1-3caa58820a82-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
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

From: Wenjie Qi <qiwenjie@xiaomi.com>

exFAT uses filemap for buffered reads and iomap for buffered writes and
writeback. These paths already handle IOCB_DONTCACHE, including marking
new folios for dropbehind and completing writeback bios in task context
when needed.

Advertise FOP_DONTCACHE so preadv2() and pwritev2() callers can request
that newly instantiated page-cache folios be dropped after I/O. This is
useful for one-pass reads and streaming writes to removable media.

On an NVMe-backed exFAT image with 128-KiB clusters in QEMU with two
vCPUs and 2 GiB RAM, disable KASAN, lockdep and tracing for measurement.
Compare normal and dontcache I/O in three pairs with alternating order.
Read a 4-GiB file using 1-MiB calls. Write new 1-GiB files using 8-KiB
and 1-MiB calls in a memcg with memory.max=255852544 and no swap.
Write throughput includes fdatasync(). Median throughput and peak cgroup
memory were, with percentage changes relative to normal I/O:

                      MiB/s                   Peak memory, MiB
                normal/dontcache  change   normal/dontcache  change
  read,  1 MiB    5788.4/5124.9    -11.5%      1353.3/18.9    -98.6%
  write, 8 KiB    2924.6/3400.9    +16.3%       244.0/106.7   -56.3%
  write, 1 MiB    3534.1/3985.0    +12.8%       244.0/188.3   -22.8%

Dontcache reduced peak memory and recorded no reclaim scans or steals
in any profile. Normal reads and writes scanned and reclaimed about
710,000 and 200,000 pages per run, respectively. The memory-limited
writes gained throughput. Reads reduced peak memory by 98.6%, to just
18.9 MiB, at a modest 11.5% throughput cost. This smaller cache footprint
can help reduce memory pressure on concurrent workloads on
memory-constrained mobile devices.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/exfat/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index db000001c..5b67bbf81 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -1107,6 +1107,7 @@ const struct file_operations exfat_file_operations = {
 	.splice_write	= iter_file_splice_write,
 	.fallocate	= exfat_fallocate,
 	.setlease	= generic_setlease,
+	.fop_flags	= FOP_DONTCACHE,
 };
 
 const struct inode_operations exfat_file_inode_operations = {

base-commit: 79130348ec29b74950e925e06c26f1a4eecea5ae
-- 
2.43.0
