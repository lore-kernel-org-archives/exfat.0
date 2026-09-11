Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56805227EA4
	for <exfat@lists.linux.dev>; Fri, 11 Sep 2026 00:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084993; cv=none; b=WIwLdLQxhfMJv3gGcJaaHqiMl7p/s6NRhNfMx0FsYESRYb1L9ak3VtfgDNjFJ/2BgA9DeBzv0cmBhjla0toOo1KLMMRjfABjAuzx3a3gXYf+vSfB8CgKii9MZ8kbRA0e9X5YOVk+fE6R10lZBJcN7tlBIHlZ/hlXYIZ/dY+hVJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084993; c=relaxed/simple;
	bh=9cFVAH2lVL7F4Zuv3ctOayTQyEyyKlm8szg+NBm1qpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKwQyXECchtx6Ct06ojCP2UOsFFa4ho4/QXB0ZGsBVYzoHkWLG3crXnIJ/TRO8hcBfURwlDyN1HyxhXuaJCqYlXd8G9hFU3dUkQFLgHyqQQ88YqbTPUcQw4om3b0HkooNcGS9wue8qNfoF4EiyQ2Jb7a+kXFvWesl4hvARFkb5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYxHIt/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYxHIt/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B5C1F00893
	for <exfat@lists.linux.dev>; Fri, 11 Sep 2026 00:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789084992;
	bh=IIEvYHul93Hf/Uuz8WLvEZbHftG/85yv63u8P07ZPgI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kYxHIt/lHvCdBtjqpnk0ngCA1GG0xOVPlSv4W9vGEhgGArYf1dWMAyoT+P1QMBm3x
	 708dBAG/E0YoQuCK4F3uGJO+4oCarsy4pE/Eix9+vGQWkHj4lgVJSskdknC8P5DUcF
	 Ji1p/7n09ieXV4IlxT9uvF/q+qA7fMKPr2uMtZTLUVE4UOVz/53YkH+jhST8x+B0vN
	 /xuXWAAHM1TkFmTHrf3ZA0wLbh28mUplPdvhMHPQK+0k2e3KFT/VmkLYv75r0Dlcyx
	 9sgEWXX4FHTb0oiD69tolXSEquaNxivOpZd7ZKg3+sODpzCMKTJZT2lZ1FcqRJE0oE
	 YqTHCELuygibw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2637dd37c1so52186866b.0
        for <exfat@lists.linux.dev>; Thu, 10 Sep 2026 17:03:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByVE1lvscNaTaHKlbd6FFdPbUjZFAGIl/a6UM1njGQThNR9vcYzs6lj7T6k3Uh2nDc2gSlSVw==@lists.linux.dev
X-Gm-Message-State: AFuF++mCBEOcG5qYMe39wZ4qHbrd4yFKM/Ww6kluyCfQCurML3uwaZtn
	H8sGOdqQdlmTamzm0iMmg+tlziVkJtTY7P/gmaq4Q3tHzxqy+80cuvTsGVgDV1bovA0Kxnyk+P0
	8FJBJdao2UZ6SvPT+3XgQ6bMWePhQ8Qs=
X-Received: by 2002:a17:906:f58f:b0:c25:8c74:71ea with SMTP id
 a640c23a62f3a-c296654c2a8mr42043766b.4.1789084990625; Thu, 10 Sep 2026
 17:03:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260902152455.1273557-1-anmuxixixi@gmail.com> <20260902152455.1273557-3-anmuxixixi@gmail.com>
In-Reply-To: <20260902152455.1273557-3-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 11 Sep 2026 09:02:58 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-O2q3aYowcJfTuvueHPsdGYme3jaeCZjqx=bpPfrDNGg@mail.gmail.com>
X-Gm-Features: AcwNN1WmRVohu6pmJ1305awATGHM7TfUkjN8xIIsGmuifaWM6_rNNJ44khtH73I
Message-ID: <CAKYAXd-O2q3aYowcJfTuvueHPsdGYme3jaeCZjqx=bpPfrDNGg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] exfat: retain the next empty directory entry hint
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, chizhiling@163.com, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -385,6 +429,8 @@ int exfat_find_empty_entry(struct inode *inode,
>                 inode->i_blocks += sbi->cluster_size >> 9;
>         }
>
> +       exfat_set_next_empty_hint(inode, p_dir, dentry, num_entries, es);
This advances hint_femp before the entry set is committed. If a later
step such as exfat_alloc_new_dir() or exfat_put_dentry_set() fails,
the slot is still empty but the hint points past it. The same applies
to the volume-label and rollback paths. Please invalidate the hint on
every post-allocation failure, or update it only after the entry is
committed.
> +
>         p_dir->dir = exfat_sector_to_cluster(sbi, es->bh[0]->b_blocknr);
>         p_dir->size -= dentry / sbi->dentries_per_clu;
>

> @@ -1214,6 +1267,7 @@ static int __exfat_rename(struct inode *old_parent_inode,
>                 ret = exfat_rename_file(new_parent_inode, &uni_name, ei);
>         else
>                 ret = exfat_move_file(new_parent_inode, &uni_name, ei);
> +       exfat_invalidate_empty_hint(old_parent_inode);
>         if (!ret)
>                 exfat_name_filter_add(new_parent_inode, &uni_name);
If the new entry is written successfully but deleting the old entry
fails, exfat_rename_file() or exfat_move_file() returns an error and
this filter update is skipped. The new name may still exist on disk,
so a Bloom-filter miss can incorrectly return -ENOENT. Please
invalidate the destination filter on rename/move errors.

Thanks.
