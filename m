Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C73238F258
	for <exfat@lists.linux.dev>; Mon, 31 Aug 2026 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187779; cv=none; b=oYRkzNvrAeWxasjJVQ2ql0WqYkAdhN9VnVi9PP4CLpbB+o8+Vg9wUQbrEIKISclvScvoqEKCJPHfumFNAuKy0+7hPoQRizzqAzk278P10QnO+N4OcrjJfS86uo2hw4FfOgKU3yl5mJndAzdymKAEhdu9IRRozQ3I0gVXVulvU0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187779; c=relaxed/simple;
	bh=Dm0ekLFcAj/yuxpG982vzpaIOyejWJrwUkJ1VtsbJUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOWK9pvGpqunN1c6OH+Qbt7gdx5fBUf9gA6k45xdM7bpw8r2ZYrKkuZ3ISvIc+D+Zyw1jO/6TKlzRhet+3vAWug4EU4RDxvs0QgoTN43Ttq8QAPJyjRfd0Ot4qjamnJjMGwY1YE9EvlFQ+6N1yUXjUwtATn5nnOVjzAMhE60zi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfgwWDZ4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfgwWDZ4"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso3371698b3a.1
        for <exfat@lists.linux.dev>; Mon, 31 Aug 2026 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187778; x=1788792578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kEGzi152LLFM3BvwWAWBHGavgBqFineRqvqnk8g7Y6M=;
        b=AfgwWDZ4gO3EFsIPwoVk3rj5fEiaA20i+1N2evS/X/hE7DjhNyWBwkG1qMWxi0v7zx
         S8eqWxGy84oBsOsIIxKSdIdlLOIi6o5LrgxOi1Rz4dRYxT04FNjk9KyBJRDOul/870We
         jGjY+HtQySSXvZuGvDfO21N7FHUA8r+wQMDd50aFGi/SeJyvlmpKjxE1E+ndoSBB+c9S
         PQI2FpKoc/jFuD543CNUSmZFDSiLF0LzLfuOlqTbsxdpYbzK/AnYmfEuKDehp8luEYnj
         gVD2Kp+4WVKBBQ6X3SmE8ng1ahp5I/vPbhoEcthuGBv6fZpRgyU9vA6GcIqwOjBmOAQv
         +kDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187778; x=1788792578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kEGzi152LLFM3BvwWAWBHGavgBqFineRqvqnk8g7Y6M=;
        b=RTjnIWe9H/YR9Y3nPPMf6P0oT7g1V5zfVDGdLyoXo+74uhyzN/8XeEC/ru2g8t8AYl
         /W9Aeq+m1bKmwc5ovxg5zA//ybnqXAmS+cZCaUV+1CCeIOlHLWjy4BwZmarOLJEvJtoL
         NwNG1CE/rJarrxXurKmef5K6i1r9S6Ebq5GTeY0tVSuXyKBMNQTXRWBvaxYdupY8L0ZZ
         92JE+0O+wLr8wlBmtIo7RFgy0xCjFE5sWwXIJnj/jcHW4iT2g8ueW4XLKdDlrl2cRZ8Q
         B7f/kvKhxW6/Jrz7f3Vt73NjkmFCzZWGBYZYRcrKiNFKWFGgKaF/4myRZj+2uWfYt0l3
         Z6Tw==
X-Forwarded-Encrypted: i=1; AHgh+RqyWQTb9+a1RTuRPXpWL5e9/pMFM50gBPFNrLVZx36MDd9XTgUmHBVRurkGWapukDg7ctK0Xg==@lists.linux.dev
X-Gm-Message-State: AFuF++nbSaZymsR52ZsjtkROwo8dPXJ4IR4yPdaEcWdOxczPcPpCxE+V
	9NrPMNQjoH914a4mxQFhJy9gj43VloI7DOF2JOdeJnMU+S/jS+XLRKmL
X-Gm-Gg: AR+sD13AF1xS9t00V5kVRBWqXJqO2C3corbNJlxR6Gz2Gx5xg5seuvGeb1sXxUCE1AG
	eHh5sZGvikRfANY8mm9FyxLkEwAFmXgWyR8XAE4KR3x+ceMw15RutTCKXRX0YIHev47QcIuVdL0
	rrbDEmnfzyIEaqk+xY+4iovDbzS/EeLrZfvayIf9wiKegT6V4VUNq7PxagYjsCzHrFOyfVWuX6y
	AyavXiLRNdmsTwTACeWm5vYmvp7F7L/oL/Saug9PgR7YbLegP7k/6CBvXk0FkSIw4U1a1zxd9Sh
	2Hc3gq2pjiCgFB+ulk8SXdTN/h2CqLoXfw9Y3TNtM1AdSjXCjfoKiX9VBKt0HQFFkSgBUjbpRRE
	9HAlWvyxxW1BOf78SokfDNTBIwzixQd650BSI5BP8dM4Dxe+0cvyq/DlU5+me4vBzecu3ApbIvS
	0h78h03RCLbmLte+MaL0LSpueLH5xBNFP2mfk6fUvPKyjX2Oi5S24c8e/T7H2hjNvO/lCNMaa4T
	uCc8MMbsuo=
X-Received: by 2002:a05:6a00:3021:b0:84f:6f7e:493 with SMTP id d2e1a72fcca58-85994a72e99mr6514150b3a.3.1788187777559;
        Mon, 31 Aug 2026 07:49:37 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fa7ec2csm3892702b3a.18.2026.08.31.07.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:49:37 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: linkinjeon@kernel.org
Cc: sj1557.seo@samsung.com,
	yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	anmuxixixi@gmail.com,
	dxdt@dev.snart.me,
	chizhiling@kylinos.cn,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] exfat: doc: add documentation
Date: Mon, 31 Aug 2026 22:49:29 +0800
Message-ID: <20260831144929.1597433-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831105330.10449-1-linkinjeon@kernel.org>
References: <20260831105330.10449-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The option list and the defaults match fs/exfat/, including the allow_utime=
=0D
derivation and the time_offset range.  Three things the table leaves out or=
=0D
implies.=0D
=0D
Most of the options cannot be changed on remount.  exfat_reconfigure()=0D
fails with -EINVAL if iocharset, keep_last_dots, sys_tz, time_offset, uid,=
=0D
gid, fmask, dmask or allow_utime differ from the current values=0D
(super.c:789), leaving only errors, discard and zero_size_dir.  Nothing is=
=0D
logged on that path, so "mount -o remount,uid=3D1000" returns a bare EINVAL=
.=0D
The reason sits in the code right above the test: the old values are cached=
=0D
in inodes and dentries.=0D
=0D
umask=3D sets both masks, and the options take effect in the order they are=
=0D
written.  Opt_umask assigns fs_fmask and fs_dmask (super.c:289), so=0D
"-o umask=3D0022,dmask=3D0077" ends up with dmask 0077, while=0D
"-o dmask=3D0077,umask=3D0022" silently puts dmask back to 0022.  The dmask=
=3D=0D
and fmask=3D entries also do not give their default, which is the same=0D
current umask that umask=3D defaults to.=0D
=0D
utf8 is ignored rather than an old spelling of iocharset=3Dutf8.  It shares=
 a=0D
fallthrough with debug, namecase=3D and codepage=3D (super.c:331), so=0D
"mount -o utf8" selects nothing.  exfat_show_options() prints=0D
iocharset=3Dutf8 only when opts->utf8 is set (super.c:132), and nothing set=
s=0D
that but iocharset=3Dutf8.  Listing utf8 apart from the group described as=
=0D
"Deprecated and ignored" reads as if it still has an effect.=0D
=0D
Thanks,=0D
Zhan Xusheng=0D
