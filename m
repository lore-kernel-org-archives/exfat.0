Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04BC386C13
	for <exfat@lists.linux.dev>; Sat,  5 Sep 2026 09:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600838; cv=none; b=or5lxujrqeyqdPB3eFnvdFR9Zk00aocgG7LOXqD9uEWT0JBOSwq4Ha/eCgQ98LRfU+jRfJBnGYfw8PW7lgJ8eh8o82eMzkxWdVZIlM1kymX5LOxReYPWkb0GxBcqFqOSTkaO2T2ToohOXHaAuAP0+TTV6CjdCCWlt5vffsmIuuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600838; c=relaxed/simple;
	bh=+tmlWtzSwJH+v7W4srKJjDRZDcOBSpbvqxRmwOwzNJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itDIQT197A1SBh2KnWeOjI1KZ/nleVOjTCWoMv2+2z+M42+2g+3bgdwDQ/TDfAyPfG5BHkRoa2Ud/vu5YCRtUXXldlcwtd62bwa4nL0BfoGMIXE3L0uNvju70OMruMZc0VoPkBaWQxDAIHRZGtt9lDix9EyuBPVtTnNcRasfU9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zx3PkcK3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zx3PkcK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B18C1F00ADB
	for <exfat@lists.linux.dev>; Sat,  5 Sep 2026 09:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788600837;
	bh=TZNxwK/kOkxDfyAvXninVcQIyqIvcp76bcqLHzyy0vc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zx3PkcK37lFvmtFfWCdTsK7OgbNB7S10019HxNcIXjIBuVuFfd2iQElVU6XpeD7j8
	 WXIVnS36FpW9clY0dJEStbc4i+UI4yqUW7JpESMBYrFjtTUuzYvWnIOckUyvt94Ge+
	 v9TZU0r0y0e5zl51uUlRuiuLXigEdOsFS9lu/vTTLdWqQvZWJ5WPvbqFIDEstJe0yJ
	 FvWd1dFdqjYedA/r1rPK1ka89AmhWsCWM8maZcSAZfcBIg+/MNU5LpadhA7EPSuLux
	 ssW+64+V8yplTptfXgFF937N/9BqSgne6qKCUxjTlfbN231lnlYn7g+OYmYkXXsp2R
	 PBXLBXz7MPbAg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a7e0ff423dso4668064a12.1
        for <exfat@lists.linux.dev>; Sat, 05 Sep 2026 02:33:57 -0700 (PDT)
X-Gm-Message-State: AFuF++meTDH3S7CpQX5lcUEmKNO7W5gz+dStqwEUiv8BcmChxL2a1hW2
	wH7ym0MmP8BaLrJNXHLG4qiqPIvh0TuF27N3kWxRDyWhyS1vJcKmCaRcJqrYG4tCSqkgi/jilgD
	OCkb7wjzgMG15oEgMhtENRr6N4cwKj9M=
X-Received: by 2002:a17:907:d2a:b0:c25:f7db:4bf0 with SMTP id
 a640c23a62f3a-c2610747c3emr398099266b.22.1788600835783; Sat, 05 Sep 2026
 02:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260905054951.674766-1-chizhiling@163.com>
In-Reply-To: <20260905054951.674766-1-chizhiling@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 5 Sep 2026 18:33:41 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8KYEtfLkSLGVP9fpjvkJ0vS8V09CFCg0J4i=h57BuWzQ@mail.gmail.com>
X-Gm-Features: AcwNN1X3UIn5F7MjKZMa7uiFMU2vo1VDbO-8TviNGxPCxD6U6E1bt-ZAm6XyLys
Message-ID: <CAKYAXd8KYEtfLkSLGVP9fpjvkJ0vS8V09CFCg0J4i=h57BuWzQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] exfat: fix cluster allocation accounting and locking
To: Chi Zhiling <chizhiling@163.com>
Cc: exfat@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Chi Zhiling <chizhiling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 2:50=E2=80=AFPM Chi Zhiling <chizhiling@163.com> wro=
te:
>
> From: Chi Zhiling <chizhiling@kylinos.cn>
>
> Patch 1 fixes sbi->used_clusters accounting when cluster allocation
> fails partway through. This can cause the counter to underflow.
> The issue is caught by generic/476.
>
> Patch 2 takes bitmap_lock before checking and allocating clusters.
>
>
> Chi Zhiling (2):
>   exfat: fix used_clusters accounting during cluster allocation
>   exfat: take bitmap_lock at the start of exfat_alloc_cluster()
Applied them to #dev.
Thanks!
