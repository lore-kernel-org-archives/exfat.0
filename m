Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765841;
	b=h2IjZ675rCR5xlYdy00Uu0RbIrXMhpfEBRxu2oWbaxY3yLBscT67KUrM4DOyU2v+Cn09
	 L1txe+/6TFssJhPRnMy3ADqrRcb3g2jv2+JYXtO1kY4gVmZf0xp85LjcbjQIJzDoUcusw
	 P8+sKeh2nTK6A0aLxOl0qbTer38P9R2Cubf3GENEZubJ43s9US71M1JbCZJYFY2naRdVD
	 I6zCoCm3vSMxDhJyzgJ0KqBioo9YszXrOwf+gcV81BJBT3lNPG/dHP/93Hn62OHvHGYEG
	 6ZTUCu5C8fto/9fid34cOXoROfvghuOZVbqxHUiJ8nxkLjyvmE8DncSFGy2rj2GKiaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hBlOq65iTbPwnmm9a0uCTpZoFUv5trwfurUuD+0VEDk=;
	b=NDM+4sMwPlafahhiMBp6MfMAdTs/cKqrTyQeofv7YzwbgsLrF5uUMfYzROp6G7X0E/Zr
	 Ww1RvSQ0SDnY5Q+t+efjbnLtVm7nsHiFdv+TFmVCGZvPHRHQn2VLEN2loHndEcbMzuSPO
	 mEWkQeWsN+v6aZrc92+xHl7bwAUrJQzC3QYbQeS3mYiG3OSHQfo53EG/uNWmFMrl8B9+x
	 0zgZ6GJhztYD6XID54OXgnWb+QxNYGd9czlwi3nNJ4o+ijh5U4SGpUmcaZ+6deOv2ny1V
	 wwFiD77HDiOgI6/5oMNAansNrXAzK6z3fWL9bbdaLAVEBimtmglNeQWpq/CaMX2iwuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVEboZm2;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED84D606A32D
	for <exfat@lists.linux.dev>; Sun, 15 Nov 2026 18:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED84D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVEboZm2
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so2340295e9.0
        for <exfat@lists.linux.dev>; Sun, 15 Nov 2026 10:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765839; x=1795370639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hBlOq65iTbPwnmm9a0uCTpZoFUv5trwfurUuD+0VEDk=;
        b=nVEboZm2hTpgkrj0zCRu1pZeUa9wsR9yyPryM3i+eFb2Uim4Skv392rVJFY6D83CPG
         izJhLNTGxzF+ETz6DmZ2+2Izb6SWfmA9ydEw0/pGLn7Hxnzwbkj+2FHO1NPa+jfxciZT
         RZrHcD/nfdu+Gmkvr0AR21KSX/0nQ86J61Mq9cg5vh94AEx6cd/gK+vqkQ9lHHkvFyeo
         0Ue6l6Qt/SvpE2DgpCSQWfb5jdz+Z09NpZPxubZ2wJSv0mXswmWyPDYEai0rTU715Vng
         bO3Y4ov0DWVAvpyRcFyIe6scizn2kKsEHubo/0BODvX7umn902HSqAzyJyp42MwxKEjQ
         dAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765839; x=1795370639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBlOq65iTbPwnmm9a0uCTpZoFUv5trwfurUuD+0VEDk=;
        b=TKXbIuiJOEsL9DtwCeBjSt794Kf/RecPFRA8ySybl8u2OajeJopPbleTFq+Szf/JVi
         8w3D3YONejae/238URcVzAFWNWXwLkN4UznqvoVLZbNDlv3WgCJMmpYrAV2SSCCk+1sN
         P7IDD8foYrcy9p0eL9vAAHuatFcuPB0yvffv/F4OITNPOVgyZE1KuP5X6P/y3SCsTeFX
         Bwm/AVlA1N+ZO5SCZlovKq6+YDgLICfQH2y1E/0OaRc90ByFCaRQEEu8gz2gnvbm+UKh
         Tfegu+v/mxbw5zG7Vjk5AlHegizMMxRTEmrDwyDrzWD3RY+9oMUtZCwcvHGgwRLQ9+17
         8O6g==
X-Forwarded-Encrypted: i=1; AL+hErGIDAqjxAZAKr1j5NhiKrH/QesDTjI7Yll7BBE/7xHQHti4kSKzpmO3IDzTgbqRmb7KsdL4Hw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/yGbDgT2Sf7EbZNBTmjQBQ0RDcCedwgGwBDbwCm/6JgqDdH/xq
	+CjfnU8whJlFnjuKt0tbpQLBT+8j/T/E5S/6BIuiw4SVRiNb1KSZy4vI
X-Gm-Gg: AYBFou17L4lcFFUK3940vpiuVlpx2oPrDenOFdsReHcEpnV89LKANRvP80bj2GjGNON
	RKYOS64d0SrYtOBMQoa9x9dFzR5+aOpldDM14gFli5dfyEFek/K117503bz7Qrc/HbQ90t6yoV8
	aKnaHtqkQcOXfO2qrMux1uJoNSggHsji2TZ6De6ufMUo5PuKewYAp7HCvLVjCetxz96T6t3VtoP
	Fa3FXE416vmlwx93T6+Cc0r9PHHaNIKIhhvyrShhHswCTQwOHwsAXKC34oe77qeSEUGzVS9ZFVo
	KNgsZu7bmboROXsx7N5AZnL5cSxVMU4oy0ght9CkfEgyN1Jg3qRKMlEIHUglx6uY6ugW4QOb7PU
	wMqmf8SVIsYSvT6lrV4XSi+so2vrviKj96WzjKGk2RyZoVi6lRzWg5BGRzBTw8u7Di58q2PK2N0
	ewLXEkonL+nurIC53/vcMyLPH11htUsuZ9n0FVD9xVBzbvAc3HhhDVSKnomqCMBEI67QoScDlYr
	2vGDx5nHy+rrrVu+xmU4UdT84cPxlmNHZoRsAL7IzxWKDRcJhS2WDGQHPbICAwkp+/E1Bb8Po8u
	Eqi2bUtyf00qSopys1rq975f
X-Received: by 2002:a05:600c:4e88:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb6f413a83mr36468725e9.24.1794765839050;
        Sun, 15 Nov 2026 10:03:59 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm17980448f8f.58.2026.11.15.10.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:03:58 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Paulo Alcantara <pc@manguebit.org>
Cc: Chris Mason <mason@kernel.org>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v4 00/10] add provenance time (ptime)
Date: Sun, 15 Nov 2026 19:03:33 +0100
Message-ID: <20261115180343.576773-1-koray.fra@gmail.com>
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

v4 changes:
- vfs: implement fsx_xflags_mask as suggested by Amir Goldstein[6];
- add SMB (ksmbd/cifs) and nfs (nfsd/nfs) support as requested in
  previous threads;

Note:
to apply this patch 2 previous patches[7][8] from the ksmbd/cifs
subsystem are needed.

New Question:
should I rename fileattr_has_fsx_mask() to something like
fileattr_has_unsupported_fsx() and keep its code as-is, or should I add
the fsx_xflags_mask & ~allowed check in it and keep the name as-is? (or
both?)

Thanks.

[1]: https://lore.kernel.org/20260405195007.1306-2-DefendTheDisabled@gmail.com
[2]: https://lore.kernel.org/20260407014129.GC6192@frogsfrogsfrogs
[3]: https://sashiko.dev/#/patchset/20261027220532.736352-1-koray.fra%40gmail.com
[4]: https://sashiko.dev/#/patchset/20261028134728.294127-1-koray.fra%40gmail.com
[5]: https://lore.kernel.org/CAOQ4uxiuy0VwZj+3M-zRqQ49WTpHZpiaQ+6MZ8z8WdLjyQM_zA@mail.gmail.com/
[6]: https://lore.kernel.org/CAOQ4uxjtuTDT63vJdYaq+RHQEQFLTksp66e46OMN99WhJz3SbA@mail.gmail.com/
[7]: https://lore.kernel.org/linux-cifs/20261112111637.184045-2-koray.fra@gmail.com/
[8]: https://lore.kernel.org/linux-cifs/20261115155308.415734-1-koray.fra@gmail.com/


koraynilay (10):
  vfs: add provenance time (ptime)
  vfs: add fileattr_has_fsx_mask()
  ntfs3: make crtime user-settable using ptime
  exfat: make crtime user-settable using ptime
  btrfs: add provenance time (ptime)
  vfs: add __vfs_fileattr_set_locked() for inode_lock()'d callers
  nfsd: add provenance time (ptime) via FATTR4_TIME_CREATE
  nfs: add provenance time (ptime) via FATTR4_TIME_CREATE
  ksmbd: add provenance time (ptime) and map it to CreationTime
  cifs: add provenance time (ptime) and map it to SMB's CreationTime

 fs/btrfs/btrfs_inode.h          |   4 +
 fs/btrfs/delayed-inode.c        |   6 ++
 fs/btrfs/inode.c                |  29 +++++-
 fs/btrfs/ioctl.c                |  24 ++++-
 fs/btrfs/print-tree.c           |   1 +
 fs/btrfs/tree-log.c             |   3 +
 fs/exfat/exfat_fs.h             |   2 +
 fs/exfat/file.c                 |  42 ++++++++-
 fs/exfat/namei.c                |   1 +
 fs/file_attr.c                  | 156 ++++++++++++++++++++++++++------
 fs/nfs/inode.c                  |  27 +++++-
 fs/nfs/internal.h               |   2 +
 fs/nfs/nfs4proc.c               |  56 +++++++++++-
 fs/nfs/nfs4xdr.c                |  19 ++--
 fs/nfs/symlink.c                |   1 +
 fs/nfsd/nfs4proc.c              |   9 ++
 fs/nfsd/nfs4xdr.c               |  40 +++++---
 fs/nfsd/vfs.c                   |  17 ++++
 fs/nfsd/vfs.h                   |   4 +-
 fs/nfsd/xdr4.h                  |   3 +
 fs/ntfs3/file.c                 |  20 +++-
 fs/ntfs3/frecord.c              |   8 +-
 fs/smb/client/cifsfs.c          |   8 ++
 fs/smb/client/inode.c           |   7 +-
 fs/smb/client/ioctl.c           | 109 ++++++++++++++++------
 fs/smb/server/smb2pdu.c         |  37 +++++---
 fs/smb/server/vfs.c             |  43 ++++++++-
 fs/smb/server/vfs.h             |   1 +
 fs/stat.c                       |   2 +
 include/linux/fileattr.h        |  29 +++++-
 include/linux/nfs_xdr.h         |   3 +
 include/linux/stat.h            |   1 +
 include/uapi/linux/btrfs_tree.h |   3 +-
 include/uapi/linux/fs.h         |   9 +-
 include/uapi/linux/stat.h       |   7 +-
 35 files changed, 614 insertions(+), 119 deletions(-)


base-commit: 3bc1fb9c3b20cd478c83496ab16addecb401770d
prerequisite-patch-id: 049ae0eba275b5be35a238833107e0b251a55aa2
prerequisite-patch-id: 614f0bc9411391403d4e9702bafeb31b0ec04ec1
prerequisite-patch-id: ddf636b9d33d82ea206ce265d817371350bf8858
-- 
2.56.0

