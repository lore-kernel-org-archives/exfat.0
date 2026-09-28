Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A9D35675E
	for <exfat@lists.linux.dev>; Mon, 28 Sep 2026 05:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790572893; cv=none; b=UgG5fV12rhSffeJw/001941D8Qux9EbEK4LX1mx1Titt9g5Caj8czYEGjswm9j0rluejWhbExLu9qmzGyzQPn5u82YaSWgwmVg1Yr2RfsnY7ok7RLNuHQuKB7lw+Ljnw4w6qNJHBYEVeLbJvr11a6r0LXVFR4aj9QAEbTgmb+Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790572893; c=relaxed/simple;
	bh=kfwsWCeBCc6CpVXq49BlyyFOotTaRhwbGUrliVBhwlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oy3RmTUj6Lk5oaMr3Pv8NLW1jELlwJuhznVJ6Ex32wQ8kYicENCeorfi2vYittjyQT6FvltOylI4Vh8bR1hGt32DnIeEilnZiC4h/ACFFyBMicACRoZ33li3uu77X5hX8v+JJ9/Xj1sybUZWpOriDRAjLxRdYt/U4LDkUHRnAe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fr/1K0GT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fr/1K0GT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DFA1F000FF
	for <exfat@lists.linux.dev>; Mon, 28 Sep 2026 05:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790572892;
	bh=lv49VszNXO1u4Ah+gG4wn7WA6kBQ6WLyLdJDnQRaxUo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fr/1K0GTFe1uxTyi2fx0f/EYT7zxQ4nli5d/xD/rES7oyuVsAMFX+8Qb2ypV78Qxw
	 qGGymosuh9ibFFCnu68kO4gJqZYBII5aBJgzPFwgZumDuLypvhqKf9IhStQWOJ/zFK
	 UwtUh33jHvd/KnHkC84mLmbbphkB0KEkqTBN+kzzHweux2y95M99oF/XNyz4Ok3ap0
	 jnQ2xFYNSLWiKTpFEEWehaBbY8MJj7WumGLPFnygNuGPYFP1iAcfTmd1ocPeXh/P2R
	 R0LTNb1dDZbvynE/UAAkBOjuO+hBisIw4XYi+qyJ9ovNUsjEUzKcD1fz7pemoYQOxD
	 DRKoQ3GxDNxsg==
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dbbf409b8so179767866b.3
        for <exfat@lists.linux.dev>; Sun, 27 Sep 2026 22:21:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy+1vaCwHgOiKIi75iIy6aOI73qqsu7fs5mLxTXwKL7OJXEYtermG112BTZohJs/UvGG+Xqwg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIZ/kfdu4jT+Wyng/YtRQ+mtiTeFw/StFD75351uI9WLcznGI4i
	k837M37BjE8vGbn1sQfFMwHpxCN6hgEbK4JqX3X/F3m/rxonNgtyfYuTpYaNLfCIRhhOQs2kV5+
	MDeVJxSl7nZQU2Fl+5T3y5Q/HwRy0SBE=
X-Received: by 2002:a17:907:6e88:b0:c2a:b1cc:158d with SMTP id
 a640c23a62f3a-c2ac24d3eb6mr1066458966b.32.1790572890660; Sun, 27 Sep 2026
 22:21:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923123300.1626723-1-anmuxixixi@gmail.com> <20260923123300.1626723-4-anmuxixixi@gmail.com>
In-Reply-To: <20260923123300.1626723-4-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 28 Sep 2026 14:21:17 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-mfrPQvnXXE-SOmwY-Vr1mZgi1B=qoFnO0sfFYdzqqiw@mail.gmail.com>
X-Gm-Features: AclHuK87QM7Bjcs8cJ0sbqrQSsIPDE5dPT6ielVvjeU9GS7lSEs89ZLqaYnJ41Q
Message-ID: <CAKYAXd-mfrPQvnXXE-SOmwY-Vr1mZgi1B=qoFnO0sfFYdzqqiw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] exfat: reclaim name filters under memory pressure
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, chizhiling@163.com, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +static unsigned long
> +exfat_name_filter_scan_objects(struct shrinker *shrinker,
> +                              struct shrink_control *sc)
> +{
> +       struct exfat_sb_info *sbi = shrinker->private_data;
> +       unsigned long freed = 0;
> +
> +       /* Avoid reclaim recursion from a GFP_NOFS allocation under s_lock. */
> +       if (!mutex_trylock(&sbi->s_lock)) {
> +               sc->nr_scanned = 0;
> +               return SHRINK_STOP;
> +       }
> +
> +       while (freed < sc->nr_to_scan) {
> +               struct exfat_inode_info *ei;
> +               unsigned long *filter;
> +
> +               spin_lock(&sbi->name_filter_lock);
> +               if (list_empty(&sbi->name_filter_lru)) {
> +                       spin_unlock(&sbi->name_filter_lock);
> +                       break;
> +               }
> +
> +               ei = list_first_entry(&sbi->name_filter_lru,
> +                                     struct exfat_inode_info,
> +                                     name_filter_lru);
> +               filter = exfat_name_filter_detach_locked(sbi, ei);
> +               spin_unlock(&sbi->name_filter_lock);
> +
> +               kvfree(filter);
> +               freed++;
> +               cond_resched();
> +       }
> +
> +       mutex_unlock(&sbi->s_lock);
> +       sc->nr_scanned = freed;
When the LRU becomes empty before nr_to_scan is satisfied, this
reports nr_scanned == 0. do_shrink_slab() subtracts only nr_scanned
from total_scan and retries while total_scan >= freeable. For example,
with one filter and reclaim priority 0, the first scan frees the
filter, but the next scan makes no progress and the loop can run
forever. Could the empty-list path return SHRINK_STOP or otherwise
ensure the remaining scan budget is consumed?
