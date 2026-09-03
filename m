Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E786D4A49BA
	for <exfat@lists.linux.dev>; Thu,  3 Sep 2026 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439406; cv=none; b=WNcApR0w5zN69CctuOXf1ZDvh4rohZz08b8ubl8zAbjPhGYT8ybm1RynPMoCo2dFAdI8XKZE8cSJGC3M7fPc5FPwqXFVWAJ7jlvCpYc2ftlSP2E6zzCeV6f/1CDs1UIwIAvj44r45xGZwUHMUMJKXRrNy0rXCyZClcmf8zQf2gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439406; c=relaxed/simple;
	bh=lojE3L+gJdhwg0WVe8s1RgSBLlehF6KtF6jCyVdcjTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZHWOu0mjVfLLjA3P3m2/lrOAH+AyWE0JnBFjLNxv0ur76zp1mOB+TdmEF4azu3QNVfQrNswZFOUUB77mdmfA60ZiyHAQBqWrWdA0fY6khzVkyV7L9gEvErfCCDlIheLppD+Zg6mUP5NF3ggK0AHKlxSGjtP/DD8ueijVxO2gy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3fG7aPA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3fG7aPA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736771F00A3E
	for <exfat@lists.linux.dev>; Thu,  3 Sep 2026 12:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788439404;
	bh=lojE3L+gJdhwg0WVe8s1RgSBLlehF6KtF6jCyVdcjTg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=l3fG7aPA2eG/l2lQs2nKrxghiX5116bB3qn/rZBsJ61+aeI56TxSWP7hlpdrgKyCE
	 O512XPlBs0SGpb4nYW8NFQBREBbznQ49DH7mu5DEe7ASQKt9EyyyPDSgeQBk3gewgR
	 g3Mi5bXSZPRSARXZk3MLvNHAso0HjH+AjSgI1st/T00SZP7FJBUxa1jLOdNAAr5ceG
	 fbBIG15OcH0BgfAWfpuOORypKefpdeLwygkomKKHOGv7OQoso/U3czzIVHYMxmBYhv
	 l4W66Kq0aay38EYjqQq//LC8z7vzVgnXS8oJ76SG0x5PB+FGWHAvtYc205wzp5RTYJ
	 2r4jD5X+DuFPg==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66f7f62e915so2588876d50.3
        for <exfat@lists.linux.dev>; Thu, 03 Sep 2026 05:43:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwFyb985C17gwY1Hc7xU8EF2IAkAa6/NdIOLfld3kqt5cVrbLxb2vOIFj9XQnEgKXlu7+/pgA==@lists.linux.dev
X-Gm-Message-State: AFuF++lJqMK8rYqXeikGtGx9vIN9sAaPueQ0YcOg7kot4yTaO6EQoMsC
	y64KlEBQLxxCGOucFaaoBwFc67KaHK9koaNMOeIf9iiX3L8cTgFM+/TlcKT0OrvH8DeCQW3gnrU
	b15bp+cCviZ4nNsvKsJydThqsV49hBsk=
X-Received: by 2002:a05:690e:168f:b0:66e:5fc2:ce2 with SMTP id
 956f58d0204a3-66f9bc0b102mr5087518d50.28.1788439403778; Thu, 03 Sep 2026
 05:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260902120143.7158-1-dxdt@dev.snart.me>
In-Reply-To: <20260902120143.7158-1-dxdt@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 3 Sep 2026 21:43:06 +0900
X-Gmail-Original-Message-ID: <CAKYAXd__vL4=majhavWypYMR++v69SLv0jKH-+s2nXEW0Pd7Gg@mail.gmail.com>
X-Gm-Features: AcwNN1Xe1kNk_ISJEZeLFqwN7Ea8DumjX3eAlmrUsmFf77h6Wmzz219p4h7oMMg
Message-ID: <CAKYAXd__vL4=majhavWypYMR++v69SLv0jKH-+s2nXEW0Pd7Gg@mail.gmail.com>
Subject: Re: [RFC PATCH v0] exfat: update percent_in_use field when updating
 volume flags
To: David Timber <dxdt@dev.snart.me>
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev, 
	Hyunchul Lee <hyc.lee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 9:02=E2=80=AFPM David Timber <dxdt@dev.snart.me> wro=
te:
>
> Currently, the exfat fs implementation does not modify the
> percent_in_use in the boot sector header at all. Although the field is
> only an advisory field for situations where bit counting is not
> feasible, not updating the field at all can cause confusion if the
> the value is actually exposed to the user.
>
> Calculate the value using integer arithmetic only when the dirty flag is
> cleared. If the dirty flag is set, set to 0xFF.
>
> It is set to 0xFF when mounting under the assumption that the number of
> used clusters will change - this is basically what is recommended in the
> SD Association's specs.
>
> When clearing the dirty flag, if overridden by
> sbi->vol_flags_persistent, set to 0xFF. This is intentional because if
> there are orphan clusters, the calculated value would be incorrect and
> correcting the fs error is fsck.exfat's job.
>
> Signed-off-by: David Timber <dxdt@dev.snart.me>
Applied it to dev.

Shouldn=E2=80=99t mkfs.exfat also initialize ->perc_in_use with the calcula=
ted
value instead of leaving it at zero?
Thanks.
