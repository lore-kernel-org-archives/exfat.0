Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D203DA7D0
	for <exfat@lists.linux.dev>; Tue, 28 Jul 2026 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228562; cv=none; b=g0z1id2h3hNvKQl9ErC/HT1JxIdYjCyS0yacFDqfr+tp+jxqQJvJx+TAO7Bj0Duz7JBTy1HUcwLkZ4qYHBO+1jd8qFiGxi1jGrFAWltnjN6XPDKvk7VvtxfyRYmggIQo7bqT3SqFf8NupJPbhjp/Br5lDQGq+orF1xGp3XcIXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228562; c=relaxed/simple;
	bh=/vGXG9pdsaCxM+4/NKYzMcHy3WfRu9YGh818a7Yoiuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQhuZ18vJNbnRiuVRDNpd1kljPLd2wMcOf7dY8RXM+5vzPYCPslyqt4GQEwdsPjBfmYgs2xwvwDpIDXaCcXOiAUEumQMOd3lBVAY7X6ppHL0F/LhF3reU5P80g2RFdhnOgYKiIJvW47QHe/AG4ZdV1AM7EX17noqhYbcYlR+tlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsBYPJ/r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsBYPJ/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708741F00A3F
	for <exfat@lists.linux.dev>; Tue, 28 Jul 2026 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785228561;
	bh=kr/lhFz/R8m8r4lSMqVWvbih5CPa4wc4Ivu8HfF2ARc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DsBYPJ/rJORRPN07WVJ8AgHqh0Q3sSaI9HIbQMk1sxEHDCflUBXZ31crPfBmai6If
	 GvIjrHPE3OVDO2GOPVn3ZyaC5/PH8/BK44cZQ6LRLJ8vpzvqMpbh3leW+WUB0C8fwd
	 IqjzG4pwTYGGSR0BCJgjvqT5Go0jT7WWgMPCiXCJdybYdqeMsfazbFLOCa1YehBr6n
	 8H3z8bOUQEL2zADNJO3rWn+0XCs4+D4J7k40mI9gytUwr6lWqnYP6qHniykol9gLBr
	 KGd15llooo9qbrz5kL/iKKx9sXiV7yNS3/oKJtourm95TqhUB6HWctc1iagCvd72Ty
	 SyDRUwnSf3+nQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a02aedabadso1092389a12.1
        for <exfat@lists.linux.dev>; Tue, 28 Jul 2026 01:49:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpxUl2csFgvjG3EGncHFprm1pibH8/CDuu9cJXyxz7cpH7w3bbLKa/IO+IISatY9SV2YMBGvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDD6RRH8jKJl9V3dh/O9jTegkec0youqYlfmpApj61u+ES6XYh
	wB5jPqivYS/BesUCRF+VXltwJoNruQUX5SOdu/3+bJZ0g35B968H/lCwM+hZxSr/28siELv49Gk
	nT14nqTD5+lDEJ9MxCHX5ItQUQnxPSsw=
X-Received: by 2002:a17:906:fe43:b0:c15:ce72:9352 with SMTP id
 a640c23a62f3a-c1f72147fe4mr72752866b.33.1785228560094; Tue, 28 Jul 2026
 01:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728055504.412284-1-chenyichong@uniontech.com>
In-Reply-To: <20260728055504.412284-1-chenyichong@uniontech.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 28 Jul 2026 17:49:07 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_PJGnqjiwZccmjreLPch=h2VHhM1oVfB2+MVPRpz6QNQ@mail.gmail.com>
X-Gm-Features: AUfX_mxDk0EWdyQc_ZhzNBw5LBI2H8FMr5wNM_pXb2C1B94VB3xSrunsXECt97Y
Message-ID: <CAKYAXd_PJGnqjiwZccmjreLPch=h2VHhM1oVfB2+MVPRpz6QNQ@mail.gmail.com>
Subject: Re: [PATCH] exfat: clean up new entry on add entry failure
To: Yichong Chen <chenyichong@uniontech.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
> index 038bc6fed681..7bd745090f92 100644
> --- a/fs/exfat/namei.c
> +++ b/fs/exfat/namei.c
> @@ -471,6 +471,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
>         struct exfat_entry_set_cache es;
>         int clu_size = 0;
>         unsigned int start_clu = EXFAT_FREE_CLUSTER;
> +       bool dir_allocated = false;
>
>         ret = exfat_resolve_path(inode, path, &uniname);
>         if (ret)
> @@ -497,6 +498,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
>                 }
>                 start_clu = clu.dir;
>                 clu_size = sbi->cluster_size;
> +               dir_allocated = true;
>         }
>
>         /* update the directory entry */
> @@ -507,8 +509,16 @@ static int exfat_add_entry(struct inode *inode, const char *path,
>         exfat_init_ext_entry(&es, num_entries, &uniname, NULL, 0);
>
>         ret = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
> -       if (ret)
> +       if (ret) {
> +               if (!exfat_get_dentry_set(&es, sb, &info->dir, dentry,
> +                                         ES_ALL_ENTRIES)) {
> +                       exfat_remove_entries(inode, &es, ES_IDX_FILE, false);
> +                       exfat_put_dentry_set(&es, false);
> +               }
> +               if (dir_allocated)
> +                       exfat_free_cluster(inode, &clu);
This can free a cluster even when the entry cleanup fails. Since
exfat_put_dentry_set() may fail after partially writing the new entry,
the on-disk entry could still reference the cluster. Freeing it in
that case may allow it to be reused and cause duplicated cluster
corruption. Please free the cluster only after the entry deletion has
completed successfully.

  if (ret) {
          int cleanup_ret;

          cleanup_ret = exfat_get_dentry_set(&es, sb, &info->dir,
                                             dentry, ES_ALL_ENTRIES);
          if (!cleanup_ret) {
                  exfat_remove_entries(inode, &es, ES_IDX_FILE, false);
                  cleanup_ret = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
          }

          if (!cleanup_ret && dir_allocated)
                  exfat_free_cluster(inode, &clu);
          goto out;
  }
