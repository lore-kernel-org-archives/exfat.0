Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501DC4A8FFB
	for <exfat@lists.linux.dev>; Wed,  2 Sep 2026 15:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363320; cv=none; b=FqdftASrMxhfeETe7GrlH4Kw7iqfs93ongbykoqJ5TWV4Cq9y85fpv/RDYLXkgdk6NnybUcP1LJV/2xLvrWYElw7d0Gp+FMniOqEafTlKg894JheBi8hU8Hs1MHga90O1cFPtZ3hYSKZ+MBMi8/9lFIsEfnDtLwH+IeWcjlB9vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363320; c=relaxed/simple;
	bh=nnaE/lgaaxlW0qXC3erEuEvej+PS7uE+7YQNE8NWkpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K6KgJwR8tyH6cqU1BuY4zQfSMMEhSJ9RpmaMO5EHpF50smK9nsbYTShnq+jvNUgAoYBn0vs4JoqARqXPrGon6gISeJERpqHM9mJWeQBy4EZBGIUSIDOey0bqvelRPCRy14e0WsclnU5JhNzCtdmRr4Quk/SoWKGSM0Le+AFocG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tbye06va; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tbye06va"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so1038976b3a.3
        for <exfat@lists.linux.dev>; Wed, 02 Sep 2026 08:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363315; x=1788968115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSXsJ2pLDAqrsV6cZ8D03H1qT0HQeSfWzk4uY+cN5NQ=;
        b=Tbye06vav7E+u8OiKGhX5oCC4OssyKj0dzWdORF4Qyot8DnHnu1dL25MmJnN/ctUeO
         6cuPYSSqSyaD6zlzvFYCzdWCQzAYEpk84MINcLnE+FaFY+JwHoGnpgPYRamFTsUa4IuE
         cBYjtAuqecacwzDzdALBqCmzRjw6X4ojEzDP3a8gTdIcf/xPwZKc+QgvSPFa1YcICVy0
         tm2hxbZuLbd5q+QQiIKP+YtThpZSD0YztYCCeGSOtMYDagI2zpSZ5JAWeQAYY0yJTbGQ
         CWLlJ7KGjJAcsj5Uzqh/AzlGsBt2WJuMohWYNuT89MXSzNDalsyNTFrse8AWKApcfj/U
         ridA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363315; x=1788968115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSXsJ2pLDAqrsV6cZ8D03H1qT0HQeSfWzk4uY+cN5NQ=;
        b=FQaJ9bPrVIHhauzNKLiwsqJf/HsF5+0IlW4Q2u86LO7CFI8hNf01UsIFEJrV5jDdFd
         XQT7bcsu73jDUSIGUWFBFh0UTx8Ss+42L3NcRsn3t5GOsjm/9wemnXut4+rZLQqkuBWB
         HxjpO5Wbk6XTMwMfZrSy+NPb9S4KIqqaPZMnkIwnGZKBJxqOLfvH2gFrkAEdh3S4sQaN
         loCFr35SI3pqLjx9eOJed4YshRvfArGwDZjQex72V9q99sNjCyB/bDB+2d3udFljr7wo
         N2H5NJ1yVa+soECnP/mXZWkCj3zoAf+xYg9pixrFnaurDXN77Y+74yFYEvyIYNvoSMwd
         H7bQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy3KzOzVxggwwLW8mHJ7Cr8We9Rj9PCAXpdrawtwmTh5NSNN6DW9Ylu2P6RIJtRBYBOPccsQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mtclyQO2I/GGiB7U4cFyphPN7zEfvs4lEsu10cblo7IDrqhNOu
	0zjwWuUrwM1+Swc+nmvTqz42txOEa9jqJU3nMiCHgxV9qP4VNWNjuqgc
X-Gm-Gg: AYBFou0y5mEDLzUa9x0te2zZqaSYehqCRdYmr0NY7E6c0+RZ+GRphRxZxRwqm4mrs+G
	zBudxgd1eC55ntQVPjfhE8ppgs+W0PKMJMCVpCpnKfhFDZQbnGNuWD83ZYFLyOQ6NAb5L3vlJCV
	yrgQCrrwgrZb3kvRZq2GxDKPQ/bQuE65iqms6V1L6A3/jZBMKjRmY3EKELIUJON9x9vNYW6U2zp
	sSkYgoTXGHiiN351CfEf7PolhfGD5LDmZEqPP9QxcEBugbD3dhhOmuYrUZ6SFNUkEW7mRlF+CTz
	+YpH+Q+Rq4rNGpqShNlHHZ4sTsQ1MaWNyCBan1d5r4icQJ+pCb6GI9XYWm6iapEJeRSlxRkmszz
	w/i8BoFffqBSXcrIDrw0GRrQq6+6Wm4uiP5r/6BQ++RQFJRfAQS8gRXlx/j5+nRHmTPCWW2BPjb
	ZpdROo5TtLVqVEju+u2OTlOQdv8sZuqiLSjQTz/IxeodD4PyKd7RFsLXQ1UcG0q3wfioBg0NgzT
	90=
X-Received: by 2002:a05:6a00:ac85:b0:845:ce5f:c926 with SMTP id d2e1a72fcca58-85ed21ed9ebmr9958248b3a.1.1788363315332;
        Wed, 02 Sep 2026 08:35:15 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2ad3eabsm1656147b3a.13.2026.09.02.08.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:35:15 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: chizhiling@163.com
Cc: anmuxixixi@gmail.com,
	exfat@lists.linux.dev,
	linkinjeon@kernel.org,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH v2] exfat: speed up file creation in large directories
Date: Wed,  2 Sep 2026 23:34:58 +0800
Message-Id: <20260902153458.1277254-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d112a566-eaf0-4db5-ad33-91208b98e82d@163.com>
References: <d112a566-eaf0-4db5-ad33-91208b98e82d@163.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 1 Sep 2026 15:45:24, Chi Zhiling wrote:

> This is a fairly large patch, which makes the review a bit more
> challenging. Perhaps next time you could consider splitting it into
> multiple patches in a patch series :)
> 
> Reviewed-by: Chi Zhiling <chizhiling@kylinos.cn>

Thank you very much for the review and the suggestion.

I agree that the current patch is too large and difficult to review. In
the next revision, I will split it into separate patches for the Bloom
filter, empty-entry hint, and shrinker changes.

Thanks again for your time and the Reviewed-by tag.
