Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.252.183.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189385;
	b=AEmcAtEgZBFoI8ytXnm9hI/6sMh9KEvIL+zORAScMT8g0IT8AicF9CO6HTCnsZx+O7Xk
	 taQesFEzEFPhl9zCaZpoQsX+6RLj+/4umwbRd8I0bsaBXrNxYv68DDxwcV5nK/ZU4CRKH
	 0Keb60T+ly4ps74ICtJ7aQfg/YUmcOylbKKE9iCpBA/AYd7wj8CRGhvYGEJqWEh93CtYM
	 jzv9r15LHvlZqdh/rKrh2BcU+IFklBt5k6i/V2imicb0ySCWkPWyMjBGh/q/SeSh3Oz+b
	 wudR0l/CJjOwuNL4GQpIxCLPVqC0KkCbGrDzDR/jWE4ttnJtGV69lFGqvKcUtKS0U6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189385;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VhAjUXJA8FIDqhK1wFKYklhzuxay3G6+JOvWYL5ubBk=;
	b=CAgtVcgdkZhkNSHw8EbhK6OEn5pQfZNEM6JF7FJS/k+x55apHk2B8aL9eAOa9wgvwyIF
	 E3B9Fie9M+H9ObbFPh/P4vwcVUV0w9iOjkeT/SmgcfkZeqx5oM1eK2nXFS/pW82ZxNFSb
	 wlFiputX6T/+OemB8sRS0BslacO8xH6shW8h1xGfDy+tVGRTCEfA4j2oCwaSkWMlxdHqh
	 odJt6qlYE7UY0yMh1qRPDl3kaAiUPreSIlz91aPxC0HZc8vVtftitToc9Y2DxoFU/dfzp
	 9QxDx/K/egj5qty6VCKM0KgkRreGd8/+TgCzcldZOX90cIC1KnwuKwx3K9x54sGZBdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.snart.me;
	spf=pass smtp.mailfrom=dev.snart.me;
	dkim=pass header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=Ekbp4hUR;
	arc=none smtp.remote-ip=54.252.183.203
Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA9C606A31D
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 12:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA9C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=dev.snart.me header.i=@dev.snart.me header.a=rsa-sha256 header.s=00 header.b=Ekbp4hUR
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id CBCA71D485;
	Wed, 28 Oct 2026 12:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me CBCA71D485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1793189382; bh=/bIJMSMjEo+mUAeXjjp+Pg2PVbKBPa54WOOgEDV6nw0=;
	h=From:To:Cc:Subject:Date:From;
	b=Ekbp4hURAEeGQTSGpST5fkTMiO472osiPwszIY9Um3ajhG/N8oJSpbvG38TYqY1P8
	 N5rmQfnQ0liGxlE8RMfzIPxwkfesy/8SvOVBcZlGwI5txBRISwUa5UQdWEOObTcqb8
	 6mm2BwRyhE8cKEI3UashR5PgYTdtziDP3nT9mEy4=
Received: from maya.d.snart.me ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id COfFFwXm4WpK2AEA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Wed, 28 Oct 2026 12:09:41 +0000
From: David Timber <dxdt@dev.snart.me>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: exfat@lists.linux.dev,
	David Timber <dxdt@dev.snart.me>
Subject: [PATCH v1 0/1] Github Actions: bump to Ubuntu 26.04 runner
Date: Wed, 28 Oct 2026 12:09:19 +0000
Message-ID: <20261028120920.183005-1-dxdt@dev.snart.me>
X-Mailer: git-send-email 2.56.0
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

Changes from v0:

  - Replaced "ubuntu-latest" to "ubuntu-26.04"
  - Updated the commit message

Sorry for the trouble.

I also have a plan to reduce long runtime of CI runs by making mkfs
invariant(take volume serial and GPT GUIDs through commandline options),
so stay tuned.

David Timber (1):
  Github Actions: bump to Ubuntu 26.04 runner

 .github/workflows/c-cpp.yml | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

-- 
2.56.0

