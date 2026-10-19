Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A354825AC
	for <exfat@lists.linux.dev>; Mon, 19 Oct 2026 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390494; cv=none; b=FZIy02PGzc/Zubebd+miX52BVQkVe1p7TPnFmmUTBP3L3GNfEjYv7uG4jyo2iKU0hnnmpe7loPmaDCJgyNdEp9FsdKn5NPK5+DcOay1lIhVkcwODmowhFIDBTDHYauiOKdF5dQObH6GSjhcUEaefvGRq38GYbQNpUqGPwzUEPJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390494; c=relaxed/simple;
	bh=hLviHrUQcnY9d6Hs59o7A7DhG6hJV3vxIcScsJNeYyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDYP8HL8qyuh1lnz7lSpnoLFVjI+grYm+P155hpQSna2Xz8Y95PclxJbaCKCaMLFV+qTiI8OURf0A3clr6Z/6wyEO1MhHT2TEE/zjJr+3e9k2MZRhQM33Sy4CPJ6lHhSe5b1ASF7kNZy3crIVDUtlq42wRel5ZHqq3TLC9bUOqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsAMJqf7; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsAMJqf7"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso640659a12.2
        for <exfat@lists.linux.dev>; Sun, 18 Oct 2026 23:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792390492; x=1792995292; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CH7/2Pn88Czop2CrZPadAXkcJAGF4wsEW/e1YNB1cxQ=;
        b=dsAMJqf7dGqTZbGxVwLIoUuVDVwEDvCxwVuBj5CI/eDj1bbHZ3NC9iHtp8dQdeyUbr
         Y8T5Bl2a51xi/U4+iwYIZNh604Og8hdoiFCLKPme5OrY5KbJYq7f/qniob0HFZ3JDiBR
         PRkktCBSlM9qzBUv2e55Gg3RtZxgGOorIodImuDB/ukDbvxB6C1kyJpU+yNx6lFaVeV6
         rdLkWonVPMZ+fvlJYyPRcscixnoKjIDPkYlZ6akbAtvdrydVEA9jnsT8CoUexgEHQ9T8
         +DXew2GxAp/YH2I/cZSUW4hdbweiQuP7rY1SCfZkiABYKwVYeonNksowNQXmCgmeXKq3
         rXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390492; x=1792995292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CH7/2Pn88Czop2CrZPadAXkcJAGF4wsEW/e1YNB1cxQ=;
        b=KCkb94RocN8qR0E9DG2HiF8W0sKjy+0ZeAkXdwm2zQo/vocUvjYoidKVXwIC2mCuim
         +uB0yobFzUfYyOUu0m7mxaL4GR6A1g/ES0fVd28VOfOOVPs/GhhAjljwkxsncSBwppe9
         3ExIUl1MjSnUBqcN0koihDExUpA0BwdSaZlRp5wxzHfbvS1XRa0IpzSUObFCVIkwB89K
         l009UpABruEe6gMtVfWRPotC+ArS/0W0TzPE94fH1Uju71eYdU84Lb1kTRGzVhWMFjFf
         cYpxnaad6l+rtY59B/RdWeiAT3e5DNfPLyFee/vQ9ypKC0Sz6/Q8CACsK1PcMew5waVK
         Ep4g==
X-Forwarded-Encrypted: i=1; AKwUvBzvbAFWknI7Wt05Yn+iJY+g0MsMLEDhsqCOKvA2rFT5vqil7LSMU+Jadf0Ob03tk7lmCW7WTw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIPfeojgp/ERgujHsVlTBWUXCvlAvPmLc7OK+PcAzs1FeqnxcLX
	YusKJ0Xj7OBseH9gLipBMzxF0Qcq5r5a8/OMAM8buIXNZRtMm9waLcmF
X-Gm-Gg: AYBFou2YJwmBozAkszK5zRK85uL8lXhR08bGxVzBdVI0YVeTCwMMtOpTfP/nmmMfPsr
	qx/XxzLhmI/ke/zhlyjSRYAJghwfKPu3u6aqmjh1eJGMpAp/XqksA2n98LWbnIyx5YNG5RIkSpP
	8qRZnvhEdmaxb8P03tyk6r1tgqYXv6y1PelfW6gKKDyzPNELglZYJAQrqInJ5t2cZ44kukMfrfh
	i4Lj6KO2fkmhjQktLJ/NT4OVi07jfX4v+uCQnWZD2V5OOVzOAfP5E57Diuet9sl9+pmv9tGpDAA
	75aRvQI0OZUWMbxms+XHwWvxp9XCgBKNtncnUDNDxpZ+MdIPQ+C5uxXXjWZ7D0b879naPRSOrAi
	STPkJZncErVQruJiWNyB8LFqUjVn93/uaEyi5pLXR9Yx+20KuDWHmHmlhTPof6X3HAthLyzduPf
	t7G4hdUlt2TL6+zw0i2W/t9TXr9dUtzRba2ybXMK7BjiPrz7mfIFW9vODsM4O+
X-Received: by 2002:a17:90b:3851:b0:3ab:c80:9362 with SMTP id 98e67ed59e1d1-3aceeea8f3amr5078332a91.35.1792390492104;
        Sun, 18 Oct 2026 23:14:52 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94794dd9sm19035101a91.12.2026.10.18.23.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:14:51 -0700 (PDT)
Date: Mon, 19 Oct 2026 15:14:46 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>,
	ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
	exfat@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev,
	linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-xfs@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH RFC 14/28] ntfs: don't set SB_RDONLY after filesystem
 errors
Message-ID: <atW1VhJXAIvtYPfd@hyunchul-PC02>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
 <20261012-work-fs-sb_rdonly-v1-14-60743a3dc326@kernel.org>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-work-fs-sb_rdonly-v1-14-60743a3dc326@kernel.org>

Hi Christian,

> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 4066bacabe37..12ad2ce938ba 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -269,6 +269,8 @@ static int ntfs_reconfigure(struct fs_context *fc)
>  
>  	ntfs_debug("Entering with remount");
>  
> +	/* Mark the volume dirty first if an error made it read-only. */
> +	flush_work(&vol->error_work);
>  	sync_filesystem(sb);
>  

    if (sb_rdonly(sb) && !(fc->sb_flags & SB_RDONLY)) {
        ....
	return -EROFS;

Before this patch, SB_RDONLY is set, so remount,rw returned -EROFS. With
this patch, sb_rdonly(sb) is false, so remount,rw skips the check and
return success even though writes are rejected with -EROFS.

I think that the condition should be test NVolErrors(), for example

    if ((sb_rdonly(sb) || NVolErrors(vol)) &&
        !(fc->sb_flags & SB_RDONLY)) {

-- 
Thanks,
Hyunchul
