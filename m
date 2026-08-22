Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28F6493655
	for <exfat@lists.linux.dev>; Sat, 22 Aug 2026 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787386325; cv=none; b=oM0ZET0K5Vt90EsVlvfOHGFNdNjcERpxYDkVsJBCwj30Ok2BKPxosBf7zsnVV86U7wxNU/wrqXiJaMz9eIEmwfAtk6RuDzMjmHcLVPg0nojByHbULTDHlNi4BxXtsk0mCoaXkGP9UN111cE1vK6wQ7p8hDaEcVuVW6qrxaBdoNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787386325; c=relaxed/simple;
	bh=FT+oGf0M8BcXbFkfZqHxpQMXPNVqYZTcrP/aAxB76pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRKqbpp7mODkX8GTeDedgHIfsuTh3isa862fTi+apMV7vt8Mb03F2g4bb2rJECDibfQm0LQLD5Wf7UgrQFdSuxQrQGaWKjNiIPkLZsYE8TFy3ovMHA38nUi1sOkBdjlBpCTtr2wO0Tgju14FexLT5ll1hqAyOejopM/tHRWc9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OoQJSuFL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OoQJSuFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EC951F000E9
	for <exfat@lists.linux.dev>; Sat, 22 Aug 2026 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787386323;
	bh=ZmNB5XTmjiEuhnI0B2kGtY3SjTbBXLrfgeCNRPwOlEg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OoQJSuFLULdIntKNYv0FhXwpN2Sp30ek/iV2rm0ldLDiksiXk8n0rj8G86xJeGA/l
	 2NR8k596rfXpgU4HHHd/3zhpFfmfwHJvoGxyFX/5TEIT9VImXB/1/kovVIKxQ7wW3n
	 aemdtgCMZKx9Y+tByaTdGqSNned3r2SSmqhchGsPr1H7mbQysBv9T0gjINM8jBwLBC
	 wDLMLVhZJU0p6I0e16Ne/9e8toTCy5dfRe8WIdMaAIcPXLqa0YLqvPhwmqBbjfZ91w
	 B8wW+c2Bn/sPqniH1EiyaDQY85rAwuCV/Z7nUlKclu3B0JXNLT2abyOQfMdok10L8Q
	 msF4BQ9LfsNzA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso3130981a12.0
        for <exfat@lists.linux.dev>; Sat, 22 Aug 2026 01:12:03 -0700 (PDT)
X-Gm-Message-State: AFuF++nF52i+RCdTkhhPA4xrjVUnjtBDWt5Y+zhwU1s/mHGE45v8A0+H
	fnYki+5rxsvhoue0qzTSo1Xc93XQt/1A1kqqdVYPL1GzwlWAD+yfWSVOSle3HI8Ehh3tK9khV09
	nFD3l8dkB5x8JXyGX6Qm7iO0687fr5W0=
X-Received: by 2002:a17:907:a604:b0:c24:457b:86fc with SMTP id
 a640c23a62f3a-c246a66adb3mr1358576566b.21.1787386322009; Sat, 22 Aug 2026
 01:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821103821.52224-1-dxdt@dev.snart.me> <20260821103821.52224-2-dxdt@dev.snart.me>
 <CAKYAXd-_=zmvBtV4HEmF3pADx=joEhiyCgAw_e2m_oGQnNhGAA@mail.gmail.com> <53914084-47c1-4d7d-8857-8eaaafd10269@dev.snart.me>
In-Reply-To: <53914084-47c1-4d7d-8857-8eaaafd10269@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 22 Aug 2026 17:11:49 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-TyX=wx7mHVjr9uOL6s964dXDc=jLtRTTr-PC_v7SRYQ@mail.gmail.com>
X-Gm-Features: AcwNN1X9Ng3mEv9_41Q5MCNoO9FaMLwPOH5zWww7r_s1d3RHHNVwNf8bpmVFQUM
Message-ID: <CAKYAXd-TyX=wx7mHVjr9uOL6s964dXDc=jLtRTTr-PC_v7SRYQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] Github Actions: cache util-linux tarball
To: David Timber <dxdt@dev.snart.me>
Cc: exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> >> @@ -188,12 +189,29 @@ jobs:
> >>          sudo apt-get install -y linux-modules-extra-$(uname -r)
> >>          export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
> >>          export PATH=/usr/local/lib:$PATH
> >> +
> >> +    - name: Retrieve util-linux tarball from cache
> >> +      uses: actions/cache/restore@v6
> >> +      id: restore-util-linux-tarball
> >> +      with:
> >> +        path: ${{ env.UTIL_LINUX_TARBALL }}
> >> +        key: tarball-${{ env.UTIL_LINUX_TARBALL }}
> >> +    - name: Download util-linux tarball
> >> +      if: steps.restore-util-linux-tarball.outputs.cache-hit != 'true'
> >> +      run: curl -L -o "$UTIL_LINUX_TARBALL" "$UTIL_LINUX_SRC"
> >> +    - name: Save util-linux tarball from cache
> >> +      uses: actions/cache/save@v6
> >> +      if: steps.restore-util-linux-tarball.outputs.cache-hit != 'true'
> >> +      with:
> >> +        path: ${{ env.UTIL_LINUX_TARBALL }}
> >> +        key: tarball-${{ env.UTIL_LINUX_TARBALL }}
> >> +
> First off, this is AI report? If so, could you please come clean and say
> that the review is AI-assisted? I'm starting to get tired of all the
> pedanticity the LLM is throwing at me.
I am merely asking a question about a patch I was trying to thoroughly
review. Are your questions really not worth answering? I could be
mistaken, and you can refute my points. That is, after all, what the
mailing list is for.
Recently, the sheer volume of AI-generated patches has been taking
over my life. So please don't complain to me about getting tired over
something like this.
I entertained the thought for a split second that some of the patches
might be AI-generated, but I never questioned about it. because doing
so would be very disrespectful if it is not true.

>
> > There is one ordering problem. The cache and download steps run before
> > actions/checkout. Since the tarball is stored in the workspace,
> > actions/checkout may clean the workspace and delete it. The later tar
> > xf command will then fail because the tarball is gone. I am wondering
> > if this patch works as intended. Should we move the checkout step
> > before the cache steps?
> No, there isn't. This is just wrong. libblkid is untared and installed
> to the runner system before checking out. This report is invalid. I
> attached the links in the cover letter to prove that I tested this
> patch(if the reviewer model had access to the links and actually visited
> them, I think Claude is smart enough to realise its wrong take). The
> runs didn't fail and the first run cached the tarball and the second run
> hit the cache and the curl step is skipped.
>
> >
> > Also, please add --fail to curl:
> >
> >  curl --fail --location --retry 3 \
> >       -o "$UTIL_LINUX_TARBALL" "$UTIL_LINUX_SRC"
> >
> > Without --fail, an HTTP error such as 404 or 500 may still produce a
> > successful curl exit status, and the error response could be saved and
> > cached as the tarball.
> >
> No. This doesn't really fix any real issue. Once the tarball is cached,
> the step will probably never be called ever again for the
> org(exfatprogs), unless it's forked elsewhere or more than 10GB of cache
> is used in which case the tarball got evicted.
Okay.
>
> If the CDN is in a such condition that it returns 5xx errors,
> immediately retrying the request wouldn't make any difference. The
> failure mode we were experiencing was at the L4 level(TCP connection
> dropping out or SYN being dropped), probably either due to the WAF at
> the CDN end or the Azure VM network being saturated. There is not much
> we can do for the first cache miss run.
Okay. I will apply this patch.
Thanks.
