Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819560;
	b=1pSzdQy5XzZOXc+5NXTKPVJU12f7nDiB127qthfauapj3t/ikBD3r7oo/X/nuz8tFXEa
	 j5oEci1i/Em/7lUZ/YAyRLx15DvW2CxuSAm9D5REbyY2wEQsSYgsp9j1aDctuVNcScJhK
	 qiHGlyQxNzOS4DsXomL368QMDHZ4hJUmUUchfS+6J3ifvXpu3Uc0IntwM/CO5p5jC+DpA
	 GAUbhR9ifl2J3tzVXbtJUImHP8rS0IEWlXfmRdOtn/23fiUJTy+3yeB5rrM36gXqEbKTL
	 5VSELsEZtbgjwDkQjl1selmY0+KlzfDNQp4LPFsDEHNY2roh8W4bGhbB2qBnjrIKiXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819560;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=0A5fSgQqdcMuZU5YoQspZdlWULZOxQSjV4Tshyw3PF0=;
	b=C25F11yKfg83UeQtEaDIFPW2nabcuLV1k6fwRGQx12+XVv5+uw6XDBMAIOUz9x/hXi1B
	 yfQ2zeBOJdI51IX7u/MduytZjtxsJmKkiT93MvEdLbCFi4BuA99aYd9UjyGAgdGZM0jry
	 0x11frMku2cm/moQND+AYE9ftp+26KrZVdWuKQVyarI3R7b2VCRjteJzVFKJCFa2M/LyA
	 axjHuYpVe88YUieXtpnY6jpl3L+itK8Nzd3maQvBChoL9dAe/cm/YUSwtiaZkqXLvWdDb
	 j8O9EdLA9W1x8QO7kfSxMgrOyx9yheRKNOXX2ffSiXfN4gwnJcxkgDauhKvYO/C1xGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=okoxXDXS;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24270606A33F
	for <exfat@lists.linux.dev>; Mon, 16 Nov 2026 08:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24270606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=okoxXDXS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=0A
	5fSgQqdcMuZU5YoQspZdlWULZOxQSjV4Tshyw3PF0=; b=okoxXDXSo9jIrZlJ4z
	RuWzLna3iB24BDzR1WcRQMgMtI01naZ+MuQcZgPnUefTEqwx7allnjeyuLNAJo4G
	Qes62sGbx0g5K2FdnsQHp1Qhk+rb74FMZmkzIynCREfG7m55i/V2Y9/JuVCK88sE
	auNrP73YkxpbwV7cT+DqZx8B8=
Received: from czl-pc (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAH5iLPxfpqqlTnHw--.59228S2;
	Mon, 16 Nov 2026 16:58:56 +0800 (CST)
From: Chi Zhiling <chizhiling@163.com>
To: linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Chi Zhiling <chizhiling@kylinos.cn>
Subject: [PATCH v4 0/5] exfat: fix valid_size update races
Date: Mon, 16 Nov 2026 16:57:47 +0800
Message-ID: <20261116085752.3908082-1-chizhiling@163.com>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:_____wAH5iLPxfpqqlTnHw--.59228S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGryDXw1fuFW3Xw4rJF4Utwb_yoW5Xr45pa
	9aganxGrWDt3yxXrnxCw18Ja4F9w1rXr13Wry3J343Zrs0yF1UZayjka18Z34UJwnrGr10
	qr1qqry8urnrC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U6rWwUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC3BL+nGr6xdLMTwAA3o

From: Chi Zhiling <chizhiling@kylinos.cn>

exFAT uses valid_size (ValidDataLength) as the on-disk boundary of
initialised data, but the current code advances it too late and without
proper serialisation.  Buffered writes can silently lose data reclaimed
before valid_size covers it, file expansion and page faults can
initialise the same range concurrently, and a failed or short direct
write can still grow the file on disk.

This series advances valid_size under the folio lock, keeps zeroed_size
in sync with the block tails that were actually initialised, and
revalidates cached iomaps for buffered writes.  File expansion holds
invalidate_lock across allocation, EOF cleanup and the i_size update.
Direct writes are prepared and written back through their destination
boundary folio before submission, publish i_size and valid_size only
from ->end_io(), and hold invalidate_lock across completion, post-write
invalidation, gap initialisation and rollback so that mmap faults
cannot interfere.

V4:
- Fold the series into five patches and rebase onto current exfat/dev.
- Add a patch that serialises file expansion with mmap write faults.
- Rework direct writes: prepare and write back the invalid range through
  the destination boundary folio, initialise the gap after the post-write
  invalidation, and keep pure overwrites asynchronous.
- Track initialised block tails in zeroed_size instead of
  IOMAP_F_ZERO_TAIL, record the on-disk length in i_size, and finish
  short direct reads with filemap_read().
- Pick up the Reviewed-by on the iomap patch.

V3: https://lore.kernel.org/exfat/20261016033349.3104509-1-chizhiling@163.com/
V2: https://lore.kernel.org/exfat/20261013033837.2748258-1-chizhiling@163.com/
V1: https://lore.kernel.org/exfat/59056131-e3bd-4003-8c30-0a356cf0bd82@163.com/
Link: https://lore.kernel.org/exfat/10029d6f-13cc-4d17-a2f9-b093a8339dde/T/#t

Chi Zhiling (3):
  iomap: export iomap_bio_read_folio_range_sync()
  exfat: increase VDL before unlocking initialized folios
  exfat: zero invalid VDL tails in buffered and direct reads

Namjae Jeon (2):
  exfat: serialize file expansion with mmap write faults
  exfat: coordinate direct writes with mmap faults

 fs/exfat/exfat_fs.h   |   2 +-
 fs/exfat/fatent.c     |   6 +-
 fs/exfat/file.c       | 427 ++++++++++++++++++++++++++++++++----------
 fs/exfat/inode.c      |  19 +-
 fs/exfat/iomap.c      | 368 ++++++++++++++++++++++++------------
 fs/exfat/iomap.h      |  10 +-
 fs/iomap/bio.c        |   1 +
 fs/iomap/internal.h   |  12 --
 include/linux/iomap.h |   9 +
 9 files changed, 599 insertions(+), 255 deletions(-)

-- 
2.53.0

