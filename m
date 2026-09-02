Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B47D32AADB
	for <exfat@lists.linux.dev>; Wed,  2 Sep 2026 01:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788311222; cv=pass; b=cEQaua9TlL6Ae6VlpjMpvJi48kaoxtD576yRMIf4V6Vq7kPEKCJFk3T6eqnRypQ8/7cItY1WWNqBMucPbIsQ2HhV0ecByz8Im3Pof5Ao1SI5RHdKzAgq4HA209HWzSiGU0atUvywooZdBR3mr3samJOoQnfKIeU8Vx7ijmAnNK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788311222; c=relaxed/simple;
	bh=3EV0FYi/QcXGUzub1TfutlikOeABoZxLPJA08r4YnjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbFTlQqYH9hYId0gURn06g96DpqRly746PNdp5uGRfVuFNOvKsD7OJbKzCjb67Eb22Nd8yD7M0VSw6aQ8htDPKFZCKM09AQMj1tYpK3clh7SBhGysimB2NdbEl+Wk1dVSgmvTa8aQYBCexCPBfZVGPA445RSTBTiNS5hbTu7jV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZNSRyAQ; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZNSRyAQ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b60bcf9051so32587e87.1
        for <exfat@lists.linux.dev>; Tue, 01 Sep 2026 18:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788311219; cv=none;
        d=google.com; s=arc-20260327;
        b=sDc6a5jXfo1ou5lA4GxtEj9BZmSBtnnAjIENPWMdOen5EDxgSG2N8IlgyIm3QJA8Fs
         kemptVAktGIW+sUCWSR2yGC1FKZb1FP3OMGB/vzdM8bv0YZ2UA0AJIVCxlpK8tJHGIGL
         rOg5/AFsZ6hkAZ0jpMRlo2yOwjrpOPLu2j0H5js2ulpGcubAnuWX1eAoYXsJLzqQAsCn
         cAKWLtxoHGgzwkcArpNyrQN4SlR0+4hWb9b0SI6oiMzQe14p86Jnd6BdnXFd/E5o6cFv
         7omqmllLC0tR3WcPbmLwEfM+GIIIdHkzrs6NCXH+X8q3QYAIMcNLh4PcxaGHXLKSu/tQ
         3a0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEtxoczqGM9dTemA9KLye7C6v4UGfIAMYJSamsuXRxc=;
        fh=EQLjGQ2LXgREae66vIcQRehbj+KTvS+LWC7XQAN9p3g=;
        b=RUFB40G+4a0TUwWW0uSa7aSh0PqN9hzL3X5o3jDwbeK2AgRV2nzqVPLAK6e+wHkRxb
         TYqsd8SKr7UVqVjrAYJLmGYFlVI+c0tNLM8zjRwCKm+/FLRiEGMTciKerGk+MBOWVX0D
         HvQSvnIzj3MXAs6PfDgWOXC+VgVnIAENImHkmRupaN1W95C3LMhivLzQKc6I7AvRddLn
         cDmQu2RJpy3Xb9qGtEvyWk98dvNzpPDimEKXVGt0kLB/vbkeobkyFCpf/5qoM8BkyfWB
         98vrzrLIjdX43GDvRKn1ioUARUXozLHW6v4PABI2L7spT/SeHcjCydCNc17cmpHRvZxp
         SVHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788311219; x=1788916019; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEtxoczqGM9dTemA9KLye7C6v4UGfIAMYJSamsuXRxc=;
        b=VZNSRyAQH99IhwQGE5vStQCcL+AC/vfN6hqbB3NwrWcWmaWGFVh7EW1vPspHxhTvvL
         crRuE1UCoyRpWe+DGAPmcjEeg1duhUgqkxbMb8vB5+pmzyKvNG0eTV0mys3cFdUX79qP
         08jVOSmkgw1TJmdtEGbL8Oe6Vlte45/tFN5Te1nu8k4KwO7BSqMXcNltox9M02sGHM5E
         WDTn3UIJm/wr1spFTG0TdVb/l40AH+hmDC5iWkqoAtvpMy+Hz1WI6YboqXtn5sg+2xKF
         fSfLZkcZBRIUzxw4mtYCxjqrhJJ1WIEAU7liv7eEDLGCf3Qq8yZ5LI53oY1Ql1G895Eu
         QyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788311219; x=1788916019;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEtxoczqGM9dTemA9KLye7C6v4UGfIAMYJSamsuXRxc=;
        b=DQtiWhvuj8T0QQcMWdAXSqfot88BSGQT2QoZflnD/ZlY9F4U8w7pqG38+P3iS+xsKV
         VN7KPFZXtf8dMDiyjtQl0hgtMUw3Nzft0sPOTSIm7kKJtyM0F9odxsnRT28uvZZnHMZt
         tVZtOftr0PL9P1IASgAxUykdf+NsYL4yEsxp0saUPjZSydA6ZqOTPXytmpxoIOlNqjrv
         2U8datpVEFy1BU4WqKwbac2lQvZ5Way0Z4eqhTVge2cWFSz6Trmz5PEeAgDrcYFBu/pC
         eQjh9y5BU5yTuQBaAmSbJyYvabmizT+zZLreGcwVH7htBVZVq7MDwtFHgAZrJ2dEBmYL
         a8LQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7joml67ew+mBj9BSz6QxaePQzMw2EInu3aG/6TdWopq5x1ueDHX8PRWp70ZBVrTyhhyIgUw==@lists.linux.dev
X-Gm-Message-State: AFuF++lyAgcrfUn7v3EbUz6RQDdbTww+7r/S4JsKYUu+X+He8CKo6An7
	3LHMWeKcwtlfwejArpPcms/LAUw7sgFRpYA4pQfc+zOmDx2UDHQ0moXIQSIcaYOi3F49/XFKpsz
	RxMpRk4KJcVH5TBrPXMJfOHyOXmslsbY=
X-Gm-Gg: AYBFou1rspP6p+JhodJTm/psgQ1GP+457PKUfH2vXc2GD033TQ3RDJHqZGBESPt5Lz+
	hE9gaDZbNSgqNPD/rCp6DLubYIX+XTWUfxWQdIelq/n6e/KJrKwCq2YemHPDxOmZi8ibLGEpsd/
	vfNcAAwSEy5TEKXeYgJKSK1JckMgLvYasfmggkfaXysRm+fvfoL6YhecAptr9jRtUhRnY+Rck4o
	SKUbl6tLh3hhkwNgz52C89f66S+DbWoSBTy6hmTqq8mGkj0a10T1X/fhomzGjT3sHhrCei4t7Sx
	5IvdsK3geYJZ+oeUqlAky1ijy/KUVVgssV7tJGIM+zxDcUfsHG+3NZo=
X-Received: by 2002:ac2:4bc9:0:b0:5ae:bcc4:c071 with SMTP id
 2adb3069b0e04-5b6080d05edmr462553e87.0.1788311218816; Tue, 01 Sep 2026
 18:06:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901084219.39898-1-dxdt@dev.snart.me> <20260901084219.39898-2-dxdt@dev.snart.me>
In-Reply-To: <20260901084219.39898-2-dxdt@dev.snart.me>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Wed, 2 Sep 2026 10:06:47 +0900
X-Gm-Features: AcwNN1WCxa1VkoWzPWtLE-Uk0XrWZserbHN08En1AWHC8oZd6jlYX1AovWEcZUw
Message-ID: <CANFS6bavXevwFWOh3rWiQ3wFXN+=cbBB5B=UTze-xqQFBP6hgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dump: show all fields of exFAT volume header
To: David Timber <dxdt@dev.snart.me>
Cc: Namjae Jeon <linkinjeon@kernel.org>, exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

2026=EB=85=84 9=EC=9B=94 1=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 5:42, Da=
vid Timber <dxdt@dev.snart.me>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Print the rest of the values in the volume header
>
>   - fs_version: as 2-byte raw hex values
>   - vol_flags: the four bit flags as attribute strings, the rest of the
>     reverve bytes as 2-byte hex values
>   - num_fats
>   - phy_drv_no: as 1-byte hex value
>   - perc_in_use
>   - reserved2: as 7-byte hex values
>
> Especially, being able to inspect vol_flags without mounting the volume
> or through hexdump should be incredibily useful. Other niche fields that
> are almost never used like num_fats, fs_version and ACTIVE_FAT should be
> useful for catching weird non-standard exFAT implementations in the
> wild.
>
> Signed-off-by: David Timber <dxdt@dev.snart.me>
> ---
>  dump/dump.c | 35 +++++++++++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index d55d561..efa892a 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -86,6 +86,17 @@ static int exfat_read_dentry(struct exfat *exfat, stru=
ct exfat_inode *inode,
>         return 0;
>  }
>
> +#define VOLUME_FLAGS_STR_SIZE (46)
> +
> +static void volume_flags_tostr(const uint16_t vol_flags, const size_t si=
ze, char *out)
> +{
> +       snprintf(out, size, "%s%s%s%s",
> +               vol_flags & VOL_ACTIVE_FAT ?    "ACTIVE_FAT " :         "=
",
> +               vol_flags & VOL_DIRTY ?         "DIRTY " :              "=
",
> +               vol_flags & VOL_MEDIA_FAILURE ? "MEDIA_FAILURE " :      "=
",
> +               vol_flags & VOL_CLEAR_TO_ZERO ? "CLEAR_TO_ZERO " :      "=
");
> +}
> +
>  static int exfat_show_fs_info(struct exfat *exfat)
>  {
>         struct pbr *ppbr;
> @@ -98,6 +109,8 @@ static int exfat_show_fs_info(struct exfat *exfat)
>         int ret;
>         char *volume_label;
>         off_t off;
> +       char vol_flags_str[VOLUME_FLAGS_STR_SIZE];
> +       uint16_t vol_flags;
>
>         ppbr =3D exfat->bs;
>         if (memcmp(ppbr->bpb.oem_name, "EXFAT   ", 8) !=3D 0) {
> @@ -120,6 +133,10 @@ static int exfat_show_fs_info(struct exfat *exfat)
>                 return -EINVAL;
>         }
>
> +       vol_flags =3D le16_to_cpu(pbsx->vol_flags);
> +       vol_flags_str[0] =3D 0;
> +       volume_flags_tostr(vol_flags, sizeof(vol_flags_str), vol_flags_st=
r);
> +
>         bd->sector_size_bits =3D pbsx->sect_size_bits;
>         bd->sector_size =3D 1 << pbsx->sect_size_bits;
>
> @@ -128,18 +145,24 @@ static int exfat_show_fs_info(struct exfat *exfat)
>         root_clu =3D le32_to_cpu(pbsx->root_cluster);
>
>         exfat_info("-------------- Dump Boot sector region --------------=
\n");
> -       dump_field("Volume Length(sectors)", "%" PRIu64,
> -                       le64_to_cpu(pbsx->vol_length));
> -       dump_field("FAT Offset(sector offset)", "%u",
> -                       le32_to_cpu(pbsx->fat_offset));
> -       dump_field("FAT Length(sectors)", "%u",
> -                       le32_to_cpu(pbsx->fat_length));
> +       dump_field("Volume Length(sectors)", "%" PRIu64, le64_to_cpu(pbsx=
->vol_length));
> +       dump_field("FAT Offset(sector offset)", "%u", le32_to_cpu(pbsx->f=
at_offset));
> +       dump_field("FAT Length(sectors)", "%u", le32_to_cpu(pbsx->fat_len=
gth));


I'm a bit concerned that adding this in the middle of
the existing output might break programs that
parse dump.exfat output.

However, I think that they will parse it line by line.

>         dump_field("Cluster Heap Offset (sector offset)", "%u", clu_offse=
t);
>         dump_field("Cluster Count", "%u", total_clus);
>         dump_field("Root Cluster (cluster offset)", "%u", root_clu);
>         dump_field("Volume Serial", "0x%x", le32_to_cpu(pbsx->vol_serial)=
);
> +       dump_field("Version", "%02x%02x", pbsx->fs_version[0], pbsx->fs_v=
ersion[1]);
> +       dump_field("Volume Flags", "%s%04x", vol_flags_str, vol_flags & V=
OL_RESERVED);
>         dump_field("Bytes per Sector", "%u", 1 << pbsx->sect_size_bits);
>         dump_field("Sectors per Cluster", "%u", 1 << pbsx->sect_per_clus_=
bits);
> +       dump_field("Number of FATs", "%u", pbsx->num_fats);
> +       dump_field("Drive Select (advisory)", "%02x", pbsx->phy_drv_no);
> +       dump_field("Percent in Use (advisory)", "%u", pbsx->perc_in_use);

How about printing "unknown" if perc_in_use is 0xff?

> +       dump_field("Reserved", "%02x%02x%02x%02x%02x%02x%02x",
> +                       pbsx->reserved2[0], pbsx->reserved2[1], pbsx->res=
erved2[2],
> +                       pbsx->reserved2[3], pbsx->reserved2[4], pbsx->res=
erved2[5],
> +                       pbsx->reserved2[6]);
>
>         bd->cluster_size =3D
>                 1 << (pbsx->sect_per_clus_bits + pbsx->sect_size_bits);
> --
> 2.55.0
>


--=20
Thanks,
Hyunchul
