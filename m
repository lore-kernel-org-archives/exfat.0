Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF9B3CF1F2
	for <exfat@lists.linux.dev>; Thu,  8 Oct 2026 07:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444351; cv=none; b=jEdXWEMKh3D3Mi5N7JyaHZvpzJjihd7+/ELPIbKVwyarQc9VNW+mORhwVoyWAw/kspNG0g9cVkGa96nG//IXJk5ptJvplgPAPAq6azuf3DrbLdIMmsssDX7il7H+KS+VR+xSizPi1TRmVl4Tf8R1jSNL1fGgv1tPUiZDEDluWkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444351; c=relaxed/simple;
	bh=0eVCo24Ek/AGzdSSEGtLPh7+myCY9V8O/P9fEQ6z3PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBnCsQZtrs/O46qv/7GAxy5YKiw5abwc7GG/cIHMA7W431soQ8UaDr2VofpLgoDfCx+Ysa8EP59xekYxCwZihQwrwV2ZVfRLeIA4ZHIrXcNmQriiVEg5WJGtEOfeAXEAsd2uAMYqRqjlUi5SisQvYV+SgMyUksFmpa7VTPKGuZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7wsMZSt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7wsMZSt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0191F00893
	for <exfat@lists.linux.dev>; Thu,  8 Oct 2026 07:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791444348;
	bh=0eVCo24Ek/AGzdSSEGtLPh7+myCY9V8O/P9fEQ6z3PU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=l7wsMZStS9wZUePW/3ys/zNJ1XrlCLoGk8DFdhDQSEoUJoNdRjpbWg+Zsdo6z8ssy
	 VwFdv2bcpdhxTky2ySec4KmbjiCFHsPIuaiZyDY/h5QmtgjxIsveioCFXxqZrbCTTv
	 b3BI6bKYbV1OPykkefd+CDAngv4coHIA3NjfXMxStMVSTDOrhM9sadhHkxcdxVEYk8
	 GZP+ieukT0LhqZJHgtVBsr3D+mpbEg3KTLWNQN06+E7j8KE6LEldMm1Mbzww0tEXHe
	 LQtkrH3xe7j94O5gYq+nFK9XsVVjxKHn05YarqQCD9Wm6RpVDQso5yWHZZNcEa78h/
	 4mUFc87Q1AiYQ==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso341358466b.2
        for <exfat@lists.linux.dev>; Thu, 08 Oct 2026 00:25:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZ70G6i2TN39fDhg8ThZhyxWfY8jNFv4juYlbCItN+t58j+xf+qZoAMGS6p0SSAApcBrwKxw==@lists.linux.dev
X-Gm-Message-State: AFuF++kDrxUwQnHxp82q0/4gXw+sY87LOU/7s1y6xV6Dk8ccHIbH9Rgg
	BlM9YKt2P7YAJOSQhCZvjyEhZ8hr3QwUvBuANqWxEsQ3sC4WMJIahpm9dsapN617hgOoKv9zBTq
	Fp/usV5r23/g/VHQBiA7mgVHtjk7FCpI=
X-Received: by 2002:a17:906:f5aa:b0:c29:d77b:66a0 with SMTP id
 a640c23a62f3a-c317bd5eacamr449126766b.10.1791444347436; Thu, 08 Oct 2026
 00:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007132339.9379-1-linkinjeon@kernel.org> <7250425f-8626-4e8d-ab5a-32d9d4588ba9@163.com>
In-Reply-To: <7250425f-8626-4e8d-ab5a-32d9d4588ba9@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 8 Oct 2026 16:25:34 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_mFWU+k+W5dZfGdFegEGb-4jhcSV8qyz59cakj08APOQ@mail.gmail.com>
X-Gm-Features: AclHuK8j_MnlkvVhvsBgWgxf5rz_UJMciK7s6MGgIz7jDiEVRJFODDwcM2WSzoo
Message-ID: <CAKYAXd_mFWU+k+W5dZfGdFegEGb-4jhcSV8qyz59cakj08APOQ@mail.gmail.com>
Subject: Re: [PATCH] exfat: zero invalid tail on partial overwrites
To: Chi Zhiling <chizhiling@163.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	anmuxixixi@gmail.com, dxdt@dev.snart.me, chizhiling@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 3:50=E2=80=AFPM Chi Zhiling <chizhiling@163.com> wro=
te:
>
> On 10/7/26 9:23 PM, Namjae Jeon wrote:
> > Buffered overwrite that ends before valid_size in the same filesystem
> > block reads the entire block without IOMAP_F_ZERO_TAIL. If an existing
> > cluster contains stale bytes beyond valid_size, the synchronous read
> > loads them into the page cache and marks the block uptodate.
> > Subsequent buffered reads can return these bytes while i_size exceeds
> > valid_size.
> >
> > For example, with 512-byte blocks, valid_size of 1000 and i_size of 204=
8,
> > a cold-cache overwrite of [900, 950) exposes stale data in [1000,
> > 1024). Setting ZERO_TAIL for this write would also erase valid data
> > in [950, 1000).
> >
> > Use iomap_truncate_page() to zero only the invalid tail at valid_size
> > before preparing such buffered overwrites. Call it after dropping s_loc=
k
> > and before iomap locks the write folio. The inode lock held by buffered
> > writes serializes valid_size against truncation and page_mkwrite.
>
> I=E2=80=99m not saying that this patch will introduce a bug. I think it w=
ould be
> easier to handle if we perform the zeroing in iomap_write_ops.put_folio.
Christoph did not want to handle them in ->put_folio. That is why
IOMAP_F_ZERO_TAIL was created. ntfs also handles this in put_folio,
but I recently submit a patch to change it to handle it like exfat.
>
> Also, we may remove the inode lock from exfat_page_mkwrite soon. Once
> it=E2=80=99s removed, we won=E2=80=99t be able to use valid_size without =
holding the
> folio lock.
Okay, Thanks!
>
>
> Thanks.
>
