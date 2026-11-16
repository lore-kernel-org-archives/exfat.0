Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820071;
	b=2XdbdZZ6QzIgnvb6O4LjsyA62PiOY/yIUyQV119npQILbfJHZdjqgYhNyDR9RYq4ebmc
	 yQDVSv5PB0Alu2479hoR19+MJ3PzKBkaEKlXnmODpV4QuJ29RlSuZw/6jsD18AJESxtKw
	 DJDGdoAtlonXU+I/krhv+LTMZbIcRdPUwDsYons2fwlNj4Nf80p/qalPej4MEEix9fBAh
	 nXZXCMlPTP6r5giX17XGD+2CXRltUHiL+2W+4TTXGNdJC/HcnXbqavc74HpfMbaIfn7F4
	 krsJj87FB+8AzlFdH4fw6SjAybVWcqqc/qRMAaraimHFCWhzf90dU4p9L6EFqy2EzXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820071;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9jrbGDNJwNT++I6qX/rk6BFsrLGpO+QHoClJrk4T93g=;
	b=YBMXjv4/Q+9XlLezjZjHP6kOmkGTFiSC/Svr+rzVy175Y7N59rMG5vQgjo+SDymg6ANJ
	 sLpeqDDnrmZm8424uWu5WtluGFGSVBE4SDjQJv0uX75yivA00bKuZC7c0urKmP9SgQm8T
	 l5aRyc7px4WWhnAAHcJwqlAE+55wDIlU1LkBjGaCFGZqMFYHK7FZvFYjHkoIC7NSNnLni
	 D4qx0o+4he/nVQTL60uqhqugmKD8D9s1YuTly9CJIRrQmvTVNsC0K052dgVH7iw/nUH2c
	 dOiT1Q6ti0eCyYFcHrwf/TTtyDRUiEjELSXTnuzZrqvmJIOZO1ZDrhhW/IlhhCqa84A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q40nwSKh;
	arc=none smtp.remote-ip=95.215.58.249
Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B2606A31C
	for <exfat@lists.linux.dev>; Mon, 16 Nov 2026 09:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 637B2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=q40nwSKh
X-Envelope-To: exfat@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=7xpR20acJXoOG1c4mWrSTawN3rYxNGzptKrHaq6v5no=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794820068; v=1; x=1795424868;
 b=q40nwSKhlb1rdJw9Zts5b5d4VlVRbuXHZB3HPO1U/RnTX8eih6fn52405m+jtzG9rN7/mBF/
 SBXn9yBX2YhnhIPLdzn12SRtwsg1NSttQ7nF5yRTJqJ8O9JyMNFz5/69smVIVKGM9xLPLTzqWE4
 G9jUiK+/omchTcx3+JgLRIoE=
X-Envelope-To: exfat@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 349bcc2b47379eb2;
	Mon, 16 Nov 2026 09:07:48 +0000
X-Mizu-Trace-ID: 349bcc2b47379eb2
X-Migadu-Flow: FLOW_OUT
From: Youling Tang <youling.tang@linux.dev>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>
Cc: Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@163.com>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v2 0/2] exfat: fix iomap mapping vs truncate race
Date: Mon, 16 Nov 2026 17:07:18 +0800
Message-ID: <20261116090720.3226446-1-youling.tang@linux.dev>
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

From: Youling Tang <tangyouling@kylinos.cn>

This series fixes two related problems in the exfat iomap path.

Patch 1 fixes a race between iomap mapping and truncate: i_size was read
twice, and a shrink in between could make the mapping length negative,
which underflowed the cluster count.

Patch 2 fixes the handling of the EXFAT_EOF_CLUSTER sentinel.  The iomap
code used to convert it into a physical address; now exfat_map_cluster()
maps only the valid prefix when a range straddles the end of the chain,
and iomap reports the remaining range as a hole, matching the old
buffer_head code.

Patch 2 relies on the non-negative length guaranteed by patch 1 for the
hole mapping.

Changes since v1:
 - Move the valid-prefix clamp into exfat_map_cluster().

v1: https://lore.kernel.org/exfat/20261113080658.2440516-1-youling.tang@linux.dev/T/#t

Youling Tang (2):
  exfat: fix iomap mapping when writeback races with truncate
  exfat: don't map EXFAT_EOF_CLUSTER as a physical cluster

 fs/exfat/inode.c | 15 ++++++++++++---
 fs/exfat/iomap.c | 21 +++++++++++++++++----
 2 files changed, 29 insertions(+), 7 deletions(-)

-- 
2.43.0

