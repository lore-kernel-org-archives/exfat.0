Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7854BAA0E
	for <exfat@lists.linux.dev>; Thu,  8 Oct 2026 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471358; cv=none; b=iSg0aGPXyAsLeAuNJK0Or0ftAfp9DvzOHxEZQhSoUrqLa40LLwCz7ifrLBCuAzpTgkbcXJ66gVcFnMsGd/iezaZUVj01UqEAT9zavmjyxscwTGWvKQgcK/ZnFPBMIUScnnTneQSZrQpCRsA3lBXVImfFTTPBKE80UvVuK6iXSo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471358; c=relaxed/simple;
	bh=gdxCPfF96pA4YfQ7v4RRnxY/VkvGOhrnMgmgGafYlcI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TTYnGKG7QdS1OlBS5Q/OJzLBErsNEOX+KyVvD+c6vAAemW9dEZS66TraUQQgvj10sWJazohjqT9teXFauqio+7Ayeoyv+LeHSVLRBif+4QeQMHP7sPmPlV9sWwS6FaN6Fzdbu/rMoTXCR/YGKJwML+Exi3N1dn/uh1jmygCn8zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyVOqdtV; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyVOqdtV"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so699279a91.0
        for <exfat@lists.linux.dev>; Thu, 08 Oct 2026 07:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791471345; x=1792076145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4BRMTMxafQec9J5rW9iQ71WwQZZeW692fSJYVpU/vzA=;
        b=cyVOqdtVNseY80t5Qxc/YejIKNwICpL1+d19nyKhmQblzlRn/n4FTR1+HWpEa8/nN+
         vrfJcPooCJhLOcjGWnPc0bSrVJ8Pdji+9qk7PExr/FqzX6ctXnwtUyn4dOOrmBSEeair
         4pFDCz8KPMU/gE0oYtAJFP1rRZqUg8aWG3cSRhcMHIfWuTWxt4pz8iozmRiR5g21TqVU
         sSW0mKIvFkNEzG25v/jiLmSUsx+Sv4+1CkzOHICND1d91nf23jo9zWuTleH01z/oyRmT
         ks+5WmM3KFd53fVYUVOaNYt2YKY1+iSIqx7mZOB9ygwC6/Rgf0CgaeVOvLJR6QL+I+vo
         CSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471345; x=1792076145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BRMTMxafQec9J5rW9iQ71WwQZZeW692fSJYVpU/vzA=;
        b=x0MmmqENmr4MKFg9EI0IK04nYcAFaiaFQCLMwP5/vg811vSGC1lLiJ4Ay7IexTZAv3
         xXed9W3Q68A1/FmahD4pmZFe217qqxvy4hs2cNuicgwbUUEa2xKnXDrUqAFjQKKiWGbh
         cHO8YrO4/DxQyWsGlmxnibpGc0JTkjpFwhbIY5MT5vCVMXEr+XTGUQZcplb9VuYxQHIS
         YfYWc2ud1aUY/HhEPEqbSeZq4isLxLktniSWCJ121vf5Nlxe+DIcAAh+IY2BFRUh07O5
         MhM5nFsh+QPbUzEc14a1sD6Ez556/UarJaH1Xo9eZx4lE3JiyLgHk7fNRruRzbZkwZfv
         6M4A==
X-Forwarded-Encrypted: i=1; AKwUvByyU7LZuqjEgQCXee35NDhxj0hshSrJcQ51pBPpYEnRkNUaEK0AGOhbCOR9XfPQfjPzG6syjg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2CKdSm2FHGmqxDWvB3w2ah66aatPU0XPn72QdwThwkdM4cp6P
	HEd7FBIpumH97xlOFBrtv8ZQ93G6tl9mxkvAsiBbyCXY/jQquTcVEhbt
X-Gm-Gg: AYBFou30VAVv2RxcM5XCYMoYNj/BmaJU61WdTGOZjrJYUrZ6cFNRX4baeOLYp6ZGv//
	7T5fcKGlcJCouoOdyDcWwMAUoFcWFKUmTpXBNiqhEP13XTsHtiqaLsvtHTiLDlcgLqQkXJr2lWu
	4qMS9hzM1UywqOoOFQgOcktbXzzC3c+bjQCq6dbhoYyKzIF+cwehYUcGaNyb+kZSPxjON2EJc6b
	kxlk6/nseNl//oKM+n4/JTeqZoms6GFn/SkeWqewIPhFfghM8QeFJ8nI6NUKmg0o1Y7yJUFote3
	CHYLhTPH+AjDBek3m0XD/ZLj+cFLwlFZGFCmDjVYgM46dJFhwuLJ25QPdn52cofhdg4MR9jdKp8
	TalHR4KSRaPwMtSfel8IEc191eeORTOOkAfMYQ6mdetLVPFkohJQ8LzVL/mN/AnpZkggqoqafCG
	lxmSoukdjK8uWnZ7nuUUMSYdE9OoDcIS6XTuaII7OZk/32Isu9zocxK+KV9r6eWKQ3XAUbfQJ6l
	1Z+mlS4CYGU
X-Received: by 2002:a17:90b:268a:b0:3a0:c20b:2ff1 with SMTP id 98e67ed59e1d1-3aaed7ff66cmr1490344a91.28.1791471345008;
        Thu, 08 Oct 2026 07:55:45 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab12e6b7f9sm1071596a91.3.2026.10.08.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:55:44 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v2 0/2] fsck: harden boot-sector field validation
Date: Thu,  8 Oct 2026 22:55:23 +0800
Message-Id: <20261008145525.1950813-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series hardens validation of untrusted fields in the exFAT boot
sector.

The first patch validates the sector and cluster shift fields before
using them in shift expressions. It addresses the review feedback on
v1 and is authored by me.

The second patch is the CVE-2026-45531 fix from the Android exfatprogs
tree, preserving David Anderson's authorship and the original code
changes.

Changes in v2:
- Split the shift-field validation into a preparatory patch.
- Validate sect_size_bits and sect_per_clus_bits before shifting.
- Add a link to the original Android commit.

David Anderson (1):
  fsck: prevent overflows from invalid clu_count and vol_length

Yang Wen (1):
  fsck: validate boot-sector shift values before use

 fsck/fsck.c                               |  34 ++++++++++++++++++++--
 include/libexfat.h                        |   2 +-
 tests/clu_count_overflow/exfat.img.tar.xz | Bin 0 -> 3636 bytes
 3 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 tests/clu_count_overflow/exfat.img.tar.xz

base-commit: 2399fbe848f57aff15ef3a7db4bf852e0de0d0e9

-- 
2.38.0.windows.1
