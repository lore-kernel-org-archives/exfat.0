Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B170F4DE729
	for <exfat@lists.linux.dev>; Thu,  8 Oct 2026 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471190; cv=none; b=UV0jGapFJvG5dz1H+1qU59D3DrFgAeuZKgTwRAO44deVdEgH6U4SFI1MKCwyB53FhcEiSBd7IiiQUsR7WBHcYlg91UnFYVy9VelkOxPZDoJuGp75qBwdnQxqTMgVRSUcJWk1B2Aj5mfZohhyohdBgTmJmfqd9ArJ5Y4DW9jg+uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471190; c=relaxed/simple;
	bh=urAwC/AHR6k2o6XjuZBsEy8rteW1hqob34J+Gny9FN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZpktlKWEk+MjuWAZHb9z8WVmtLHqCUGEkYVxu79DqUMmIVAfDWTf8rljiTEhxFkpgWPPeTUjYOnIPbKfF+sUxE0KObPJ94kKLjA/qyTdXm6yKKDlCTQ6cJbb1+j4HajGJerGGwQRI4OT96Ys0d2PZFVonNG0nbkH+vrCrcNnmfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESgGx8JO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESgGx8JO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e812e2b31bso5011885ad.3
        for <exfat@lists.linux.dev>; Thu, 08 Oct 2026 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791471178; x=1792075978; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mcg4GSQd91hPkklkKh6IqXtDoFFmCTqU0/wFngdeSYs=;
        b=ESgGx8JONoP9LC++suhX/zIiQyEUw4xFbRmDdO0xm2JiofcrTWP9eCtPj4QgJZQi90
         sGjwnydxz95ddjeRuivT4umW3drN29H7DFYG1XBvjqW6Gxlkm9EHnhumFiK6g55b8slt
         +j9w0HtzKeDWVbg/rGIVKQ7DXHoqnawGnqxIlSN1AqqXaTei1zSDvXWSZjCrHc3TGqDR
         dp2ztgl0f9lGDu7OtxT4ALXujYKzSrTG8c/z0QT9Yp71q/LoHWUqohPL5f1ffGEkL2lY
         7+VczsaRZPOOOESNWRo2ycmXgbEyqb7VTsoKaAMczYDipMY7RvRpUVuOQ8nT7qGo0CLt
         Ovmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471178; x=1792075978;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mcg4GSQd91hPkklkKh6IqXtDoFFmCTqU0/wFngdeSYs=;
        b=T65ZkiZK+mv+/9sY+2EEWalMK3NCbok52hyFfGRrsEznyi7TuL5+m4uQe3iSjIWYnw
         MQ5B0/VLuPmudeAGbwzt9tAdEzyIMhMcCXOGrQdswhMsTzHVYKZNsX46dirjbgLRXecY
         tMGmsXs2xU2slc8fJn/u82T/yCoyIVI6biw4T6rGOf9qPoOgeyMLO2JE1dkxmxeEdhwo
         ZYwpFqPX4q7rzN7rBm3emOiqWgnzUFxV18juYlbAROuTCDrbANY/6tlM5gqbqzYWomdR
         ygpdxfMXl2xDEdVJPQwScwD6v4Wf2FZNPH3FK764biTJGogi1debD02J8T+0I6BY0c41
         E70w==
X-Forwarded-Encrypted: i=1; AKwUvBzL0zVOcNjsN7YTUO0af/Z0pTiSD4YJFD/h29MdBLfaoslBGsfxkHgb2aruEOhuycNsyeOdMQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK7fDDRgOcgTJRGpr1JXOYAGhAmlyVlhJ0zujIDiFgHBzbVRLuB
	sfzKoXuiutEXcyizUSUuyvQT6VodQuPbclxARpUrJ9OQ37PemBhtoJq88L3vn+kZ9xE=
X-Gm-Gg: AYBFou0l9EgsHiB9+W9gTnceyJUXWFj9IXjgl9y1QZPsJxJRSed4C1lPrzDFs52mYJ+
	3mVbrarNkNWJGHJ41gQCXgOHZclqOV2rsz/V8r8+VN5Djp3+H0bQO0i8eMREE70PoPvsWCv1KIZ
	pB1cyt4ZcsAtYT6FPXO6VgLKgl3ibxU1ZSE9wIY4lIZ7sWAlAyfcx/oMtLdzrNv5gTA1/HDpp6v
	n38rJaoiPiXK1huF3xE75BVo0JUDKO9eMsVWU4xT1JclAGrkb2T0PjV/Z5Y2dO1DtoQiwNykDXn
	74VqujlHvia+dB6qh3YjYOfVYTFdwOiNt58O3amYK+42K8q9bTsMXky15dDku2E55uXQ+1rhmAq
	I/u2dLXRcCCFPPWeWmg9GNiyIK64vc6sCQs3ZA6YCCmIgvwh9H96Qh/1Sv/SwYVm+qVX+1Ca327
	q2ryw7+Ugw4gca2gn9PyUtLbRJ6HzhVLux77maqa+3pa4AvvHdIghEOufxz0x7iBlfCvJzYO9m6
	8zS/Y1Ly5CT
X-Received: by 2002:a17:902:d54c:b0:2dd:c100:4b78 with SMTP id d9443c01a7336-2e60053975fmr48794305ad.47.1791471177661;
        Thu, 08 Oct 2026 07:52:57 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046ff618sm26231535ad.24.2026.10.08.07.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:52:57 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: hyc.lee@gmail.com
Cc: anmuxixixi@gmail.com,
	dvander@google.com,
	exfat@lists.linux.dev,
	linkinjeon@kernel.org,
	yuezhang.mo@sony.com
Subject: Re: [PATCH] fsck: prevent overflows from invalid clu_count and vol_length
Date: Thu,  8 Oct 2026 22:52:39 +0800
Message-Id: <20261008145239.1949779-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANFS6baqmmov6nPMKkw6T1QgtYdT0o1=VFw4nb3-e=spn5SAqw@mail.gmail.com>
References: <CANFS6baqmmov6nPMKkw6T1QgtYdT0o1=VFw4nb3-e=spn5SAqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 6, 2026 at 2:12 PM Hyunchul Lee <hyc.lee@gmail.com> wrote:
> Hi Yang,
> 
> 2026년 10월 4일 (일) 오후 11:35, Yang Wen <anmuxixixi@gmail.com>님이 작성:
> >
> > From: David Anderson <dvander@google.com>
> >
> > Malformed exFAT boot-sector values can cause arithmetic overflows in
> > read_boot_region(), resulting in an out-of-bounds read.
> >
> > Validate vol_length, clu_offset, and clu_count before using them in
> > cluster-count calculations. Also perform DIV_ROUND_UP arithmetic using
> > uint64_t to prevent intermediate overflow.
> >
> > This issue is tracked as CVE-2026-45531.
> >
> > Link: https://source.android.com/docs/security/bulletin/2026/2026-09-01
> > Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
> > ---
> >  fsck/fsck.c                               |  20 ++++++++++++++++++--
> >  include/libexfat.h                        |   2 +-
> >  tests/clu_count_overflow/exfat.img.tar.xz | Bin 0 -> 3636 bytes
> >  3 files changed, 19 insertions(+), 3 deletions(-)
> >  create mode 100644 tests/clu_count_overflow/exfat.img.tar.xz
> >
> > diff --git a/fsck/fsck.c b/fsck/fsck.c
> > index 5447154..ed8b505 100644
> > --- a/fsck/fsck.c
> > +++ b/fsck/fsck.c
> > @@ -447,8 +447,7 @@ static int read_boot_region(struct exfat_blk_dev *bd, struct pbr **pbr,
> >                 goto err;
> >         }
> >
> > -       if (le64_to_cpu(bs->bsx.vol_length) * EXFAT_SECTOR_SIZE(bs) >
> > -                       bd->size) {
> > +       if (le64_to_cpu(bs->bsx.vol_length) > (bd->size >> bs->bsx.sect_size_bits)) {
> 
> Could we verify sect_size_bit also?

Yes, good point.

This patch was taken from the official Android exfatprogs tree and was
authored by David Anderson. We found it while reviewing recent Android
CVE fixes and wanted to sync it upstream, so I would prefer to preserve
the original patch and its authorship.

The sect_size_bits validation is also a pre-existing issue, since the
current code performs shifts before validating the value. I can submit
a separate preparatory patch for that fix, authored and signed off by
me, followed by David's original patch as the second patch in the
series.

Thanks.
