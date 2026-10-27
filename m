Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088418;
	b=SNTJXTZlJy4zIUO9bR3NURN3ULeRcT8tzHXq/ml6QkKA3HraEvp/zjqqUlu/Mk57lRNs
	 YW3GMqQvpyzF8VxK0CUpdC9ijnFhdff0ovq4jHWKrZhc8JO/Wx9VhSezCK+4ZpET2i9Nr
	 hK4KOF4RiT5QIofd54ntiPAzYWaFHmC8jLUojziSxu2Mnm++pqhogxL0QFj8Y8TBjblt2
	 h/j8SlpGuDNgCH7xtCMf6J9A0Dt47ndbtnkejOrdrk8kPtowxZhvULUMPpcUZqqXiz7rg
	 SGh31oDGWACqdUKCSx0uRUZJmCVmMu16RkvSKCcXBHdI957TenOKenM5Cm5a2+gcZ7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088418;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VQqi7BDCI7CEW4+DA/qLdqtA4L8JZnxHXtDPC1Mvask=;
	b=cQ3bJs0vBTglcm4OdHzIiQKjDOGoYu7I/mtuPVBbp9KleIdbSVq7fRaOaybZxBAnMs5H
	 YSof2QcvRJ7gggIVbnrx5SYWRk6hpsi+wjqP30e9RvikPo7y3S6Sl4hk367lvjM1/9s3K
	 ACqo6NAZQVzS1CK3oKmPUHldq7gNE9uIPvLFKCwzz41SCHcViG3r4K3Mtkobns9XKeBWh
	 zTFVxxdoWZp67NR8VZThIqTFENgtDij3YS0NwghBx4ev4XTCbS57V71kwdQPc27/pmCVE
	 PEfakEIWqZqdcBP2VpUoG5a7zF6SdOUuLqBGhPSt18swISK+ln0ox0D95O+T7ww5T/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=C6281RC1;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A32606A31B
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 08:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A32606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=C6281RC1
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id A8B901D485;
	Tue, 27 Oct 2026 08:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me A8B901D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793088416; bh=Z4K4+OVWYBIxhyEDptnyCowbYzt0GRcaV4OO9W3j9AM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C6281RC1TKWhTJkavmFi5rUbPfxbNIei7LmRedF67ZOs3LdlGa/fmuA5NEgjV98nI
	 Nz/c1OdFdzcmyiDg+lJTlbpv9/Cc4Z8INyya3G5ISPLsXPxZa0KP4ROGtdQ2vSIKlK
	 knByyykoNJrB9thMviU2pQbBKOMatiipvaVnoFHo=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id LI3iAZZb4Gr2bwEA8KYfjw:T7
	(envelope-from <dxdt@dev.snart.me>); Tue, 27 Oct 2026 08:06:55 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>,
	"sofine . ljm" <sofine.ljm@gmail.com>,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 7/7] Github Actions: bump to Ubuntu 26.04 runner
Date: Tue, 27 Oct 2026 08:06:24 +0000
Message-ID: <20261027080628.82069-7-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027080628.82069-1-dxdt@dev.snart.me>
References: <20261027080628.82069-1-dxdt@dev.snart.me>
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

Github rolled out 26.04 for the "ubuntu-latest" runner, breaking the CI
pipeline due to deprecated and missing packages used, one of which being
MIPS.

Replace MIPS emulation with SPARC64 for big-endian tests. Avoid using
the -E option of sudo that's been removed in Ubuntu 26.04. Do not
install other packages that have been removed.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 .github/workflows/c-cpp.yml | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-cpp.yml
index d2f0a5a..3cf5d63 100644
--- a/.github/workflows/c-cpp.yml
+++ b/.github/workflows/c-cpp.yml
@@ -64,7 +64,6 @@ jobs:
         sudo apt-get --update --quiet --yes install \
              linux-headers-$(uname -r) xz-utils \
              valgrind libblkid-dev ${{ matrix.cc }}
-        sudo apt-get install -y linux-modules-extra-$(uname -r)
     - name: Build
       run: |
         export "CC=${{ matrix.cc }}"
@@ -80,9 +79,10 @@ jobs:
     - name: Run fsck with Valgrind
       run: |
         pushd tests
-        export FSCK1="valgrind --error-exitcode=1 ../fsck/fsck.exfat"
-        export FSCK2="valgrind --error-exitcode=1 ../fsck/fsck.exfat"
-        sudo -E ./test_fsck.sh
+        sudo \
+          FSCK1="valgrind --error-exitcode=1 ../fsck/fsck.exfat" \
+          FSCK2="valgrind --error-exitcode=1 ../fsck/fsck.exfat" \
+            ./test_fsck.sh
         popd
     - name: Run the rest with Valgrind
       shell: bash
@@ -163,11 +163,11 @@ jobs:
       fail-fast: false
       matrix:
         include:
-          - host: mips-linux-gnu
-            qemu: qemu-system-mips
-            gcc:  gcc-mips-linux-gnu
-            run:  qemu-mips
-            name: mips
+          - host: sparc64-linux-gnu
+            qemu: qemu-system-sparc
+            gcc:  gcc-sparc64-linux-gnu
+            run:  qemu-sparc64
+            name: sparc
           - host: x86_64-linux-gnu
             qemu: qemu-system-x86
             gcc:  gcc-x86-64-linux-gnu
@@ -186,7 +186,6 @@ jobs:
              cryptsetup parted dosfstools e2fsprogs btrfs-progs f2fs-tools ntfs-3g xfsprogs \
              ${{ matrix.gcc }} ${{ matrix.qemu }} \
              qemu-user qemu-utils
-        sudo apt-get install -y linux-modules-extra-$(uname -r)
         export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
         export PATH=/usr/local/lib:$PATH
 
@@ -288,12 +287,8 @@ jobs:
     - name: run fsck repair testcases
       run: |
         pushd tests
-        export FSCK1="${{ matrix.run }} ../fsck/fsck.exfat"
-        export FSCK2="fsck.exfat"
-        sudo -E ./test_fsck.sh
-        export FSCK1="fsck.exfat"
-        export FSCK2="${{ matrix.run }} ../fsck/fsck.exfat"
-        sudo -E ./test_fsck.sh
+        sudo FSCK1="${{ matrix.run }} ../fsck/fsck.exfat" FSCK2="fsck.exfat" ./test_fsck.sh
+        sudo FSCK1="fsck.exfat" FSCK2="${{ matrix.run }} ../fsck/fsck.exfat" ./test_fsck.sh
         popd
     - name: dentry creation/deletion stress test
       shell: bash
@@ -450,7 +445,7 @@ jobs:
       fail-fast: false
       matrix:
         os: [windows-2022, windows-latest]
-        name: [mips, i686, x86_64]
+        name: [sparc, i686, x86_64]
     runs-on: ${{ matrix.os }}
     steps:
     - uses: actions/download-artifact@v8
-- 
2.56.0

