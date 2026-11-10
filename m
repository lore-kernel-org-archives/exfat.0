Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351303;
	b=d5L/i6Q33CxsxOQJe2XuLEsCkRD9cgeF9Kj+6/dguSmdq+4rLUz3Y1ZWwVdTAH58HpOR
	 +f0SUXufYTOUM3BS+iMZLdHI0lj909n9rrkqEj+SnzqB1mAPvt/MYDKkOYo9umidgatD7
	 oYd23fA5vqmxITZKz52sIate4L/LLN6dChtGq+E/mGLwrh3ze2HQ5HVJBXzvq1Camp2xP
	 fhRGx3+1+I1oodTCimP8ERyS8I9XFNTMNIG4tIvFLgABMQ1W7tSR1GMmWu1UUpWH3DE1J
	 hXVfFkT681GCxd+Tre81X0VQnOlqklrlhIxd7VOSnk8NtTY1i2UaVxYiez90k43bP7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NLay0fAaS8K8zpYlT5J4F/CgngIHcMA7Bk+zXI74j1E=;
	b=c8e/ludTNpTTVqDBVIi/Bc7SVY5qAjqC4e0HORsPtXeUHiDpzl/WSVRswG6dSf0m2eGv
	 Yd7B1afHNbciJ0LFz7SZ1RCBFNo9wtAVVJJOvuJ63RFVzBq3NSXLvr9Cu9ong+wTPxpUv
	 Rsqa9uvDPAu7vkxj1JNjjejYmFzELRkZIBusxlb5BroNa2LbjXV0nMqussgQQRRwLQcS0
	 kmPyhKCgpE/M1iFzmm9yQEPy84gCwmsX6iwffNk1FBFkYTzQbkWjHCnblEldDypIbkZMY
	 T2XpqV6xqiZV0TkrlRDyDnKnGo9c/Yj3qlXWJLdAh1LnCKZv5+HzS7BDo6yGJfyzPsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g7R74Cgc;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C7606A331
	for <exfat@lists.linux.dev>; Tue, 10 Nov 2026 22:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B29C7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g7R74Cgc
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so24257095e9.0
        for <exfat@lists.linux.dev>; Tue, 10 Nov 2026 14:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794351301; x=1794956101; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLay0fAaS8K8zpYlT5J4F/CgngIHcMA7Bk+zXI74j1E=;
        b=g7R74Cgcy6bpixSjialMQ/ODzALkTnFX3HTckC485DBLzT7tWxoJ6D/uYSsqikm79Y
         ac+JGj65Y73KsK6RFN/Yip8j3pyXlwJ4/4lWNQoP+FMaecS2NC6O3rYSvC4fccqmWwof
         3/OXAWiAHXY1GinmtIILuecFUY94JU392WX5Hz5cbfEU1QOCCjM8AZ4msfMYJ7TL4BoR
         hcsU6jvNdxBVO6O24mIS8Is/0peMBBju8zC47y2NQLnn6bZuiMc6yGndfrkNAPWcuH4o
         65IKveqOVPXJ+Fq45uJrrCHg32CYyVjaI67P3BTD0UcgsHyiS7trr3JprpaH5oYXcakr
         640g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351301; x=1794956101;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLay0fAaS8K8zpYlT5J4F/CgngIHcMA7Bk+zXI74j1E=;
        b=CjsoWl8Oj7aHVr9ba6UXskr9/7WeVL/mOt3Kz0jgBqTG3ULz0qy5IWuv7xWKsJ4GAK
         zM3tDvGhO4zr5xMX6FLO5E/zIGDAJGjIFz2q9343e/v6iwGHVoPClpRSb3bHDpzV0MoI
         uilynrshLvjpkt6X88QnSEEK/66VnOVqhgNwGT8rcHv/MsAgpSiHjucQ0fKqLCHMt/cP
         f5aHPPBakHxs9KoxsJQ5XXl2JIOiHcxn0GvGZBoAHrBcC2lyOhe2FZSaeJE0BLPqdv8I
         XSsmW3pgyeLSisID2UsF1qQ25fplFcylkhP36MZL6ke5EetEKOZNJEAfSkNCO5CxzFUC
         ERIA==
X-Forwarded-Encrypted: i=1; AL+hErEwY/jM8ChPjF/Pv4viD3kkfOmkwLAI45UtnxAtprlgf5XCBSlsidpdNvQfRGqj5vEI9/miCg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9bhLo1FjMyd5lJpebS+6hHHuuHqqNz8LULTxitmZ8Fj2ngHP2E
	0TBz58jU8XTwVJEZAL6XEYSHzhQhRJiSKVAJadIiQhvcfTrjlDzSZQQcz5xxHfKawAw=
X-Gm-Gg: AYBFou35NyXqQogU7rNLJQxqCDoxQrEj8TsPhLf398vfH2mElNpFM3D+lASHH8PVf0u
	hRCe+Ja/zJw6xezo7MX/nKspI2GI8DfFSik5qCY0AvfdvrEcsOE/WUR/3v/V60NXSql+4TSs8ZO
	GXRb3fqWZWFo6uuzkFl16BYwOPYpW6+nsXihwgrHipnG+z1zSQPmp0VhTMlW2ds6KQXwGyHagra
	t6LjB5lCXUxutyYQ1YwVlDZIjaB9NweCTpNslFTrPq5Lijxj9wTM4dGYzzYhysQCZPhzMW82p/f
	meg/94N/vCvMVuKrp6tpW7D6aIF65ZMrKNlz78FZIA4Ek88cd9tV2zZkMCqWCKVTEPDFqZ/aix4
	0njj3ugHdUJOszRYpq0E9Y2vB1yf/QOVV58TdgLSmN+C1gIcFzIPeRxnUL95anw2xUGV40K/7rg
	FaRT2yRDcfvdj/3bOMp9VgFY0IDDiuadCbv7Ps2Ae9AG6VngugT/CwqE5mO5Sn/aBeXiW+RLA6h
	/on0pH0kP2040sXa6pqdrALz4oSegQ6h+UwNXUOnLVzzO33Ys+1BDTaJujr07QZueAxZFHTsUYP
	R+GRlKt77SzuNaYGeiHQ/Q==
X-Received: by 2002:a05:600c:3c87:b0:4b8:fdd8:f2c9 with SMTP id 5b1f17b1804b1-4ba093c1c0bmr7546615e9.35.1794351300895;
        Tue, 10 Nov 2026 14:55:00 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e582sm1412409b3a.39.2026.11.10.14.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 14:54:59 -0800 (PST)
Message-ID: <c5c47eed-c927-4ee5-9841-7631674bf6a8@suse.com>
Date: Wed, 11 Nov 2026 09:24:52 +1030
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/34] btrfs: check BTRFS_FS_STATE_RO instead of
 SB_RDONLY at runtime
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org,
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev,
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-xfs@vger.kernel.org
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-23-2f44f64f0b66@kernel.org>
 <c88e4e9c-6b86-4fbb-94bf-909522badf83@suse.com>
 <20261110-kursniveau-zeltlager-quintessenz-36b26debabe3@brauner>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261110-kursniveau-zeltlager-quintessenz-36b26debabe3@brauner>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/11/11 08:24, Christian Brauner 写道:
> On Sun, Nov 01, 2026 at 01:26:22PM +1030, Qu Wenruo wrote:
>> I love the idea. This reminds me exactly why for btrfs_force_shutdown(),
>> we have to manually set the fs error without marking the fs RO, to avoid
>> exactly the same problem.
>>
>> With that said, can you also a set_bit() call in btrfs_force_shutdown()
>> to also set that flag instead of the exsting setting fs_info->fs_error?
> 
> I think so. I'd set BTRFS_FS_STATE_RO in addition to fs_error though.
> start_transaction(), join_transaction() and btrfs_remount_rw() key off
> BTRFS_FS_ERROR().
> 
> Note that this changes some error codes after a shutdown.
> btrfs_permission() returns EROFS for MAY_WRITE once btrfs_fs_rdonly() is
> true so opening a file for writing fails with EROFS instead of the EIO
> from btrfs_file_open().

That should be fine. A lot of other call sites also return EROFS instead 
of EIO on a fs with aborted transaction.

And I think for fs shut down, EROFS or EIO is really the last time end 
users should care.

Thanks,
Qu

