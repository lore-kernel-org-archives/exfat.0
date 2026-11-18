Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795023477;
	b=HKTII8GoOjYSxTvUDstF1zbYDPQZbuY8o9XFovA5/O0yoyl+CaneEVE0QYjZDkey/1Jg
	 qiG6Hus5i494Fg5dcpGV018YN7oU+0TnoJczNZ1j59XdKMkO+62bcqXxFxnyGAnPqmcSz
	 fUUg1Qp2tiTKkVqNqsk/HakvWfylNCkdTthM5lsMB7dgVbkgwRUcFB3Vlww9jjLVH2KUy
	 A4wamy27dbfGAxkWSPTiMZEvbIxM6UAM1IyaIM0m5tBrp528cj3W2tNNMqG/AP0A2aVkg
	 GsfCw/75iiYPthwR5BtKq9tUcurS8O0p9ny29ykaaHPek4Z8daYhw7Tf6TYwiFtlVHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R67yuyz8qBaN7OEJjW4cC9fhK33d87+KjfsWBVWkcBA=;
	b=JyHcO8DkY3YdUBnXUoEd55fO2AeXsT2twn1PcEwFTYOEOqIu3VV9RIsvRZTIVBCAMQri
	 HN+Md2XjB6PHNWKG0psklNury77V78RpgzEh/h9o2tTdFz1QVKJkmZmNPRSicfA8oZebq
	 mmFFRXuOWJnWl6EI5Y0rzaqs3POahte4BMub66bmUIxB1UqxbQt6OsXAU3owZzUKd2xuP
	 xPYaAJCyeLW4ODwQGevEH4Bdk3w2KVnFGWbjj5NTKu2VjHMSCRNsgxXP5nflkDXZMyP3l
	 znwHM4tZNw6ejY+Wjh5z8iqyLTn4e8dmE9Wq3FIBMYuhLZvNx/U0W4ebwz9zpVpM5mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IeiD46f/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF713606A32F
	for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 17:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF713606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IeiD46f/
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso17197266b.0
        for <exfat@lists.linux.dev>; Wed, 18 Nov 2026 09:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795023475; cv=none;
        d=google.com; s=arc-20260327;
        b=GvaxDSn3DZDvS13CzuzJrwpi1weZtg2n1nchwBljKadGL2j8kJX/INVSzFkW4g/M5V
         5lF5ztTTj0WR/Mm0fZj4lcF1JWaIzfFf6n4Z931WwWOmf4eYe2+TBvDM/4oGaT21dDEI
         inr4p/qL/A9V3cxUgdBRPJvqdx3sBa461Yh8SCyF/DJodONzICzKVPAV1fXvRbY3Uk4J
         /l1ZtDKxMZ6mcFcOH3Kv0nlSU3Syi9i7TWiIhWmdLsIaQaq1iyxWS2AMzPTVaR1GbnrV
         Qdg4G+IvoYFwGxqkm5cMZUsD3BMX6Vzh2WawLbM/Etkn+x1U0crxcZLWMlYJ7k8JiJxW
         bGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R67yuyz8qBaN7OEJjW4cC9fhK33d87+KjfsWBVWkcBA=;
        fh=/zZqSG+XLkdT/SjoD3D4QRc/n2R10uPYW4SVUiQKNF4=;
        b=lZChRdsaYiGGlJk8go5q4fKMOZ8Laj+yMHzi0JcKQqHn9BbdrjS7eW0XNomzQ8plCB
         4UOJwPt5a+UVigdT9108i22DmXVTe2AlX0MlOMFf/sxYzsXd/SjlTpzEP+JuixSmH/R2
         Eq3FRdA/SxQKqqFSqd3T6Vmb3KdxTSYk4IwuBp9REWTbI+nMwc4ReX1nktPIYk5vLZKt
         hvh/Pg4r646RS/UBpPe7baOS5jAdSzmJJk+CazfqwFFDms74kRLQgLj0cqMp2d6RnrPK
         d4HeIqx2yLsdhVyv6Gnp4YbOlFz8ZScwv2qRR4k1l2B8PzEG1XN1sFVVJlNPIPVX9oAs
         gZGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795023475; x=1795628275; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R67yuyz8qBaN7OEJjW4cC9fhK33d87+KjfsWBVWkcBA=;
        b=IeiD46f/ZOCzpenVG13OU+DVKBP4yR5hi9X6nHp8VH0lhDE97LpihaRufh8JcJbapA
         8kyliTGIg4+7ANxQlCqgUmWxh0ovV8uT5DPVjEIF0VCuCXYP5vGOiDaWO33/xrFdmrG0
         qdGW5kWBWFBDlI6JfX2tBdcnFfvRiTexV+i85A4GX6I9zWwqg8eHlB+kIM9HVKS7FnK8
         k6RwMIjpLdYKFrkRdTAzj6VH+ZMDZUGmdzOzoQylz/3c4xb+l9obH8OCEx9A9L6hW/eb
         sJKO1/ZFQIIkdotbpCAtbosCz/6sCleJGaOLdc7ie4vUkY2zW8hhq+91GZJZXgSYptM9
         ESXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023475; x=1795628275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R67yuyz8qBaN7OEJjW4cC9fhK33d87+KjfsWBVWkcBA=;
        b=EyAgHT3GD+L8ZMvuPEZ9aiViwiQdb7SP6IUZNGPOidJFRhxtfVN8SxcgHm+vv5DcA4
         0F6tHDcDWe/DiXKJtwJMFurdAR723wwHwrfWvj0Jq/uHDG7GAdUaM4RtNMsKDha7/tQ2
         CiIIPo7rAq5i+RbT2kAp7QXH9bab0tJrO0rmaENTpjGbI0mH7xtS92HGwxqafH4dSZN6
         VknYgcjT4Dqifj9p1ceMsIsE6rFW7LTPB3mQV4C/yt1xuOqRtPdTZl58+PT0zoVYLnxQ
         jRtRGwKZQXDfP5PBENCWEAxu+VHpY5Y/YXFe63/N20Eou15WJk7zRx1K/nFiWUZCI64w
         9jXA==
X-Forwarded-Encrypted: i=1; AL+hErF0VQdfYk2y0jLRFCLVnFhoQNF8AOx1ar8dYWy9jVJsR3DR6UN49NCZvKYswFuMRnmuZgpsTg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/ocBXhk6Eb9khLVUGtQIKPUlQNwQTfLH756TciUTDPnjFGx7Gd
	uPVqzoiKWri+2Oesg+bh/wACNgrOHgCSsu8Dr1Jy/H4y1yawFjqxAHBThXMhLrYXLmqI05Kmy6y
	RuB2zGBGekqERQ0KqcrhEK3Pb1Q5gqDU=
X-Gm-Gg: AYBFou0e6kf3rTI57Ks0j+5C8mu46ylMF05dEzyVLiWxFVF/gC71NdsYg+cVb089QlX
	oeASSnbUZ2oGm1UwmanNnqODDgLmY0Ufu4QCHCPPqDQMCm6Va7IupLMiSCYXAC+MhEYtTyvJwWM
	Fm4fvq1AtCj8iTelaR3WnPDp0csjM+gwnFaUHgjtX015ky/zEKfOXD6yoT2w4uLHKWwySpQ2ZZd
	LxXpnHc7pbcWplS/IXWr6ii2qcLMFAHbHxwvgtDOlkYL7+cAAR1UWYCWXT7+926RRLaGxExBeF6
	A4T1jo7wbeKKPasNCNDGj6VqMSMCvIcGibdvwd1GF98g15TTCux7TlHXS/7FhQdd9o0c4t9vJQs
	tk+yEsKyQM23f1uHye2gbYfQKubAUA+iNiL26Dnvad6csEap1Y5Os5a3nnM3Fe4U2XShotA==
X-Received: by 2002:a17:907:da1:b0:c49:b6db:1 with SMTP id a640c23a62f3a-c5126364307mr15604866b.12.1795023474965;
 Wed, 18 Nov 2026 09:37:54 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-8-koray.fra@gmail.com>
 <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com> <CAOQ4uxhpMARO_ZMJDeoa044BwufLVnS0o4Fv0abBF=tjaZmtWQ@mail.gmail.com>
 <cd49ce48-58d7-4341-b4fc-34e63daf3c52@app.fastmail.com> <CAOQ4uxjme9sJ5LGNDnP6rEKZLTJzX_ZdcMohgu2iLULK96GPOA@mail.gmail.com>
 <9c4a509c-b6af-4da1-8a64-9d5c26c74bff@app.fastmail.com>
In-Reply-To: <9c4a509c-b6af-4da1-8a64-9d5c26c74bff@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 18:37:42 +0100
X-Gm-Features: AclHuK9j8na9qQXXbOgij3n-j2Bo4JySgielhO0fgIJ-weX9anWXgtr5UxF7Q-Y
Message-ID: <CAOQ4uxguPD+PWEUZtAzSdA-15d_C5cn=34ZmCm0v_b0MWK_sfw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 07/10] nfsd: add provenance time (ptime) via FATTR4_TIME_CREATE
To: Chuck Lever <cel@kernel.org>
Cc: koraynilay <koray.fra@gmail.com>, David Sterba <dsterba@suse.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:14=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
>
>
> On Wed, Nov 18, 2026, at 11:36 AM, Amir Goldstein wrote:
> > Can't an NFS client be connected to another NFS server
> > implementation which does allow this?
> >
> > I can't wrap my head around the problem.
>
> You already named the problem in a previous email: What happens
> when the NFS server's kernel is upgraded from an NFSD that exposes
> only btime to one that picks either ptime or btime?
>
> Clients will see a file's btime before the server restart, and
> afterwards, they will see a changed TIME_CREATE but the file's
> NFSv4 change attribute will be unchanged.
>
>

Indeed I have.

My newish proposal (on cover letter thread) is that we
abolish the ptime/btime duality and make mutability of btime
a pre-fs decision which is advertised via the get_fileattr() API.
So from the user POV or nfsd POV the values will never diverge.

Thanks,
Amir.
