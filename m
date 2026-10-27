Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088414;
	b=An3C8RRtm/Yw0Lr+xuUXipRsTftekRrh4qGTX9hNp/59n20TM2BgI//i6CBLIoTQiEen
	 zPms3bVnUrbV1ipe5qqQzJzt2LA2bd7GIANuFDuf2jXxeOYVgbopWMl7vkYmFh5DXgED7
	 BDk1S4yHf56icsYfGHIsFpatSePeBa8HdFva4clapGgb42GJuQmOCcUQgwX8g2hmeqHiO
	 ySCNTXMBykUgpSkmocy1FYfPM0x+6+MXhNy52OpM+9RrHZFam3Pkp1DeM0MhR5DZ6t/pz
	 YJUggjNQcxZdCvirafeIaX5lqYCVraqo/zXKa5oJV0zVmdnT9GiWvNhpnHvhozq1oVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088414;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jn1XJSSirAHvFBXQoFa4hinxoPzWaqlr72jZ446McuA=;
	b=ZrIJJRXRIisxkLVIS2Th//oEOtYKIqjh/nx8fB7V0B195c0+Za4mI2zvbsqZtN/8uUCV
	 WRMr66ltE72ajVqOXkd1pVcvEBKvAz30yMFnJUVmQjr+Hz0QRxw9QhCZb9S628qrVW1ZH
	 eDpYaO95JdgQbNIl53o5+fkPl+NfzHPmMLLi3fQLwd9bMieFu8gNLhQGjeayHY/VyeKdT
	 tUlsK9ilGwG3dsM2hVnjhCK4bB1CrGgIa8VP0vHmuZf/zeEUR3flOpVvhDIk644QbAoNt
	 LVyffWdDr1j7IRhMVw01AZTADMzL0XobiQ4wOyr9n0E4cp8jb4KXAzQAaJeYzJK9pcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=E04uX6VC;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99DC606A31E
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 08:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A99DC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=E04uX6VC
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 079001D485;
	Tue, 27 Oct 2026 08:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 079001D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793088412; bh=k79Mlwj/NWZo0JCqmU0IcuS3ozgHuEkhgJVNkHo4mrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E04uX6VCITFWN9T072X3yBHpErz4ClbCt32yzlrI1n6qRsChP0G4w6Q0WcSdIvoUs
	 Pg1zfTBtTIs3VY/NeYIbvnWa0+XAq9dmQkEaZhlh/VGivKbDFKkI39CeHwEntpahOv
	 mhUG4JNHnoyZXXuDJCxQ7ZOYxmScnJYbRQolF7Yg=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id LI3iAZZb4Gr2bwEA8KYfjw:T4
	(envelope-from <dxdt@dev.snart.me>); Tue, 27 Oct 2026 08:06:50 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>,
	"sofine . ljm" <sofine.ljm@gmail.com>,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH 4/7] fsck: do not print version if run with -p or -a
Date: Tue, 27 Oct 2026 08:06:21 +0000
Message-ID: <20261027080628.82069-4-dxdt@dev.snart.me>
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

When run with the option -p or -a, do not print version info to stderr.
This is to prevent unnecessary output to the system log if the volume is
automatically mounted via fstab.

When run with -V or --version, only print the version info before
exiting.

Fixes: 1f19c2608fdb ("exfat2img, treewide: do not clobber stdout")
Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 fsck/fsck.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index bde12f0..4f22a0e 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2106,13 +2106,17 @@ int main(int argc, char * const argv[])
 		}
 	}
 
-	show_version();
+	if (version_only) {
+		show_version();
+		exit(FSCK_EXIT_SYNTAX_ERROR);
+	}
+	if (!(ui.options & FSCK_OPTS_REPAIR_AUTO))
+		show_version();
+
 	if (optind != argc - 1 ||
 	    (ui.options & FSCK_OPTS_REPAIR_ASK && ui.options & FSCK_OPTS_PROGRESS_BAR))
 		usage(argv[0]);
 
-	if (version_only)
-		exit(FSCK_EXIT_SYNTAX_ERROR);
 	if (ui.options & FSCK_OPTS_REPAIR_WRITE)
 		ui.ei.writeable = true;
 	else {
-- 
2.56.0

