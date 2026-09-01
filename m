Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D37336EA88
	for <exfat@lists.linux.dev>; Tue,  1 Sep 2026 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245350; cv=none; b=E6b3vvovpWu3FacgL/XDyHUybSk7YJaEs2TRiHuzIK9vfixTItMSYqWsgyvYk3kivfmZOf3vp8uMLYQ50Lf6jerD/z369ARFbTxHZ1wzlc1mzUvZj0bvz9C0DYkQBcIOzN887KfgO8kkBH7vImqUXNG+zVoMqlVEbbvZVn4Q6xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245350; c=relaxed/simple;
	bh=axUkuOk5urspDnpuEKWVJVI4Z3Jj0mwbc3OfnP4wk4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1KSh+4Qyo3QPfhX4EbsO/xcBPCf0FJn9np30GC/A6zq4z29QKKFbojf9/oyG1Y8WbZN6/90natpExOtMwwtjsGf6rorpPFiBHL44mvRwLtS4A6ZdMA5kUKn1D4Ef7SGLJcLB1jF8+UtKWIhcWLQoAl11Kt/d5WPX+ojz4IDP4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7UF74iL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7UF74iL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90C21F00A3D
	for <exfat@lists.linux.dev>; Tue,  1 Sep 2026 06:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788245348;
	bh=+o95EY8JAQ3NVUIle1m30oaL6HMQuxo3eYE9711DfG4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J7UF74iLe4kDIAsSzFIVdxG3I2/DcpKPI2R9wDSn+6toNNwAIMGx9JWG9vqmDv+KO
	 +MZ9R7HaVq4v9FVedD9afQqwd//0j/DzKnY/y5EMbzoUE2Z9AGX84K/rj4LG8llDmN
	 R3QGHL/0RMKmUl/y/GZBYbH0Nx0KgBj/GbykjvpGpWH9o82gzx84moDlhzil9W18ey
	 EhfF+YF3sw4XpJVPoKgu+AcZZcNZC3GgtZ1fp9zgzBnhjiBpZYtCRlXjvQWDmD2ogc
	 o43fE8HZyAQChr9LxJR1uj/+VXH+NELmYbG5J9cx/ih4eA5KIbXM2f3wYgw+l0DYc7
	 MQxVSqLKkWhFA==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso5843315a12.0
        for <exfat@lists.linux.dev>; Mon, 31 Aug 2026 23:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVf4ibFHXRwiZRXokfDchnukXflwgWzdtK73vl+DZ0+BXF2mQEQQPA0OEYUh5Oaord/SKnkg==@lists.linux.dev
X-Gm-Message-State: AFuF++lOLxZfO3mAGk4KnLCrVe0HBBUwI4BiGGX2V9q+KsHC5ZbsuEDu
	vQNt4gHEfKSc+uPXjB3+tm1E0T+Kr4GN5gPZic3kZR4aJ+7++cRu0QEx9+3cFm/Zfe36SQSXNgB
	S6NgTyKcKIbranpltZZnwcw5+cZivhgY=
X-Received: by 2002:a05:6402:3807:b0:6a5:f528:ff48 with SMTP id
 4fb4d7f45d1cf-6a60d35736cmr18935519a12.5.1788245347307; Mon, 31 Aug 2026
 23:49:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831105330.10449-1-linkinjeon@kernel.org> <c52c7fbb-b816-497e-b856-ea9a7dd3b38a@dev.snart.me>
In-Reply-To: <c52c7fbb-b816-497e-b856-ea9a7dd3b38a@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 1 Sep 2026 15:48:55 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8=dotQ1QcyUqvv=6=fUwq8M-DafAs0fB=2QOKGfuBE4w@mail.gmail.com>
X-Gm-Features: AcwNN1Vm8x8hWIzUPGDcI_0j83Xp07rP3nBn-_dD_oQbys-vL2eHaFhlhbE_ew4
Message-ID: <CAKYAXd8=dotQ1QcyUqvv=6=fUwq8M-DafAs0fB=2QOKGfuBE4w@mail.gmail.com>
Subject: Re: [PATCH] exfat: doc: add documentation
To: David Timber <dxdt@dev.snart.me>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	anmuxixixi@gmail.com, chizhiling@kylinos.cn, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 3:24=E2=80=AFPM David Timber <dxdt@dev.snart.me> wro=
te:
>
> On 8/31/26 10:53, Namjae Jeon wrote:
> > Add documentation for the Linux exFAT filesystem driver, including
> > supported mount options and exfatprogs.
> >
> > Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
> > ---
> >  Documentation/filesystems/exfat.rst | 117 ++++++++++++++++++++++++++++
> >  Documentation/filesystems/index.rst |   1 +
> >  2 files changed, 118 insertions(+)
> >  create mode 100644 Documentation/filesystems/exfat.rst
> Don't forget to add
>
> F:    Documentation/filesystems/exfat.rst
>
> in MAINTAINERS
>
> Well, it's ain't much but it's a good start.
Sure, will do. Thanks for pointing it out:)
