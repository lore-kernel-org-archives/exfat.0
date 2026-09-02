Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2522330301
	for <exfat@lists.linux.dev>; Wed,  2 Sep 2026 01:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788311263; cv=pass; b=Tnqo8vF/AQM9UpsRsOgNA7fHUyG5QisNYB41xC590VsIm9AumGTxFVcoKbDiMO+alVw7y/pUU0ypxp9pxBPwE3cJLmTaf/SSwJ61Fnso0GNPW1pRFGl+0/Ur5ZITquFTwXoozz/xta4E/I33+YpI+9W6LXZWgOqdzUHGiHvQxq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788311263; c=relaxed/simple;
	bh=9ZyCkXOt1SPoVIQIg4LKn8wll9NvhoIjAu5XESoF1g0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gpgq4RyyA3SSQeeo1PKlrjfjYzks2wnca2uuWK5xjIpIZzQ4eb/R5zTXgB+4O7q1tmWBR3G6lM69Fv8VauXCBraVsKUiaiEvVbvmMOGSXwQfp0n5H6yUg3qCWkdMX+lHbWca4w9op2HFbtPiQ48EecIt3k1JMvm1Cx/oFCcQVow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InuPHPDZ; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InuPHPDZ"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b4af730f8aso391150e87.1
        for <exfat@lists.linux.dev>; Tue, 01 Sep 2026 18:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788311259; cv=none;
        d=google.com; s=arc-20260327;
        b=gC5DFfHgIfGvFG2VTNU45jAd+59Yp1pXB+6NzJPFw4V3qcYqei7Vcu83u0ebDKqveu
         gAwqQ+9prp7kMzweetyBAQyBi+eU/O0G7V5OhWywrfYVCm0GkR3Esng+GrPP+YPeTAKE
         H1oi6p9OBdgmm07IWkq80jt4fPGEEej9FApMROyzG/iPmVTgVVNjprkkll28fmYDPM+a
         HSBRCM9uSm/F9UJEcOMYD9qm/h2ySG1hc0rf48eCC90uaBidRGW6wHzzErSQ0VBrDBJr
         o4sTgH4dnR927GWlctlw0LpJi1bTenfNh5aJoAnHhskOmpZ5sw5oC7ZLDWRngSlAOa0q
         a/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=thVN33qbeG55eSg2cuej7g+mXlG1kulBciNhjFWQ5V0=;
        fh=E/k+ek5D11Qmtun4KT0V3MQu8sBaaBopoPFXhpZW5HQ=;
        b=ioBgSZcXJuC6CBdHIS68kdlOv1yJRvHbQ4mY5Xj5+i8u+9kBg81B9kRn8gs4BGLj3n
         l1B1B0oLmeqbgCW0aWhYzGzl9MuVYvsHzHt9S0oVmwXWyIZbO0OHEFzxRpItFa8RDhkO
         2rNoUPYmnUpIotF2/F7clmpI1zF4KRrZ+0IEVSrrQipydGi87H4P5ncqrJ+3C519VLtR
         LAZkdRRUbBzcPDSiSfqR+pnHKpYabIDbKoGR9LfI04Rbb2lvacDbHyWnXnCvA8inTkln
         jetlCdq9qpBXhQ+NkqrZVcsk59Pq9uNYEUYskFFa+UxIWgjCTKbiuq9Tgtzootpdc7UA
         NdXA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788311259; x=1788916059; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=thVN33qbeG55eSg2cuej7g+mXlG1kulBciNhjFWQ5V0=;
        b=InuPHPDZxJveb2BZdALkTd1AhJJZfaXYUwZ1B4GIRCStS3f7Ocf1NLDATGeFc7Jmab
         wEL7EEfpgZfbjI4XQn2wq6qw10YhVPMfJYVEKWZ+nLwkjjlakFhnQjIe1JURbs5q0FXh
         1VIk+dR0Ku+e16idN2CZT+O+m0/MXnjJXUoG//U6PwPwDutsPyyUk6bosvJDgN+kXPdI
         PoxnNjos1v8uO2E5bFUmkADp/Tqr43DItEe/26opF8uGf6ne6cdavJBpZrss6E/vkFoR
         AMFfzAtBTmO1gfMpXXb6qd+U2T63iR1k6nd4jXjkiAB2XqNwlOS8gsSshln5Rcg2OR3V
         Dc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788311259; x=1788916059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thVN33qbeG55eSg2cuej7g+mXlG1kulBciNhjFWQ5V0=;
        b=akTA9fGJnR3ea+NKWtoahgl0r8fAFvIS8Q79dFcoi56b5mJayumozN9NRSF8wgaEue
         j2fIHXpf/DgAs9bND0W9BBfjmTXKgygkOCVwP0gXdceJ5xZusc7kaTbSzuFFVrEXJugq
         WX/SsEq9N9266uAvrZKr2wSDsv2bh5te8B4UBD4fbsPDFKrq+chA4ZpMg7KjfmtZwtFd
         Pb1diuGPB36Yna/TdTlNr3OUojt8OOieF45NqQipjOARqhmQucAqihMU17A7VcjNB6l/
         Y5FMQWI3CNuQfCQ4azjt8blt4QdPczjlDO/BplGV5Nj9zXiETzfbanB4k+SvS1k4C9gM
         b6lA==
X-Forwarded-Encrypted: i=1; AKwUvBzjp/yhZizL+nknoNxpDfIpuC77qlB/qJWpU633xXBcO/GRk5wiNQ3QyR0BOOxGSG9PLn7U6g==@lists.linux.dev
X-Gm-Message-State: AFuF++mdw+vDk4VnDh14rkELwdgBOr1jUVYawoZHuQ4d+mKasxdgcgph
	Gqe2ej6YIHCOcYNASX8Rx0RrIxGt4c6Awz76+1/T1OOk0wj7NE4342xcWFDqevJTVUn57lz+r5Z
	q1pNxb0g6lrRmHbRBY+c9CYwCtwOU+K8=
X-Gm-Gg: AYBFou3CFIJBrdfp3dKHZLx9y/RA6oMmcwzCGnTnjcjiNZZyvMcdWHmfP3z/CVgts42
	zk7DgML+UplFKCtE41E0/ME7yIrRo4f16gn5jB9yaUXsicEfF1MLnQhvdVAlueRdR+GF6ViU0eu
	uI8xEatKq3EYLo7zJs5i8AugIzv4LYXHWf9JAOx1J9BTT4d1TjRYRTOMwwxwAdUEesnMcYmKF0z
	HoGb595tlqdsekrYzitBtbAEaaGcGC4wBRW6G5efdbKuEdWpsi/Zj0ptBri6I55/BBHAxj3spLj
	vOjTYMepgQiAZwKWxbuZXVhbo7rrCO/qxnAPH1EXQlEVGg==
X-Received: by 2002:a05:6512:3b8a:b0:5b5:e1b5:e963 with SMTP id
 2adb3069b0e04-5b608320660mr384864e87.2.1788311259090; Tue, 01 Sep 2026
 18:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901084219.39898-1-dxdt@dev.snart.me>
In-Reply-To: <20260901084219.39898-1-dxdt@dev.snart.me>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Wed, 2 Sep 2026 10:07:26 +0900
X-Gm-Features: AcwNN1VyfGoZWx5DzmJHAV_DgTtfAOS927L24yoMb3aGwhpGnKsohIDDd_ZT_DM
Message-ID: <CANFS6bZ_zSGRk1k8tvu6qvkYC-hj9dRPhjsfSLkxTpbJfjH78g@mail.gmail.com>
Subject: Re: [PATCH 1/2] libexfat, fsck: add volume flags definitions
To: David Timber <dxdt@dev.snart.me>
Cc: Namjae Jeon <linkinjeon@kernel.org>, exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 9=EC=9B=94 1=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 5:42, Da=
vid Timber <dxdt@dev.snart.me>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Add the rest of volume flags(ACTIVE_FAT, DIRTY, MEDIA_FAILURE,
> CLEAR_TO_ZERO) from the exFAT volume format specs for cleaner code and
> upcoming features.
>
> Use VOL_DIRTY instead of the magic value(0x02) in fsck.c.
>
> No functional change.
>
> Signed-off-by: David Timber <dxdt@dev.snart.me>
> ---
>  fsck/fsck.c            | 4 ++--
>  include/exfat_ondisk.h | 7 ++++++-

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index f1934d0..5447154 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -370,9 +370,9 @@ static int exfat_mark_volume_dirty(struct exfat *exfa=
t, bool dirty)
>
>         flags =3D le16_to_cpu(exfat->bs->bsx.vol_flags);
>         if (dirty)
> -               flags |=3D 0x02;
> +               flags |=3D VOL_DIRTY;
>         else
> -               flags &=3D ~0x02;
> +               flags &=3D ~VOL_DIRTY;
>
>         exfat->bs->bsx.vol_flags =3D cpu_to_le16(flags);
>         if (!exfat_write_full(exfat->blk_dev->dev_fd, exfat->bs, sizeof(s=
truct pbr), 0)) {
> diff --git a/include/exfat_ondisk.h b/include/exfat_ondisk.h
> index dde84d6..fdb29de 100644
> --- a/include/exfat_ondisk.h
> +++ b/include/exfat_ondisk.h
> @@ -38,8 +38,13 @@
>
>  #define PBR_SIGNATURE          0xAA55
>
> -#define VOL_CLEAN              0x0000
> +/* Volume flags masks */
> +
> +#define VOL_ACTIVE_FAT         0x0001
>  #define VOL_DIRTY              0x0002
> +#define VOL_MEDIA_FAILURE      0x0004
> +#define VOL_CLEAR_TO_ZERO      0x0008
> +#define VOL_RESERVED           0xFFF0
>
>  #define DENTRY_SIZE            32 /* directory entry size */
>  #define DENTRY_SIZE_BITS       5
> --
> 2.55.0
>


--=20
Thanks,
Hyunchul
