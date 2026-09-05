Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB6260580
	for <exfat@lists.linux.dev>; Sat,  5 Sep 2026 05:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587456; cv=none; b=cJc0ASAyyXXcYhUTSs7w77oepu5usBgu4n90sBoWTMpedV+CR0kN0riCpd5qyn6OCHdc8HBj/ALTcV0L20qeU8f7AFnnaKWVSMka9UJ1B84Me/7S1TY8nuQa/HCqn4lcmExgidonNQomW/SKiGr0cF2yfouBDe2BO1xeBx3E+tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587456; c=relaxed/simple;
	bh=EfMMJ3r34TxJ5u+1Hrd5zp5unxkWwcBdwAypDNqfhgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bb6k9iAGki043uM5MRjprKfyvnmODAsDZ6xyOuvzMPwTaT+qOCtCiV7srwBf4FIfql0mcdZWitqDBzVfhv0eETvnkGsJ9yyTRYSjiDhK2fNVmHCM5dHGzlEk6TaaalJg+ziqOh6vCdNeccm4W+wNRW3ftddctQholWbgPAiPjJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HuWtOhZP; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HuWtOhZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=WP
	8uEWgtIH2TulityuNbDZZc5ghJCQ0zlacPztjbzGY=; b=HuWtOhZPStSgw673dH
	G5PxHqrPqiv2gj9cD0Hj78ykcQ2pORvKwCF8/2/fZdzJTDGJB4fhaK7r5bMyvS6c
	ogUINp4N85cP2jZpsPDSkZVZkCJyhpO9SG8vvWDP2GcQQNbq3AdKD9KxzMUUJnfA
	+0HGUAhRQR5AWWk7eWylEAvAM=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAnswumrZtqq78tAw--.49294S2;
	Sat, 05 Sep 2026 13:50:31 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH 0/2] exfat: fix cluster allocation accounting and locking
Date: Sat,  5 Sep 2026 13:49:49 +0800
Message-ID: <20260905054951.674766-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnswumrZtqq78tAw--.49294S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcpVbDUUUU
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3AcWs2qbrafuIgAA3J

From: Chi Zhiling <chizhiling@kylinos.cn>

Patch 1 fixes sbi->used_clusters accounting when cluster allocation
fails partway through. This can cause the counter to underflow.
The issue is caught by generic/476.

Patch 2 takes bitmap_lock before checking and allocating clusters.


Chi Zhiling (2):
  exfat: fix used_clusters accounting during cluster allocation
  exfat: take bitmap_lock at the start of exfat_alloc_cluster()

 fs/exfat/fatent.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

-- 
2.53.0

