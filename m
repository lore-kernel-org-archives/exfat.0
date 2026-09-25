Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09103BCD21
	for <exfat@lists.linux.dev>; Fri, 25 Sep 2026 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356053; cv=pass; b=b/3AhsEU8BxUXTfMO4vZpee0GIzy7aMmpj2lNewodt1dald7UpByHBiPXLtkJzJ4DYpZuDESWj8FQ1r358Vt/xt/ASOrx5Ktpm6SzyIbLkUslLhdZCreppjstWJ4mVfshRChEoqFnxwnI1qFQE6ekqd852DTwGg/3TkqZwdRe/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356053; c=relaxed/simple;
	bh=Z/QlDjEqmTsvd8hmVsRhjPJAPZKduCsAshcn9SEcHsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEayEA4KHzXigfPnJiuEXIDBXP3ZhCcYax5k47eGY1+vo/jheDOULtjzJUT7tclblv5w+Nb6GmPYgSmEwQNCwOfrPrvywqlbt3qWRz32xOVCYSgEgAioGzKK3XKfNnXL00VsFP0CwG9l8lfzSBU46+sHUbeMGTu8t4XNCqiH2FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=XNzUdmCp; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="XNzUdmCp"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca06a25so5145605ad.2
        for <exfat@lists.linux.dev>; Fri, 25 Sep 2026 10:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790356042; cv=none;
        d=google.com; s=arc-20260327;
        b=gS4L/CeJBie4I1hi/9ALTaZEyh8xegZMsd8QW/vQjRzStManF79fEN6HiGGMD3xSGu
         OULcMzEk0CBe7o7zr/PLO+gwmrPeNgGDBWpejELK6XvaOFLA21wQFsmki/oHgh0Ucksq
         wIHnRMkvpIE2M5p4J1aDy8GCXxBIwN6UvAYTw8qLO6yQDXzE+ctCynmJpDCJaRj+gDhq
         UcMZJjANFWzdK5QjM9kX/w6illpQ1Ibx7mSp42/Yd36UJX99dJJxoussdC6e55c/wAqY
         bPt7ZzLH6bQ1kigHGOtqZHt0u5FJX4Y0qMRD0/M6+UlZeMtFXpvDtkwIhzqFsZfB+RE5
         qI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        fh=NmBhYaZAw6TcmMoSislgxv50/yf90Wa/HNfPcaPUk3g=;
        b=Obq7x3wK3K/mrIsKAZUDzn/dmkdQNKqqwYfslQwC5tAR/wZx0jyLutJDZUmtWw1WWb
         /63tbmaalTbg3x0EZNqkToHbLHr0bK751YYWcC9MR9TkXTF8aV8JUjd7Zj5/kM1XEazL
         xDXpkEahIiOmoyd56ShIGQLrxs4zP+G7hzqEnKTp5mxiwzbZzNZO+Xftt9RuIfknu6eP
         avCUenuHlN6W0B2//ORNoxsX/5ywTo429lMzStzFVrYxfjptTI8D9tcyqBI775ErhTJO
         I6ATm7n7uWa2bLENoijV4fOcuELmgg8wPIfVZngZsqGyhqbRCsjFZrwqp93nEDIO3hjb
         FXEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790356042; x=1790960842; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        b=XNzUdmCpnd1ky36YmO7X604JgVUPNvaQIjSba1rhMLZp8b7A23jp9GfXpAaunHzp+u
         RhJ8/R0ms7rIJXHT32bAkPuJ511YQjBsWEsr9NVaiNrwLmegSaY8ETh4G7SZIDpw6a3G
         HLQIkaLbSTbnhlqS23geQcFGca025RxwAKtSLnwRJTPK4MsG/e41JVkXI0l5kOoqOxcW
         Ot5KA1kx8BdjqMqYh1k7bV/6JzENC9xrb2pM93sFd8lt3FPWBR5L8NnFU8+IvI1sw2oW
         uiHON8+ajIN4JmtVQ/wOjlDDYcKyoyDprNBgvoYxJMJX3NKBwCluVoUOfVV21MVjlVoy
         q5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356042; x=1790960842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8YwzIASUiQRwU6GfvzkJObDJseuyBEMVP7g4XrNm/58=;
        b=sgvaV4iGus0S868cZMxQf61zfgYQcNbrvV297QV6NhY1NvWkpUt2dOfeHi5LsAg00P
         5jILN+xlVEW6tLJS5u9hS/ZXdm6xfE8v3Y6fNU2YOj6zpXqQJleGNfD++Qiu4wWWwt27
         TeburbahymGrcPaabnWvakJpCDvZczHcFeHoHym8FeXBoaOmfXdzLZgFiZ+hGNSD9pzK
         J1xqhk1I2QEeAHyyDAQxPl6w6+bzT5yTR0ODOucmABr36yJeaopyLMiNpCv1NMPvbu2N
         cUUaKc2TTL4MJJQx2wkjOa4K6DX+f12wMqmuPO+vvnLEpKLmeyHqdI2dfgyO7u/uUNJE
         HnVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEO1/LYrcAFffXRuTsRAAyMXHUyu/xYXC+jrtRT55zCPgMroXMwJDLyhRxUPRO8HKBVNWGww==@lists.linux.dev
X-Gm-Message-State: AFuF++n9ZVVzbJTVTNoJAFoAeVP+ADwlbNafJVPsO4JjkaHwd0xqIc5o
	g7mXi1J3b/Oq2FRiHe3R2mFokka2l8TrNawUuXIQhSJPa3leA9OapmiPD6tw3VHa5hfWt5ZLZdp
	go0L9TjXxNWmxu9gKN9vA7vAARvgv/B2qaQZA/51B
X-Gm-Gg: AYBFou08voBLIEc31B1eC9AGx+YUOJTbSsN00aWAJkSAadICEatJ+J8cvvLBoLHMnng
	WmQOUjq63yN3+fo6BZJuqGKbPXNTR/nAAZTPZLnVpgdFRqOZ0AoCE4ig7RLlzjTQXV4su0SopsO
	7gc8NJ4ASqbdyralNkBlh65yjgZKFv1jIsf7MwbzC3zP1BORYlPXiXPfnFJlIQI2VKPpjChINjX
	TVyE1T0BU6pM0Kt4ZY37SaOiRBvuBjzsrUV88eI4eTBiLMKF+XibeqsH5AuKrKoewTyaJSKY7yB
	1MLj4bJYql19mDtKAYviEvTHS8QOZZ/F2tO1HpTPZQLYFr+bZSWktKGNMRcYqEhUSeHZzVc7Kvy
	tSDVfoXFfqh6sI0QMUzYHmA==
X-Received: by 2002:a17:902:d48d:b0:2df:99e6:9448 with SMTP id
 d9443c01a7336-2df99e695bbmr12902675ad.61.1790356042370; Fri, 25 Sep 2026
 10:07:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924104831.1081137-1-caixinchen1@huawei.com> <20260925-zahnersatz-hielt-lerche-141893658522@brauner>
In-Reply-To: <20260925-zahnersatz-hielt-lerche-141893658522@brauner>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 25 Sep 2026 13:07:08 -0400
X-Gm-Features: AclHuK-PYyMWIn_xv6i13K6lF_3RP26uUOO_mtAnUMGHNcMrV5ydBitx8qn_ri0
Message-ID: <CAHC9VhSeXmOHvioZ12aVmnOtpP52-G=K_jS3K0fTSiCrDHStPw@mail.gmail.com>
Subject: Re: [PATCH RFC -next 00/12] landlock: Add READ_METADATA and
 WRITE_METADATA access rights
To: Christian Brauner <brauner@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: Cai Xinchen <caixinchen1@huawei.com>, gnoack@google.com, jmorris@namei.org, 
	serge@hallyn.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, dlemoal@kernel.org, hch@lst.de, axboe@kernel.dk, 
	viro@zeniv.linux.org.uk, jack@suse.cz, dhowells@redhat.com, code@tyhicks.com, 
	linkinjeon@kernel.org, sj1557.seo@samsung.com, yuezhang.mo@sony.com, 
	hirofumi@mail.parknet.co.jp, cel@kernel.org, jlayton@kernel.org, 
	neil@brown.name, okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com, 
	miklos@szeredi.hu, amir73il@gmail.com, senozhatsky@chromium.org, 
	chenxiaosong@chenxiaosong.com, zohar@linux.ibm.com, roberto.sassu@huawei.com, 
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, 
	stephen.smalley.work@gmail.com, omosnacek@gmail.com, casey@schaufler-ca.com, 
	nanx95726@gmail.com, djwong@kernel.org, daniel@iogearbox.net, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	netfs@lists.linux.dev, ecryptfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-nfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-integrity@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	xiujianfeng@huawei.com, lujialin4@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:33=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
> On Thu, Sep 24, 2026 at 06:48:19PM +0800, Cai Xinchen wrote:
> > This series adds two new Landlock filesystem access rights,
> > LANDLOCK_ACCESS_FS_READ_METADATA and LANDLOCK_ACCESS_FS_WRITE_METADATA,
> > which control access to file and directory metadata such as inode
> > attributes (mode, ownership, timestamps), extended attributes and POSIX
> > ACLs.  It picks up the work from the "landlock: add chmod and chown
> > support" series [1] and follows the coarse-grained grouping discussed i=
n
> > that thread [2]: instead of separate chmod/chown rights, metadata
> > operations are grouped into one read and one write right.
>
> This is mostly fine for me. @Michael, for the fs side of things I would
> give you a stable branch vfs-7.*.shared.landlock.path that you can pull
> once this is ready.

This is in my queue, but I haven't reviewed the changes yet.

@Christian, I'm guessing you will merge patches 1/12, 3/13, and 4/12
since those are the VFS changes?  Once you have a branch for that, and
we have all the necessary ACKs, I'll merge the LSM changes in 2/12,
5/12, 6/12, and 7/12 and then Micka=C3=ABl can merge the Landlock patches.

Are we all okay with that?

--
paul-moore.com
