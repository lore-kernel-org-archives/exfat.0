Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293731;
	b=HkPN16oRg+a3GZukTeIMIgPApxspZ3IWA37BGD5Rhkwj+TWSKla1Bn18uo6jSZ+7vK2o
	 pYTZrMf0/B8KldPII+uIx8ndB53ZGpIeRtkfgGtVeJYKm2JJXnPjlQkukWcDgoSSGFL/C
	 8MMz5EUX05Gy+DQ+lZN6H7qK468XpX/5viBxGZug0CyHf2V0FTuSIBBIlDUQ1O/Eopso7
	 TJl9gfWlLT3oDoupSKc19eDT8updT04qeHX/eDFValWkldMY3zSUg4Onx2F5q+tUyvUy2
	 N5pl+LVEqC69XHJAtkcLHSxM1LIr5yxCAXXxDo926NekOnl4nb6h8R2WIDMQbcxzgNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293731;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rvKU8w/vRmAmfEnOtwDByUar4VF7UJINN/DoYN+A8dg=;
	b=aBMmzNKryIgU2vf7TvRjwziIhfq4zv2RRCRWzsFa/UDnuhJNDiJ3w5g3UtdP94YIHCwn
	 ihHZ9v6BpRcXnfFbigiFyEKjJ32HMilT9R1vZWzitP3LotZGUfM9ZM9+fWzA9B2XU6HbM
	 ovetlzhs+vyWattMtG/mqsfeeJnpxOVvfWmDpWvUusS9srckw+PXWDFs2OhWQccQu5pYO
	 8o8KxJvbo/T1MDzSskp3eHNvaSv3UPF50hYJkh4dSNvqRsAWWUUXQqyeNgiZS3mTCtxIo
	 zPFzHj+C9rSsOtwz7DiEHE9Vao+5LVmcjjhpravmMBzoUSpZOmSXo36rODRMhtzIn6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=LEtq5nIs;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6BF606A31C
	for <exfat@lists.linux.dev>; Tue, 10 Nov 2026 06:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=LEtq5nIs
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 4A9891CC1B;
	Tue, 10 Nov 2026 06:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 4A9891CC1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794293729; bh=SM6DGSZkzaGJ6PhSZZH36DL1JODqhTuJcigxqfvmkLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LEtq5nIsaeuGwMFNgNjFcywE7wKE1nVbuAekuJwxeat1M3ObryddO7NpwO+vFIBvF
	 lWU3XJRz+e2WVXdIbsiRWgfDpViNfzlhdghskWIvv+hoM8i13UEV/Lt7lQAByRi7fr
	 6znQwK02xJh8pD8LIk/RFWuYD9uLQVv/rHBPDedQ=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id /GyMLta/8mq/UAEA8KYfjw:T6
	(envelope-from <dxdt@dev.snart.me>); Tue, 10 Nov 2026 06:55:28 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 5/7] CI: add mkfs entropy test
Date: Tue, 10 Nov 2026 06:54:39 +0000
Message-ID: <20261110065441.63590-6-dxdt@dev.snart.me>
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

Add mkfs entropy test to catch regressions caused by poor RNG entropy.
mkfs.exfat must always generate different volume serials and GUIDs
regardless of temporal factors(eg. mkfs.exfat run in rapid succession).

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 .github/workflows/c-cpp.yml | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-cpp.yml
index 4e5eaf1..1be7e15 100644
--- a/.github/workflows/c-cpp.yml
+++ b/.github/workflows/c-cpp.yml
@@ -284,6 +284,42 @@ jobs:
         rm -rf "$(realpath .)"
         popd
 
+# If run without -i, --disk-guid or --part-guid, mkfs.exfat must always create
+# randomly generated volume serial and GUIDs
+    - name: test mkfs RNG entropy
+      run: |
+        set -e
+
+        EXFAT_MKFS="$(realpath ./mkfs/mkfs.exfat)"
+
+        TMPDIR="$(mktemp -d)"
+        pushd "$TMPDIR"
+
+        rm -f a.img b.img
+        truncate -s 256M a.img
+        truncate -s 256M b.img
+        "$EXFAT_MKFS" -F -Pnone a.img
+        "$EXFAT_MKFS" -F -Pnone b.img
+        if diff a.img b.img
+        then
+          echo "mkfs.exfat generated the same volume serial !!!" >&2
+          exit 1
+        fi
+
+        rm -f a.img b.img
+        truncate -s 256M a.img
+        truncate -s 256M b.img
+        "$EXFAT_MKFS" -F -Pgpt -i 0x12345678 a.img
+        "$EXFAT_MKFS" -F -Pgpt -i 0x12345678 b.img
+        if diff a.img b.img
+        then
+          echo "mkfs.exfat generated the same GUIDs !!!" >&2
+          exit 1
+        fi
+
+        popd
+        rm -rf "$TMPDIR"
+
     - name: run fsck repair testcases
       run: |
         pushd tests
-- 
2.56.0

