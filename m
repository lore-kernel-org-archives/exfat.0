Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293734;
	b=Ms8H/2MrMOhyA5De4Dqs+NYMXWs38bAfPhWTpt1mzXKa2XIZ7RYf/YoxnOxOSZ9WDRp/
	 +qrsydLgAhVSlBYkELt8KeRVFC9lSisX18J9G6CdMh24kvFvfMnMo2RIGKaGcOizgJs/e
	 +fwJgo+KUpiOqaZyxJTVAgFeXChJLcZjWHHUat/BXp9NK60FMWHm+F2nAqeVUC7KQu3Gi
	 GHVTrlv1T+TNrH1TseSBK1XR70UfRYKYN37cvVnFmhCwucXatgOZoYZCiFk/B81/o0L5N
	 cSQOQPgKm5JNo90SkA1z2KG8TDErS5hFkVdWkty+nSJphGb9kzVCsb0dqM995mtiwQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293734;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XKH2H/c7tfElYbWGMk1Dtxz+IL8neyfEGWxsmN3TIZ8=;
	b=LqPN0RAKxY49K16uWoCRtZwwu7p6RLhJL+nCS/DBt4ELRkjO04q9uwaPsSSG1sAooHkn
	 VF3luYuNVpJhPbvY8RtDazGmmahGUlX5UDdGtha/R9Cw048W9LStsvBSt9eKwFpYGkwHe
	 WYe0iSENkJQnyb4kzX7de6KNCcBFbAFI7nqDB8+krefytJLw+FH6jH5x/nEKiP/T66yb5
	 SxMaS2kbk8AknA/2asauSjLdCwiRFuBaMZAugrkgle54Liq15Tf4+wuQlwQH9v8o5oJl9
	 3noapxh/87fzMB1fKj/gldRWNEQ4nKGDQ8z+Nnco6FANAtvN2KCZcmG2vPcIOW1EcgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=AvTymdBn;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E498606A31C
	for <exfat@lists.linux.dev>; Tue, 10 Nov 2026 06:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E498606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=AvTymdBn
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id E40D71D47A;
	Tue, 10 Nov 2026 06:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me E40D71D47A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794293733; bh=EV1UKAbGh6hQofsH5gUjmXy+2gjoBOr757cCpzfebEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AvTymdBnUHMPi+4FBk2nuEoPnzS2LQlRG99ClqjGqmHicdwmwm6H9gRnB6IdaN6on
	 eOWVdrYr2PLPzLl+Kf9ifoJahoDwSD5xS6MUhbR0gB7thO5oT2h9DZt2HcM2Kn7ac+
	 XRrgQ7m0csdjE4RQgc7bqthV81P+cbSuMxI4w5C0=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id /GyMLta/8mq/UAEA8KYfjw:T8
	(envelope-from <dxdt@dev.snart.me>); Tue, 10 Nov 2026 06:55:31 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 7/7] CI: remove stress test
Date: Tue, 10 Nov 2026 06:54:41 +0000
Message-ID: <20261110065441.63590-8-dxdt@dev.snart.me>
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

The stress test does not belong in exfatprogs because it tests the exfat
fs implementation in Linux kernel, not implementation of exfatprogs.
Also, the version of Linux kernel used cannot be controlled in CI.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 .github/workflows/c-cpp.yml | 44 -------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-cpp.yml
index 106540f..33092a2 100644
--- a/.github/workflows/c-cpp.yml
+++ b/.github/workflows/c-cpp.yml
@@ -328,50 +328,6 @@ jobs:
         sudo FSCK1="${{ matrix.run }} ../fsck/fsck.exfat" FSCK2="fsck.exfat" ./test_fsck.sh
         sudo FSCK1="fsck.exfat" FSCK2="${{ matrix.run }} ../fsck/fsck.exfat" ./test_fsck.sh
         popd
-    - name: dentry creation/deletion stress test
-      shell: bash
-      run: |
-        set -e
-        sudo modprobe exfat
-        sudo mkdir -p /mnt/test
-        truncate -s 10G test.img
-        sudo losetup /dev/loop22 test.img
-        sudo ${{ matrix.run }} ./mkfs/mkfs.exfat -vfC /dev/loop22
-        sudo mount -t exfat /dev/loop22 /mnt/test/
-        pushd /mnt/test/
-        cat << EOF | sudo bash
-          set -e
-
-          for (( i = 0; i < 10000; i++ ))
-          do
-            touch file\$i
-          done
-          sync
-          find -mindepth 1 -delete
-          for (( i = 0; i < 10000; i++ ))
-          do
-            mkdir dir\$i
-          done
-          sync
-          find -mindepth 1 -delete
-
-          for (( i = 0; i < 10000; i++ ))
-          do
-            touch file\$i
-          done
-          for (( i = 0; i < 10000; i++ ))
-          do
-            mkdir dir\$i
-          done
-          sync
-        EOF
-        popd
-        sudo ${{ matrix.run }} ./fsck/fsck.exfat /dev/loop22
-        sudo find /mnt/test/ -mindepth 1 -delete
-        sudo umount /mnt/test/
-        sudo ${{ matrix.run }} ./fsck/fsck.exfat /dev/loop22
-        sudo losetup -d /dev/loop22
-        rm -f test.img
 
     - name: generate large images for Windows runners
       shell: bash
-- 
2.56.0

