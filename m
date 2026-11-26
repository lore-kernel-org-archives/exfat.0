Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653149;
	b=KqGrXNeJ6+M5oNoIqD5Hg6x5Rc7mFCPKAQ5g8+cwIDBBsN6DZY8O38xrL1gU8pH85lVu
	 UrHGNu3DOB4ksP/uOFPF0ByMMhQAiFRmd/H1BIybSGB+RYGdsTzS+unZ9aaLfvUIUXrkL
	 3hzXvW8nJFD89aK89x6SETAd1RZZvBrhtt9qqa1AbinaVqCriMM8/kp+X4JUDw5O15zdL
	 xeHMY6i1HiOphF6BpIlDSh4ghvhzS41g0VpSszo0ijtCLY9hW0ZTlg22/5c9v4qoxYYll
	 QNHsD42PHEYGdMO4Cnm84uuFoUiev/+ZhbX3h7m/lI3GqrgKAleGidvDHw0aDT1nDsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653149;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lgQzDnbLlkbWK7iq35k9uRmkfYNJ7Lg/prwK3ik20GY=;
	b=WZfy/diIw7LALc2yMksrAk+4fKrleRQUJDQEII12/qE5Es+VXwXYmd2aQFFDCNcGuJSK
	 3T4tO2+0rMFOxfQMPIkA7DOCQdGEFgcVtdbQNrw8OKt54N/VRLbrDDlZKqDnV7UdTqeoJ
	 60Rv7jn/tdzfsc8f3iWUwh5eud7/RKHshFN42bDsDmNclcQczAiSTV8vyTrpAH/WUsPoC
	 XnTwu0QLkGgn2zkycuNrumuvaowJ5AOOnMg7gCIDkkJZf/StD56bRZkd8l/rRfcgfGhQ0
	 m49P0vt32z4OUojGMwMyZ67jhubWxwhqbEKh/IFKT9C+3w/vuzgs91HQOps7lw4vqxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HCdaFVT+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69621606A323
	for <exfat@lists.linux.dev>; Thu, 26 Nov 2026 00:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HCdaFVT+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0472F1F000CF
	for <exfat@lists.linux.dev>; Thu, 26 Nov 2026 00:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653149;
	bh=lgQzDnbLlkbWK7iq35k9uRmkfYNJ7Lg/prwK3ik20GY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HCdaFVT+9uP2jdD+vlnEtieaoT7xL3cEzrn3uxfbxJeGUEX7X8ZDGAFcxcApre2rt
	 yr0vhamIcIqFJEeS/f1GS4kO+0lz83I22qy2BkCGa+xK+b479OCnniAHHyBfxg0G+u
	 H8DqiznmiDJ1JApM4YZQETFr3O+Yt21LKXYF6vtuiH4AGg2+I44RdTrHYV4luYciN9
	 WpdR/76M2JSOauRsWzZDUfCYI7yF4fZRII5f8MPHcirUF1TZRW6s3B/9L40NitgWiE
	 6OpJrO5nfYW/i1iC6HN6G2uGiwfbc2bgY6CKuaH6HBnSvgvKRjLOuFlIEAtQT7oAw5
	 mYhSDiw+g842g==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4395d31228so1088861666b.1
        for <exfat@lists.linux.dev>; Wed, 25 Nov 2026 16:32:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE6pozxkADxrNm9IOEpU+rpmBeBg856wjH+goqlT4lxpk+WMmUgRoJuQlwW2/nNc04QpEkwag==@lists.linux.dev
X-Gm-Message-State: APuU4Z8eg5qrk9CGVhd9d8+yRCSPHhO6VOAwroqeBT85cOHM2b4riN6r
	BFQO693xFwkcCPJqkuEC5tC2MZQ5kILQP01PhjbygMQFcBk3pKZQPqTyfDShVKGoCQAHAME7Qud
	9D5VJEkNLDpU514ojm4dUnHcTQ+ojjWg=
X-Received: by 2002:a17:906:af4a:b0:c50:8ff9:4f40 with SMTP id
 a640c23a62f3a-c513a5e1bd3mr1351750466b.11.1795653147657; Wed, 25 Nov 2026
 16:32:27 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125135223.2713860-1-anmuxixixi@gmail.com>
In-Reply-To: <20261125135223.2713860-1-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 26 Nov 2026 09:32:13 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_9u-ZRaZxuCPPfptd8uOT+hF8-j9d99Pi01SwONcsiRQ@mail.gmail.com>
X-Gm-Features: Aa3M54r8h_eFc3uu_yHRzIdQulshHaFOPCkelQPbWktEcSxUhpf0cOQoEFe1zgQ
Message-ID: <CAKYAXd_9u-ZRaZxuCPPfptd8uOT+hF8-j9d99Pi01SwONcsiRQ@mail.gmail.com>
Subject: Re: [PATCH] fsck: detect case-insensitive duplicate filenames
To: Yang Wen <anmuxixixi@gmail.com>
Cc: hyc.lee@gmail.com, dxdt@dev.snart.me, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 10:52=E2=80=AFPM Yang Wen <anmuxixixi@gmail.com> wr=
ote:
>
> exFAT file names are case-insensitive, but filter_lookup_file() compares
> them with memcmp().  This makes fsck miss duplicate names that differ onl=
y
> in case.
>
> Keep memcmp() as the fast path and fall back to the volume upcase table.
> Add a regression image for case-insensitive duplicate names.
>
> Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
> ---
>  lib/exfat_dir.c                               |  24 ++++++++++++++++--
>  .../duplicated_name_casefold/exfat.img.tar.xz | Bin 0 -> 3808 bytes
>  2 files changed, 22 insertions(+), 2 deletions(-)
>  create mode 100644 tests/duplicated_name_casefold/exfat.img.tar.xz
>
> diff --git a/lib/exfat_dir.c b/lib/exfat_dir.c
> index 9b63b04..2bb9a3e 100644
> --- a/lib/exfat_dir.c
> +++ b/lib/exfat_dir.c
> @@ -551,6 +551,7 @@ static int filter_lookup_file(struct exfat_de_iter *d=
e_iter,
>
>         for (i =3D 2; i <=3D file_de->dentry.file.num_ext && name_len > 0=
; i++) {
>                 int len;
> +               int j;
>
>                 retval =3D exfat_de_iter_get(de_iter, i, &name_de);
>                 if (retval || name_de->type !=3D EXFAT_NAME)
> @@ -558,8 +559,27 @@ static int filter_lookup_file(struct exfat_de_iter *=
de_iter,
>
>                 len =3D MIN(name_len + 1, ENTRY_NAME_MAX);
>                 if (memcmp(name_de->dentry.name.unicode_0_14,
> -                          name, len * 2) !=3D 0)
> -                       return 1;
> +                          name, len * sizeof(*name)) !=3D 0) {
> +                       __le16 dentry_name[ENTRY_NAME_MAX];
> +
> +                       memcpy(dentry_name, name_de->dentry.name.unicode_=
0_14,
> +                              sizeof(dentry_name));
> +                       /*
> +                        * exFAT file names are case-insensitive accordin=
g to the
> +                        * volume upcase table. Keep the exact comparison=
 as the fast
> +                        * path, then compare the canonical characters wh=
en the on-disk
> +                        * spelling differs.
> +                        */
> +                       for (j =3D 0; j < len; j++) {
> +                               __u16 dentry_ch =3D de_iter->exfat->upcas=
e_table[
> +                                       le16_to_cpu(dentry_name[j])];
dump.exfat calls exfat_lookup_file_by_utf16name() with upcase_table
still NULL. If an earlier directory entry has a different name of the
same length, memcmp() reports a mismatch and the lookup dereferences
NULL here. I reproduced the crash with dump.exfat -d while looking up
an existing file on a clean image. Please return 1 on a memcmp()
mismatch when upcase_table is NULL.

$ sudo mount -t exfat /dev/sdc1 /mnt/test
$ sudo touch /mnt/test/AAAA
$ sudo touch /mnt/test/BBBB
$ sudo umount /mnt/test
$ sudo dump.exfat -d /BBBB /dev/sdc1
exfatprogs version : 1.4.5 (2026-11-18)
Segmentation fault


> +                               __u16 name_ch =3D de_iter->exfat->upcase_=
table[
> +                                       le16_to_cpu(name[j])];
> +
> +                               if (dentry_ch !=3D name_ch)
> +                                       return 1;
> +                       }
> +               }
>
>                 name +=3D len;
>                 name_len -=3D len;
> diff --git a/tests/duplicated_name_casefold/exfat.img.tar.xz b/tests/dupl=
icated_name_casefold/exfat.img.tar.xz
> new file mode 100644
> index 0000000000000000000000000000000000000000..d941e14ffd6e60a09aaba928a=
d02519bc7ce6f4e
> GIT binary patch
> literal 3808
> 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
b
> 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
> C<x|A~
>
> literal 0
> HcmV?d00001
>
> --
> 2.34.1
>
>
