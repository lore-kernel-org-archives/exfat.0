Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200289;
	b=Ri3xUUk8DnTG6hV91wLs7BMdep7RWYnlzzaE/SQLAPLidbg0TuD4UFCnWOy8+HvmsIiI
	 D9yyIMAkxdLpIezcvQeask202Nss6gUZd/Qyt2OgUrX9nT9wdnLKpBCwHzkY76D3+6vug
	 y1pqTn8rDh51x4CuEN+InLQ1w2C/8gq7G8Ogg7ORsl7ei+KMwtSS3sR07TvrMcT80UGdM
	 EnzTnQjavByWDpU9+fXSqzqs+9YqO8sNehPQeDDDxrVGHcz1RLXrLTw+P0HexkEQHirdI
	 JKOBhgmZYMrK65MErERRubi07vlvyZyZDxDrPToIVwwp3Q5mRlb26gc/+pNV7IY91Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200289;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=lacHYqEjJlwosHfLuG1/kiohUbNdRq8f8HWgCZEhgFqJPf8B9hXeGUCjsBJXl/YtRqmq
	 aflkgpYmLufvBqBHjcMgjiemPUiZ/FlAb0MWgDCtbdWeMA1UaW48rHSaD6rKJFNMLnL5Z
	 PWZVIOfHCU6CzlcQIhS2JPoMD3Isvj7x0xYsV/NR4DEcg66GSEgqWxkfV2jnlmplHoYwX
	 3o3/FywuCMiNeGlXwD9Fad27t3AgonifqjB7qgO0gQ4+vpoW5VkO/3SU6dsiG53p4UOvm
	 TvVb1hJX5aJeXDdc7awizT9acw7e8j927p/vFiWpiy1DqSlNDLZTeJPIBmt90QIa67Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lst.de;
	spf=pass smtp.mailfrom=lst.de;
	arc=none smtp.remote-ip=213.95.11.211
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3589C606A31C
	for <exfat@lists.linux.dev>; Wed, 28 Oct 2026 15:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3589C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A326768AFE; Wed, 28 Oct 2026 16:11:24 +0100 (CET)
Date: Wed, 28 Oct 2026 16:11:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chi Zhiling <chizhiling@163.com>
Cc: linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Chi Zhiling <chizhiling@kylinos.cn>
Subject: Re: [PATCH v3 1/8] iomap: export iomap_bio_read_folio_range_sync()
Message-ID: <20261028151124.GA16906@lst.de>
References: <20261016033349.3104509-1-chizhiling@163.com> <20261016033349.3104509-2-chizhiling@163.com>
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016033349.3104509-2-chizhiling@163.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

