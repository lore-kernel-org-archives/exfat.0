Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F308C310779;
	Mon, 31 Aug 2026 10:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173623; cv=none; b=CCcPfTB908rohtS6jT/2PeBGPdyWRmjaISQfToIrs0LDDKYsSqxEO+UHSwqc7jtenqkOTF44jhA0pJkWu4Q/O3Uq9HuvuOBMB3cdFnk+9q67KQH54haJWG8+fnP+UkztVz1Yrulvhe5L5eXzwEjRrCE4AAxVYyEDAXRhnbAtkrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173623; c=relaxed/simple;
	bh=zQtdAjOc0xZG78n9bTgyF7fJtpb9ymJ/Xz3N0g8ohc0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nf5B4qHT0f0xfubem8SFenmxk1W4XPu+tFW8IVpflfRg+hJUw2vFg3gYPy0QwSewW+rqanadPoPM9Ou3TA/aKkWCeUZ13v7oo3mDeMQh43jC4Pgyi1cdYXGq3QYhY2S2EbfPA71+1AaysUPQmqbID4+ILHzvXIlmQXIQdlA0Yss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIW0O3Zn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIW0O3Zn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5466D1F000E9;
	Mon, 31 Aug 2026 10:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788173621;
	bh=0TMUVUbDKhxygUyvxGHjekLLbSUdJfWiPqMGV9ltxqo=;
	h=From:To:Cc:Subject:Date;
	b=IIW0O3Zn/Nyrr1+WMyuZMwZ5nGDJoLFceTDXbEuJ5nmuClTmuswhYVqplpEm/Izza
	 wf5QKAlld8TJohsdnHdZuHzx1qABpF7s3s74UrN4QVTszyvwSTImD2YqkeQq1F+h7a
	 +2G+TnzmhWk7vi7zJRvt4amepcbI5bEMTctVXiP/oDJCWETiuDpXcnkBRYLp1uSU+f
	 ShAQ79XSAcgoj3c9+aHDNV+Fh4vWq+nz5ReVi/I4EVkg+X7iLzQV0XXj7etNvM5BDC
	 DoMjAmFtI3/v9EAY523n6Gjt5Rl0MDMfP9YCrjAVxd7kQDv0mrh8WXKGgeGKb9WQhD
	 aO5PoU2DtHrgw==
From: Namjae Jeon <linkinjeon@kernel.org>
To: sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Cc: exfat@lists.linux.dev,
	anmuxixixi@gmail.com,
	dxdt@dev.snart.me,
	chizhiling@kylinos.cn,
	linux-kernel@vger.kernel.org,
	Namjae Jeon <linkinjeon@kernel.org>
Subject: [PATCH] exfat: doc: add documentation
Date: Mon, 31 Aug 2026 19:53:30 +0900
Message-Id: <20260831105330.10449-1-linkinjeon@kernel.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the Linux exFAT filesystem driver, including
supported mount options and exfatprogs.

Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
---
 Documentation/filesystems/exfat.rst | 117 ++++++++++++++++++++++++++++
 Documentation/filesystems/index.rst |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/filesystems/exfat.rst

diff --git a/Documentation/filesystems/exfat.rst b/Documentation/filesystems/exfat.rst
new file mode 100644
index 000000000000..ce5c9344a7b2
--- /dev/null
+++ b/Documentation/filesystems/exfat.rst
@@ -0,0 +1,117 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================================
+The Linux exFAT filesystem driver
+==================================
+
+
+.. Table of contents
+
+   - Overview
+   - Utilities support
+   - Supported mount options
+
+
+Overview
+========
+
+exFAT is a filesystem designed for removable storage and other devices that
+need to store large files.  The Linux exFAT filesystem driver provides read
+and write support for exFAT volumes.
+
+To mount an exFAT volume, use the ``exfat`` filesystem type::
+
+  mount -t exfat /dev/sdX1 /mnt
+
+
+Utilities support
+=================
+
+The exfatprogs project provides userspace utilities for creating, checking,
+repairing, inspecting, and tuning exFAT filesystems.  Use exfatprogs when
+creating or checking an exFAT filesystem.  For example, use ``mkfs.exfat``
+to create a filesystem and ``fsck.exfat`` to check or repair one.
+
+The project is available at:
+
+  https://github.com/exfatprogs/exfatprogs
+
+
+Supported mount options
+=======================
+
+The exFAT driver supports the following mount options:
+
+======================= ====================================================
+uid=
+gid=                    Set the owner and group of all files and
+                        directories.  The default is the uid and gid of
+                        the process mounting the filesystem.
+
+umask=                  Set the permission mask for files and directories.
+                        The default is the umask of the process mounting
+                        the filesystem.
+
+dmask=                  Set the permission mask for directories.
+
+fmask=                  Set the permission mask for files.
+
+allow_utime=            Control the permission check for changing file
+                        timestamps.  Only permission bits 0022 are used.
+                        Permission bit 0020 allows members of the file's
+                        group to change timestamps, and permission bit 0002
+                        allows other users to change timestamps.  The
+                        default is derived from dmask (``~dmask & 0022``).
+
+iocharset=name          Character set used to convert between user-visible
+                        filenames and the UTF-16 character encoding used by
+                        exFAT.  The default is
+                        CONFIG_EXFAT_DEFAULT_IOCHARSET, which is ``utf8``
+                        unless changed at kernel configuration time.  Use
+                        ``iocharset=utf8`` for UTF-8 filename handling.
+
+errors=                 Specify exFAT behavior on filesystem errors.  The
+                        value must be ``panic``, ``continue``, or
+                        ``remount-ro``.  These respectively panic, continue
+                        without changing the filesystem, or remount the
+                        filesystem read-only.  The default is
+                        ``remount-ro``.
+
+discard                 Issue discard/TRIM requests to the block device
+                        when clusters are freed.  This is disabled by
+                        default.  ``nodiscard`` disables it explicitly.
+
+keep_last_dots          Keep trailing periods in path components during
+                        lookup.  Without this option, trailing periods are
+                        stripped.  Existing entries with trailing periods
+                        can be accessed when this option is enabled, but
+                        creating new entries with trailing periods is
+                        rejected.
+
+sys_tz                  Use the system timezone as the UTC offset when an
+                        exFAT timestamp does not contain a valid timezone
+                        offset.  This takes precedence over time_offset.
+
+time_offset=minutes     Set the UTC offset, in minutes, used when an exFAT
+                        timestamp does not contain a valid timezone offset.
+                        Values from -1440 to 1440 are accepted.  The default
+                        is 0.  This option is ignored when sys_tz is set.
+
+zero_size_dir           Create directories with zero size and without
+                        allocating a cluster.  This is disabled by default;
+                        the default behavior allocates a cluster for a new
+                        directory.  ``nozero_size_dir`` disables it
+                        explicitly.
+======================= ====================================================
+
+
+Deprecated mount options
+------------------------
+
+The following options are accepted for compatibility but should not be used:
+
+``utf8``
+  Deprecated.  Use ``iocharset=utf8`` instead.
+
+``debug``, ``namecase=``, ``codepage=``
+  Deprecated and ignored by the exFAT driver.
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index 734a45e51667..fbd55915a318 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -87,6 +87,7 @@ Documentation for filesystem implementations.
    ecryptfs
    efivarfs
    erofs
+   exfat
    ext2
    ext3
    ext4/index
-- 
2.25.1

