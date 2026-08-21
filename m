Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBC8473C88
	for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 10:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308724; cv=none; b=Hqwo/0ELO6QPuCJKLy2I8U716aHMjucoL/36/I6pEBRAaiViEgMWaPfRo0nJ4P9dqruZfLyY3GJo44RznV+LmJu7cGRrVdomjwOAZ0g53NDs593ZtUzC1WfSrL74k2JysfpeTeyaxoXl3VrrERJmjCGY8C3C3DcUWngtSf/rH/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308724; c=relaxed/simple;
	bh=/QT9FTcr000oxts5grMxSDfufKHvKN9lWFLAvhTJG6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtIF6qIsi0vaVmZWokKLWb/tCHJJHebwmlTT6fxhAednnPwTis6RE7vAugPpXSLtuLBZnmXlUT/2AA7tt9sVceE1C+UHotS1ou0tipS2N86CCyhCdVHsrk8BFZOEtgYou2W85DtSZXzAiBZsJjxD1W/yLCEQ2e+CUZ/9gpJA30Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=KdGU2pOC; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="KdGU2pOC"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id D02A01D45A;
	Fri, 21 Aug 2026 10:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me D02A01D45A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787308712; bh=/QT9FTcr000oxts5grMxSDfufKHvKN9lWFLAvhTJG6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KdGU2pOCmB5VUbUAt4wNdYhkVJQwq7092cRubQgiRYZ5xJsqeSQHgcNTsA1sYMh2D
	 3FTPtCN7jrtR5hNGpCMIhbcB+NA5JqqBKxmBPGjz432Ebm1ZtCAOyc6J90CW5cgDKN
	 T1dsxU5ze19104Xq5V1+gUen5ecGbbsl1opVJ4QM=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id /jNMGKYqiGo1WwAA8KYfjw:T2
	(envelope-from <dxdt@dev.snart.me>); Fri, 21 Aug 2026 10:38:31 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 1/1] Github Actions: cache util-linux tarball
Date: Fri, 21 Aug 2026 19:38:21 +0900
Message-ID: <20260821103821.52224-2-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821103821.52224-1-dxdt@dev.snart.me>
References: <20260821103821.52224-1-dxdt@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To minimise the chance of CI pipeline run failures, cache the util-linux
tarball in Github Actions cache so that the tarball is not downloaded
every time the CI is run.

The connection to the CDN usually fail because:

  - Cloud VMs usually have low IP reputation due to scraping activities
  - Shared tenancy makes the connection unstable

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 .github/workflows/c-cpp.yml | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-cpp.yml
index d332f04..10975b7 100644
--- a/.github/workflows/c-cpp.yml
+++ b/.github/workflows/c-cpp.yml
@@ -33,6 +33,7 @@ env:
     1T 2T 3T 4T 6T 8T 16T 32T 44T 64T
   TEST_MAGIC: dd01aeee-bab0-babe-babe-deadcafebeef
 
+  UTIL_LINUX_TARBALL: util-linux-2.42.tar.xz
   UTIL_LINUX_SRC: https://www.kernel.org/pub/linux/utils/util-linux/v2.42/util-linux-2.42.tar.xz
   # xfstests generic/740 equiv
   FOREIGN_FS: |
@@ -188,12 +189,29 @@ jobs:
         sudo apt-get install -y linux-modules-extra-$(uname -r)
         export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
         export PATH=/usr/local/lib:$PATH
+
+    - name: Retrieve util-linux tarball from cache
+      uses: actions/cache/restore@v6
+      id: restore-util-linux-tarball
+      with:
+        path: ${{ env.UTIL_LINUX_TARBALL }}
+        key: tarball-${{ env.UTIL_LINUX_TARBALL }}
+    - name: Download util-linux tarball
+      if: steps.restore-util-linux-tarball.outputs.cache-hit != 'true'
+      run: curl -L -o "$UTIL_LINUX_TARBALL" "$UTIL_LINUX_SRC"
+    - name: Save util-linux tarball from cache
+      uses: actions/cache/save@v6
+      if: steps.restore-util-linux-tarball.outputs.cache-hit != 'true'
+      with:
+        path: ${{ env.UTIL_LINUX_TARBALL }}
+        key: tarball-${{ env.UTIL_LINUX_TARBALL }}
+
     - name: Build libblkid
       shell: bash
       run: |
         set -e
-        curl "$UTIL_LINUX_SRC" | xzcat | tar xf -
-        pushd util-linux-*
+        tar xf "${{ env.UTIL_LINUX_TARBALL }}"
+        pushd util-linux-*/
 
         ./configure --host=${{ matrix.host }} --prefix=/usr/${{ matrix.host }}/local \
           --disable-shared --enable-static --disable-all-programs --enable-libblkid
-- 
2.55.0

