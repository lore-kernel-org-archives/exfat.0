Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753735;
	b=TDTJcJgnH5S+ySoKM+feSrzSDvP3ui6h4rIcyCl0qN/mJX5qSeNsEMFYUmNxu1jbYEyb
	 BjozSkYHSFiwxYSbKwbLmPARG4OatjzooNJFa3X1j2btjI0McDPE0pfhVVS+acWRU+xJC
	 vd74cheVu1+mQd+ZDDr+e54p+5RfET+BYs18k9gYqhPb6/msBKLNRC2L97p8Q5YU/oEkJ
	 +Vsb/3Bb9Ng4OCnRpy4P5n2cm0fEHWd/yK1exYi8MxpLJjnzfIP+yK468KjKk81qyycFR
	 HYqkIZygPXd/hrKq0Vj8RxQ0wq/qVh/4NwrIHUmUg4H/mONogpuBrnTqRwk+/Iuhn8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xG5t3xikeZrgWEXDIQ9E66WF0APj2TRUKkrk3j8LkpE=;
	b=o4rgyKvNFpa8uoz+EGVcLEkcMgTgRD31wYb1pZGc9aG4KWLuO8p6/RpMVzu7JlBCTCLw
	 ttO1p11UDRerIgaJU/GYqh8S8AiXz+6LcioWUb9zv+Uud8uCfSV2bu37N/nPzP7VCVfnW
	 U394YKzXK/46WSSZCwJhrORzBd6i/QWGWITJ/xHGrm2K0r8in9ee5Qy453gJHQXUkO+4d
	 Wd7B0+T6+Qze8MoMZZU7MJU5koF5/4gk5qr2c/cotunARJoUU/O7HoWiLvfRYRAhUi80q
	 DveBPVJy71zeu7PMpMwG5O6s0/MPSAyj/YMsPUaogDuNKgKEdutShOv2qlfW44Fv8pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuUpFt9J;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D73606A332
	for <exfat@lists.linux.dev>; Wed,  4 Nov 2026 00:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D73606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuUpFt9J
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so146492a91.1
        for <exfat@lists.linux.dev>; Tue, 03 Nov 2026 16:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793753734; x=1794358534; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xG5t3xikeZrgWEXDIQ9E66WF0APj2TRUKkrk3j8LkpE=;
        b=zuUpFt9J/cFubDGclKYU2ivE6da2df9R+LlsyBBxaOu0Pc9ckPYqOCKPk+od+eEdQS
         Vj2awdXKKArotuvNTgsp+OeUygUGbBjD5gI7w0wqelC8FVy61cDF8vIBT7NlJIbO6f/P
         fgO97Xns0J3oGOHTyzGdLIGWTZFn5JIKt56sDJZWC/Sve8OFGJDdFDaw1czs5n01rKOm
         chE1AxMCMbCl8jYcyeYll+b1NKrYFQQU00U11kFU0+Ko172o/EkR08ii/5ctiCTKHf+E
         XUF0+Jb+L3tr6/Ju/KRPYe1q+VvkAVEdwsbMEI4pirY/eypE9cJHCYXG2+MAawscXTIe
         GuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753734; x=1794358534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xG5t3xikeZrgWEXDIQ9E66WF0APj2TRUKkrk3j8LkpE=;
        b=1cG0348u0+IB/GwtDg0ba8K8YGd6NGA2f1ZxM+L+cbBSIvwIHFqwshnehtEU9lI/1X
         oKwWhT2aBkW2I3pbYwjlF81tGeFf6NjyBJawaLzl7CtMGKKpzF0tdjNAe9Gkp8aQbqja
         26gvhi+sb15RRzbC4NDFVlQ7q9/t4BM5r3b4+9L0K9YX1v20YBq6rbZoATadpdCZJqRJ
         XrA72mNnANCitLqJQSLdB/0sqczdZcwkW5rhFplmZx5d8bQ+oUzT+xoyzLBE68qAZI74
         bcOMTh8Eq/SaGCVEimIqOxWSSR4NRNtPYkjGkUSfRn2nALolmISbxJIERoAoFVo89mqQ
         /70w==
X-Forwarded-Encrypted: i=1; AKwUvBzHeH9eqXSfZShmCHyWA2ReUVGzLbyAZGOSnfgnRkDyCZ6JKgR8PACUv7QDw+PYHk+LhiOCow==@lists.linux.dev
X-Gm-Message-State: APuU4Z+pZTgBCk4yrk2hiQRWWwwhn1TB2mCZXubRvnh+rcFwnPvP+Vao
	1n38O+zQg/d9+UruRpHzAV4suMZBfLaddmQBEGakYBXFfvcbX5KhtnMl
X-Gm-Gg: AYBFou3O4AiNsvJYYdkQPPx6yFZVNrBrAJ+MH3cWEAP5cYTXDq7lkeD7PCwJZGMIT36
	/BgRRgAIIZdnQnFoZhmFQLBOu0H++vtwPAkUTd60O8SLUQeSXIAg2ZCAV1YfLbPZfSTUtOnCSB6
	mhPFg52gLzjp5YzdO7W1l/ZnC5LcPfCFg6kLhWpfu1ft/bnEQQnJbgFoXyqxOWy6bNnP2sknrqr
	a1J3tlJG6MaAU6O/p4VX8Il7wPpec/opOuXQ60tk0H7fj/t8+lZ0yZfZtregHor2Jd4aaBuPRW8
	mWKVokG7SsdEc9TZ9Iaj0ToC66+UOBPpWpaw0B4qRn183hjO2FDSsvmhFwXf+QXJaWmbjZ7JI5d
	XDAsVpTpXPYTuj71e6XUJt/aY7SkMjgFJQ9HltmIdL9WOrm8PSGYVnjWGJm/kx7Xyz2r/7S+Q8J
	ga5PBlBai5RkHbmqBBEZ8IhwNmjl+8ZqMYaInziXIuN3AGZ48OtoMKQkYfZGUp3OR2Fv4J6RRHP
	HOoCOY/KZagbeWNTXBX6QUxu2yc+l/lhw7bgNw7TdJVZIhofm3oG6iThRPs94gaRA+0zcSmwdnx
	cd0Ed0gasiyRHaUPNQ==
X-Received: by 2002:a17:90b:184f:b0:3ac:83c1:2c0 with SMTP id 98e67ed59e1d1-3ae897e06efmr11479861a91.64.1793753733906;
        Tue, 03 Nov 2026 16:55:33 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09445f7b3sm1222403a91.5.2026.11.03.16.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:55:33 -0800 (PST)
Date: Wed, 4 Nov 2026 09:55:30 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>,
	Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev,
	linux-mm@kvack.org, ntfs@lists.linux.dev,
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org,
	gfs2@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v2 18/34] ntfs: use the generic emergency read-only state
Message-ID: <auqCgguXEsKCq9p2@hyunchul-PC02>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-18-2f44f64f0b66@kernel.org>
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-18-2f44f64f0b66@kernel.org>

On Thu, Oct 29, 2026 at 05:07:09PM +0100, Christian Brauner wrote:
> Set SB_STATE_EMERGENCY_RO instead of the NV_EmergencyRO volume flag when
> an error makes the volume read-only. ntfs_emergency_state() keeps
> telling a shutdown (EIO) and the emergency state (EROFS) apart so all of
> its callers stay as they are. /proc/mounts shows the volume read-only
> again.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
