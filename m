Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C86F3F44F2
	for <exfat@lists.linux.dev>; Wed,  5 Aug 2026 23:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785971634; cv=none; b=ZD/4uFNJVqo/4TR13B/f6iWy/hH55XBtTiweT2PkYJlu1ML25E7PdWsQa4daofzqp3/freN+wLxjn2wMajwMltv0kNyliN4oc/5FzTAs8Fjqq01YXhy6CGW/wtj5XwFFcZ6ZDe7vhLnCVXSarTlPXdCck4CNtI3dTIucC4b4L1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785971634; c=relaxed/simple;
	bh=E94PgGKCoqYAEGHG0OlEa19GndELchxZ/nR+BQDbOcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXeh1FjZlZoFociRwWPm4JEiWzqU8v+fWDevjLXnjlsg8aJIqwkfBdv5jQ+13axI8CRke/3BwglVHzn/93d0NjKLLZd94YLo6s9zH7rw5+doolpS8ILDofkayFmfLBVR0ifdMFgtfhA8UP1QnoHym1vC0iAhI+kfuMhYSHq+Scc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqvlO27/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqvlO27/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82581F00A3D
	for <exfat@lists.linux.dev>; Wed,  5 Aug 2026 23:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785971632;
	bh=E94PgGKCoqYAEGHG0OlEa19GndELchxZ/nR+BQDbOcs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UqvlO27/FqD3JFOzfshqfpe7E/AgpsDqqZNaYrMyKscAjzDPTUeAGzGTBcNXCBqvY
	 4SW9aeHE+y/EXwHjKP3eE+Fl1frQGHzQciz5av/R47kTGC/3G7iVsmSyENa+iNTCcJ
	 1/5QQq+Cv/tZlhOgz70gg8bf3i/257AwLBhiWSwiqIaUWRhpuOFHha/PWgmCBErazd
	 RrMuFyrtU2nuvT6pPQxerKPmtIwpyQPl4+4PxHzxea1un9Uz6pVB3NowKTiWgM/aJG
	 D6Kcdlx7KYcRNhhDmeD1LhmUBqm3ZVJrRusW43uuFnXmwSx58JJFLpMvXLyzcCjLUZ
	 /p7s0YQoLYG5w==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1fbe461f59so243043066b.2
        for <exfat@lists.linux.dev>; Wed, 05 Aug 2026 16:13:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqEe9KepTQTCESuLyXudKU5uIVS+phQQu1zvh0lGk9DFTtF85LbrvYa4e41y7RZDD+8oVchag==@lists.linux.dev
X-Gm-Message-State: AOJu0YynORVh20z7NSbbPiHUEmOBtN+WD9owtvkN3NgHwMkMO48hOMCy
	IVJNHW+VdYhkZ6bzidi3vW7DqtLLF98HEkttCR9/iJ1comHAyCoPy9wVrtZXWOweVv5oyzfNHy5
	f0vCjh/dz1crHgntdj2R6+7wetrpg0gc=
X-Received: by 2002:a17:906:f595:b0:c1c:5ec9:1968 with SMTP id
 a640c23a62f3a-c2039f93fa0mr498160866b.29.1785971631532; Wed, 05 Aug 2026
 16:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728150704.314251-1-anmuxixixi@gmail.com> <20260805151335.449285-1-anmuxixixi@gmail.com>
In-Reply-To: <20260805151335.449285-1-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 6 Aug 2026 08:13:39 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8b7VXbgz2vnZb3DnaPYJhmfGUWwWnaVkeqABgGwLg-ig@mail.gmail.com>
X-Gm-Features: AUfX_mxwZNYmFVAaHx3hBbBAh9QXELnflFvBeJprsCg_0FriHj4Ilxza7A3b9BA
Message-ID: <CAKYAXd8b7VXbgz2vnZb3DnaPYJhmfGUWwWnaVkeqABgGwLg-ig@mail.gmail.com>
Subject: Re: [PATCH] exfat: fix overflow in cluster-to-dentry conversion
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 12:13=E2=80=AFAM Yang Wen <anmuxixixi@gmail.com> wro=
te:
>
> Hi,
Hi Yang,
>
> A gentle ping on this patch.
>
> When you have time, I=E2=80=99d appreciate any review or feedback.
Sorry for missing it:). Looks good to me. I will apply it to #dev.
Thanks!
