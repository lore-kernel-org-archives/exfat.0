Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF1B3BAD9B
	for <exfat@lists.linux.dev>; Wed,  7 Oct 2026 04:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791348892; cv=none; b=qyQ2+4sOUZVTk2GcjORsOJIV1dGKygANywGgk3xTSkcDi1U3pFH0jRX5wgneCS3vDhwi40EF4OoSYv93eF+7FWd8IitRBPzyTvoOqnqcBebNixeCoyjieC9bgfsC3vJtSY8j7aa96RjvowD3481ERQkhVjhh4JfF0ZxhDdRVBjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791348892; c=relaxed/simple;
	bh=R4gxAiy2cYP4HjSob6btlec55W1JEftO29AboCedots=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJllT5xgfh+GuLpQpPAp2qb/J3UcSyQ7SM4Qo0s0OdjhMRUqCzlfJurGFnEfpTg2hj+EmnqVvYLqHvcgxwP9vR+wXG3jhfPhOjWRSlvURA9EE5tMCI4X8AJkIDnY8g4cynMfj2oJs7XPL++TGTU+yciIzKE8gunuMLljahwPq3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5jaul2f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5jaul2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F22A1F0089E
	for <exfat@lists.linux.dev>; Wed,  7 Oct 2026 04:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791348891;
	bh=T2jk9xEUwiDWFHfF7VDejdB8L90v70T2lBCf/w8ZGHg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=K5jaul2fphUpM0dOMlL8eeMhjQRQZUCm5HGXOzw3EjLMtu+7+HfY3Ob3RSVRkZeG5
	 N163ct4hYUCfaZsU3l04YpaKGEU3qMRgW2MNVxmPb9wjymyRPIJXN+6uFUBW5g1Mz6
	 SlkHGoTFx64Ar+7ZeP6+hBzWDYb6bm4yFiaGIt2BcUPt7XEFX7h5mdDNIEh+ygGdDX
	 12nbFRTeDg6p1FqnPaB/9bmzQz2B4emQpuVjgRnyfumk8T8ffOjMGsCdu+hJ7hqeRK
	 9BdqeauiHm3eF7dUa98+z3Nx0onCDtwXljy2Zr8fUzWsNca5RPLaqA+X7iprw6R0JS
	 RiKIa7/YVWeYQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6aaebeadf3cso2518782a12.3
        for <exfat@lists.linux.dev>; Tue, 06 Oct 2026 21:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz9dtHU3F0X6zY8W7rG5Qe5VSauHnpzlt1Euoo5gK9F9ELi0DybEGXSAFIEv6R2TYpRIGyX8g==@lists.linux.dev
X-Gm-Message-State: AFuF++mYMTG0tXykqwUxU+lAR8N2pinpeI0OCirOgUT0e7KwzaQntTqB
	fGqSzjK5ItgWcCNSxaI8ydny3QEYNeTepmtFZvXs5V1t3nlQg8DMmiNJDvDcCSaSPVtqXzA+npz
	/YlNIQGEmH8Cveqw4AiB7mKWH6l8suZU=
X-Received: by 2002:a17:906:dc8d:b0:c26:1648:a065 with SMTP id
 a640c23a62f3a-c317bf59dd0mr107496266b.32.1791348889771; Tue, 06 Oct 2026
 21:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004135638.1888530-1-anmuxixixi@gmail.com> <20261004135638.1888530-3-anmuxixixi@gmail.com>
In-Reply-To: <20261004135638.1888530-3-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 7 Oct 2026 13:54:36 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9xR8URbVbf6+yvQc3MKBGuzNc_8N8WW4DjpyjLBW+Xtg@mail.gmail.com>
X-Gm-Features: AclHuK_jlgqNw8J9J20L0doQoEPpwY7vhQahkbwZILi-EzvIQNqo9U2hgj4rwdE
Message-ID: <CAKYAXd9xR8URbVbf6+yvQc3MKBGuzNc_8N8WW4DjpyjLBW+Xtg@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] exfat: retain the next empty directory entry hint
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, chizhiling@163.com, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -309,8 +358,9 @@ int exfat_find_empty_entry(struct inode *inode,
>         hint_femp.eidx = EXFAT_HINT_NONE;
>
>         if (ei->hint_femp.eidx != EXFAT_HINT_NONE) {
> -               hint_femp = ei->hint_femp;
> -               ei->hint_femp.eidx = EXFAT_HINT_NONE;
> +               if (num_entries >= ei->hint_femp.min_entries)
This size check does not establish that the hint covers the beginning
of the directory. exfat_find_dir_entry() can start at hint_stat.eidx
and return a positive match without rewinding, while recording deleted
runs found only in that suffix. later Bloom-filter miss bypasses the
full scan. This condition can then reuse the suffix-only hint and skip
a larger free run earlier in the directory. That can cause unnecessary
directory growth and, if growth is impossible, a false -ENOSPC. Could
hints from partial scans be invalidated or marked unusable before
reuse?

> +                       hint_femp = ei->hint_femp;
> +               exfat_invalidate_empty_hint(inode);
