Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC3822425B
	for <exfat@lists.linux.dev>; Tue,  6 Oct 2026 06:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791267154; cv=pass; b=Y5GVK/JBdZqFTR1w1wByxyEKXh6LU2fxFnQnZz1gCccd5/DwC2wbUGLa2F8eSJKuHJwhbWNQD7ziFJmVnQAEoAzV/tKVkm0UV9L1+VDJHDIkRxiVbUDJhyfNrKKYpw6NeUKnfV9KzsG8o+/jSHjzM8Yqp5r9o2gwvDNHkvgbRhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791267154; c=relaxed/simple;
	bh=UE+aZfygWDIbQst2/lRezwXEatwAz9yAx/dXyJ31oho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvoc2BIB4s8x8ULkQVg61nolDGIvsT+gpoETNwDfM8dERG+o2YD/4SXFQlXpJlrgrlj8Dr9N0YUH4wwsGZkbXp/s+mHC/t7/xO1S5vljhrYIN1zWf99k3Zc9HWlRbvlkzMPotZTsa34zhrXno0cL7DQlSMpLZSIN6b3kcEHVcU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buEO7hXN; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buEO7hXN"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bad794b197so182817e87.1
        for <exfat@lists.linux.dev>; Mon, 05 Oct 2026 23:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791267150; cv=none;
        d=google.com; s=arc-20260327;
        b=G8cMqOvJyRUZ98MUPyoC+Z5b/wXnvqvKtuNvsoodjpCB4PVKqLYJ67XneM+0L2rb9h
         +2hppZ6Mg0oQB6JICRjfGdOAyzv1t3QA64lUkWq1dS6L8WIXH0ic2qJQTQMpnwbOoSjR
         jgRCQvwcc7x6kcNmTEOZoxhBzFpgntwr0Fob/ZgZ3b7gk+dxnIbJKFUwn9qAlkfUaV+O
         0mW7GdQWVR7iwpCl1r5j2CPWChg1UC/V2DIvt1ugaFsvpFIC+xihDGf/T1CvT6XyXe1C
         BHXzvHWdb70zZKcbudW4DeLMj1fySNelnjbsXLzOPaQWcEvFZmQPcrmfqf+HWer2a3CW
         Wf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ai1glgy7O1dTwH2rc5AFb+OUzqiv3zK9RBdVpPZB8/0=;
        fh=IUQZad4Cl7qjpaEmWptObj37rSlLVSReQel8axLDDV4=;
        b=bvjgkSHVcmxPkJIyfiAiGCrtD6uedXq77eqLxLoXDH11xJjx9bzKtXCc9CCzm/Zjdg
         wHI16EG01YO5XObwGDpCAUUIOYK0Zwzv3hVfRBQa7sbVGogBlkUVPgZIFuaavBaLooLm
         8mFdC/ixVsOZmQJ3ba8FUvYohetzV0ZA3tSB8fTB8UvVMVRaEOjbWY84UFtel+TuVjL5
         RXWy5ZfSksKxOw8uG2KVQlP3SeGO1/b48BxPFEMlGO1+MKacWjjyXHqFcVrOzhqDN32G
         AAP0Fuywgu0svKXRGvdqWq9VHDw0fS2M01BusJJ2JHl/SrvbS5Tlc9uxork9HqeXR8i8
         AOdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791267150; x=1791871950; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ai1glgy7O1dTwH2rc5AFb+OUzqiv3zK9RBdVpPZB8/0=;
        b=buEO7hXNaxsuGtt6JKkBT6KLQ1e5Dfjv0PZnH+xcILENvOyGt/SdI/DvPc/jb0NXD0
         eZcRwtL24u9+TFJ2lTKZiOdGHFEmFcPT0eIDuTGYCZvTZJmiejPSHwybGWc4nsfOF1Xi
         abTzHq5lAj14++EUICdrW0A6Z4w9WXNNWbM3MBcTeTvDFvMRhxL75aT2mKBar/dmt+fu
         glQzTH5nHsoChJ2kE8o4X1o6OCqhyxT3ntED0nXxBWs1SQ7VhXXlL6nabt4CPad/FYLw
         RknACbIJ+a08FGzjGw/vgxP7+9qR2FmbTz+yEDv77T2vkYLQ6KTFr3UhRToKSjmhl6VA
         vOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791267150; x=1791871950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai1glgy7O1dTwH2rc5AFb+OUzqiv3zK9RBdVpPZB8/0=;
        b=fJ/70RxsIf9vA0DFfxM8r43tcDKwB1KpsHYrkM8lDRU64zinABebOG55qB+DgVok5G
         jlbDPGMC62AfnSzK0oiGpQBrHOjd47Liwblwp1AGFpVO8saBpa1tkUnqDH3rrOnV0Jxz
         4lIfQJ9MBIXU69j8uX8JAwI9Ua1gATf3zItp7EHU2UA5oSju70zZqcdN3EE3Gk23tjtL
         0+/lo3sRXCrwVLzc1pdUgig8NStfp7WzzDkQmKSrVSzs6GEaPsNX5v0Ak7zGh8wDTJyk
         muSF5rjfdCMx8w5zHn9Zl54LVNN4GtUpmELNLQdexvGXMkyEeojuJcOm+Hmp6JpLCkRj
         k8pQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqvOFE2MViY3g75NLrNHwC+GYx8Bokdy3zwcXCohs21l6iEgf3H1EW/wvqO52sohjuZ21uJg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJPgy/cx2obKYp/C1ZRvyf1iaR1B70z40+QVaHm2aj+VhzwCwW1
	sFbkfzyXayXG9KWhZUBvc7Pcb/b0vP4DY1rr9W+W4QWiRMGB0Tup19prezHJLDlCmvmWUA8d/vI
	S8Mu6cKED4rfPk9edjdVGUp8hVgkBlT8=
X-Gm-Gg: AYBFou1o5IAUUMlRpuJEbdBiyx9cC9AYDjo9hokvR+xOp+IpHbpiBoOnQ491RUSyJ06
	+GR79xUGXStSCS/gJCxWTrDhoE1n7NsgxWAmAuNJ4IjIsj+01nHF4TJ2sGhCeDN69HW2E+hJt5u
	IiGggEXIkougyqzQ7KSNW79R+EgiJYzUTAAUAztN248GcjBbxI5PLK5lM0ugSvYYvdRrFG6xsZB
	hjJv6dvJhpmHVb+oT9ZT/9wujpqI6J2ntwlMV+lDhgh+V/wdAbLn9ywGmx8YiUNaTe7DUPbWM5X
	rwsCtfcKx1emMKzj01Xvf8bTXyggGNuoodGlg/o2QEsLySy4e8zixfw=
X-Received: by 2002:a05:6512:33ca:b0:5bc:a9f9:b649 with SMTP id
 2adb3069b0e04-5bccc6fb6d8mr189663e87.31.1791267150182; Mon, 05 Oct 2026
 23:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004143452.1902108-1-anmuxixixi@gmail.com>
In-Reply-To: <20261004143452.1902108-1-anmuxixixi@gmail.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Tue, 6 Oct 2026 15:12:18 +0900
X-Gm-Features: AclHuK8WbM2s6fuGb1s_Gyvt6RbyvtIfgvw1yJRCpqfAP7dKN3v2lp1GJWd9Gew
Message-ID: <CANFS6baqmmov6nPMKkw6T1QgtYdT0o1=VFw4nb3-e=spn5SAqw@mail.gmail.com>
Subject: Re: [PATCH] fsck: prevent overflows from invalid clu_count and vol_length
To: Yang Wen <anmuxixixi@gmail.com>
Cc: linkinjeon@kernel.org, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	David Anderson <dvander@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yang,

2026=EB=85=84 10=EC=9B=94 4=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 11:35, =
Yang Wen <anmuxixixi@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: David Anderson <dvander@google.com>
>
> Malformed exFAT boot-sector values can cause arithmetic overflows in
> read_boot_region(), resulting in an out-of-bounds read.
>
> Validate vol_length, clu_offset, and clu_count before using them in
> cluster-count calculations. Also perform DIV_ROUND_UP arithmetic using
> uint64_t to prevent intermediate overflow.
>
> This issue is tracked as CVE-2026-45531.
>
> Link: https://source.android.com/docs/security/bulletin/2026/2026-09-01
> Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
> ---
>  fsck/fsck.c                               |  20 ++++++++++++++++++--
>  include/libexfat.h                        |   2 +-
>  tests/clu_count_overflow/exfat.img.tar.xz | Bin 0 -> 3636 bytes
>  3 files changed, 19 insertions(+), 3 deletions(-)
>  create mode 100644 tests/clu_count_overflow/exfat.img.tar.xz
>
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 5447154..ed8b505 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -447,8 +447,7 @@ static int read_boot_region(struct exfat_blk_dev *bd,=
 struct pbr **pbr,
>                 goto err;
>         }
>
> -       if (le64_to_cpu(bs->bsx.vol_length) * EXFAT_SECTOR_SIZE(bs) >
> -                       bd->size) {
> +       if (le64_to_cpu(bs->bsx.vol_length) > (bd->size >> bs->bsx.sect_s=
ize_bits)) {

Could we verify sect_size_bit also?
