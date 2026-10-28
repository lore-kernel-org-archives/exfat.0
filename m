Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196299;
	b=o8a4xfMNs54+bwR1Al1I1UNNsQsPHPXF26NvWQB1R3YXTm+8JKMj551oHqO9bkQQ56hC
	 CYCLt7df1oTGpCGdpMNMP5YVeMgdMVmQC9J39coMu9Fk2/AoImFTvN19loNNu25Vu6thx
	 r8WmnTNWyAL9PPLG9AXtloLFO2nuwJRZyqfTfBZFnPT/3C2foPFVpC9WEz8xeX2RpmYCe
	 WRHQ2xuwK4zjwybdUBrdGTPGmvl7dvGzn9MqGrjLkZ2Dcci14BbBZdKnBAZc0gQYXRmlt
	 m+24HiuO3r1Z+aaR+yUDW1lL7JYZ9BJsP7+70TFDEzs35Pf4gsqrt9kIyYsAv9O9gxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=imFHoaJpvnVOiA2ZSXX5+miSLzGB5n8SAQDIbLW1jZA=;
	b=K4V9FBCFp9OK5c6ZBShayzg1JO4SdVPv7rrCxOLJMODpTX+GoM1lB8fDBNldVlnhb6Z6
	 5jXOLBmrZIqyq7q8V8j3X/1dsNuB6AmjykyVQ/TWXkyCB+n0XtQbLCuLidODIwVKhvzMv
	 HZsmgB03WUy9CBxYZwYnXS4SgAgCh51+RHgOR/YNv7BEb/OE2G8ioXG/IMmAqcxxpG2AQ
	 h0ljnd3vykVRR9D14gAnbfEeUexvhZog+J5FXyY3e+biye+hJi6TxuR5i5LOyDU9AXYuB
	 /tCJ7Pm3zQORmaGDtvjZl912Q36GMrGeuSTv0kVIVzLsG9/iMFUQr0goKjdvhvOpsBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7MmYz4G;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE01606A31A
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 14:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE01606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7MmYz4G
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc502d509c0so439210a12.2
        for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793196298; x=1793801098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imFHoaJpvnVOiA2ZSXX5+miSLzGB5n8SAQDIbLW1jZA=;
        b=C7MmYz4G6nGDIpiJMomj8k04eraxDhcPUSyXOHY3U8MDdSalOwwuM6ruhX+3tNht0L
         JPuAfeIqOFvYNw7WDOqlps1Jikf0t50MEVqo3/p9F7thP3GT9jeP+iX8aLVd+tq8GxO6
         5WAEGIe9sEdUOj04ejmxgy37yxZSRhI0eke0ysuFnGTj/1HpKwrAZXwTdMZ3FxXbFvQk
         icKkV1aghAgwLNY54lAw0DjS3aREpIcWfp+9xb1xDq28YQ+rql8onbPCu4Ci8Pd/rL8/
         KaQNYZGzs4MhFtleh0Gumm7Zmn7RPZD5Ua1V2K1sukIHlqwhYW+PX5fSBFUtO4fKRBeQ
         zIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196298; x=1793801098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=imFHoaJpvnVOiA2ZSXX5+miSLzGB5n8SAQDIbLW1jZA=;
        b=vZjkhRmkbJPXQXuAfpWJpy+23PHbsStQ/woJHA/FarLVPKUB2ue+qcsmb1NQheGrEC
         /EAOGVkzCYOVkcFsq7r8rAgS3IC6RfqKR+HYH/xIJXVIBGAZJ1f0Pce3tZhORdX8YQGm
         NuSi6XCsL7GAznMi1W/N09sRqhU4bfAKEQL6fQ6laVoT8bOgwmsBlOW7InoY03GBwlFF
         YD7mZ2xOaO9YM8m6dJ9O89N2v/w2AJ6keC7KLS/gz9WowB8oryTKA/flFwf7/oCtzRIa
         SQsbLk6oTfQSUgqLZOf3wppRURciBBkDuYadjW6ix8KZ0BVo5dJBYm0B5ytRc+zBZotI
         +FRQ==
X-Forwarded-Encrypted: i=1; AKwUvByio0+pp6zLOT7gB4FbGZ9YrXiFO6gg8jH+a10r7DkOa/JWGWIsAThIcvwcTAhU9fc8CXiL8A==@lists.linux.dev
X-Gm-Message-State: AFq9FYJfbn4vCRneUdeQ/5SkNGTV7Z/5wLKBQ5BuVdX1XjMjjHWhGmfv
	/rCShNSXO0F2tWzK1S4hRjoQSLV9LZ5h4QtgGoBaCB+T/6b89N1N6c2ornI9S58QOyM=
X-Gm-Gg: AYBFou1kj8QAweEoMG02BRfZXydU4ArZlYPp7yRHFwn1OZdPj740YWrbs4hKfNiw6XU
	pJ3qx0dtt254WCk4YBdRCUYGJCMGwgUNuxNTO+pWhhGvhsNzJoAtxtYqP3gf2c687Hrj2u4SpwS
	uW6gkNbho8bkZykZTwYJcI1zC16VhieAQ+F4Mg1iBY5KI1VyFkU7VkC3NAmGakUZ07CREPZm+1T
	4rb8q3ynAT/q5aCqbh0stHHmMMHyUFOTGsn6vqrYyxP5RjA/ws4ieL/Iozaa+JLAV+tIOD326g2
	ViAtjmciW3lCskNc1kIcNVyg6g6iYHkVRFOt2TjrPWoRgKQjtNnd5xQ35ACLmbSeLT4WYYsm0j8
	AJPwYhsab5iZAJ2Uc1Nzwrm5ttuH9YFqOYV9dZSoxSkQSxWyDGK0GGmIM/+E9/TB1kWOfLxVnVj
	mC58r7kcJqWwS+/Wt1qiFB4KeB27B62xuWa7LY0V5z127OIMzrRBS8EXV0byQHh0sfp8WD9j4PE
	ggrjTRmk79xRV8g88jmUx+qHFCFrm7qF1HWwCvXAaTvy2tdLtio9BscAn5FPpSzDNQaj4qfConQ
	4nIWtAiK9VyGjHAWdrG63B01sbkffwYYBnxCuOMfeRe/ruRTPBbDGHN3OwakkIXGXg==
X-Received: by 2002:a17:90b:3b42:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ae57e357damr1827225a91.6.1793196297939;
        Wed, 28 Oct 2026 07:04:57 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc90d74sm4080559a12.20.2026.10.28.07.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:04:57 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: dxdt@dev.snart.me
Cc: anmuxixixi@gmail.com,
	exfat@lists.linux.dev,
	hyc.lee@gmail.com,
	linkinjeon@kernel.org,
	sofine.ljm@gmail.com
Subject: [PATCH 3/7] fsck: fix missing line ending in error messages
Date: Wed, 28 Oct 2026 22:04:37 +0800
Message-Id: <20261028140437.2287517-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027080628.82069-3-dxdt@dev.snart.me>
References: <20261027080628.82069-3-dxdt@dev.snart.me>
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

>  		exfat_bitmap_set(exfat->alloc_bitmap, clus);
>  
>  		if (exfat_get_inode_next_clus(exfat, node, clus, &next)) {
> -			exfat_err("ERROR: failed to read the fat entry of root");
> +			exfat_err("ERROR: failed to read the fat entry of root\n");
>  			goto out_trunc;
>  		}
>  
> @@ -1790,7 +1790,7 @@ static int rescue_orphan_clusters(struct exfat_fsck *fsck)
>  	/* build a template dentry set */
>  	err = exfat_build_file_dentry_set(exfat, name, 0, &dset, &dcount);
>  	if (err) {
> -		exfat_err("failed to create a temporary file in LOST+FOUNDn");
> +		exfat_err("failed to create a temporary file in LOST+FOUND\n");
>  		goto out;
>  	}
>  	dset[1].dentry.stream.flags |= EXFAT_SF_CONTIGUOUS;

Hi David,

I found two more error messages that are missing a trailing newline:

  defrag/defrag.c:
  exfat_err("memory run out in %s", __func__);

  lib/libexfat.c:
  exfat_err("ERROR: failed to read the fat entry of root");

Thanks.
