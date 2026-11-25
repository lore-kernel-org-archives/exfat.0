Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614769;
	b=CvauDMyjRgnQhQNbZY3kmcuzCunqNoEcw+xQF+uYRgqJS43UMDSgTudf3zvj96aWyvwG
	 4rtI/EilASVBVYphgZcvG7IvYedz3xg26hy8T8pu1WSZhDFkOQipx7rysEshEEmksaXqT
	 yHXu5vCZFfPtS2j7yVO8lc17hhFsmKfePzjdIUZfVNKx3oxenYWSrMggK7oruqRBEXchB
	 1y4MLtkPlWwy9nIn3SVOSlqCzL+FR6/t95aYqJj5Z+t7+fQo7xCBvUv7M4kkBiz17tfCH
	 myHAGMZJxkTrbt12fWS9DZ9botvKrtNZ8iuHrfBAVs719Tqsn5rlZLUdVisA0gxY1/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A97SHM53coYU4hyvXPHuMi+l3yEyBxU4jQy4qFauvVg=;
	b=Rjw8sebI4E75JiGgrnTaRj2B9s7/I0IVSs68taah2emIqd3Mlw7t4riYroFlA+T9Jqzo
	 j2f7YLHk2KIS9RQvfApiqcI64czmc9d8T0H4qnSpBOgVr52nVITUX+dGry3yH2yKJb4w4
	 7FtjNOyC2+pw/J0oXO7UjZRGX38wXKjJ3d+VkxripfKjux2iiQ95/VV4JcnGfLDmVw71c
	 JPEKJh3Xi/cKBKq4aUi0UTgU9BNW+m6p16yPLXrJuxrvZQbTdeQnQpCPX/yUu4sQrgdFd
	 xdZsx4Ce9eCUXBR4PpKVFI4D19wQ8+uQzq57w60FZntFJzLDfhU6N2jshY1QDtjpZYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DCZEawsr;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE48606A335
	for <exfat@lists.linux.dev>; Wed, 25 Nov 2026 13:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE48606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DCZEawsr
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so3711499a91.3
        for <exfat@lists.linux.dev>; Wed, 25 Nov 2026 05:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614768; x=1796219568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A97SHM53coYU4hyvXPHuMi+l3yEyBxU4jQy4qFauvVg=;
        b=DCZEawsr367+z+p+kGRSLHdPN2+VFwHtFUOYJ3gj35awuJTFzMKY5N8QjE9NBTNceT
         TVMyydh3juxYxyc2Zl8ajYZY9Cq+dzj3PAp9II1m1HKF9VpNSr6QZt+nYm6mLXHY2Nx9
         GGf21PpxpLOlHI0Qm1oAu8IFH73aQr8yUyEDXulp2Za2zGR8YgHJiMhK4n6FzrLx28XE
         JK7m0Q/SJSgNXbwNtHi+WxlqCAu2FNSIfverLWyqBdWbawPELqQKBlIKX4K4vmndkH0f
         7W3J3cPBqhA9/eOmAwCR1NQjMHes1Sl+/6cM0TuRUwg01vrOPtF+et3k9ILFbTD4p03o
         faFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614768; x=1796219568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A97SHM53coYU4hyvXPHuMi+l3yEyBxU4jQy4qFauvVg=;
        b=x7G84L5pdAQnLE5zYqSPK2hPFNOg2jwo27NV2HeFxobPdESGtg8glsmMzJERM5eWsr
         xbUq4pwM/K2dL78Jql95a7yz185fWG5A2VWvUx4frl8+R+/UJicEB4V2mxSPgeuPN6t3
         EBvyddckc7TyTGCBlIrt+7AWfB+pEgJnGFQUB9X/RfgwWIGjDrU7qsTRw1wE7AVFOipq
         c1VZ/J9RvF07uvqsY4KhTV7jqf/frOAvjsT5MBHGSZMJVxWqo6WTfp7lca79xOJt/NL/
         21J7ARsjnYvdTlqbz034+ICUSiF2VpKmdwW+/tfHxePAlgY2Mk3o031EMmlHWiJ77zMr
         0dFQ==
X-Forwarded-Encrypted: i=1; AL+hErFR0psICM17yGRaoLGhHIdlFEGubfwWSO9SCBDnjLSydhjKfNGk44YnCaofAQXTMfU0LAaVZg==@lists.linux.dev
X-Gm-Message-State: APuU4Z//feBUOVnKo16Q/WHghFrncsODBJCSYAzVZRjwlKB2fJ+D+I4g
	0b+1lmOHvL2pfOM4wbRDRd/g/2oql/ZLvE7DEzHEDzRVY5hq7kzvn30O
X-Gm-Gg: AZFdTZcokhBG5PfA6Zg44j/mLjIYORXBsKeB6hZWqW4JE5Q+SL69kPqbTfyRZlaDUIS
	wlQnNq1HoymnmF9qX1ZMRwbGv69eTJovarAjmyoBItiYsH6LuYsDxrlZsFMsdIj0pyApUEragqo
	6JeifPETpEi+O8M5PFcXBXZnXtVzPKEeCnJEyymLfy5l3dNNfMfnxf0z8+0QLe6p0qcR0Lo69j0
	6OwdEHy7i8ehRNKsSqqdqQE5BT0mQPhQZeurbk2/2cfLp6Z4fy2irprflokGBo0kpt/lVETVkdX
	+zNqwZQxIOvWWSmxCr6ONsVomSsyeKgsKHnP9wndDYklT1yoGuvWd+2iCKjDsLq3TVSEb/Iv+IP
	Co8vpm8cC71PpSXKkaFQ7gMe8m9Pu1Mx9xwwIbRTTqIzKCtj4/2Pn0DzbFm+F6AmOqC8/fSGrii
	OUdW8apV1esR8PkEghrzzZxsarn8WRNut6s5LlNGO/R7R73lkFGJHI6qD5JAKYWSmZ7bOLcyE5L
	4wdt4UNGrOE4qZ54bRybW8l3iO1uyh02VBxYy1JEY//mjzdYjAfGAmyMt+H9YqSVY2A19IP7Ndy
	zjzqa7Lr2aqv7ZChmjP/LfifMHOdNy+j15sl+W5dfYs=
X-Received: by 2002:a17:90b:3c11:b0:3b4:1336:4f6b with SMTP id 98e67ed59e1d1-3b41c905a49mr16840547a91.33.1795614768003;
        Wed, 25 Nov 2026 05:52:48 -0800 (PST)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm28023906a91.9.2026.11.25.05.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:52:47 -0800 (PST)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	dxdt@dev.snart.me
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH] fsck: detect case-insensitive duplicate filenames
Date: Wed, 25 Nov 2026 21:52:23 +0800
Message-Id: <20261125135223.2713860-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
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

exFAT file names are case-insensitive, but filter_lookup_file() compares
them with memcmp().  This makes fsck miss duplicate names that differ only
in case.

Keep memcmp() as the fast path and fall back to the volume upcase table.
Add a regression image for case-insensitive duplicate names.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 lib/exfat_dir.c                               |  24 ++++++++++++++++--
 .../duplicated_name_casefold/exfat.img.tar.xz | Bin 0 -> 3808 bytes
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 tests/duplicated_name_casefold/exfat.img.tar.xz

diff --git a/lib/exfat_dir.c b/lib/exfat_dir.c
index 9b63b04..2bb9a3e 100644
--- a/lib/exfat_dir.c
+++ b/lib/exfat_dir.c
@@ -551,6 +551,7 @@ static int filter_lookup_file(struct exfat_de_iter *de_iter,
 
 	for (i = 2; i <= file_de->dentry.file.num_ext && name_len > 0; i++) {
 		int len;
+		int j;
 
 		retval = exfat_de_iter_get(de_iter, i, &name_de);
 		if (retval || name_de->type != EXFAT_NAME)
@@ -558,8 +559,27 @@ static int filter_lookup_file(struct exfat_de_iter *de_iter,
 
 		len = MIN(name_len + 1, ENTRY_NAME_MAX);
 		if (memcmp(name_de->dentry.name.unicode_0_14,
-			   name, len * 2) != 0)
-			return 1;
+			   name, len * sizeof(*name)) != 0) {
+			__le16 dentry_name[ENTRY_NAME_MAX];
+
+			memcpy(dentry_name, name_de->dentry.name.unicode_0_14,
+			       sizeof(dentry_name));
+			/*
+			 * exFAT file names are case-insensitive according to the
+			 * volume upcase table. Keep the exact comparison as the fast
+			 * path, then compare the canonical characters when the on-disk
+			 * spelling differs.
+			 */
+			for (j = 0; j < len; j++) {
+				__u16 dentry_ch = de_iter->exfat->upcase_table[
+					le16_to_cpu(dentry_name[j])];
+				__u16 name_ch = de_iter->exfat->upcase_table[
+					le16_to_cpu(name[j])];
+
+				if (dentry_ch != name_ch)
+					return 1;
+			}
+		}
 
 		name += len;
 		name_len -= len;
diff --git a/tests/duplicated_name_casefold/exfat.img.tar.xz b/tests/duplicated_name_casefold/exfat.img.tar.xz
new file mode 100644
index 0000000000000000000000000000000000000000..d941e14ffd6e60a09aaba928ad02519bc7ce6f4e
GIT binary patch
literal 3808
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
C<x|A~

literal 0
HcmV?d00001

-- 
2.34.1

