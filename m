Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870C3438010
	for <exfat@lists.linux.dev>; Fri,  4 Sep 2026 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519934; cv=none; b=uedgVAjp4u6L1Y6JNqce8SaKoNlUbcWMM4HpY8I6dKMBcMUglBj/+1gvtCysMTyfbGTE3dSGkkLLNSs4xlQrlG9fmVcY5G7m+xURfizBGMcJElYCr0N/1blPHL0cI7xMY960WqD90t3kgDr/rauhaX+raPriKCElut/I1iXLYeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519934; c=relaxed/simple;
	bh=VRD9iI5obZj58cYue4amFQyh0VTrljNEzmlwATbaZ14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdubIPNE4BLzWpD1jooy5TQKiB8MZzX2G/VH9x45CHsqkA0ZERkcMeuH3eD8p3zTs6B86odey3fPG6lTlfLX65IdlZkvLp4CkD9Z/iyR+McEX4y9sUnETTGSNl00CfvMrU0zm7hMrIGIM6pvhEr3F/4ioQi45xgpnXfHS2sRZBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPEDwoBY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPEDwoBY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B6E1F01558
	for <exfat@lists.linux.dev>; Fri,  4 Sep 2026 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788519932;
	bh=VRD9iI5obZj58cYue4amFQyh0VTrljNEzmlwATbaZ14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LPEDwoBYeK1Nc4pBwiyJeKlJN4jvjQDnb1ieP5ipwpaRvNQkfx14vj8L6v8wkXSG6
	 jdMjx09nKntMVn7YdJx6yOHvRPpHRjVNo3FSAQQRooqPNIeuCQAzHgih54TW54zKWJ
	 GHGM6YuyCYyBsUAzM9TqUef/pypefV3LJ8xclI5xnAyRnQ0rH6OVBETzn46ZmZ0S00
	 RJLCPF+IBtKm4T89k0t7udNj7faISHzS2kGHOGlhb1u53uS+BX7r0dipro02O+RfYw
	 kqsaGOQH13clnyk0/ies8jh10IhUBQUvwsCKPE61FVaObNi9SpBvp/bdaC7wW27S8e
	 iZxcjKeRI4x0Q==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c252e703fa3so126778266b.3
        for <exfat@lists.linux.dev>; Fri, 04 Sep 2026 04:05:32 -0700 (PDT)
X-Gm-Message-State: AFuF++kr3N3xO5wIc8Fr76eg1qZ+Vx2MhnU80B3GVq+gekkuyAxo+XOs
	M06vk6zBH/R7WyBl+rMQdAOtPQTaFiBbzD81uTSXnvDEOJvbyconNdP87OgdD+FOuhHAxfOl4iU
	n9Nn9g/f0O/+N8v1EJSbQRisLfZX6br4=
X-Received: by 2002:a17:906:730e:b0:c26:1648:a060 with SMTP id
 a640c23a62f3a-c261648b673mr118091966b.27.1788519930808; Fri, 04 Sep 2026
 04:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904032641.435958-1-chizhiling@163.com>
In-Reply-To: <20260904032641.435958-1-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 4 Sep 2026 20:05:17 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-aYkPTBdUzoQh5KSyfQojs0TziyEXCfyRuhnHu8=W5pw@mail.gmail.com>
X-Gm-Features: AcwNN1UVUhsxSqIwETefa1dzsat_fIF2mop6N_jh1Cn_AKTbFGKaZuN4DsT4D0g
Message-ID: <CAKYAXd-aYkPTBdUzoQh5KSyfQojs0TziyEXCfyRuhnHu8=W5pw@mail.gmail.com>
Subject: Re: [PATCH v2] exfat: clear the volume dirty flag only when
 remounting read-only
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 12:27=E2=80=AFPM Chi Zhiling <chizhiling@163.com> wr=
ote:
>
> From: Chi Zhiling <chizhiling@kylinos.cn>
>
> exfat_reconfigure() does not hold s_lock while calling
> sync_filesystem(). Therefore, the filesystem can become dirty again
> between the sync and clearing the volume dirty flag, leaving a dirty
> filesystem with a clean volume flag.
>
> Holding s_lock across sync_filesystem() is not an option because it can
> lead to a deadlock: writeback takes s_lock in exfat_write_inode().
> Instead, clear the volume dirty flag only when remounting the filesystem
> read-only, where no writer can modify the filesystem after the sync.
>
> For a normal read-only remount, reconfigure_super() calls
> sb_prepare_remount_readonly() before ->reconfigure(), which returns
> -EBUSY if any writer is still active. Afterwards
> sb_start_ro_state_change() sets sb->s_readonly_remount, so
> mnt_get_write_access() fails with -EROFS and no new writer can start
> until the reconfiguration finishes. Therefore no writer can race with
> the sync and the clearing.
>
> Forced remounts are different: with SB_FORCE, reconfigure_super() skips
> sb_prepare_remount_readonly(), so the writers active at that moment are
> not blocked and can still dirty the filesystem after the sync. Do not
> clear the volume dirty flag in this case.
>
> Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
Applied it to #dev.
Thanks!
