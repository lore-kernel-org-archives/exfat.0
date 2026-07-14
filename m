Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E953B3EDE64
	for <exfat@lists.linux.dev>; Tue, 14 Jul 2026 08:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018398; cv=pass; b=FDavp/FH85RH5olM6e9eeu4OcYtu/Wtv2J+hYcps1PntQIxVilYJdKZS9+s5yEOcLW11huDLHExir8irX00XTWTpbRFkW0KfAoYUv5hVZN/svkHxipCOtApNl20Br5RfOh3oSHugmRWmTzYp8Bv+AvMoYMazX9klNypOV1LKXqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018398; c=relaxed/simple;
	bh=O7fWqPomPONuY+4bMT6dVAWEosaeH9pUd2VtVYFKKf0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=AhvbJtumfosYrihB/CHbGxqlYMOcmjiCbt5WyPbAAhS+1w+nv662E5+7J9pDcCEsu1f9Hch5C/l4oAyAWbzHzFHxUhGRY2U8ivbkWgOG8qalLEMAYrp3GLhePQ+TXElzLh3pQuDa7K2w3kn1BdYh9hxXOsOl5ldOXJYa1WVOvQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hJRRuLkr; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hJRRuLkr"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e9f5637634so458477a34.3
        for <exfat@lists.linux.dev>; Tue, 14 Jul 2026 01:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784018386; cv=none;
        d=google.com; s=arc-20260327;
        b=mlFDFxCul+bXzXoT4RJz0nxSrKy/BKdi5/mygXXE9syWYdOfCSG2ghetzC5p/D0K7g
         C9pfpADjVa+ZHEGCs2hVoo6Nb3lT8wqaNPEiQ2YWoGgD5xum3fX3S7bCht363w3e+tio
         cDZxY/C7+NVoWi657mxIP1qmxeyC5Y9Ch/0hZNsVhBcubim/NXP68vNwf/dGCgLnS80W
         sKRAxfNwbE+2SSQWq2W2GcfcSnQoCCyLS4+mA+fWLpHs8Wec1dBaftJROeBxCaZ39Pa7
         2l69pc6L0jtl9e/NS4U7042rsAmO5GYMG8l9rhDo+DDec+fNsMzaAM0LPZlzRt/TmdoI
         P/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=O7fWqPomPONuY+4bMT6dVAWEosaeH9pUd2VtVYFKKf0=;
        fh=kgBtIwbZOujRLHIBhBQKGoL6xIvKa4TR2StxyiclemQ=;
        b=spDCrr8qXb6oiK2wNABjKOZW6HadmufLUfFU4RMu3cUh+lDF3XPH6HD6lcDSEZ424r
         hhAeP13t8hZGM2X4cLDWI0L4BLg1qdTSmNMMCTGSKyDMavlbkuXexIlWI9Y6lLVSsoUz
         0syf5BqKhpvzSxJENaKbvLpfG9/rJtlY/x7nTBQNIExJD83VQSqLhcpH02bJjOw0HSoR
         FmC10vgU0XBfmPw8SqBDqakzwfSbL3YSV3mdNHxaYsq+zD1IKFbwkvM2sum9xwIBUBqS
         P3ddn0uQgB4A+xecX1tpSbUD5qn/KhfT6FwdYCSHe03zJ84A41V91WlSRUlE+7w/CF7j
         pW7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784018386; x=1784623186; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O7fWqPomPONuY+4bMT6dVAWEosaeH9pUd2VtVYFKKf0=;
        b=hJRRuLkrhK7gX0xkzS4HJ8/RQIPHiwoKLXnb/FTqnNrm2DfueuRpmGgfaQZfJONWvl
         wazcLpUWLfEESZImDipf9tZ0yXnTf+JeHI2shOH5/xG9OBtY0ZafaFfvsFQqXkx0Pxf+
         g2nNDD+UqAx86dxvYF17QywKG7VnJX+yVp2iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018386; x=1784623186;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7fWqPomPONuY+4bMT6dVAWEosaeH9pUd2VtVYFKKf0=;
        b=LuyoKxhMjw0RCJviOlRLIW1v4OaCvehWOut2jOLcR6EcvaHlvaM3G6wBm2aLQbM3JW
         tq/rujqoylDog058IlbmMEYdTHFMoV+qUQbGB2DF2ef1Da8N2CLe3p/oP+PPrNed6W/g
         c7sU6/7CdYFNeIrLeKH+jxWnE2NmTJPeNbBAlGL3GY1zPw33dfnpIjv39Qaoa6NaLMIm
         5jBo//IDMyuXJuIMFQgeMwtR2LxUK5RA9sicz6GDndB+Iy0quqmPjVZb4cwsK9RfrYUj
         xSgq1TRqa4XRYgKI3IayymKGxVHeUWdNRyYdeslmBmDVyeD13l5Jvxf32qXT3rF1KDKO
         MEGA==
X-Gm-Message-State: AOJu0YxI+ZIT48gwXxRpXhwel/15cnPHbpNm/f+vYM0bxkKAX4P7hrzL
	kQlnaFfkoWgj/yoZBTohqUB2kEy99f3VzOUg8IkFeS+nbixrk3ExDpxvZuCSGQuijoyM2QqtC3w
	0O9rQNxxZy7V+uP+bRKAt4feYHlQdI9xtBcDa9p5frr2mjgs16IILZnQ=
X-Gm-Gg: AfdE7cl8Cfdql7XstjXNOQc3DhBofdx3xYriuDIC9MhIhpPvXPhIXBonNZfA4JZrw2b
	FMZq99BxYLSAZ8GzJCkN4Vhj7dI7ipssQOb0uMx+DVgRpwyaD6bozLr6T56iumt9/hI6T9c0D0Q
	ypFPX0ew7tozQOxukzaXomPWcCYk5YX44zzkQh5hdsfH7TwLNhZdxYN36R+kIpw915huYfybgyM
	xi/G99dAOaf8mPlDbeAMuyBAD1AI5w+eQO3r/aMVTId8H7niG7nk8ZYNdlHofiq+zTBM9siddDJ
	j2HKZK4ju4PDJ2s3t7YwXdUdwO8=
X-Received: by 2002:a05:6820:2910:b0:6a3:19a6:dc1f with SMTP id
 006d021491bc7-6a39a854c2cmr7375483eaf.33.1784018386494; Tue, 14 Jul 2026
 01:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Chris Hoy Poy <choypoy@linuxfoundation.org>
Date: Tue, 14 Jul 2026 16:39:35 +0800
X-Gm-Features: AUfX_mxIaPRXNi-hQ0B8-WZ73TxpekxVKpzfhoTcfXIAkkEDa65FjT1uhum1Wp4
Message-ID: <CAKkv+gwUVqe4LRuTtZwW2CbVJf-YfgApRo5zkvAM-yjAwqAjgQ@mail.gmail.com>
Subject: submission test
To: exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

knock knock

Chris Hoy Poy
Senior Systems Engineer
Core Projects
The Linux Foundation
Perth, Western Australia (GMT:+8)
