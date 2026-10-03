Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343873BED66
	for <exfat@lists.linux.dev>; Sat,  3 Oct 2026 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019957; cv=none; b=Wc8ZoQ5+D+o9AIHUZSI7KK+GVnumxcS+j8yKvO7lzG4/laLzYVIy2wIxquLTuQbbU4Z868Y7R4liftXa2fxXVjDgfl4JVuoQhEPMD2sZzbD44usDFUiIn+RgHSKH+a5NVENGHmE+ATzBI/wLcq+4eMj/tiu4vnsrfwIR15Btg0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019957; c=relaxed/simple;
	bh=gtBDd8eZoep2RhjTavpiS53fkuhzt/9I1S1GhQFjzLM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=p4BZXlrttgIz0ZmedPESDCL0qexm9pDDkMXgIG4DCursRT08ymMkxNynK5BPIpf/Jxbu5OC1skP2f8L9R3G75LH8YrnksYB2prYZMvTRZkddLR/e86xebvpqxKoR7TO7Doyt/8jI8NzJsqnR0CffNSZDQhOEy0R6UOL0HakVy5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iKwsJXEF; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iKwsJXEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=gtBDd8eZoep2RhjTavpiS53fkuhzt/9I1S1GhQFjzLM=; b=i
	KwsJXEFPTnkNnkR+8QfIuSzMOLtyRb0NZyzejRKkVJmtXEOELHQBEgLf+asKs6r0
	npKsoIJTpaNNj42WmBabGgKTGCsOOoA20de0ITcy23rDx7ITZxOi/4gpIBfF/yER
	+6w5ido1L4OWLo6y1Zm361ec3FsyyOlB6Z9hRyAbi0=
Date: Sat, 3 Oct 2026 17:32:25 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Chi Zhiling" <chizhiling@163.com>
Cc: "Namjae Jeon" <linkinjeon@kernel.org>,
	"Sungjong Seo" <sj1557.seo@samsung.com>,
	"Yuezhang Mo" <yuezhang.mo@sony.com>,
	"Darrick J. Wong" <djwong@kernel.org>, exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v3 3/3] exfat: drain in-flight DIO before buffered
 writes
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <eb7855e6-2972-42a7-ace0-e43dc4096677@163.com>
References: <20260928085412.2221055-1-yaojiale02@163.com>
 <20260928085412.2221055-4-yaojiale02@163.com>
 <eb7855e6-2972-42a7-ace0-e43dc4096677@163.com>
X-NTES-SC: AL_Qu2SA/yatkEv4yKfbOkdmE8Uges8WcC0svki1YJUc+4GhzHBwiABbHpeBEnt4NmlFwSNnAm9ShFy8/5qb6BZ+Y5UBaFQ6/NQy1A90wK4aQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <2ad58a78.1329.1a1011b8d46.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:jygvCgD3vzCpy8Bq8EUHAA--.61681W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgnnImrAy6nBAQAA3K
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0wMyAwOToxNzoxOCwgIkNoaSBaaGlsaW5nIiA8Y2hpemhpbGluZ0AxNjMuY29t
PiB3cm90ZToKPk9uIDkvMjgvMjYgNDo1NCBQTSwgSmlhbGUgWWFvIHdyb3RlOgo+PiBBbiBhc3lu
Y2hyb25vdXMgZGlyZWN0IHdyaXRlIGNhbiByZW1haW4gaW4gZmxpZ2h0IGFmdGVyIHRoZSBpbm9k
ZSBsb2NrIGlzCj4+IHJlbGVhc2VkLiAgSWYgYSBidWZmZXJlZCB3cml0ZSBkaXJ0aWVzIHBhZ2Ug
Y2FjaGUgd2hpbGUgdGhlIGRpcmVjdCB3cml0ZQo+PiBpcyBzdGlsbCBwZW5kaW5nLCB0aGUgZGly
ZWN0IHdyaXRlJ3MgcG9zdC1JL08gaW52YWxpZGF0aW9uIGNhbiBmaW5kIHRoZQo+PiBkaXJ0eSBw
YWdlcywgcmVwb3J0IGEgcGFnZSBjYWNoZSBpbnZhbGlkYXRpb24gZmFpbHVyZSwgYW5kIHJlY29y
ZCAtRUlPIGluCj4+IHRoZSBtYXBwaW5nIGVycm9yIHNlcXVlbmNlLiAgQSBsYXRlciBmc3luYygp
IHRoZXJlZm9yZSByZXR1cm5zIC1FSU8uCj4+IAo+PiBDb21taXQgMTVjZGVmZDBjMDUyMmY5ZDVl
MTJkOTQ3ZmEwNGY0YzExNjQ5YjY5OSAoImV4dDQ6IGRyYWluCj4+IGluLWZsaWdodCBESU8gYmVm
b3JlIGJ1ZmZlcmVkIHdyaXRlIGZhbGxiYWNrIikgZml4ZWQgdGhlIHNhbWUgcmFjZSBpbgo+PiBl
eHQ0LiAgRXhGQVQgZG9lcyBub3QgZHJhaW4gaW4tZmxpZ2h0IERJTyBiZWZvcmUgZWl0aGVyIGEg
cmVndWxhciBidWZmZXJlZAo+PiB3cml0ZSBvciB0aGUgYnVmZmVyZWQgZmFsbGJhY2sgYWZ0ZXIg
aW9tYXBfZGlvX3J3KCkgcmV0dXJucyAtRU5PVEJMSyBvciBhCj4+IHNob3J0IHdyaXRlLgo+PiAK
Pj4gV2FpdCBmb3IgaW4tZmxpZ2h0IERJTyBiZWZvcmUgY2FsbGluZyBpb21hcF9maWxlX2J1ZmZl
cmVkX3dyaXRlKCkgaW4gYm90aAo+PiBwYXRocy4KPj4gCj4+IEEgcmVwcm9kdWNlciB1c2luZyBj
b25jdXJyZW50IEFJTyBkaXJlY3Qgd3JpdGVzIGFuZCBidWZmZXJlZCBmYWxsYmFjawo+PiB0cmln
Z2VyZWQgdGhlIGZvbGxvd2luZyB3YXJuaW5nIGFuZCBtYWRlIGEgc3Vic2VxdWVudCBmc3luYygp
IHJldHVybgo+PiAtRUlPOgo+PiAKPj4gICAgUGFnZSBjYWNoZSBpbnZhbGlkYXRpb24gZmFpbHVy
ZSBvbiBkaXJlY3QgSS9PLiAgUG9zc2libGUgZGF0YSBjb3JydXB0aW9uCj4+ICAgIGR1ZSB0byBj
b2xsaXNpb24gd2l0aCBidWZmZXJlZCBJL08hCj4+IAo+PiBGaXhlczogODY3YjljOTZkYzgzICgi
ZXhmYXQ6IGFkZCBpb21hcCBkaXJlY3QgSS9PIHN1cHBvcnQiKQo+PiBMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjYwNjI5MTEzODI3LjQwNzQzMzUtMy1saWJhb2t1bkBsaW51eC5h
bGliYWJhLmNvbQo+PiBTaWduZWQtb2ZmLWJ5OiBKaWFsZSBZYW8gPHlhb2ppYWxlMDJAMTYzLmNv
bT4KPj4gLS0tCj4+ICAgZnMvZXhmYXQvZmlsZS5jIHwgMTIgKysrKysrKysrKy0tCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZm
IC0tZ2l0IGEvZnMvZXhmYXQvZmlsZS5jIGIvZnMvZXhmYXQvZmlsZS5jCj4+IGluZGV4IGEyYTll
ZTFhMjAwNC4uMjg4MTEyMTA2NjNmIDEwMDY0NAo+PiAtLS0gYS9mcy9leGZhdC9maWxlLmMKPj4g
KysrIGIvZnMvZXhmYXQvZmlsZS5jCj4+IEBAIC04MDcsNiArODA3LDggQEAgc3RhdGljIHNzaXpl
X3QgZXhmYXRfZmFsbGJhY2tfYnVmZmVyZWRfd3JpdGUoc3RydWN0IGtpb2NiICppb2NiLAo+PiAg
IAo+PiAgIAlpb2NiLT5raV9mbGFncyAmPSB+SU9DQl9ESVJFQ1Q7Cj4+ICAgCj4+ICsJaW5vZGVf
ZGlvX3dhaXQoZmlsZV9pbm9kZShpb2NiLT5raV9maWxwKSk7Cj4+ICsKPj4gICAJd3JpdHRlbiA9
IGlvbWFwX2ZpbGVfYnVmZmVyZWRfd3JpdGUoaW9jYiwgZnJvbSwgJmV4ZmF0X3dyaXRlX2lvbWFw
X29wcywKPj4gICAJCQlOVUxMLCBOVUxMKTsKPj4gICAJaWYgKHdyaXR0ZW4gPCAwKQo+PiBAQCAt
ODg5LDExICs4OTEsMTcgQEAgc3RhdGljIHNzaXplX3QgZXhmYXRfZmlsZV93cml0ZV9pdGVyKHN0
cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICppdGVyKQo+PiAgIAkJCWdvdG8gdW5s
b2NrOwo+PiAgIAl9Cj4+ICAgCj4+IC0JaWYgKGlvY2ItPmtpX2ZsYWdzICYgSU9DQl9ESVJFQ1Qp
Cj4+ICsJaWYgKGlvY2ItPmtpX2ZsYWdzICYgSU9DQl9ESVJFQ1QpIHsKPj4gICAJCXJldCA9IGV4
ZmF0X2Rpb193cml0ZV9pdGVyKGlvY2IsIGl0ZXIpOwo+PiAtCWVsc2UKPj4gKwl9IGVsc2Ugewo+
PiArCQkvKgo+PiArCQkgKiBQcmV2ZW50IGNvbmN1cnJlbnQgZGlyZWN0IEkvTyBhbmQgYnVmZmVy
ZWQgSS9PIHRvIHRoZSBzYW1lIGZpbGUKPj4gKwkJICogcmFuZ2UuIFdhaXQgZm9yIGluLWZsaWdo
dCBESU8gdG8gZmluaXNoIGJlZm9yZSBkaXJ0eWluZyBwYWdlcy4KPj4gKwkJICovCj4+ICsJCWlu
b2RlX2Rpb193YWl0KGlub2RlKTsKPj4gICAJCXJldCA9IGlvbWFwX2ZpbGVfYnVmZmVyZWRfd3Jp
dGUoaW9jYiwgaXRlciwKPj4gICAJCQkJJmV4ZmF0X3dyaXRlX2lvbWFwX29wcywgTlVMTCwgTlVM
TCk7Cj4+ICsJfQo+PiAgIAlpZiAocmV0IDwgMCkKPj4gICAJCWdvdG8gdW5sb2NrOwo+PiAgIAo+
Cj5BbHNvLCBpZiB5b3UgZG9uJ3QgbWluZCwgY291bGQgeW91IGFkZCBpbm9kZV9kaW9fd2FpdCgp
IHRvIAo+ZXhmYXRfZXh0ZW5kX3ZhbGlkX3NpemUoKSBhcyB3ZWxsPwpTdXJlLCB2NCBpbiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjEwMDMwOTMwMzUuNTMyOTE2LTEteWFvamlhbGUw
MkAxNjMuY29tLwo+Cj5UaGFua3MuCg==
