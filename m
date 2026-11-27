Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785608;
	b=CBtuq3Sdlzk+C1CX09aYb3m5WjiBUHERwiRRuaJOqpUx+QJ6fnX30m9SAZguHrFmTbAX
	 zURCvC9UhwhB5xOSb7M0CjkNa0Ya37bQzDziqP2Zl4EuL6hm6VIZ3hcr12UJxi7o/bZ2y
	 HJVrWj3dbC+PPrS6IBF1loGVGrgC37MdI2NpBv/LhSBGF0Us4O/ytI6plaf5cXxn1axih
	 eiCqgs7hMbK+9VnZ18IA30YyJHt6l3GH8oskMuQzGpeS/5rSW0zAAVy9jDnaey+8t82UL
	 xfYP0shmslSSzvZdQG7ETcgYrtHa+y3OJaT0crFf16gRip/DqbPL+XdmTNhNYt9BafQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jvhZOZYstAhHr7cjAAmZMJ7DGABOCUCwr2lQ63IMc4Y=;
	b=wdhukKga0Px1Jqh6jKH03hwIATQvmjSH9UjRY8fL8ozXeF1cDA8njvezpsH6tp77NYS2
	 g8k4lXpb/lwpKzUV5jy4yl/zWbdJcIiKenq8kbLh3myGTdy5b5kiE2hT0xYWlUVRTWPf0
	 1G577CuzMu4btMk0QnfgvLFkXAuDXJDdgxh7ejuFCYsKU5LPr4mAXfeZAfR0RkdcFITyl
	 D9dOFk/+utaiZJ9Vuf3aEZUUPUP6joUkx6cGaWwnkrk9+vteEQWhrN/9fP1WJx+Ai9TZi
	 QJFgDPYrsDYb70dIDYn2N+/C/dZiJPxto4wAlM2K3NdiqNXglgum7taSWgovDolYLtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ietAUz40;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF95606A338
	for <exfat@lists.linux.dev>; Fri, 27 Nov 2026 13:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF95606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ietAUz40
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb628232d2so4463849a12.0
        for <exfat@lists.linux.dev>; Fri, 27 Nov 2026 05:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785606; x=1796390406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvhZOZYstAhHr7cjAAmZMJ7DGABOCUCwr2lQ63IMc4Y=;
        b=ietAUz40SJYue+yXnA6542vUBbqCYCaUCRLGnvDHtnNGWtygtgjLx0RktW/J29IcHn
         Vx1aSkBzvjNQNv4mVMiaBVXo3YHtLp9nVLKsrSV2hgd0ypVD4jx56rbjLEmD3yaW+5Nb
         rIH23OC0Sq3AvqesRm4NOlwYHIxcE+yOZdmiyMG/a7J3HVTe7jk6dnYQZMv1XM0wDz7+
         RovZh7jJPmjEpJaPc34hA6zdxW/d8Xq4QKoNeMV+ri1Ihh87IXAzCFzjVfOw0CX9auN5
         Zm75CrK7uzvRq1IOCb1ozAzGItj3kcCozCNe9avRgBsFGAi6Giwq1Wq59EpXoHymEEDq
         Epaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785606; x=1796390406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvhZOZYstAhHr7cjAAmZMJ7DGABOCUCwr2lQ63IMc4Y=;
        b=EjcZ+kb8GIWFN4v7N1yYk2U42j4yiqrz77nOb5gO3INmx0mkoqR5rr82dzrcPF7wsi
         7SgHxa2qOfi/Ca6Eh3R3lGVME2Kb3+X279ejbnw8R0YJiVXJSi+/QSFst+DpKDLLx0Uf
         oSefmplW0Du5PHJBruebCmc70PjWdWX15c3gU9p6B4ft/Ij6I80sroE5W7IXZDD/eb1t
         9gPRWCvxuK4He4TcdJJgmZC3hKZBNLosqNSQAUIyOocxb8r9mk7bawXcGWhqEI55h4Ba
         FgfAY5TeZpQx5OhqO4FfaV7BVUqJM4r4FBfwt5A2yXD6PrGuGq+EjcWEUjlwYl7Rh7vq
         1i3A==
X-Forwarded-Encrypted: i=1; AL+hErGNWbF9KXrU3VnRFff1HdRfwEJXKZPhkcgSXQQDYN8awT+sPyiK0pD0+c16nXxXVIlUyT305A==@lists.linux.dev
X-Gm-Message-State: APuU4Z80VK2ABYFFEoV5A45IKK7zVaKH3PA0ZJKc7J/qrVCfYjlCBuER
	MzUZWcii5ALUPLNRdc1TU/9C1BDN4dkI79MV25pWQTML0AYl1ZfZUTcS
X-Gm-Gg: AZFdTZcaXVveoPnxdIeGFOK3zHth0zWy+0Y5aFpulQObPaFdkdms+jFiCYSjqyPi947
	uqYHq/4x7d4m8YNBDZu02RGOuiMRWtiVll/AgsipY34sk/SetJc/ogXHksKXexwLZ+CgtmfLllh
	G9A6ajzLCURkDDT/jRpFJj4hXOGCwV931LzGgfqBJoEu+t1fKzbGE61VLC8jBM2Gh9FYx7UaXzQ
	eYsebtf5XvLAM9mI3xxOu1Sg0eYwFuyXWKLk7C+cRbBjr+1LMxOSL3Gjrrv2KrUneipZ0EW0GCz
	Rsx1oosLyzlZZQ8SyLfcLT+s2kMmD+Ptweu+Bm3JNTlVn3BHmcrMY9P8i88eAbPy0Sl0bNEBa65
	SAaQFHeCmUvxYkt/GjRUpVsFX5de4z51H00c6wTPFm6+7BOfSRTQr34vnGdL4brYgREv5LRqNfH
	LMI97+xykqq8Zu8bnUrhx6EJMUeAG6/7Fi0l/9ZZo0VGjvod/EwvHX+ws4H0mxhZGMdLpHd8fs0
	xJEnHwGoHaPXFStB8WNEDidm58wG/z4eLi5kTvw1KPdEdA7jRB4d3sXuD2ey8fZLf6DnCNvIa2N
	hcTzbWJj6Yd5n6q+0ocbiUs7szCkuuTLr2ARo6UMBpBz
X-Received: by 2002:a05:6a21:3d8d:b0:3f8:565b:b608 with SMTP id adf61e73a8af0-4014d566e81mr22357030637.40.1795785605580;
        Fri, 27 Nov 2026 05:20:05 -0800 (PST)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm12656376b3a.2.2026.11.27.05.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:20:05 -0800 (PST)
From: Yang Wen <anmuxixixi@gmail.com>
To: dxdt@dev.snart.me
Cc: anmuxixixi@gmail.com,
	exfat@lists.linux.dev,
	hyc.lee@gmail.com,
	linkinjeon@kernel.org,
	yuezhang.mo@sony.com
Subject: Re: [PATCH v2] fsck: detect case-insensitive duplicate filenames
Date: Fri, 27 Nov 2026 21:19:16 +0800
Message-Id: <20261127131916.2790454-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c08193a0-6488-40af-8bed-ba81e016695f@dev.snart.me>
References: <c08193a0-6488-40af-8bed-ba81e016695f@dev.snart.me>
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

On Fri, 27 Nov 2026 09:28:43, David Timber wrote:
> Oooookay. Checked the image on Win XP and the latest build.
> 
> The first thing I noticed that all versions of CHKDSK.EXE do treat the
> condition as an error and fix it. EXFAT.sys, however, doesn't seem to
> mind, although the WinAPI will probably open one of the dupes and all
> the other files are practicall unreachable(see my comments in
> https://github.com/exfatprogs/exfatprogs/issues/313). So, not so
> critical but worth fixing to match with the CHKDSK.EXE implementation.
> 
> Tested-by: David Timber <dxdt@dev.snart.me>
Thank you for testing this with CHKDSK.EXE and for providing
the Tested-by tag.

> I see no problem with your patch.
> 
> However, unrelated to this issue, I've found that fsck.exfat renames the
> files to the ones incomprehensible to human! If run with `fsck.exfat
> -a`(by initd via fstab), it randomly generates the new file
> names("/FILE0000001.CHK"), completely destroying the information! See:
> 
> exfat_repair_rename_ask() -> generate_rename()
> 
> The Windows implementation renames the files by appending -1 and -2. So,
> the files in the test image becomes ...
> 
> /Duplicated-filename-test-1
> /dUplicated-filename-test-2
> 
> after running CHKDSK.EXE. If the file name is over 255 characters? idk.
> It will probably have to write over the characters at the end.
While working on the current patch, I was also a little uncertain about
fsck.exfat's existing rename strategy. Renaming duplicate files by
appending suffixes such as "-1" and "-2", as Windows does,
seems more reasonable

> Anyhow, I think that fsck.exfat is destroying information. I think that
> it needs to be fixed. generate_rename() should be used only for rescuing
> orphan clusters. I'll open up a GH issue and get back to this later.
I may be quite busy in the near future, so I probably will not have enough
time to implement the Windows-style rename strategy right away.
Sorry about that.

Depending on Namjae's preference, we can either merge the current patch first
and track the rename behavior separately through your new issue, or continue
addressing it as part of this patch.

Thanks.
