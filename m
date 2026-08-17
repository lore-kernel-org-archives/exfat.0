Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D56E3B0584
	for <exfat@lists.linux.dev>; Mon, 17 Aug 2026 07:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786951081; cv=none; b=iwreaEnOIVsPABS4X//x3EU129pAVTA9Ov96S4Gr3dQyDv2w19q5yt2pkr8DgcPkWWYAn7U0slYYtNLZSfX18tClhXZMMyShRH4E9wvV7gq23neTX2ImuXre9xXkEwcY+QcIWJ87edBioJkgnO0bDLTF62lUThC+ODCLcDQoLog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786951081; c=relaxed/simple;
	bh=0gDCLtz47xZXysq9Gxq9R+G15emJiFbTbmnu8EqMgTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXjOiq/pfqKnDG+d3WN2PABxc/mFKYrHvAxQrdFAFNbQmsqq5ptzzCHyzznQI+2t/4pO2h+8lqhwB3RZmCo7xlS6+TX6AI/dFRVDnhHWFgRba0faUZRrmEsa2GivLkN1KfeBPDYr4/dsNOPDv4rpgG94MADSig/5cTU5yEDk56Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeCnIhtt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeCnIhtt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A49A1F00A3F
	for <exfat@lists.linux.dev>; Mon, 17 Aug 2026 07:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786951080;
	bh=0gDCLtz47xZXysq9Gxq9R+G15emJiFbTbmnu8EqMgTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MeCnIhttX036tgcGMX05cit4RDXg1KXWFsxEDvkqFa/v6NsYFGRUfqMiotVB43SoD
	 mPQ7QSIPa3fvywfxdcjBl+TeWMtXolKI1RyFHSZAzVOeONsjspggTXRMs9dubzYE++
	 2Wgu/BJXa+c4cW7lVMvcvV9B9jMHLardzHFRUxVLSH6EeEaftbC20ESfXr+JxVSgHu
	 FnBBdrWp1ofDN027QMTLb0wCYrF/p6wRy5o204UGDbbDb0EORJGaConha6su3LGM73
	 WiUXI3TSj1++ci8TUtv8QaIEU/zhFdEsnvsj0xN0hhvUkT16BS6mK86cI836eBbPKj
	 TLSJ2EOPnKJ3g==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c167aa9500dso428824166b.3
        for <exfat@lists.linux.dev>; Mon, 17 Aug 2026 00:18:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YzWxmAbRYUmz/2BDhMIJz0fVF1OhCTXiQQeGM8LRQiDRyCCspzh
	K6wZ2n6kgJe5w7+hweTYekNnwymuDsHBeqfLt/iYprSjXIFHJ0kB37iLYvAc2LGaEUvEZRD7DTZ
	mWHhemmOGBIwgslieYf9YoxnLQcLN2hY=
X-Received: by 2002:a17:907:eccc:b0:c21:752f:c44e with SMTP id
 a640c23a62f3a-c21752fcc99mr189355066b.16.1786951078717; Mon, 17 Aug 2026
 00:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817062033.440506-1-chizhiling@163.com>
In-Reply-To: <20260817062033.440506-1-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 17 Aug 2026 16:17:47 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_D4-hGgY-VrYS2HjB7C96GXpMk0xOfmddEQ-=Gy-D2Yg@mail.gmail.com>
X-Gm-Features: AcwNN1VQorgs9IwN7-E-5xCxNbsLNYdF3L4KMVhZZ7IwX5yfKqoHhEffMhQ1Og4
Message-ID: <CAKYAXd_D4-hGgY-VrYS2HjB7C96GXpMk0xOfmddEQ-=Gy-D2Yg@mail.gmail.com>
Subject: Re: [PATCH] exfat: replace truncate_lock with inode_lock
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 3:20=E2=80=AFPM Chi Zhiling <chizhiling@163.com> wr=
ote:
>
> From: Chi Zhiling <chizhiling@kylinos.cn>
>
> Remove the per-inode truncate_lock and rely on inode_lock instead.
> exfat_setattr() truncates under inode_lock (held exclusively by the
> VFS callers), and exfat_aop_bmap() now takes inode_lock shared to
> exclude a concurrent truncate, providing the same mutual exclusion
> with a single lock.
>
> Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
Applied it to #dev.
Thanks!
