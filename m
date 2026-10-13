Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278AD13B58C
	for <exfat@lists.linux.dev>; Tue, 13 Oct 2026 04:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791864280; cv=none; b=dVdjsOCFXpS0UL4D3n226rmgjc7P30PVHPYIklDDiMqD9seuQT215iJJ18WN8r9JOrXKC9MA4+WCr+FP7xt/40BLC2CaSqxkGqH6uI7QjY/IBkJZ462aFbPvMo3KO6Ply7SVXU20XWCh2iCbCkonmOPSnQ5m/pOZcLjPjphwzUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791864280; c=relaxed/simple;
	bh=22fgWg8r91/+6V5WYSm0YSgAjtUpD/vSS4Xav919aC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpMNOwoFm1C841NCWDywteFvIEeqlse5R1XBR5kJ6veCOmi+0nOw4GPCM3lGLiLw85rzZm374YPxt9q7vuV3I6BNx8ABFmtWn5q3FPg/X9ZdB0Gg2j71Io/hrkt8eoBF44aXsoDrHX1WWoUwBPsGjhTduMUBlo204gwhifDuu5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHcsYCZm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHcsYCZm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0991F0089B
	for <exfat@lists.linux.dev>; Tue, 13 Oct 2026 04:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791864278;
	bh=u+ekwzoIEO6HDb5CIajNnysgN4jHJu6P1HU1o1BTcjs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eHcsYCZmDm8pw6T+Cp4/39GIp8seMwq4sUmc+epg1NIiu72fieisMgNI906TzRbaT
	 tsEg7A/jW0SEnGmUAZdrBJCu53RB8MgLZnkwwklkavgqcyH1f+PGdB/bFkUzFl8zx9
	 cUhzsROSmGYwK+coqW/7deYNJbFc9M1Lm/jzrEIO3jng+UAxMYLSoXHIqxVwO3eOLi
	 QMBe6APl/r+yhComcNsZzo5tD3bKlp7vaovyqZzytFNy/IHb8nY1T9Vj65MlffuvhS
	 AGWcoruYNOql9+giKX8OwTHdWdKJbjXtO2zci/eLm5u79wkSzWLjW4+iZleov+f62d
	 UsqZYTe2WAhHw==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so3295385a12.2
        for <exfat@lists.linux.dev>; Mon, 12 Oct 2026 21:04:38 -0700 (PDT)
X-Gm-Message-State: AFq9FYLl2/ePuUTLi9Ip5OqPLKYF9mzgnmge+/bbr97vXM47P38NdXbe
	toeRW1unycwH0Pf7dVVT6nfktPaOS+WBrCGkLbCdl8spjwlt2q3v0p1DE+eniqxW8R4adbcQWUW
	X+RhkSdRhasWbRbpHksYAAc4BbkuCp34=
X-Received: by 2002:a17:907:2d88:b0:c2e:4373:521 with SMTP id
 a640c23a62f3a-c31aa0d2286mr956856066b.46.1791864277500; Mon, 12 Oct 2026
 21:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013033837.2748258-1-chizhiling@163.com>
In-Reply-To: <20261013033837.2748258-1-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 13 Oct 2026 13:04:25 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8gAtr9uhF_ogOUuc511VEed5HbXbvjzeq-81t_u-4uJQ@mail.gmail.com>
X-Gm-Features: AclHuK-GufY7IP1gFi4ZBIytqs8p0Hg6dhX4WNQikwPCLrcSLwnq0RK35ANLG_Y
Message-ID: <CAKYAXd8gAtr9uhF_ogOUuc511VEed5HbXbvjzeq-81t_u-4uJQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] exfat: fix valid_size update races
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, Yuezhang.Mo@sony.com, 
	dxdt@dev.snart.me, sj1557.seo@samsung.com, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:39=E2=80=AFPM Chi Zhiling <chizhiling@163.com> w=
rote:
>
> From: Chi Zhiling <chizhiling@kylinos.cn>
Hi Chi,
>
> exFAT uses valid_size (ValidDataLength) as the on-disk boundary of
> initialised data, but the current code advances it too late or without
> proper serialisation.  As a result, buffered writes can silently lose
> data reclaimed before valid_size covers it, page faults and direct I/O
> can race with writes, and a failed direct write still grows the file
> on disk.
>
> This series advances valid_size under the folio lock for buffered
> writes, revalidates cached iomaps, drops i_rwsem from
> exfat_page_mkwrite(), and publishes i_size/valid_size only on
> successful direct I/O completion.
>
> V1: https://lore.kernel.org/exfat/59056131-e3bd-4003-8c30-0a356cf0bd82@16=
3.com/
> Link: https://lore.kernel.org/exfat/10029d6f-13cc-4d17-a2f9-b093a8339dde/=
T/#t
>
> Chi Zhiling (7):
>   exfat: advance valid_size under the folio lock for buffered writes
>   exfat: advance valid_size while zeroing new ranges
>   exfat: validate cached iomaps during buffered writes
>   exfat: drop i_rwsem from exfat_page_mkwrite
>   exfat: do not re-zero the valid range in exfat_page_mkwrite
>   exfat: complete direct writes synchronously when they update metadata
>   exfat: publish i_size and valid_size on direct I/O completion
Can you add fixes tags to the patches ?
Thanks.
