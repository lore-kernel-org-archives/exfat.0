Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069301;
	b=LDFFrct+6R/vRAH5qhVsco302UU29wuFITD37wExKp9fLkpV7R0i3EigQIYRfv7MMR0F
	 Q7XQi8pVhVjkQSBefgEJ7wt6hfdB4/7iig0DX0qMKRM0Mz8Pomd0zXxV1o4EPCpTHwioW
	 UgCcQuEIZtDLMEWxjm8g8HkMfSyDV3CMYRxQk9wOa0KtfFVFIfDN7X2IA9NiHpPDNyPcy
	 OfTvizkn9mdTj1G1FrnPqqkjpNtXM4fpqnog33JhaDEIpivBiy3VcKd8R8aCNPiUpMAkI
	 bqDlfFhKCtmiQ/kBxPzDEyVMyzGJS5z7XWLXeNHCJjbnImztnWqILh3nfBw8Y+QTJ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069301;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=1RKhlidb6WRhjA8TBHjVn2J7105OGajHSSm4WMw3Eh8=;
	b=5FLFs7dOe5BDx70XR8ghPooJyVQPS1l0pf4COm3U4bMvG/ex2LR2IXhMMlD2QbePXk4f
	 dGsby70yejDfzMhcwffCtXxEkILFE6OPY8/2e3zPgbwaO9Y9OlK6mhD3zUP2IwqlXqF6o
	 Yk6iKQVbzhAdoWBN5uJn4pvuWPsZAS1MzcF5Nr5SD1s/wIw9D16h56B+3P6BeV9NIFOtG
	 HyHdJ5ViE0u72XHPXPuPt/b9+FedQLN9VGm78/jrIlJePzhxBUXyaTD1mdwibUSuLz/Mf
	 4NXAJ58PZ3i8skCblaJqG0fXo6WRB+hIGlvrOAqG+RFpwsXwvtztIgKGvW1S8PznxvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+vAq926;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD383606A31A
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 02:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+vAq926
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E161F031E0
	for <exfat@lists.linux.dev>; Tue, 27 Oct 2026 02:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793069300;
	bh=1RKhlidb6WRhjA8TBHjVn2J7105OGajHSSm4WMw3Eh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=R+vAq9260Lkm1CHBgWepK8kZ2EvWKJRcPjNQZeQikF+Up8NuYGXdInWz0r0McXABj
	 lSC05eapsLypuCxYYOZbbiK3uhb4zAkvEx09ZalN8fHbxrEgjarGgIeKiUOU+Zjr2t
	 cQ5nUTo4wr6E7xDrJjII3HfLyLv9o+GXZyQGmy9XuZf/q9EW6Eoab72X5BLb+Spy8p
	 6isrd3xqDvVepzQfu+J44CY7GBRu0frO/bbwdsFUHV55LNdRW0FSLcmvp/uWvfgIo2
	 2rlDMBKMIHnKmMsbzdd+s3GOUgn/X5mIkslAUOgjbllXNIPY+R8NxPgVKAeK7b4/Lu
	 4levlvB+BMLwg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso545979866b.2
        for <exfat@lists.linux.dev>; Mon, 26 Oct 2026 19:48:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJ0URfjnrYA6DsfpzbcXPrSCfg2ca51Jz1hlFmvA27myVCSAOSJjHu9l0+RTnoEXOzoht8NA==@lists.linux.dev
X-Gm-Message-State: AFq9FYI55Ylvycg2Zz+n0BqtoJqun0xcRkU2HZEkgQC02CfPnqBLZC5M
	6GhIXQ4DcSoNsMkGAeITFj8S1t3J0rA+dpW6gJHV/m8omC6a+aax6ggWNVPK0dHWJQhT8Hv9Q68
	o8Fo4AiE3Gx8lN+Yef/E9RCG3BuAEhX8=
X-Received: by 2002:a17:907:3cc9:b0:c29:f5d8:9c6c with SMTP id
 a640c23a62f3a-c46bde52457mr986360066b.27.1793069299008; Mon, 26 Oct 2026
 19:48:19 -0700 (PDT)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024134342.2243235-1-anmuxixixi@gmail.com>
In-Reply-To: <20261024134342.2243235-1-anmuxixixi@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 27 Oct 2026 11:48:06 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_AAjF89KQkS2X1WrJSxnAD-ap-hkpjV5DGxuF+XzbUUQ@mail.gmail.com>
X-Gm-Features: AclHuK9DqvfWy-Q6O-G_rOzs6ImuITyqeL8CN_yilLqAQvEG1ICX7ojc8mTa2tI
Message-ID: <CAKYAXd_AAjF89KQkS2X1WrJSxnAD-ap-hkpjV5DGxuF+XzbUUQ@mail.gmail.com>
Subject: Re: [PATCH] libexfat: restore the original DIV_ROUND_UP type
To: Yang Wen <anmuxixixi@gmail.com>
Cc: hyc.lee@gmail.com, dxdt@dev.snart.me, yuezhang.mo@sony.com, 
	exfat@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000a04353065ec97a5a"

--000000000000a04353065ec97a5a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 10:44=E2=80=AFPM Yang Wen <anmuxixixi@gmail.com> wr=
ote:
>
> Casting the first argument of DIV_ROUND_UP() to uint64_t changes the
> result type for every caller and causes a signedness warning in fsck.
>
> The malformed boot-sector arithmetic is protected by the validation
> added in the same commit, so restore the original type-preserving macro.
>
> Fixes: 69a8482f3492 ("fsck: prevent overflows from invalid clu_count and =
vol_length")
> Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
I will apply an attached patch instead of this patch. Can you check it?
Thanks!

--000000000000a04353065ec97a5a
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-libexfat-avoid-DIV_ROUND_UP-overflow.patch"
Content-Disposition: attachment; 
	filename="0001-libexfat-avoid-DIV_ROUND_UP-overflow.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvq34uqz0>
X-Attachment-Id: f_mvq34uqz0

RnJvbSA4NWZiNThmNjY5OWI4MjgyMWQzYjdkYjJhMGQ5YWZmZmI0ODIwMTE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZYW5nIFdlbiA8YW5tdXhpeGl4aUBnbWFpbC5jb20+CkRhdGU6
IFNhdCwgMjQgT2N0IDIwMjYgMjE6NDM6NDIgKzA4MDAKU3ViamVjdDogW1BBVENIXSBsaWJleGZh
dDogYXZvaWQgRElWX1JPVU5EX1VQIG92ZXJmbG93CgpDYXN0aW5nIHRoZSBmaXJzdCBhcmd1bWVu
dCBvZiBESVZfUk9VTkRfVVAoKSB0byB1aW50NjRfdCBtYWtlcyBldmVyeSBjYWxsCnJldHVybiB1
aW50NjRfdCBhbmQgY2F1c2VzIGEgc2lnbmVkbmVzcyB3YXJuaW5nIGluIGZzY2suIFJlbW92aW5n
IHRoZSBjYXN0CmFsb25lIGNhbiBvdmVyZmxvdyBmb3IgMzItYml0IHZhbHVlcy4KClVzZSBkaXZp
c2lvbiBhbmQgcmVtYWluZGVyIHRvIHJvdW5kIHVwIHdpdGhvdXQgYW4gb3ZlcmZsb3dpbmcgYWRk
aXRpb24uClRoaXMga2VlcHMgdGhlIHJlc3VsdCB0eXBlIGV4cGVjdGVkIGJ5IGVhY2ggY2FsbGVy
LiBBbHNvIGNoZWNrIGNsdV9jb3VudAppbiByZWFkX2Jvb3Rfc2VjdCgpLCB1c2VkIGJ5IGV4ZmF0
MmltZyBhbmQgZGVmcmFnLiBUaGUgY2hlY2sgaW4gZnNjaydzCnJlYWRfYm9vdF9yZWdpb24oKSBk
b2VzIG5vdCBjb3ZlciB0aG9zZSBwcm9ncmFtcy4KCkZpeGVzOiA2OWE4NDgyZjM0OTIgKCJmc2Nr
OiBwcmV2ZW50IG92ZXJmbG93cyBmcm9tIGludmFsaWQgY2x1X2NvdW50IGFuZCB2b2xfbGVuZ3Ro
IikKU2lnbmVkLW9mZi1ieTogWWFuZyBXZW4gPGFubXV4aXhpeGlAZ21haWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBOYW1qYWUgSmVvbiA8bGlua2luamVvbkBrZXJuZWwub3JnPgotLS0KIGluY2x1ZGUv
bGliZXhmYXQuaCB8IDIgKy0KIGxpYi9saWJleGZhdC5jICAgICB8IDYgKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGliZXhmYXQuaCBiL2luY2x1ZGUvbGliZXhmYXQuaAppbmRleCA2NWYxM2RkLi40YTdi
MDFhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpYmV4ZmF0LmgKKysrIGIvaW5jbHVkZS9saWJleGZh
dC5oCkBAIC0yNCw3ICsyNCw3IEBAIHR5cGVkZWYgX191MzIgY2x1c190OwogI2RlZmluZSBNSU4o
YSwgYikJKChhKSA8IChiKSA/IChhKSA6IChiKSkKICNkZWZpbmUgTUFYKGEsIGIpCSgoYSkgPiAo
YikgPyAoYSkgOiAoYikpCiAKLSNkZWZpbmUgRElWX1JPVU5EX1VQKF9faSwgX19kKQkoKCh1aW50
NjRfdCkoX19pKSArIChfX2QpIC0gMSkgLyAoX19kKSkKKyNkZWZpbmUgRElWX1JPVU5EX1VQKF9f
aSwgX19kKQkoKF9faSkgLyAoX19kKSArICgoX19pKSAlIChfX2QpICE9IDApKQogCiAjZGVmaW5l
IEVYRkFUX01JTl9OVU1fU0VDX1ZPTAkJKDIwNDgpCiAjZGVmaW5lIEVYRkFUX01BWF9OVU1fU0VD
X1ZPTAkJKCgyIDw8IDY0KSAtIDEpCmRpZmYgLS1naXQgYS9saWIvbGliZXhmYXQuYyBiL2xpYi9s
aWJleGZhdC5jCmluZGV4IDljYmE0ODQuLmIwZjk3MDAgMTAwNjQ0Ci0tLSBhL2xpYi9saWJleGZh
dC5jCisrKyBiL2xpYi9saWJleGZhdC5jCkBAIC0xOTU5LDYgKzE5NTksMTIgQEAgaW50IHJlYWRf
Ym9vdF9zZWN0KHN0cnVjdCBleGZhdF9ibGtfZGV2ICpiZGV2LCBzdHJ1Y3QgcGJyICoqYnMpCiAJ
CWdvdG8gZXJyOwogCX0KIAorCWlmIChsZTMyX3RvX2NwdShwYnItPmJzeC5jbHVfY291bnQpID4g
RVhGQVRfTUFYX05VTV9DTFVTVEVSKSB7CisJCWV4ZmF0X2VycigidG9vIGxhcmdlIGNsdXN0ZXIg
Y291bnQ6ICV1LCBtYXggYWxsb3dlZDogJXVcbiIsCisJCQkgIGxlMzJfdG9fY3B1KHBici0+YnN4
LmNsdV9jb3VudCksIEVYRkFUX01BWF9OVU1fQ0xVU1RFUik7CisJCWdvdG8gZXJyOworCX0KKwog
CXNlY3Rfc2l6ZSA9IDEgPDwgcGJyLT5ic3guc2VjdF9zaXplX2JpdHM7CiAJY2x1X3NpemUgPSAx
IDw8IChwYnItPmJzeC5zZWN0X3NpemVfYml0cyArCiAJCQkgcGJyLT5ic3guc2VjdF9wZXJfY2x1
c19iaXRzKTsKLS0gCjIuMzQuMQoK
--000000000000a04353065ec97a5a--
