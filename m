Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7552836165E
	for <exfat@lists.linux.dev>; Tue, 28 Jul 2026 04:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785214467; cv=none; b=tGZ1oK+sf1ZFz1YfUImbLKvwKdt30re5SHXKn8b4BbfFyovC86LThhumeFukU6/yQWVLn1TqZS0xValtcT8Bu6mNNKOue6BXId80tLhTRvNui1kI55brU0rb4Fbjp8CO4iG9fMh6ixr0hvi7fZhz6djKLIKcwadwFTB6UPkSUq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785214467; c=relaxed/simple;
	bh=aFZV6nAnm55DWaIdiryS1otFD3kzKWVKf+GOfKCz8YA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7VbQX6joYV3QnFEGDKFcFrwENpnzOblIHgc48yNETWAvf5OMu8ZWriIu6bjaVqzJIgAnCCmUx8mktc58rfGCbo57gXAI7F1g0tKaqN/m1iGhhVAYV0BGqoNTecKY481jo0DUKMFVCHq3jG0k3Jih8nPCTFzJdltsByhABDRobo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cbi+akbD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cbi+akbD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549AD1F00A3A
	for <exfat@lists.linux.dev>; Tue, 28 Jul 2026 04:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785214466;
	bh=PtaM9/Rs932i5WOKotuJxL4LLAvGh2JvS1+sB5x8LjQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cbi+akbDTFQVZQLvz2tXxbpCdQkA6vRh+h2C0N10/bCAGE1I+iN4LjhS0V1aMwrdC
	 Br1fF53b76F3BZRAg15Si8Ius2mTf8auyL3zO9iidtc39FmPkI8cpKDIZwXYK1k/rT
	 gBU1ghHSQieWMnwPQTIVZAf49RjLHHW6vXrp40j9N+oapP9u/9nf9VZ8VU5562dnp2
	 mtfgOKUzGGcNyd8zFhK4KLpdbWw7Y+J2gN8DCjnZNNYyUAYwB4fu9HlSXR6DS5ntR2
	 +/bICSFySkmRW6U3/40Xqru27krtuoLHhk2bwZJ49HnUVAOkR6wE/bg1jBhUBED8Sz
	 vn3F8pLg36B1A==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c169ae1cb26so93819666b.1
        for <exfat@lists.linux.dev>; Mon, 27 Jul 2026 21:54:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqbBy8XpwcbwkEkZDG8tMyppdBA8o5DdQhifdlDo4LfMAku26D+4b5/mMVe1+Qwud3UY8oGNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YynGjRw60S/R9h/ncHm56bAfRcT64oML5Dv6KaDaQjeu0KkFq+g
	BA1TJRmtWU1Kd2ibjRxwJUNGEHPRu0PLwPhDQQwLWZb5+d7PRoU3z85hoQ7hPvLZTUwunGgRVVu
	6V/W9kA4D/A8lzQMoheMXWHfSTF+zNfY=
X-Received: by 2002:a17:906:f58d:b0:c16:64e3:945a with SMTP id
 a640c23a62f3a-c1f71e74cefmr29323166b.25.1785214464969; Mon, 27 Jul 2026
 21:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727091214.355917-1-chenyichong@uniontech.com>
In-Reply-To: <20260727091214.355917-1-chenyichong@uniontech.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 28 Jul 2026 13:54:10 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8QB0MPxKsSh4aE2GF-kzqNgi4mFJ0QX+pPEKqmsZF3Rg@mail.gmail.com>
X-Gm-Features: AUfX_mxM9rqKBrxjNUAQqqyDjWuEnHGkg0QCgylwjeV71tj1Mry_hOuz8e-wNJQ
Message-ID: <CAKYAXd8QB0MPxKsSh4aE2GF-kzqNgi4mFJ0QX+pPEKqmsZF3Rg@mail.gmail.com>
Subject: Re: [PATCH] exfat: write moved entry before removing source
To: Yichong Chen <chenyichong@uniontech.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 6:12=E2=80=AFPM Yichong Chen <chenyichong@uniontech=
.com> wrote:
>
> exfat_move_file() removes the old directory entry before the new entry
> has been written.  If writing the new entry fails, rename returns an
> error after the source entry has already been marked deleted.
>
> Write the new entry first, then remove the old entry and update the
> cached inode location.  This keeps the source entry intact if creating
> the destination entry fails.
>
> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
Applied it to #dev.
Thanks!
