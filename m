Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109669;
	b=YJo0QhA3lXHE+Gi0fpUKP3D6r2/St48vA0b1CwgoGhp5PfNR1WdBUWP4WwuaTlPvFE8s
	 sLZwKQ4UuVWW2ltk1wAKciWKm68tVzndvYVg/jb8QqGq+MNMmfkU8ZEylnMc1LlCopoyU
	 dLynGQj9VpEKjku89bdELJbpPWsp2nyJGYhkZ5WMsIw6dJSMZRbxkGpSJVRAQ93mpZmuT
	 wwwJ5lGmASPtCS6uuNYQvb/ucDgVuMy+OQwerFNmulWVtc3oC4NfMoEJNHFRfFLyOTXI4
	 LcR329ss2y6WH9qoygTVJrNQlxEm5YGJ2EWt9ZeXRpmSu0vG0pg+e2wunzAUx3XaW1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m1EYDKjHcJ1IGh49gGW/JeuREp9e8GQDYfzpAeI0szc=;
	b=4iLhS0UHdNRBnWJvvBb/SAFRJi9wf5jlBfSgIEIq3eZGzwFIj5qNmMtGl79l9C2xEM+T
	 COjmlP4/ouu7D11SFKP0f/vibEKSW5e3cu/RoHXX5X+aeDcL2KQ4VkwTeoNSoIxS9K6Gr
	 4ElpcSt+cHc2L0csq/I5/0Mp8Vp+sksFyyg3MMA0G0iIIwrE3FxN/NGKMlnQR1+P1dnx4
	 m8rlpo2l4rfV0njrxMdRkhzlc9xrzqh+jQv6scVo58K7YcM+6UmLSQ8bz47VfBtdveMTp
	 JIJEAVhUKUNvFZgHvEDYGxsXAa4/EdnuEUDG0/jU4dPEVuBUgYNApQPLS4is1E+Dt7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8ebf+74;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28C1606A330
	for <exfat@lists.linux.dev>; Thu, 19 Nov 2026 17:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A28C1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8ebf+74
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so4220497a12.1
        for <exfat@lists.linux.dev>; Thu, 19 Nov 2026 09:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795109667; cv=none;
        d=google.com; s=arc-20260327;
        b=DLiK8TrWHCquDPZ30Wm1uw8yZE3n/3Dgv6leFBuHhAN4WhWNkIdCUSmI8pX9gRK789
         RoAZQHHeaFusAu3LtaHBEw24Djx/bPBzFGcaCMhBLQGPkOmIc9ONk7R+5GTmmsAP0IMX
         8BsIbi5Hh8Tg2W2FxwZWL//ocyr9yQPQ1Xy69cB12PUGBYMfaN1+hFPcFTlRR3MR8ykS
         gBPNxoEooHSTJ3Xf073QTjOxkfZyzGIi1f7qM0mTRMeeVs+DJkwwApdKpx+1y0lqpR9F
         2KNbeJxLWzPIHWaUOHHOVVW7/366/uNSDuf1NMoPlYCh6quVVTfpi4QWh0cO8ws0R6kR
         y6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1EYDKjHcJ1IGh49gGW/JeuREp9e8GQDYfzpAeI0szc=;
        fh=hPrHt+OMWiZ5RcST65UyiEZKUc2ImjakzrSFpd5AyRM=;
        b=kc+n1htvZZDBrFba5TvcrY5fHf/eOssUvgFiFIx50MiLgjJQGxjupY13lzM7IyE1F9
         ujuOxtLUO4/N9JbDCMUCqdJpfrrmWHGxdMCPNAA06FdhsRVBo+Dawj/yLemYyECPdW7S
         GEaxOGmMheOvAkmVMkNF1XM9bXal2TrsnfeXV2UE6FGWj7WTTIYLYlpbL7hWoyBgd2tU
         udFaOgnAbPUspuMBZ0gyLhK5D4gpoVkrh41U29aqNbsLqB0TTzqcKWuV6x3zslkOVRni
         vGSIT79N2PYGpZDYdWdLi01XiNA5f5HoB9aZ82Tx+ZbUL8kC9bab2sauOjYpfYAnn5ve
         YrVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795109667; x=1795714467; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1EYDKjHcJ1IGh49gGW/JeuREp9e8GQDYfzpAeI0szc=;
        b=I8ebf+74NWTXhV1uOxx+PK6uOE8+w4xF6Y+ajETKb6ZH6Oed3RVNpRcreUSBdPF+6s
         KJJ1OSZnI8tqZBuxTgiwreV4EZJYRsxB2MKaqaH9flB968rtPRKyl1xjguizs2dgpvBt
         3Jny2U0T2rIIEX/eaIZf9KAl6yE8PuBs6EZZehrmmnsJObkOPiMg+aGyefBjLXbmyGgi
         ni6EyUqV+wTK0VRLXBiYeFsEhr8gbU16L+ymYmuon8eF1aCwROKu05xiutx3Ji8ZQBLp
         YqFhZn3Fl70ldbDzwNDTQTECBvwcWAFskWYEteBxnR5wMFcKE3IKyC7N+B3IfcEcU1EW
         S6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795109667; x=1795714467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1EYDKjHcJ1IGh49gGW/JeuREp9e8GQDYfzpAeI0szc=;
        b=qQvFGKauPLcucoiAO+AR82iXjJUMgcxqOX3yhIHMaTpO9nC7n5//r2ydVdaFJj8V03
         6zbY9Rjyk5ZDdzro9z5j68vHLGWSLGdrZ1NN72V48kG+0SUlMTVj4JjCU5xj8ufYcAr2
         dnXG2LjPHLUdCUTDBO4KdjsIEwDNLgWNKbWHzXsfjQvL4mK295ELOpXd3v60ekRBiGbp
         aop72UlnVY4riRcqk/ngzDvVGK+4wx7wLVjiC2iT/KKUz29T4L41wT4UIouB3qgaJMzb
         +/tJPlSmPXq/kJb7xXt1RWhtq0dDv9687z+GLsf04eun0Kvk2pHV16dSxWPHqpy9gN3K
         O9gA==
X-Forwarded-Encrypted: i=1; AL+hErFBPucOpYYUJW6QURNSocD+Bux/xUOEGXDZgqx3DG9CSSApADq9NrHLTvaA9rBW5+jWYV0DQA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9FjOqacVD9ftsZ5W59oQbD9NxRmfhcClNCNdZm0wvYoQxyLhf+
	IhJbP9q5fO4PkJj1FbjBRZoXtewPqjua2Pdx4VM263aci05lQ4WkwPwLV01+lgDVAL8g0WCzyZv
	Ia2nsf7m6ialnJp0wNO2c4F0BEILWP1A=
X-Gm-Gg: AYBFou2nCzYpyMMO7pXIUAfNu4TEHaG3++YdlzxgCqfnvi0Utshro4BzVoqoNKuzp/M
	HPJrqC42v3o1ZRlmK9Gs2b9bVeRqG1kYAxhMKULEOxGxgrvDzwYfuVWIn/RSN0m3TUjJQVe6R2s
	6Z2kTjv1P70LDVBgoKVXYgRwbEpUqaEoWUDIRUCPzT6x6rH91UqfjArZByOGJQYR2XLw087NS+1
	QZej4WtLViM7OszSKn9PtIhC2q0oPN9MfuKCO3nAMeYhUYrHhWLrg+kXGIr9TW0KbqX31j8s4w7
	/w+y6AuK8jMi7a/9fxFz3XHxnsAKxMQ3l6C0VxtojmZHOjkbzdICMtO1haiN3PDxDhhHLjwflh8
	40yJQbR2/ATr0J+zoaow1KgUODIfgp+doasu/hnDO/ejTQBYMfJsQRAesbTCCOZ7BszS9Ug==
X-Received: by 2002:a05:6402:70c:b0:6b8:7d98:4826 with SMTP id
 4fb4d7f45d1cf-6ba37d5bf0amr50117a12.11.1795109666761; Thu, 19 Nov 2026
 09:34:26 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-10-koray.fra@gmail.com>
In-Reply-To: <20261115180343.576773-10-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 19 Nov 2026 18:34:14 +0100
X-Gm-Features: Aa3M54rix9St5Car4447U2IPLFR0HdY95bNJiBlGTi0-FAZstJdvxSGCP5IQDxw
Message-ID: <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>
Subject: Re: [RFC PATCH v4 09/10] ksmbd: add provenance time (ptime) and map
 it to CreationTime
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Implement provenance time (ptime) in ksmbd, as introduced in a
> previous commit ("vfs: add provenance time (ptime)").
>
> Map it to SMB's CreationTime, making it settable by SMB clients. When
> reporting CreationTime to clients, prioritize ptime over da.create_time
> memorized in the user.DOSATTRIB xattr.

That doesn't sound like the right thing to do.

If the server stored a CreationTime that client had set, you cannot
override this.

When the client sets CreationTime, the server can decide if it can and want=
s
(may be a policy decision) to store CreationTime in PTIME and not store
it in user.DOSATTRIB.

Fun fact: the user.DOSATTRIB format also has a mask so storing the
creation time inside it is also optional.

Thanks,
Amir.
