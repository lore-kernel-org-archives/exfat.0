Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189386;
	b=fnLWfS242nzD5eyEbJtkQYtohDttRs6cvk/QAPslfUAL1jjnDxust1RPnmYn78GvTUUP
	 oz+hP6FjE/zA/1c4mS2DuMYq/q277qyiwzUsR5sPbhhj86doXp5LRkuNu2bd138f134Q6
	 f/i/+Evq+fqkfEkO4CupsPMoBWmuNIlM0PjL3Daltl+LYyvZjqmFN+9bLxGSmLRBazAV1
	 phF7tA60XnlHvpsbBx1fm4D4FTFVC56Qe8Yg+zeJgVusjGn2+U3bQMo3Aian/jL6R3CHd
	 i8Gzy3F7SPzDsg3gzwI46bzoMJbHsg2wHKSl15kQOtUDHZQWcYichjuCkHn6pjlF2Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189386;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FI9m/appk6qQgGlHs3P+38HJVc770BqY9QDj6fscg2w=;
	b=A4Xt/GqKZCKQIjCYJ/nWlszpKHUsAb00aKNDgAQFYbCnSE8cYq0FEikGbF6+6SUzOkPH
	 Ij7ytmPFuux2HPPHtcWESS3qb9E5NZeysFyUfN5amT9NTYyLLa6JvtouRUg4WOHt/S7mq
	 ByHbIxMbDwZtETcKLarXqTG76DDERMir9kJ2HSfJehhUTH2d/Et7JSdNnMfzQk0FBcSPb
	 bU1YN7THUW/BU6iu+GCvUZ1gyfgYrxYF6r154EWeG5yuwx+gCWXPvbKjs24wbPeD7JJ0R
	 0CB59O75O8kxefPHwMYkcq4oGwcdYkFgJgiaSDo+4shfQykiSf75bkLBbKBR96+v8OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=Cn25ITLY;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8006606A31D
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 12:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8006606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=Cn25ITLY
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 69A5E1D47B;
	Wed, 28 Oct 2026 12:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 69A5E1D47B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793189384; bh=N3JtQGkFPnk244DO5Y+zOZTGI/tkIfqOUfwIyVEtHrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cn25ITLYPQal89IZVEQnn5MclhAnYBx3m5eB9CoEt3+5TwHCZYNLElTqXKZsCYQt+
	 n26HlItx1xNqGzKVxUAsCXKUV8Q/naeGNRjRwpzeEkjARlbw40k4iwJskVkTcLMqBy
	 /Eb6UQ5AipBQDTq8S6Ue9QbEfa8+7qEag2NQWF9Y=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id COfFFwXm4WpK2AEA8KYfjw:T2
	(envelope-from <dxdt@dev.snart.me>); Wed, 28 Oct 2026 12:09:43 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v1 1/1] Github Actions: bump to Ubuntu 26.04 runner
Date: Wed, 28 Oct 2026 12:09:20 +0000
Message-ID: <20261028120920.183005-2-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028120920.183005-1-dxdt@dev.snart.me>
References: <20261028120920.183005-1-dxdt@dev.snart.me>
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

The gradual roll out of Ubuntu 26.04 runner means that some CI runs will
still be run by the old 24.04 runner, causing breakage. To workaround
this, pin the runner to "ubuntu-26.04".

Replace MIPS emulation with SPARC64 for big-endian tests. Avoid using
the -E option of sudo that's been removed in Ubuntu 26.04. Do not
install other packages that have been removed.

Link: https://github.blog/changelog/2026-09-17-ubuntu-26-generally-available-and-latest-migration/
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 .github/workflows/c-cpp.yml | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-cpp.yml
index d2f0a5a..4e5eaf1 100644
--- a/.github/workflows/c-cpp.yml
+++ b/.github/workflows/c-cpp.yml
@@ -52,7 +52,7 @@ env:
 
 jobs:
   memcheck:
-    runs-on: ubuntu-latest
+    runs-on: ubuntu-26.04
     strategy:
       fail-fast: false
       matrix:
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
@@ -158,16 +158,16 @@ jobs:
         popd
         rm -rf "$TMP_DIR"
   tests:
-    runs-on: ubuntu-latest
+    runs-on: ubuntu-26.04
     strategy:
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

