Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199463;
	b=MLUUIoWXF9rUcXUKjbJ5C7ViFeL3YxBBU4hqGMIKWywzLpkMPwUP2gwkDZF4WMfxnH5l
	 n9pYcNHdNR3iDpo2LfbcjDWmZ07RAxvw6x7Bz/4DussteTbDlWof98BTCPk0LeVcx0VX+
	 RSZmIwTAEOZjIwOIU5Vc+ne7D0O3D16z8+rLyVgi8P18IYmqOr7N2JrT9b15gWURhk0Lz
	 VT2T8EK+UnTvr82WxSvNMgz/eYV9c+8Vi/tgI1duqRY3g2XhgAfCMU5h65zrjICagEc3H
	 mBVXTV0sC7rZV00Vo/b8j0GbYN8+6IGxB0HTlvnlH1/qHtTuBgApgDjO9KUBOLboWqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rc5w1F7Son7ubB9GUWhIyNDz9Q0K7WcSIc0D7UrpX5w=;
	b=NTjEsYe97FF9WZO5FBVr+hN4M/bxzTQ6LN2OFgnGrlVAqR3iPqecjHUwFrMQhu+WcQNC
	 DGM3ZPLWbeFqUywzYnua++QWGUllnjb9kBS6DTyMmJmbeTCxyVTBq/YYXWLI45zxTYMlY
	 8WHuK+qmw93btter3ay/M59rV5YggIel3gLgUj9s8yFqcDI+kpxAU+Hj27i8fe+ThCGUw
	 Mp1BtHqAuofprEKtS15zmRepS/yLm4DhWCydKZsuvDfab8MWSGFNZ4hGpistGAXnMPvqu
	 uts/YY/puW8f+6tyVWrCv7VqkoD3AsJP9fLL3TnPBSShkw5wRCH01qUTFR0Hg840Msw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBAPFMY0;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA2F606A31A
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 14:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CA2F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GBAPFMY0
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso510949b3a.2
        for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793199462; x=1793804262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc5w1F7Son7ubB9GUWhIyNDz9Q0K7WcSIc0D7UrpX5w=;
        b=GBAPFMY000hi9wKu4jiXxmgubiGbhUOzHDVWFP78xqqRgbfx1IJ9GMlGQN67xvYtZf
         LQzpRf0YJDj8Yg/KQKXoER3X2EIk+TWhse1WNk70vIrcz+as7Y0LQPk0/06F1FiIGC2Y
         uGdgj9wDnXU0BfuAPcOyMwNDtqtv25ccJV5vx7pchJ2/m0j9qTAwDZwqbIBJbdYQ90lJ
         f0niWbfPC4LJ0ztZgXuxq5kcawkXiuX3CxdVlTSpfCNIrqASgTxg6e7KP0p5ozfIRMgV
         j0toFOr25XCU3uq7SXfwThL7GVOVNzIorqyyO+VZI9aLkUDnetLgENSyv2XsUUh9lyrN
         T1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199462; x=1793804262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rc5w1F7Son7ubB9GUWhIyNDz9Q0K7WcSIc0D7UrpX5w=;
        b=nWl1TzrGMRcMdIPUCZac8NctCbRGQk0PRkmv/1J+NT4l2EY+Rd4S1c3fyX8hWJDyvr
         e2LsP7r73cYltahf6S0vGcS9dlOVu9aXwreVo/XdoSgjcH94QLobK2FAMfNSVlbMEZxu
         aE5/jKTB97E5Y9Nrp1hyf/hXbw58++FCVba59WqEB6su4PyKmPr6FYImcblJxlvP05Ie
         vVztEeAGwoT6YANeyzUHMb4NXzbaMTr4+j15NJ6FZBwmM/dCvYJvHXVeGvqhF9Rra0vb
         EMF82DWeu2S0KziOr6VTR46oQA8M1pvyE+pYO7ofV4T7W/tFfobRj7wHBsjAskA8B+Lh
         wi5g==
X-Forwarded-Encrypted: i=1; AKwUvBxtDon4QeYX/hgS5Q2/KtZPtuiRjFh3qZ+dSPmFiRVnnJngNXf1l45Mv36YTdXvoleCw24Ahg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKQjOL2dlBV29TZmF40RnsCLNfM4XCqy5/pAo2n6wTc2DEjiAjg
	aDc7SeD19+qledcl0TMe8PObUVUzTnCcU6sCJmOZbX8YSRWLDeNknsZFYr/dx3qy87Y=
X-Gm-Gg: AYBFou38bZKVqFLo1lmaUUo2HdoPoAR3g521c7enRaq8uEshEB6tHCp6U112grdKuZw
	yjixOvoipnpMiEKhJhj3ZtH0BM14Yr8cTI8Hs9mzlpEq/fm8eeq2eSLMHmslVEQHRSR60aGDdWZ
	XwEty0X7lpJ974EFCgD0a8YnpAehl0nU5ysqjR35sU+wuZ7KiM9P3WAaUsMdAlcFyUa+E1NyoEi
	ZtOMNU0JCX2is3G8Evhp2p3lpG1SSoR2DoIqPvpA+b6E0nyh/KuV9m8WitDEhInGIxHLU9Hldbw
	iijgdQ4iSd3Iy+puxgjflo2wSkKO/D11y2pBN/WZ1zw8rhgM0fHgkeWu+0pWwMcjKQiEkw9T8gT
	ZuE5syGgczS5UNFxE9ZUJRuORLn6YJZdKljZN9eQuo5fCFowgwFgMq9xgvthd2THH4vhMJTgbd/
	6OI2W36/xQwekISzDpSIEYiabjlKAcvF9nUawNwbqPAfugWAQX5LeNP004d2yXhcFpJdn0fLfox
	g74t7WAPzErozEGXatbWI/dV54ZzZrzH4yaIAlFdT1Ggh0BCn+LnWjccx7EoGlu06noWsY6Bmvt
	Yew+WplDa1iVOecLOkVx/z2791nceCrVhGiO63Jymb4=
X-Received: by 2002:a05:6a00:32cb:b0:88b:7712:6e21 with SMTP id d2e1a72fcca58-8a6e74da862mr2099968b3a.33.1793199462308;
        Wed, 28 Oct 2026 07:57:42 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a73c0e32sm1310597b3a.50.2026.10.28.07.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:57:42 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: dxdt@dev.snart.me
Cc: anmuxixixi@gmail.com,
	exfat@lists.linux.dev,
	hyc.lee@gmail.com,
	linkinjeon@kernel.org,
	sofine.ljm@gmail.com
Subject: Re: [PATCH 5/7] fsck: add test script for EIO handling
Date: Wed, 28 Oct 2026 22:57:25 +0800
Message-Id: <20261028145725.2311237-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027080628.82069-5-dxdt@dev.snart.me>
References: <20261027080628.82069-5-dxdt@dev.snart.me>
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

Hi David,

I tested this script on Ubuntu 22.04 and found a few portability and
prerequisite issues.

First, the script failed immediately after creating the loop device:

    Mapped file /tmp/tmp.WUyy32nDsS as /dev/loop6.
    Error looking up object for device /dev/disk/by-loop-inode/?d:?d-661642

The problem is this line:

> +declare -r LOOP="/dev/disk/by-loop-inode/$(stat -c '%Hd:%Ld-%i' "$IMG_FILE")"

The %Hd and %Ld stat format directives were introduced in GNU coreutils
9.0.  Ubuntu 22.04 has coreutils 8.32, with which the command produces
"?d:?d-<inode>".  The loop device itself is created successfully, but
the script passes a nonexistent path to udisksctl.

Could we avoid that coreutils version dependency by looking up the loop
device after udisksctl creates it?  For example:

    LOOP=""
    ...
    udisksctl loop-setup --file "$IMG_FILE"
    ec=$?
    if [ "$ec" -ne 0 ]; then
            exit "$ec"
    fi

    LOOP="$(losetup -j "$IMG_FILE" --noheadings --output NAME |
            head -n 1 | tr -d '[:space:]')"
    if [ -z "$LOOP" ] || [ ! -b "$LOOP" ]; then
            echo "FAIL: cannot find loop device for $IMG_FILE" >&2
            exit 1
    fi
    declare -r LOOP

This also avoids depending on the /dev/disk/by-loop-inode symlink and
uses the loop device that was actually created.

After working around that issue, the hash command failed as well:

    RHash: unknown option: --one-hash

The installed version is RHash 1.4.2.  It supports CRC32C, but does not
support --one-hash.  More importantly, the failure is hidden by the
command substitution assigned through declare, so HASH becomes empty.
The next hash calculation also produces an empty string and the test
incorrectly treats the two failed calculations as matching hashes.

This form works with RHash 1.4.2 and produces only the CRC32C value:

    dd status=none if="$1" skip=1 |
            rhash --printf='%{crc32c}' -

Also, -C selects CRC32 rather than CRC32C in RHash 1.4.2, despite the
comment saying that CRC32C is used.

Finally, the script later failed while creating the dm-dust mapping:

    device-mapper: reload ioctl on dustexfatbads0 failed: Invalid argument
    Command failed.

The kernel log gives the actual reason:

    device-mapper: table: dust: unknown target type

On this system:

    $ grep CONFIG_DM_DUST /boot/config-$(uname -r)
    # CONFIG_DM_DUST is not set

    $ modinfo dm_dust
    modinfo: ERROR: Module dm_dust not found.

dmsetup targets consequently does not list the dust target.  The script
currently documents the root requirement, but not the CONFIG_DM_DUST
requirement.  Could it check for the dust target before creating the
image and print a clear error or skip result?  Doing the prerequisite
checks before allocating, formatting and mounting the image would also
avoid spending time populating the filesystem when the test cannot run.

It would also be useful to install an EXIT/INT/TERM trap for cleanup.
Each of the failures above leaves the loop device and temporary image
files behind because cleanup is called only on the successful path.

Thanks.
