Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822043;
	b=0SCmWWpFfRr4viTs6KOGX+BqlONO2dThu6NsRVhDdONZwxJFMy/b2h4PWAdG0rsC4aeZ
	 lZuX3GkYb8B7HzZPttPlGQULFor9NN+YkVLfQzlyyNMCHUmfsEjbc3iO+RkG96TVc+RjF
	 nWQN2dFWXwSyDmQnMQ4woVdshkNdE7gQuawghWlkX9bQldU6bCI4+a49mRJS9HjVy53Sv
	 9r2uPY1CeXRBd6I8X9e+rhYeZKjP0K4IJgQwcdBOmADHFeoXjLdxewcie+2/Ny24XXTNN
	 CpdRqH1UwnVrzCuRkY4o6XPdxkVutkxCFxcYfYGcg8Pm/jqkqjJPxgmQEBPjdPgRiMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822043;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=cw+pySsu7+o6IOi/Owzk15zmHJR7nehgY37yG8amMMM=;
	b=L9zGPR7ll3rwidr4266kAHW0Whs5swfWTGPkMGWu5Nzzva8Nppm96aGkQ+Li0658m4BT
	 WqKZxP2qwkke4LEbhftP5Owmvyzi3K75mMk8kuL/ZwyilIv7+3O+ow27d9nkV74kB1Th5
	 pVSTJlKcgTzWdgN5oTHvqhhOUiN4c9TCy5HJEx0Snm/cJIE++RZcdMkVOLjhSpVeTGxZI
	 6wIwmfW6ScRAn0tNWhtvnk9n0gkJSxRBAbEkzwVmd611023HSLiIcl3RCb33fY3MOfANk
	 Ih1z6TRB0MfEnztb+iqLiXNgEPurESVn7d6DslW7stGQq1PtENZ62x340zryFgysVZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kKNLSkfs;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275C9606A31C
	for <exfat@lists.linux.dev>; Mon, 16 Nov 2026 09:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 275C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kKNLSkfs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=cw+pySsu7+o6IOi/Owzk15zmHJR7nehgY37yG8amMMM=;
	b=kKNLSkfszgtEcL2J25pQDfC8wnm2Tth5DI5jWUqlUeNQ6a3FalgoB+FwJvWdW/
	8v/VXVtJ7ktlP2TKRyB1ssqTWiDXTBuKy3BCE2FNdB4GkAxRFxghCQfX92ttn+iA
	y7VZD9X4IEJOGDyUwooghDquYGwEJ+sDVJki/KotU2sG0=
Message-ID: <fd9bc0a5-2bf7-4ab3-86ba-7267d99f74fd@163.com>
Date: Mon, 16 Nov 2026 17:39:52 +0800
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] exfat: don't map EXFAT_EOF_CLUSTER as a physical
 cluster
To: Youling Tang <youling.tang@linux.dev>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>
Cc: Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev,
 linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
 stable@vger.kernel.org
References: <20261116090720.3226446-1-youling.tang@linux.dev>
 <20261116090720.3226446-3-youling.tang@linux.dev>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20261116090720.3226446-3-youling.tang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PygvCgCnI5doz_pqQR8YGQ--.4620S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZry5WrW3CFWxCF4xGF1Dtrb_yoW5Kw1kpr
	srKa4rJrs8Jay7Wr4SgFs8Za4F93Z3KF4UJa1kKry5Gr90yr40gryqk3Wa9a1UGw4rCF4j
	qF1Y9w17uwnFkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Us18PUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9wlnBWr6z2lbFAAA3l

On 11/16/26 5:07 PM, Youling Tang wrote:
> From: Youling Tang <tangyouling@kylinos.cn>
> 
> exfat_map_cluster() reports a hole by returning success with
> *clu == EXFAT_EOF_CLUSTER for !create.  __exfat_iomap_begin() does not
> check that sentinel and converts it into a physical address far beyond
> the device.  A writeback that races with the i_size/i_blocks window in
> exfat_cont_expand() can hit this: the writeback submits a bio past the
> end of the device, and fsync() or msync() returns -EIO.  If the
> resulting iomap length is zero, iomap_add_to_ioend() can loop on a
> zero-length bio and hang a concurrent truncate.
> 
> When a range starts before the end of the cluster chain but extends past
> it, exfat_map_cluster() returns the sentinel for the whole range.  Make
> it map the valid prefix in that case, and return the sentinel only if
> the whole range is beyond the chain:
> 
>      offset         chain end       offset+len
>        |--- prefix ----|--- tail ---|
>        |== allocated ==|
>              MAPPED         HOLE
> 
> Reporting the whole straddling range as a hole instead would skip
> valid dirty data.
> 
> Report the remaining range as a hole instead of turning the sentinel
> into an address, matching the old exfat_get_block() behavior.
> 
> Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>

Looks good to me:

Reviewed-by: Chi Zhiling <chizhiling@kylinos.cn>

> ---
> v2: move the clamp into exfat_map_cluster().
> 
>   fs/exfat/inode.c | 15 ++++++++++++---
>   fs/exfat/iomap.c | 12 ++++++++++++
>   2 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/exfat/inode.c b/fs/exfat/inode.c
> index c1d15d4fc5e7..b175d2f3e459 100644
> --- a/fs/exfat/inode.c
> +++ b/fs/exfat/inode.c
> @@ -134,6 +134,9 @@ void exfat_sync_inode(struct inode *inode)
>    * Input: inode, (logical) clu_offset, target allocation area
>    * Output: errcode, cluster number
>    * *clu = (~0), if it's unable to allocate a new cluster
> + *
> + * For !create, *count is limited to the part of the range backed by the
> + * cluster chain; the caller reports the remainder as a hole.
>    */
>   int exfat_map_cluster(struct inode *inode, unsigned int clu_offset,
>   		unsigned int *clu, unsigned int *count, int create,
> @@ -153,9 +156,15 @@ int exfat_map_cluster(struct inode *inode, unsigned int clu_offset,
>   	    *count > num_clusters - clu_offset)
>   		num_to_be_allocated = clu_offset + *count - num_clusters;
>   
> -	if (!create && (num_to_be_allocated > 0)) {
> -		*clu = EXFAT_EOF_CLUSTER;
> -		return 0;
> +	if (!create && num_to_be_allocated > 0) {
> +		if (clu_offset >= num_clusters) {
> +			*clu = EXFAT_EOF_CLUSTER;
> +			return 0;
> +		}
> +
> +		/* Range straddles the chain end: map the valid prefix only. */
> +		*count = num_clusters - clu_offset;
> +		num_to_be_allocated = 0;
>   	}
>   
>   	*clu = last_clu = ei->start_clu;
> diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
> index 11823591b3a8..ed17b367f820 100644
> --- a/fs/exfat/iomap.c
> +++ b/fs/exfat/iomap.c
> @@ -90,6 +90,18 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
>   	if (err)
>   		goto out;
>   
> +	/*
> +	 * exfat_map_cluster() can return EXFAT_EOF_CLUSTER when racing with
> +	 * exfat_cont_expand().  Report it as a hole.
> +	 */
> +	if (!may_alloc && cluster == EXFAT_EOF_CLUSTER) {
> +		iomap->type = IOMAP_HOLE;
> +		iomap->addr = IOMAP_NULL_ADDR;
> +		iomap->offset = offset;
> +		iomap->length = length;
> +		goto out;
> +	}
> +
>   	cluster_offset = exfat_cluster_offset(sbi, offset);
>   	cluster_length = exfat_cluster_to_bytes(sbi, num_clusters);
>   

