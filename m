Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793485716;
	b=A4IVEC9DMKFJFdVI2B07Sbx/anP91cJJNybfSwrvFeQkUxhWgg+CrirqfCcVb/TjVbHI
	 yFM4+81QWIOyxjhxsjX7QdlDLWfPKJvf0VQcKrs38lDxAsJSwl0NzZ6SCe4o0sVl9xfNv
	 dxAPonzej9tQ0k6nyD8596dvnTvbUA8kP5Se4U0bVrBFF5zSX1a5LQaDRTbbyGMkdWWjn
	 B9AwgCl6CG9AzZfv9ny8qch7IdWG7JGHzgfIuDz8Mmd1R9QiSr/IAFBP/8XbQc+YStalR
	 n/N6fB5ukhCB24DY0+gqbOtqtGRwqFrUOPRvEQS444nCjMZVtrlN77Rqkp81rGriRTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793485716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m0JnkbHJkuPfCHVuDrGb2+stBd0JEX0qG9o4dkUA+8w=;
	b=clCXbUr3enzUeoAwSgmkXH3rrX3qeT0R+wKNyh36k7//u/eRdDuE7KksOoDJeB6i+r2G
	 gqYft9plb3XybK2OS0WNqCP5LzIcMqParjr2zag44LpkB1n7jlszfPsJoV9fhweFFs/4M
	 YT7RyFfyYuqwR5A8eNUlH9mhGa6FpnrEGClsphA2SvrIi7nOMHfesVmqC/L+d9+JcgEIV
	 XNaghbfv+3sNctfyeHGKKvtB7C2VFdb8D9kc9YvCTOfejlk9Cri5HsKG/c5FhhGbzpXOs
	 fO/3xCUZNkicqrzgpOqcCwC/+Z1ZWQj08EH212d6SeDskaLJdUW23FvIs3sAKdrTdFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wruhGxLB;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA25606A31C
	for <exfat@lists.linux.dev>; Sat, 31 Oct 2026 22:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA25606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wruhGxLB
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-35af9712d88so90038eec.1
        for <exfat@lists.linux.dev>; Sat, 31 Oct 2026 15:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793485715; x=1794090515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m0JnkbHJkuPfCHVuDrGb2+stBd0JEX0qG9o4dkUA+8w=;
        b=wruhGxLBLohlxKsjJZR+m2oQPmA+G+wqI4IsVDOEvNloAIzpW6/FEdo9fwni+2bw/I
         MmRI2GbjnQmdN4nUC6BrD1hqJHV0FPYQV+D3lTMLOoinvs8Fl7EmLrEUPMPi6LYV/Nyp
         QZgBQj6CyRHoX77jKqAS95K7MLN8ouuxeafgla2rmvqC4p1kJ17dxhm2FEM1Wdl19Lib
         XwejwgXFBY1lpdeUHkz2ZdOy3Y9Rj6YNblbJJh9+42EHBLc1tt2CgNldwwISyIDeLRMY
         sJi0MpB8s4fKdy1F+8sZkMeXNNMl3OkJMcvwpigyo3V2OG3quBO68dhSNkyTNGOI1Hhv
         Cw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793485715; x=1794090515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0JnkbHJkuPfCHVuDrGb2+stBd0JEX0qG9o4dkUA+8w=;
        b=PUoWW7I/KTnyPLHaPQhgf4Hn9U4+ZlVQz9mYCYyti+iMAUovNuDM+YU1jG5zxbpOWv
         Bh8Oy9LjPDdMazYr3k/2bjzkVVR/E9f6ONQVKkGi9kWTcHmy+WxorrpdDV2CU92/slaG
         16p0hw47IkRh27UH1Wf7Uz6fJgiJt8LlonDG1Bk8n/4YY8v60BVsUQBTceRMzwWTWjh6
         l6vvOMWeCri0TwWGwNZDvaiLiP153TPV+6SYqsH1xrlI29cuPZ9QHb1DQbzGXC7iYg6z
         fsTfZAuuPQHCTZ4xrsDBluMsayZ3ZZsgit3LBL1kf7awPUGienavqbPGGM6fAUM1KJ/d
         WqWg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ0f+/HmhhMDGqHVnaktloTOZtGp7XjjL+HIpCM0XZOmAlJ7Y6sGGYBwZhko13cNyof6z+dQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKinfqUyDRWWipY2o0n2iDgK3knX7U9gyo8uF8Vt67lU491lFDB
	aMAked55Vt/kJ2GiwSioKLgwptGDHc++HFIu5M22TmpZBuZavXFcmdI3
X-Gm-Gg: AYBFou1QL0qmmC/o/D1hPIW5IR5UXc+jr2JmbACxWlfhXAn/6ithkkqUDy4/oul7dWz
	9rBrtcY1JfS5v/c275oKDuWIV1iqB5y5W4NnAW7wOF4CbI9JF3lnrLWenOx1zKBTa3s7frKKesr
	BOmzMiSGQRcISdce9GZYpEMlHi9piRxaUr97Sd6fw9Q2o9g6xXpzZV3uCS+RH3d72Iv0AwesPyL
	KvNXXHJZ7Xec3zAq5z0TNFrL7WYghlQVnJHgzV9to1ogmLyMggbDglVWW6koFrJqq8oSMgqP2CP
	AGgipqcmymgBzhkMQAncLkFI4nDkwiOF8U/JIkRw6FL+2ORXSz2hLcwmYVyvIrBEu/+znRuidY/
	Bdp8wWg1k9yIJ71qEYaR7CE8IvGn0ZirYN3CUIWPyfA/0Wy5rimxg0iMzshuPIKOfQYKO7g7rOC
	ZIFDVFFKavbmM83Ll5mT98sorZnXuXwGGnZFtKS+HNjAAWvuR9Y1emvD31vIToOXDg4HSJ3PWpC
	mCBtitAacuPgE8xgJKGkuj4r3gZGuM6vb0bhhxsOPyxVQbybG03DgsOEWNoX4dGuXG5v1SSsSVk
	RLXm2AtDcWSOWO8HMYk9e1lugk/Z2Z3CRwkO22AGGTlgHGwbx4FgMsbY
X-Received: by 2002:a05:7022:5f0a:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-1ac599f5078mr7780009c88.4.1793485714706;
        Sat, 31 Oct 2026 15:28:34 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm33876066c88.7.2026.10.31.15.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 15:28:34 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	exfat@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] exfat: preserve the 64-bit FITRIM minimum length
Date: Sat, 31 Oct 2026 22:28:23 +0000
Message-ID: <20261031222823.223-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The FITRIM minimum length is a 64-bit value, but exfat_ioctl_fitrim()
uses max_t(unsigned int, ...) to compare it with the discard granularity.
This truncates the requested minimum on both 32-bit and 64-bit kernels.

For example, fstrim --minimum 4GiB can trim smaller free extents because
the minimum wraps to zero before being raised to the device granularity.

Use a u64 comparison to preserve the userspace value. exfat_trim_fs()
already stores the minimum cluster count in a u64.

Fixes: 654762df2ec7 ("exfat: add support ioctl and FITRIM function")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/exfat/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index 1386149916bb..4e7a2fb30279 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -586,8 +586,8 @@ static int exfat_ioctl_fitrim(struct inode *inode, unsigned long arg)
 	if (copy_from_user(&range, (struct fstrim_range __user *)arg, sizeof(range)))
 		return -EFAULT;
 
-	range.minlen = max_t(unsigned int, range.minlen,
-				bdev_discard_granularity(inode->i_sb->s_bdev));
+	range.minlen = max_t(u64, range.minlen,
+			     bdev_discard_granularity(inode->i_sb->s_bdev));
 
 	ret = exfat_trim_fs(inode, &range);
 	if (ret < 0)
-- 
2.43.0

