Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D79E3515F1
	for <exfat@lists.linux.dev>; Fri,  4 Sep 2026 01:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485344; cv=none; b=SLwAmVjLHurOukLlScK50z/aOYM7UlO0wfT8cTvRwaXaSRAIkJI+6Ub59z6vmdbA/GlZavT2d842jt0JpgWptYwc3zSBHvhQaZEQX72jcLbavFAx6xTGGUFe/OoRS0LKQpUihTE8q8AvXfF4eIf79yTDI/koMawKlTXYYh58jqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485344; c=relaxed/simple;
	bh=pmFrC+y/DhF3xRMyuIC7UaQqu7Rg36dPGDX6Qvvu7vA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acljZ512oSI1Ajjr7rXoz0DPJ5y0FthFLIzh1N50eJNtqYE1jFrvWSKTBQJkK8N+L5nODh2za9NloKkbafJl7l2jozRw9GJb/lwZl9RgDXkzXrVtNVyXGdBYHiHWo6OLY9MTtdNlbypFN0cDg0C0sSrTFADwdF41Zr5TqPmuSzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBXTYxGL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBXTYxGL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53721F00A3E
	for <exfat@lists.linux.dev>; Fri,  4 Sep 2026 01:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788485342;
	bh=pmFrC+y/DhF3xRMyuIC7UaQqu7Rg36dPGDX6Qvvu7vA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cBXTYxGL3OBmFTP0A4mQywDFg3uZ3gJZblOFE2Jbrpc3qUNEwnD7FRCApHQMsQWra
	 2ZbcLUu2LtUsTNkahJxw9O6qZ+eZXscxMsn00DB9C1S8FVzrIrAqm8DPj5fWVEKfIy
	 3ccxkPbF8Obc8RM8551xKo41Ftls9GRqty94478wKojb5fvn0FcgXFqrc0vqA73+Pz
	 b+LpEtFCp0BiIvmThNrFdxbIZRzwI+gX50PgY6TuTpIIXoFpKzZbituDgGptO8n/TO
	 XIWvH+HZmU0njEpX8DEbphPwn8D0gvKVvUdkdNqoQApbxB8Yl4wuMCdVi4qxEzh8cH
	 uwm78k+vQ/35A==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a682579c72so491729a12.1
        for <exfat@lists.linux.dev>; Thu, 03 Sep 2026 18:29:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxt3iuNptwtnmhydUN+MPFq4/aDE0dl8IXmTmA8gfxuwgfy91kvQ9OYb/LIiICoMyoaP1nrRw==@lists.linux.dev
X-Gm-Message-State: AFuF++muXNI19AROpDANvAxvMYD0yGDHcPh+f20Rrj5fbRcXLWNZHIEO
	c48aARxrJVX4AimI586wcCdt9Hbg4Skz/W2lZcWIjKEETXgm+uo6Q5IU7TaUxE0j8eOSz1WGP1f
	v/ZILmxI1A5JLEk5IynOqbUwDsAxGbmI=
X-Received: by 2002:a05:6402:a0d9:b0:6a6:2434:7cd8 with SMTP id
 4fb4d7f45d1cf-6a7e8d255afmr1062225a12.5.1788485341554; Thu, 03 Sep 2026
 18:29:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260902122551.14090-1-dxdt@dev.snart.me>
In-Reply-To: <20260902122551.14090-1-dxdt@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 4 Sep 2026 10:28:48 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-QwpY23ZdQaVro2nTeoNhqxvtoA9oCVbShmfK1B_1qpQ@mail.gmail.com>
X-Gm-Features: AcwNN1UCKdOmJS9il-Em2xpfaXnqLEw65471FcOiFff0rQjMTZRGHwz5WQGDKNQ
Message-ID: <CAKYAXd-QwpY23ZdQaVro2nTeoNhqxvtoA9oCVbShmfK1B_1qpQ@mail.gmail.com>
Subject: Re: [PATCH] mkfs: set perc_in_use to 0xFF
To: David Timber <dxdt@dev.snart.me>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 9:26=E2=80=AFPM David Timber <dxdt@dev.snart.me> wro=
te:
>
> Currently, mkfs.exfat always sets the perc_in_use field in the boot
> header to zero. This is not the correct behaviour since there is always
> going to be used clusters for the volume structures like the allocation
> bitmap and upcase table.
>
> perc_in_use is only an advisory field. As the number of used clusters
> are determined later on during the formatting process, it's not worth
> risking a huge code change just for correctness. Therefore, to avoid
> confusion, set it to 0xFF which is the magic value that should be
> interpreted as "not known" according to the spec.
>
> As the Linux kernel exfat driver currently does not modify perc_in_use
> at all, unless the volume is mounted by an implementation that modifies
> it, it will always be read as 0. Setting it to 0xFF should somewhat
> alleviate the issue because the user would at least know it's not valid.
>
> Signed-off-by: David Timber <dxdt@dev.snart.me>
Applied it to #exfat-next.
Thanks!
