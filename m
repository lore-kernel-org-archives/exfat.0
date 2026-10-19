Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65B78F3A
	for <exfat@lists.linux.dev>; Mon, 19 Oct 2026 00:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792369665; cv=none; b=dQmZ9Gy4JfrPbpM7J+ZG6qacbcw5/FJLoLziFngfxRIw27BWixgzOO9cDlfqX8hwnW3ByyZAKTtI0vSw68UkyVWSQeDYKUowyKrh2vns7OUBUOHXHW3f6FZV2Sve3xMZB7nhG6q89dAYTIGtUcB0Yv4ET88hzwYrDlLzR5wAAvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792369665; c=relaxed/simple;
	bh=S2BuCT8vrXcSX80BDR8vuTJjPj2nwSr44cgWfv5XQWw=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=bcsTRi0wGRbrS4xzhOGs7XLxCtNeqjJW6sh68g7UQgKAxsdbf4GOSq2CDA1UmSXQZxvwgGveDBq5aM/quzNg0Hiq9ukIKvvWlrKtbIsYe5qDAjbcN8mvuV7dQMWgmEA/Sp7s4cv8fxG5R1HBK6mTNmATXHSfm5g48VGHsOYEOxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net; spf=pass smtp.mailfrom=ownmail.net; dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b=OIjrm/ft; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GcCipEZF; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b="OIjrm/ft";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GcCipEZF"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 5532B1D00157
	for <exfat@lists.linux.dev>; Sun, 18 Oct 2026 20:27:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sun, 18 Oct 2026 20:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1792369662; x=1792456062; bh=wagZ2kpg0I42Aa8NojAx9uNACNEzPv0d841
	rMVoSetc=; b=OIjrm/ftyZ6cwIPcRFDS/CEXkx6L02zaosAmIoQA4DUr+lYBrlY
	3zqACkmA9nn0I0HbHazblj4Y5Onebc4Fx3waWBSYL24HFI5irORHB36GUXQu0k8g
	NhzUyMvhIndJtRCXHKMhNc1eoJcExQgbtOqODW3uMcwqyZ8hjeTw1LAawMQQYrwk
	jaL4dekdZxtzpAsUUMgfKhW5bhGEvWkNi6zQ72stJ9XQ7C8Rpysim243Le2dWw7p
	U3MRxOWpJydIQ9x2QM3sfSwWT9dqT6M4dZOPAiy5NedypfTwUBNWvrDHg8pzRDWI
	cbRwSK02Nmm5cPaVvTkPEjdREdgbQhxxlbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792369662; x=
	1792456062; bh=wagZ2kpg0I42Aa8NojAx9uNACNEzPv0d841rMVoSetc=; b=G
	cCipEZFMsPNF7Qg5jyeqdRgeCP+J7DAkOFMuaSjvtjprbGSQ6k/gAm1wdn0L70ni
	MAoRoYsxY3+SpV4B83L+b20ZrC8eJFkAhK6DarKTqfc0FIpy9gW/Es72rxKD563S
	X2bXf8IMzoxwH6HCttLHOb5ZbGo8zA4gbSK6pM96YByzga+XJlhOiNt1LbH17JZR
	lXHTPic99HDQgQ7Bzw37nM2Ja+iDf9aeVR8icFPHajpnUFg42RTdIbZe7XymGXCC
	xtFbNEDFN4XvBYx1BksspRU0kmHQv92/JLtUpkrVi3jXj8lEo0lhSUat+ruwRFNB
	FRAHNy6fOuOrvJ6rZxzlg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792369662; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGV4ZmF0QGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:k1CTPgWUmRzg5hy4M9x6J/hcMQcaXIsm2PA8HCJ2tsR7MfB
	XLNVXd6ZzScxc2vyrwqFeXYX1/0ey5sjTPCNUzB21wCV+FLq8H5hoZs8CwdFGPE7
	XDPQnS2RCIu6tl4O6XdSVokVMgM9R7pn/cwv8ugAL4upjmaPj6GxC8G4QOQ81Is4
	UBLYdrFAIE+ylPGt4ZAUyqIgKDHtpa1weBXGehQ9/XuJ8fsoDIqHT0JJLUA7ybW2
	99VXCifYEAX6A2WMSdmksgIekP3CwscsH5nWo36Rz/H48wytnce6Q4XsKR4dH4Pu
	l8ZcRMx4NVPMAlk8wQRsSxH/Pj3lLMEWIK6ZASA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:RLjG1R7xNc7zu2tXn4sGlBVB5LCC+qgAwiSXkKlpuhM=:S2BuCT8vrXcSX80BDR8vuTJjPj2nwSr44cgWfv5XQWw=;
X-ME-Sender: <xms:_mPVailF9bPa7otWrXhC6RrtZU0SqjHhTCSKHpJXpzI38wX1gDaLpg>
    <xme:_mPVaqi2DNo5Yyqmec2JoK9ubIIseOvh_EHhOuySfNdf9uPNvegXPNwKOeI-rfufS
    YKnxgFoeH8H8rgBOvmrILTxlOjtIu5LfquUIL-56tCk9bhDdw>
X-ME-Received: <xmr:_mPVau2JGZ7uKTfDnovjLJk8BFVfuGxDm_gPgvSgGs7OlURpLeYt4ldB8GrukrHcH2a1IIsbnsFbInV03M35X3UKX2r7qi8>
X-ME-Proxy-Cause: dmFkZTERuWF55eriIFBhNWD3Fl/LHXaGoXHVO6ggL5rf88r+62iqbwOviomxIJ8JMqlV03
    NS31p6GXnXjx72fr1ccPDYFOEPGgS3mAfBlvnsc2Rj0YUa3SEaEp/YicgkEILmKQRFDDVE
    VSLCm+H11zg3f7PiPy9+ZGlCYK+m2LtxEXy9P4e0abpwg4iVqpQFn3OlB3USPHo0IqctqF
    /lgeCyuErKwC7J/HHdRReXDHoVg1U4GXZt9UAzikN/Lk0n45BQ3fsyuzbGWIlZ7qfznYqe
    AfjswReqVrt5qo/d21qcQTB2YmBN9c6dqFWoccf8KXFLLZ5cBsnd5jJFDhyGHFIRgnwdgw
    z3f6OGyvsvDBhrbPwqcp9aRNfxU9eXwP0zGgsiI+6HK0EWzdERLI+2McRqV2PIStXjEcSO
    WAw2NnfbhCOYlzgHHDAOVf5Nt8jGqFUdyyYPzi7SBOyWrTfS9VVmw5w256TcRAYyxY2Fss
    /vNp4MNkEd5K/dQUHba2fjg0jS/cnrqQPwCorl+aXhhzvktgd/2oUZIZbak0s1NEd1b11s
    cRBrg/8SNv8MgNtaiPoMu569D9Y+YOJ5Ch8383NPd78RbHl8LrTIasghT0dA2uI79pE/nX
    O0gog0Dy3sj0E4xvvcudGN1nI73puygvTdkBb7huy57pmO1ZLQz9mqPF7i/g
X-ME-Proxy: <xmx:_mPVarIHlEG4n20ZV1O2BEQsnhNyYvw8ibvQRKUQ-3iVnRRd4oI29g>
    <xmx:_mPVamyO49JTenoNalr2R2JIOSe3FG0qN4P9xs8TCve49H-GpAG-Bg>
    <xmx:_mPVahWn0b7TJCmILobC2-iVzODHHXd3U19hoM2Q5DyNOIGv_vkjMA>
    <xmx:_mPVaui_SWz3JQ4zN0qAl2MpwyCQXKZqibiitz9KSz4ZsK3tGG7M_A>
    <xmx:_mPVakWn9xVxM0Xn3dqRzDYoaco_sBxfbd_HwKPbg57r8E90IdrxdbOF>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 20:27:39 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Yang Wen" <anmuxixixi@gmail.com>
Cc: linkinjeon@kernel.org, sj1557.seo@samsung.com, chizhiling@163.com,
 yuezhang.mo@sony.com, exfat@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Yang Wen" <anmuxixixi@gmail.com>
Subject:
 Re: [PATCH v3 1/3] exfat: add a Bloom filter for negative name lookups
In-reply-to: <20260902152455.1273557-2-anmuxixixi@gmail.com>
References: <20260902152455.1273557-1-anmuxixixi@gmail.com>
  <20260902152455.1273557-2-anmuxixixi@gmail.com>
Date: Mon, 19 Oct 2026 11:27:37 +1100
Message-id: <179236965769.1724252.18375265650538798223@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Thu, 03 Sep 2026, Yang Wen wrote:
> Negative name lookups scan a directory from the beginning. Repeating this
> scan before creating each file makes bulk creation approach O(N^2).
>=20
> Add a 64 KiB per-directory Bloom filter. Build it lazily after a directory
> reaches 1024 on-disk entries. A definite miss skips the directory scan,
> while a possible match follows the normal lookup path so hash collisions
> cannot affect correctness.
>=20
> Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
> ---
>  fs/exfat/dir.c      | 140 ++++++++++++++++++++++++++++++++++++++++++++
>  fs/exfat/exfat_fs.h |  13 ++++
>  fs/exfat/inode.c    |   1 +
>  fs/exfat/namei.c    |   6 +-
>  fs/exfat/super.c    |   1 +
>  5 files changed, 158 insertions(+), 3 deletions(-)
>=20
> diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
> index fe73b1380c5d..5145f09bcee6 100644
> --- a/fs/exfat/dir.c
> +++ b/fs/exfat/dir.c
> @@ -8,6 +8,8 @@
>  #include <linux/bio.h>
>  #include <linux/buffer_head.h>
>  #include <linux/filelock.h>
> +#include <linux/hash.h>
> +#include <linux/stringhash.h>
> =20
>  #include "exfat_raw.h"
>  #include "exfat_fs.h"
> @@ -65,6 +67,140 @@ static int exfat_get_uniname_from_ext_entry(struct supe=
r_block *sb,
>  	return 0;
>  }
> =20
> +static u32 exfat_name_filter_hash(struct super_block *sb,
> +				  const struct exfat_uni_name *name)
> +{
> +	unsigned long hash =3D init_name_hash(NULL);
> +	int i;
> +
> +	for (i =3D 0; i < name->name_len; i++)
> +		hash =3D partial_name_hash(exfat_toupper(sb, name->name[i]), hash);

You want 3*19 or 57 bits of hash.  I wonder if this is the best way to
get that from an upper-case file-name.  On a 32bit host you are already
limiting yourself to 32 bits, even with long names.

I'd probably try to make each of the three hashes from different
characters in the name.  So one from bytes 0,3,6,...  One from 1,4,7,...
and one from 2,5,8,...

I suspect that getting 57 useful bits from an upper-case file name is
unrealistic and you could reduce EXFAT_NAME_FILTER_ORDER without losing
effectiveness of the filter.  Have you done any analysis to see how much
range you are actually getting from these hash calculations?

> +
> +	return end_name_hash(hash);
> +}
> +
> +static void exfat_name_filter_indexes(struct super_block *sb,
> +				      const struct exfat_uni_name *name,
> +				      unsigned int indexes[3])
> +{
> +	u32 hash =3D exfat_name_filter_hash(sb, name);
> +
> +	indexes[0] =3D hash_32(hash, EXFAT_NAME_FILTER_ORDER);
> +	indexes[1] =3D hash_32(hash ^ 0x9e3779b9U, EXFAT_NAME_FILTER_ORDER);
> +	indexes[2] =3D hash_32(rol32(hash, 16) ^ 0x85ebca6bU,
> +			     EXFAT_NAME_FILTER_ORDER);

I'd like to see some explanation for these magic numbers.


The idea seems sound, but I think the hash algorithm should be justified
better.

Thanks,
NeilBrown


> +}
> +
> +void exfat_name_filter_free(struct inode *inode)
> +{
> +	struct exfat_inode_info *ei =3D EXFAT_I(inode);
> +
> +	kvfree(ei->name_filter);
> +	ei->name_filter =3D NULL;
> +}
> +
> +bool exfat_name_filter_maybe_contains(struct inode *inode,
> +				      const struct exfat_uni_name *name)
> +{
> +	struct exfat_inode_info *ei =3D EXFAT_I(inode);
> +	unsigned int indexes[3];
> +
> +	if (!ei->name_filter)
> +		return true;
> +
> +	exfat_name_filter_indexes(inode->i_sb, name, indexes);
> +	return test_bit(indexes[0], ei->name_filter) &&
> +	       test_bit(indexes[1], ei->name_filter) &&
> +	       test_bit(indexes[2], ei->name_filter);
> +}
> +
> +void exfat_name_filter_add(struct inode *inode,
> +			   const struct exfat_uni_name *name)
> +{
> +	struct exfat_inode_info *ei =3D EXFAT_I(inode);
> +	unsigned int indexes[3];
> +
> +	if (!ei->name_filter)
> +		return;
> +
> +	exfat_name_filter_indexes(inode->i_sb, name, indexes);
> +	__set_bit(indexes[0], ei->name_filter);
> +	__set_bit(indexes[1], ei->name_filter);
> +	__set_bit(indexes[2], ei->name_filter);
> +}
> +
> +/*
> + * Build a complete filter only after a directory becomes large enough for
> + * repeated negative linear lookups to matter. A filter hit is never trust=
ed:
> + * it only allows definite misses to skip the on-disk scan.
> + */
> +static void exfat_build_name_filter(struct super_block *sb,
> +				    struct exfat_inode_info *ei,
> +				    struct exfat_chain *p_dir)
> +{
> +	unsigned long *filter;
> +	struct exfat_chain clu;
> +	unsigned int clu_count =3D 0;
> +	struct inode *inode =3D &ei->vfs_inode;
> +	struct exfat_sb_info *sbi =3D EXFAT_SB(sb);
> +	int i;
> +
> +	if (ei->name_filter ||
> +	    exfat_bytes_to_dentries(i_size_read(inode)) <
> +					EXFAT_NAME_FILTER_MIN_DENTRIES)
> +		return;
> +
> +	filter =3D kvzalloc(EXFAT_NAME_FILTER_BYTES, GFP_NOFS);
> +	if (!filter)
> +		return;
> +
> +	exfat_chain_dup(&clu, p_dir);
> +	while (clu.dir !=3D EXFAT_EOF_CLUSTER) {
> +		for (i =3D 0; i < sbi->dentries_per_clu; i++) {
> +			struct exfat_uni_name name =3D { };
> +			struct exfat_dentry *ep;
> +			struct buffer_head *bh;
> +			unsigned int type;
> +			unsigned int indexes[3];
> +			int len;
> +
> +			ep =3D exfat_get_dentry(sb, &clu, i, &bh);
> +			if (!ep)
> +				goto abort;
> +
> +			type =3D exfat_get_entry_type(ep);
> +			brelse(bh);
> +			if (type =3D=3D TYPE_UNUSED)
> +				goto complete;
> +			if (type !=3D TYPE_FILE && type !=3D TYPE_DIR)
> +				continue;
> +
> +			if (exfat_get_uniname_from_ext_entry(sb, &clu, i, name.name))
> +				goto abort;
> +			for (len =3D 0; len <=3D MAX_NAME_LENGTH && name.name[len]; len++)
> +				;
> +			if (!len || len > MAX_NAME_LENGTH)
> +				goto abort;
> +			name.name_len =3D len;
> +			exfat_name_filter_indexes(sb, &name, indexes);
> +			__set_bit(indexes[0], filter);
> +			__set_bit(indexes[1], filter);
> +			__set_bit(indexes[2], filter);
> +		}
> +
> +		if (exfat_chain_advance(sb, &clu, 1))
> +			goto abort;
> +		if (unlikely(++clu_count > EXFAT_DATA_CLUSTER_COUNT(sbi)))
> +			goto abort;
> +	}
> +
> +complete:
> +	ei->name_filter =3D filter;
> +	return;
> +abort:
> +	kvfree(filter);
> +}
> +
>  /* read a directory entry from the opened directory */
>  static int exfat_readdir(struct inode *inode, loff_t *cpos, struct exfat_d=
ir_entry *dir_entry)
>  {
> @@ -992,6 +1128,8 @@ int exfat_find_dir_entry(struct super_block *sb, struc=
t exfat_inode_info *ei,
> =20
>  	if (num_entries < 0)
>  		return num_entries;
> +	if (!exfat_name_filter_maybe_contains(&ei->vfs_inode, p_uniname))
> +		return -ENOENT;
> =20
>  	dentries_per_clu =3D sbi->dentries_per_clu;
> =20
> @@ -1153,6 +1291,8 @@ int exfat_find_dir_entry(struct super_block *sb, stru=
ct exfat_inode_info *ei,
>  		ei->hint_femp.count =3D 0;
>  	}
> =20
> +	exfat_build_name_filter(sb, ei, p_dir);
> +
>  	/* initialized hint_stat */
>  	hint_stat->clu =3D p_dir->dir;
>  	hint_stat->eidx =3D 0;
> diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
> index a9131fe03302..5187dee47cf1 100644
> --- a/fs/exfat/exfat_fs.h
> +++ b/fs/exfat/exfat_fs.h
> @@ -120,6 +120,11 @@ enum {
>  #define DIR_CACHE_SIZE		\
>  	(DIV_ROUND_UP(ES_MAX_ENTRY_NUM << DENTRY_SIZE_BITS, SECTOR_SIZE) + 1)
> =20
> +#define EXFAT_NAME_FILTER_ORDER		19
> +#define EXFAT_NAME_FILTER_BITS		BIT(EXFAT_NAME_FILTER_ORDER)
> +#define EXFAT_NAME_FILTER_BYTES		(EXFAT_NAME_FILTER_BITS >> 3)
> +#define EXFAT_NAME_FILTER_MIN_DENTRIES	1024
> +
>  /* Superblock flags */
>  #define EXFAT_FLAGS_SHUTDOWN	1
> =20
> @@ -284,6 +289,8 @@ struct exfat_inode_info {
>  	struct exfat_hint hint_stat;
>  	/* hint for first empty entry */
>  	struct exfat_hint_femp hint_femp;
> +	/* Complete, in-memory Bloom filter of directory names */
> +	unsigned long *name_filter;
> =20
>  	spinlock_t cache_lru_lock;
>  	struct list_head cache_lru;
> @@ -619,6 +626,12 @@ int exfat_read_volume_label(struct super_block *sb,
>  int exfat_write_volume_label(struct super_block *sb,
>  			     struct exfat_uni_name *label);
> =20
> +bool exfat_name_filter_maybe_contains(struct inode *inode,
> +				      const struct exfat_uni_name *name);
> +void exfat_name_filter_add(struct inode *inode,
> +			   const struct exfat_uni_name *name);
> +void exfat_name_filter_free(struct inode *inode);
> +
>  static inline int exfat_chain_advance(struct super_block *sb,
>  		struct exfat_chain *chain, unsigned int step)
>  {
> diff --git a/fs/exfat/inode.c b/fs/exfat/inode.c
> index ccd13630187e..0d0c6f817775 100644
> --- a/fs/exfat/inode.c
> +++ b/fs/exfat/inode.c
> @@ -445,6 +445,7 @@ struct inode *exfat_build_inode(struct super_block *sb,
>  void exfat_evict_inode(struct inode *inode)
>  {
>  	truncate_inode_pages_final(&inode->i_data);
> +	exfat_name_filter_free(inode);
> =20
>  	if (!inode->i_nlink) {
>  		i_size_write(inode, 0);
> diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
> index a4dc83b5949c..96f33226f2c0 100644
> --- a/fs/exfat/namei.c
> +++ b/fs/exfat/namei.c
> @@ -526,6 +526,7 @@ static int exfat_add_entry(struct inode *inode, const c=
har *path,
>  	}
> =20
>  	info->entry =3D dentry;
> +	exfat_name_filter_add(inode, &uniname);
>  	info->flags =3D ALLOC_NO_FAT_CHAIN;
>  	info->type =3D type;
> =20
> @@ -802,7 +803,6 @@ static int exfat_unlink(struct inode *dir, struct dentr=
y *dentry)
> =20
>  	/* update the directory entry */
>  	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
> -
>  	err =3D exfat_put_dentry_set(&es, IS_DIRSYNC(inode));
>  	if (err)
>  		goto unlock;
> @@ -957,7 +957,6 @@ static int exfat_rmdir(struct inode *dir, struct dentry=
 *dentry)
>  	exfat_set_volume_dirty(sb);
> =20
>  	exfat_remove_entries(inode, &es, ES_IDX_FILE, true);
> -
>  	err =3D exfat_put_dentry_set(&es, IS_DIRSYNC(dir));
>  	if (err)
>  		goto unlock;
> @@ -1215,6 +1214,8 @@ static int __exfat_rename(struct inode *old_parent_in=
ode,
>  		ret =3D exfat_rename_file(new_parent_inode, &uni_name, ei);
>  	else
>  		ret =3D exfat_move_file(new_parent_inode, &uni_name, ei);
> +	if (!ret)
> +		exfat_name_filter_add(new_parent_inode, &uni_name);
> =20
>  	if (!ret && new_inode) {
>  		struct exfat_entry_set_cache es;
> @@ -1227,7 +1228,6 @@ static int __exfat_rename(struct inode *old_parent_in=
ode,
>  		}
> =20
>  		exfat_remove_entries(new_inode, &es, ES_IDX_FILE, true);
> -
>  		ret =3D exfat_put_dentry_set(&es, IS_DIRSYNC(new_inode));
>  		if (ret)
>  			goto del_out;
> diff --git a/fs/exfat/super.c b/fs/exfat/super.c
> index a9ea36ba2693..f73cf2d02365 100644
> --- a/fs/exfat/super.c
> +++ b/fs/exfat/super.c
> @@ -195,6 +195,7 @@ static struct inode *exfat_alloc_inode(struct super_blo=
ck *sb)
>  	if (!ei)
>  		return NULL;
> =20
> +	ei->name_filter =3D NULL;
>  	return &ei->vfs_inode;
>  }
> =20
> --=20
> 2.34.1
>=20
>=20

