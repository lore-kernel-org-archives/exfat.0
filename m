Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A87332C94A
	for <exfat@lists.linux.dev>; Sat,  5 Sep 2026 17:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788628265; cv=none; b=Bp4XW8TbJ8R6xaqqv9EjFccgILE4Lks6iaLzmlYt0cIKzeOLCep3ST3B4BPcfeZ8WbVjxIUOCYIloJ4Ya0zwocgKxiHgt6GBYeza8Wv0m8hEE3VgF9FJcZgfQarAn0H2HjTc8B/VdoNyLND/BIbyMCRGLvkL6eIolkSENafNimM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788628265; c=relaxed/simple;
	bh=B3YSYo+2NgX2FHZXCofDYBDxT+tEHw6keTCviXLSCSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F8h8Ycbz4hBiuy3GC+xiUi2ZRFjnfsHq+keYbrm9GreFJCVd2dqWW/vldm8ckrmgLHHwhyq6/Xnt4UTLhzmo6UQ+wCE8p3ZvaL35HQ0Me+xU/11XCnSFuDZQD2CkJclPP+xChKaMcFDT+gs3Ily0DTI/ZfmCSwPD83urcMS2DLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=LPkpbXWd; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="LPkpbXWd"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 90CE41D452;
	Sat,  5 Sep 2026 17:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 90CE41D452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788628262; bh=B3YSYo+2NgX2FHZXCofDYBDxT+tEHw6keTCviXLSCSI=;
	h=From:To:Cc:Subject:Date:From;
	b=LPkpbXWdJ9/gJb/i1ZHeAosA/JgEQsC5yW1ZDIwh+ejsJHPgh/vr90KXVCXvuCgID
	 hF1ztPc/p9FMJxSI7VIA7+wJh7BFVNv0XUk16fQAqOb3g4Dje3PjDIHzuK9zhooCYy
	 M7Lp4Yn7P9DrVt719xmoP41JM4nZmC6cMPUrvN2c=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id 30O2ECVNnGrEmwUA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Sat, 05 Sep 2026 17:11:01 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>
Cc: exfat@lists.linux.dev,
	Hyunchul Lee <hyc.lee@gmail.com>,
	linux-kernel@vger.kernel.org,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v1 0/2] exfat: update percent_in_use, remove runtime integer division
Date: Sat,  5 Sep 2026 17:10:41 +0000
Message-ID: <20260905171043.922793-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes from RFC v0:

  - use mul_u64_u32_div() for 32-bit arch without 64-bit integer
    division

mul_u64_u32_div() isn't so popular API, so I'm not sure it's available
on all arch.

I don't have a beefy machine to test my patches for all arch... If you'd
like to apply, I suggest waiting for the CI bots to finish testing. I
believe all submitted patches that apply to the master branch are tested
by the bots. I'll ping when the patches get a pass.


David Timber (2):
  exfat: update percent_in_use field when updating volume flags
  exfat: remove runtime integer division

 fs/exfat/dir.c      |  3 ++-
 fs/exfat/exfat_fs.h |  1 +
 fs/exfat/namei.c    |  4 ++--
 fs/exfat/super.c    | 20 +++++++++++++++++---
 4 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.55.0

