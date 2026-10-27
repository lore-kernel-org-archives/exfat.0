Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069745;
	b=BJjsyX3XcXcSLHDnfbqtLPZV1XZZpoudyOWf6zcRxAdgZssuaHZIBG9wDQINjWeb1ll/
	 VmYo2P7i54aP7yUuh0xw8Vf1N/zIwPxXQACbZPHqz/E7OQi6ynQVcLmJkgIjayPRrJDrJ
	 HfkWiE2nb0OtKoe74hma0wKTgcegh6y9oojM6xnhu/pLw6QIC/HnGdHADUXFM2HF9UtbN
	 hbjvPl83ufpjVi1ljtjKZPfI6BWODL5sm18mwwBpU4OHDKV/+AjvPzFkcN8pdK3ahhSJo
	 /YidRALy1MfXDOa8h8Zv6KMoWYBw0MgCxZy549Q6WMGvGVYVaEwRlgFeR0/IRPkiA9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069745;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KnF7P/SILaVE2ZCLS0bFbSsxEecE8qCzY0Nvka//qyg=;
	b=4u1mM/eSXI2NmKkmc0/Q2NDsLCi+Y1h1JFJmaYO7AxkvW99benWyAb8+GCE7fhzQVGax
	 ycJ5E8AA2edqdOGPBbIoZR1wdeaJwRnZS9oAN8DmD6TXHIx3y/nPi0fLlDmrZyV8hg+qt
	 is1m3sL6mU+J5gpYF2Q5yas2JUv1zP5nRjEKA7IXZqKTh29zG8tt2o+/5SdwIrEdfUUZz
	 104tz7yOxpqdj2BXR6x7+36JBCmrjaFNEfImnh56PDupz/1aT589QqOWG4ypJ/FEc9HOb
	 34vlVtJAHhaHnGpul6rMie0h7qjGhFwrbYn9p1s9c/bFbp1UwvdBJlfuw7UYNmPQVoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MkrMCn5H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1256606A31A
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 02:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MkrMCn5H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA691F01825
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 02:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793069744;
	bh=KnF7P/SILaVE2ZCLS0bFbSsxEecE8qCzY0Nvka//qyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MkrMCn5Hdy2g4hs0Ge66jckwJ6yDS0NZx6fDfzYywBsoTcKHI72UPlrPHQDix8zcn
	 Pu1sWVBHDH4QVlg56SxBGu0BEDj4ZKtt4cZL5aJU9MqCQxLhXKx5u7to3hvZtHHeEY
	 zhZtGZFHhTsKBfDWMug9g57gRJcvziPBYxL0aDwxat8Kq8qO7lukuqSBMebTplsqTp
	 V3zqzpbaOtG4mgGUyD5ZHCDBD5ikbfp8m4cTumyGYiOPlAjaGrjBGmQHXAHrW5oddo
	 5GmSmjFjLfswAZyynaHo4pOHFZ0PtZ+bUHqDnk3oVu4k3xM777l9SYTCkpEqtpZEF9
	 CsgpQql+a5qUw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so507796266b.3
        for <exfat@lists.linux.dev>; Mon, 26 Oct 2026 19:55:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwJYgWmAkaWvGj4/St+AfOoJiZX2VWWJxFUbWj3EzT+9QI++7jUBCQNdyB4C7bX/5VdpqpShQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJyN3v4EVQKR+cXhD9WfyLV3cbVFjmgrnDfZ8tgyuXe6YOSz2ig
	qTh3uyOFI4mHskwSL34gbGdyb9jcZEVJ71i/4LZtP+YNtpL/zgUwLyaF5wNBz6utxIUbnYjNVOm
	tJf9Ul+RSBIYpjqXdXOF5hyzDouep/YI=
X-Received: by 2002:a17:906:794e:b0:c34:cf13:a930 with SMTP id
 a640c23a62f3a-c46bde7eadamr1025159666b.34.1793069743161; Mon, 26 Oct 2026
 19:55:43 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024134342.2243235-1-anmuxixixi@gmail.com>
 <CAKYAXd_AAjF89KQkS2X1WrJSxnAD-ap-hkpjV5DGxuF+XzbUUQ@mail.gmail.com> <e1d8a49e-8108-4331-8f4d-36c1c122ce4e@dev.snart.me>
In-Reply-To: <e1d8a49e-8108-4331-8f4d-36c1c122ce4e@dev.snart.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 27 Oct 2026 11:55:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_K=YrDvEAfE=OEeDeDd3Br299sA1gAC4OXXwRfZpbJ2Q@mail.gmail.com>
X-Gm-Features: AclHuK-WCNa0HS9kEtudHqNFvJCk8ezC_eZUaMfh5-4zKttG3BTvmTq3HUbIQ6U
Message-ID: <CAKYAXd_K=YrDvEAfE=OEeDeDd3Br299sA1gAC4OXXwRfZpbJ2Q@mail.gmail.com>
Subject: Re: [PATCH] libexfat: restore the original DIV_ROUND_UP type
To: David Timber <dxdt@dev.snart.me>
Cc: Yang Wen <anmuxixixi@gmail.com>, hyc.lee@gmail.com, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 11:52=E2=80=AFAM David Timber <dxdt@dev.snart.me> w=
rote:
>
> On 10/27/26 02:48, Namjae Jeon wrote:
> > On Sat, Oct 24, 2026 at 10:44=E2=80=AFPM Yang Wen <anmuxixixi@gmail.com=
> wrote:
> >> Casting the first argument of DIV_ROUND_UP() to uint64_t changes the
> >> result type for every caller and causes a signedness warning in fsck.
> >>
> >> The malformed boot-sector arithmetic is protected by the validation
> >> added in the same commit, so restore the original type-preserving macr=
o.
> >>
> >> Fixes: 69a8482f3492 ("fsck: prevent overflows from invalid clu_count a=
nd vol_length")
> >> Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
> > I will apply an attached patch instead of this patch. Can you check it?
> > Thanks!
> Hi, all.
Hi David,
>
> Github recently bumped the "ubuntu-latest" runner to 26.04. The CI isn't
> working at the moment because of some missing packages. I'm working on
> it because I also have some patches to send through.
Okay, Really thanks for the work!
>
> Davo
