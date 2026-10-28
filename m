Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225387;
	b=uXFdtBVUxV6LhbHyRLnd8sTcqoUXUbrtzZ6QF8DUOOfFGWnBzpmsBoXMu3ifvm+TbQEj
	 y0EaB4utDIkeHsGTs5tguiMCdJLmRfMfng0hS7ZeUo/m2MaNOdbu4iSEj+hN7wb1OWP4B
	 WdH0dfIIlcm0j53QRWJgj1tTUfzBcArCHUW3Z7TdF8Mbq7rsBreLXBHo552NgGm9ztPrE
	 RJEqi8wgrXRAPYtDeevw6DnFmSDiufr0aSBFo3DSDsex5eBy2fvYVOkoqAQUwwRYYhw9u
	 XC/DvPBuV6W8I0BwrhxonGqqcQViO6+0CW9VmSUOxLTK5fgA088rTTuJKwUV+JadHIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225387;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=j5xHrk121VJ6jsiOiBImMpaem11Ex15L22vqkzMRx+Y=;
	b=Xsw6nSPEp1WyG3YqqbESoFmUmVN2XTH2y+8Z2NnTg5ZG8RYlITv9PAJ2v5u8uwi9Kt3H
	 RTuUJkIFKsyPExkp2cJmi1/Eyx7xQE+WImGzRlrhttJ7R5881f8nxGOFc7yCbb4gNtiaK
	 kxqyrAIa7YbTbqjpH7GOXKGOBDEaEriYz1Ovd6pxU2tc4sIMsZ3YxguxuG27oM99dPvoY
	 vMbXZoEDqubYDdT3yMAbX1Do5DGs6FDM0mELzKQNt7t7iey5h6bWCa5At9ffUFZSD3RK+
	 Yo6o7uqtqMYtojLqYcUHlcg9/C9SJ9BWqG7vhb2aEBn+ZBd7jqy4o7KolUNEPbjS6yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZPz9gBSh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CAF606A323
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 22:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17CAF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZPz9gBSh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793225386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j5xHrk121VJ6jsiOiBImMpaem11Ex15L22vqkzMRx+Y=;
	b=ZPz9gBSh/yBDILl4Wre1GwBJEJXRNCKDy8H1++h5ea/mHhewpVcmtz4SCdXdBmonsKpZe1
	QK1fPZIYqd8QAOBgp8EV/s4fRwGOPz1p9Kchisl5RmbGzn4ytpw5/9xqYRXzNr/WdCGxH6
	pq4S89wJjHyakIP5ukEWtbeAwDoljB0=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45--p-cfO0wMmunFxIhsFQQYg-1; Wed, 28 Oct 2026 18:09:44 -0400
X-MC-Unique: -p-cfO0wMmunFxIhsFQQYg-1
X-Mimecast-MFC-AGG-ID: -p-cfO0wMmunFxIhsFQQYg_1793225384
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6768601940bso263068d50.1
        for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 15:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225384; x=1793830184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5xHrk121VJ6jsiOiBImMpaem11Ex15L22vqkzMRx+Y=;
        b=bwk68Tu1WY/1fl+V/L1PgPvUk91ZCb9WvtD6weAFukNjYaNFIOWFDB0xvXtLtspAUH
         k+31aILOv+twHkk5F/Qt1pRs9zvjcLDOaX2Q5v1LgXM3ZjPzgcEmiASncb9bCP7Aximk
         qmmR5JhKBYAF8rh3+XB5bELaN5YpK/lfo2v1oL+MM1Q3WKEfgb8Uu2P8Xjm6sBMMCSYI
         1tdlE8mRKAyfp2F2CD0bFCVBtA/8Qnx5GKAATZN4E4GyXwRXbzwN1cBTKg7/cIqUqz+F
         /eZlQccotJ0Hg6y7LoYNPT1zrGk7JJMyQUQ7InpSrCTP9pvkF30ZTpH4eb5+lFFen7Ez
         gk0g==
X-Forwarded-Encrypted: i=1; AKwUvBzm2ZmKeU7GxLIJtjkdzFqoCWAVdqakhz1p3lxjF9gqWYmJzMDdlSZbE+bEATddOY7T3Ffntg==@lists.linux.dev
X-Gm-Message-State: AFq9FYI7s4PXNvUAHuuTdoRItJL+6+n4K0BOJhEayIqZFRHepnuC1eRw
	YjQ+LKOFmjl0QNJttMwcxP3004ppRvFXGithMh2v6OHTUSodgkEkYV5sKKk/v28G/7wmG57j3sA
	Z/tROCR/LhWlkWYK8Wv3rSdoO4TMp/0GNTmH4ti22788Kq4n4T27cC2rhvtoescMqu7Lg8hOfgn
	cmml7mgf+xpD+j/GzwB0DJbCD0lmXPgd8=
X-Gm-Gg: AYBFou0KWBmRO1LO92RVACwBfN+OJ0HJ23Y06ivvWcBW6Y6xiLUm30CGM6zIqAjp8d0
	XPKFVdDWqAjly13TSKQh2zOIpg4PDEIRx4IEEj0v5igPTxgG1tFGeTvx4d+rH9tZpT44bBV8hX7
	bjMH9ROxsuUHXT5M0bARWOBDCM/Qzvul5O9XU+FEu8bI5wPig8vXj+an07PaSqiF16xDxp+pcXa
	U/JJibZsOzUCU4txxf4xlmC9peMVvQ9KXpfbeW19a3zqg==
X-Received: by 2002:a05:690e:1918:b0:679:ad2f:3fbf with SMTP id 956f58d0204a3-67a8d0047a5mr704921d50.8.1793225384302;
        Wed, 28 Oct 2026 15:09:44 -0700 (PDT)
X-Received: by 2002:a05:690e:1918:b0:679:ad2f:3fbf with SMTP id
 956f58d0204a3-67a8d0047a5mr704846d50.8.1793225382297; Wed, 28 Oct 2026
 15:09:42 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
 <20261012-work-fs-sb_rdonly-v1-21-60743a3dc326@kernel.org>
 <CAHc6FU6z4kX5R3Og8m0dYOHsjFcw+4Btvfe87AGPxy_EWs0E7A@mail.gmail.com> <20261028-zurschaustellen-okkupieren-inkompatibel-d11525ce88b8@brauner>
In-Reply-To: <20261028-zurschaustellen-okkupieren-inkompatibel-d11525ce88b8@brauner>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 28 Oct 2026 23:09:31 +0100
X-Gm-Features: AclHuK9MzobLdiG2EG9M5KT_ibZzYxdrTghiXff6ZlesOE7YSK8Ag_RtXekxyZI
Message-ID: <CAHc6FU6VSAWQ4RJTO_eLnpqN5qvrShbJeT+ADwiA6ohpq8dO4Q@mail.gmail.com>
Subject: Re: [PATCH RFC 21/28] gfs2: don't set SB_RDONLY on withdraw
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, ntfs@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org, 
	stable@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B03ZeyUHUnsZdFGP87li8H_dAgtPMiQVN_9ifa9p5ns_1793225384
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 5:02=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> On Fri, Oct 16, 2026 at 02:01:00AM +0200, Andreas Gruenbacher wrote:
> > According to commit d564053f0746 ("GFS2: Clean up freeze code"), the
> > idea of the freeze sysfs file was to make it behave like the FIFREEZE
> > / FITHAW ioctls. This isn't what the code is doing at all.
>
> That's a pre-existing and separate from this series. freeze_store() calls
> freeze_super() and thaw_super() directly with FREEZE_HOLDER_USERSPACE and=
 never
> goes through gfs2_freeze_super() and gfs2_thaw_super(). So it never takes=
 the
> freeze glock. I don't think that's for this series to fix.

I mainly wanted to point out that this behavior isn't intentional.

Thanks,
Andreas

