Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31B5440644
	for <exfat@lists.linux.dev>; Mon,  5 Oct 2026 09:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191346; cv=none; b=jtnJIbj1TjBGOBHLXvTWzmIFPTqgYql9bgnfeEneNsJGLmf17RD31XrMWCGsgGa+VPw6LmkGJDAk8NGQFuwdPmW4H8QAGwuyNZVnIncbdmXOObf4jDLwjRf7hJ0bAO7LO+bWk0nwqegIjpl0LUvMQ+gPa7CjYCVkscr9/PCRjEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191346; c=relaxed/simple;
	bh=uzv9HpiXrao0nGGoBNyEG3/YbCbiCTi1NS9wib5tO3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUL5p1jTH/sXxHHJWuxBaiSk7tG+DZedSCGD5+qZwXECtEXSoCw0R+o7+cu8wT0G8fHHUT1j8S3A0MR0LZNv2+PRiIQKiEymCN3dhGfuFO3sn9aTz8uJM3t3XDgHgwBIaQeQLUbqyE+I7dAmbMpudkmtDDTJVI0s3krIAvJRWEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdlVfxcW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdlVfxcW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994091F0089C
	for <exfat@lists.linux.dev>; Mon,  5 Oct 2026 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791191344;
	bh=syhVDDXw2GZrQUkbGrWdUrAGQuwG3IBkkSkYzaePM0k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IdlVfxcWJm8hPpz4Dklv3MszlB39XdId7xg7gyBwKqw1cmkmBYxDe1DYxU3NsnXo+
	 KJXKvHhIVWiabkOkuVxaR9Ze+gyaLW8QtYJqhNKh72SlxLX6s9pCVNzEoZ7ScLv4I1
	 JWgs0jE8qy8m+b5g7MRRWf7jrYYyvMkclonGT0fZhlBCfm/9UTzawI5NrAFmMuyF9V
	 U8Nk6fmSFt8bM6LqkpM+wTeu8d9JH08gqCupIAyaJicYbwAD03Iy074vSBT60BISRa
	 kMx/+ter5gwl7156y4fo4EOonARGciH/JUanhnduJ9TPObKbgQxL2ZeyKUz0nNt0m7
	 409yC17Z+hM7g==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso200767266b.3
        for <exfat@lists.linux.dev>; Mon, 05 Oct 2026 02:09:04 -0700 (PDT)
X-Gm-Message-State: AFuF++khhbnGUWTJeMJ3hf4bdWNN+eQpJsVSxxSbqBkXalQSZ1F2euas
	Xai0hUSpauaMIvLCMhLwsR0TzR1na/g1dByka+k/DuktksvuSgqDzITFXpu0M7DG/jXCkLPfKhG
	OExlk4jT2mzt86IipS1Fox6Sx47YFHGM=
X-Received: by 2002:a17:907:97d1:b0:c26:19e3:e982 with SMTP id
 a640c23a62f3a-c2e6ee4df56mr565098166b.34.1791191343195; Mon, 05 Oct 2026
 02:09:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004101934.1975655-1-chizhiling@163.com> <20261004101934.1975655-4-chizhiling@163.com>
In-Reply-To: <20261004101934.1975655-4-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 5 Oct 2026 18:08:50 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-2cSYwBcAfGtcAYbK95FfpASRrptz4YUf7Ke-cXK00PA@mail.gmail.com>
X-Gm-Features: AclHuK_oef4vdZXEsyaNt9PY15FR2Wz4DHbLxRcVMypxvH34O0r-MnWM8TZEA1w
Message-ID: <CAKYAXd-2cSYwBcAfGtcAYbK95FfpASRrptz4YUf7Ke-cXK00PA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] exfat: dirty all new pages when extending valid_size
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, Yuezhang.Mo@sony.com, 
	dxdt@dev.snart.me, sj1557.seo@samsung.com, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"

> @@ -664,90 +664,30 @@ int exfat_file_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
>  static int exfat_zero_new_range(struct inode *inode, loff_t start, loff_t end)
Function name and comments no longer seem to match. What do you think
about changing them like this?

/*
 * exfat_prepare_valid_range - populate and dirty folios covering [start, end)
 *
 * Populate missing blocks via the read path, which zero-fills data
 * beyond the current valid_size while preserving uptodate blocks.
 * Mark entire folios dirty so the newly valid range is written back.
 *
 * Call before advancing valid_size.
 */

And generic/538 test fails with this patch set. Please check if this
test failure is reproducible for you as well.
Thanks.
