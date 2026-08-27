Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042F126158B
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 06:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787813704; cv=none; b=XfjEc+YwkVEmySOSYY222WFfPd/uSLLDPpc4dzZ6cEqmgihsZRwm9dZqEbbw2x/no+mwMBXu9IC/C0Nts6g9i/5q+qPcMmwUK3Xe1N+ayrTUTOkPsj/+tGCLhmIypcUyv0U1mSeK16KqpJTpXRLgW0Jtz+xpduTOKQh65wEWykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787813704; c=relaxed/simple;
	bh=4v0wsZQBgOoxIfhCPkKxsnwpzY7s7D5GN09eNeSOc2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5KazrfK81q/QaK6w0z2aoF9MblM5oYkdRZGkdoOcEixyxRRs4YEzwRwDSQ03d5OfTfPx/NupYbBEBfxfFNG2KdXgwdW3uhwInAnAgP1C41y/yVpll09psijBSCvxUJkdSaRq0KfquLAZXg5MWnJlIfRf1eTZ/VGxN+ZsawAI98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvjNQCdO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvjNQCdO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7028D1F00A3A
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 06:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787813702;
	bh=r/roSa9GGsZfdTA9/z5YLVUXMOK4nzv/ktueYonYa78=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YvjNQCdOsCrehbUOr44HypB45KQO2nXQTp7XZq4KLZZeZGtpGeszID9FXWIUrqbCQ
	 Zcom/xgZ7IwR/6KvmWZinrBI+CIrwZZGMT5d8u2pPh/ODgVDvv1WIuTsnEADi0tAFu
	 Eu76vnPhEqGaItV5sSub/tay7JuVvRbUp6LDDf+/QrOic3zKc+VK4Yk63Sdfrx1lv+
	 BwO43f8dGCkpnA0EWrW69M849Fy5KMpsiLUhnfgNwSf3xGh5XXvFiVTM7K410V5un3
	 A8xPxp7oPT+4ZxInSKj2VjMfzk6tRxRoIp+7klvH5zrYoVHsCL1+lwPy4ZwrOXhiO+
	 PktjHf5e/V8VA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c25344a8c6cso116190066b.0
        for <exfat@lists.linux.dev>; Wed, 26 Aug 2026 23:55:02 -0700 (PDT)
X-Gm-Message-State: AFuF++ntcnU4ElFCmRid6D/RCfetCc/X+dV615WkwYa7EZ0x6JI2nJ8q
	X0SfPQ65YGi4TNoUZ0DSI1cEhY07Gb16/9D2jru730ezf2hLsdv4PX6vZgK2VqulfVXDnRCiD77
	b0fF2t0Xlb2qCgIeqC7o+eYYqgQveE5g=
X-Received: by 2002:a17:907:6d27:b0:c20:3679:a2e6 with SMTP id
 a640c23a62f3a-c250bbda55cmr1288946666b.10.1787813701063; Wed, 26 Aug 2026
 23:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821100531.998196-1-chizhiling@163.com> <20260821100531.998196-7-chizhiling@163.com>
 <CAKYAXd_MxctBGgP6_daddk1q9Dwr0ZMAQchXqvEZME_Yo6xSuA@mail.gmail.com> <de355170-d57d-4247-93ba-521080ca30eb@163.com>
In-Reply-To: <de355170-d57d-4247-93ba-521080ca30eb@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 27 Aug 2026 15:54:47 +0900
X-Gmail-Original-Message-ID: <CAKYAXd95S7zNP3nJw-2FMp3P8J4y7HkGvjHzNU-zCw+vSLrv3w@mail.gmail.com>
X-Gm-Features: AcwNN1V9Lrpw180WYKXpeLn743AE4E1hRl13AqqsRJ9W9uzLtiq2NXhDfH6Uxcs
Message-ID: <CAKYAXd95S7zNP3nJw-2FMp3P8J4y7HkGvjHzNU-zCw+vSLrv3w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 6/6] exfat: take s_lock in read mode for iomap
 mapping paths
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 11:22=E2=80=AFAM Chi Zhiling <chizhiling@163.com> w=
rote:
>
> On 8/27/26 9:08 AM, Namjae Jeon wrote:
> >> @@ -68,7 +68,7 @@ static int __exfat_iomap_begin(struct inode *inode, =
loff_t offset, loff_t length
> >>          num_clusters =3D exfat_bytes_to_cluster_round_up(sbi,
> >>                          offset + length) - exfat_bytes_to_cluster(sbi=
, offset);
> >>
> >> -       down_write(&sbi->s_lock);
> >> +       down_read(&sbi->s_lock);
> > If may_alloc is true, Should we use down_write() ?
>
> IMO, there is no need for down_write(); the block mapping of an inode is
> protected by the inode lock, not s_lock. see exfat_fallocate(), where we
> don't hold s_lock.
Okay.
>
> If may_alloc is true, we need to allocate clusters and append them to
> the file's FAT chain. The allocation is protected by bitmap_lock, while
> the FAT chain is protected by the inode lock, since we hold the inode
> write lock in exfat_file_write_iter(), exfat_fallocate() and
> exfat_truncate(), there is no race when modifying the FAT chain.
Okay.
>
> Besides, I'm trying to remove s_lock in the next version and am
> considering adding a per-inode lock to exfat_inode_info, since the inode
> lock has a relatively large scope.
Okay, Sounds great!
Thanks!
