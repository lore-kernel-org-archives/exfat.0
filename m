Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559550;
	b=SmqTLxBRa5TrlYAHCkhiX+BL8+qQlBEm20ivA8GtPWgKatdVGgeRFMFJzBQqq0iE6tsM
	 LojhMfgd4IxhK5jiymm81Vc1MWkcHlh1M1EDqhdo6K1TT7l6EUw1qzPxm6ZU0vGXqtePL
	 SgFCBG7ZZIpyyLIhPFGA/uCJvWbnG13U24wj7sgKM8Cg9tiNG356aZR4LKg2+25/D2Faa
	 TspwB7hInrYNZbWW/4EnOAIFP0CeUWV3iaG18ba3HKTTunabuS0CjvBpDWQfI1h3+7Igu
	 ppZfeS3inyk32hf1FRtJVt4br/RjYthj2naFRkK/KlOYceGW6DNvdilKjgsQ9JTnpXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559550;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=+uM+ZJu79iI/GTnBz7rZQfjffm0TQRskgZytweI8nI8=;
	b=3lLqFeOFwG/VacOwmGeUFyGgn0psWE376WkqtNNqE5856tPRroi8SupcLXlCEfFWA5Y6
	 HXNSMaQn//MyAPKZ1DwpoXo6orKKOWabcOYd94ClUUeAzkFBY2U9WP05TTQqIOoD5XNmW
	 QWYNuRfQZccWWwwUtGiD/VNS2Ti8mjE79n3m3++7KmOydpMVBnmI97VQ9QZ0wwLtAdA4E
	 iX3H9L47h2THRXDfVAfZhD6IStVnrEjOD4PXiDubBML0T+yVklEIHmPHnbh1QFFdMjiJZ
	 RRbxxS5h7X38MKP9fdtonrFKHmQ4l4/mc1qo2fbjmuAEl/WC7rnJKqcfNiUHNQFprHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KW1FINwp;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9930E606A889
	for <exfat@lists.linux.dev>; Fri, 13 Nov 2026 08:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9930E606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KW1FINwp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=+uM+ZJu79iI/GTnBz7rZQfjffm0TQRskgZytweI8nI8=;
	b=KW1FINwpzed/XI8006sAlC6zQtBeRL+G16OYeQQfHbd39a6W1zJ8hIJ2/szfh3
	wKryEDG1T9LmSJMBXWzAff09xS8mPPA8vxOkVzBImS6Gu//DhOzzvqhDipeZq8RZ
	rMWOgZybUytPUjZsDjwrRjvTtgStR1WZhTOZ4Z2sxnkT8=
Message-ID: <6e7fd20e-918a-49cd-9634-78fc01249825@163.com>
Date: Fri, 13 Nov 2026 16:45:25 +0800
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
Subject: Re: [PATCH 1/2] exfat: fix iomap mapping when writeback races with
 truncate
To: Youling Tang <youling.tang@linux.dev>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>
Cc: Yuezhang Mo <yuezhang.mo@sony.com>, exfat@lists.linux.dev,
 linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
 stable@vger.kernel.org
References: <20261113080658.2440516-1-youling.tang@linux.dev>
 <20261113080658.2440516-2-youling.tang@linux.dev>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20261113080658.2440516-2-youling.tang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3v74lzvZqbKqMGw--.46913S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFWfAFykZFyxCFWkZw43ZFb_yoW8CFW8pr
	Z8K3WrKF43Xa47uF4rWrs8Zw1Fv3Z7KF1UXw4F93y5u34DtF1SkF9F9Fy5u3W3Jw4kCF40
	qFZ5Kr17WwnrCFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Us18PUUUUU=
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC+AYVsmr2ziZguAAA31

On 11/13/26 4:06 PM, Youling Tang wrote:
> From: Youling Tang <tangyouling@kylinos.cn>
> 
> __exfat_iomap_begin() reads i_size twice: once to detect a range that
> starts beyond EOF, and once to clamp the mapping to EOF.  A concurrent
> truncate can shrink i_size between the two reads, so the clamp can
> produce a negative length.  The unsigned cluster index subtraction then
> underflows, making exfat_map_cluster() believe it has to allocate a huge
> number of clusters and report a hole.
> 
> Fix this by reading i_size once for both the EOF check and the
> block-aligned clamp.
> 
> Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>

Looks good to me:

Reviewed-by: Chi Zhiling <chizhiling@kylinos.cn>

> ---
>   fs/exfat/iomap.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
> index 4e6f3ed9dcc8..11823591b3a8 100644
> --- a/fs/exfat/iomap.c
> +++ b/fs/exfat/iomap.c
> @@ -51,8 +51,10 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
>   	bool balloc = false;
>   
>   	if (!may_alloc) {
> +		loff_t isize = i_size_read(inode);
> +
>   		/* Completely beyond EOF. Treat as hole */
> -		if (i_size_read(inode) <= offset) {
> +		if (offset >= isize) {
>   			iomap->type = IOMAP_HOLE;
>   			iomap->addr = IOMAP_NULL_ADDR;
>   			iomap->offset = offset;
> @@ -61,9 +63,8 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
>   		}
>   
>   		/* Clamp length if the requested range goes beyond i_size */
> -		if (offset + length > i_size_read(inode))
> -			length = round_up(i_size_read(inode),
> -					  i_blocksize(inode)) - offset;
> +		if (offset + length > isize)
> +			length = round_up(isize, i_blocksize(inode)) - offset;
>   	}
>   
>   	num_clusters = exfat_bytes_to_cluster_round_up(sbi,

