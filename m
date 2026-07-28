Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4836417D9B
	for <exfat@lists.linux.dev>; Tue, 28 Jul 2026 08:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228691; cv=none; b=mhtEtRQdIDIlZFuO/L/5rG6J/htTHnfvWz0HGONkxf9f7EtfBLkbgr19LxjOFbOHOalLJeldS7izDYl6KaPh1aL29Kj5kAMUyJRmfCd6sHJ9v688KdknfMNUo4KynsiGrzk7DgUSFsMGeo5gYtdS1I4KmGlBind7Ywai+OogMRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228691; c=relaxed/simple;
	bh=y7i305H/DPjo/7bt+zRbu1BigXLGAnwZrUcD8cItSkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjHjAD+6OztYaWfaE7VPoZPvl1DM2iwcos+jTY/zgfF12XK6oWm3LEMRgElmdO7qv8EKAkCxSb5D2MwJh9RGFiU1auSoelJPofYhiMKQLwN2OTYc++QGiY+DIljhhOkpsc8WRFJoVUFxM0q3mANC/utD/9IoE4wYC5oEjoRaArY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNCbRaJM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNCbRaJM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD3A1F000E9
	for <exfat@lists.linux.dev>; Tue, 28 Jul 2026 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785228689;
	bh=VuexicYPd1TqrWIOvn8YO5qrU+064nXn/UTCacfYNUc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HNCbRaJMxKTE+JzIMQhZzwzbg6IPBJbQAFfUNDP6AsqhJAkNNW3ckrrY93NM1W2s+
	 vxc6Fh/1n0DklqJ09pzvatzuw8kVrH4bAUyL8lZNrmIfB4i6xdduLrvyzpARZ/q6Te
	 mnS3LZpjlTe+oFRzCbHVUion93uwHjyaEvBsnSPPp06sy0DxqwFqzmo38S3x3ByY8/
	 lp2ltS0izpyU4iNOKCRyJtZHaw5LhZmBepKc/l/FRPzJ5YXjDbZWf7TVtSacJcmQ22
	 A8bAgD1aTSs2yZkmWF5Z8X0Fg2iQwz6c1GiEAUd6Ya/+rzmAqIJR8OKr70tfU7vuiK
	 3aYfvHKPV3YDw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1f7666a90bso38104966b.3
        for <exfat@lists.linux.dev>; Tue, 28 Jul 2026 01:51:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqstz023SNDVOMpEVhupvl7ixpsaG3ZgAMe5Wrni8ITZBpTTxk5uSr5vjErMXD36gaImTfEfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpaCdGKho3WoAPiCeCAcVHyDZD0lhQTuLwK6Jt/phnmrd0Ihzm
	uQbNOULOiufyoQLPAm2StoW/sYepXiVWlGk+i32Aso7mtzx4NfDKr5yFUxs1Jd/CxOJ9TNZy+qm
	mxuUlyj1WdZGmb/fAXTOgI6emQqjuJnI=
X-Received: by 2002:a17:907:5ca:b0:c1d:fb29:1f03 with SMTP id
 a640c23a62f3a-c1f7223e6ddmr64521866b.36.1785228688517; Tue, 28 Jul 2026
 01:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728042923.408237-1-chenyichong@uniontech.com>
In-Reply-To: <20260728042923.408237-1-chenyichong@uniontech.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 28 Jul 2026 17:51:16 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_8jbP0nFq9tcf83yvvYHYWP5JCz6DytJQZCcfHdxubfA@mail.gmail.com>
X-Gm-Features: AUfX_mzvKoVFouar66fCjORkMhJpzufbjXQgWc8DKnX3h5McsRbcJBx1mnBbNCA
Message-ID: <CAKYAXd_8jbP0nFq9tcf83yvvYHYWP5JCz6DytJQZCcfHdxubfA@mail.gmail.com>
Subject: Re: [PATCH] exfat: free new directory cluster if zeroing fails
To: Yichong Chen <chenyichong@uniontech.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 1:29=E2=80=AFPM Yichong Chen <chenyichong@uniontech=
.com> wrote:
>
> exfat_alloc_new_dir() allocates a cluster for a new directory before
> zeroing it.  If exfat_zeroed_cluster() fails, the function returns the
> error but leaves the allocated cluster in use.
>
> Free the newly allocated cluster before returning the zeroing error.
>
> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
Applied it to #dev.
Thanks!
