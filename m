Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BB83793B6
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 20:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863312; cv=none; b=pacvcdWwwll6U0CfEbfyDMdarbAJZvEtAnvq8RGHJ+l9Z7JxXv892N6T4njlKeSARCvxeygEI24qxDJke8eWBs8Af0i4dUnwzwOVUJ/f8jHPYCMLYdNpY0Dy5Svrspp90kTh+7O07WSgwhovsNJ7ScpPVfoYGkKxBusfIUvhoe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863312; c=relaxed/simple;
	bh=gQ2atmz8JUrg0WU0BRUaTVNIg8ozs62koAF4yP6BgUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bArMAyiWNJa9v8Y5PSuEPQp6NbnHz3ayWf38YGFkIlDVkT1yVBg56+ghqKXG5PM2i745dGOX9FeDYP6Z/z+Ut3H5eQDYp8iO6iAp3IpI2jJdYpgUBHBX9P8Cl4BQ6qDK+3ZvX0e2BkkMLGnEZpbmrfJbUMxEeyqWF27djCtoR1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=Dafvpp9x; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="Dafvpp9x"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 845961D452;
	Thu, 27 Aug 2026 20:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 845961D452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1787863295; bh=gQ2atmz8JUrg0WU0BRUaTVNIg8ozs62koAF4yP6BgUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dafvpp9xUW5heT5noD38Yn7F1CatvrDiMGPAogkAAPAwyiOxSoYu7R8iLzt1Dyfrt
	 /KU5hvgqbRufNthFHk//d1vqvcSHBam3tclRym5lLOHSkayxM3g+SfolszLYWTQbkZ
	 psqMTeFIJO0t1Jbv40JmOXtAm0woSkoa47MVbz7k=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id rDNIOvygkGosiAIA8KYfjw:T2
	(envelope-from <dxdt@dev.snart.me>); Thu, 27 Aug 2026 20:41:34 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v0 1/8] exfat2img, treewide: do not clobber stdout
Date: Fri, 28 Aug 2026 05:39:47 +0900
Message-ID: <20260827204056.222099-2-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827204056.222099-1-dxdt@dev.snart.me>
References: <20260827204056.222099-1-dxdt@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print the version info to stderr instead of stdout in show_version() to
not interfere with the utils that use stdout to output data.

exfat2img uses the stdout fd(1) to output the metadata image file, but
the stdout FILE pointer is used directly throughout the program via
[p]write(). This is UB: if the stdout is flushed before the program
starts using the fd, the strings buffered in printf() may end up at the
start of the metadata file. Although, with glibc, this doesn't seem to
be the case:

	$ sudo exfat2img -o - /dev/... | hexdump -C | tail
	*
	05a404c0  00 00 00 00 04 f7 62 1d  00 65 78 66 61 74 70 72  |......b..exfatpr|
	05a404d0  6f 67 73 20 76 65 72 73  69 6f 6e 20 3a 20 31 2e  |ogs version : 1.|
	05a404e0  34 2e 32 20 28 32 30 32  36 2d 30 36 2d 31 35 29  |4.2 (2026-06-15)|
	05a404f0  0a 31 37 35 33 39 20 66  69 6c 65 73 20 66 6f 75  |.17539 files fou|
	05a40500  6e 64 2c 20 32 34 39 20  64 69 72 65 63 74 6f 72  |nd, 249 director|
	05a40510  69 65 73 20 64 75 6d 70  65 64 2c 20 39 32 34 31  |ies dumped, 9241|
	05a40520  36 20 6b 62 79 74 65 73  20 77 72 69 74 74 65 6e  |6 kbytes written|
	05a40530  0a                                                |.|
	05a40531

Before exiting exfat2img, print the stats data to stderr so that the
output data is not clobbered.

Signed-off-by: David Timber <dxdt@dev.snart.me>
---
 exfat2img/exfat2img.c | 2 +-
 lib/libexfat.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/exfat2img/exfat2img.c b/exfat2img/exfat2img.c
index dc7ea52..e1e4a37 100644
--- a/exfat2img/exfat2img.c
+++ b/exfat2img/exfat2img.c
@@ -995,7 +995,7 @@ int main(int argc, char * const argv[])
 		}
 	}
 
-	printf("%ld files found, %ld directories dumped, %llu kbytes written\n",
+	fprintf(stderr, "%ld files found, %ld directories dumped, %llu kbytes written\n",
 	       exfat_stat.file_count,
 	       exfat_stat.dir_count,
 	       (unsigned long long)DIV_ROUND_UP(exfat_stat.written_bytes, 1024));
diff --git a/lib/libexfat.c b/lib/libexfat.c
index 4cae9bc..9baef6f 100644
--- a/lib/libexfat.c
+++ b/lib/libexfat.c
@@ -288,7 +288,7 @@ void boot_calc_checksum(const unsigned char *sector, size_t size,
 
 void show_version(void)
 {
-	printf("exfatprogs version : %s (%s)\n",
+	fprintf(stderr, "exfatprogs version : %s (%s)\n",
 			EXFAT_PROGS_VERSION, EXFAT_PROGS_RELEASE_DATE);
 }
 
-- 
2.55.0

