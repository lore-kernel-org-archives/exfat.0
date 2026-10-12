Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CF338C2C3
	for <exfat@lists.linux.dev>; Mon, 12 Oct 2026 02:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791773084; cv=none; b=JKLMoDPDDLF2leP5MPLYzhL1n8gf+fAAFY1ex51ZcnxYLf4iks3kWU8M03WfILIYF/+4XAsCN0Os5iYu/8+I2cHrkXvHrhIgdZZ6BhRNgGIMaZonxzwvlpSFVcLV+hTebud9+rBsN92uRCcoG+lsoa/CpW94K8s2HKs6ETcExJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791773084; c=relaxed/simple;
	bh=JxBhWizKqawB69gMFbfC//gobttUSGb7NtbnLsBXUSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3Ff+JLMY0sLYwyDqmv3KKORUnxMWFMc10DG9dEKC+zxkU6hZ73t2eZDh4o0vIycJCIRNcgiUE7UsMm3XRiq2Kf+h+/eP7xeyNSSQ5E0fK4RwK1PHLZFbALiq5F7Ovmdd41rbARLnUwAHoG+J1DCtPaEQ9GLgdRhOVYo5jwpHKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zc1A5aX/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zc1A5aX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810DB1F0089C
	for <exfat@lists.linux.dev>; Mon, 12 Oct 2026 02:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791773083;
	bh=6YWN66Wl7KZlYOubm3O9+X/mTFE29yBJjcpx9ZFTfS0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zc1A5aX/yWZK6HwX1WvkIAcSNqqlrGYBs/2O6SUihzbdzvWdbPnWDm3O2lYge1/9K
	 nFPgg0UVw0djku/pi++QfP5p+q5Xzzy+zJNirkok5lseQRtKle2oPVvIgF3VHRDAmP
	 KHxcJNdpfCMVPG3kzNK6TDqrZRJ7riF9ucfozNRX97jUbhcYVCnOqIq/ssn5ZXKv5b
	 NoUa1otIsAP0TWyxKvEHTC7KfJZnxrzlgVWhuoOqjspoZ+m9rr5mvlowPH+AW5hb6U
	 5AuCHpGuZJ/Kadl4KNtiLc6ndFLXRI5ow3BOPQVNHSmtdBQeUb5uvAxAmPX2X5+3kV
	 OiG4cRBNPcyBg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e5d08214dso182624166b.1
        for <exfat@lists.linux.dev>; Sun, 11 Oct 2026 19:44:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzwnbbEuMNe0GugZlzBqHw07g3r8IVF8u3dmyRaQdpkCINnkayg/XLtG0HAeYgQmCQs964avg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJoC3CgzGxskoOLOBp5nxZmeHea+FLUNi49CJtIYKcuW/VtJNYU
	cpMnyYv0WmwVGcoCpxlruKoyIl8J/PxwYrk+u5i2xk61087S1LkSpqd710tB+7K1e0ooYCbuml4
	FV0SDRUUsey4H8JLP00ScobY8p81UzSM=
X-Received: by 2002:a17:907:c28f:b0:c31:9b37:ed3 with SMTP id
 a640c23a62f3a-c31a9b0b9c7mr757346066b.14.1791773082161; Sun, 11 Oct 2026
 19:44:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008145525.1950813-1-anmuxixixi@gmail.com>
In-Reply-To: <20261008145525.1950813-1-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 12 Oct 2026 11:44:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-5rnpAP9Wgn37f7d04GJC7SCm5bnDi4=sQpWjRxUxk_g@mail.gmail.com>
X-Gm-Features: AclHuK97K4dFNdpuvwtrMs3V-rfrX4sOzCQ-q3tsLqpqD6QWT7pbC9updR3IDhY
Message-ID: <CAKYAXd-5rnpAP9Wgn37f7d04GJC7SCm5bnDi4=sQpWjRxUxk_g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] fsck: harden boot-sector field validation
To: Yang Wen <anmuxixixi@gmail.com>
Cc: hyc.lee@gmail.com, yuezhang.mo@sony.com, exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 11:55=E2=80=AFPM Yang Wen <anmuxixixi@gmail.com> wro=
te:
>
> This series hardens validation of untrusted fields in the exFAT boot
> sector.
>
> The first patch validates the sector and cluster shift fields before
> using them in shift expressions. It addresses the review feedback on
> v1 and is authored by me.
>
> The second patch is the CVE-2026-45531 fix from the Android exfatprogs
> tree, preserving David Anderson's authorship and the original code
> changes.
>
> Changes in v2:
> - Split the shift-field validation into a preparatory patch.
> - Validate sect_size_bits and sect_per_clus_bits before shifting.
> - Add a link to the original Android commit.
>
> David Anderson (1):
>   fsck: prevent overflows from invalid clu_count and vol_length
>
> Yang Wen (1):
>   fsck: validate boot-sector shift values before use
Applied them to #exfat-next.
Thanks!
