Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A26440A0B
	for <exfat@lists.linux.dev>; Wed, 23 Sep 2026 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166756; cv=none; b=UEj/f1YfudlRQseXiEXqdT8dfMb00TkCBPY1LfydRNQJh9Z6S214p230BB8ttx8bI07+hrHZdlEhLQi1bzjh7cONI3PklzELPnk8AXlPWoPAkCUDL5m7ypkwgmRTSn121iDeGJTF1JFzADFvMDIS+os121d8fEnfBHJ3ywuvU3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166756; c=relaxed/simple;
	bh=cWL4fevHSSSX8thrOI3c5H6tW03iYZLERBtXM0woPUA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=heKalYNU/f/O7g7V6Wo1Exo4RndzPUOpw5gCUiR6Aq9NRhJwQDbBA35U3WS8Ks9SfNI5kUR44G1Mb6Svg1XVE6UaS5Ku/EA1afo6Z9z5CWx22x1BW0rBFJPzan9gWkchMyGFw2T/K018UD7LXH5ol9VtspIOyxTZ60UITlS/Oyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YO1d4lsa; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YO1d4lsa"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87ac7657a24so355228b3a.3
        for <exfat@lists.linux.dev>; Wed, 23 Sep 2026 05:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166748; x=1790771548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWL4fevHSSSX8thrOI3c5H6tW03iYZLERBtXM0woPUA=;
        b=YO1d4lsaoXFWc+8WZHHgEFR4DEk0vwF6hVug1buRuwpe3csVD2hvQSHDTmsnKcrILP
         8IxC5NAn0tAKSJt2TBsPdkwbNi+ajnL4g5WdpHe29jcHlfWJBc/LUP/MlcI5/vWWLwQ+
         Q6KPlrFmujizBa9izYeD33WIRFH8CywD8AUcuD1QUqqaPU865m0QmoFTkScwjT2MuE1P
         YhVsTs5PHD8qFV8T3rvlr2dI/Z03NCxBLF0NLEdP7hoNLIf/gjGXduaRN3WQvZmE6kNQ
         YoEnYaelZGzbjNATNrVBnU5hBRXc7P9P1WvpdWKD4CaeZJGPtlg1zbjHGFkpBbykaLmH
         aK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166748; x=1790771548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWL4fevHSSSX8thrOI3c5H6tW03iYZLERBtXM0woPUA=;
        b=YUawKUVzzw8hYPoy6P64dqe4Xa7TAlIGEPUcK/YpL6C3AYFuoklmuPxi9prx6TsV1P
         r03p9H4gHeKvi5TT9Rbj7tQOyts9JMr3HwZpgbw8CBSj9lL7c2sP35Ha6eDbR8XrlwXv
         zDYz93UPtvcn3cNliELYGCYrfz6bfS2WHoZg4lLnqlKQpKtGbCSdSpAnpj7XZUgdtP/9
         uGrGV2tExFgBnfCnB2kDxgh5b4k3pmEZsDZWb/MK9cmI1kaasNg4l64OFJl+E5p42tp8
         Uh5darkjdvpvpeNQjyJkoRESSc3VRvjZq1px2hED78yizP8MmRCBceUXxmt+K7IR8dZl
         uVhg==
X-Forwarded-Encrypted: i=1; AKwUvBzHWPepCd3Da2hympPUwPI4RE5kKBkzIa5VN2z1vDnAiHuEYc6njTFm7mlcXQpNeTZ2reQanA==@lists.linux.dev
X-Gm-Message-State: AFuF++m6j4VbxQ27Z2Az4OdWY1s54/8qA0JKIkTuzSbUQrzjmR9IgvQT
	gjSgKlNoZaaAzgq1jzoj3y+cBUxEhYsL5MulEI8IQr379dScT/1vupZ7
X-Gm-Gg: AYBFou2dPZb+PabF4RLau8qSOR7RbUJ1NRQpAj67TqDfecqS2t9Io38eRIl4zNPwDxq
	1G4kIE3Q7yXxfkqGNjf2HXi5w2TYJ7coWkDhW+ikO+O3fbh8szMCl8v3UPsfuqLU8RQWtWgPoAg
	c1XQDf55F+2gnE/FtacapBWF4fdrXT5Lbppe6yuQptPvtqe0OKLKnQfBICVrvefhKRP2f5BE1Ht
	sAl3pEjrbBFOZIaxcT4uezbq6DdDiroRrE1ZyCLZiX4oBjAbc5bb8nmRDqRXjz02vxRaVnbx0dQ
	rxE/TePZcWrEAk99RgcVmhKrlmYqibW+NKn4hCd2x80Sv9vXyMH+MurjpFJzSXzMzeUunEZ4VOl
	C0CIRwRfzueUheXAR429WCEbsoQy3qFo0yhZiFGzKw06EE3vasVJ07025dkbyN0YrP7JU7uCtwe
	Zi5QojsUg3plZoqwNaOtdBnWMJE9AfN5Uah+634vuOt5xOSxpJeBYMrREB/iXvm0R9yO0w/l9qm
	RvsEdh0szTC
X-Received: by 2002:a05:6a00:3407:b0:842:2419:6c0b with SMTP id d2e1a72fcca58-87d1a7aec9fmr2191941b3a.10.1790166747788;
        Wed, 23 Sep 2026 05:32:27 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c252esm1127535b3a.31.2026.09.23.05.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:32:27 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org
Cc: anmuxixixi@gmail.com,
	chizhiling@163.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH v5 2/3] exfat: retain the next empty directory entry hint
Date: Wed, 23 Sep 2026 20:31:58 +0800
Message-Id: <20260923123158.1626278-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKYAXd99=QNEFH3n_=PyAYFrmTkqqxsBFHamYYnfOoFNex52Ow@mail.gmail.com>
References: <CAKYAXd99=QNEFH3n_=PyAYFrmTkqqxsBFHamYYnfOoFNex52Ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Thank you for catching this.

I have updated the error path to invalidate the name filter immediately
after the initial exfat_put_dentry_set() failure, before attempting the
cleanup.

I verified the updated series with a dirsync I/O failure test. The create
operation returned -EIO, and the filter count decreased from two to one,
confirming that the affected directory's filter was invalidated. I will
include the fix in v6.

Thanks again for the careful review.
