Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293733;
	b=b8Ut8tgsiVYA4VfAFOgEY3twOGQKXGwc2tp0jotdDoh+Ef1IMuEHotP53mrdXuB5TOeZ
	 m3IHR/bMWp8QMAhkIcM6DoAZLGv3Z/9hrDbXi5P9nFhFVf1wycnCKWk1QiJKtLWte2/Mi
	 U4B9ULwcsu/sCTNGSHqhRy4xbHtYPnJyZEvQCr8cnDeN/8tb3MS/GcE34E8qJoE9EFMvm
	 XebaXqg21CRGf39Qj/tBM/xsAr86I+Rd6iEwJ9avndo5aOMHQFLEthx8ljY9suSZjsLIP
	 6vLfpSasV5wmeqcXpwVHNgquwlSnB5z265t2+gOryojYl8szt9ULSWVvxELZ+Rg/YTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293733;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RdyBE2mMk0arllGhLieN1jY9q4+PLLoSlkywKH8khdM=;
	b=xTIMFK5idatw9iyYO0wzw1kphKWEbMkv6enxR1ls1PgI/XyT1Gqbj447c7jEdIvdt7Mz
	 PNFTxEtDp0/rFP8DXEN+lgM9aZ+9L4wLRB7/zjcvkIEnfNSuC1T4KFmnM+X5YswCJ1YRC
	 Q2QHtpzdX/ECDJ4V9cBcbAnsYjnP/N6Z6+G7r9byUD8n1kwWDS/htK+z79gxGSSGug1/S
	 dsmva74vItCGhDlP3b+pEVjldory7UDvN9TAKS6k7U/4AhasoOznTiqAXAinwh8y+76Y1
	 icfg5t69vGsJ9u/4nXHTb9mUkhbcmVWkUd0opk2qGRiQExOBHZRVzoIzLr1z3jglymg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=ZYShY0Vh;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32FE606A31C
	for <exfat@lists.linux.dev>; Tue, 10 Nov 2026 06:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=ZYShY0Vh
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 1CE9E1D485;
	Tue, 10 Nov 2026 06:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 1CE9E1D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794293731; bh=aCO4xw6QYUe4rOMEmMr1aoXYmJWnLgx6ZXvYrBCTses=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZYShY0VhJl8sIhFvZD+8MV7zRBmvtJ4fZpDCl8wO3P7Vu45K6wGgP/whI0pesiBrL
	 XU8vgCHHeziOQ72y7ZTcHAaO069cMlAnVUY7cUDZhBgLvS5vMgi3nJLOKQ9lRWDJoV
	 VJ0z6CR0XpUd4V0IN0nbBLHC0hmkoOUsNnOu0pek=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id /GyMLta/8mq/UAEA8KYfjw:T7
	(envelope-from <dxdt@dev.snart.me>); Tue, 10 Nov 2026 06:55:29 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 6/7] CI: generate images in deterministic manner to reduce runtime
Date: Tue, 10 Nov 2026 06:54:40 +0000
Message-ID: <20261110065441.63590-7-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110065441.63590-1-dxdt@dev.snart.me>
References: <20261110065441.63590-1-dxdt@dev.snart.me>
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

Currently, multiple instances of Windows runners are run for various
target platforms to ensure no endianness or bit width confusion is
introduced. However, this method has proved to be rather wasteful.

To reduce CI pipeline runtime, remove randomness in generated exfat
volume images so that only a couple of Windows runners can be run to
check the images. The randomness includes the volume serials, the test
file placed in the volume and random data at the start of the image.

Add a python script for comparing sparse exfat volume images for use in
CI.

Cache the last known good images to run the Windows runners only when a
change is detected in the generated images.

To further reduce runtime and occasional failures due to a suspected
race condition in Windows kernel, skip the drive letter assignment
process and invoke CHKDSK through Repair-Volume powershell command.

Closes: https://github.com/exfatprogs/exfatprogs/issues/392
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 .github/workflows/c-cpp.yml | 197 +++++++++++++++++++++++++++++-------
 scripts/diff-images.py      | 134 ++++++++++++++++++++++++
 2 files changed, 292 insertions(+), 39 deletions(-)
 create mode 100755 scripts/diff-images.py

diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-cpp.yml
index 1be7e15..106540f 100644
--- a/.github/workflows/c-cpp.yml
+++ b/.github/workflows/c-cpp.yml
@@ -31,7 +31,6 @@ env:
     7M 128M 256M 512M
     2G 3G 4G 5G 7G 32G 64G 128G 256G 512G
     1T 2T 3T 4T 6T 8T 16T 32T 44T 64T
-  TEST_MAGIC: dd01aeee-bab0-babe-babe-deadcafebeef
 
   UTIL_LINUX_TARBALL: util-linux-2.42.tar.xz
   UTIL_LINUX_SRC: https://www.kernel.org/pub/linux/utils/util-linux/v2.42/util-linux-2.42.tar.xz
@@ -49,6 +48,9 @@ env:
       "parted img mkt msdos"
       "parted img mkt gpt"
     )
+  MKFS_INVAR_SERIAL: '0xdeadbeef'
+  MKFS_INVAR_PART_GUID: b1083784-c8ff-4ac1-a298-8328a05cc10b
+  MKFS_INVAR_DISK_GUID: 1c75d565-b6b8-4d30-aea4-401d588e85e1
 
 jobs:
   memcheck:
@@ -185,7 +187,7 @@ jobs:
              linux-headers-$(uname -r) xz-utils curl \
              cryptsetup parted dosfstools e2fsprogs btrfs-progs f2fs-tools ntfs-3g xfsprogs \
              ${{ matrix.gcc }} ${{ matrix.qemu }} \
-             qemu-user qemu-utils
+             qemu-user
         export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
         export PATH=/usr/local/lib:$PATH
 
@@ -403,16 +405,11 @@ jobs:
 
             for vs in $TEST_VOLUMESIZES
             do
-              img_a="exfat-$vs.img"
-              img_b="exfat-$vs.vhdx"
-
-              # fill the first 2MB with random data to see if mkfs.exfat leaves
-              # any garbage that confuses EXFAT.sys driver
-              dd iflag=fullblock if=/dev/urandom bs=2M count=1 of="$img_a" conv=notrunc status=none
+              img_raw="exfat-$vs.img"
 
               # truncate up to the volume size
-              truncate -s "$vs" "$img_a"
-              img_size="$(stat -c '%s' "$img_a")"
+              truncate -s "$vs" "$img_raw"
+              img_size="$(stat -c '%s' "$img_raw")"
               if [ "$pt" == "mbr" ] && [ "$img_size" -ge 2199023255552 ]
               then
                 expected=false
@@ -421,9 +418,14 @@ jobs:
               fi
               echo "========== $pt $img_size expected to succeed: $expected =========="
 
-              sudo losetup -Pb "$bs" /dev/loop22 "$img_a"
+              sudo losetup -Pb "$bs" /dev/loop22 "$img_raw"
               sudo blockdev --report /dev/loop22
-              if sudo ${{ matrix.run }} "$EXFAT_MKFS" -vP$pt /dev/loop22
+              if sudo ${{ matrix.run }} "$EXFAT_MKFS" -v \
+                -P$pt \
+                -i "$MKFS_INVAR_SERIAL" \
+                --part-guid="$MKFS_INVAR_PART_GUID" \
+                --disk-guid="$MKFS_INVAR_DISK_GUID" \
+                  /dev/loop22
               then
                 if ! "$expected"
                 then
@@ -434,28 +436,16 @@ jobs:
               elif ! "$expected"
               then
                 sudo losetup -d /dev/loop22
-                rm -f "$img_a"
+                rm -f "$img_raw"
                 continue
               else
                 exit 1
               fi
 
-              sudo ${{ matrix.run }} "$EXFAT_MKFS" -CP$pt /dev/loop22
               sudo blockdev --report /dev/loop22*
-
-              sudo ${{ matrix.run }} "$EXFAT_FSCK" /dev/loop22p1
-
-              sudo mount -t exfat /dev/loop22p1 /mnt/test/
-              sudo mkdir /mnt/test/a
-              echo "$TEST_MAGIC" | sudo tee /mnt/test/a/b > /dev/null
-              sudo umount /mnt/test/
-
               sudo ${{ matrix.run }} "$EXFAT_FSCK" /dev/loop22p1
               sudo ${{ matrix.run }} "$EXFAT_DUMP" /dev/loop22p1 | grep -iE 'Bytes per Sector:(\s+)?'"$bs" > /dev/null
               sudo losetup -d /dev/loop22
-
-              qemu-img convert -f raw -O vhdx "$img_a" "$img_b"
-              rm -f "$img_a"
             done
             popd
           done
@@ -463,7 +453,8 @@ jobs:
         done
         popd
 
-        tar -cf "images-${{ matrix.name }}.tar" "images-${{ matrix.name }}"
+        du -hs "images-${{ matrix.name }}"
+        tar -Scf "images-${{ matrix.name }}.tar" "images-${{ matrix.name }}"
         TAR_FILE="$(realpath "images-${{ matrix.name }}.tar")"
         popd
 
@@ -474,40 +465,168 @@ jobs:
         name: images-${{ matrix.name }}.tar
         path: images-${{ matrix.name }}.tar
 
-  test-windows-interop:
-    name: test generated large sparse images on Windows runners
+# Images generated by different targets should be exactly the same, given that
+# the same volume serial and the GUIDs are used. If not, it's indicative of
+# endianness or integer width confusion.
+#
+# After confirming that the contents of the images are same, compare them
+# against the cached images if exists. Fire up the Windows runners only when the
+# generated images are different.
+  check-images:
+    name: Compare and consolidate generated images
     needs: tests
+    runs-on: "ubuntu-26.04"
+    env:
+      TARGETS: sparc i686 x86_64
+    outputs:
+      mkfs_differ: ${{ steps.diff.outputs.result }}
+    steps:
+    - name: Install packages
+      run: sudo apt-get --update --quiet --yes install qemu-utils
+    - uses: actions/checkout@v6
+    - uses: actions/download-artifact@v8
+      with:
+        pattern: images-*.tar
+        merge-multiple: true
+    - name: Retrieve cached images from cache
+      uses: actions/cache/restore@v6
+      id: restore-images
+      with:
+        path: images-raw.cached.tar
+        # This is only a placeholder. No cache with this key will be actually created
+        key: images-raw.cached.tar-
+        restore-keys: images-raw.cached.tar-
+    - name: diff images and re-tar
+      id: diff
+      run: |
+        set -e
+        DL_DIR="$(realpath .)"
+        FIRST_TARGET=""
+        DIFF_SCRIPT="$(realpath ./scripts/diff-images.py)"
+        if [ -f "images-raw.cached.tar" ]
+        then
+          CACHED_IMG="$(realpath images-raw.cached.tar)"
+        else
+          CACHED_IMG=""
+        fi
+        RESULT=true
+
+        # cd to tmp dir as the rootfs the runner is running in might not support LFS
+        pushd "$(mktemp -d -p /dev/shm)"
+
+          # diff images from target platforms
+
+          for t in $TARGETS
+          do
+            tar -Sxf "$DL_DIR"/images-"$t".tar
+            if [ -z "$FIRST_TARGET" ]
+            then
+              FIRST_TARGET="$t"
+            fi
+          done
+
+          for t in $TARGETS
+          do
+            if [ "$FIRST_TARGET" = "$t" ]
+            then
+              continue
+            fi
+
+            "$DIFF_SCRIPT" "images-$FIRST_TARGET" "images-$t"
+          done
+
+          # re-tar the consolidated raw images
+
+          mv "images-$FIRST_TARGET" "images-raw"
+          tar -Scf images-raw.tar images-raw
+          IMG_TAR="$(realpath images-raw.tar)"
+
+          # diff against the cached last known good images (if exists)
+          if [ ! -z "$CACHED_IMG" ]
+          then
+            mkdir -p cached
+            pushd cached
+              tar -Sxf "$CACHED_IMG"
+            popd
+            if "$DIFF_SCRIPT" images-raw cached/images-raw
+            then
+              RESULT=false
+            fi
+          fi
+
+          # make VHDX images for Windows runners
+
+          mv images-raw images-vhdx
+          find images-vhdx -type f -iname '*.img' | while read img
+          do
+            vhdx_img="${img::-4}.vhdx"
+            qemu-img convert -f raw -O vhdx "$img" "$vhdx_img"
+            rm -f "$img"
+          done
+          tar -cf images-vhdx.tar images-vhdx
+          VHDX_TAR="$(realpath images-vhdx.tar)"
+        popd
+
+        mv "$IMG_TAR" .
+        mv "$VHDX_TAR" .
+        echo "result=$RESULT" >> "$GITHUB_OUTPUT"
+
+    # Always upload these for diagnosis.
+    - name: Upload consolidated raw images
+      uses: actions/upload-artifact@v7
+      with:
+        name: images-raw.tar
+        path: images-raw.tar
+    - name: Upload VHDX images
+      uses: actions/upload-artifact@v7
+      with:
+        name: images-vhdx.tar
+        path: images-vhdx.tar
+
+  test-windows-interop:
+    name: Test generated large sparse images on Windows runners
+    needs: check-images
+    if: needs.check-images.outputs.mkfs_differ == 'true'
     strategy:
       fail-fast: false
       matrix:
         os: [windows-2022, windows-latest]
-        name: [sparc, i686, x86_64]
     runs-on: ${{ matrix.os }}
     steps:
     - uses: actions/download-artifact@v8
       with:
-        name: images-${{ matrix.name }}.tar
+        name: images-vhdx.tar
     - shell: bash
       run: |
         set -e
 
-        tar -C /c -xf images-${{ matrix.name }}.tar
+        tar -C /c -xf images-vhdx.tar
 
-        for img in "/c/images-${{ matrix.name }}"/*/*/*.vhdx
+        for img in "/c/images-vhdx"/*/*/*.vhdx
         do
           img="$(echo "$img" | tr '/' '\\')"
           img="C:\\${img:3}"
 
           # mount the image and get the disk number assigned by the kernel
           disknum=$(powershell "Mount-DiskImage \"$img\" | Select-Object -ExpandProperty Number")
-          # assign it drive letter X
-          powershell "Get-Partition -DiskNumber $disknum -PartitionNumber 1 | Set-Partition -NewDriveLetter X"
+          # run chkdsk /f ...
+          powershell "Get-Partition -DiskNumber $disknum -PartitionNumber 1 | Repair-Volume -OfflineScanAndFix"
+          # dump some info
           powershell "Get-DiskImage \"$img\""
-
-          # simple sanity check
-          powershell 'chkdsk X: /f'
-          grep "$TEST_MAGIC" /x/a/b > /dev/null
-
           # unmount the image
           powershell "Dismount-DiskImage \"$img\"" > /dev/null
         done
+
+  cache-good-images:
+    name: Cache last known good images
+    needs: test-windows-interop
+    runs-on: ubuntu-26.04
+    steps:
+    - uses: actions/download-artifact@v8
+      with:
+        name: images-raw.tar
+    - run: mv images-raw.tar images-raw.cached.tar
+    - uses: actions/cache/save@v6
+      with:
+        path: images-raw.cached.tar
+        key: images-raw.cached.tar-${{ github.run_id }}
diff --git a/scripts/diff-images.py b/scripts/diff-images.py
new file mode 100755
index 0000000..da83ec9
--- /dev/null
+++ b/scripts/diff-images.py
@@ -0,0 +1,134 @@
+#!/usr/bin/env python3
+'''
+Usage: ./diff-images <DIR_A> <DIR_B>
+
+Compare all contents of files in two directories. This script works much like
+`diff -r`, except that it's more or less sparse-aware. It skips holes in files
+to compare blocks containing actual data in them. This is to avoid meaningless
+comparison of holes of the large sparse exfat volume images in the CI pipelines.
+'''
+from pathlib import Path
+import sys
+import os
+import errno
+import hashlib
+import typing
+
+DEBUG = os.environ.get('DEBUG')
+try: DEBUG = int(DEBUG)
+except: DEBUG = 0
+
+class FilesDifferException(Exception): ...
+
+def debugp(level: int, l: typing.Iterable):
+	if DEBUG < level:
+		return
+	conv = [ str(s) for s in l ]
+	conv.append('\n')
+	sys.stderr.write(''.join(conv))
+
+def die(ec: int, msg: str):
+	sys.stderr.write(msg + '\n')
+	sys.exit(ec)
+
+def list_files(path: Path, cnt: int = 1000) -> list[str]:
+	if not path.is_dir():
+		raise NotADirectoryError(path)
+
+	ret = list[Path]()
+	for p in path.rglob('*'):
+		if not p.is_file(): continue
+		if len(ret) > cnt: raise RecursionError()
+		ret.append(p.relative_to(path).as_posix())
+
+	return ret
+
+def get_filesize(fd: int) -> int:
+	return os.lseek(fd, 0, os.SEEK_END)
+
+def scan_data_ranges(fd: int) -> list[tuple[int, int]]:
+	ret = list[tuple[int, int]]()
+	end = 0
+	try:
+		while True:
+			start = os.lseek(fd, end, os.SEEK_DATA)
+			end = os.lseek(fd, start, os.SEEK_HOLE)
+			ret.append((start, end,))
+			debugp(2, [ 'data range [', start, ', ', end, ')' ])
+	except OSError as e:
+		if e.errno != errno.ENXIO:
+			raise e
+	return ret
+
+def comp_files_range(a: typing.BinaryIO, b: typing.BinaryIO, rl: list[tuple[int, int]]) -> list[tuple[int, int]]:
+	ret = list[tuple[int, int]]()
+
+	for r in rl:
+		a.seek(r[0])
+		b.seek(r[0])
+		l = r[1] - r[0]
+		assert l > 0
+
+		while l > 0:
+			to_read = min(l, 65536)
+			buf_a = a.read(to_read)
+			buf_b = b.read(to_read)
+
+			if buf_a != buf_b:
+				ret.append(r)
+			l -= to_read
+
+	return ret
+
+la = list_files(Path(sys.argv[1]))
+la.sort()
+lb = list_files(Path(sys.argv[2]))
+lb.sort()
+diff_cnt = 0
+ok_cnt = 0
+
+if len(la) != len(lb):
+	die(1, '''Directory structures differ''')
+
+for i in range(len(la)):
+	path_a = sys.argv[1] + os.path.sep + la[i]
+	path_b = sys.argv[2] + os.path.sep + lb[i]
+
+	if la[i] != lb[i]:
+		print('''Directory structures differ:\n%s\n%s''' % (path_a, path_b,))
+		diff_cnt += 1
+		break
+
+	with (open(path_a, 'rb') as fa, open(path_b, 'rb') as fb):
+		drange = None
+		sa = get_filesize(fa.fileno())
+		sb = get_filesize(fb.fileno())
+		range_a = scan_data_ranges(fa.fileno())
+		range_b = scan_data_ranges(fb.fileno())
+
+		debugp(1, [ path_a, ': ', sa ])
+		debugp(1, [ path_b, ': ', sb ])
+
+		try:
+			if sa != sb or set(range_a) != set(range_b):
+				raise FilesDifferException()
+			drange = comp_files_range(fa, fb, range_a)
+			if drange:
+				raise FilesDifferException()
+
+			ok_cnt += 1
+		except FilesDifferException:
+			diff_cnt += 1
+			print('''Files differ:\n%s\n%s''' % (path_a, path_b,))
+			if drange is not None:
+				for r in drange:
+					print('''at [%d, %d)''' % (r[0], r[1],))
+
+ec = 0
+if diff_cnt:
+	if ok_cnt:
+		ec = 3
+	else:
+		ec = 1
+
+sys.exit(ec)
-- 
2.56.0

