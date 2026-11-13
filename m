Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564371;
	b=drw9P7JwFQXRf686m8Dqb5IjuGzSXoUhfPG+/DQQ52gjLBOUFjdOrqtHXP4AfozRWJut
	 PgUVUZr7lCtE83+6zWS8VxH1jifm5m3L1Ij7GftSzKMMl1YgZ0SbK6tfpOngrLmuqm1pJ
	 9A/cpLBMOUnzWKhExKiTnmr99pa8DD9YRqGnEwnKajhR1Bb0irt79a05XEOUgHC3Vp+Mi
	 JK7zaX2nJsUpoGWLzbUT5iajFgCT/7CqDdpf8VOuPiDjXasbGrXpud4jt/YM5Our9/Twe
	 r6l/aJU/OEgX4up2KJ/V3hD696r+y7EPupxXbkTyMEAgtPt5NTPdgdYJmdbPfPOCRqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564371;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=px/1buHh7TMXhFEIrqiyErLcAOiPn6wL2fWet4+iHOY=;
	b=xFIj/o6QE20Ajsb1LhSpzX3mNYiBpYNebQ452hUiKeWuq3vcLvMKXeJgHZUP7Q8ar3kf
	 1VYmg73N5mN7Wbjn2EaWx05s+mMhfGwmd9BhyLQVlLQNImJJXv/ZfNi/bSVSFDpHq5+xL
	 Yj5bljMjbAkfkCfvoOhK0apezIgfOWAeLdIzqyPbT7OMwNDAqZr+xsJv6Y2l3Xve+mGnB
	 Mgn0wjNRz6VWcd9/ZgB89JTf1ox4UmJkn8ER0hhij4CsJumiWE+q0Rvw3avG+Lwg+0lXw
	 jFSN2Xm9ydNsXeliNbLTVeuIbW/pGVLyHnR3zGPU+EsGZyH9ZEaH4WLAvuBAnnbPD1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LJGw1WEN;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41900606A886
	for <exfat@lists.linux.dev>; Fri, 13 Nov 2026 10:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41900606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=LJGw1WEN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=px/1buHh7TMXhFEIrqiyErLcAOiPn6wL2fWet4+iHOY=;
	b=LJGw1WEN4suwGDDsgi+I6m9gDhFjjOCA+VvXQK9GFlniRKdcCxoUVXKvL16o0h
	Lhw9IJuGzD/iPLjMhhVqSRj254imJM9OiUmoCbO6kMQU2Ayjc78mZKhHvoJqsPFC
	rYzubECKLJFILU4MBXz3du7+E0h7kO3R01hoa8PItCgJk=
Message-ID: <25aefd4f-8d1f-48b6-8915-86079cd19ed7@163.com>
Date: Fri, 13 Nov 2026 18:05:41 +0800
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
Subject: Re: [PATCH 2/2] exfat: don't map EXFAT_EOF_CLUSTER as a physical
 cluster
To: Youling Tang <youling.tang@linux.dev>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>
Cc: Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev,
 linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
 stable@vger.kernel.org
References: <20261113080658.2440516-1-youling.tang@linux.dev>
 <20261113080658.2440516-3-youling.tang@linux.dev>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20261113080658.2440516-3-youling.tang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3Hzz14PZqyY2jHQ--.32088S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFW5JF18Kr1xZw1rtryfXrb_yoW5CF4fpw
	4DK3W5tFsxJa9rWr43XF1DX34Fkw1fKF48Jwn7Gr15GF90vr40kryqk3Wa9wn8Gw48CF1q
	qr1Fgw17u3sxCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UVMKtUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+BfNa2r24PfV-wAA3o

On 11/13/26 4:06 PM, Youling Tang wrote:
> From: Youling Tang <tangyouling@kylinos.cn>
> 
> exfat_map_cluster() reports a hole by returning success with
> *clu == EXFAT_EOF_CLUSTER for !create.  __exfat_iomap_begin() does not
> check that sentinel and converts it into a physical address far beyond
> the device.  A writeback that races with the i_size/i_blocks window in
> exfat_cont_expand() can hit this: it submits a bio past the end of the
> device, and fsync() or msync() returns -EIO.  If the resulting iomap
> length is zero, iomap_add_to_ioend() can loop on a zero-length bio and
> hang a concurrent truncate.
> 
> When a range starts before the end of the cluster chain but extends past
> it, exfat_map_cluster() returns the sentinel for the whole range.  Map
> the valid prefix first and only report the part beyond the chain as a
> hole.  Otherwise a writeback that straddles the end of the chain would
> skip valid dirty data.
> 
> Report the remaining range as a hole instead of turning the sentinel
> into an address, matching the old exfat_get_block() behavior.
> 
> Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> ---
>   fs/exfat/iomap.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
> index 11823591b3a8..d6b420f615d4 100644
> --- a/fs/exfat/iomap.c
> +++ b/fs/exfat/iomap.c
> @@ -74,6 +74,22 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
>   	iomap->bdev = inode->i_sb->s_bdev;
>   	iomap->offset = offset;
>   
> +	if (!may_alloc) {
> +		unsigned int ondisk_clusters =
> +			exfat_bytes_to_cluster(sbi, exfat_ondisk_size(inode));
> +		unsigned int clu_offset =
> +			exfat_bytes_to_cluster(sbi, offset);
> +
> +		/*
> +		 * exfat_map_cluster() returns the EOF sentinel for the whole
> +		 * range if it extends past the cluster chain.  Map the valid
> +		 * prefix first so the hole only covers the part beyond it.
> +		 */
> +		if (clu_offset < ondisk_clusters &&
> +		    num_clusters > ondisk_clusters - clu_offset)
> +			num_clusters = ondisk_clusters - clu_offset;
> +	}

It would be better to put this handling in exfat_map_cluster().

Thanks.

> +
>   	err = exfat_map_cluster(inode, exfat_bytes_to_cluster(sbi, offset),
>   			&cluster, &num_clusters, may_alloc, &balloc);
>   	if (err == -ENOSPC && !(flags & IOMAP_DIRECT)) {
> @@ -90,6 +106,19 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
>   	if (err)
>   		goto out;
>   
> +	/*
> +	 * exfat_map_cluster() reports a hole by returning success with
> +	 * EXFAT_EOF_CLUSTER.  Return it as a hole instead of turning the
> +	 * sentinel into a physical address.
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

