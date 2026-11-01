Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499295;
	b=vZKetT02q5iFNu0cug6GrHyS5kfVxr99MnEYQe14qpYsB70jAvrKbmgY81XYRqr5KU3J
	 IiOLQ0KcojGRmxNzpz09W6zksaZd6HGoQkvFjmozLz1nPJ1F4R07H/KIZC5ybDU5FmiUS
	 SHMhDafxV4CUL7dTSzwfnj8+nvuBMsOHu9q/FPoP5yxo5JJvCmdaGfkodaOD4UZUCXsMW
	 ngrRoa8sypHDth5goYcs4bJzDCadTN7mpTIwkSnrG9Jcqp2nBdlj+IKcejurspPVz4xw9
	 xYl7pD6nccvuutdIzpgxGKY0G0zlbFyXyveMIyTvlIzjsE/yvpsxV0kZgrUaKV6EnVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499295;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LRZGThiFHzP97lut56bvREDESV1Qmk2kVp+avLfzOBM=;
	b=e7nzE44Gavky5NPo8KGEOEXVeMnzOXWkz+W/L9xH128hmAG3x/9HKRSKWjw4zoD+58IP
	 ER4K2ocwXojxhQMqDIL8qHEi3RMcXZ1UHY7iFQTceF2mDwSddTF5r2wQiBxwBQy8VRw5a
	 v+4yCp6a2k0+Qcp1BRF9U5OHF6oYoaOQyESWDnzNLfEl1d5D5S/gpJACx7RCCIYkBEA2L
	 Vg48XKCQWrYKzjV0awE6kOpy4Gsg4rHvEko4DGg5NGE7+mnGi1gO7GtK3mlV5oXUP1JDc
	 ovcML1FwFpv0ebGcYSBChzAeNoZGKxub+cO0dwr12nbtwBzTP0STBboNtlGVdEjrDtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3uhWFhG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5520C606A329
	for <exfat@lists.linux.dev>; Sun,  1 Nov 2026 02:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3uhWFhG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4581F00919
	for <exfat@lists.linux.dev>; Sun,  1 Nov 2026 02:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793499293;
	bh=LRZGThiFHzP97lut56bvREDESV1Qmk2kVp+avLfzOBM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f3uhWFhGMaR4KVYXrT0ejlBCi2I1MoYeBHWHs1tyi22EM5v4iVDBeW+aaTVRaYAyN
	 s+Oi+kj0PFYsucC70PRkUB3Yj0oD1x0OjuoPvGGVrcLlzHY7KfxuewDlmhe4DBGbYq
	 GWhm/8WS0Az0MKJnif2hyR86D28nM7qo/oebGNzgg/98t6Ymn3RWmFO5ivj7/96Yw3
	 4jUkcNpHJLs9D800NqlPL0cqj1Eucdfw+Dk6FkiO7tP1u3Ek9b9M/tWyofM1xAkKO4
	 gqDE4JV3K4fW1S4EZUyLL+ZxeapyGXsKnr7eMZMTxSEjP3xR+jgu6QYESlno+GioH/
	 DAISOZrGiT2oA==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so2358695a12.3
        for <exfat@lists.linux.dev>; Sat, 31 Oct 2026 19:14:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzGsV2kdUEO++oxQoaK2v366S1Lnou//og9saoXJGfov087ZzJg9jTDbjeSfRLIvs2fNfBrGA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIRQkw04LYWILNvelXYx2I3vF48ThaRyoC61Q03Td7cg2iwWSO6
	avsY4HqL7ys+Qc5LK/PoyGnhqisrnvIENnd8M3wSH7RXk+pubQsDgUyU6+D3SfFH/oPU8La8WaS
	yOEkGC4Q6oLPSRFemTgt9p5EjkdrzzRw=
X-Received: by 2002:a17:907:3e20:b0:c26:1649:47a5 with SMTP id
 a640c23a62f3a-c4ca7a9b0d6mr546901766b.27.1793499292617; Sat, 31 Oct 2026
 19:14:52 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261031222823.223-1-dennylin0707@gmail.com>
In-Reply-To: <20261031222823.223-1-dennylin0707@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 1 Nov 2026 11:14:40 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_NYXmW5q3mu8XEqa89qanUBdPMkPND7y4Fmu1Uk4OhxQ@mail.gmail.com>
X-Gm-Features: AclHuK8EOzubb2Y8T0Qz305hPjjSLNWdRK5WoX_toeVCEh0R7XaINWPYpnkgoYk
Message-ID: <CAKYAXd_NYXmW5q3mu8XEqa89qanUBdPMkPND7y4Fmu1Uk4OhxQ@mail.gmail.com>
Subject: Re: [PATCH] exfat: preserve the 64-bit FITRIM minimum length
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 7:28=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com> =
wrote:
>
> The FITRIM minimum length is a 64-bit value, but exfat_ioctl_fitrim()
> uses max_t(unsigned int, ...) to compare it with the discard granularity.
> This truncates the requested minimum on both 32-bit and 64-bit kernels.
>
> For example, fstrim --minimum 4GiB can trim smaller free extents because
> the minimum wraps to zero before being raised to the device granularity.
>
> Use a u64 comparison to preserve the userspace value. exfat_trim_fs()
> already stores the minimum cluster count in a u64.
>
> Fixes: 654762df2ec7 ("exfat: add support ioctl and FITRIM function")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
Applied it to #dev.
Thanks!
