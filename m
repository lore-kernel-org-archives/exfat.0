Received: from embla.dev.snart.me (embla.dev.snart.me [54.252.183.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5414123E35F
	for <exfat@lists.linux.dev>; Mon,  7 Sep 2026 03:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.252.183.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788751316; cv=none; b=B9XjquSBFRIOal7isBf66uiTCpFe46+m6uWVRytBJoCL5oUUW3/JK/118SURTIxLhJBo4ViZdKcpD1EyokTdoontta75Iy0fMrlk6/vHmIvut7kwG8NrEOldY1fjri2KEDahBYj+lC/jVLXtTvrTDJ7DTqYYAajt1LW86ABxJUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788751316; c=relaxed/simple;
	bh=ySylN1SmJ6aK0bzf/drbZfZ5VBFujZEv7/WjT4uLgEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iXH2DfQh1dAChHFQ2Ra0sdmnU5uVFh6zj0+puCV3KUznHTvgikjU4d/JZZLfrb5GQ6DLiehAM1r4JJuLwvuPEai3q3RmCmYv/XzO4PLSNX5Fnoqyr3cSrSyhzpkxFcgxjqOBjuZc9IR4UlJco0UfFwGUp9u6lZFRs4DK4qq+vIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me; spf=pass smtp.mailfrom=dev.snart.me; dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b=abmp/aap; arc=none smtp.client-ip=54.252.183.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.snart.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=dev.snart.me header.i=@dev.snart.me header.b="abmp/aap"
Received: from embla.dev.snart.me (localhost [IPv6:::1])
	by embla.dev.snart.me (Postfix) with ESMTP id 181241D452;
	Mon,  7 Sep 2026 03:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 embla.dev.snart.me 181241D452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dev.snart.me; s=00;
	t=1788751308; bh=ySylN1SmJ6aK0bzf/drbZfZ5VBFujZEv7/WjT4uLgEM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=abmp/aaprc87o518fN3qgyx88JNYaL702xe6RglZbQUueQBDIJbxx0f/6206FTVyk
	 VjqGJvD63xLpb4EkVnxMJF32wCI+AaZTgON8UNL+Y3RT22ZCd946kauipAFYkbemGT
	 w2NGqvVQzrj4RMsIQNNwdi3a4foaprXuVq0AZDbk=
Received: from [192.168.1.18] ([182.226.25.243])
	by embla.dev.snart.me with ESMTPSA
	id SKcbLsotnmrbIgYA8KYfjw
	(envelope-from <dxdt@dev.snart.me>); Mon, 07 Sep 2026 03:21:46 +0000
Message-ID: <0eb35731-1d8f-4f46-9a0d-36a45ceccfb2@dev.snart.me>
Date: Mon, 7 Sep 2026 03:21:45 +0000
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] exfat: take bitmap_lock at the start of
 exfat_alloc_cluster()
To: Chi Zhiling <chizhiling@163.com>, exfat@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo
 <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Chi Zhiling <chizhiling@kylinos.cn>
References: <20260905054951.674766-1-chizhiling@163.com>
 <20260905054951.674766-3-chizhiling@163.com>
From: David Timber <dxdt@dev.snart.me>
Content-Language: en-US, ko
Autocrypt: addr=dxdt@dev.snart.me; keydata=
 xjMEYmJg1hYJKwYBBAHaRw8BAQdAf5E+ri1XLtjqYbZdHOyc8oS+1/XJ5bSlbx5WHXmVBZzN
 IERhdmlkIFRpbWJlciA8ZHhkdEBkZXYuc25hcnQubWU+wpQEExYKADwWIQQn/Jn96EMUaIoF
 X+T/ldyyrZpWaAUCYmJg1gIbAwULCQgHAgMiAgEGFQoJCAsCBBYCAwECHgcCF4AACgkQ/5Xc
 sq2aVmjJZwD8COjPlUwccrlRvbNQ6f87DWchtYO0o8W2DNRM3RLps0EA/jEhIbRV6AsyC8jr
 30Ut3aJ3/mO/6G4sLj7OvkEEBH0MzjgEYmJg1hIKKwYBBAGXVQEFAQEHQFpgtIgaByv9lIEY
 EmpavMO0pYjtu7TMJynwdnGYkN9LAwEIB8J4BBgWCgAgFiEEJ/yZ/ehDFGiKBV/k/5Xcsq2a
 VmgFAmJiYNYCGwwACgkQ/5Xcsq2aVmhFCwEA0kM9VyYB4bLCM7+SuXUUH+5Ec99Nj4RXxFad
 Key9GuwA/2BZK6bNyrLSfEk2JDRoskqf7OIL0wa6JOD5SrBnMe8E
In-Reply-To: <20260905054951.674766-3-chizhiling@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/26 05:49, Chi Zhiling wrote:
> From: Chi Zhiling <chizhiling@kylinos.cn>
>
> exfat_alloc_cluster() checks sbi->used_clusters against the total
> number of data clusters before acquiring sbi->bitmap_lock. A concurrent
> allocation can update sbi->used_clusters after the check but before
> the lock is acquired, making the check stale. This can allow the
> allocation to proceed even though there are not enough free clusters,
> causing it to fail partway through.
>
> Acquire sbi->bitmap_lock before checking sbi->used_clusters so that
> the free-space check and subsequent cluster allocation are serialized
> with concurrent allocations.
>
> Signed-off-by: Chi Zhiling <chizhiling@kylinos.cn>
> ---
>  fs/exfat/fatent.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/fs/exfat/fatent.c b/fs/exfat/fatent.c
> index a6728c361289..3c8bdc131f6f 100644
> --- a/fs/exfat/fatent.c
> +++ b/fs/exfat/fatent.c
> @@ -427,19 +427,22 @@ int exfat_alloc_cluster(struct inode *inode, unsigned int num_alloc,
>  	struct super_block *sb = inode->i_sb;
>  	struct exfat_sb_info *sbi = EXFAT_SB(sb);
>  
> +	mutex_lock(&sbi->bitmap_lock);
Speaking of which, I think we should do this as well:

diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 217d150652cf..238533982831 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -62,7 +62,9 @@ static int exfat_statfs(struct dentry *dentry, struct kstatfs *buf)
        buf->f_type = sb->s_magic;
        buf->f_bsize = sbi->cluster_size;
        buf->f_blocks = sbi->num_clusters - 2; /* clu 0 & 1 */
+       mutex_lock(&sbi->bitmap_lock);
        buf->f_bfree = buf->f_blocks - sbi->used_clusters;
+       mutex_unlock(&sbi->bitmap_lock);
        buf->f_bavail = buf->f_bfree;
        buf->f_fsid = u64_to_fsid(id);
        /* Unicode utf16 255 characters */


Because there's a short window of chance that stale data is returned to
userspace on NUMA systems. For example, if a shell script or a
multi-threaded process makes changes to the fs and pulls statfs() in
rapid succession, the kernel might give userspace a wrong impression
that the fs has been chnaged by other users when it's really just a
cache coherency issue.

Well, this happens all the time with CoW-based fs like btrfs and zfs.
But this is a traditional fs and people would expect generally the same
behaviour as FAT(which does the right thing by placing a lock before
counting clusters).

Davo
