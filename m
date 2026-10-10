Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B2C34216C
	for <exfat@lists.linux.dev>; Sat, 10 Oct 2026 04:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791607486; cv=none; b=gvgZjW9Sz8US0J2Q6y86z6n4JjgMSwGx3UgP3eJK55qgTdhqfJtMtzd3/NyV0AWlpBoyrFXhRV53qu10gqhckGaPH+pTtXy9bCZHl+VL5GT4hOh77o8n/ek0nbkjJYQJCDepSDo9vL14+tiXKsIuJGVKLu/Qw8K1Gz49cy6i+xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791607486; c=relaxed/simple;
	bh=NJ8Q7R+kkyINmmcbmlNU2P6jcWurAscUCSHGvHNdJNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HxKSkL/xnf0q5urHdZzuozbV84hTgLrZP702GHZdvdoLPj8Ajqk2loqd/e5C9HApW/EPdIoPitGSzwAGGxKdndYp6fwA5ltQLkxLTGWvapBfm2btDu/LksRiuj3zUjh/KIed5VpDTOIt62OF1+msT6MiPtRcTjedBLVtvJxrRa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=lWm3a20R; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="lWm3a20R"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-533778ab0bdso4364181cf.3
        for <exfat@lists.linux.dev>; Fri, 09 Oct 2026 21:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791607483; x=1792212283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hiI5l1WO37R1trlnFJLtpLJkrk+sQLsTydeW4SAQCdE=;
        b=lWm3a20RaJ9Ab8WPjc1D69CnZuVryLI6xP0LUp0J0hll36FA6saLUH3vVwro5Oye1K
         HrKsQYXVZXpW2XHd8hP53yKFHdU1Wezpk99at5LPfCBRcYNXthR9aMnKnKgCQhjq/nvu
         wehL0i7XD6JaZReWdjJJuUxchne9PLt6HRy/HYKJ/W468VMKKbwIqtcWCsKuT4w3UPkw
         yicN+4+3ZpH+0F28B46Vh0y14K6l8FBNnQcJj8GkJag3fM6Nt1wuTC89MyZfnIp7EKdM
         5C2pxToq+wPM+JgnZWrFdip+OmZu5/VeK0Aw2nCuKM395TGmmO+zc7CTgOLMwACtAuyD
         B0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791607483; x=1792212283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hiI5l1WO37R1trlnFJLtpLJkrk+sQLsTydeW4SAQCdE=;
        b=aRKpiatIb/qA6RzFU51KkDlkmErgCiB918vfvigbUoXqH481bCXe+RuAhGw/jl7N0g
         kq/63lSTfwWobn9TKZM4OFco+qVvbz/C+wQKdheOJt3dokFizLhjg5aTumE+T2ised4X
         f8OENX2Jo1RCgcHFM3lWda7CZvknE03bp7/XiMtTk5uWnZm2NtQmQ5j3uZo2QbNt6wPf
         5TDV03Chjr/JPpRxkSvQiFor2p9NEkgci7OqAMyOWIoUCt7EDEofQ/r8M6LXBgGP5ABT
         E0yEQaZpC5YGmzSNZXryhLCtxE6mELCYR+d0NHTeHvK7g5Xc2nlnwkmKhf9T9zdDl0mB
         ndcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxofOg5oslT0JpT6MePbePVMoaiW5OHbLYZQJQAV2FLF7YoT9ukEpZhSj3KjnOYvTR6NO2DpA==@lists.linux.dev
X-Gm-Message-State: AFq9FYItfSY0a3+QxrpJX0vDO5mxRpSfkN1j+diwDSKFuzxwyun6n4MB
	HOLZoOoz7tRQeFLQivYUk4P9kGqUovKCYsnUamqmAnk8HuCzA5Zh5pOSaiHmGUg4lw==
X-Gm-Gg: AYBFou0vTGx3VMqkwcYBCO09LjrrGqrotZ+KkfO56mYs9LoaO89maJoBlReygEfTs9A
	cTqkxV3G0ftwXGwnLKpsOnM3VMvxVjy6GlK3A6JMeyVOaELqqOJZxlXxB238n8H3yKXhGLQA7oo
	6yE1ZvOrzHBdejYjGYmFD/Mvt9QZmfUaOOBaEyx2ZRO3uhyoCdzwrzZAbQBBqIc1V5tlMdB0EFF
	0SirvArqmvPbEzVsoP7myWQEHTzkLul0RTn41GdERw/Y/a/FdDCi6iqlRgu4TaLxxZIg95EVhg3
	RCm9EdK9577D+c5R8Sv36LxceX05+c5v7mkj1jBK18oGxCXwYAd289hMIaygclOcbBQsTmf+z7w
	UDkCYjW+VAT5g0Qc3TO74Iea3sysAimlkEtsUmFalbSMdMgyFDKfVTnUTd7sdcMghjhjOUR8rZK
	aRHu73LAWmSfiqLZbIJC4HjmEI45jhgvFEz7eeFCpTfIc1+KBW55tKx0GCh0R5+1xB2s7QE3qjk
	3PJrhfbMkRcDYuFkofR7Q==
X-Received: by 2002:a05:622a:1453:b0:535:a5f8:a5bf with SMTP id d75a77b69052e-535a5f8b4f3mr56134281cf.63.1791607483187;
        Fri, 09 Oct 2026 21:44:43 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550de014sm35943476d6.44.2026.10.09.21.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:44:42 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>
Cc: Yuezhang Mo <yuezhang.mo@sony.com>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] exfat: fix a large buffered write failing when the volume is nearly full
Date: Sat, 10 Oct 2026 00:44:20 -0400
Message-ID: <20261010044420.4045884-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 82a81a7352bc ("exfat: add iomap buffered I/O support") made a
buffered write map the whole range of the write in one step, so the
clusters for all of it are allocated at once.

However, exfat_alloc_cluster() returns -ENOSPC when fewer clusters are
free than it is asked for. As of now, a write() that is larger than the
free space writes nothing and fails with ENOSPC, while it used to write
as much as fits and return a short count.

The issue can be reproduced with a 16M image made by mkfs.exfat that is
filled except for 256K:

    mount -o loop /img /mnt
    dd if=/dev/zero of=/mnt/hole bs=256k count=1
    dd if=/dev/zero of=/mnt/fill bs=4k
    rm /mnt/hole
    dd if=/dev/zero of=/mnt/f bs=1M count=1
    wc -c < /mnt/f

Before commit 82a81a7352bc ("exfat: add iomap buffered I/O support"),
the result is:

    262144

After that commit, the result is:

    0

This patch will map a single cluster when the clusters for the whole
range cannot be allocated, so that the write goes on until the volume is
full. Direct I/O is not changed, it still fails without writing as it
did before that commit.

Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Direct I/O is left alone on purpose. exfat_alloc_cluster() could
instead take what is left when it is called with contig set, but direct
I/O uses the same path. As far as I can see, a large direct write would
then allocate and write those clusters and still fail with ENOSPC at
the next mapping, and the clusters would stay beyond i_size. Before
82a81a7352bc such a direct write also failed without writing.

Tested on v7.3-rc6 in QEMU with 512-byte, 4K and 32K clusters.
fsck.exfat is clean after several writers filled the volume. The patch
also applies to linux-next 20261009.

 fs/exfat/iomap.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index 8911aa84a730..22facb240b85 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -74,6 +74,17 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 
 	err = exfat_map_cluster(inode, exfat_bytes_to_cluster(sbi, offset),
 			&cluster, &num_clusters, may_alloc, &balloc);
+	if (err == -ENOSPC && !(flags & IOMAP_DIRECT)) {
+		/*
+		 * There are not enough free clusters for the whole range. A
+		 * buffered write can be short, so map what still fits.
+		 */
+		num_clusters = 1;
+		err = exfat_map_cluster(inode,
+					exfat_bytes_to_cluster(sbi, offset),
+					&cluster, &num_clusters, may_alloc,
+					&balloc);
+	}
 	if (err)
 		goto out;
 
-- 
2.53.0

