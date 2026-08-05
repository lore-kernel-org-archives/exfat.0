Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3522FDE6
	for <exfat@lists.linux.dev>; Wed,  5 Aug 2026 15:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785942836; cv=none; b=Ggd5iAhHtPgGXZh1AnCpJFqfu/Y87F4ougQnj5vzzSHH4ilMNhys1CoaZ8sf0GO+FCkzAs9SEHoRDHyyJ2PQMVXd1GGBsbFgjFr5eqo6wvNaRxyCIwwm4pvU+aiH4/QhAd3wSDOeazqLUkIDYRoUkx9KosykgaZctuN9dBG2Pac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785942836; c=relaxed/simple;
	bh=AS+pIe3ozPZ3Vw0ac5MFTRpJosHOxYPCnu8rsmbBlmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iklKZ0mxt04wuthgE493Gg2hoNsxOlWUt3MVOh00L9u2N/kxHYix6dl+x5ysLQQlVehRqwhaIA6j7HvzKcChMy03cOLQSWc5dgQ7LLvOcZApncUdvMvsPo934fh81WYaBsitbcJbPm3h5unYEVyjXsudFj3mBrt1AvayP/rB0lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3gcQ+j8; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3gcQ+j8"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso1463436b3a.1
        for <exfat@lists.linux.dev>; Wed, 05 Aug 2026 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785942834; x=1786547634; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AS+pIe3ozPZ3Vw0ac5MFTRpJosHOxYPCnu8rsmbBlmg=;
        b=d3gcQ+j8us4UZOvpcbdWYGNR09CTF8kYlZE9tFldoX3fycOmQDPc0Y/lMc8eC3uPvL
         vHvV1Jlj7oT25Cvuio7gRP9Nuge3wXV10nr4XDdrVn6yPuTtrFkp17SCyRAVCTIu1m2A
         o6CFj+uS50Ls4c6lY0My5SJovYwWGja8JkVnhbwVCGCPNj+IBHR9rO36/1NmLrSFyRCz
         /fUc61jgm+oq52UGnXhgRCmu1+WvR7VqG1YrUaZBP/F8D6qwDb0b1JLH42RN0Q+1hOGA
         gUBGXKmmWoDc8qsmLp+PbkNPN5VXkfXJCb9fBBYOlwkP6+AllZZMVjl8DgFJnWMbM4nr
         J1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785942834; x=1786547634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AS+pIe3ozPZ3Vw0ac5MFTRpJosHOxYPCnu8rsmbBlmg=;
        b=cG+c/AArEJtNPFxEydGzbQbhT349zFiiPCAITGmElwET1ZRaj2+v/TqKHnUyIE6UT5
         UnaeIgHIxOLEEdrX94R6MB8BgqktEHsP5sQBZz93RDi2Kt/Dk0buedaPMfVeOuv7l1H4
         PVExEfWlGXOYkUb4uL2Ap0bjYMtCyQTgVfGEOf2S4gOHOL2uvPgAiJG48iPsfCk5w09b
         qelV2pFKlNoYp0JdE6oJMuruNyjsDfAjZUIJI9MBtIoonMs07q2nOxCAznEysQWSvuby
         BEQzReBwM78D4ZS0PNWW2vuEaUnuLbbl4FUu2Uu/9jsET6wlOG5RQxoRqbqdznFMCTyD
         tMEA==
X-Forwarded-Encrypted: i=1; AHgh+RpxViDcpOsd+nWySX3l+kW0NIKtZKLy7DDSutuCEAQFLDdK3iXY5xRKtTNafjb0z8cW517+AQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwG2fgOXxYHags5djxMPK48rma9Ju8ActdbFRfBBxexzFTdkfsl
	YFnvdM6Jy8EV03jyDmtMmtAbBJSslZdbklHhzMUS55aDO4SnZUJGS0rv2CUUlzTowZk=
X-Gm-Gg: AR+sD11Lif3OeaVtGuBGUeaZKfpLgPwxT8h6bDNJi9i+Zri6SJ1eAZX0C5oDuiU33JF
	vL/3YNsArNAfeDHALo6gfzEZiXP0yId1vbp/xt6tT4DeATK5rKVggwXf2jl4Mn6d1nPacyh4Luc
	o/oTWLwqE0l67bkavrlPcjxa82+v8tvqyBM1ih+w0sssoGOzMPJFzgR+cJcbt1svA18fn7cBPTM
	MajFdDm/SGlXyHtkAmEq5D0SaxhTJn8pLYcHVS0ozLfKsUdDpb9u46TOneTKqthbBVvQJGATDks
	cCYfO6ml2VFDcrxi63UqBjWcchjfOaGcCiTIlLVg0TPjJ/CNnAH17x3BhydCDWotFPvEUv0LMKp
	QV7oCW7BVhsD5Fyzj9idNukgPBhhvvxRrGLaIsQFuMHD1FFVTJIlEtqYJmeyZMujFG6XIb8H6cX
	XMJh1JvSVn8DYukrsdfnatD6mnNTk87H/fs6w/wB4vjL5qFBrMQMu4HFFUHljO00Kf3JVQ92XxG
	Q==
X-Received: by 2002:a05:6a00:3314:b0:84b:e69f:1b3f with SMTP id d2e1a72fcca58-84f2dbf2eabmr8974638b3a.8.1785942834152;
        Wed, 05 Aug 2026 08:13:54 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e52e28fsm999642b3a.53.2026.08.05.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:13:53 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] exfat: fix overflow in cluster-to-dentry conversion
Date: Wed,  5 Aug 2026 23:13:35 +0800
Message-Id: <20260805151335.449285-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728150704.314251-1-anmuxixixi@gmail.com>
References: <20260728150704.314251-1-anmuxixixi@gmail.com>
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
