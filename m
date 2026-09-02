Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4652E7F20
	for <exfat@lists.linux.dev>; Wed,  2 Sep 2026 00:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788309651; cv=none; b=SAGbJOoqj1hmqNVPhAr10f75EMLZRcfog64hL3G3HMIpZyx9D7MNrg79jIdi77PNIDr2ARhsv2t0Z+5Hge1OWcCd/p+ambDVvGC6m+xd/GtXoBuHkhl2xc8RpGnzObWyCp0kc9gNGyPyWY2jfEPYoe40ghSwRYAL548qp6COY2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788309651; c=relaxed/simple;
	bh=joyq3ogDBnTcmUoKkIALNwFI63KtakK4Kv3XBQUt/QU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAT7NwNUhQxr7vvOzTMoqPbaYL1FCWW8rgxn1qV5/8/uZEIq+VRlM6QZ1+Wk5IMHwuHbXscU0HbORHn5gR5HWKe8YfQja+pwKjmNQpLB5i7mLnAnnU2CwFv2s7xgEQhwitNLPc8P277vivovskXXjJYqdHThZiXgCzGGTud6OsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zh6NkVCA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zh6NkVCA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9F41F00A3E
	for <exfat@lists.linux.dev>; Wed,  2 Sep 2026 00:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788309650;
	bh=K4GxAYcXkD+UmEpe2ccKV2kgmShQJhDtIfuCrypgjN0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zh6NkVCAbc4XqE5UNRe0w2y+8Z9Ebc1GTkyWsKyLjiiBMrRca1M/YBGQsfo42wOJi
	 IYFLiZg9jb+M1QYAXqhqWm/N7mnI9XTKVIG0S9fD/pmLMkA1t16YIapqAfxViz/srT
	 sxthq5t6zFsx0fWogpty6nXXVyYNvDip+hSirZkL0U3WTeDtRGLIJANhfWjKk9CIMc
	 Ttn1bUmtv65JGlr3Iihcik0X8AIt0D3J2zhXixj03HBTlQ0yTCjEy1C5GOgg5lsS7c
	 dqARnAw6eIvhilUv7Enwrh/tn4Ia7Mzkc6gytaFi2nGmh8SXSJlhlYt1MHTKNsSHuU
	 KoSpTJCT7hGjA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c255c58156bso64393966b.3
        for <exfat@lists.linux.dev>; Tue, 01 Sep 2026 17:40:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrTrG7kw/KITA1SRbKSajNGrA/wlOOpt9EeOf5D3jvbz3KrLdcjVP6Xj/bb1L+Hdoyf8wyf8A==@lists.linux.dev
X-Gm-Message-State: AFuF++m2W4xKZ1c3qIQbRo+l2VqQyJBrlo9i1kKS0olsOY5OnjOvi1ca
	t7vOqSgONwD+gkaXJPoBKegRqXBc9lMEXQiQXCFWrjCuYpGg3Ut5wysg+c6IewFJ5J/ButD5I4p
	n1ZeyaYybnLbuSbbF3G8MDHiEcHO+uog=
X-Received: by 2002:a17:907:6c0f:b0:c24:680b:3944 with SMTP id
 a640c23a62f3a-c25d55b651bmr61771766b.13.1788309648986; Tue, 01 Sep 2026
 17:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831151539.1239134-1-anmuxixixi@gmail.com>
In-Reply-To: <20260831151539.1239134-1-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 2 Sep 2026 09:40:36 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9K2bjm4pyNSQn3NL4EBATxG-k3g1X-MjgaLCwWirU=dw@mail.gmail.com>
X-Gm-Features: AcwNN1UceQIE2rU8l6wNvIKGk4I81svptw9T4tJQFXUE1tXRr2xoGPRLzZoYXxU
Message-ID: <CAKYAXd9K2bjm4pyNSQn3NL4EBATxG-k3g1X-MjgaLCwWirU=dw@mail.gmail.com>
Subject: Re: [PATCH v2] exfat: speed up file creation in large directories
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, chizhiling@163.com, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Test environment:
>   QEMU TCG multi-thread, 4 vCPUs, 6 GiB RAM
>   4 GiB exFAT image, 32 KiB clusters
>
> Test script:
>   mount -t exfat /dev/vda /mnt/test
>   time sh -c '
>           i=0
>           while [ "$i" -lt 20000 ]; do
>                   : > "/mnt/test/f.$i" || exit 1
>                   i=$((i + 1))
>           done
>   '
>
> The measured results were:
>
>                          Before          After
>   real                   589.48 s         5.33 s
>   user                     4.72 s         2.28 s
>   sys                    584.63 s         3.03 s
>
> The elapsed time was reduced by 99.10%, from 589.48 seconds to
> 5.33 seconds, corresponding to a 110.6-fold speedup.
Looks great!

> +                       for (len = 0; len < MAX_NAME_LENGTH && name.name[len]; len++)
> +                               ;
> +                       if (!len || len == MAX_NAME_LENGTH)
> +                               goto abort;
exfat allows filenames with 255 UTF16 code units, but this check
aborts filter construction. Any reason ?

> @@ -627,7 +666,8 @@ static int exfat_find(struct inode *dir, const struct qstr *qname,
>                 ei->hint_stat.clu = cdir.dir;
>                 ei->hint_stat.eidx = 0;
>                 ei->version = (inode_peek_iversion_raw(dir) & 0xffffffff);
> -               ei->hint_femp.eidx = EXFAT_HINT_NONE;
> +               if (!ei->name_filter)
> +                       ei->hint_femp.eidx = EXFAT_HINT_NONE;
There is no path that moves this hint backwards. exfat_unlink(),
exfat_rmdir(), __exfat_rename(), and the rollback path in
exfat_add_entry() free entries without updating ei->hint_femp. So,
exfat_find_empty_entry() can keep searching from a stale hint and
never reuse earlier holes. Repeated create/unlink operations may grow
the directory until MAX_EXFAT_DENTRIES.
