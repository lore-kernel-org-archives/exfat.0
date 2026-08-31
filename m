Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58FC4AA3F1
	for <exfat@lists.linux.dev>; Mon, 31 Aug 2026 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189217; cv=none; b=dXYaEyH2TS88TS1TS06KFsXv1jTAIY5MmuaJfilONhNd79ssxJz4NJi2eBHZ4tDReguHsajZ5BQxYK8Ro+Y3pTpZju6cy63Rbr4omBSG52VY4yYGNr5vbEJGPe6iXC8zxW9Sj2HCjkBfac7G/CgvgeTsRLUroyqV9Dg2hwCc/z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189217; c=relaxed/simple;
	bh=QmzjOMvAGe5EUV9TfLYpYcSWajjrdD09LcDHk6HQaQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GhRz4W4qW0ARoa/E7AWUBWPyEZmVp1ss3PTEPMi9ZPFlUA5EdlCNKJhb1wxkJ/odbVet8cpOyhfinexeVaLoEhqGsuSDu3fkdg/9pPPI+K0yqomte1LJJUK81tlNxyWNC/U4OIdo2AtSJa/BgtIo40/R6wBs7hFIKjTrQiphBAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHXD1ia8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHXD1ia8"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8520161fdb9so4369013b3a.3
        for <exfat@lists.linux.dev>; Mon, 31 Aug 2026 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189216; x=1788794016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HVZ0sMwY5VGl0utt0N4y+S5aIM3f5C/jq8p4GsPHw8=;
        b=QHXD1ia8rhsND+hOPzXo9nYrx3iej38FTat+GDk+dMZ/yXWBudop+1wuGrsFw52aaw
         UHBDmFUQsKxUTUS7gTpOqrpfmoQEsoKF8N/Fd0qoilvp4ouhIBR9hjLo79z3mpK99w7Y
         hSEvISigpcQR21UzRME/zY/pj8HW2GaRSzT9zJPwFN2+nem0ZdzmQKOrxriekIctwjf/
         UU6wZaBI/4V6hWpTbUovivBflSktnk5+gpT8ud6k9FRWT2IU5re/TyF+w1gqfODbss/R
         biZLO+slzZZFqIO29Q2243JBkDUYbpdKKgVylqT38KC+Jo4nTOACeWR73cOGZf1j92k2
         yb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189216; x=1788794016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HVZ0sMwY5VGl0utt0N4y+S5aIM3f5C/jq8p4GsPHw8=;
        b=K6KU9I1uTqFuDa04kcYn8qEgdYx1HfOA9VydZ9keXyU2ImQC7ZmFmIXxHxvFxI9BGz
         2diC1wrVTeQRP8ttPjf/u73TIaksVU4UQb7JrH3HyqPLCFzKzY/kqIxJh+/eMFNWtqSG
         otwtFL7vDXhLmPMVgMdi0nJpA7xNH420lDxGRbhtGlXEbBDcXFUPYgZ5eCID4KpMKS90
         P+uF3qEyrlkcesfFgMZdibFlkznyQ2HFyD3MTMtkHodmQs7giCSoZTHJStPfTm9+e5Jd
         YLHHGPy1rq9hKAznRzHXobd5QyCxyJCyo71en099kDZ4KJb9WM4i6LCJC2gHC7bnrur7
         4E8w==
X-Forwarded-Encrypted: i=1; AHgh+RqIbu5wCZDyLuHihdG5l1tcUTohRxJtl4wLOnVnm2Aq0aaBQmyyv3HnPbOGBFRSzdxhb3gxQA==@lists.linux.dev
X-Gm-Message-State: AFuF++kdNJ0gHtaX6swx/Nrcnj9qTN0YBG9AEN7cFnLAHxN0G8k+a11X
	YV0SHxWOzRcMKX404JjksghvbqSzh0j7y2Gp5yB0bLWxb4frBH7ieiVu
X-Gm-Gg: AR+sD10H0XbkC+8jgEDOitHeNs+zseMx2G99zT182wyH2FbXF1o1Hyjbcfhoghs054D
	5Z8NMfLoShzGI0aeZDaKHtkdJafqAU/5sn1h8gwrgS4gtg8fm85JYRME900Ut0eulmBr8ONNC36
	ibkDzDrbQ+wvXtErJjHSGjFE8GmfgGG59CF2Jh+CX7KMX1vk4OBaYzoLiJ4JL2v2uL4sErIEtal
	n7ovWFEu1tte5kkS2nyIohIh9vH7S0R0PlCPycYWiq10G9IortFmIeOmD0lOzd00xwnx0d9LPdw
	zPrPx2Xbm9F4Og27JfUf6MbZafW6gt5AuTb1n9oQKmwMMgGm/Zjui1zUYEE+gDmw+CBuXAXXAc7
	H8iZFfR3J/z26ApBgoP6v30PgQqFyHUMPPL2vOQx1YbldRqrjbFvkX7E83F84/WlmwS7zDTnE8p
	JpfG0iSiqkVceDRhqdu90P8vy/nA7AMism37Mw2w59d6IakwJVoER4zg083DRm7LhHLmuipbRvG
	DQ=
X-Received: by 2002:a05:6a00:17a5:b0:851:c2a6:172f with SMTP id d2e1a72fcca58-85628790cedmr41629163b3a.7.1788189215805;
        Mon, 31 Aug 2026 08:13:35 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569ff73a9asm3887764b3a.27.2026.08.31.08.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:13:35 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: chizhiling@163.com
Cc: anmuxixixi@gmail.com,
	exfat@lists.linux.dev,
	linkinjeon@kernel.org,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH] exfat: speed up file creation in large directories
Date: Mon, 31 Aug 2026 23:13:18 +0800
Message-Id: <20260831151318.1238209-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cabf4253-1d07-410c-8714-062317c9967f@163.com>
References: <cabf4253-1d07-410c-8714-062317c9967f@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Zhiling,

On 31 Aug 2026 09:10:32, Chi Zhiling wrote:

> The exfat_free_inode() could be called in softirq context, see 
> destroy_inode() in fs/inode.c, which calls free_inode() via call_rcu(),
> 
> so you can't call exfat_name_filter_free() from exfat_free_inode(). It 
> should be moved to exfat_evict_inode(), otherwise LOCKDEP will report a 
> warning.

Thanks for pointing this out. You are right that ->free_inode() may be
called from an RCU callback in softirq context.

I moved exfat_name_filter_free() from exfat_free_inode() to
exfat_evict_inode().

Thanks.
