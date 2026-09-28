Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE873BFAFC
	for <exfat@lists.linux.dev>; Mon, 28 Sep 2026 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585801; cv=none; b=pX0o+ISNxrc+p8q0/GTCCJK9FAfmJzqjcuCm0NyySIdfDCBMBmqcVChn1DKL8IyvAvt1iRqKnVJJvuCKPlTQcsiJfUOvl2bTtGPYcJ5u22Kmts6i/YYsgd5VgUmE+DVoUTqjuMMRTtQQ3xeZ+XiTLuRI+dFFmhX0PP7/az+iwfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585801; c=relaxed/simple;
	bh=cPMsUg4GD7ze/NnAko8h/MZFK9hzwQWx3jygGvSUOwI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=u1P0IbRiXtRGfIBVwYxkjQKLm74HXtsqq66grBFZAqiJOoEJebUtqKTJ1/KunkipYR+8tynNMNQ2cDV6IfJ1vkIwvnPzSBojIZcAVqNgdriMYMiEPV8GfG1hlAPSyXg0tPHW5VYkTkr9295ESCkJ1Jo0cejU5E6gTij3zuOB8Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gWYjU1Do; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gWYjU1Do"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=cPMsUg4GD7ze/NnAko8h/MZFK9hzwQWx3jygGvSUOwI=; b=g
	WYjU1Do1XKlsBmBJBbO1TfvYpFJiORxIKSlYnchu5JDvEBV64MlyKbSya0gkpjiz
	CRvBH12PYJOmKZZpCXPGUMpYhZwWY2XDrVsDNZz0mfkxtwEHbou7l2A52NHUf5HE
	uGInUFeX/odicDoL02Gs08ALKyVB1YSi0Yv2RJ3ECQ=
Date: Mon, 28 Sep 2026 16:56:24 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Chi Zhiling" <chizhiling@163.com>
Cc: "Namjae Jeon" <linkinjeon@kernel.org>,
	"Sungjong Seo" <sj1557.seo@samsung.com>,
	"Yuezhang Mo" <yuezhang.mo@sony.com>,
	"Darrick J. Wong" <djwong@kernel.org>, exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] exfat: drain in-flight DIO before buffered write
 fallback
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <9e6e7f65-33b3-4bf2-9254-011b5e1faaa9@163.com>
References: <20260926072612.3022680-1-yaojiale02@163.com>
 <20260926072612.3022680-4-yaojiale02@163.com>
 <9e6e7f65-33b3-4bf2-9254-011b5e1faaa9@163.com>
X-NTES-SC: AL_Qu2SAvmTuk8j4iaeYekcn08ShO49XMOyvfoi2YFTc+gGmTzU3j0if1JyFELowOyzNySDujGrVSdF5ct2e7h6g+ddnJToTl0eKuBreN7YTA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <57105c98.81a5.1a0e73ac964.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:iCgvCgDnz9m5K7pq5plPAA--.50859W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xlCfGq6K7kt7gAA3J
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgWmhpbGluZywKCkF0IDIwMjYtMDktMjcgMjE6MDQ6NTgsICJDaGkgWmhpbGluZyIgPGNoaXpo
aWxpbmdAMTYzLmNvbT4gd3JvdGU6Cj5PbiA5LzI2LzI2IDM6MjYgUE0sIEppYWxlIFlhbyB3cm90
ZToKPj4gZGlmZiAtLWdpdCBhL2ZzL2V4ZmF0L2ZpbGUuYyBiL2ZzL2V4ZmF0L2ZpbGUuYwo+PiBp
bmRleCBhMmE5ZWUxYTIwMDQuLmNmNWNjYmQ1NDgyMyAxMDA2NDQKPj4gLS0tIGEvZnMvZXhmYXQv
ZmlsZS5jCj4+ICsrKyBiL2ZzL2V4ZmF0L2ZpbGUuYwo+PiBAQCAtODA3LDYgKzgwNywxMiBAQCBz
dGF0aWMgc3NpemVfdCBleGZhdF9mYWxsYmFja19idWZmZXJlZF93cml0ZShzdHJ1Y3Qga2lvY2Ig
KmlvY2IsCj4+ICAgCj4+ICAgCWlvY2ItPmtpX2ZsYWdzICY9IH5JT0NCX0RJUkVDVDsKPj4gICAK
Pj4gKwkvKgo+PiArCSAqIFByZXZlbnQgY29uY3VycmVudCBkaXJlY3QgSS9PIGFuZCBidWZmZXJl
ZCBJL08gdG8gdGhlIHNhbWUgZmlsZQo+PiArCSAqIHJhbmdlLiBXYWl0IGZvciBpbi1mbGlnaHQg
RElPIHRvIGZpbmlzaCBiZWZvcmUgZGlydHlpbmcgcGFnZXMuCj4+ICsJICovCj4+ICsJaW5vZGVf
ZGlvX3dhaXQoZmlsZV9pbm9kZShpb2NiLT5raV9maWxwKSk7Cj4KPlRoaXMgY2hhbmdlIGlzIGNv
cnJlY3QsIGJ1dCB0aGUgY29tbWVudCBpcyBub3QgYWNjdXJhdGUgYmVjYXVzZSB0aGUgCj5mdW5j
dGlvbiB5b3UgbW9kaWZpZWQgaXMgbm90IHBhcnQgb2YgdGhlIGJ1ZmZlcmVkIEkvTyBwYXRoIGlu
IGV4RkFULgo+Cj5Zb3UgY2FuIGFkZCBpbm9kZV9kaW9fd2FpdCgpIHRvIGJvdGggZXhmYXRfZmls
ZV93cml0ZV9pdGVyKCkgYW5kIAo+ZXhmYXRfZmFsbGJhY2tfYnVmZmVyZWRfd3JpdGUoKSwgYW5k
IG1vdmUgdGhlIGNvbW1lbnQgdG8gCj5leGZhdF9maWxlX3dyaXRlX2l0ZXIoKS4KPgo+PiArCj4+
ICAgCXdyaXR0ZW4gPSBpb21hcF9maWxlX2J1ZmZlcmVkX3dyaXRlKGlvY2IsIGZyb20sICZleGZh
dF93cml0ZV9pb21hcF9vcHMsCj4+ICAgCQkJTlVMTCwgTlVMTCk7Cj4+ICAgCWlmICh3cml0dGVu
IDwgMCkKClRoYW5rcyBmb3IgeW91ciByZXZpZXcuIFNlZSB2MyBpbjoKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjYwOTI4MDg1NDEyLjIyMjEwNTUtMS15YW9qaWFsZTAyQDE2My5jb20v

