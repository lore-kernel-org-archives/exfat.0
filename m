Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9457F441606
	for <exfat@lists.linux.dev>; Wed, 29 Jul 2026 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785316241; cv=none; b=F07Bo7XnyzXAfXMfsjEcThijAc/Cz5uasjUmArPTpSwao0DfPLfspxrpTW3EEmvWyKKViSCF7JqQm9neoqewajpv87hvuGOt4WMbljarV0jdxKQhl8ps5HC7ys6WxaCktNraJEe2cxF5RwS+leZ/1f+kN0Z1hmpjbUB3Y4C+XRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785316241; c=relaxed/simple;
	bh=oKMU2JAVRA+0SoHTu9Y552K77ltwgcH9XkfDzTF243E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCTFaB24iDpivoSstr1qtFkNTYw/g07UYsHYnjrjxKKEpfyIwpNsuXngIFLEowJ4T3vJ8D0GmaRhdb1EBMR2dh13Ucn4IyUeuSXWkXg8mNZjK4tCN8ZBe6P72eOoMOBEiSlkSMfTPuPb0SRa0FhkdYqStwCMl6cEoC6HY0a7qIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yyl9Zvii; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yyl9Zvii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4221F00A3E
	for <exfat@lists.linux.dev>; Wed, 29 Jul 2026 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785316235;
	bh=ho/QoiDc0aL7cW/CF9qTcVzCiWmKJCP3MbY7tabsJlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Yyl9ZviiNmRZ8NcvaHINvD0i3liDTEmpug1oOgqq+2rtDlYXIbleRBUX5eS3I1LKI
	 uK+n4UHBPHhsidwvAcUU8egQkad1NQ/E1fyGcR33ideddu3wOGEuQ7MabaPd8L3qX5
	 nqKSC2mjcaN950JBaPRwm112OiZPHQ/lRgI0NdDT02IU1nmG+tgrusFO+DrX4NT4pU
	 rUo8WkjQrplNceRS/ReTOXd05uu+Xox9r1jpl21nhNvsP3GkShVcgRC7lNPouuZsRR
	 3eTVRFJLNmKNd7kMhvooHCA6Aq94ecj9mXz7JF6tNOPmaeoaNZyYuIMcG7PQhBe8Yq
	 x0ZJqkc43Cx4Q==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1c24ec9525so123165066b.1
        for <exfat@lists.linux.dev>; Wed, 29 Jul 2026 02:10:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrOLEUh32wL4i+AQInuhZrUCkqi/iWRvO9ZpVaZ8N5MHLmIjdgTx9lMfdN2aBALsNxd7ei4Ag==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEvgCZoBTWaKl6PghRqFdwcBPr7RgRomno+h1bXihQCkW8FlaW
	3ieGsib077YkaDhycoCWXj2ysX21Ru9lFtfpZQT4ZGdPpHbA7pqn0/k2E1tRL8qGbePy6kZv5OT
	BSutglU0vFC2MG+MedXFi3XjPl6rlQug=
X-Received: by 2002:a17:907:d7cb:b0:c1f:1267:deb7 with SMTP id
 a640c23a62f3a-c1f721918c0mr328412566b.62.1785316233795; Wed, 29 Jul 2026
 02:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729022543.469171-1-chenyichong@uniontech.com>
In-Reply-To: <20260729022543.469171-1-chenyichong@uniontech.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 29 Jul 2026 18:10:21 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_MFU7+U8hwByFj4UPN6JUUtH_VQWe-gxX71saJ2BP5GA@mail.gmail.com>
X-Gm-Features: AUfX_mz7IQPveJiBfu9yKJQN6hpDJRZs6IUsQ-LCoVf8kxgDFyefz7sAxiAU9cw
Message-ID: <CAKYAXd_MFU7+U8hwByFj4UPN6JUUtH_VQWe-gxX71saJ2BP5GA@mail.gmail.com>
Subject: Re: [PATCH v2] exfat: clean up new entry on add entry failure
To: Yichong Chen <chenyichong@uniontech.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:26=E2=80=AFAM Yichong Chen <chenyichong@uniontec=
h.com> wrote:
>
> exfat_add_entry() initializes a new directory entry set before writing it
> with exfat_put_dentry_set().  If the write fails, mkdir/create returns an
> error but a partially written entry may be left behind.
>
> For non-zero-size directories, the failure also happens after a cluster
> has been allocated for the new directory.  Clean up the new entry
> best-effort, and free the newly allocated directory cluster only when the
> cleanup writeback succeeds.  This avoids freeing a cluster that may still
> be referenced by an on-disk entry if the cleanup fails.
>
> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
Applied it to #dev.
Thanks!
