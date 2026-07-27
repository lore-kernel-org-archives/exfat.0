Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2787C3EB0F7
	for <exfat@lists.linux.dev>; Mon, 27 Jul 2026 09:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143577; cv=none; b=UnBN2zUF6AYrhCrbonDPbtNcAY5pH3WY3L6CvLAZfMXvoOcMS9itBBgxv9cTPW6aAuLuAxLPUhIAxVqVz4fU5nj1LMCW+BUZrqD+Ff3CTe0SVrhY373OR/x8CEQaVNJKOeRqETDxAAx4cuul7nfAsiDj30mxokRf30fZnCsJNVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143577; c=relaxed/simple;
	bh=9+SvBZVrnAudAJ3bQfJ0d3An5WP4WIFutYffFApVi4k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HQQvL+JhAFGTOU6usc2602v3ZNHeJurJuK2gAuHXKt+JHBKup2QMNaOkJHju3HguFERD6XqltZKih14pZg/Fnyj67fr8FW4xgreuI34ZrS4f+2U6Uw2nB5s9DJPPJ5roa+8x62KlhDoC6HDR/YHDSdr4ImfKJvtxUziSqfQNfkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=NMHhTDhK; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="NMHhTDhK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1785143555;
	bh=BT28hkOI+P00PIuaVjtfWrFDM1LLEFTz6sSkrPAldmo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=NMHhTDhKXLhl4liARFDdnMPOt9RoysUGgzUvLcy2swEwsIO4lyW5TMILVrab0YK+P
	 CO2r9BL/HOKDxDQ8c/55le9ntkYGm99R03oryGOGYTbN3kkbjT2JWSbKx6k3XqOIZP
	 cqFEtNqWiJMVAhT3aBqRAWbnp+HvYXBM40pVAlMM=
X-QQ-mid: zesmtpsz9t1785143538t45a40dc8
X-QQ-Originating-IP: doSpESKBuRWZHbEdAR7q6C0FZn+Vm4KJ2/90jct3o50=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Jul 2026 17:12:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13925937074661905614
EX-QQ-RecipientCnt: 6
From: Yichong Chen <chenyichong@uniontech.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] exfat: write moved entry before removing source
Date: Mon, 27 Jul 2026 17:12:14 +0800
Message-Id: <20260727091214.355917-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NGGv7ksYK5KE6Adh1n+cGp4OslnydtclsG7YoFeBX0Pc4bJvAt/ksFL3
	2Hzv8xbTjZj9XSs/85oFqNBx87h2pMbvxMmGCNnfMzunbInFk02gOzEa0IENvQnAGk0nBZm
	lrTfKbr8Bpd2BR9yY4ZjhxXfwdb0YGk5mnfPaFYU9FYPjlJ0fsQ/Mt42n8SCCle+5eLuXXO
	9XZgf1hhSlZ0DgPMaSJetYxRczW9ldbSgJPyJGAa7iWM6oklrKIKddyhYIFijVXM9FwJ5xU
	sj/W/j9L1voLTq3L32qjrgHYU34PNNmfCaymj1z3SLLnVOSKRGVj00Tgnz4lI8bUNLCYcz5
	neJ6pFGOTwk8BZnJGiv+tp/nOzbLz0UZ8lDScr4ZpSeRvWX+jgYHLC21CJzOPd9hFs6fkl2
	yowmD8ANjvDM4b7fI3VU4fak0RC9VDTSS3ggYd0hVrmvqVtnML4B73YCyp0DkiIXyiL+xHi
	6c+y6sMaCzSgsD7xGFbpky3WamZQhxzZjd2IJYbeG0Wtf3ddQoJMSNjRTZSkfFmbHT//br4
	pAh/BuszdH+cDlX6dfX894ra4bN9lIyQYBYIVo7dKam11tIeLcRfs+/GAG94laW0Nrhyh1o
	iH4A8Pw5OsuXWAObCvUe0Z9iQ1bsRo0sJy+C4MY7aHwDA3z+kg05ik0OshtnYOqHTKALZtx
	UB+gOC9tETixFQTgItilRgB994VKn6WUq3W7Vb8dXfxQ8m+YbdFfrtagTYogcJ/8iuBy7iP
	CXelN8V5dPD9wc0cD3uBDod8UUwVTEf45YaWHWPik7aFrG22mgx7PeJPdvZQVyT2242r95R
	Wus2BxK5KY9HiL4orTHrgBaUBZgD7YuCx+ogmJyIFOyQZumYv7pXRIn2tLwBKA0JRpONfYR
	Nfi3qs0stKNfhh34f7oJI/JIjI6J8cGCDj28AqJg+IuRbzJ+zfHKzOULWgY7h39sH9OlJuY
	UJC0ylPb4keMS6lmeNc5gWFrcKhc2n3cMRp8EJY5qI6PwnlQAdjSD5LAC9PXbEYmvOLd3Id
	R8y7lPzaYYPRbaJN02GP8FCeNdqkhEi7rdcdq5UrA5oy+Qvx+7
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

exfat_move_file() removes the old directory entry before the new entry
has been written.  If writing the new entry fails, rename returns an
error after the source entry has already been marked deleted.

Write the new entry first, then remove the old entry and update the
cached inode location.  This keeps the source entry intact if creating
the destination entry fails.

Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/exfat/namei.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index cd9c9eca58f8..038bc6fed681 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -1116,11 +1116,6 @@ static int exfat_move_file(struct inode *parent_inode,
 	exfat_init_ext_entry(&new_es, num_new_entries, p_uniname,
 			     &mov_es, num_extra_entries);
 
-	exfat_remove_entries(parent_inode, &mov_es, ES_IDX_FILE, false);
-
-	ei->dir = newdir;
-	ei->entry = newentry;
-
 	ret = exfat_put_dentry_set(&new_es, IS_DIRSYNC(parent_inode));
 	if (ret) {
 		/* Best-effort delete to avoid duplicate entries */
@@ -1134,6 +1129,11 @@ static int exfat_move_file(struct inode *parent_inode,
 		goto put_mov_es;
 	}
 
+	exfat_remove_entries(parent_inode, &mov_es, ES_IDX_FILE, false);
+
+	ei->dir = newdir;
+	ei->entry = newentry;
+
 	return exfat_put_dentry_set(&mov_es, IS_DIRSYNC(parent_inode));
 
 put_mov_es:
-- 
2.51.0

