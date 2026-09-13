Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5994E3E9C2B;
	Sun, 13 Sep 2026 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789301212; cv=none; b=bLKBli3deZuF8k12GPMMfwosE+XZqQB9cOi20s1Ni5sJQlrxJCe4iWEanmuQ/HK++dYtY7Wn3DNe0r8QKoU7G22MYJ89fz32kcP5jwefFkHOeRpo5kH7EWYI4RyUrkkr8GpaFu7Go442r32z4bfKcYYA684KOhd2dBluMny7x/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789301212; c=relaxed/simple;
	bh=LbKgPgU04mrST1QxRDk/vzM9Te9Cl8UwJAm78+g22Cc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E5Fb62kDL5/9MBvg7t+sAUQT3Ok0qFL9yHPRM/iRYFJONDoKwH/bFMc+x/cMhC0Y62Qm+9f6llzzTYv7aojgLfczJomQNwN1MxB+1gJRjo4J66Ljtqrq5aPBcjY46PpMjecSCarYRq/D1XVZu8SY1n4XtiTuIQFewGMM//b+Gto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diTM26xj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diTM26xj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516B81F000FF;
	Sun, 13 Sep 2026 12:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789301207;
	bh=CAvtWYVcIjEz8B7iBC9t7jtNQ1qTqphrsgEj+HDlqZs=;
	h=From:To:Cc:Subject:Date;
	b=diTM26xjF+KA4YtNjQUcQflTcSVbNIJn4dWJmvtOhAqiKBC6uGWsV0/nbWgTIzeeG
	 R3Zem1Lgq5vOoKi7+rG/er4eOEj6+kIaUmjf4U7YzVAngszCahzpZ++vsQICr+hLXF
	 mhmgD4zRgC62gJjyhEzvMCt2c4YZJ82uKiyRP7nAEn81ggZDQRa65qtbDShClgMfQN
	 Xzn7dFmklY2K0j0zFT8RrvIwBh6BlMpk1o91S8fsUzz5PqPQsNRDE6YtYSaTr6M/f2
	 Rjg/tpQ9oGlUI6sJGLw28UTI7oLQ4edQmXx3JwgC5EyQBLXbkPgLgT+kpaDs2u5Azi
	 d4x3FlonUAy/Q==
From: Namjae Jeon <linkinjeon@kernel.org>
To: sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Cc: exfat@lists.linux.dev,
	anmuxixixi@gmail.com,
	dxdt@dev.snart.me,
	chizhiling@kylinos.cn,
	linux-kernel@vger.kernel.org,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH] MAINTAINERS: add exFAT documentation
Date: Sun, 13 Sep 2026 21:06:40 +0900
Message-Id: <20260913120640.15133-1-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the exFAT filesystem documentation to the exfat entry in MAINTAINERS.

Cc: David Timber <dxdt@dev.snart.me>
Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e05570c393c5..f585b34cc25a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9793,6 +9793,7 @@ R:	Yuezhang Mo <yuezhang.mo@sony.com>
 L:	exfat@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git
+F:	Documentation/filesystems/exfat.rst
 F:	fs/exfat/
 
 EXPRESSWIRE PROTOCOL LIBRARY
-- 
2.25.1

