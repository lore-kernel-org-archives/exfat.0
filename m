Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A39242123C
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300717; cv=none; b=sb8XiRRBDYDvxic70VnBuZRimyrzXwHAA10UadF4EOwL8rJa4qiuMvgQ+6wDhVUlXaUi3Ca8/XT8juKWuQDiMuY6rIhounqEeKFQbXOt0iShwrstGQRNQBBhacz7nqNgzQ1zdv5gYfuG4PCuJkJ2RjRWH8GgRJT9TwlF1v2UcEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300717; c=relaxed/simple;
	bh=oprAM1bDzWcQ8Uz098DHu8j76TzMsTPWSu/qwv+NAmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rjqK+8dhjj52DB/Kc8tR58BXwwI6B+u1UaZAA8v6oqqgctAgX5oG1+51AIQtvG060q1xm36mEaVlF+TqySCcHl4FytxqnXR2WGQHmc9txPoOo4k2p7P+7LhDwLHIBVwsOuL6A93lmvD2eSA8HPQkWWyFhMgk/meJowTYI/Ezo4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=YDforcBv; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="YDforcBv"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 6F1F21D455;
	Fri, 21 Aug 2026 08:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 6F1F21D455
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787300713; bh=oprAM1bDzWcQ8Uz098DHu8j76TzMsTPWSu/qwv+NAmI=;
	h=From:To:Cc:Subject:Date:From;
	b=YDforcBvMNN21MLuGiJUQPM6cLuvmqnM9JaaXNb7+Eq+c7mx4H7E2ptoBkYgnmvrz
	 nus9R/HghGEu5QzmcroCkAfpM3dI4oDnyNZ1xecK/MGxENz89sH/5QsIpaWiB/OrT4
	 P0BlGyBAk2HUAZw00fgEBR3F3cqklSgWNCCNSmes=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id dbwxCGgLiGqVUgAA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Fri, 21 Aug 2026 08:25:12 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 0/1] mkfs: set MAP_NORESERVE to force overcommit in exfat_map_blankmem()
Date: Fri, 21 Aug 2026 17:24:53 +0900
Message-ID: <20260821082454.9976-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is taken out of GH PR #380. I though it didn't belong there and
I'd like to sit on the PR for a little while longer than I anticipated.

The patch doesn't really fix anything, especially with modern beefy
hardware. It just prevents mkfs from munching on RAM on embedded
systems. That is the behaviour I intended in the first place.

Thanks,

David Timber (1):
  mkfs: set MAP_NORESERVE to force overcommit in exfat_map_blankmem()

 include/libexfat.h | 10 +++++++---
 lib/libexfat.c     |  4 ++--
 2 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.55.0

