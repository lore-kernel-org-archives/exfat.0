Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD5A47605D
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308724; cv=none; b=HlAIxUUBOOEG6DxnK4v/ehgFSFm3bRL3Hx/ik6sYB++XHkwMOn3KJKOFC7BFnNV/z1Ni4sVF6x8ARD1CF4i7Kx5+jLZEJrZLSCLzQP6I5OrGCk5q9YIUPAnhqdDms/ZMaa77SNlPniHYp63j3WskpPf2YbuhMTwjQYhywc/iQEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308724; c=relaxed/simple;
	bh=s2kAY4lLhZGqfYIoxQ37v54dQyPOE3oP5+LGiH63LzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fvv9IKlgZnamUByBpsGbhvYqSSFeLRxjOMAWqCH1RTxLo2a+Qb7K5hGWxA8vAjioeT9y7Mgcr/xRCqX1Sn8egvwvMS6Le2zYR/KE0KCjXg4pfRa+MjVw+sak2j+TYH9Ae+J7OcqyZr9yhUMb3nqCOuIwCrB2NKoJjM8LS77c1qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=hX00KdvP; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="hX00KdvP"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id B32F11D455;
	Fri, 21 Aug 2026 10:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me B32F11D455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787308711; bh=s2kAY4lLhZGqfYIoxQ37v54dQyPOE3oP5+LGiH63LzY=;
	h=From:To:Cc:Subject:Date:From;
	b=hX00KdvPbGUX5AjguL/eQp6BQD29KZ2yEtYujStXbe/iXkvgG232XKTBrGKJUmvEo
	 bhPb9yRAqG9W2Ubb24fTDVD0wS9UXdcBCV993smMI49IG0kQ/ZkNiZxQL8UmUvScEA
	 rynFgij3oF9fwAnG4kOun7mEvk/SIbd6FNGjiA/0=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id /jNMGKYqiGo1WwAA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Fri, 21 Aug 2026 10:38:30 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 0/1] Github Actions: cache util-linux tarball
Date: Fri, 21 Aug 2026 19:38:20 +0900
Message-ID: <20260821103821.52224-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hopefully, this should reduce CI failures.

Test run(miss): https://github.com/dxdxdt/exfatprogs/actions/runs/32472392955

  Retrieve -> Download -> Save -> Build libblkid ...

Test run(hit): https://github.com/dxdxdt/exfatprogs/actions/runs/32472776879

  Retrieve -> (skipped) -> (skipped) -> Build libblkid ...

David Timber (1):
  Github Actions: cache util-linux tarball

 .github/workflows/c-cpp.yml | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

-- 
2.55.0

