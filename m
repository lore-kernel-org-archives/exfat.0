Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125091;
	b=ZDPWGcRuKalP0VtMQSQn9CNZi4FRcVbzkPVyh5GdM1GuBs8Wl0S0dXw13lA0P8uwKg6P
	 6gF8aIpcdurajP9aOwEEEPVabSopcsPbDs7j6qgrCDdUxXHtlTAUOX9tqX1gIk58BCApH
	 ocniRUaPBYCGnV+tLeIIRxX9ZeifaCGkcBAfBUrUl6rfG/53snTRq628r7yUKdxHNTNFG
	 7WtV5PvMxqAi9VCz2ZC+aNRqGXNP7xjdZIK6YV56CxKwMwOXfMx5PWi+x6/HmBfG3DvTm
	 kxjD384vZZ5k+R4McnmAamtbIK48djDoREYPhaBY+DjEvxcXVoS3V3P+Ch8bZ4GUQgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=Ny3Sl9Bn6sHIvah8OWFokkLcjHbV6BwIAehQvpJWiOM=;
	b=lXVtUhetbimuxmBO1bpZD0RAUmVZjyQxyOhOcsI0Dt3GA2XpjhIeIi6SaASSh2aDGlJH
	 ZOzrtIUTg2772/Z6DCmDbhHjCzQ9u0n6FoOjnyWQpD18IHhpivqX3lENZ9+hZr7+30r/R
	 M7X+54mmwmhEsSPt+HdWC9pqLlJJrYyqrUlycETqHxEvZZoPLlpEHBT/ywBuMChYoKsiu
	 exExZF8bmgFlxsYL5OZ6x8RdmSRLKzmzGas+f6H/aZac6AzPBHvqyrueS+6wVI2nsRDVg
	 IiaR0R4xlfprmNoh8kJFtsyTOeKExg78fZnQdynGCRj7LEO8plMC+w+n0lowm5MrtGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKh8H0Rs;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F2B606A324
	for <exfat@lists.linux.dev>; Thu, 19 Nov 2026 21:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F2B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JKh8H0Rs
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so1605465e9.3
        for <exfat@lists.linux.dev>; Thu, 19 Nov 2026 13:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795125089; x=1795729889; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ny3Sl9Bn6sHIvah8OWFokkLcjHbV6BwIAehQvpJWiOM=;
        b=JKh8H0RsZIu297rExACVnaZ3tTgcOS7bhTnYCKZIg5/givMNsianqfDT9M9PyZLPvM
         FJn/8tdFd4AxJCKQ/dTuRy9xfeeY4LdR3EUfM8aPxU3fPKN/GbLhX/n7l3KiZeFPUK54
         ehAAocJsCOzkQ9AvbvZ7+mD6tWgdKRlx1V5eClaxZfhBqXtB8kGlfixLNRX/eDU8+MAK
         6xZOmlSJqszQ7kbKPIWAfb9RWvGHPc/Hv4VKarztKOVNJcCxXTA15GRG9oPKwSQlZ0O6
         5qHrnfMuHaivkiGi7rt7sKS+3OwbKaINb7xjwTv73eNlF4q5qcP3H8srY7Fy6Z0TdZHz
         GhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795125089; x=1795729889;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ny3Sl9Bn6sHIvah8OWFokkLcjHbV6BwIAehQvpJWiOM=;
        b=JbdSz0NJFxU+lSqwL0s99huu74jts5QhiuGovYWinDK1reNRNqF9inMSgHx0SLxAjl
         3SCkSfpL1k9jqNw2cQiKCA1mFstaJJYg/se5NY7XOv3xOeUXAxsvpAt/eraoCkjCygu4
         sf27m8DuknH7WXjWOlU2K+JV6iFS+cTz10JZfZlSB1TeS3BlNyqNXIlYtNnJztv5snvv
         fXkuA1KybxlyiaruV6K6iXJoLim3JL3Rlm48Zuzf4hUgdKrQKUcgtmPphgKIc4Mh+1rE
         4gPWzyYouxrErMqg95lvRoiu+bQRuy3yLxeOHfKLq+67IPhxhiX8zNUOdtusj46+a4nJ
         kw9g==
X-Forwarded-Encrypted: i=1; AL+hErF+S6Synfj1e3Nton/ppRkh+ElIubLgQ7/DNJz95EMjLXJxQVWW2MiMc0p4EYAAY+7D0pu1MQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/vD9sxAsn5gih9tuZK5AOuXSNrP10msh6BowLarR8rAoRR2inF
	qUB4aqRc8jRRlWPeqKumKmXO02DYR8SnVc9kYv2cNIGj7t2sUnTHcAoz
X-Gm-Gg: AYBFou22rmt69GeHdFEAQy8SvTN3qpRnq0ELNI8WkVR4Hv158vjfh35t0qQ2wAqFxiA
	7SXbJrjHfrI2rxl43wBjLWeX8eaU9tfErzZOjqLRJvXJFx3SItisa1JkpeYgmZFkmyvUadLfHGj
	g1qsPjJLom28SWDougnLf3AnwDq7oA6vMF9kKplRnyqTYY9caBIT3RtboPAkIeNw5nvVP8f6Rre
	6Gk7pKp35UhRSleYf/nouX2l0QICt8KH6C0t+ScDwYgF4hPGehr4CYLUyIoyY466RGGbbcgPFMN
	bO9u4zHyn4hQGStU06j+uxSiOyAxP6ALHqPKs/RqdYXa6cjhqSXvxqPKlk5G3tDaKTmik8fzA7+
	PuMkMRw6o3qQX9KymO4sjAuYmD91Kw+c/Asp7PyUwRKnAbVlPKoL6myi4winVjhGyZFXSFE53dU
	Gc9+fvhpfaj3aMT9Mhfgb+cblv0Cb5UtwYENlerjq0sqG5pUcZFKHczt9MMC7rieBrqWv9wV3Td
	XuzfckCWzeXIc9e52lXvJ+GF1hEklt3QbLVITHxWIVle30w8B320PM3B/WvK3B2jxyUtp5DJp8Q
	+wF1ovt5A2PPrLeMqEOBKXsT8XG4Vvy54fzW9LqJoO5lp7o=
X-Received: by 2002:a05:600c:4f48:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4bb8893ab9cmr20069015e9.29.1795125089289;
        Thu, 19 Nov 2026 13:51:29 -0800 (PST)
Received: from localhost ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm24821245e9.10.2026.11.19.13.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:51:28 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=305c4db69b4b7682b4927e5c7245ccd497c3eba9918a22ec95937c8c862e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 19 Nov 2026 22:51:26 +0100
Message-Id: <DMZIQG4U1NTH.2IN0S2YIWEYTG@gmail.com>
Cc: "David Sterba" <dsterba@suse.com>, "Namjae Jeon"
 <linkinjeon@kernel.org>, "Sungjong Seo" <sj1557.seo@samsung.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian Brauner"
 <brauner@kernel.org>, "Trond Myklebust" <trondmy@kernel.org>, "Anna
 Schumaker" <anna@kernel.org>, "Chuck Lever" <cel@kernel.org>, "Jeff Layton"
 <jlayton@kernel.org>, "Konstantin Komarov"
 <almaz.alexandrovich@paragon-software.com>, "Paulo Alcantara"
 <pc@manguebit.org>, "Chris Mason" <mason@kernel.org>, "Yuezhang Mo"
 <yuezhang.mo@sony.com>, "Jan Kara" <jack@suse.cz>, "NeilBrown"
 <neil@brown.name>, "Olga Kornievskaia" <okorniev@redhat.com>, "Dai Ngo"
 <Dai.Ngo@oracle.com>, "Tom Talpey" <tom@talpey.com>, "Ronnie Sahlberg"
 <ronniesahlberg@gmail.com>, "Shyam Prasad N" <sprasad@microsoft.com>,
 "Bharath SM" <bharathsm@microsoft.com>, "Sergey Senozhatsky"
 <senozhatsky@chromium.org>, "ChenXiaoSong" <chenxiaosong@chenxiaosong.com>,
 "Darrick J . Wong" <djwong@kernel.org>, "Sean Smith"
 <defendthedisabled@gmail.com>, "Andrey Albershteyn" <aalbersh@kernel.org>,
 "Pedro Falcato" <pfalcato@suse.de>, =?utf-8?q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, <linux-btrfs@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <exfat@lists.linux.dev>, <ntfs3@lists.linux.dev>,
 <linux-cifs@vger.kernel.org>, <linux-nfs@vger.kernel.org>,
 <linux-api@vger.kernel.org>
Subject: Re: [RFC PATCH v4 09/10] ksmbd: add provenance time (ptime) and map
 it to CreationTime
From: "koraynilay" <koray.fra@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "koraynilay"
 <koray.fra@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261115180343.576773-1-koray.fra@gmail.com>
 <20261115180343.576773-10-koray.fra@gmail.com>
 <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>
In-Reply-To: <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>

--305c4db69b4b7682b4927e5c7245ccd497c3eba9918a22ec95937c8c862e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 19, 2026 at 6:34 PM CET, Amir Goldstein wrote:
> On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> =
wrote:
>>
>> Implement provenance time (ptime) in ksmbd, as introduced in a
>> previous commit ("vfs: add provenance time (ptime)").
>>
>> Map it to SMB's CreationTime, making it settable by SMB clients. When
>> reporting CreationTime to clients, prioritize ptime over da.create_time
>> memorized in the user.DOSATTRIB xattr.
>
> That doesn't sound like the right thing to do.
>
> If the server stored a CreationTime that client had set, you cannot
> override this.

Ah, yes, but how would we handle older files which get a custom
CreationTime both before (in the xattr) and after (in ptime) a kernel
upgrade?

> When the client sets CreationTime, the server can decide if it can and wa=
nts
> (may be a policy decision) to store CreationTime in PTIME and not store
> it in user.DOSATTRIB.

To fix the above problem we should probably keep storing it in both
ptime and the xattr though.

> Fun fact: the user.DOSATTRIB format also has a mask so storing the
> creation time inside it is also optional.

With my current patch series applied, when CreationTime gets set by a
client, ksmbd writes it to ptime and fixes/heals the xattr (=3D removing
the CREATE_TIME flag created by older kernels, see the other fun fact
below).

And another fun fact: until [1] ksmbd ignored the flags and just
read/wrote the attribs every time :) so that can only be honored for
files that have been written to/updated with newer kernels.
(That's why there is the ((flags & CREATE_TIME) || da.create_time > 0)
in my patch, and not just the flag check)

Thanks,
koraynilay

[1]: https://lore.kernel.org/linux-cifs/20261115155308.415734-1-koray.fra@g=
mail.com/

> Thanks,
> Amir.



--305c4db69b4b7682b4927e5c7245ccd497c3eba9918a22ec95937c8c862e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSgVimKafU5DQMcjcDmj22qf5IGXAUCav9vXgAKCRDmj22qf5IG
XM7AAPsG6qghsrCfCEnMzpWg6QyG3mDtqVzO2LuI2Jbx+5MdmwEAqDTU6SUvXvP1
4H1OcrcMro3Ek7i+OVcH9ZQ2xF4lngw=
=LZNw
-----END PGP SIGNATURE-----

--305c4db69b4b7682b4927e5c7245ccd497c3eba9918a22ec95937c8c862e--
