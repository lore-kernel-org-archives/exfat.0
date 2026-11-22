Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795306696;
	b=fhqaS/u3jDrsHlpwB+8jvaewZCOZunwFtl+bEXr/mKfRTFKompeuAzl8bIK7L8JTxMxL
	 wfo3zz5oA0/cnZW5C6H47+3EZohrXwYCiPYpk9yKMvsIaZP1PScP9y7/1tehu7WWQZlYg
	 ckYAQbNpuFP+Woyf4g9bJoTns3dkO8Zw5NpcsvSVYcPKFiVTS5MWm4jnz3BQjTDN/t+PC
	 eOl42lomxn2hbJDBzCROPQodSqcrhqQ//RZK9+3qokq3SivkqY0za/NLGO4oYAAQQfYgn
	 f1aplcNWYzmYrgNBL3tvhF3YeHriBjLm8MxKh4Ftj+EfpJcxCxPxvYj9iEX7C36Hqzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795306696;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n3n064Qsk3rdX1FqPH4kxS8Bgm27CPleORQhLo802h4=;
	b=YIsTChLj3L1yU8sH11ZgSUcqbLZAcNF43Cs8nJM7iPDDMfcAm+73ICbCxzED2mbwiLNz
	 z2tK3W1e1S6laY0ispRivUxVhW74CrqdnHvk84Ia06f2n48jw/cqLW+uMEjJTbxV1J3UV
	 vPCpzCgoJ0tYeoJTo2nDqjCjLs/LN07Ancp8YnzZYwRnXDKAJ50/YtJiZ+mZ/qCyQGS7u
	 +1EaBbT9sOZ6daEYLaAyX8870wYutXHEhzrG5m2im12Zjf5DOovSZAHCZbRPKsyKXmxbz
	 YXBEICcdzdZbasB9VKw7AII8rW1oPB9obQhP3zfwgLNHJOkMfAesLhs6D5TxE90p+VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eohuO05q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0AE606A336
	for <exfat@lists.linux.dev>; Sun, 22 Nov 2026 00:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eohuO05q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C34D1F000D4
	for <exfat@lists.linux.dev>; Sun, 22 Nov 2026 00:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795306696;
	bh=n3n064Qsk3rdX1FqPH4kxS8Bgm27CPleORQhLo802h4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eohuO05q1IHKD2z24EmnbHK6EZjlYRSfGlTuLjhQlM8YfpqjrSuilbC0yg15Rpg4r
	 +Ap5+FWwomY68WPOoCjXyNbnbL07D0Pr9Yic6d1uI2+SqGy+mfHn3z/FmOUmFO9vQU
	 dkd7Mla4Ccq1qd+e6EtyEUiyT0+HW08x+E2R4ALePJIN95H9EEdsALz5VmGJlgHxlu
	 FbB8M1EHHe5wU6ELCvxscDsFON8mOC26s5UxjpTxxfecI5KVI4VQb5KTP7Dvq3CVSN
	 zV+5NnK5eh1SyFMERHXAVu6VlAyV+Slfulp+K3X8dDa4T1DDrUD/+Phn8obyJmGJji
	 4ZVJHxyoOWriA==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so2740332a12.0
        for <exfat@lists.linux.dev>; Sat, 21 Nov 2026 16:18:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHyjpKmaujgeMumTCD4iV5fmGRYx5G7FLxaYZ4rUBEEZp/1ZbUwizB4tHW+aIZpVb5TAcQOOg==@lists.linux.dev
X-Gm-Message-State: APuU4Z98HeSplO/HjDvlX4c/ARFpDhITkL86hazSMunDlUNYSp3gf4Sn
	NPs8Dtr7nPPz248isSHcgSO/SZn6hN26APO7vyF0JLeIDWb12LY7F9GMIeF53XSu6GG20BY4tVP
	sXytYytwyJam8IwI02DhNg/fafL8XGDI=
X-Received: by 2002:a17:906:b2d0:b0:c4d:2f6b:435 with SMTP id
 a640c23a62f3a-c513a9ae264mr488487966b.18.1795306694724; Sat, 21 Nov 2026
 16:18:14 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261121174315.500249-1-shaopei_1012@163.com>
In-Reply-To: <20261121174315.500249-1-shaopei_1012@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 22 Nov 2026 09:18:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8uKrOU=tyJ1yqme=3HBwyLu4-Hg9cw03+VZ+P4k0-B9g@mail.gmail.com>
X-Gm-Features: Aa3M54ovn0x5mU7utYfTW_4kD8G5XRkVPTYp1VL9xIHSa_8ooIpRyn09CO-AvZ0
Message-ID: <CAKYAXd8uKrOU=tyJ1yqme=3HBwyLu4-Hg9cw03+VZ+P4k0-B9g@mail.gmail.com>
Subject: Re: [PATCH] exfat: add EXFAT_IOC_COMBINE to append a file's clusters
 to another
To: Shaopei Zhu <shaopei_1012@163.com>
Cc: sj1557.seo@samsung.com, yuezhang.mo@sony.com, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 2:43=E2=80=AFAM Shaopei Zhu <shaopei_1012@163.com> =
wrote:
>
> Cameras and dashcams recording to exFAT SD cards often write the video
> stream and auxiliary data (e.g. IMU samples) to separate files and merge
> them when recording stops.  Doing that with read()/write() or
> copy_file_range() rewrites the whole payload, which is slow on such
> media, wears the flash and needs free space for a second copy.
>
> Filesystems supporting reflink can already avoid the copy by cloning
> the source to the end of the destination with FICLONERANGE and then
> unlinking it.  exFAT cannot share clusters between files, so it needs
> an operation that moves them instead.  Its semantics follow from the
> exFAT on-disk format (cluster granularity, a single valid_size per
> file), so it is added as an exfat ioctl rather than a VFS interface;
> fallocate() does not fit either, as it only takes a single file.
>
> Add an ioctl that moves the cluster chain of a source file to the end
> of a destination file and then unlinks the source, so that only
> metadata changes: the FAT, the stream extension entry of the
> destination and the entry set of the source:
>
>         struct exfat_combine_args args =3D { .src_fd =3D src_fd };
>         ioctl(dst_fd, EXFAT_IOC_COMBINE, &args);
>
> The source is unlinked the way btrfs_ioctl_snap_destroy() removes a
> subvolume: start_removing_dentry() revalidates the dentry of the open
> file and locks its parent, may_delete_dentry() checks the permission as
> unlink(2) does, the entry set is deleted by the same code as
> exfat_unlink(), and d_delete_notify() updates the dcache and notifies
> watchers, without re-entering exfat through vfs_unlink().  Since the
> in-memory inode no longer owns the clusters, evicting it frees nothing.
> The permission is checked before anything is changed, and an already
> unlinked source is accepted.
>
> As with EXT4_IOC_MOVE_EXT and F2FS_IOC_MOVE_RANGE, the source must be
> open for reading and writing, the destination for writing, and both
> must be regular files on the same mount.
>
> exFAT has a single size and valid_size per file, so clusters can only
> be appended at a cluster boundary of a fully initialized file.  The
> destination is therefore first zero-filled up to the end of its last
> cluster with exfat_extend_valid_size(), leaving a zero-filled gap
> between the original and the appended data when its size is not
> cluster aligned.  This is documented in the uapi header, and keeps
> stale on-disk data out of the file.
>
> exFAT has no journal, so the data and the FAT, then the destination
> entry, then the deletion of the source entry set are written and
> flushed to the device in that order, as recommended by section 8.1 of
> the exFAT specification; the allocation bitmap is not touched.  A
> crash at any point leaves all data reachable from at least one entry.
> In the worst case both entries share the appended clusters; fsck.exfat
> keeps them in the file it checks first and truncates the other one, so
> either the combine has completed or the source still holds its data.
> If the call fails before the clusters are moved, the zero padding is
> removed again.  s_lock is only held while updating the FAT and the
> entries, not while waiting for the device, so that writers to other
> files on the volume are not stalled.
>
> No file data is copied, so the cost depends on the number of clusters
> (when a FAT chain has to be built for a contiguous file) rather than on
> the amount of data.
>
> The ioctl number is taken from the 'r' range next to the FAT ioctls.
> A user space tool for exfatprogs (exfatcombine) and a test for fstests
> (exfat/002) are posted separately.
>
> This patch was written with the help of an AI coding assistant
> (Claude Code, Opus 5.5); I have reviewed and tested the result.
>
> Signed-off-by: Shaopei Zhu <shaopei_1012@163.com>
First, Please check Sashiko's review comments.

https://sashiko.dev/#/patchset/20261121174315.500249-1-shaopei_1012%40163.c=
om

And please send exfatcombine's PR to exfatprogs.

Thanks.
