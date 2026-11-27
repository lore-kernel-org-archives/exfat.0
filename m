Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759786;
	b=poIM0x9wP0Y5UtJAaZbUi4OTfcyXAh7GptlZvPfREbxLITIZ4JzTKFsUnmuXImtmcvVD
	 35HQBclkiZwQFRdUbtrTY4vtbk+T8YKSVRcvQz1R2sqDRk+jlS4i3/fTK50NiDgdb1C3O
	 hWnZIuLEof771ZMCcJf+k0vsqPxVPSxMmnpLpvs4sb2us9SlU6wYQH7PwQxizYnCvZZdW
	 137yIMbztWXm7NzYjUI3I2bTePzSKsYIP/jY1jRPjzsOCPFNLdNK91kmwsCjJap8RGiDf
	 gDixWtFL/ttixNiq9MxB+yfZrGdwf4inqHpKhFs2XTFm/6eGX1lzdoF+k0fnEghaF5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759786;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=rylJ4EnxKNIcixfDOljd+e6hXXj/Ks5EE/NnudM1ajo=;
	b=WTTc0BUGr+esnirqEj2iU89tSVGypJlLBd9T5dDvGhXbzBCxkmW4wyOvq3nOreqRawcO
	 zE5RGiFUDklouC20HbTUEMD9kjL6JRagRUAME5GJQ+kSPE9hjXz+D8Hfr4bHj9INHJFqc
	 tP0pZzLJQMBcMl7O8itdXeCmFy3iW5SmnlbRY/mHsI07zUGRIvd46qBlNJR6ol+thzSSM
	 O2SSdfewCqCGSGppR1EoOxiIw5+y9TFn0vLw+EhAfoYEouXVvZgzivHM6wytWJakHqoJn
	 EckXekU5l8KtfWxjr75xTKIMNiYd93/Q6OcoDqOIawQ4SyqWVcYbQC5JUmE9Hrgzalw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m8FLExAR;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBF2606A31E
	for <exfat@lists.linux.dev>; Fri, 27 Nov 2026 06:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDBF2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=m8FLExAR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ry
	lJ4EnxKNIcixfDOljd+e6hXXj/Ks5EE/NnudM1ajo=; b=m8FLExARKIB4aPMSQC
	J8kBJZWZJFdvRxNIPKbUTBLMaQy7moE/YP6qql5TJFqbzYleirmF1bNBNTXkxAbJ
	cGgeRU5sAy54BR2byhEeLVSKp79mQ6vTdbnRgZIqXAanDRy8RkOxCJ+gPVX/h1lC
	tMS/f81cb6s4gOIVqdFBngUyU=
Received: from ubuntu (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3f91fHglrpiWBKA--.777S2;
	Fri, 27 Nov 2026 14:08:40 +0800 (CST)
From: Shaopei Zhu <shaopei_1012@163.com>
To: David Timber <dxdt@dev.snart.me>
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	exfat@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v7] exfat: add EXFAT_IOC_COMBINE to append a file's clusters to another
Date: Fri, 27 Nov 2026 14:08:29 +0800
Message-ID: <20261127060829.940607-1-shaopei_1012@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <059a0b05-2993-4e98-a640-c7c8364c7c69@dev.snart.me>
References: <20261124230746.850528-1-shaopei_1012@163.com> <CAKYAXd_ap120uprmarov-GuO0fb1eXEgw-U8G08L1xRJ9bv18A@mail.gmail.com> <20261126075247.850895-1-shaopei_1012@163.com> <dcd27d38-60a2-4c1a-81ff-4a82e99520ab@dev.snart.me> <20261126190704.935716-1-shaopei_1012@163.com> <059a0b05-2993-4e98-a640-c7c8364c7c69@dev.snart.me>
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
X-CM-TRANSID:_____wD3f91fHglrpiWBKA--.777S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5zuWDUUUU
X-CM-SenderInfo: pvkd01phlbiiirs6il2tof0z/xtbC6gi+TWsJHmgYXAAA3B

Hi David,

You are right, and I am sorry.

I do take your time and your comments seriously.  My English is not
good, so I used a tool to turn my answers into English, and the result
was much too long.  The facts and the decisions in them are my own.

I am a developer and much of my work is on exfat, which is why I would
like to contribute some of my ideas to it.  Your comments, and those
of the other kernel developers, matter a lot to me.  I will think more
carefully about my replies, and I am sorry for the trouble.

Thanks for telling me directly.

Shaopei

