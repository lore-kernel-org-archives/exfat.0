Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765857;
	b=hbP3vX6lD9gdCuHjweb1qsn4yLSDj8p4rM8noncffrAQJPOvWDSeqBN/6bg/pRW3jF4U
	 J+lDx7nhS+LTGjJp/xnK/391oZc7xSka4uJXAdTzo2kmpt1AHrF2igFPq5cGxOfe24ja9
	 nIDLx3qxsxOiw4J2ZKgnY/Ni3exbWIO4QNrUyZdmWFzAZ7bPjPyrt3+9qxGq832Ynceeh
	 nudn/v0e9Oyp+LqCVjWqX/DZSfxwdiGeUFw+W9LJaTnvT7/QDk74hecOxZV5KtRbdHVYL
	 3xfi48Xry883zRihauQ60C7v7aISEhms0g3AjzLh0aRuH2IoRxzHnplAyYmC3yf6Jbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xB0aGae+0N7Qh6IxNBA7KeNJxluraojMhTHNGzXsPds=;
	b=IvV3zjIGxy3FxlFAl47Wi4W5QSCIkMGYKfKpC9pPBLAvd2SBQZFv02nLDHZZwXOb2fGR
	 BHq0OtV3vroz9/QYEgjyni294k1WF99cd9Ls14Np6trPv62W2vegsGdT0ZBvQk4NJKeaq
	 s0WrzoT6odLkn/8MZP1CLpKSbPETL+xOt3lLaK6+rcIXE6ZF71cA7YMFqidEerjLx5mtd
	 8jiTf98qPd6eZcxAq+vwTUECSaFpL+wYxV+Ns/PUliVCspZmJii96ob+Iajyz8nMjQmfx
	 J/n8GVpcwLEKPWi2fQ1Mtq1r+m4q77KNN/KGaPAHF+Diz5z6chzCL8WODM7+gE7pK5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jeSqgxpn;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E8D60A5BEA
	for <exfat@lists.linux.dev>; Sun, 15 Nov 2026 18:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E8D60A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jeSqgxpn
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1962215f8f.0
        for <exfat@lists.linux.dev>; Sun, 15 Nov 2026 10:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765855; x=1795370655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB0aGae+0N7Qh6IxNBA7KeNJxluraojMhTHNGzXsPds=;
        b=jeSqgxpnal/0x6pVjtHxV1NYJdG0Bp6YBE4SMAnpNeM9UXzumqcmNPZJ8FJdGAFEqE
         vpZLcMbaR87IKfXqTsXzifn03FjgpBTpNejG8h7e6jtK5cQz7NITDUja2FITNCD9tO1k
         MxLePvoYxyJvdOfhq1dy50YBb1I0OCeDaGqFfjP3P0FXJkN23MvrHQkwZoy+Mzib+rqO
         gptcgzfDETx8MoPutZ9Y8w3w7LwO1bnIYALruTtYE3+kTH8eAw8PeWWfUTxYCjQKgTCV
         LaLhAxv7qOSOF6DNNxdfUkbaebLMKyVc2t+rJggCD3sTiGNPByA1udRv+iMNyJ9eAcZD
         x+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765855; x=1795370655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xB0aGae+0N7Qh6IxNBA7KeNJxluraojMhTHNGzXsPds=;
        b=KF2RC++iYjzskF9UQMoGRV2BMK67Sh78Xux62xUH6BcQGKegtHDy7UKJJImd9otppR
         5OCnqFigCg5ylEQu1agOuwrPpnqBLX8ESi31DIufD0CbEhwp1PsUQlDKfC0OGKn5Osa7
         EYxuR8iFivHxsfMkTpqLyZ73gSlNXsjWU1k6lVViYjRHNkEV+1UEZudhTOJU2VUcV3ki
         bBntS7FY8uuf+fiSXEJ2tkYUKTFIeQeLr5Ezjc6BDhcJ9Kp+wlF0uzo7vqbKK9QmMwxy
         VfcUMsprSmaKVQ4LA8KbGgHPPLl9cUmIWS3NGF61L34E6rMtOr253YpduCDeQBbG0mGD
         WO3Q==
X-Forwarded-Encrypted: i=1; AL+hErHRXjlg0vrjdABm126Lwm3jMiVO5+drRx3Z1093sberCZlUb6IQbtivEVDwYpmV+eSHTBwq9w==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ky17pLXfOAVMmK2P4UEazOvC8VdmtW5RYXL8ZRPzVDRE0MkZt
	JpYu0Hr/F+/jPQxE9NIlzblNyW0BjgGZsOWzrCIlHflWMmb41PwSODKa
X-Gm-Gg: AYBFou1tRP19EYZu82a97AIjokF/3gI/wisv2+458NBBdMsVSndiKpfzuYWL5fb0rYz
	TgrUQG5kIBcCejTjnyGltd0Iy6k53rLOqMQMmB4q5SxygP+zkDlifbK703/IChDmRll/tnE1t9m
	9PhW1B32T9xKqsITIqjzrS5NKv5rVQjuTcnFHRuQJZutBTrd+6aUkR/cMmXXBAa/sjXoPS1MmsE
	eKqZDX2snlN1m/xFVKUfS47s+yM5RmJk3VqDD6no3rKI1s/PmuI2tbEPOutPPCCi5hUtZ6hnjo7
	0p4P1GvY9xDS2BHc4n4YjGJY2Birq0MGChcook+991Kvn+XIRUKeyStGlavh2nZjpI5RHdxiUkn
	aLem0smwZUDx4JE4AWm15KxFkqgtv4+uMUvLYEa/dFdZcbBISLhoyXCXu296hx6/KuktyQhHwgl
	1ai3kn+q9PQ3YqrLE9U8fvgZHerXd5XoG59qYOPTTMZ2sg9QGjZ6Z+GsswhLXlQtzGJYFEgU4CG
	KXqbHK0apjA4O541bG1LF9UJvGs03PtjFLVgKkVUU90ojvXsqaRPB/N6+M7UB4UvV1a9HOLLRzJ
	0SS8a8tiwUAw0KWyN/Mrx4emq0TUKWzNIO+D7ejcuY2Ang==
X-Received: by 2002:a5d:5f90:0:b0:48e:7e15:406d with SMTP id ffacd0b85a97d-49c70de3563mr18264821f8f.11.1794765854474;
        Sun, 15 Nov 2026 10:04:14 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm17980448f8f.58.2026.11.15.10.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:04:13 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: David Sterba <dsterba@suse.com>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Paulo Alcantara <pc@manguebit.org>
Cc: Chris Mason <mason@kernel.org>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	Jan Kara <jack@suse.cz>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Sean Smith <defendthedisabled@gmail.com>,
	Andrey Albershteyn <aalbersh@kernel.org>,
	Pedro Falcato <pfalcato@suse.de>,
	Amir Goldstein <amir73il@gmail.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	exfat@lists.linux.dev,
	ntfs3@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [RFC PATCH v4 07/10] nfsd: add provenance time (ptime) via FATTR4_TIME_CREATE
Date: Sun, 15 Nov 2026 19:03:40 +0100
Message-ID: <20261115180343.576773-8-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115180343.576773-1-koray.fra@gmail.com>
References: <20261115180343.576773-1-koray.fra@gmail.com>
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

Implement provenance time (ptime) in NFSD, as introduced in a
previous commit ("vfs: add provenance time (ptime)").

Map ptime to FATTR4_TIME_CREATE, allowing clients to set it across
CREATE, OPEN and SETATTR compounds.

If the underlying filesystem supports it, use __vfs_fileattr_set_locked()
to set it, returning -EOPNOTSUPP in case it's not supported (i.e. when
__vfs_fileattr_set_locked() returns -ENOIOCTLCMD).

When querying FATTR4_TIME_CREATE, request both STATX_PTIME and
STATX_BTIME, preferring ptime over btime if available, and advertise
FATTR4_TIME_CREATE support if either ptime or btime is available.

Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
 fs/nfsd/nfs4proc.c |  9 +++++++++
 fs/nfsd/nfs4xdr.c  | 40 +++++++++++++++++++++++++---------------
 fs/nfsd/vfs.c      | 17 +++++++++++++++++
 fs/nfsd/vfs.h      |  4 +++-
 fs/nfsd/xdr4.h     |  3 +++
 5 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
index 3a82af381a8d..06074a7f213e 100644
--- a/fs/nfsd/nfs4proc.c
+++ b/fs/nfsd/nfs4proc.c
@@ -322,6 +322,9 @@ nfsd4_create_file(struct svc_rqst *rqstp, struct svc_fh *fhp,
 	__be32 status, create_status;
 	int want_write_err;
 
+	if (open->op_bmval[1] & FATTR4_WORD1_TIME_CREATE)
+		attrs.na_time_create = &open->op_time_create;
+
 	if (name_is_dot_dotdot(open->op_fname, open->op_fnamelen))
 		return nfserr_exist;
 	if (!(iap->ia_valid & ATTR_MODE))
@@ -929,6 +932,9 @@ nfsd4_create(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 	__be32 status;
 	dev_t rdev;
 
+	if (create->cr_bmval[1] & FATTR4_WORD1_TIME_CREATE)
+		attrs.na_time_create = &create->cr_time_create;
+
 	fh_init(&resfh, NFS4_FHSIZE);
 
 	status = fh_verify(rqstp, &cstate->current_fh, S_IFDIR, NFSD_MAY_NOP);
@@ -1347,6 +1353,9 @@ nfsd4_setattr(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 	__be32 status = nfs_ok;
 	int err;
 
+	if (setattr->sa_bmval[1] & FATTR4_WORD1_TIME_CREATE)
+		attrs.na_time_create = &setattr->sa_time_create;
+
 	deleg_attrs = setattr->sa_bmval[2] & (FATTR4_WORD2_TIME_DELEG_ACCESS |
 					      FATTR4_WORD2_TIME_DELEG_MODIFY);
 
diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
index 84161dbecd1c..faca3b9b58b8 100644
--- a/fs/nfsd/nfs4xdr.c
+++ b/fs/nfsd/nfs4xdr.c
@@ -509,7 +509,8 @@ static __be32
 nfsd4_decode_fattr4(struct nfsd4_compoundargs *argp, u32 *bmval, u32 bmlen,
 		    struct iattr *iattr, struct nfs4_acl **acl,
 		    struct xdr_netobj *label, int *umask,
-		    struct posix_acl **dpaclp, struct posix_acl **paclp)
+		    struct posix_acl **dpaclp, struct posix_acl **paclp,
+		    struct timespec64 *time_create)
 {
 	unsigned int starting_pos;
 	u32 attrlist4_count;
@@ -603,11 +604,10 @@ nfsd4_decode_fattr4(struct nfsd4_compoundargs *argp, u32 *bmval, u32 bmlen,
 		}
 	}
 	if (bmval[1] & FATTR4_WORD1_TIME_CREATE) {
-		struct timespec64 ts;
+		if (!time_create)
+			return nfserr_bad_xdr;
 
-		/* No Linux filesystem supports setting this attribute. */
-		bmval[1] &= ~FATTR4_WORD1_TIME_CREATE;
-		status = nfsd4_decode_nfstime4(argp, &ts);
+		status = nfsd4_decode_nfstime4(argp, time_create);
 		if (status)
 			return status;
 	}
@@ -1013,7 +1013,8 @@ nfsd4_decode_create(struct nfsd4_compoundargs *argp, union nfsd4_op_u *u)
 				    ARRAY_SIZE(create->cr_bmval),
 				    &create->cr_iattr, &create->cr_acl,
 				    &create->cr_label, &create->cr_umask,
-				    &create->cr_dpacl, &create->cr_pacl);
+				    &create->cr_dpacl, &create->cr_pacl,
+				    &create->cr_time_create);
 	if (status)
 		return status;
 
@@ -1165,7 +1166,8 @@ nfsd4_decode_createhow4(struct nfsd4_compoundargs *argp, struct nfsd4_open *open
 					     ARRAY_SIZE(open->op_bmval),
 					     &open->op_iattr, &open->op_acl,
 					     &open->op_label, &open->op_umask,
-					     &open->op_dpacl, &open->op_pacl);
+					     &open->op_dpacl, &open->op_pacl,
+					     &open->op_time_create);
 		if (status)
 			return status;
 		break;
@@ -1184,7 +1186,8 @@ nfsd4_decode_createhow4(struct nfsd4_compoundargs *argp, struct nfsd4_open *open
 					     ARRAY_SIZE(open->op_bmval),
 					     &open->op_iattr, &open->op_acl,
 					     &open->op_label, &open->op_umask,
-					     &open->op_dpacl, &open->op_pacl);
+					     &open->op_dpacl, &open->op_pacl,
+					     &open->op_time_create);
 		if (status)
 			return status;
 		break;
@@ -1512,7 +1515,7 @@ nfsd4_decode_setattr(struct nfsd4_compoundargs *argp, union nfsd4_op_u *u)
 				   ARRAY_SIZE(setattr->sa_bmval),
 				   &setattr->sa_iattr, &setattr->sa_acl,
 				   &setattr->sa_label, NULL, &setattr->sa_dpacl,
-				   &setattr->sa_pacl);
+				   &setattr->sa_pacl, &setattr->sa_time_create);
 }
 
 static __be32
@@ -3646,7 +3649,14 @@ static __be32 nfsd4_encode_fattr4_time_access(struct xdr_stream *xdr,
 static __be32 nfsd4_encode_fattr4_time_create(struct xdr_stream *xdr,
 					      const struct nfsd4_fattr_args *args)
 {
-	return nfsd4_encode_nfstime4(xdr, &args->stat.btime);
+	const struct timespec64 *ts;
+
+	if (args->stat.result_mask & STATX_PTIME)
+		ts = &args->stat.ptime;
+	else
+		ts = &args->stat.btime;
+
+	return nfsd4_encode_nfstime4(xdr, ts);
 }
 
 /*
@@ -4089,8 +4099,8 @@ nfsd4_encode_fattr4(struct svc_rqst *rqstp, struct xdr_stream *xdr,
 	}
 
 	err = vfs_getattr(&path, &args.stat,
-			  STATX_BASIC_STATS | STATX_BTIME | STATX_CHANGE_COOKIE,
-			  AT_STATX_SYNC_AS_STAT);
+			  STATX_BASIC_STATS | STATX_BTIME | STATX_PTIME |
+			  STATX_CHANGE_COOKIE, AT_STATX_SYNC_AS_STAT);
 	if (dp) {
 		struct nfs4_cb_fattr *ncf = &dp->dl_cb_fattr;
 
@@ -4113,8 +4123,8 @@ nfsd4_encode_fattr4(struct svc_rqst *rqstp, struct xdr_stream *xdr,
 	if (err)
 		goto out_nfserr;
 
-	if (!(args.stat.result_mask & STATX_BTIME))
-		/* underlying FS does not offer btime so we can't share it */
+	if (!(args.stat.result_mask & (STATX_BTIME | STATX_PTIME)))
+		/* underlying FS does not offer ptime or btime so we can't share it */
 		attrmask[1] &= ~FATTR4_WORD1_TIME_CREATE;
 	if ((attrmask[0] & (FATTR4_WORD0_FILES_AVAIL | FATTR4_WORD0_FILES_FREE |
 			FATTR4_WORD0_FILES_TOTAL | FATTR4_WORD0_MAXNAME)) ||
@@ -4434,7 +4444,7 @@ nfsd4_setup_notify_entry4(struct notify_entry4 *ne, struct xdr_stream *xdr,
 		if (!setup_notify_fhandle(dentry, dp, nf, &args))
 			attrmask[0] &= ~FATTR4_WORD0_FILEHANDLE;
 
-		if (!(args.stat.result_mask & STATX_BTIME))
+		if (!(args.stat.result_mask & (STATX_PTIME | STATX_BTIME)))
 			attrmask[1] &= ~FATTR4_WORD1_TIME_CREATE;
 	}
 	attrmask[2] = 0;
diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
index 56c49b5bc5bb..286ed7c98d91 100644
--- a/fs/nfsd/vfs.c
+++ b/fs/nfsd/vfs.c
@@ -621,6 +621,23 @@ nfsd_setattr(struct svc_rqst *rqstp, struct svc_fh *fhp,
 	if (attr->na_seclabel && attr->na_seclabel->len)
 		attr->na_labelerr = security_inode_setsecctx(dentry,
 			attr->na_seclabel->data, attr->na_seclabel->len);
+
+	if (attr->na_time_create) {
+		struct file_kattr fa = {
+			.fsx_valid = true,
+			.fsx_xflags = FS_XFLAG_PTIME,
+			.fsx_xflags_mask = FS_XFLAG_PTIME,
+			.fsx_ptime = *attr->na_time_create,
+		};
+
+		host_err = __vfs_fileattr_set_locked(&nop_mnt_idmap, dentry, &fa);
+		if (host_err) {
+			if (host_err == -ENOIOCTLCMD)
+				host_err = -EOPNOTSUPP;
+			goto out_fill_attrs;
+		}
+	}
+
 	if (IS_ENABLED(CONFIG_FS_POSIX_ACL) && attr->na_dpacl) {
 		if (!S_ISDIR(inode->i_mode))
 			attr->na_dpaclerr = -EINVAL;
diff --git a/fs/nfsd/vfs.h b/fs/nfsd/vfs.h
index 38f7d36bd4da..24c2c22b3e72 100644
--- a/fs/nfsd/vfs.h
+++ b/fs/nfsd/vfs.h
@@ -100,6 +100,7 @@ struct nfsd_attrs {
 	struct xdr_netobj	*na_seclabel;	/* input */
 	struct posix_acl	*na_pacl;	/* input */
 	struct posix_acl	*na_dpacl;	/* input */
+	struct timespec64	*na_time_create; /* input */
 
 	int			na_labelerr;	/* output */
 	int			na_dpaclerr;	/* output */
@@ -118,7 +119,8 @@ static inline bool nfsd_attrs_valid(struct nfsd_attrs *attrs)
 
 	return (iap->ia_valid || (attrs->na_seclabel &&
 		attrs->na_seclabel->len) ||
-		attrs->na_pacl || attrs->na_dpacl);
+		attrs->na_pacl || attrs->na_dpacl ||
+		attrs->na_time_create);
 }
 
 struct nfsd_net;
diff --git a/fs/nfsd/xdr4.h b/fs/nfsd/xdr4.h
index ec198993429e..a495a20e5889 100644
--- a/fs/nfsd/xdr4.h
+++ b/fs/nfsd/xdr4.h
@@ -123,6 +123,7 @@ struct nfsd4_create {
 	struct posix_acl *cr_dpacl;
 	struct posix_acl *cr_pacl;
 	struct xdr_netobj cr_label;
+	struct timespec64 cr_time_create;
 };
 #define cr_datalen	u.link.datalen
 #define cr_data		u.link.data
@@ -277,6 +278,7 @@ struct nfsd4_open {
 	struct posix_acl *op_dpacl;
 	struct posix_acl *op_pacl;
 	struct xdr_netobj op_label;
+	struct timespec64 op_time_create;
 	struct svc_rqst *op_rqstp;
 };
 
@@ -378,6 +380,7 @@ struct nfsd4_setattr {
 	struct xdr_netobj sa_label;
 	struct posix_acl *sa_dpacl;
 	struct posix_acl *sa_pacl;
+	struct timespec64 sa_time_create;
 };
 
 struct nfsd4_setclientid {
-- 
2.56.0

