Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792980481;
	b=yO0AcPmOgCO6UrHL3S8zkBmcavkHBY41VTz4OaUkWVdGPj7HiKzju/uHml11yF3Pi94E
	 qSuiPXI9MaxKLGaYoD++Ki5BpcGkOitMiUdtyXTn6rM9CYpMZbVUPdWORbAB9j9/N04V4
	 /YsYOSpw4AoV66eAN9hZK+Vq6mA/JfLdKa89zUYE9yVom+Tw/c9Ffjno1ZDDfPIzKUebq
	 PEjdTEx/lGPp+xPKU38wOJ2arq31fxEMsU1JzbqUyJKeGNgGoGZs90/ShYJ5U2mngh0Kv
	 r4he5oeLoq+1oPnUxh209FSebPzr/xurMZJFtw/tHzMYF5aVO3K9ebERK5Q57XwHZTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792980481;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Z8SmuwKBxU286h2ujy+YcFK9/A4LpoMVBKiGK+oS4Es=;
	b=SwWpipZgX/9MmcKYeUc/msEuMDI1lSDqDxTcK69+ozBV8Nvw+BTYoURRDqAqFXM8cYlE
	 QY6kB3YAcqc8QtO5Nwn//eQG6mNlpGgdurgbBJY02NeeNVMms3FQyXuKCXkUsQWUFer1S
	 giUCxMTHB42Z1ITFgDjItNcL8wY1947cmQz8awi3qZfal8EknJSA9rXaCwlpjIygUrXRv
	 +/UNBic7QJNR9TKRezy5H+IpLhsgGePmlOlYU1bs/YvUAG00JO7cBE4ktA6hxOTLZoK+f
	 IB7YZqSyX6jnK+0vV6b/GZt/+vgeTrqpAJBSUiaBQrS5DhaPfdU+j9J/GwodL21JW0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RF/5VQVF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC6B606A31A;
	Mon, 26 Oct 2026 02:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RF/5VQVF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88D51F01828;
	Mon, 26 Oct 2026 02:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792980480;
	bh=Z8SmuwKBxU286h2ujy+YcFK9/A4LpoMVBKiGK+oS4Es=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RF/5VQVFisjkOwf9aGooHYvRA1ixBQg4yqSHnYQSLzHD9LEuwstzPwMpQoxYf9z7H
	 FUrn/DBOfNxIOiRVuUUOLoBW7m+9fyy3xt+KHTGIlnLheGYUJDLjWDwgVKvt985ph/
	 8NrcZaLkK4ft9vu2MlSsLxybofbWWBMDq79tenW+B1TTAytJPpVZLtibWs48+/eOKb
	 xuR9W8sbbiAouV47d+KsTSQngYOYVIlFPUonm1LqWoiQZP3xpApsoIrTDSoH1h05Vc
	 vtgTFVa0Tacrcb+fNNxcnD0iYUHirDbwHFq4oVIIgPXixB9YpWqQoh07rK0mEHjuJ3
	 giQP5pRxPazYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE54439EA760;
	Mon, 26 Oct 2026 02:08:00 +0000 (UTC)
Subject: Re: [GIT PULL] exfat update for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKYAXd-2zfKDx1oKG7f1d=xo+ptVN-NiWGuhON-JvCmcDipLRg@mail.gmail.com>
References: <CAKYAXd-2zfKDx1oKG7f1d=xo+ptVN-NiWGuhON-JvCmcDipLRg@mail.gmail.com>
X-PR-Tracked-List-Id: <exfat.lists.linux.dev>
X-PR-Tracked-Message-Id: <CAKYAXd-2zfKDx1oKG7f1d=xo+ptVN-NiWGuhON-JvCmcDipLRg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git tags/exfat-for-7.4-rc1
X-PR-Tracked-Commit-Id: 8534eb11ac056dc2ca08007cf76d3ae7cbe42684
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42023dd0a294d8b5c05127dcf95987b70c2fb271
Message-Id: <179298047933.2358720.14682098427969086236.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 02:07:59 +0000
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, "Yuezhang.Mo" <Yuezhang.Mo@sony.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, exfat@lists.linux.dev
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list

The pull request you sent on Sat, 24 Oct 2026 13:15:56 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git tags/exfat-for-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42023dd0a294d8b5c05127dcf95987b70c2fb271

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
