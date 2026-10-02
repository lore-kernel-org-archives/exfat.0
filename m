Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8FC357CE0
	for <exfat@lists.linux.dev>; Fri,  2 Oct 2026 23:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790984546; cv=none; b=f+cp2dDD3YVDWcKITTwPGcoC7jMIChffII4KJUQ7bnCUWwWXOb10yO6iZfWDf1JJJ/dT7v0Vmuw2fO5k6IQaFGA2j7N2laSJlkxxKE6vXEnWAC8glDuF8JWPc0++/Q6i36ztSC0NOCDxkdVxJRsT/LB7V+8jXf2LyOw82ab6Lek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790984546; c=relaxed/simple;
	bh=KO2I75VNoFgww9GdJxtJmZyHtp1JqOLqssmy5VsG5Q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qN/cckgr1t7Rp8M6Q1mdlClXUV7b3+h240orm1Zakh37YBAhvKg6Cz8woQX/NZ4O5e9XA9yha83EiT3g3ExrUwm+YXJ+R7jgdNUu/+M9kKjOtnTGfBNp4wg4Gwn2KzZJ6xYGaezAEQmMiwhsnsUxRE0c37b3lIZrv4NDjJRd5qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nv/wtJL+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nv/wtJL+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C5D1F00899
	for <exfat@lists.linux.dev>; Fri,  2 Oct 2026 23:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790984545;
	bh=vrwqr+wISnCgu+/lva2fJIO8Rcc0hIHfuzKvIAwo3Wg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Nv/wtJL+n/trw0mvNHHJWi8IJOz9VAFPXpkV98LHGra9I9ffRnHuN4smn1nB2stX6
	 RXCg1mFJv+ugb+Z1wHIAdxbvF9OGXNSKdgN9ny8easF5Qrgn/tGOp/c/Ep9QWFgkes
	 qGHXxDHqmaPamT9xF7iKtrImTyJFyvtWZzU6l1Zf3+qaDjObmA91rqz9nnE+bRAg6D
	 b+xA8DPntenQgLhQV0HzvmNMyhCzYvX27O4BS44yl/ZxRhaZomJMz+F0zkr/q4ZMLA
	 PK2J+0FK2bcpihijvdwCMHcKVYiBxfxMFML7aNLPc7pbWwOhDqQHgQLOW682r9z4OI
	 uPPI9T5a6j94g==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2a25dfbf5fso47510766b.1
        for <exfat@lists.linux.dev>; Fri, 02 Oct 2026 16:42:25 -0700 (PDT)
X-Gm-Message-State: AFq9FYI2WADa7BRfXJcpxf/wzaF/QXlM74K2KAeOeECG5D6/VKOUMJmD
	8SqjE2sxIVMViQ+Y2geUfBQDCJSv0X5bJqfnQI4CwxSbvnG/IHbBt0T3gZlhxCBZXw5P3CBDQLl
	z2+RsYeMzBR2NTzAFPSpwmTXNjlr3HS8=
X-Received: by 2002:a17:907:1ca1:b0:c2e:4292:d268 with SMTP id
 a640c23a62f3a-c2e6ece2e6amr52143966b.16.1790984543870; Fri, 02 Oct 2026
 16:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927080305.831641-1-chizhiling@163.com> <CAKYAXd8u2iLQ5aO6XR7vFojB3=9Jcmk7nK1mbzAk=Tza_UoYJA@mail.gmail.com>
 <24c5c9ea-1bfe-44a8-81ad-c2b1588e0a63@163.com>
In-Reply-To: <24c5c9ea-1bfe-44a8-81ad-c2b1588e0a63@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 3 Oct 2026 08:42:11 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9Z7opATEpHtyTp+cbzsYS_+Ym621fBHHbY1OZw=Hzt2w@mail.gmail.com>
X-Gm-Features: AclHuK8TG_7kY28i4gXzmOvrt-9xidqiIUWOyaNs3d5IKC9LGkDH-eZhfFg01is
Message-ID: <CAKYAXd9Z7opATEpHtyTp+cbzsYS_+Ym621fBHHbY1OZw=Hzt2w@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] exfat: fix valid_size handling and locking
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, Yuezhang.Mo@sony.com, 
	chenxiaosong@chenxiaosong.com, dxdt@dev.snart.me, hyc.lee@gmail.com, 
	liubaolin12138@163.com, sj1557.seo@samsung.com, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 11:53=E2=80=AFAM Chi Zhiling <chizhiling@163.com> wr=
ote:
>
> On 9/30/26 6:01 PM, Namjae Jeon wrote:
> > On Sun, Sep 27, 2026 at 5:04=E2=80=AFPM Chi Zhiling <chizhiling@163.com=
> wrote:
> >>
> >> From: Chi Zhiling <chizhiling@kylinos.cn>
> >>
> >> valid_size marks the on-disk up-to-date region of an exFAT file. It is
> >> advanced from the write path, from read/zeroing completion, and via
> >> truncate, while it is read without i_rwsem from ->iomap_begin and from=
 bio
> >> completion context. This series fixes several races and stale-data win=
dows
> >> that follow from that split ownership.
> >>
> >> Patches 1-2 are self-contained fixes: an append write may be moved to =
EOF
> >> by generic_write_checks(), so valid_size must be advanced using the
> >> recalculated position; and exfat_zero_new_range() must mark non-uptoda=
te
> >> pages dirty so the whole page is written back.
> >>
> >> Patches 3-4 are prerequisites for patch 5: truncate now holds the
> >> invalidate lock so it is mutually exclusive with mmap writes, and
> >> valid_size/zeroed_size become atomic so they can be read safely outsid=
e
> >> i_rwsem. Patch 5 then takes exfat_page_mkwrite() out from under i_rwse=
m,
> >> since blocking on the inode lock under mmap_lock could deadlock and it=
s
> >> VM_FAULT_RETRY result is not honored, and advances valid_size under th=
e
> >> folio lock to keep the page cache and valid_size consistent.
> >>
> >> Link: https://lore.kernel.org/exfat/10029d6f-13cc-4d17-a2f9-b093a8339d=
de@163.com/T/#t
> >>
> >> Chi Zhiling (5):
> >>    exfat: advance valid_size to EOF for append writes
> >>    exfat: dirty all new pages when extending valid_size
> >>    exfat: hold the invalidate lock while truncating
> >>    exfat: make valid_size and zeroed_size atomic
> >>    exfat: use folio lock to protect valid_size
> > Could you check the review comments from Sashiko ?
> >
> > https://sashiko.dev/#/patchset/20260927080305.831641-1-chizhiling%40163=
.com
>
> Okay, I=E2=80=99ll take a close look at this review comment.
>
> I also noticed that the comment mentions that concurrent DIO and page
> faults may lead to data corruption. I believe this is a long-standing
> issue, and I don=E2=80=99t currently have a good way to fix it.
Okay, I'll take a look at that. Will you send v2 patchset soon?
Thanks!
