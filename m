Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293730;
	b=eLsrm9L60kF+rD6IMXmAOZoL9RwCvnLBSj0mGFEJWoXz05NuWeinW0Vamr99ycDIwKNF
	 Tag6v2mabOlNB48j62PZU8B1gyqiJqjnsfl/a0xEEiJlCEQ7IqtWmmCGXDFeaPfGzRYI6
	 qRdLkZvVReCxx62YwhWQbpt9mBmiWSPAhXjAUr4Vu/gFn1RjhHJSPNGapt42qx+lNQ+GU
	 FNbFPS+MqTeslPkYcl7fySvbTubzg2Ya1VOrjzgLTIkQbmhqdJ8oOgJOgSFh+tVkb4+2N
	 Cz/v1Ls3aPn0MZkysLgoG/yCLmriRwWdg2C/OsmZAfHuaENVCmJJz1/L9yBr9jK7tzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293730;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8h30OResERabd/veieAYgFnMgOP7UtXJLz+K6gdts4U=;
	b=KX/EK800BDuozuZEkTmeL3Bgtvrnacbaj3OSzVlF5qRwItk10I0lh3R2AfxaNqFBTIE4
	 ZtPfkC9orHFI7oy9JjNbL9uhV7rkAAshhNnz+V1SMZkVZSM/qJmkKVm3Fxco7/9fIZM7E
	 HrARc8DbBvu/UCSPTWFiNJ6mFY6bmrHFR4XDmC5A/yAOwSYorH8toSxP2ORiaP5G7uL3a
	 lXgg0E5ksyAdFOn7Ffugo2jY/wfiNozgOAqBkQ+s4AFmJ6Zof4ouG4EZfnDqPxMxbqNfy
	 QjnCbCPmEJbbWLP1S7k1rfZgiIhnC0PXRFWSRJsRIZ0ejWn1GY7CeKfLPK4Izvrvj6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=vuKm4Bds;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB70606A325
	for <exfat@lists.linux.dev>; Tue, 10 Nov 2026 06:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AB70606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=vuKm4Bds
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 0EAEE1D47A;
	Tue, 10 Nov 2026 06:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 0EAEE1D47A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1794293722; bh=vEjadQf4KStGjKExcej7WSBBVP08TX8W/Et7cWspsGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vuKm4BdspljR657nT/DawbI9NsPF5sitx/ymcUW53uLLFbHUVoJCgkqFqtJ0SQ2Lh
	 xu50ixfMewBPj1ikMUw2hX29NjhgUOG/dMrP8NoeFjGrAoTsj/VVciPGWg1Q+zBp/L
	 q53AcodlJCarAlB5lVHKB9bALeq/9QrSM/sEtJF8=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id /GyMLta/8mq/UAEA8KYfjw:T2
	(envelope-from <dxdt@dev.snart.me>); Tue, 10 Nov 2026 06:55:20 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 1/7] README.md: update build prerequisite packages
Date: Tue, 10 Nov 2026 06:54:35 +0000
Message-ID: <20261110065441.63590-2-dxdt@dev.snart.me>
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

Add missing build prerequisite packages in README.md.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 README.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index 9a523a6..198fb4a 100644
--- a/README.md
+++ b/README.md
@@ -11,10 +11,10 @@ under the GNU General Public License Version 2.
 Install prerequisite packages:
 ```
 For Debian, Ubuntu:
-    sudo apt-get install autoconf libtool automake make pkgconf libblkid-dev
+    sudo apt-get install autoconf automake bison libtool make pkgconf libblkid-dev
 
 For Fedora, RHEL:
-    sudo dnf install autoconf automake libtool libblkid-devel
+    sudo dnf install autoconf automake bison libtool make pkgconf libblkid-devel
 ```
 
 Build steps:
-- 
2.56.0

