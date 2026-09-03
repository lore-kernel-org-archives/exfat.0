Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6124E1B808
	for <exfat@lists.linux.dev>; Thu,  3 Sep 2026 01:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788398829; cv=none; b=c5XOl0wjVHf6yF8RxO6HgUd6ZKo2G6HYy6PWhYSiBd89X2iDLuhjO83NNewddFdxsr4//x+mUh9Tj0UuRq98mlLJOuk5uC0DGEZhbQTcNPy3tMPU1FXcczcn9ljg9l2VbKvgcKC97Su+Grrqcq5yEPeEIsEdWGYM52Ed0Lzzbis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788398829; c=relaxed/simple;
	bh=5vXHiv6Q7mBAs9/LqyygmLUX47C4u35KFhVh/ZEDFw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+n5L9RsHc9I5hEsDAiNdiQ+bveTaHKdiR83dREZmwAfSjPbdJ8efmv/WObpKZxM+PWbn8QNeMBDxXY2YrmTj1ZSzrffe4brAvWsXjNaIKfwKe7X60cc47ICoV9c/gdUN0lkZOSEKTVU4dyc/T6segxGDg/skM8Jc04qAZrSShE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCzRzwDV; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCzRzwDV"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-854f8068301so1073951b3a.0
        for <exfat@lists.linux.dev>; Wed, 02 Sep 2026 18:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788398828; x=1789003628; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/1fjQ0ID7CpE5PLuECkaPNEJXdtbzLMuj+uWV0saQpg=;
        b=nCzRzwDV/2GXjfFM0a96QM2x6DavkxgEn1OGjY4qCRGOiSZEJomusre9e8i9dqvf94
         SCxnVqpFkUXgjMU4ThIJtqXvk+x93E2q2F+lrRa70JG8YXquMvgZiX6VZMGq2ZTt6pfv
         sIt9hnPFUOxcEX+hWVro6gHudxPqSRf+MSt1AWn3LD6ZlQL1U7rkETUGge//xH6rVFXg
         FJSApsBd64sDV1xa4v1SCG4+90CZBmH4PUm2OzWE+eqOb/CzjV+Li5xduNqEHMfMGmcH
         1m3MdwBXkLFotj6EP5lb9IhxTs8Ql5GdkmemS4SVFc8Sj3ULKUI1Y/R5ES5zdCXcbiHR
         6wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788398828; x=1789003628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/1fjQ0ID7CpE5PLuECkaPNEJXdtbzLMuj+uWV0saQpg=;
        b=GQhFYRm08LfHNBcgBCjdyTZcwDwzheICJbGszMKzqnUp4xN2sEF5STU3Aq07XPhJti
         bgrJHtV2t0AUuDa1fLLPnN4eVMc/eSV/RUQOTlVxvwCF7zB3+8nLOUM85E/5tqgbl1RG
         Z6rr2zGRymuPnAAB9ht17rXqP9FsNN/VCQnUSVrWD322VOj0nOIifLPc30L8kfTdF15B
         AusEHpLZZWISkk3V5QUyR3crH9W+umQmxgNYf+gm6OzjYAHUSjoHov+q+q0tv2usQRzJ
         LgnKY38Bi5TM0Wqk9xqIDNgCiWKxaeBu267WQV7mkQYLlLc7r6G17w4dRyFT+dAN/gen
         1Z2w==
X-Forwarded-Encrypted: i=1; AKwUvBzOKgVMGrOl8OiVrpPyXarQzxZWoEwoeylr00vW5wKQRToIKWi3eM85gGlGxus5+BfwTe0lWQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lOCO8XXtLSkofi1BgspXJnoUasmrUkR8iPAqp8Vza6dE8j2Z2c
	6BAHyISA5hn1dDTMF8KfYcXWc3WwfgU1+SyPJjEdTaiLq5Yyyt6UBPBG
X-Gm-Gg: AYBFou3rVEWPcsRpl4E7ZgBphKV/6Dt75/FshHbZRQqISRdxVM9WvR30BqIYeizge+l
	Zx+sjiEYvGCb3k3SM73ORDZRrgMxzwaB6mjaj9lpq6oyBIrcbDyanMY7NP97Hg6v4rRj0hMrvCY
	Zt+F3y/5M/ZRrrFIcFUybA1Lzfn0G2QQftOg6ZJPvP0kkTDTQFC30/F1KVOCeSiXtfKVbwXjB83
	aOoeRtR0/Q7V0JDG94L/8O6yj6e6uKCHYA+bDnWGcOIBik6SJibt9mF0diXWI4/fNzEPzNvX8mo
	TnCYLSMcoiorjYLtvslc7+HdiAERBIeWmW5NdembBhdK8XLcHGevO2tEY87xFBS78ttQmF/i4fo
	a3k9gWynZ/WJ3/ul+/o6+UNg4pBBtz/rk5J6AqSgYuAvoy2IhGS7+DxbKq3Sa0nwGGNYpK+pEiC
	XHqpTBIeSrbcDGsRojdarwjvF7wRz24SeGSiXyhTXWxvOiM1nTJr0=
X-Received: by 2002:a05:6a00:998:b0:847:9267:2104 with SMTP id d2e1a72fcca58-85ed3793258mr12421029b3a.12.1788398827545;
        Wed, 02 Sep 2026 18:27:07 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc11fae83sm1990546b3a.59.2026.09.02.18.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 18:27:06 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:27:05 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: David Timber <dxdt@dev.snart.me>
Cc: Namjae Jeon <linkinjeon@kernel.org>, exfat@lists.linux.dev
Subject: Re: [PATCH 2/2] dump: show all fields of exFAT volume header
Message-ID: <apjM6XVGYZ8SjIcX@hyunchul-PC02>
References: <20260901084219.39898-1-dxdt@dev.snart.me>
 <20260901084219.39898-2-dxdt@dev.snart.me>
 <CANFS6bavXevwFWOh3rWiQ3wFXN+=cbBB5B=UTze-xqQFBP6hgQ@mail.gmail.com>
 <680a31ae-d9b1-415a-91b5-0f93a5f27368@dev.snart.me>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <680a31ae-d9b1-415a-91b5-0f93a5f27368@dev.snart.me>

On Wed, Sep 02, 2026 at 08:45:05AM +0000, David Timber wrote:
> On 9/2/26 01:06, Hyunchul Lee wrote:
> [...]
> > I'm a bit concerned that adding this in the middle of
> > the existing output might break programs that
> > parse dump.exfat output.
> >
> > However, I think that they will parse it line by line.
> That crossed my mind as well and that is my assumption too.
> 
> I thought about adding the -v option and printing the extra fields with
> the increased verbosity. Other than the volume flags(especially
> MEDIA_FAILURE - this is a big one) which has legitimate use cases, the
> other boilerplate fields are not really that useful. I think that's why
> the original author(s) didn't bother printing all the fields.
> 
> I still don't know if we should add -v or not.

I think the option -v would be useful if it reports difference
between Main and Backup boot regions. This would help determine
whether the Main boot region can be restored by the Backup boot
region.

> 
> >>         dump_field("Cluster Heap Offset (sector offset)", "%u", clu_offset);
> >>         dump_field("Cluster Count", "%u", total_clus);
> >>         dump_field("Root Cluster (cluster offset)", "%u", root_clu);
> >>         dump_field("Volume Serial", "0x%x", le32_to_cpu(pbsx->vol_serial));
> >> +       dump_field("Version", "%02x%02x", pbsx->fs_version[0], pbsx->fs_version[1]);
> >> +       dump_field("Volume Flags", "%s%04x", vol_flags_str, vol_flags & VOL_RESERVED);
> >>         dump_field("Bytes per Sector", "%u", 1 << pbsx->sect_size_bits);
> >>         dump_field("Sectors per Cluster", "%u", 1 << pbsx->sect_per_clus_bits);
> >> +       dump_field("Number of FATs", "%u", pbsx->num_fats);
> >> +       dump_field("Drive Select (advisory)", "%02x", pbsx->phy_drv_no);
> >> +       dump_field("Percent in Use (advisory)", "%u", pbsx->perc_in_use);
> > How about printing "unknown" if perc_in_use is 0xff?
> Yeah. That was dumb. I'll change it to something like this. Interpreted
> decimal value if in range, raw hex value otherwise:
> 
>     #define PERC_IN_USE_STR 13
>     char perc_in_use[PERC_IN_USE_STR];
> 
>     perc_in_use[0] = 0;
> 
>     if (0 <= x && x <= 100)
>         snprintf(..., "%u", x);
>     else
>         snprintf(..., "unknown (%02x)", x);
> 
> 
> Davo

-- 
Thanks,
Hyunchul
