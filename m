Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D207C2877DE
	for <exfat@lists.linux.dev>; Sat, 22 Aug 2026 00:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787358997; cv=none; b=rnV2I0a5EGXhrnpN8wVvG0+bp6iaoGbzBNWR3Cm9mOP/OI8onMxPS4ji2CKIAncYuXXrohUBgQgvpvld6pcgu1iGzvlSxAnzb5XHerahLlU67j/Jt9+ndCTWE5oz+0upjStd1YM6sAnS1YLbx8Mac9jPIvDDR1xM7SgOLOrBmyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787358997; c=relaxed/simple;
	bh=lhu9DyCtcc1dpk8vFBLUNR7CbT2LZLTQ8O++IAXJWlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M83uRKb53gxYvHL+prdDSsq09m4humEwOlWfS1+JdEWQlvrcasqWb976gB+kXSPkw6cn/i4i/8Kl8GaUrX86JzPAlShFxqEnLMwLKCMHzsNGkq6LwGs4OhyXgLIou691M84yG/zGOteiB5qlFG3hkg86uhlI4wUIsDSv2AAtHrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMJRGvOk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMJRGvOk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E7B1F00A3D
	for <exfat@lists.linux.dev>; Sat, 22 Aug 2026 00:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787358995;
	bh=k4ZQ61PyFbF7sVEYg0eY1Eb3XXCX9iIUGWxyVYm8Kg8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nMJRGvOkejsfi6kRaFizRnoWhX9r9bUnXzYih9uqd3k15u+86nSJVsdXxRSyGfhJM
	 2HIyNpoXc99z9m881TQ/zHZNo6hDYKBXeRpfBbZorP7uu1BS0aqSGMQk4h2YxESciQ
	 qor+Xm0yO4UqrZGqko1LbC7Y5Slv/9RlGvYuBArY6hhkPsTK7snnzDmTVjSRhnwE2v
	 UAYNGc0F0LMKAwpsvZbps0Im7cpq1NNcaWJgCRNeA+vV92UPlw0ld66Mv9XiTRg4v/
	 3xudfnCLwZpVK4Ubi9qCnhl/nX9ri/YqUuGEbxckpIXqXQCypho+7Q7x2cXgo3Etxe
	 kdlUXPF2rpjww==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c167aa9500dso250837566b.3
        for <exfat@lists.linux.dev>; Fri, 21 Aug 2026 17:36:35 -0700 (PDT)
X-Gm-Message-State: AFuF++kslWNItqveCAMyCCOmUNIugDfW/talwRBYdG3F+SY1Dk6zAjSF
	dEa7zUk/7bOq5UL8kOcDGC1oFeqLcbdG/xc1oqNcNENcLdSCQQKqq+GIX36mZaNUFm9IRnaWNHu
	ubmWQbZ6PeySmz57eZU01JCw8mt20hXE=
X-Received: by 2002:a17:907:980d:b0:c20:56e8:5457 with SMTP id
 a640c23a62f3a-c246a359c6fmr921371666b.6.1787358994113; Fri, 21 Aug 2026
 17:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821103821.52224-1-dxdt@dev.snart.me> <20260821103821.52224-2-dxdt@dev.snart.me>
In-Reply-To: <20260821103821.52224-2-dxdt@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 22 Aug 2026 09:36:22 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-_=zmvBtV4HEmF3pADx=joEhiyCgAw_e2m_oGQnNhGAA@mail.gmail.com>
X-Gm-Features: AcwNN1XnAog5_AsbONcoaZEVWSA5B4WcvLsFu8ChyKKKiV2Q_TkeoQdOLXLC83w
Message-ID: <CAKYAXd-_=zmvBtV4HEmF3pADx=joEhiyCgAw_e2m_oGQnNhGAA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Github Actions: cache util-linux tarball
To: David Timber <dxdt@dev.snart.me>
Cc: exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 7:38=E2=80=AFPM David Timber <dxdt@dev.snart.me> wr=
ote:
>
> To minimise the chance of CI pipeline run failures, cache the util-linux
> tarball in Github Actions cache so that the tarball is not downloaded
> every time the CI is run.
>
> The connection to the CDN usually fail because:
>
>   - Cloud VMs usually have low IP reputation due to scraping activities
>   - Shared tenancy makes the connection unstable
>
> Signed-off-by: David Timber <dxdt@dev.snart.me>
> ---
>  .github/workflows/c-cpp.yml | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-cpp.yml
> index d332f04..10975b7 100644
> --- a/.github/workflows/c-cpp.yml
> +++ b/.github/workflows/c-cpp.yml
> @@ -33,6 +33,7 @@ env:
>      1T 2T 3T 4T 6T 8T 16T 32T 44T 64T
>    TEST_MAGIC: dd01aeee-bab0-babe-babe-deadcafebeef
>
> +  UTIL_LINUX_TARBALL: util-linux-2.42.tar.xz
>    UTIL_LINUX_SRC: https://www.kernel.org/pub/linux/utils/util-linux/v2.4=
2/util-linux-2.42.tar.xz
>    # xfstests generic/740 equiv
>    FOREIGN_FS: |
> @@ -188,12 +189,29 @@ jobs:
>          sudo apt-get install -y linux-modules-extra-$(uname -r)
>          export LD_LIBRARY_PATH=3D/usr/local/lib:$LD_LIBRARY_PATH
>          export PATH=3D/usr/local/lib:$PATH
> +
> +    - name: Retrieve util-linux tarball from cache
> +      uses: actions/cache/restore@v6
> +      id: restore-util-linux-tarball
> +      with:
> +        path: ${{ env.UTIL_LINUX_TARBALL }}
> +        key: tarball-${{ env.UTIL_LINUX_TARBALL }}
> +    - name: Download util-linux tarball
> +      if: steps.restore-util-linux-tarball.outputs.cache-hit !=3D 'true'
> +      run: curl -L -o "$UTIL_LINUX_TARBALL" "$UTIL_LINUX_SRC"
> +    - name: Save util-linux tarball from cache
> +      uses: actions/cache/save@v6
> +      if: steps.restore-util-linux-tarball.outputs.cache-hit !=3D 'true'
> +      with:
> +        path: ${{ env.UTIL_LINUX_TARBALL }}
> +        key: tarball-${{ env.UTIL_LINUX_TARBALL }}
> +
There is one ordering problem. The cache and download steps run before
actions/checkout. Since the tarball is stored in the workspace,
actions/checkout may clean the workspace and delete it. The later tar
xf command will then fail because the tarball is gone. I am wondering
if this patch works as intended. Should we move the checkout step
before the cache steps?

Also, please add --fail to curl:

 curl --fail --location --retry 3 \
      -o "$UTIL_LINUX_TARBALL" "$UTIL_LINUX_SRC"

Without --fail, an HTTP error such as 404 or 500 may still produce a
successful curl exit status, and the error response could be saved and
cached as the tarball.

Thanks.
