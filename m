Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ABC472552
	for <exfat@lists.linux.dev>; Tue, 13 Oct 2026 03:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862765; cv=none; b=pMDlW+tjV+US8dUpx3js4TP5mk02uqmFZazqFUypqmLeTSi/NLEKg6xedX98VyGYdaWs5ZREqj3bD+jVx/bsIYbi1X1A5O1qGjn9tdSLgzDe1W5X3dn7Zrr7heoEtvvruexF7NDwqLW5EmLWEi0gF1zYifXWtq07umjXAv2Q1MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862765; c=relaxed/simple;
	bh=bwhuAkZOwzR0J/lXX8LNf5gnPWJhinBHK6yedmPSrZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u1vNEtDzNI6GLL0tf1T+E3ZsRjiOW5ROKd1JHQkh2rDMyS+PYJ68UonpbzHiALNx3SkLgokshwZFpPULQ99EwxGYMIwV7h0zBRip6uPe43QKDSCJXKyX4ePo1WRNLUB81UeTNjrpcMyGVOaXK+1+S8vinr0oCaX9Ye2X9QBO4U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SYVbzLIs; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SYVbzLIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=VVnqukMmyBcww9QLUDK+GDi9xRlMHzRMOpBWiK4Fjlc=;
	b=SYVbzLIsTKjDCN06xXDIm9Qqnpp0M3dXuvB4+pqDeENEsvuCGKhrvlkWbXeDO8
	U84W58aSPI4ERXP2q4qhNLfrVCwLXVU8+qwt3zaLtzH65BAM3HkLB3iL9zcX3+1p
	Os4UMB3KFDh2lxW1vYMSwT+0AQrzrwU0TfA2p5GELculA=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3fwTKp81qBFXLEQ--.23138S2;
	Tue, 13 Oct 2026 11:38:51 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yuezhang.Mo@sony.com,
	dxdt@dev.snart.me,
	linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v2 0/7] exfat: fix valid_size update races
Date: Tue, 13 Oct 2026 11:38:30 +0800
Message-ID: <20261013033837.2748258-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fwTKp81qBFXLEQ--.23138S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1kGFy8Wry5Ww4kGrW5GFg_yoW8XrWkpr
	Z3K3Z3Grn0y3yIyrnxCw1rAa4rZryfXF1fGrnxJw1UAr4akF12va10gFy0krWUJ3s7Kw10
	qw4jqry8Cr17A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXZ2hUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3A0ryGrNp81YKwAA3M

From: Chi Zhiling <chizhiling@kylinos.cn>

exFAT uses valid_size (ValidDataLength) as the on-disk boundary of
initialised data, but the current code advances it too late or without
proper serialisation.  As a result, buffered writes can silently lose
data reclaimed before valid_size covers it, page faults and direct I/O
can race with writes, and a failed direct write still grows the file
on disk.

This series advances valid_size under the folio lock for buffered
writes, revalidates cached iomaps, drops i_rwsem from
exfat_page_mkwrite(), and publishes i_size/valid_size only on
successful direct I/O completion.

V1: https://lore.kernel.org/exfat/59056131-e3bd-4003-8c30-0a356cf0bd82@163.com/
Link: https://lore.kernel.org/exfat/10029d6f-13cc-4d17-a2f9-b093a8339dde/T/#t

Chi Zhiling (7):
  exfat: advance valid_size under the folio lock for buffered writes
  exfat: advance valid_size while zeroing new ranges
  exfat: validate cached iomaps during buffered writes
  exfat: drop i_rwsem from exfat_page_mkwrite
  exfat: do not re-zero the valid range in exfat_page_mkwrite
  exfat: complete direct writes synchronously when they update metadata
  exfat: publish i_size and valid_size on direct I/O completion

 fs/exfat/file.c  | 69 ++++++++++++++++++++++---------------
 fs/exfat/iomap.c | 88 +++++++++++++++++++++++++++++++++++++++---------
 fs/exfat/iomap.h |  1 +
 3 files changed, 114 insertions(+), 44 deletions(-)

-- 
2.53.0

