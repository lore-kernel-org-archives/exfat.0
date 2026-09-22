Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B154CF52
	for <exfat@lists.linux.dev>; Tue, 22 Sep 2026 14:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088249; cv=none; b=jEKET1LCV0+Cz78TnBaBEBnjvA9I2kfVoltm2PNH01QZlF3QW4gTLU+DhsIa8NNAKzhA6j3myMuXed9wEQ6lABf+gu0mEbayrMC1D+XyXIm5HnUUCo12VnrinTJoIqtwoqAI0VPrA/wBsLjMK4Yfj3F07zbJwROj0mBOaNNGTdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088249; c=relaxed/simple;
	bh=SCANmlijJoE4v2B6DWNSsRxY0ITJRVA2y+vlm7to5XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2/ovJ7c1bDcUyzzGGTpSvS3p/3Jx23+wXfZpZUMlqavaTCT/xB8wYgVIXSxJaW9msHzUO78PZl0W/LPHJ6oUmIbTuAcCmaXhv63kubDrsBJgbg1uhyWiF6XMPjNjC+VSsGApauZKN/j6riUmWDMujeuG5043q707d9ssjg6xI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvmnMaA/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvmnMaA/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A5C1F00899
	for <exfat@lists.linux.dev>; Tue, 22 Sep 2026 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790088247;
	bh=bSZ2l69C13YURC2F+Y4cEwIP1ktKgtxKCfV8IODRQwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UvmnMaA/HU6AyVV3T/pncaqPJOzBfcxleJq7jbV6OZGcWKNuGpOGaBOPRLJwx1YSD
	 01a6ilHpEUGh8XIGkXC7ZtLmIqLmGKUrmwoQAFZfX6p09Gx6ZRWtVlSB7xBeMtQVTF
	 fovsLmp3aE89eUmEA747q3EBD4iR1nIgmo6F5O/48Aqy/xrFMT8jEzWJ7Dvgx0vjss
	 G6/7K66iJsLTSLhMZyM/3nfrsI0wVzWbaqhXlBjz981OKKyOssN3vJEm/1WzHzSlKE
	 wsHuyK8K5SQUgVUOc3IJO/DcoX5KXGixqFyZeD4NW5/ddi7PEt9fpOBVyxSZH9CwW1
	 Ew1yQ+yJj2RXQ==
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d45ae011cso2127b3.2
        for <exfat@lists.linux.dev>; Tue, 22 Sep 2026 07:44:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFimmcBaMI9+ftu+ErGTRjcIpHPDekVLRv5zfZS4zkFWv9HNYDsn4D4gpNqq0qemfQTa869g==@lists.linux.dev
X-Gm-Message-State: AFuF++kHxYBVm5dyR4rvpnZS3CJwjlurmyxTiZ1wEtTTrsLcAqAsT38r
	HNmK2O8ppbLPA6XaY7pfR2SyVnVJRr5KgaIJUCpJN6CIyXP4zp38Bzd+THojiGHaD5bnRg/nZni
	jgOmTv0Zu+0gXJuhAQ0fxiBuL3jqM7ro=
X-Received: by 2002:a05:690c:dc7:b0:858:452a:3a92 with SMTP id
 00721157ae682-897308fdc31mr46827077b3.9.1790088246304; Tue, 22 Sep 2026
 07:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260919152240.1507914-1-anmuxixixi@gmail.com> <20260919152240.1507914-3-anmuxixixi@gmail.com>
In-Reply-To: <20260919152240.1507914-3-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 22 Sep 2026 23:43:52 +0900
X-Gmail-Original-Message-ID: <CAKYAXd99=QNEFH3n_=PyAYFrmTkqqxsBFHamYYnfOoFNex52Ow@mail.gmail.com>
X-Gm-Features: AcwNN1VbLLPsV5lOKFwU7yVmxVYAIzMTj5mEWuJYxp70mFyn5tER_B8dYFqZd1Y
Message-ID: <CAKYAXd99=QNEFH3n_=PyAYFrmTkqqxsBFHamYYnfOoFNex52Ow@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] exfat: retain the next empty directory entry hint
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, chizhiling@163.com, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -516,6 +571,7 @@ static int exfat_add_entry(struct inode *inode, const char *path,
>                                                    dentry, ES_ALL_ENTRIES);
Should we invalidate the name filter when exfat_put_dentry_set() fails ?
        ret = exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
        if (ret) {
                int cleanup_ret;

+              exfat_name_filter_free(inode);
                cleanup_ret = exfat_get_dentry_set(&es, sb, &info->dir,
                                                   dentry, ES_ALL_ENTRIES);

>                 if (!cleanup_ret) {
>                         exfat_remove_entries(inode, &es, ES_IDX_FILE, false);
> +                       exfat_invalidate_empty_hint(inode);
>                         cleanup_ret = exfat_put_dentry_set(&es,
>                                                            IS_DIRSYNC(inode));
>                 }
