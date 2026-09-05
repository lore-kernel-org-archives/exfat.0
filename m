Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB8F33F5B3
	for <exfat@lists.linux.dev>; Sat,  5 Sep 2026 08:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598522; cv=none; b=YZSeqky60IKq9SpUpWE46etYwTuxVAPijJOWbqr0IzMXeukU3nm163jFqkjDH/g8n5z/9mJXhTQwFYEbmgtwcL5veEs0Plf9jZK+z8DJSkV0ahMZjDBIAiv1DfEy6xZ1I/0ynhL9nF2HBjgBSL5wzqPBbxW/5L2vESNFo50jrqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598522; c=relaxed/simple;
	bh=zPHMkdqCpaeNba1IQAr267evDxB8KZb9GaRHP+XXXRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGg0kfULITiGZ6cwYJbjUWxWzFqNZa4iinrj2n0qLE1LI8hDql+fHrXoGrpyrgXQLCAw11m3rQvZOyKDw/9jgQXc/d3/iJffMaEXMlMqAY5svB/57PBzLD2PHfp6v0Kh9qJZ92kDxmFz9NqMmpY7vxw977uNXuPmv6MKqlfbNRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlNgBBZR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlNgBBZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E481F00A3E
	for <exfat@lists.linux.dev>; Sat,  5 Sep 2026 08:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788598520;
	bh=zPHMkdqCpaeNba1IQAr267evDxB8KZb9GaRHP+XXXRc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hlNgBBZRhYuqwquhMZCl7pN6n9YgIm2hOvQn3M7O40UntJiZLa8txil4sBAQalbwD
	 dFl7MW+MRF/VXC9DuUBuXxvKDSZAkjVOFtvZbiZMzZhaQNVHH/cyBB9yiOa8mhjsyy
	 q0zl0UT0WNNT6i8lrbbYGBBhbQe5+JECl9wlJMs+b/Y01zhoLk7+EK0dvEA6jqPIif
	 /6FYznIbvJrVjUwxaN+SDLXUbyyYX8RO7IlHg1dY+9tAj+a1HXIA2NQ9hHgC0Xl14Y
	 n0g5/Fx/qqKCBdfRHqgRObr4+fuVHFsOXiXfG7uAjKp8TQUZ+1loVF2wMmcljPLItU
	 1OBHN8MtAxKnQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c247f6687dcso292016366b.2
        for <exfat@lists.linux.dev>; Sat, 05 Sep 2026 01:55:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxlphLW/KAR9ZjXSng453Rvh2dTvoMClbyxe+KIS4XZfaN9YaAHRztGgE+Uwe/aRfjPpvoq5w==@lists.linux.dev
X-Gm-Message-State: AFuF++lEgp7wpJbO8li/TIpDD6RQp/seaNTqJz6n5IIFn3T3AAvK8ZZk
	Chn0JE1QzdslHjTqxcQnrTXBVrndhMrElYb0bgDPnMVp3zKDf1AeB3IW15jJTqzvJcHNduK4Oal
	dPgI27vNRpD1jhNz23whSfjcZVmcGe98=
X-Received: by 2002:a17:907:6ea3:b0:c26:1648:a06d with SMTP id
 a640c23a62f3a-c261648b71amr306155066b.40.1788598519610; Sat, 05 Sep 2026
 01:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260902120143.7158-1-dxdt@dev.snart.me> <CAKYAXd__vL4=majhavWypYMR++v69SLv0jKH-+s2nXEW0Pd7Gg@mail.gmail.com>
 <f0ea97f3-db5d-4dad-9f96-45aa4401ef9e@dev.snart.me>
In-Reply-To: <f0ea97f3-db5d-4dad-9f96-45aa4401ef9e@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 5 Sep 2026 17:55:07 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8v2U6q6kzf1JFe1qbGT8T+mwdKfUKrJZS=fwL1CSPzow@mail.gmail.com>
X-Gm-Features: AcwNN1VF2I9ZIb616xfc0QR4VpdMu2u3nVznlE-qhpRxbTBitZCXixH23LeyBdQ
Message-ID: <CAKYAXd8v2U6q6kzf1JFe1qbGT8T+mwdKfUKrJZS=fwL1CSPzow@mail.gmail.com>
Subject: Re: [RFC PATCH v0] exfat: update percent_in_use field when updating
 volume flags
To: David Timber <dxdt@dev.snart.me>
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev, 
	Hyunchul Lee <hyc.lee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 8:25=E2=80=AFAM David Timber <dxdt@dev.snart.me> wro=
te:
>
> On 9/3/26 12:43, Namjae Jeon wrote:
> > On Wed, Sep 2, 2026 at 9:02=E2=80=AFPM David Timber <dxdt@dev.snart.me>=
 wrote:
> >> Currently, the exfat fs implementation does not modify the
> >> percent_in_use in the boot sector header at all. Although the field is
> >> only an advisory field for situations where bit counting is not
> >> feasible, not updating the field at all can cause confusion if the
> >> the value is actually exposed to the user.
> >>
> >> Calculate the value using integer arithmetic only when the dirty flag =
is
> >> cleared. If the dirty flag is set, set to 0xFF.
> >>
> >> It is set to 0xFF when mounting under the assumption that the number o=
f
> >> used clusters will change - this is basically what is recommended in t=
he
> >> SD Association's specs.
> >>
> >> When clearing the dirty flag, if overridden by
> >> sbi->vol_flags_persistent, set to 0xFF. This is intentional because if
> >> there are orphan clusters, the calculated value would be incorrect and
> >> correcting the fs error is fsck.exfat's job.
> >>
> >> Signed-off-by: David Timber <dxdt@dev.snart.me>
> > Applied it to dev.
> >
> > Shouldn=E2=80=99t mkfs.exfat also initialize ->perc_in_use with the cal=
culated
> > value instead of leaving it at zero?
> I've sent the patch. I've just changed it to 0xFF instead of zero.
Please check a warning from kernel test robot.
For now, I will remove this patch from the exfat dev queue.
