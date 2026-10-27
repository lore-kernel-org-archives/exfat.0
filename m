Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139364;
	b=fEjz1i3yGx5QGyDo+8TeDjTnLP1JiWmfEEDvn2+O3t+NAhDAwzk2UMMSE0mCk0ClLjSj
	 o+1/L3OnEo8WvoUpHCFsr+3tKnjl4PMZOZNYBJT2OFAdJ591u4B/ddq3f427v3Y8Wn8Ir
	 2XkgjToGyU2MoPfnyTNhAaspdfRUm1RCLpdEjlsZibZLvtJK0Oq5uz66QMokUqeE6t94M
	 vI9djn/1/YmGmAmLP8lvKDFCxfxk75Of0vWJ/qUO4Kj+cYo5tcjtxTwne8LfYq7jZQuGN
	 oaakvWh2nAVEGYXBSEqcskfX0ytgaI6VX1U/LHSSkgnYDrXjBieTuKd7hFvQ+zq7xFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139364;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oNNEJ1079Ljh6sqrLe23wXQkibP4O9nyZNB8CGZgGC0=;
	b=k42IQxnIIfn42/rouKfhlZw1cMQuyZNOXTw9j7qVs/d6jFjY8bEBTDLpxyyfHOBmYi7v
	 brpWEShjWdiLwD27D8Ej20w+ocMHhEm97xhAgfrIEBuKF04OR6SmGWOyz5PilMZf86lsd
	 gfNmH/vLlDpvWnhnwRoKnkanznfccApMI5toaf1j0q720w6vDJOrqJpIc4BaCKSF/8A7O
	 af20RuYVeRHaFSFta7bG0NLE/ezr74g1UpZnT7qYrehXMxmdM7AaHXgwbW387pIelEay1
	 3XCkfQnAj0D8IkvO8Y7kpKaEOGThmFbUi4GUhMC7NZDcVU57qsVi/O4rMm3nY4A1KAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="X8/nw6YP";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B36606A31A
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 22:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X8/nw6YP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344D91F01825
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793139364;
	bh=oNNEJ1079Ljh6sqrLe23wXQkibP4O9nyZNB8CGZgGC0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X8/nw6YPwWtXN74p+b9J+zZ7EniDGi7qF4stigFjwU6eNdzbuCqR5uxT+S03B7PJ7
	 /f9C2huJz2vgh4wpIYrBmeGQqpKJalDeq0RKTmw18u6cTeq989UHtGoxricYe25IiN
	 kIMtEbLucUySw+i6UFgOu7Aj+BjHEgKdb4ep0a0l5B0OvND5cHYPXXUTm9TgYPbcw/
	 PAL1ulsb00a0SEM4JvkFF8Y49qK0wSUVVgZLGv1jNxyA18rUtCcZ4Cq+6JBWHcgkKL
	 7oQLloALLzZ6I9vx1qPIp3Y8AHt7+9Vq+/NMYdbjY0iQ9qhq7PdVpSfij6fxOXWJq8
	 7t+PZyXtXgbNA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so565183a12.2
        for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 15:16:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwDzCRChPUDG1i/DwsKu0xH6Ugcb81QwVSPeNYyHnQUHgrSsy+3ekadzg9nnTFc514Y9ynA0Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYJgIcwuRv5WYA74L7fhnh+ZCM456oVWEEu/SIP1WUOePIqSyVRi
	5EjDDzoRPciia/MMfedRZJ7ZAbO4fg8saOW2Q8Sj+ae9PceVpwBCdiZFdZsOk9kLhbACj/HksWe
	IXv3+jxSwuKUsu2w3x/rkhewKQ33FneM=
X-Received: by 2002:a17:907:72cd:b0:c26:19de:9126 with SMTP id
 a640c23a62f3a-c49bdf7a5b4mr47056866b.25.1793139362885; Tue, 27 Oct 2026
 15:16:02 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027091353.74642-1-dennylin0707@gmail.com>
In-Reply-To: <20261027091353.74642-1-dennylin0707@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 28 Oct 2026 07:15:50 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9je5M1+FNbLfeVAmcqEnMJDcGnM68pa6nj-d+KKdXG3A@mail.gmail.com>
X-Gm-Features: AclHuK9L5xX1s-zqxf291s938LbQACPBilvWoG-l11Gqv3TkZSzFpy-S9Ojb708
Message-ID: <CAKYAXd9je5M1+FNbLfeVAmcqEnMJDcGnM68pa6nj-d+KKdXG3A@mail.gmail.com>
Subject: Re: [PATCH] exfat: preserve creation times during rename
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jlayton@kernel.org, jack@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 6:14=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> exfat_rename() resets the destination parent directory's i_crtime after
> every successful rename. A normal mv within that directory therefore
> changes its STATX_BTIME, and the new creation time is also written to
> disk. Moving a child does not recreate its parent directory.
>
> The function also resets i_crtime on an overwritten target inode. An
> application holding an open file descriptor can observe its birth time
> change even though it still refers to the same inode.
>
> Remove both creation-time updates. simple_rename_timestamp() already
> updates the modification and change times required by rename, while
> creation times should remain unchanged. Jeff Layton questioned these
> updates during the timestamp accessor conversion, but they remain in
> the current implementation.
>
> Fixes: 5f2aa075070c ("exfat: add inode operations")
> Suggested-by: Jeff Layton <jlayton@kernel.org>
> Link: https://lore.kernel.org/r/bb698e294b0d4dbbbad4b94048693360010b8010.=
camel@kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Applied it to #dev.
Thanks!
