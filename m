Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0A8134CF
	for <exfat@lists.linux.dev>; Thu,  3 Sep 2026 01:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398911; cv=none; b=SFT2x29I3Gtj+RS8tPeX7yzw4ODjWkwGnnynAYnd65u5K/cg5jW+EQYJUBegvQxmwgz0mK3coebm0Rr64ZzKBFF77boSbrQICnse1cXOuTi0MtdDfmm97pnRkSPytuCLqbDLwVhSCFvQqLZiEHbVbmxdhGG/3MslAsitS4AtN9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398911; c=relaxed/simple;
	bh=4xOnadcMOQR1iq4aMwaAlNILrCSyxkQExNycPjTdc0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGfQhn8NQLvpmsDNNkjqANic96JJ5IE2/TsvLvTQvXk+j/PbWRZuPkA0U6NQgbpHNtKGpZGvJJCNzLnaPIi5d0f5/rzRueZg30hXf2UplOOGHtwF4/gba0DB+YSoeyUwc93TGPuNTJMCV2NA7rBemI80LxiNamqojmKuqr18JUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oH1Euokw; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oH1Euokw"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf452def93so4408005ad.1
        for <exfat@lists.linux.dev>; Wed, 02 Sep 2026 18:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788398909; x=1789003709; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MRkRBFX7dwbmk2VK2DrhLAUHHMrT0BgcjiPAyjzJtFg=;
        b=oH1Euokw9KoS6qQpnhTH2hj0FBAsO2gTOF9wtiRkVImpRxpk4L71ro4OKNWqA3eK6S
         ucDWOnqnKaVHKjauDOe2B/a9Xp+6F6bxDKkw+aAOTG/plxalfXEj3Gl8OKL7P5qYI9yl
         Su89007ZPBaWaEFucN07y1MwFsqobfofL8EJhoZ0yUietWlFq9jQqPXWGpLcGAHyM2at
         XG5Gf2xXo694sBDukGWPYv1NigKBfnWik263gJrrkLGl4A4MLNT6klRD/VSoNr42vCY/
         w93Y5nTBiI4Cm2jn5Gt2erAjrFZ+ABSRrUISJub+jtqh1m8/N7WDAPz5tmfsexpqCEis
         W+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788398909; x=1789003709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRkRBFX7dwbmk2VK2DrhLAUHHMrT0BgcjiPAyjzJtFg=;
        b=WlqhQN4+g4OuFRbT6YGlKj6cmQXss7Kw7/jXqX+HKADGv/6LGbTWEnaW+9gmsr8xy1
         JSCk7XCLDNkdC++tXLh34UT+CpHVIwXXW1kfsq2kX/FyQWC0dI5MIe4tY751O9Uhv0v9
         Vz8wi+MDZ/WPhXA33cM+B8tpgDlrXNYo09h1qQj410l6aJiTURauguv4cKF4I9bXTpin
         Swp+JPNI2x4CyAMG0appYDmr3FtSd1mqIypWpbleQapc32BPep+SA+ZI+EFGn14co7ia
         WU3qqOlc5c+5/C2unxSxhjYK0e8Fby17NLXAzDr4JlCoYNMh8C1CZ96lRmSr5FX82bBB
         zAWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwa3AFhOZ5shmR/AgnQNQYPLoC8ZhIA/RJpiRP4bDBwdyMvgv+N36SYqIVfqtr7GEsXBZCNdw==@lists.linux.dev
X-Gm-Message-State: AFuF++l1D+Oe+CDUiIjwzyGJU2GcXksRcUnRqWa8KzIE9HBUNwav7ti6
	qdUfjEnRSQVZ4fqaLaFjtMp+8us243X/1AVSwg3mJhZgsEPnyNPWhBNwaZG2Tw==
X-Gm-Gg: AYBFou1++9a1ESnq7KhwxtGDPEgHHy4bXihENu7uHQmNixeB2ZWcGD9lV2iw+K5bAE9
	HZSwhsEpXQNIY/tVLOpTDc6AazDH/Q+Y3Cv0wlYp3BIPBhopW1RMtfvaVuPu+fGP+Zm8uwC76lz
	tTK1wV8g/vFV+ILfyH5WFbkmlBsWiei3J9xGPAbY6TN9rIgnXYFSGzcghegKo+lMm/qaBb6/ROK
	KvC4YV1nmhbBv5DJTpw2Qiv4rjoYbD+lr2u0WGHRzrN61DREhRnuCvwiuWBlUeRV83kf1Ci2z7Z
	W5mEP8xW5323hygjE0FPXNgezhFtiKSQlwph4gLj+F5HMlZUOlCiCxgs5R86sv/0dvPqGqUcd8x
	6rgkFmHauJJVyMiVZJHnPQtiCSpDwEL9aOhP5oUcseILRrUke4Pzw+zAX/Dj0yscaODGRPhCc3D
	5S9BzSxF1DBVLpdLkZ2biZtQRTgX00ydBS79Xjcw1ucF0y7lPVslI=
X-Received: by 2002:a17:90b:5106:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39b131c0cd6mr599119a91.2.1788398909478;
        Wed, 02 Sep 2026 18:28:29 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0832c14fsm1949860a91.3.2026.09.02.18.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 18:28:28 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:28:27 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: David Timber <dxdt@dev.snart.me>
Cc: Namjae Jeon <linkinjeon@kernel.org>, exfat@lists.linux.dev
Subject: Re: [PATCH] mkfs: set perc_in_use to 0xFF
Message-ID: <apjNO8uTmHQIrRH1@hyunchul-PC02>
References: <20260902122551.14090-1-dxdt@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902122551.14090-1-dxdt@dev.snart.me>

On Wed, Sep 02, 2026 at 12:25:51PM +0000, David Timber wrote:
> Currently, mkfs.exfat always sets the perc_in_use field in the boot
> header to zero. This is not the correct behaviour since there is always
> going to be used clusters for the volume structures like the allocation
> bitmap and upcase table.
> 
> perc_in_use is only an advisory field. As the number of used clusters
> are determined later on during the formatting process, it's not worth
> risking a huge code change just for correctness. Therefore, to avoid
> confusion, set it to 0xFF which is the magic value that should be
> interpreted as "not known" according to the spec.
> 
> As the Linux kernel exfat driver currently does not modify perc_in_use
> at all, unless the volume is mounted by an implementation that modifies
> it, it will always be read as 0. Setting it to 0xFF should somewhat
> alleviate the issue because the user would at least know it's not valid.
> 
> Signed-off-by: David Timber <dxdt@dev.snart.me>

Thank you for this patch.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  mkfs/mkfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mkfs/mkfs.c b/mkfs/mkfs.c
> index 0bc4876..609654b 100644
> --- a/mkfs/mkfs.c
> +++ b/mkfs/mkfs.c
> @@ -388,6 +388,7 @@ static void exfat_setup_boot_sector(struct pbr *ppbr,
>  	pbsx->fs_version[0] = 0;
>  	pbsx->fs_version[1] = 1;
>  	pbsx->phy_drv_no = 0x80;
> +	pbsx->perc_in_use = 0xFF;
>  	memset(pbsx->reserved2, 0, 7);
>  
>  	memset(ppbr->boot_code, 0, 390);
> -- 
> 2.55.0
> 

-- 
Thanks,
Hyunchul
