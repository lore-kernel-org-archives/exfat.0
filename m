Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704851;
	b=smTCeAlYPWLbF0JJkcA/C93NLYj/TTXNc4X2368hWZIlWRv4zzb4nyP+kB5iokcwgEkA
	 laziC8m1fm8hx8Coxhov/y3XG1paFjtL5pC9vI6P8yDmTl63hAwTUTm2Qhh3vL/Y0IAx9
	 yo6m/18CfqKXK5po1yW93c4xCuPxVLdMONcR5tgxCWjfxrirKXE3YodN4k2Cgz+xrj0bN
	 G25hmx/5Yqx9el02syvT8t+408AtX8UxS0kbuJrRLq01RiDmzKmvOFQBskkCAeVdoXJoj
	 c3vtxp6b3mHUYE4PMeK3cNzInGl6QEyZLLuFY8BoVZxo3NMqnlliD+QoqZJ6ipHl6kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VAU1teKrMW5C6BwNiAk/wub/TkDE74G/Ydlsowj+4Ks=;
	b=hwc+mmMlaRkzZDhAGndiqguN7TsSmz/QvM5zvQSGp9LjtwkFDNQNZGhySkSM88RgjpDA
	 bOvjM455tvjBhQrzaLNqMoHOLqSNXR3BsGx8I+NeD6h+J7mAwSvXUc60x29+ZRL9QzYxj
	 D8ZE2voF/c3xG96cHBvXlUGx+RixXL/huAhIeTVgNABGSa+HZxQ6D1ILcRDaIy1b53Yum
	 ICKlekx5gBNL2Ocu/b3Al9vDgNq5cElW1WqWYECqvZnLUwX35pPBoCmHe+2Zertpb/u24
	 00h3dskbHk+rXwZMgNxUAS2TA8QDXXd4fu6O/pifnR4f2UzucwyJBI3cfIKU251xgbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtd6MkPD;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AC0606A31E
	for <exfat@lists.linux.dev>; Thu, 26 Nov 2026 14:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1AC0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wtd6MkPD
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f01f296937so54026565ad.3
        for <exfat@lists.linux.dev>; Thu, 26 Nov 2026 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795704850; x=1796309650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAU1teKrMW5C6BwNiAk/wub/TkDE74G/Ydlsowj+4Ks=;
        b=wtd6MkPDJzjYuT7AFVwQSjRjXSuN9W9F7xBGRO2+ceSsJg4kHK9F1P/5ObbJ+Ci4mO
         VM2uBXGFHPDJctY38gzlLMZATV40dfvGuPwxdbiikqQFczBAX5r07NoSRcF3/4u94Mta
         6m09eo8xCaH2w6vMsXFwz0vFUqwymHnG8GCu/+J1mXRNqwT7bkKIz73QLN78N344E+HG
         bICnlxZntSHjieQaH1CPpUxnPPhYeZ0JjM0WV55Fvirzkegndgu0kYBRpMMcl3lAvcJU
         WPjRhEphwfsN0eJ2cCKGOJPC9XYPZJg5s5Vj8JqC1E2whz7iChmsyDYN807mBX3abEAu
         FRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704850; x=1796309650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAU1teKrMW5C6BwNiAk/wub/TkDE74G/Ydlsowj+4Ks=;
        b=HJIzjml4tAi4qkkpUKnbDn24Fd/uB36/WnE4HTsauCpmUsBNe5KN2ity0sA9hKmwLV
         SaxxG7RcbKwnHv5el+Cxth1sxxCRYlRsL+/8eeW71q98ML9hyW6PAdXcsG0ev1agDovG
         s1aztC1H2gHd1BMuqG4RrOaBkNSKKKQ/zDm+djZV1HPoXzBRuwGlh3y4uS9MHtFTSnA1
         byeZLujMWd7hhHc4gzbPjobtycUpqen9kyipU10TvLhp/wqOucTQ93/u3YQ9G4IMhdON
         itESqxOhXwxKu8evNBPCdhbwkBeZ8M0W4K9ZRP1Rbn4OAM3zWjE8WyT8dcKD4OCDWzX+
         MMDA==
X-Forwarded-Encrypted: i=1; AL+hErFHV7GQBolm3Zx8m4u8dqcZCnDQ6mbGLeRrARSBP8c5BXzytIEBAVJdjIt7xaW6FRW02SYioA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+NR5Hxb3c3mn509AkSM8ZE1WMLtQSjuGHMU6D4QZY2k0nGxO7b
	szOgtU4YVqQBbKV5bsTGhRejXMTOVye92SCY+Y1yI/IbmrIkRjxOMS/Q
X-Gm-Gg: AZFdTZcWwiH2PGeSoW2vgE2J6VNIk/f7iatq2RA0MS6bl6lJqVsV58JwZKIOMc9pz0G
	fYooq+6lX5EmLVIW8lRF/1QCEJxBx92PMjnl19C0qyuW5MC+KCqsV9PQ3cnIDgXuGmMUOjQD34m
	fTp3mzoKInVorFAlHufM1UOrHSwTT1PwQ6qVR2n7HdN4yFwvCx+N3jP0TQxrFcC17TylIagw8Oe
	QkfkIf8pvRO2huPahM+8Z4gH6EISzwcHZU1LG0FuMyzgar5scUhm8JHieDh2l4L981pEd9QA6SE
	fcUKBWeeBFdvpI6Ii7i60wr/KH+iOZGDKnfoimmjA0GxHPcgGlzeLzmveJFpaJUVP9w9s8CkX5c
	LHPDgwO+KwyGrozyaqzXQObwTXrcGGQ/soQ7aS110FJEwmavhIMpdVf26RjM4m5DggJTjQD3lG3
	SLrEN2XOl+hKbZuNd8v7JOrOYV9PjUtTsGvyPoKq5K7txm/Of2sJd4cIISc+9TWCdKPauSgFYX6
	9QY/xgvkMQYcunsVWv1+19ywFToJ5fkjSyexxnJ7n1G7QbHdQYnDSWaKGH6bT0YsjAq2T6VtkYo
	4AsTqKHti/6x3ROM4nlNCDMdpK3vZhNEgbzoNavYrY0=
X-Received: by 2002:a17:903:19cb:b0:2ef:f37c:722 with SMTP id d9443c01a7336-2f03f1cfac2mr223965025ad.17.1795704850110;
        Thu, 26 Nov 2026 06:54:10 -0800 (PST)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0bc695f31sm47594195ad.49.2026.11.26.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:54:09 -0800 (PST)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org
Cc: anmuxixixi@gmail.com,
	dxdt@dev.snart.me,
	exfat@lists.linux.dev,
	hyc.lee@gmail.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH] fsck: detect case-insensitive duplicate filenames
Date: Thu, 26 Nov 2026 22:53:44 +0800
Message-Id: <20261126145344.2759661-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKYAXd_9u-ZRaZxuCPPfptd8uOT+hF8-j9d99Pi01SwONcsiRQ@mail.gmail.com>
References: <CAKYAXd_9u-ZRaZxuCPPfptd8uOT+hF8-j9d99Pi01SwONcsiRQ@mail.gmail.com>
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

On Thu, 26 Nov 2026 09:32:13 Namjae Jeon <linkinjeon@kernel.org> wrote:
> dump.exfat calls exfat_lookup_file_by_utf16name() with upcase_table
> still NULL. If an earlier directory entry has a different name of the
> same length, memcmp() reports a mismatch and the lookup dereferences
> NULL here. I reproduced the crash with dump.exfat -d while looking up
> an existing file on a clean image. Please return 1 on a memcmp()
> mismatch when upcase_table is NULL.
> 
> $ sudo mount -t exfat /dev/sdc1 /mnt/test
> $ sudo touch /mnt/test/AAAA
> $ sudo touch /mnt/test/BBBB
> $ sudo umount /mnt/test
> $ sudo dump.exfat -d /BBBB /dev/sdc1
> exfatprogs version : 1.4.5 (2026-11-18)
> Segmentation fault
Thanks for catching this.

I will send v2 patch.

Thanks.
