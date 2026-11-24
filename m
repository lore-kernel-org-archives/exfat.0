Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544423;
	b=4kdt3zh0iHfltCX2dK8crvWr7WQqyplxG2WaQa3zoG7JvsPz7F7RPmwF03xIUURHhcvV
	 lXCa50t5LbphsUZjoefxcl0iYBcG0HKlWcrNb5blBNC/uibETJku7ZrXxLQzJXfN4uua9
	 UNFR3TcBoOSszPxQoHUW66fd0Tu9rzm5x/H9aCyRd5gvHRBy183y73IJtr6s+RjdLrStL
	 sCuoTBSsoevFZ6tmBWTAbuX/VblHAfqJITiamh6wv08ha36rQ8hbt7Ar/cyBX2ZaOJsax
	 yo3LS0T5dFeWmsRXLox3yx3SCSyGAXQjEz+awqnpA56VuP3BLGjwPO/761MXywI3rxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544423;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=rn2JMXIObYI9wUt1ea1lSjudrwErALnnzN0nbwRNkfY=;
	b=plHJTlBIXlZKCI2qACjmbdqzXYqEsBo5Jv1HcVH5A6y+2KPYI7T+GSb0F6s1/hlPUSQr
	 DoVhO5yy7+PjVBIOr3WUhm5n1L9kNKEj2TQa+95qcn+1Pq7LaTV+Yq9MnZFljTBvlXhgj
	 qUz7N47Wdc8eAzQAXOy2Y88FVxTc9wP09a7xj74cKlgAh9bdl02jjo6ozJ1bDkAWs8PAp
	 LkXqKa8t4UXTG/C0E3sFxhutnWF0v9sNvVofeUCMjthuIMZARWi1UPxmHxE6RYFIGPxnM
	 NaT9WgLpJdiH5n3ughDOCF5LgbO0Z3pjTJ9pzp2AnBZw2IcCnSIz1j01fR3dRtaxH5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=A349BdiF;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F87606A6A8
	for <exfat@lists.linux.dev>; Tue, 24 Nov 2026 18:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F87606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=A349BdiF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=rn
	2JMXIObYI9wUt1ea1lSjudrwErALnnzN0nbwRNkfY=; b=A349BdiFhOFLw5eB4o
	2gs6Xa+Z4epe2azGQRjXucIG6mi0DH9tr1ZwgnqIsQ1nlUDvaYtv1J4vCZCshXSS
	HHzNZn8d8anK6dTGhqBjGdcLWSuKKdDFWp6It2/jnNJTPQyKJT0N4ccY25ZkbmOb
	0Orcs6kAvM3MLC7DG+OtseQ1U=
Received: from ubuntu (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAH7o8k1QVrJbHLHw--.27478S2;
	Wed, 25 Nov 2026 02:19:29 +0800 (CST)
From: Shaopei Zhu <shaopei_1012@163.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	exfat@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] exfat: add EXFAT_IOC_COMBINE to append a file's clusters to another
Date: Wed, 25 Nov 2026 02:19:11 +0800
Message-ID: <20261124181911.773506-1-shaopei_1012@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <awXMJaZ58iS3K2N0@casper.infradead.org>
References: <20261124142807.773299-1-shaopei_1012@163.com> <awXMJaZ58iS3K2N0@casper.infradead.org>
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAH7o8k1QVrJbHLHw--.27478S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4UAFyftF15Ww18tr48Xrb_yoW8XF17pa
	y3twsrta1DJw13GFn3Cw4xt3yru3WxKw4fJas8tw1UZrs8XF129r9xtFW2ka48G39Fqwn0
	qF4Yvas8C398uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UqeHgUUUUU=
X-CM-SenderInfo: pvkd01phlbiiirs6il2tof0z/xtbC6hGdLGsF1TGqyAAA3i

On Tue, Nov 24, 2026 at 05:40:53PM +0000, Matthew Wilcox wrote:
> On Tue, Nov 24, 2026 at 10:28:07PM +0800, Shaopei Zhu wrote:
> > As with EXT4_IOC_MOVE_EXT and F2FS_IOC_MOVE_RANGE, the source must be
> > open for reading and writing, the destination for writing, and both must
> > be regular files on the same mount.  Files whose allocation, chain
> > layout or valid_size are inconsistent, as after a failed truncate or on
> > a corrupt volume, are refused with -EIO before anything is changed.
>
> Why are you designing your own ioctl instead of implementing
> EXT4_IOC_MOVE_EXT in exfat?  That's the normal way of doing things as
> it lets us later hoist the ioctl from all the filesystems implementing
> it to the VFS.

Hi Matthew,

Thanks for looking at this.  That paragraph was badly worded: I only
meant that the permission rules are the same as for those ioctls, not
that the operation is similar.

EXT4_IOC_MOVE_EXT is a defragmentation primitive: it copies the data of
the original file into the donor's blocks and exchanges the block
mappings, so the contents and sizes of both files stay the same, and
the range has to lie within both files.  It cannot append one file to
another, which is what is needed here: the clusters of the source are
linked onto the end of the destination, the destination grows and the
source is unlinked, without copying any data.

I will reword that paragraph in the next version so that it states the
rules without suggesting that the operations are related.

Thanks,
Shaopei

