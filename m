Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793498242;
	b=sQp6ycPrg7UjHwxf/xeVy9WWuIKlPWMGu8IsAfoGgytLnHBOLH22xiKm5g4yvPvJUipI
	 8TqUbFR7XNF8GDhiMdu7i2RP29A88qF5g2pAUe1X0rLj4nI7Wl3ncvcXrGW/qM0yJq4Ko
	 wx2/h+pXPzv0xZu6J8Roc97tDEymda7QLNcCnSgp7RIvWoZnNNl4ZZPBNPHwrvdD2qIlX
	 s1GeQQy8VtvZ2oLqlYGl0I1pYqWOKM3fT1KtiSs05jLUn+JrQOgUhzeLbSFbvlHEiiMj9
	 8JAGA74uN/Vewb6t6G1g2QR+rjgl78Im3XBRDUuaxYkpL3SPMwfJXmSOo39u7wzKKWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793498242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ldhDDTtZAE/3brSKAhksuwsG1IPpe3NESKnYVMmoFBE=;
	b=14f4quWVATJHiVNj3ahHpV08xMlx0dDZcSV9XQZm8iYNQegTn/W477IbXE27LRoj0mmY
	 T9NC1dBAZKiPdCNsW6xYzEXeF0cYX3vZNnzNuuCqmSGcXJj5YE/n74DnCmUKIllVK9khi
	 EyAiK2EuFJNzL0OO4sYn0QMX2RsD8kCQu1l4QT5bBCQH5z2Mjlb7XlaacH5CiyM+SGXwk
	 IEzgiqXu5iAqpPMTGoaZQWHqkYkzs/n586EEXbSd0jBA50yIZde6z5CTSM1WppMX6XNYr
	 roHVTG4yW3qGLheYjjs99JVnDsFdw8yY9J7d2/mFYeNPS/lvl2mEW1G+qNmtmdfrChQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xj7u5GNp;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F889606A326
	for <exfat@lists.linux.dev>; Sun,  1 Nov 2026 01:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F889606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xj7u5GNp
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1030747f8f.3
        for <exfat@lists.linux.dev>; Sat, 31 Oct 2026 18:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793498240; x=1794103040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldhDDTtZAE/3brSKAhksuwsG1IPpe3NESKnYVMmoFBE=;
        b=Xj7u5GNpcKCX5qA/JkGtkAFDct40tMr6Xp0yTT1GLC0/Bm3LPiexMzEdEWics/YrHp
         zBDWUEcmWnxcesEUYZ9INBUiwgLXjXOZHrSxlBnGHEmj7XvYHsY/H+bdmAkMYtH7o1P7
         xHQ/fOEVoVZSIdjhkatGcbcJfd/ohRUREy4HkOTLKOsyo8AQ9OpaA0PnfiHvhV+scY2R
         rNxveOpaj4CLAFhGAV4JEuHjGj6M4g9XN5qr3GxbrLtY0pWuoA5krpOndZ3J2AyqhSj0
         UQl9Tj1FLMVmmrbMp+WT9Qk1UDemaYKPJrRKze/hWQd5BjTZI1D3CgAImaVojtMWXM8A
         1G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793498240; x=1794103040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldhDDTtZAE/3brSKAhksuwsG1IPpe3NESKnYVMmoFBE=;
        b=AxVaFpMHvaJJqGnAATVo7O9MNYg/heUVJb+Bwy1WnEYbaaUgQZ9Npay6jU5ZRMhcfQ
         O/3KD0PWoAnYA0SqEeOn2QxCPNAfBnwgura/qSIemsLgj67/T7OzM6xpE9V6TuQ2P3Vw
         M1e2QzkrvcsXH5YF3pRNTIt1mdh7NepS4IjWf5nRWHavl982tywehNhhOlEk+ulFgkUZ
         sul/gHEdPzuFQWDWDJBaJOBT7VeNdSlx+jk6/JSNfROMYHJ3jaE7u/mw115fW5xNGsd9
         UF26PunF6HBhV91AdQjzHZUu2V9DaiYXZWNL41QLdnb3TycjkvBoXYcneWJWy4y42EbT
         mlAg==
X-Forwarded-Encrypted: i=1; AKwUvBwyeLnxaMq5QB477Mt2DtttECq6vETXrIeyOygfiMCUodCtntt8+G75vLbED8lckgHx5v507w==@lists.linux.dev
X-Gm-Message-State: AFq9FYIfaReezXfDU6aBzKbfh+i69M1o6jd/u2v4uIKEZoq1oYJYOqsA
	0yd/9zG97a+2TjuGTwa7F6RLnfqzFHHdxzxKcSi+dLgL25f0EW6myXrQ
X-Gm-Gg: AYBFou2F/TKLuGY0asd2lmIRzJ/v5JquaZJ57WKwScpI9vzpYryfdP0W68WcG+cUinW
	MB1FSQTrb7n5jbxggsJZTRRffIMz1/P4P57JiRiV8btk/6u3+3Nhj7TF74lT/kE5Sk4yefe4GcI
	m33U//hqaQZuodoK553SgM+xkXrJo11aeKcGnqO8eRHESBNBH2yVrwdESGW/xfoBG6PfbRlbWf+
	Lu6ly7Xv/Q3C0Eij0AYECc2qVwzfC5Eh+pD1E8oNzST+n+NzW/VUtAkuOUm1OinRiKZyKo16cKP
	ieRGdJ4jQDr9ImHt01DCW9Z9yK8Y32a3hzAB7NKzqtnbvpFPmmWcf3BYHcSbzQNhrP/B9pc7gx/
	dhsd0U8zeY5vU4zsRLRb39fb3jT1TPW+p5sOyPqk2BQTHlAoKiPGA/N+C8dpqBfITO/PEfEIYz4
	21GGPsMHu9HokuJN82oljyEQ4miFAtfXzDtcle6HnM8XN+Nn+JhH1Uca3Jd00BQ/wT64bGU65LM
	bhbqUzKTpEy6KXmHVezzXLdrjzdPpTFmDVSXkGLwGKPUVwrfpD+tuUYY9RIWiwyQoz181fd68pv
	prczjXY8xZtwryaY5HgtUkrI
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr31193005e9.35.1793498240391;
        Sat, 31 Oct 2026 18:57:20 -0700 (PDT)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm273532835e9.11.2026.10.31.18.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 18:57:19 -0700 (PDT)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Chris Mason <mason@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Chuck Lever <cel@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v3 0/5] add provenance time (ptime)
Date: Sun,  1 Nov 2026 02:55:46 +0100
Message-ID: <20261101015551.786044-1-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This is an initial implementation of a new timestamp to indicate the
time when a file/directory was initially created.

This patch series takes inspiration from the one by Sean Smith
<defendthedisabled@gmail.com> [1], but using
file_setattr()/file_getattr() as suggested by Darrick J. Wong
<djwong@kernel.org> in [2].

The semantics of this new timestamp should be at least these:
- it should be the same as btime on a newly created file
- it's user-settable, so it can be preserved for backups, filesystem
  conversions, archives and any similar operation
- it should be preserved every time mtime gets preserved

and the correspondence with the other timestamps is as follows:

ctime <-> btime
mtime <-> ptime

Examples:
1) a .zsh_history file created in 2019, then after a few years the user
   decides to switch to another filesystem, copying the .zsh_history to
   the new home, in that case btime would have the timestamp of the copy
   and ptime would have the 2019 timestamp (just like mtime would have
   been preserved)
2) a symlink created in 2020 from the home directory to a /path going
   through the same process as the .zsh_history, in this case it would
   also make sense to sync the ptime to the 2020 timestamp instead of
   keeping only the btime (so the inode creation time).

The proof-of-concept code (for testing) for stat(1) and cp(1) is
available at https://github.com/koraynilay/coreutils (master branch)
(Note: these coreutils code changes are a prototype and won't be
submitted upstream as-is, but they work as expected in simple stat and
cp -a/--preserve=ptime tests)

Lastly, the name "provenance" and "ptime" are not final, I personally
don't have a strong opinion on any name, but while testing with stat(1)
I noticed that "Provenance" is definitely too long for the normal
output, so another option which would fit well is "Origin time",
abbreviated as "ntime" (OrigiN time) and not as "otime", as that would
conflict with btrfs' internal naming and create confusion.

v2 changes:
- fix permission bypass leading to ptime update on immutable and
  append-only files (found by sashiko[3])
- normalize ptime timestamp as done in fs/attr.c:notify_change() (found
  by sashiko[3])
- fix wording in vfs patch to be like the cover-letter

v3 changes:
- vfs: reject setting ptime with -EOPNOTSUPP on filesystems that do not
  support it instead of silently ignoring it (found by sashiko[4])
- vfs: fix not being able to clear immutable and append-only on files
  with ptime, and allow updating immutable/append-only atomically along
  with ptime (found by sashiko[4])
- btrfs: validate on-disk ptime nanoseconds and reset to otime if
  invalid (found by sashiko[4])
- btrfs: avoid re-assigning ptime on unrelated chattr calls (found by
  sashiko[4])
- add ntfs3 and exfat support as suggested by Amir Goldstein[5], but no
  vfat, smb, or nfs4 yet as they are a bit more complex
- move the introduction of fileattr_has_fsx_mask() from the btrfs patch
  to a standalone patch in the series
- btrfs: add fileattr_[gs]et to symlink and special file operations

Thanks.

[1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@gmail.com
[2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
[3]: https://sashiko.dev/#/patchset/20261027220532.736352-1-koray.fra%40gmail.com
[4]: https://sashiko.dev/#/patchset/20261028134728.294127-1-koray.fra%40gmail.com
[5]: https://lore.kernel.org/linux-btrfs/CAOQ4uxiuy0VwZj+3M-zRqQ49WTpHZpiaQ+6MZ8z8WdLjyQM_zA@mail.gmail.com/

koraynilay (5):
  vfs: add provenance time (ptime)
  vfs: add fileattr_has_fsx_mask()
  ntfs3: make crtime user-settable using ptime
  exfat: make crtime user-settable using ptime
  btrfs: add provenance time (ptime)

 fs/btrfs/btrfs_inode.h          |  4 ++++
 fs/btrfs/delayed-inode.c        |  6 ++++++
 fs/btrfs/inode.c                | 29 +++++++++++++++++++++++++-
 fs/btrfs/ioctl.c                | 12 ++++++++++-
 fs/btrfs/print-tree.c           |  1 +
 fs/btrfs/tree-log.c             |  3 +++
 fs/exfat/exfat_fs.h             |  2 ++
 fs/exfat/file.c                 | 36 ++++++++++++++++++++++++++++++++-
 fs/exfat/namei.c                |  1 +
 fs/file_attr.c                  | 33 ++++++++++++++++++++++++++++--
 fs/ntfs3/file.c                 | 14 +++++++++++--
 fs/ntfs3/frecord.c              |  8 +++++++-
 fs/stat.c                       |  2 ++
 include/linux/fileattr.h        | 26 +++++++++++++++++++++---
 include/linux/stat.h            |  1 +
 include/uapi/linux/btrfs_tree.h |  3 ++-
 include/uapi/linux/fs.h         |  8 +++++++-
 include/uapi/linux/stat.h       |  7 ++++++-
 18 files changed, 182 insertions(+), 14 deletions(-)


base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.56.0

