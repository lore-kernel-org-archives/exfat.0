Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705787;
	b=nq60zoBUVqKWpt7EVoVJzSSfQFezqD4KjlCPBAlWSJkVSP8I38QHpPb116jjqsWKfH2E
	 MLNG3LOyJJIIkFY/cfBnQzquTM3tRVn0Ypx+URWMCABIVH7q4PPhGaPg8qMNW7PvdQ1ax
	 YZV2Mb9MO+80SBA3JiX+TEph6UNcEXq8u83lwZppUHt7MitUGH32gVtszsX5Z6yItSrC2
	 J36KFqM510gkeNSuAtorHb+uPbgGj4hZ+Fj38wUYJDFo7xOlrelc0NE76MJqjJ0BJBu54
	 UDj4uRTIWB5sU0y11CbtrCFtY9gL08BJAV+G/zYull3jh2B7PZToVGcFVJL/m0TWpVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8VS+NM0rx/9hrekoMxBvh/z3eSPFWwWyJY4T3a20F2w=;
	b=TkapwEw/ieFLXY6MaZmwsv3qC0FD063dHeWj1TaPUhOS6hNdHAjvpzZYc8gjnLF6bPcH
	 bPq7xAQQ2fViyI9NMILLreN05lOx3apqU1XkIw9I7Hjqiv+UKyn81TkTKQ1juzeXoi64Z
	 TaztC69PpaJJk0x/10NB5HfCQyunFJVHwCU08vPyGrKtVGYXJciiWEwxKp6cnaYsNLAk6
	 0a8jDuOioLVPwjW8Tz1jvRvlB3JAPMyg0k2R7Bj52RfRgMY/OaiYZncIQmueLpmdqYvLU
	 yKTRYWJY+dq7qw6ES4bmdzbQ8egGw+BX7QOJmn03xPkM5bK/e76a3ijLfIp6/cGBqcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmwaqpBr;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E84606A31C
	for <exfat@lists.linux.dev>; Thu, 26 Nov 2026 15:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RmwaqpBr
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f04ad2c46dso44625835ad.2
        for <exfat@lists.linux.dev>; Thu, 26 Nov 2026 07:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795705786; x=1796310586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8VS+NM0rx/9hrekoMxBvh/z3eSPFWwWyJY4T3a20F2w=;
        b=RmwaqpBrin46xXJgTMYV0xiaZbAFNNr78elrQjmaP3HqI12hX38/OC906+cWIcTXtA
         thHRHNuEc0EJze6xoGGhXLX11D0JFRmBP3mh4cmkxdfgukfYlBPnjAqD1FFAf+oPxQWg
         xJnGF7hGvAO1EHqrY4V2ZHUSJPZcgAhAMpWHn/USIYrzy8g2vkEtEcPniUj6mRsg/8RG
         0rYVaAs+NRUarsat+4wFIyzP83NSHNmyFILppkBI666I+xUuhs5moxmRdM2oQZseA664
         lFCmKYhTqCpJmCP/D24tOu7ofclHa9HBNZnn7kdB+Q8CnhferLEyoF++BngUeXeVlfWm
         TaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705786; x=1796310586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VS+NM0rx/9hrekoMxBvh/z3eSPFWwWyJY4T3a20F2w=;
        b=q1Voh23TM4fZnm+8I8FFOP0Q55rtYQx5AFaFmd4FaJ3WXi6bzfxOuwajq6KCID+klp
         rlkrtMlEe17Esyb6L5bRs9DjrZy9ti7kTM+yilYrlTEtyGz35itC8K/ZuVT+kWPQTkPh
         89QywwKRgZAdcm79yBSh0dgwqy/4lfLzBw2ky9UMdKwiN+lzLcqxvtN6+KOAzIohEbIV
         2Ws6Jrb7URmNT96NJnXf/1G4YbtJPpmBo01sM2wbEiotulgKeImd2ellvpChhgj4GdAl
         /9+n9jhlVdKcttEcpSGJrdpjON9yIJA+urx1Q+mQZxIXApwF5EFmiZbsMBziosnLDudv
         +OUw==
X-Forwarded-Encrypted: i=1; AL+hErFQmazHE15i5AfL50T3hRw8EPyI8/BsU5bgmgnPkaYuD/u33m1i7xFZ+5xEqwaK7qHp+oc/tw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8+IbKSl3rp5ahwfolEX73mltNiULP2NmvzM+bBo749WfDOMlxX
	995wjc3Myn0ClUMsEzPnyQQm+itqlQG2tBtjQ5HU1sSqv9Rdk4DJkxJE
X-Gm-Gg: AZFdTZc2CW4CxoHH5TBXSEN5U23i9RlVJo2tg0XKZ7xq9kTxhhYrVzp8IiTLYWCedw7
	l2kTtT1DLSvgTBwrm1jOVVPdRcsSSZRU1UUg9cqyZxf0rvWFCn4tKHo3bUw0nPbm4RaOfQ0CTvP
	BUqkPJIUwCe2AD1ret/Aw7002MHifFOgKHlJLv4a+yX4VaTtca4TtaQUdxXTOR/aO0U4pIdl+np
	xHbngfsA/OaI1VFdShN2JrSU44nT4Q3YoDToFsEoBy4gvVXwE0ewMF3veMBCUXtO3zar8QKcmuY
	D5QoiU7GGa1gVhW+T+dpa5AObN8OqKPxyxIYGn7swf9GMd81JV21I0kQxJZ68SpxuPeeTTazToZ
	zRaYbo1jE7ilMR5IinOdJneI+3ZdAQW56a8bCAHa080txc87j1sie+k/Ku/wfh0mEXPxNIcEg5u
	tNurGOhh9/nGg3tNmC2Do7F6CeFmuCSzTQRzKenZVfDtgXw32svO3JA2SNcLIcxFd0eYmL4pV71
	aqRzOmxGk1b0pIAU+RKYz63r295+LC7mIustaZBoHoTtS/3o/TiQnhQPQUcjwPMrmLXLo7QC5xu
	xtoGQ08qm2zRayOIe/eXbI0doTX/krnQxuDN5HrD7fU=
X-Received: by 2002:a17:903:b4f:b0:2f0:2e6d:f301 with SMTP id d9443c01a7336-2f03f17d21fmr233388715ad.12.1795705786377;
        Thu, 26 Nov 2026 07:09:46 -0800 (PST)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm64919215ad.37.2026.11.26.07.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:09:46 -0800 (PST)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	dxdt@dev.snart.me
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v2] fsck: detect case-insensitive duplicate filenames
Date: Thu, 26 Nov 2026 23:09:20 +0800
Message-Id: <20261126150920.2761243-1-anmuxixixi@gmail.com>
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
 lib/exfat_dir.c                               |  26 ++++++++++++++++--
 .../duplicated_name_casefold/exfat.img.tar.xz | Bin 0 -> 3808 bytes
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 tests/duplicated_name_casefold/exfat.img.tar.xz

diff --git a/lib/exfat_dir.c b/lib/exfat_dir.c
index 9b63b04..bcea7f4 100644
--- a/lib/exfat_dir.c
+++ b/lib/exfat_dir.c
@@ -551,6 +551,7 @@ static int filter_lookup_file(struct exfat_de_iter *de_iter,
 
 	for (i = 2; i <= file_de->dentry.file.num_ext && name_len > 0; i++) {
 		int len;
+		int j;
 
 		retval = exfat_de_iter_get(de_iter, i, &name_de);
 		if (retval || name_de->type != EXFAT_NAME)
@@ -558,8 +559,29 @@ static int filter_lookup_file(struct exfat_de_iter *de_iter,
 
 		len = MIN(name_len + 1, ENTRY_NAME_MAX);
 		if (memcmp(name_de->dentry.name.unicode_0_14,
-			   name, len * 2) != 0)
-			return 1;
+			   name, len * sizeof(*name)) != 0) {
+			if (!de_iter->exfat->upcase_table)
+				return 1;
+
+			__le16 dentry_name[ENTRY_NAME_MAX];
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

