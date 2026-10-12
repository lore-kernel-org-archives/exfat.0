Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551D3470EB6
	for <exfat@lists.linux.dev>; Mon, 12 Oct 2026 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844491; cv=none; b=dyBxitAfQhCnbImsXVS/Cdc3l8jECMxHxS7s6Wp8tbQ+GOioTO6ZKSVlgtSmf6L8pJeEsQpgM3vOmm7xJaHtKfGOx13KjuQG/xDcMs54iqi3wMIOC38d8zO0Ql31Vbq+1dYHojdY3GMvvyztAlPUh5KHC0TcYvh7ItS7Iw5feiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844491; c=relaxed/simple;
	bh=J2HTAotR7tV6EhRt0H4zRc9Ubr6pAv1DK5kmv6KCXxc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MNhcWsAyFeG+O5xVwMu5K5d0J0aDLu3iNvtKz2nV8/IoKVRH/alC6fw4sEpQQ9AD+NvwuR/1JjnQP/IELUI7iBDarqgj+yANWxcmlKm18C5IA2nQLNQN5TGMXf637HTgEbBDycS5OErdq/gxmjcfHmD9G2Va26wDNm+J/H6bKzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=h1hm8GCR; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="h1hm8GCR"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b09e07e149so12279097b3.1
        for <exfat@lists.linux.dev>; Mon, 12 Oct 2026 15:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1791844487; x=1792449287; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=71EqnmdUFPL0oyce+6aQMAYEr0rHGu143nkPC8VddIM=;
        b=h1hm8GCRKqEDrKdRoLle50jCerkGiSg9cvEUhxKCxxDJCnDLpO69LSC5Aydo5xOwep
         Oip7FEYhgg88gkeflBr3dM7j393YGq4sFrq32sg7AyyLThaRSdULiQBnnbCGetokYTar
         YWal+VgUtLF9dXPqoPI919rlHXQe+7FKl4Naz7NROqRfx+UoK5t6sHoBP+olPcKO7acn
         aO2NT6/pCJT7yEfDI7UvYsz+mxhBB2QjhL+7xVZiS7GLhOyU0SjRplAjQ6sTaLS0uNIa
         JqXTaU9LMLJwS+wJwwtwF6UTTW8lMVb35EVCE8Hb2gPmU0h1MFq3Lh+5d2AkiR/JwmGS
         yrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791844487; x=1792449287;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=71EqnmdUFPL0oyce+6aQMAYEr0rHGu143nkPC8VddIM=;
        b=04R+yRgq40504IZj/hCotq/028uUiBg+yPvOHiyRJuZ76hTDPQBLYkno8+zcVx9ceL
         /0peMo6F5PJGLo8eF6wPzfcUb7wYg+8raGwGGOPc6bLqeqlQItVpZINnlBpfHz8EfqVR
         KnGRx3Pmu6LI4x3OvxvQZb7zODIAipMRYeCpxP5iCTGIFXBqQ48daC9VYcyJAVNhwam8
         4sdMuwXipaGLVabFLbnwHpLEGcFB/faaSOPlbFOOtN5httbWE+EUYeCxMSfepBpfOJff
         lSXz+uyHMwPQZ8Wr59ZQ4o8yonZH0oZ71BbkQmUo1AmWe/UhXdrt+8Rrg3tDn0Cw5gf4
         scXw==
X-Forwarded-Encrypted: i=1; AKwUvBz9PE7LFTm+BXA+kq57MaFogRg1h4+bjunO7vXMjysfDAHsb0h9reTUXbeLZTeJU3RCEJIcjA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLrQesru0/NyGv9qHcvgdvTIjxDKlnQfEQ2UdaW/+3JtlD4pk50
	GpugPZf3mBX7zFkzTGR3vmvO9TrZWeLhWJLiUVFW0UMOxq0HknidICal6q4DLFHv+So=
X-Gm-Gg: AYBFou1FoA3e++M9Phd9UGH/Y2Xx97R4S2R/uge92z4OqBzK0sS+d98sAGG1tf/UPr6
	PX1WvgehIlFE0wl0StsjbDjLFgxsKHAbgqY3nh1RQrZjtYVEvaxv4ENM1EzzY4u1Ag5AtYmaNOc
	i/R41JyoItyTFMzpWu3wBiBJm9L086dLObJ+q8JF9xe8L98yaucHr+9yZXp++j5Y/EPfCKnt3kw
	zGxco+OlIEfcFdEDt1w52V56/7J9o1ZsDLr/Soi5x+rccFZm1MST6z24y9K2x5BGSb8h+SDt7Pp
	lxhMWASFvAFls9dCOnvlVMprb+VPIzPhyFL2UXRAsKUFZJ3n/lMNhrGqWCocrYXq0T02eMvEeCf
	mvCXQooBob9uTQTcsVxAnpNU7UT3WcmmPIIN+F4HUdMcnaxsqpIjRtVzTKl7gLBqXjxSF/OFnun
	IRl4nR7sU6tR0v4cQqY7dI0b51UZJbRqvjuOWb8cN0ki6goxMk3BI29ffDoRQNF6WLx2+DzKEeS
	x3nLZi72ENYu/+C0SPhfJDLBRfQjiUKdwGk2ol2EmKAEvc8kJjpiJXjAhEO+QFDeTQ3nJ3ENUdz
	laWVBg+TnDL/nVqxacBiznWpSVvy/GBX
X-Received: by 2002:a05:690c:7108:b0:8b0:4f12:d36f with SMTP id 00721157ae682-8b07ed609b7mr36562257b3.52.1791844487244;
        Mon, 12 Oct 2026 15:34:47 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430::48? ([2600:1700:6476:1430::48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0ab2e8d0fsm9306077b3.22.2026.10.12.15.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 15:34:46 -0700 (PDT)
Message-ID: <2e7d65d349c6691697f02f98f733a651ce3aa116.camel@dubeyko.com>
Subject: Re: [Jfs-discussion] [PATCH RFC 10/28] hfsplus: don't set SB_RDONLY
 when creating the attributes tree
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.com>
Cc: linux-xfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, ntfs@lists.linux.dev,
 ocfs2-devel@lists.linux.dev, 	ecryptfs@vger.kernel.org,
 gfs2@lists.linux.dev, exfat@lists.linux.dev, 	linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Al Viro	 <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, 	linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Date: Mon, 12 Oct 2026 15:34:42 -0700
In-Reply-To: <20261012-work-fs-sb_rdonly-v1-10-60743a3dc326@kernel.org>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
	 <20261012-work-fs-sb_rdonly-v1-10-60743a3dc326@kernel.org>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2026-10-12 at 12:20 +0200, Christian Brauner via Jfs-discussion
wrote:
> hfs_btree_open() sets SB_RDONLY when the map record of a b-tree
> doesn't
> mark the header node as used. That's fine while mounting where the
> mounter holds sb->s_umount. But hfsplus_create_attributes_file()
> calls
> it too when the first extended attribute gets set on a filesystem
> that
> doesn't have an attributes file yet. That runs on the live filesystem
> without s_umount and a filesystem must not change SB_RDONLY behind
> the
> VFS' back.
>=20
> hfsplus_create_attributes_file() opens a tree it has just created
> itself, with the header node marked as used. So there's nothing to
> check there. Only do the check while the filesystem is being mounted.
>=20
> No functional changes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/hfsplus/btree.c | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
> index 2ea8cd5658e1..967c457d843d 100644
> --- a/fs/hfsplus/btree.c
> +++ b/fs/hfsplus/btree.c
> @@ -385,7 +385,12 @@ struct hfs_btree *hfs_btree_open(struct
> super_block *sb, u32 id)
> =C2=A0	if (IS_ERR(node))
> =C2=A0		goto free_inode;
> =C2=A0
> -	if (!hfs_bmap_test_bit(node, 0)) {
> +	/*
> +	 * Only a mount may set SB_RDONLY, later that needs
> s_umount. After the
> +	 * mount this only opens the attributes tree that
> +	 * hfsplus_create_attributes_file() just created with the
> bit set.
> +	 */
> +	if (!(sb->s_flags & SB_BORN) && !hfs_bmap_test_bit(node, 0))
> {
> =C2=A0		pr_warn("(%s): %s (cnid 0x%x) map record invalid or
> bitmap corruption detected, forcing read-only.\n",
> =C2=A0				sb->s_id, hfs_btree_name(id), id);
> =C2=A0		pr_warn("Run fsck.hfsplus to repair.\n");

Yes, we can do this. But, maybe, we need to move this check:

	node =3D hfs_bnode_find(tree, HFSPLUS_TREE_HEAD);
	if (IS_ERR(node))
		goto free_inode;

	if (!hfs_bmap_test_bit(node, 0)) {
		pr_warn("(%s): %s (cnid 0x%x) map record invalid or
bitmap corruption detected, forcing read-only.\n",
				sb->s_id, hfs_btree_name(id), id);
		pr_warn("Run fsck.hfsplus to repair.\n");
		sb->s_flags |=3D SB_RDONLY;
	}

	hfs_bnode_put(node);

into hfsplus_fill_super(). Because, then main point of this check
namely check the b-trees during mount. If we create Attributes File
during setting a first xattr, then map record is always valid. It
sounds to me like more clean solution. What do you think?

Thanks,
Slava.
