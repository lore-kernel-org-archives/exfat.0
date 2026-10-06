Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AFF37E5D0
	for <exfat@lists.linux.dev>; Tue,  6 Oct 2026 06:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268248; cv=none; b=axyLrao7WzP/8rCJlRLCxWn9X4ZsuraltrzvEXHxwyKm4EdPXFpGeja9UuLjvBwcq+GtKGrVHtU/N4C7L7wSEJgwNZSsPS9vz5wxcVAsg60T0lspB8Y+8wxyxsdtYWvhqA4rW4HcqR8eraZaa7SnRBJlGnixTTYN5BaSLhv0PPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268248; c=relaxed/simple;
	bh=YjuXSi3aozrOIYinVYm/zc31n9VMdX/3ZofAmKTbW9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SuPpq3zXl79QS2EHxU8puxqHJYZXx5HzgBy00b8f3kywRR1tINwADvQv8U0nzSgW2vzvvVfk3d53soirKRWFrqY07HYvFExXkEzuZ9kFJEx+iXKDEX28JAtGizuL7gliJrSaYWICLSZRPVLdFWtuZO/HCGk6rtQ/BIhn12O5dGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXmVgiAY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXmVgiAY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12FD1F00893
	for <exfat@lists.linux.dev>; Tue,  6 Oct 2026 06:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791268246;
	bh=bSJGzpl/sgtBbaC9T7jxEyyq7G+X2H5uaG+ljuvdkdU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TXmVgiAYfPg7GgvIq2z92l02mjCJYBvqBIe7O5cz7SsrpbgnQVsX+4Va67alEuGB/
	 SX1wXr44y0MtB+NwYPsMv7+S25yirTZNhPKip10J5JnJJQfzmNYH0eWP4fREpapMMd
	 nAJatGYl2sNDXsFobVPrYFofDWm6DnDTzEr8iIPiii1B8AjvclI9nS1siwUhGw6omo
	 ST6ii2PlBuqHbetrjPAHmXKBdRgVyPITX1eIQNJcXzbau1A0zXR1rlxTo+tU66lw5r
	 /oGUSuJttTcB5ua+TEHJR+tM5H/nieuajvil6W2mXB5C+yWa8MMTj6d9EIN2ZX3b5p
	 QfTE+CSXjprGw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso25997766b.2
        for <exfat@lists.linux.dev>; Mon, 05 Oct 2026 23:30:46 -0700 (PDT)
X-Gm-Message-State: AFuF++neP78enUTDTDd3ZLU5Y2JPl3O23BiwMV5oO6GP/ccWHwvFO8h3
	nKVGFNgiBQKPQofVj9GaoFAGQl9f5nUxEeiLz6hdz75WxQuCLiOi2gYlcGJM5WvhOmSg8UnT30I
	1tXW9ugc4yHwL65exEB8gS5HTv01DlbU=
X-Received: by 2002:a17:906:c116:b0:c29:f159:ddd4 with SMTP id
 a640c23a62f3a-c316a038586mr41726266b.26.1791268243200; Mon, 05 Oct 2026
 23:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004101934.1975655-1-chizhiling@163.com> <20261004101934.1975655-4-chizhiling@163.com>
 <CAKYAXd-2cSYwBcAfGtcAYbK95FfpASRrptz4YUf7Ke-cXK00PA@mail.gmail.com>
 <5b101dea-77ef-4ae7-b8d9-54df20b0a6a5@163.com> <CAKYAXd9u3gC=McjgAVABfsd_JPwKWMteJ=t4r0RAnuZ0worupw@mail.gmail.com>
 <c1ab6f08-f277-4645-99ce-5e31ed896a89@163.com>
In-Reply-To: <c1ab6f08-f277-4645-99ce-5e31ed896a89@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 6 Oct 2026 15:30:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-v5W8g_Ho81Xa+hJ5mbA3wrdUcY1K9X-RjpMHbiivXnw@mail.gmail.com>
X-Gm-Features: AclHuK_Q431J3lAiKb67qMwjp4p4jtCGPSZ17Xqyd89nZ5pXnHQxYHgXkwyLW2w
Message-ID: <CAKYAXd-v5W8g_Ho81Xa+hJ5mbA3wrdUcY1K9X-RjpMHbiivXnw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] exfat: dirty all new pages when extending valid_size
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, Yuezhang.Mo@sony.com, 
	dxdt@dev.snart.me, sj1557.seo@samsung.com, 
	Chi Zhiling <chizhiling@kylinos.cn>, Jiale Yao <yaojiale02@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 3:02=E2=80=AFPM Chi Zhiling <chizhiling@163.com> wro=
te:
>
> On 10/6/26 11:57 AM, Namjae Jeon wrote:
> > On Mon, Oct 5, 2026 at 7:19=E2=80=AFPM Chi Zhiling <chizhiling@163.com>=
 wrote:
> >>
> >> On 10/5/26 5:08 PM, Namjae Jeon wrote:
> >>>> @@ -664,90 +664,30 @@ int exfat_file_fsync(struct file *filp, loff_t=
 start, loff_t end, int datasync)
> >>>>    static int exfat_zero_new_range(struct inode *inode, loff_t start=
, loff_t end)
> >>> Function name and comments no longer seem to match. What do you think
> >>> about changing them like this?
> >>>
> >>> /*
> >>>    * exfat_prepare_valid_range - populate and dirty folios covering [=
start, end)
> >>>    *
> >>>    * Populate missing blocks via the read path, which zero-fills data
> >>>    * beyond the current valid_size while preserving uptodate blocks.
> >>>    * Mark entire folios dirty so the newly valid range is written bac=
k.
> >>>    *
> >>>    * Call before advancing valid_size.
> >>>    */
> >>
> >> Okay, I'll add it to v3.
> >>
> >>>
> >>> And generic/538 test fails with this patch set. Please check if this
> >>> test failure is reproducible for you as well.
> >>
> >> I ran the tests, but I wasn't able to reproduce the failure. Could you
> >> tell me the block size and cluster size used to reproduce it?
> >>
> >> There is also a new failure in generic/551. This failure can be fixed =
by
> >> adding inode_dio_wait() to exfat_extend_valid_size(). Jiale's patch
> >> includes this fix:
> >>
> >> https://lore.kernel.org/exfat/20261003093035.532916-4-yaojiale02@163.c=
om/T/#u
> > Okay, generic/538 test passed with this patch.
> > I will apply this patch and your patch-set.
>
> Okay,
>
> I noticed that these patches have already been merged into the exfat/dev
> branch, and the comments in exfat_zero_new_range() have also been
> updated. So I don't need to send v3, right?
For now, yes. I am currently doing other tests, and if there are some
issues for these patches, I will request v3 to you.
Thanks!
