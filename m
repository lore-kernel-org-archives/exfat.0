Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C5444A3ED
	for <exfat@lists.linux.dev>; Fri, 28 Aug 2026 12:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920452; cv=none; b=Kpe95B91zNTWoSgObykq51QX2cn6r4v1+1l/D2Iw9vUgwVaC9apWBLmU0rUOHiqX+hmtKKshwJT0s6wOehRpKXGbowDX5PDqVcTFcxYx09bcd5jNhH7iXwn2wcbyFbEfa3YbIjVAGHBAYAQJKxE/uSyA4G3dKq2X9oGBIGFsFDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920452; c=relaxed/simple;
	bh=81KqIzUsGy1qulpSNvHF5tHp4EdkXa0CFFj1Th1yeB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PbHIkhQFtY4sZE9MtuZKV+ErPbwiqejj1XybaOwB6/TwEoR66/GaLLXpT9N/U4WllwdTpI6/LhRDwg40Jw+EXrofTOqLe9yvL4fxdbdfJ1G7IS2ZObHYvfyecTpRM02tAtxgSLduIwntUei9nNSZA9VN0fvSDe0di8xp1xAkIq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOSQl0wy; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOSQl0wy"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso888541a12.1
        for <exfat@lists.linux.dev>; Fri, 28 Aug 2026 05:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787920441; x=1788525241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81KqIzUsGy1qulpSNvHF5tHp4EdkXa0CFFj1Th1yeB0=;
        b=IOSQl0wybbBcglRv1UrcB2l4CrlTdU7a74jApPCM5tUOU8wbaw/2/T25aMFb3Aajl0
         4AcCXtiSKk9bzptdniZXWEqRuXSDVQhnfG0XXLIDPktCa8gDX8C7H0dHIMoiBezolA5s
         EEHGd6xVB108U7DYbi1peXlo61ZahD/TIaln/wOKubR4NmMkMHon8Jsp9EGkoCocG/Dw
         uP+qJB6obT52q86oTAlrfiHmwDmVeDQdRnXEaIOcYdskJQEOXh5muBVNv8nnGjlSpiZ/
         kVRpJ7FGrxEPNwlf06pvkb97SiBmAvj+80kNv88UaOvWrYtAJpUyrXXUWXyHxzFaRYGY
         SD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920441; x=1788525241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=81KqIzUsGy1qulpSNvHF5tHp4EdkXa0CFFj1Th1yeB0=;
        b=qDvan6/EumwoJaNVH+cuedNvcvC2qvJFbQDqxrT7P4kY0/bTUBDVfENDOpXk/CxSv3
         L85sXdc/u5lTaA0pkNwtn2hHmu/7MdGNZt6z8oFLB9xAKYcPAxYqDr/KRB5yQwjpqJpX
         pIJ9cBFg/aVhe1rJ1SxdB5fLrfWF2N3ghZMLMNFSEHtfspBDxJMyNaLT5/7um2+TWWNp
         3z4X28laAaHz4nBkOi9X7t2CBV0EajGRs7cnxcDxWNtCKjIEeBTlogpiAIFyRMe6+STk
         ymto8DPDFn9jbP6EwFZCeO08G+GxhxZFgCkcldMZU6cqMVQLJO4WNpSCs4u9LCqO0fVP
         AtPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZGYiayFLBud5wmIRyxBxIn9OzVJTC1hzav+DGAWtucB5/+d+xmoVcg7mr4Nl57lIfc4kEpg==@lists.linux.dev
X-Gm-Message-State: AFuF++nBq6Lz5xrEXz3CjtHXwpuUYMrZ307vie3uUtxyno9Wcl7f3s6o
	3tdH1NE2spj9mJSI6gb7cXbPCQ9gAsV8mDCOU+cChUhbcm+A6052aEtP
X-Gm-Gg: AR+sD12N8EoLMa46Yggw03MtiqgZCf61NDLj+o8li04UEQYhykup2Dzi+/4B59a/cgT
	vAlSG7xN8JDIJjcke4sTAAf5FPqboUweyV/Fe9DJ//ceocmIclNS4UkwHoNxWtaH0MN1ulV1+es
	y3e2VqNqE1L2AWWewdkUF2sbSxgwrmq9Tlffa1cQB8mUQ2PEwJCzZB/7jeHLG1wX+NuYG/8JBQc
	M5vIf26Jlho2WO90u1uH5yayjloN2JFuAGEzx+FH0g3u3vlnlqCnOFyMUJdX1yEcS53Gj44w0nX
	abPqMfvM3CbX3I2+qZTSoyyKJpkHUwfHZqgYKMRe/FnYylA5KSoSWlBMqWGGZcZ8EAmouNCxG5/
	fef+bKykHOHfJ59LV485t89B/wuJt+xKz7oMEnKIfvhPhJD7CycYFWe2YhEysE0ikshlJd7zvHf
	/c/BofAllLGFtKttC8+0h4F+rguOJClDiZhZQ+SR33HsWnWKOnicrUUsjKdBHkKX8sy+8G2NwVZ
	g==
X-Received: by 2002:a17:90b:164b:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-396d0e27d7amr12963110a91.2.1787920440975;
        Fri, 28 Aug 2026 05:34:00 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1868086sm7009846a91.9.2026.08.28.05.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:34:00 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org
Cc: anmuxixixi@gmail.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH] exfat: validate vendor allocation directory entries
Date: Fri, 28 Aug 2026 20:33:42 +0800
Message-Id: <20260828123342.1095335-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKYAXd9cKQ_Z9ZXRuE8qgA9qHMxO-__pt5J9xxDTyJ-E8PkR-w@mail.gmail.com>
References: <CAKYAXd9cKQ_Z9ZXRuE8qgA9qHMxO-__pt5J9xxDTyJ-E8PkR-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for the review.

EXFAT_CLU_TO_B() was replaced by exfat_cluster_to_bytes() in the
current tree. I missed this API change when preparing the patch.

I will send a v2 shortly.

Thanks.
