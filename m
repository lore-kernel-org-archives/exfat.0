Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42610379C24
	for <exfat@lists.linux.dev>; Sat, 19 Sep 2026 15:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789832274; cv=none; b=oK3x94h5hAkkloXOVgX/xpHWZicbuXq63m5oDVRBlI7EE0bIw3cMmN7Jax80HkYJpKaWlzlmypZFip7pyhbDwd1wnTEzMcAcoHXSrjb0F7cRzj5WN73gjr7ymUf6wQRDsmI2X5ZTeiK7i2EEdfoyd/fr4AwqNA50m8xrNEl3XVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789832274; c=relaxed/simple;
	bh=VxtObnIR9+/lrSuxuj2cUBhtAltwQ25kfN4SISLzGlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cQhfIeKyUY/2/9qI/8cJtzgEr86L4OCjdIUleFqnNL3ZIIdPlhvcnfMZ9M/gFqpihA8ywrNF17RaTi3RkWTtW2XKIDTLffitjbHCuSdc35i/grb//KdeJ1/duHG/E/cCX6FS2aqu+1RCnnKWBJjKmh3ZSxB55fscpe6Q3wHDtzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0n3oKXM; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0n3oKXM"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so1034181a12.0
        for <exfat@lists.linux.dev>; Sat, 19 Sep 2026 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789832272; x=1790437072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHm/cbyd+HacQpj81iCFhijHKha34yDBdVzS7b1gwBY=;
        b=n0n3oKXMSNHgOA5WMI7dg3O85rXrsSgbzT3X4byvfFZDKeZ0+Hwg4yZ97yszL9IVqj
         KBpKpRsXeZzjSAc6u4dPxsHVRxpyiuP4ZdFxAYdVabDVJeOFkIxaL91SUh6O30mBBPwZ
         j4MVsfTNJnYhsmeICvJE3hlPa+1cdO2HnJTs07ODtTWE9+xKmmp/wYsXJAkU17iyU5Vs
         C+q7TZ45d5S2VQrqP0P4hDQCAmqNVPeGmPOqceQtYNtwmA81stFu/YyDgQBWQLje/vE9
         IUyC5AuwfJkK6tobQRbCURh995Zbc1pi3rW4bRZJHz42pbWYnRq9TRFK6CJymBZ111ly
         9HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789832272; x=1790437072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHm/cbyd+HacQpj81iCFhijHKha34yDBdVzS7b1gwBY=;
        b=RWpdJqD6lvcIwrkcronXxm+6cLPNFrhtJVYl+t1I7wjobirwMRgJt9Aru0vF6/rgox
         3uEI0hWTUf5oD+YSPlPNqtCnuY0IrvyhMd8m34NEcfJNo6U89f+jnzU0qQ6Lcey+DAfn
         ODXNQOVb+KlBHe+DC9Jpi8AwwOPJPbbOEsRtaFm6axCkcwhIM82v1Ztxz2HsWxYzq3lm
         eYHkAeqDYfLBNJ85XrSUUyU0vPYNonFDgBsikyttPBzZ8kdIi87lOMX4atxJEUZtNbNa
         uUavFAWDVzdMC0gqV8oWKEHYj25b9PH8zLNy/ByYImna+++/+tO30wll4KG+W2dr01hJ
         eRvA==
X-Forwarded-Encrypted: i=1; AKwUvBxPbnjzW60qHHOTVoiWA8RM23jxTWfh2QuaNfnLyHVgG3sWh+b+c8YD5PwCp47VxIJzC9RGUg==@lists.linux.dev
X-Gm-Message-State: AFuF++min03Sv3tfwJIYt3eORgcFOWAipNGMkXC7fgd/hY+7UKvPsM/c
	CPm/c5w4heTU/HFbKNWk4oRxuG4+MyDM+CrBBx+XTuiGCUAPmd/A5sar
X-Gm-Gg: AYBFou3ms9oVivDbktsM7PC7PgVmGLkJJzskxlAoPFKy8dCudAauhszB63YH50SO+MS
	GPrv/YzfGWpIjeCPoju3hnybKzzzVong0ycfppkSOGmdilTuwZIHeCGsNyhHUyCWJYKnjhN9n2j
	s3GN/zU3ANrjhEtZg8VZJhxSc1n2gdwBW936UKFsWRjfuv+b5HdBMAvrsWLTO6yvnEMw9rbHcnB
	h1UiBhVhUWO/AoC9r/2If/1IqV0gnwMbccyH/2fEGlYmOw30rzk1JRiM7PTtolRbe6+jl8fT1pN
	mJ+NEY+dwAbzB04tns6rN+nnKR5Yi+ls/wGwVgZ97GJDaZAZIFCvaCzpqZ+ghIJqDzczpcd+9rN
	bHZXumqGs3Y+0BdQcCkoVcV+ZQlzNxbjN1jKxJ6d/yB0Eh7wmTtqmOdCIuZPjvRv1MNCQHI5Qdh
	H6X1QwpX5SxdIFEAaqr8YFCTdpSABre7D13IDPm6+HKzB1i6fmi+hnmB2RDPZ9l4dFxr83bx8bP
	81JizfvzD5k
X-Received: by 2002:a05:6a21:7105:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3dd8c3d20d1mr9200557637.7.1789832272469;
        Sat, 19 Sep 2026 08:37:52 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aeda98csm1066618a12.23.2026.09.19.08.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 08:37:51 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org
Cc: anmuxixixi@gmail.com,
	chizhiling@163.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH v4 2/3] exfat: retain the next empty directory entry hint
Date: Sat, 19 Sep 2026 23:37:34 +0800
Message-Id: <20260919153734.1511310-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKYAXd9pPRi21V_t_h0FSQyU7mN6u3o8wUc8=pusU8fDSMA5JA@mail.gmail.com>
References: <CAKYAXd9pPRi21V_t_h0FSQyU7mN6u3o8wUc8=pusU8fDSMA5JA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thank you for the careful review and for pointing out these issues.

> > @@ -1489,7 +1491,10 @@ int exfat_write_volume_label(struct super_block *sb,
> >                         goto unlock;
> >                 }
> >
> > -               ret = exfat_find_empty_entry(root_inode, &clu, 1, &es);
> > +               ret = exfat_find_empty_entry(root_inode, &clu, 1, &es,
> > +                                            &next_hint);
> > +               if (!ret)
> It should be if (ret >= 0) ?
exfat_find_empty_entry() returns a non-negative entry index on success.
I have changed the volume-label path to use ret >= 0.

> > +                       entry_allocated = true;
> >         }
> >
> > +static void exfat_set_next_empty_hint(struct inode *inode,
> > +                                     struct exfat_chain *p_dir, int dentry,
> > +                                     int num_entries,
> > +                                     struct exfat_entry_set_cache *es,
> > +                                     struct exfat_hint_femp *hint_femp)
> > +{
> Please check whether smaller holes can be skipped. For example, if
> there is a 3 entry hole near the beginning and a 4 entry name is
> appended, a subsequent 3entry name may skip the existing hole because
> the Bloom filter miss bypasses the name scan and allocation starts
> from the saved hint. Unless another deletion occurs, could this state
> persist and cause the directory to grow unnecessarily?
The smaller-hole example is also valid. A Bloom-filter miss can skip the
name scan that would otherwise rediscover an earlier hole, while the saved
hint points past it. In v5, the hint records the entry-set size that
justified advancing it. If a later request needs fewer entries, allocation
discards the hint and searches from the beginning. I have also kept the
hint invalidation on paths that free entries.

> And please create the patches against #dev branch.
I have rebased the series on the exFAT dev branch.

Thanks again.
