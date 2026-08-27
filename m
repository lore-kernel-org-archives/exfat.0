Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D593FD12A
	for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 14:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842299; cv=none; b=bzxPIkmNDn+MbaJE0M7je3YCv0gHUodjqCkBi7rrCFUSmUtO2GN8QIL/eCrx9u7mxXgj5gXF9YFLNKX5vX/fiErtk6PYy0ChNHXFhghrR+1n/Rj8xfM2NS4W8tO4fSLQLHQ7/S7e/t8DF0cWmX4gMP14bCmpBfNzuLnP6qVr9ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842299; c=relaxed/simple;
	bh=AS+pIe3ozPZ3Vw0ac5MFTRpJosHOxYPCnu8rsmbBlmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C8IZkOMXlSSzO9OitWFaWJss7prcC1RX9IL5Me5REyzUTU+Xd79HyhcUse8o+23CDfTnBwOSwljOWzXj4vxXFR+AiWU1AHEyUkl09fuqBQ437T64HN8iHnnyiHAMlRNpBG5UQvKNgnQIN1q6YziAui80fhlzfbmyyiV9oLM6Qo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqNJl1tf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqNJl1tf"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caed617615so24291545ad.3
        for <exfat@lists.linux.dev>; Thu, 27 Aug 2026 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842289; x=1788447089; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AS+pIe3ozPZ3Vw0ac5MFTRpJosHOxYPCnu8rsmbBlmg=;
        b=aqNJl1tf/pb+HPj645ym29Z50jWgfSbKkQTh6+jukDakmo3VfszzA5gtfQqZnJxpwN
         mND2ttPy+IIhJOm38SeAsBKpThLGLHpmyZjEaq//hEhWiEEq+5cLUoS8+HRZnfIDRXro
         lFg9KkHmC5ZfaPcgInDJ22EdoFM3o3L99XwTAaaHJjLbub2vVFNxSsZeufOtyIJCKmLY
         zEiOr0W1Mn+SVohK+Cw2F0zgBztJzAaw5HFq9em98ylMl4S/+v1Z5Q88zPEyhXBQF3eY
         GA7I/F2v6xJtRImKQH8b4+y2T/MdUn7MNy1vnfRFzn1Z2XrOKPVPSob+/UXt6CI+U/9g
         hGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842289; x=1788447089;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AS+pIe3ozPZ3Vw0ac5MFTRpJosHOxYPCnu8rsmbBlmg=;
        b=kYB11Mx0ODu5aNSR/bRznJStu9DXF6EFqB+tjkhxNlTuR9RzZTWi7rUJmGQabBrGw1
         yF/LBQYB34v1At44P6kizookJ+94PzfSgY3V1pCl2XzQG8D3PiuCuFrtbf7fV0TRqKNw
         cDJoOX/Mlmhn+ojH2Fnt/N79xrjAY9/NMINVyrN1Y43hrgI/ZDO3Nc14Bm2wTs0/bogY
         zVAWWxnEezSiNxrJMLDvZzkB/d1ok0+KALgJSMK2+2A8LjjQ31YVyf4bvhYdKKz7Ip9k
         T4j5oa0emkqAtrKy24CW0VH+hDQUxyId+75+oLxvlaNUhwnQQsLUZHhOCXUuz33C+fbq
         9BpA==
X-Gm-Message-State: AFuF++m74UAECo5lcYUdBkaw78fosp1EZ25FPth6k+oKZt7/fZmbj1Qv
	v+UqiHA5DgcHl8X5QcnyEG5HyZ/vVhCweKhsrkbdpvQg+/mxVrnrjrqC
X-Gm-Gg: AR+sD12yHCcIG8J7fWnMosKSN7pdVUkCZp5Uy2GEaQDGHKhYjAZ/O+joTsXBjATuuF1
	zEyz3l/cXHJNYOHxEDCgmA6tkwbpC7THK8GJ8iOFNtpW+buOBQCH2o7tFTD9Pp/+pn9IbBGgP/J
	+JAQUbyReL8jkARFzq0+mNLOgzDvN41DhvxAmCGNNQZkxMDBmstpb/LAcPYPZp/ynXNRy6X8f9H
	FD2924VHzQ7vbP9ZT5o5p7XiKgXP/KKvjMAl6VzLk0pBVw6/5psidhOUJ1VMEgxPMix8v9AjFiy
	JaEuHQ/T9Gar+6SRT8fYWA5KJAOVlArx35KMXPdfT1o9Q0MUIMJ7uQoSESWtTDWFSHGDeI4WLwp
	rWMJOh+WgM52zHjcFy/fS7b8ZTLeEusLVCCwITSBAmn0M3xxzL7KXWvwNGsjRADR3+NXqqqaJrq
	AOL+6Tx0pG5M2WS/gmsz3tgbW+bPKrSgCuldEdkSwZhrJIY6eysz74SDrj5U7Km7YtuKsnZr/E8
	Q==
X-Received: by 2002:a17:902:e54f:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2d707a2f08bmr279793485ad.2.1787842288946;
        Thu, 27 Aug 2026 07:51:28 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704bfb684sm18063645ad.62.2026.08.27.07.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:51:28 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: anmuxixixi@gmail.com
Cc: exfat@lists.linux.dev,
	linkinjeon@kernel.org,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH] exfat: validate vendor allocation directory entries
Date: Thu, 27 Aug 2026 22:51:08 +0800
Message-Id: <20260827145108.979738-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820150508.736275-1-anmuxixixi@gmail.com>
References: <20260820150508.736275-1-anmuxixixi@gmail.com>
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

A gentle ping on this patch.

When you have time, I’d appreciate any review or feedback.

Thanks!
