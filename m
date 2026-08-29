Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF42921A447
	for <exfat@lists.linux.dev>; Sat, 29 Aug 2026 03:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787975171; cv=none; b=WnAZ+XkrVzRQDz7/cT7AK7sQ70DVslaS0UMpvLFITYnX19mmK3k3r46uLlJhuPh+j4JDGcSYP+I7FKclwB7tEbKh7775q89dHkf8TUOx1e8VeTrLXITtnEjNOoGGCygVUvQC0bm54J0kMQOzmq8koqWXusCDuzKXOf4jbMwZFzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787975171; c=relaxed/simple;
	bh=6Li4JioL9nQQjO0JcYz13/zQiRGOScBYSVjTddVtr4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSCDGonFlXFyW0ObMEzh4deeK4WJYJoOF1511EYAB8vDvwqANMOW9dlBydfEkUphrS6P8iUlc9ltywW/ocLi1kxsW/Qo6yb3lWWUPUEjGvAZ/DJG66uk5pKrE29WcbPMAYO5z8O6K/uFVUAO7qQVJglE6LnrRd2fM3LsDW3I7hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+jrDYIx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+jrDYIx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BBA1F00AC4
	for <exfat@lists.linux.dev>; Sat, 29 Aug 2026 03:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787975170;
	bh=6Li4JioL9nQQjO0JcYz13/zQiRGOScBYSVjTddVtr4A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=K+jrDYIxDRFxrmEFfJZWnuZLz2xLi1ZyfqhEIOQE35p4QOgMvGYcYluq/n0R6BIGy
	 +r89XeksP3sKWlQI4uFzS0C6yKHKl7yXZ7zaf4fXi51P0mvuui5uqVp40PF1K0h7Ik
	 u2OX8X35rNmbhPuQgNXqKRfWWNp3h3sxpaxK+mYWqRIgoRGfPHMyATHPhbUvwyecqO
	 mfAWe9KXD0xMmhBBeNCtWMK7go8H3WjHgc5iCFtu0XTAcaK8KxmBazhRIO3zmR43zr
	 k4xOQa1kMDjhG+Ht20TEiPzR+2J0v3BGXDVlhvnYSmFdJ+t1XbJQ6woOuUlAHxojWH
	 83oR19j6UaB5g==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c25366c9b42so189468966b.2
        for <exfat@lists.linux.dev>; Fri, 28 Aug 2026 20:46:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoUBbNH+qqP78yfyrRrG6Ef+Opv5fuFkfFJixCNkI00MfoJSHlWuGNZQWaeBAnUTF0BgdWrNg==@lists.linux.dev
X-Gm-Message-State: AFuF++mzHNQmoueonCc2xHm2EByi5NUR5cReebFastVy7OJrsH03RVAf
	t2TuCsnlTHEWq9HpLXGPQFEtZpZBvBvaWFvVcVsCW2XutevGWIQwpu+Eq6VrNRFVoqtBQdBA4tV
	mr8EfBo3EHRWWlnHRdWsJyCu+Vpz+y6Q=
X-Received: by 2002:a17:907:9809:b0:c24:6f60:3f7e with SMTP id
 a640c23a62f3a-c2556fe8495mr880352766b.2.1787975169048; Fri, 28 Aug 2026
 20:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828125154.1104851-1-anmuxixixi@gmail.com>
In-Reply-To: <20260828125154.1104851-1-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 29 Aug 2026 12:45:56 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8oDiKPkQiE0vXCTdmEASKzbbVJhgs_2H4ZpS0_oFY_qw@mail.gmail.com>
X-Gm-Features: AcwNN1W_N4ZBLICX2FjnAe9Z42Lj2hoKPX-2iWnr8faayfgda5TCBeyE253aWFU
Message-ID: <CAKYAXd8oDiKPkQiE0vXCTdmEASKzbbVJhgs_2H4ZpS0_oFY_qw@mail.gmail.com>
Subject: Re: [PATCH v2] exfat: validate vendor allocation directory entries
To: Yang Wen <anmuxixixi@gmail.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 9:52=E2=80=AFPM Yang Wen <anmuxixixi@gmail.com> wro=
te:
>
> The exfat entry validator checks the type and ordering of benign secondar=
y
> entries, but does not validate Vendor Allocation entry fields. In additio=
n,
> exfat_find() reads only the first two entries, allowing malformed trailin=
g
> Vendor Allocation entries to bypass validation.
>
> Validate the allocation flags, VendorGuid, FirstCluster, DataLength, and
> NoFatChain extent. Read the complete entry set during lookup so malformed
> Vendor Allocation entries are rejected.
>
> Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
Applied it to #dev.
Thanks!
