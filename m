Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795424567;
	b=ZYPDNUPbparwhlNUDDEWU5bYIJoYCvqeDGEVnjCb0ZSZs4ZROPPET9CbXLauFwAq+13c
	 TnD7/YiFnzfDDlDfvKxeBnguiX1w5heJEg8mEKeA/WizFCwraBYd1/i8tfmUevZLF7dFt
	 w8Ej8n0XTB03u7bmKQmKHkTrftiYwxiyArtnSUfs2MUA3G3/yc41XlXTIcTbMvlUdCujz
	 7dh/+Mxx9ve4KAQgW2I+MUflsLj+kLMoKsP4lXPuP8r0k9k+e548z7CFqSNk93nEJJGjw
	 rbtXCr63y0c9toV0kezFRezhZMAQ6RhbtdufZohhEAjs2ST8KHElynQJCQuETJKa75Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Lk3ClGXLFeejrzB80QpDKmxthQvAkXy7kfjeBeRziuI=;
	b=vBtdQC/yGN88fNOdqJhhn4ygLsGoxfoaCQh3mEug9NvLf7ggyCb1gy4Ryy7EdT3xE3FI
	 dos27zy3wOnY4nATn5wxgUS7k56c5LAGNUjoMjjNVSFhvu6diI/8a/38p0BRviN1MNAkV
	 DBGqMAjsMlfJLYk7XgW9s58n6/6mriNq1IrwV8zuValZB7+a83mxDT4jyix9FY2bcaoQg
	 yycIo7KmjKHd2bLeWS5QQwU19lI2fY2/dwAlWYkOeJleDMC3Bgntbjv6vmupkedYMQ2Ee
	 CJ5IVE0XUzcWZPLxi+ElS2fIjTfniClKZZErXYv35UaVTchDt4f689oEn/foc+yR9MQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=izNEyt2X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74086606A335
	for <exfat@lists.linux.dev>; Mon, 23 Nov 2026 09:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74086606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=izNEyt2X
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b546061d58so6860649c88.1
        for <exfat@lists.linux.dev>; Mon, 23 Nov 2026 01:02:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795424566; cv=none;
        d=google.com; s=arc-20260327;
        b=YPw0N3TT4XIA+lqt4mqfyQnFRGd1qkR2NJDIa42jSiZIle9dzVfxshxUJI8ljHzq1n
         Iwltd66jou6myYVPC9Gf+n3hgwh2VDLPJYoJds7OCqEFAadqD8aTpXM6l1LX1MijBIuj
         cut4K7S0rCpL0MDCa947O9sjZ/BMWiwQ/xSfL72EjXBlkCahTkVjIiPq04i1SvS2sIrI
         RT+8PtHMFkcH1RoiNHjyYZNMBzNbBcAdwLjneToYhytugeq9zV+nCeZX2GqXEzu1EBth
         UfaV6xY6hrvDQ0BLecEjim21ljSZ1PVh/vpFNkogKBA6RgcluisGjPxhThx2JZXY9b3u
         yyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Lk3ClGXLFeejrzB80QpDKmxthQvAkXy7kfjeBeRziuI=;
        fh=ILQ3+jNBc6vUDuNhWObnDjXwjidecyShQ/6y8zh0Gtg=;
        b=SXsM2QfUAM9Le5ab34HygFU4bbQEONZr1GWHvObOeECzKAN+X2PnCfo0yXnba+rSq+
         NAiffh4ZhQ7JbyU0DfomFbU8ubyUx3cJ/cb4SucSS44t40s6OOgh4r0CIeJu2+PqJ6am
         QVF3xiCXKiUwkvIO7PXgCmMCap+CGIHKry/RuMOXvXPB1Z5TMs+gMpZdQY4qLZWZdZmb
         jNvif+byqy9MOPfIG5WTKH5sAIQkHPA1DrqoJ7C9Er8ZPlRySokEDaZpH3Mlkt+54PWe
         8SDq/87ZNi1riK0UekYZCkw2pYXqAsWrDDGg/H6Z2B/gvpQ5N0Kv8z7jNGr6LM9Pg51p
         xIIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795424566; x=1796029366; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lk3ClGXLFeejrzB80QpDKmxthQvAkXy7kfjeBeRziuI=;
        b=izNEyt2XjC5rZnMvG9LqkEqFy7Wv2Y/dUnRjegZVsJ1gBJn4P2pWQkNBiFzf1cfy+r
         cLIWH26OStiBMqCHUyN6Q/S5wbeWjMG8O7nlUpBugWJMDAB8L5WD9r0WapSeoP+zLlDK
         lRMkUrWsVFO0xt+hmYt9OnkzH/ZBCbSQnQff+dtrooNCXXEJtB2IGZazQSRy6SnZKPE4
         p3exc8xk3LPF+xPghIecRMcSkFJPs6dA4ERsa3Uxope1rDlWzLsKGxvvR3ETBAB0Eapy
         WOzYZ0DsJ7az6mhWLRdDNRtzBV3LJInPGt4wSrbcq4o11WxJ4dzE+84mm2HwpPXf+Era
         zs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424566; x=1796029366;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lk3ClGXLFeejrzB80QpDKmxthQvAkXy7kfjeBeRziuI=;
        b=MeJ6ExFkeVgoKZ8vRZv/h9vxfTfgm7H4cbUFnk8FQEuuMjedmoMF5WErAuBt7KA+5Z
         1CunzsKHiHgimn7tn5wi2+5YGTtpXcWE9z1gjPND5Jvxu9xAaVpLX+6QLwXBjU4ZhanS
         TdsC3/Gf6CdvisGhjuF6b246NWEUw6/m80phgdNAl4yPbivvqu040Q64QMsAD40euwnm
         ylOty1RaN/jaQ5bc7dCRJDR1LVntN70iqpUsDNjDXIdq5PZuIF438uFT30wHBFmJa0pY
         WxdnRx0pdWeofK1aUHGUuSsB8YBCLm84kPTvturczoc2M7xPL6zZ+Pd0Qb5wCF5vVt31
         uHsA==
X-Gm-Message-State: APuU4Z9ZyuDcyfFGfl3Z+xT+NX4Y7Yw+Z/FWF+5ioBDuAT1CLTkzKkwk
	uiVByOah8pL6s+PRYvQW3dJll+/Axp28u3PdeNtqgMgxBRJDnEQ4prq2lIWqDZPyEl1gt/Yc3OB
	iNcAiVSEz3NVdqrMOsVoScqLdEe0bZw7uVxM6Zpwi
X-Gm-Gg: AZFdTZeiUIt4zhsALYhk4w9ZMBHfRpZQ4mnOLsABmXipc1Z7rf9F01sS3sy86JJ8K+d
	0ss+GBohyDkQDAxIOohdX7aBQp6LJg6sZlCIoDV1uAAJVcYUW6Pfyj30CVNUKjIM/gOwixBEU38
	T3+aJnVdB/QNTYeGfFMFnZpOavPckG6mv1sVVHM+U3kkPKzejdw2satIHN11sZ6ZZWwm4OjZimV
	DFebYSmxT1/INPv7GdJg4Y6Rp3aCtlktCzzkoTv6bk3J4kWQjm3Iz3ks6QO6NHWeEPWI1yzejGL
	BSuq1vWdq5cRfrTKeGyuXux4Fo/izxgoYDlCi7f3+7lG9nl7/SQBDP0gwcFfjBsQQ97/S1aeuaw
	igNcaBZ/cxqVgAjsWQBI2PAx4i9h1f/bpbhmnoon4LKLN79ZoVbpRGRMhfRuwvdTkjcB4
X-Received: by 2002:a05:7301:3f0a:b0:384:8f9:bbf6 with SMTP id
 5a478bee46e88-3857180d3b2mr18589586eec.38.1795424565611; Mon, 23 Nov 2026
 01:02:45 -0800 (PST)
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <6b039d4a.a481e175.27cf24.0013.GAE@google.com>
In-Reply-To: <6b039d4a.a481e175.27cf24.0013.GAE@google.com>
From: Marco Elver <elver@google.com>
Date: Mon, 23 Nov 2026 10:02:08 +0100
X-Gm-Features: Aa3M54ryWW6E5eniKyIB92OCNHEPzmjvoG_MICiuqBpgAvPnFl_YAqPfawxIrG8
Message-ID: <CANpmjNPn5BRZsm0KLgt6hyN-St-B5xsuwhN4CNgc7dbvxBxOvw@mail.gmail.com>
Subject: Re: [syzbot] [exfat?] KCSAN: data-race in copy_folio_from_iter_atomic
 / fat12_ent_put (6)
To: syzbot <syzbot+c1b4f0f31099fb2324e2@syzkaller.appspotmail.com>
Cc: exfat@lists.linux.dev, hirofumi@mail.parknet.co.jp, linkinjeon@kernel.org, 
	linux-kernel@vger.kernel.org, sj1557.seo@samsung.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 02:56, syzbot
<syzbot+c1b4f0f31099fb2324e2@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    f802b6558eb8 Merge tag 'xfs-fixes-7.4-rc4' of git://git.ke..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17d97cd5580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=886d2ddd2d6b664e
> dashboard link: https://syzkaller.appspot.com/bug?extid=c1b4f0f31099fb2324e2
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/2b34daaac71e/disk-f802b655.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/1e58ec148c51/vmlinux-f802b655.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/465e72cdcb06/bzImage-f802b655.xz
>
> AI-generated root cause summary:
> fat12_ent_put() in fs/fat/fatent.c modifies FAT table buffer_head data
> (fatent->bhs[0]->b_data and, for block-spanning entries, fatent->bhs[1]->b_data)
> without acquiring lock_buffer(). Because block device writeback
> (blkdev_writepages() -> block_write_full_folio() / write_dirty_buffer()) relies
> on lock_buffer() to synchronize buffer modifications against in-flight write
> bios, fat12_ent_put() can overwrite bh->b_data concurrently while the block
> driver (here loop1 via lo_rw_aio() -> shmem_file_write_iter() ->
> copy_folio_from_iter_atomic()) is reading the buffer for an ongoing writeback
> I/O.

>  CPU 0 (vfs_write -> fat12_ent_put)       CPU 1 (writeback -> loop1 -> shmem)
>
>                                           __block_write_full_folio(folio)
>                                             lock_buffer(bh)
>                                             test_clear_buffer_dirty(bh)
>                                             __bh_submit(bh, REQ_OP_WRITE)
>                                               -> queued to loop1 (BH_Lock held)
>
>  __fat_alloc_clusters()
>    fat_ent_read_block() -> sb_bread()
>      // bh is already uptodate; returns bh without waiting on BH_Lock
>    fat12_ent_put(&fatent, FAT_ENT_EOF)
>      spin_lock(&fat12_entry_lock)
>      // bh->b_data[0x18] = 0xff (low 8 bits of new)
>      *ent12_p[0] = new & 0xff;
>                                           loop_workfn() -> lo_rw_aio()
>                                             shmem_file_write_iter()
>                                               copy_folio_from_iter_atomic()
>                                                 memcpy(dst, bh->b_data, 1024)
>                                                 // reads new ent12_p[0], old ent12_p[1]!
>      // bh->b_data[0x19] = (old & 0xf0) | 0x0f
>      *ent12_p[1] = (*ent12_p[1] & 0xf0) | (new >> 8);
>      spin_unlock(&fat12_entry_lock)
>      mmb_mark_buffer_dirty(bh, ...)
>                                           // Torn 12-bit FAT12 entry written to backing
>                                           // shmem file (or checksum mismatch if
>                                           // BLK_FEAT_STABLE_WRITES is enabled)

> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=c1b4f0f31099fb2324e2
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c1b4f0f31099fb2324e2@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KCSAN: data-race in copy_folio_from_iter_atomic / fat12_ent_put
>
> write to 0xffff8881074bf418 of 1 bytes by task 4984 on cpu 0:
>  fat12_ent_put+0x74/0x180 fs/fat/fatent.c:168
>  __fat_alloc_clusters+0x571/0xdc0 fs/fat/fatent.c:542
>  fat_alloc_chain+0x25/0x30 fs/fat/fatent.c:610
>  fat_add_clusters fs/fat/inode.c:109 [inline]
>  __fat_get_block fs/fat/inode.c:156 [inline]
>  fat_get_block+0x276/0x650 fs/fat/inode.c:191
>  __block_write_begin_int+0x459/0x1070 fs/buffer.c:2043
>  block_write_begin fs/buffer.c:2157 [inline]
>  cont_write_begin+0x4af/0x6c0 fs/buffer.c:2519
>  fat_write_begin+0x52/0xf0 fs/fat/inode.c:233
>  generic_perform_write+0x198/0x510 mm/filemap.c:4407
>  __generic_file_write_iter+0x9e/0x120 mm/filemap.c:4524
>  generic_file_write_iter+0x77/0x1f0 mm/filemap.c:4550
>  new_sync_write fs/read_write.c:575 [inline]
>  vfs_write+0x57a/0x9b0 fs/read_write.c:667
>  ksys_write+0xdc/0x1a0 fs/read_write.c:719
>  __do_sys_write fs/read_write.c:730 [inline]
>  __se_sys_write fs/read_write.c:727 [inline]
>  __x64_sys_write+0x40/0x50 fs/read_write.c:727
>  x64_sys_call+0x154e/0x2550 arch/x86/include/generated/asm/syscalls_64.h:2
>  do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
>  do_syscall_64+0x11e/0x3a0 arch/x86/entry/syscall_64.c:89
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> read to 0xffff8881074bf400 of 1024 bytes by task 33 on cpu 1:
>  memcpy_from_iter lib/iov_iter.c:85 [inline]
>  iterate_bvec include/linux/iov_iter.h:123 [inline]
>  iterate_and_advance2 include/linux/iov_iter.h:306 [inline]
>  iterate_and_advance include/linux/iov_iter.h:332 [inline]
>  __copy_from_iter lib/iov_iter.c:261 [inline]
>  copy_folio_from_iter_atomic+0x73a/0x1050 lib/iov_iter.c:491
>  generic_perform_write+0x34b/0x510 mm/filemap.c:4425
>  shmem_file_write_iter+0xc5/0xf0 mm/shmem.c:3701
>  lo_rw_aio+0x6e9/0x7a0 drivers/block/loop.c:-1
>  do_req_filebacked drivers/block/loop.c:-1 [inline]
>  loop_handle_cmd drivers/block/loop.c:1847 [inline]
>  loop_process_work+0x569/0xb00 drivers/block/loop.c:1882
>  loop_workfn+0x31/0x40 drivers/block/loop.c:1906
>  process_one_work kernel/workqueue.c:3495 [inline]
>  process_scheduled_works+0x582/0xab0 kernel/workqueue.c:3578
>  worker_thread+0x56c/0x770 kernel/workqueue.c:3659
>  kthread+0x248/0x2a0 kernel/kthread.c:436
>  ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 1 UID: 0 PID: 33 Comm: kworker/u8:1 Not tainted syzkaller #0 PREEMPT(lazy)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
> Workqueue: loop1 loop_workfn
> ==================================================================
> netdevsim netdevsim1 netdevsim3 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> netdevsim netdevsim1 netdevsim2 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> netdevsim netdevsim1 netdevsim1 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> netdevsim netdevsim1 netdevsim0 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> bond0 (unregistering): Released all slaves
> hsr_slave_0: left promiscuous mode
> hsr_slave_1: left promiscuous mode
> veth1_macvtap: left promiscuous mode
> veth0_macvtap: left promiscuous mode
> veth1_vlan: left promiscuous mode
> veth0_vlan: left promiscuous mode
> netdevsim netdevsim4 netdevsim3 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> netdevsim netdevsim4 netdevsim2 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> netdevsim netdevsim4 netdevsim1 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> netdevsim netdevsim4 netdevsim0 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
> bridge_slave_1: left allmulticast mode
> bridge_slave_1: left promiscuous mode
> bridge0: port 2(bridge_slave_1) entered disabled state
> bridge_slave_0: left allmulticast mode
> bridge_slave_0: left promiscuous mode
> bridge0: port 1(bridge_slave_0) entered disabled state
> bond0 (unregistering): (slave bond_slave_0): Releasing backup interface
> bond_slave_0: left promiscuous mode
> bond0 (unregistering): (slave bond_slave_1): Releasing backup interface
> bond_slave_1: left promiscuous mode
> bond0 (unregistering): Released all slaves
> hsr_slave_0: left promiscuous mode
> hsr_slave_1: left promiscuous mode
> batman_adv: batadv0: Interface deactivated: batadv_slave_0
> batman_adv: batadv0: Removing interface: batadv_slave_0
> batman_adv: batadv0: Interface deactivated: batadv_slave_1
> batman_adv: batadv0: Removing interface: batadv_slave_1
> veth1_macvtap: left promiscuous mode
> veth0_macvtap: left promiscuous mode
> veth1_vlan: left promiscuous mode
> veth0_vlan: left promiscuous mode
> team0 (unregistering): Port device team_slave_1 removed
> team0 (unregistering): Port device team_slave_0 removed
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller-bugs/6b039d4a.a481e175.27cf24.0013.GAE%40google.com.
