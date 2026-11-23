Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398988;
	b=UCEz7TJ3FDh48jlJp/kNwha2W0tSwvcwVSW/Tt2ZpByTCV45NcaXzS7WI8c3VWonEU2l
	 jWORTsByR5NFICA3dvYXJJPlB12aJNwZm/gL5PrxFaovvPP8eg0KytKIE2l2Nvl9qgpRX
	 zAzYIhhozdsy8QSZepSSfcQlBh18Qca2aMKMsN3mQjzQ7+crOiaDNWF8Bx5PoN+iQ8p8F
	 9fqkDPVsLKd0Gr9fK4OTVmFC6gPP4SX3z72qpnkDsT52a3w2jTdMkUVShmz2VQ9ez9Mb/
	 EX4lF9klBT7z5wWuenPMvK1i9WC8+qUns1CCiYx/ZrfxEFbdtA6boiWNWHDJUrWMMXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398988;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=SlyZxZgV2CPF6b52Gh9ylOu+uEyo7tAUBf4kSjBUq8w=;
	b=jegwWXexccYIwSWjmGPS/gKhqtFPfhWjwP/csntONMJeWz79PrYnOz2BppP43WmihuJC
	 R5p4/C2xrh3k+Ceoo9oEqFuNbmfN7ov6EzLyLAmDAim3hZNyJs/447y1n2wPy017BQ/KB
	 4SdLIOBGQ+HXO2A2G+CgYFBs2X2mGffEnpCkgz2NL8ZPI4Sql0mCxkA632YhMnPAw337/
	 sMNNxWFcztvD6FPv2jHeAXdOdA3xGZQWDsGYJk6AiGHWicsV4m3+X82yycxwZrDZnSK8R
	 hF939nM3n/7dVXlopZE7gjlSr87jr3F1oUjompIOytZUyQtj93L6UsbUYNtjuZa4vmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF01D606A31E
	for <exfat@lists.linux.dev>; Mon, 23 Nov 2026 01:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF01D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8632a144987so1232445a34.2
        for <exfat@lists.linux.dev>; Sun, 22 Nov 2026 17:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398987; x=1796003787;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlyZxZgV2CPF6b52Gh9ylOu+uEyo7tAUBf4kSjBUq8w=;
        b=zoeWeQ9sjCeGSLc5APEI2GO8fwWtjdWTUFDvQ2VX5btlXHj+oc3wIrpYA1t8owT+em
         atS8Ti7LtP6MF7uAzDRvMP5gY2Svg+BlIjOw2M0duJS2UHRo+128dyYwKh4/1VmNanRr
         Y295OIgT5Ag4uIRx8FJjaY4rMdZt4eZtA+BxHd0jeHhpmj5bq4kGePdCX7KIGOSb5cJ+
         BFOFY9GnS4y5M8MY6CN+x2j3LxzpPSXsBbWDcodqSPAvQ0MZ+fN+8Rm3rs9Q08v6Tuce
         WaE8Wb0Hq+I3BhFEhJAupkyilgj4ERE7qfDEnZsBbEpLKyvkZOvyOFdb5UEMsDGjW79g
         Y8cg==
X-Gm-Message-State: APuU4Z+aSgZ4IZI7g/INHXrp7kEo/MadZAZ4e1B2KdJLpAqCFhDKDm+s
	zrxtuS39cHzakXhXzWO7HDD3fsrUPSFbhlvmk1BaSxsKNxr0pdRfBsFW4mPfc0WFcVAB+4Lf1in
	Ic6x2QibvTbChGb05o2G7VqENajKfmewyAeziXQnI/Z0VJ9jKN+gcfOEsezQ=
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Post: <mailto:exfat@lists.linux.dev>
List-Help: <mailto:exfat+help@lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
List-Owner: <mailto:exfat+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:130a:b0:573:7a6b:f32c with SMTP id
 5614622812f47-57a0c4b923bmr9672777b6e.50.1795398986911; Sun, 22 Nov 2026
 17:56:26 -0800 (PST)
Date: Sun, 22 Nov 2026 17:56:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b039d4a.a481e175.27cf24.0013.GAE@google.com>
Subject: [syzbot] [exfat?] KCSAN: data-race in copy_folio_from_iter_atomic /
 fat12_ent_put (6)
From: syzbot <syzbot+c1b4f0f31099fb2324e2@syzkaller.appspotmail.com>
To: exfat@lists.linux.dev, hirofumi@mail.parknet.co.jp, linkinjeon@kernel.org, 
	linux-kernel@vger.kernel.org, sj1557.seo@samsung.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f802b6558eb8 Merge tag 'xfs-fixes-7.4-rc4' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17d97cd5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=886d2ddd2d6b664e
dashboard link: https://syzkaller.appspot.com/bug?extid=c1b4f0f31099fb2324e2
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2b34daaac71e/disk-f802b655.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1e58ec148c51/vmlinux-f802b655.xz
kernel image: https://storage.googleapis.com/syzbot-assets/465e72cdcb06/bzImage-f802b655.xz

AI-generated root cause summary:
fat12_ent_put() in fs/fat/fatent.c modifies FAT table buffer_head data
(fatent->bhs[0]->b_data and, for block-spanning entries, fatent->bhs[1]->b_data)
without acquiring lock_buffer(). Because block device writeback
(blkdev_writepages() -> block_write_full_folio() / write_dirty_buffer()) relies
on lock_buffer() to synchronize buffer modifications against in-flight write
bios, fat12_ent_put() can overwrite bh->b_data concurrently while the block
driver (here loop1 via lo_rw_aio() -> shmem_file_write_iter() ->
copy_folio_from_iter_atomic()) is reading the buffer for an ongoing writeback
I/O.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=c1b4f0f31099fb2324e2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c1b4f0f31099fb2324e2@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in copy_folio_from_iter_atomic / fat12_ent_put

write to 0xffff8881074bf418 of 1 bytes by task 4984 on cpu 0:
 fat12_ent_put+0x74/0x180 fs/fat/fatent.c:168
 __fat_alloc_clusters+0x571/0xdc0 fs/fat/fatent.c:542
 fat_alloc_chain+0x25/0x30 fs/fat/fatent.c:610
 fat_add_clusters fs/fat/inode.c:109 [inline]
 __fat_get_block fs/fat/inode.c:156 [inline]
 fat_get_block+0x276/0x650 fs/fat/inode.c:191
 __block_write_begin_int+0x459/0x1070 fs/buffer.c:2043
 block_write_begin fs/buffer.c:2157 [inline]
 cont_write_begin+0x4af/0x6c0 fs/buffer.c:2519
 fat_write_begin+0x52/0xf0 fs/fat/inode.c:233
 generic_perform_write+0x198/0x510 mm/filemap.c:4407
 __generic_file_write_iter+0x9e/0x120 mm/filemap.c:4524
 generic_file_write_iter+0x77/0x1f0 mm/filemap.c:4550
 new_sync_write fs/read_write.c:575 [inline]
 vfs_write+0x57a/0x9b0 fs/read_write.c:667
 ksys_write+0xdc/0x1a0 fs/read_write.c:719
 __do_sys_write fs/read_write.c:730 [inline]
 __se_sys_write fs/read_write.c:727 [inline]
 __x64_sys_write+0x40/0x50 fs/read_write.c:727
 x64_sys_call+0x154e/0x2550 arch/x86/include/generated/asm/syscalls_64.h:2
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x11e/0x3a0 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff8881074bf400 of 1024 bytes by task 33 on cpu 1:
 memcpy_from_iter lib/iov_iter.c:85 [inline]
 iterate_bvec include/linux/iov_iter.h:123 [inline]
 iterate_and_advance2 include/linux/iov_iter.h:306 [inline]
 iterate_and_advance include/linux/iov_iter.h:332 [inline]
 __copy_from_iter lib/iov_iter.c:261 [inline]
 copy_folio_from_iter_atomic+0x73a/0x1050 lib/iov_iter.c:491
 generic_perform_write+0x34b/0x510 mm/filemap.c:4425
 shmem_file_write_iter+0xc5/0xf0 mm/shmem.c:3701
 lo_rw_aio+0x6e9/0x7a0 drivers/block/loop.c:-1
 do_req_filebacked drivers/block/loop.c:-1 [inline]
 loop_handle_cmd drivers/block/loop.c:1847 [inline]
 loop_process_work+0x569/0xb00 drivers/block/loop.c:1882
 loop_workfn+0x31/0x40 drivers/block/loop.c:1906
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0x582/0xab0 kernel/workqueue.c:3578
 worker_thread+0x56c/0x770 kernel/workqueue.c:3659
 kthread+0x248/0x2a0 kernel/kthread.c:436
 ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 UID: 0 PID: 33 Comm: kworker/u8:1 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
Workqueue: loop1 loop_workfn
==================================================================
netdevsim netdevsim1 netdevsim3 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
netdevsim netdevsim1 netdevsim2 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
netdevsim netdevsim1 netdevsim1 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
netdevsim netdevsim1 netdevsim0 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
bond0 (unregistering): Released all slaves
hsr_slave_0: left promiscuous mode
hsr_slave_1: left promiscuous mode
veth1_macvtap: left promiscuous mode
veth0_macvtap: left promiscuous mode
veth1_vlan: left promiscuous mode
veth0_vlan: left promiscuous mode
netdevsim netdevsim4 netdevsim3 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
netdevsim netdevsim4 netdevsim2 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
netdevsim netdevsim4 netdevsim1 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
netdevsim netdevsim4 netdevsim0 (unregistering): unset [1, 0] type 2 family 0 port 6081 - 0
bridge_slave_1: left allmulticast mode
bridge_slave_1: left promiscuous mode
bridge0: port 2(bridge_slave_1) entered disabled state
bridge_slave_0: left allmulticast mode
bridge_slave_0: left promiscuous mode
bridge0: port 1(bridge_slave_0) entered disabled state
bond0 (unregistering): (slave bond_slave_0): Releasing backup interface
bond_slave_0: left promiscuous mode
bond0 (unregistering): (slave bond_slave_1): Releasing backup interface
bond_slave_1: left promiscuous mode
bond0 (unregistering): Released all slaves
hsr_slave_0: left promiscuous mode
hsr_slave_1: left promiscuous mode
batman_adv: batadv0: Interface deactivated: batadv_slave_0
batman_adv: batadv0: Removing interface: batadv_slave_0
batman_adv: batadv0: Interface deactivated: batadv_slave_1
batman_adv: batadv0: Removing interface: batadv_slave_1
veth1_macvtap: left promiscuous mode
veth0_macvtap: left promiscuous mode
veth1_vlan: left promiscuous mode
veth0_vlan: left promiscuous mode
team0 (unregistering): Port device team_slave_1 removed
team0 (unregistering): Port device team_slave_0 removed


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
