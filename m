Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088415;
	b=BePJFftnGbfKF1fSMjgl58jen4tpaqJscxz3PNIK1GyyXEUXj+3ZBLEAjGqLLS7Hd4cH
	 UpY/UAvguvfbSxyv0YmBm/NkyDUrp6AAnpe4TGsm+Z1CCsSj0iJ945pmY4iciKR9Ub/b4
	 Ox/Z38J18NjzWQMf94rm3ksMx6i4BGapNZkIVlnI34niOwUR8FBbPS7XzJyco/fvmgflW
	 c98ORW3CMX52EYHUgvLrmOGcAE89t5hxmWF8hTkYzO0doCjzDaBYB5xIL7dhIavjQkcfJ
	 5XTUJEYV1okaa6oaUB14r6+P1yi8dN9QZoBW3CzvtmRbHv6EBz26yqJ7KCnseLMRgjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088415;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=tLeirfuubrcFgrIJlZqKJt3CMJCh/u/E9u/xwoGnin0=;
	b=HKHRLt5fyn/BtwDVsvJzsHmh3luwkIuBmYY/QjUAk8z0McrNvZroSs8ctLEC1jcWeuPV
	 49L2QCKyt2ejucX/Gyuvx/vVVJ3m4rtkqF0bikPoE0jvUr0yiMZhk/F7UGbDNWHmDzKSu
	 xeTc7scp2C6TnCqcRPs0uUpxBdYJw5XU5ZxsYzIRMT2cBNjjyzC0R63SWfGyFbIEmrDXj
	 txnBuU1imJT/giYBxnR5FhAE7awWqhKS07Ai5mYm5yjUsmJoILuJ8paGTR3flB+ABZpkU
	 cixBOOa4uUw8WjrZhzWtJ3l6sh8B8BBPlw7OAlON7nHDa6NAdYWl/9dwzYQmVUAmNhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=kuc8BDaM;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FFE606A31E
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 08:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3FFE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=kuc8BDaM
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 8F74C1D47B;
	Tue, 27 Oct 2026 08:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 8F74C1D47B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793088413; bh=L7iQcsvaZZpKfAtuHbpO6pu9WxMNP8mQu0cfXz2iIjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kuc8BDaMXbU2ZAj96Vxf74Phf4QieXV2M+AwH8oNjneAcu4cp0o9Qjr2fjkPC8+6n
	 J/jnezCE1y+Ue+saFKVbFQzFx5ZBWy4gaWZwkAHtgPzpScJjdfBoZs0HiX+dBua1+x
	 Rsdttfti2jsUgetYqi5dGMePS3Iv3QwcoZgGtdY8=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id LI3iAZZb4Gr2bwEA8KYfjw:T5
	(envelope-from <dxdt@dev.snart.me>); Tue, 27 Oct 2026 08:06:52 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>,
	"sofine . ljm" <sofine.ljm@gmail.com>,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 5/7] fsck: add test script for EIO handling
Date: Tue, 27 Oct 2026 08:06:22 +0000
Message-ID: <20261027080628.82069-5-dxdt@dev.snart.me>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To test the feature introduced in commit 949da8b46e3f ("libexfat, fsck:
exit() upon I/O error during fsck"), add a script to test if fsck.exfat
leaves the contents of the filesystem intact upon encountering EIO.

Prior to the patch, where EIO is not handled properly, fsck.exfat
modified the filesystem which resulted in the volume in a broken state
or, in some cases, data loss. The script tests fsck.exfat by setting
each sector of the test device bad.

The script is not integrated to the CI due to performance issues. On a
reasonably prices machine, the script finishes in 12 hours or even more.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 scripts/test-bads.sh | 161 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)
 create mode 100755 scripts/test-bads.sh

diff --git a/scripts/test-bads.sh b/scripts/test-bads.sh
new file mode 100755
index 0000000..978efb7
--- /dev/null
+++ b/scripts/test-bads.sh
@@ -0,0 +1,161 @@
+#!/bin/bash
+# Test EIO bail out behaviour of fsck.exfat: fsck.exfat mustn't modify the
+# volume with no issues just because the underlying hardware is faulty. The
+# script requires root privileges for dmsetup. Please run it on a VM.
+#
+#   1. Set up a loop device
+#   2. Format the loop device
+#   3. Mount the loop device
+#   4. Populate a deep directory structure on the device
+#   5. Unmount the device
+#   6. Control run: run fsck.exfat on the device(expect exit code 0)
+#   7. Hash the loop device (to ensure no modification of the filesystem upon EIO)
+#   8. Set up a dm-dust device
+#   9. For each logical sector of the device
+#      a. Set the sector "read" bad (write should succeed)
+#      b. Run fsck.exfat ...
+#      c. Hash the loop device and confirm no modification of the device contents
+#
+# This is brute force testing so the script is quite slow even on
+# enterprise-grade machines. To run the test in parallel, use the 1st and the
+# 2nd args, which are the badblock offset and the step, respectively. For
+# example, to run two instances in parallel,
+#
+#   ./test-bads.sh 0 2 &
+#   ./test-bads.sh 1 2 &
+#
+set -e
+declare -r PRINTABLES=( {a..z} {A..Z} {0..9} )
+declare -r PRINTABLES_CNT=${#PRINTABLES[@]}
+# parallel run params
+[ -z "$1" ] && declare -r RUN_OFS="0" || declare -r RUN_OFS="$1"
+[ -z "$2" ] && declare -r RUN_STEP="1" || declare -r RUN_STEP="$2"
+
+declare -r IMG_FILE="$(mktemp)"
+declare -r IMG_BACKUP="$(mktemp)"
+declare -r IMG_SIZE="67108864"
+declare -r IMG_SS=$((IMG_SIZE / 512))
+declare -r LOOP="/dev/disk/by-loop-inode/$(stat -c '%Hd:%Ld-%i' "$IMG_FILE")"
+[ -z "$MKFS_EXFAT" ] && MKFS_EXFAT="mkfs.exfat"
+[ -z "$FSCK_EXFAT" ] && FSCK_EXFAT="fsck.exfat"
+declare -r DUST_NAME="dustexfatbads$RUN_OFS"
+
+hash_img()
+{
+	# Use CRC32C for speed. Ignore LBA 0 which contains volume dirty flag
+	dd status=none if="$1" skip=1 | rhash --one-hash -C -
+}
+
+get_rand_name()
+{
+	local cnt="$1"
+	local ret=""
+
+	for (( i = 0; i < cnt; i++ ))
+	do
+		ret="$ret${PRINTABLES[RANDOM % PRINTABLES_CNT]}"
+	done
+
+	echo "$ret"
+}
+
+bomb_dir()
+{
+	local -r TLDS=(
+		"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
+		"天下皆知美之為美，斯惡已；皆知善之為善，斯不善已。故有無相生，難易相成，長短相形，高下相傾，音聲相和，前後相隨。"
+		"吾輩は猫である。名前はまだ無い。どこで生れたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。"
+		"모든인간은태어날때부터자유로우며그존엄과권리에있어동등하다.인간은천부적으로이성과양심을부여받았으며서로형제애의정신으로행동하여야한다."
+	)
+
+	for tld in "${TLDS[@]}"
+	do
+		mkdir -p "$tld"
+		pushd "$tld" > /dev/null
+
+		mkdir -p {a,b,c}/{1,2,3}/{X,Y,Z}
+		set -o pipefail
+		find -mindepth 1 -type d | while read dir
+		do
+			pushd "$dir" > /dev/null
+			for (( i = 0; i < 64; i++ ))
+			do
+				truncate -s $((i + 1)) "f-$(get_rand_name $i)"
+			done
+			popd > /dev/null
+		done
+		set +o pipefail
+
+		popd > /dev/null
+	done
+}
+
+cleanup()
+{
+	dmsetup remove "$DUST_NAME"
+	udisksctl loop-delete -b "$LOOP"
+	rm -f "$IMG_FILE" "$IMG_BACKUP"
+}
+
+dmsetup remove "$DUST_NAME" > /dev/null 2> /dev/null || true
+
+fallocate -l "$IMG_SIZE" "$IMG_FILE"
+"$MKFS_EXFAT" "$IMG_FILE"
+
+set +e
+udisksctl loop-setup --file "$IMG_FILE"
+ec=$?
+if [ "$ec" -ne 0 ]; then
+	exit "$ec"
+fi
+set -e
+
+udisksctl mount -b "$LOOP"
+declare -r MP="$(findmnt "$LOOP" -no TARGET)"
+
+pushd "$MP"
+bomb_dir
+popd
+
+udisksctl unmount -b "$LOOP"
+
+cat "$IMG_FILE" > "$IMG_BACKUP"
+declare -r HASH="$(hash_img "$LOOP")"
+echo "image: $IMG_FILE"
+echo "backup: $IMG_BACKUP"
+
+"$FSCK_EXFAT" -y "$IMG_FILE"
+
+if [ "$HASH" != "$(hash_img "$LOOP")" ]
+then
+	echo "FAIL: the filesystem implementation corrupted the filesystem or there's a problem in fsck.exfat" >&2
+	exit 1
+fi
+
+dmsetup create "$DUST_NAME" --table "0 $IMG_SS dust $LOOP 0 512"
+dmsetup message "$DUST_NAME" 0 enable
+
+set +e
+
+for (( i = RUN_OFS; i < IMG_SS; i += RUN_STEP ))
+do
+	dmsetup message "$DUST_NAME" 0 addbadblock "$i"
+	valgrind -q --error-exitcode=100 "$FSCK_EXFAT" -y "/dev/mapper/$DUST_NAME" > /dev/null
+	ec=$?
+	dmsetup message "$DUST_NAME" 0 removebadblock "$i" > /dev/null 2> /dev/null
+	sync "/dev/mapper/$DUST_NAME"
+
+	if [ "$HASH" != "$(hash_img "$LOOP")" ]
+	then
+		echo "FAIL: fsck.exfat modified the filesystem (badblock: $i)" >&2
+		exit 1
+	elif [ "$ec" -eq 100 ]
+	then
+		# Didn't modify the volume but there's a memory bug??
+		echo "FAIL: fsck.exfat experienced memory error (badblock: $i)" >&2
+		exit 1
+	fi
+done
+
+echo "OK: fsck.exfat does not modify the filesystem on EIO"
+cleanup
-- 
2.56.0

