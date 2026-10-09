Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A592E8DE3
	for <exfat@lists.linux.dev>; Fri,  9 Oct 2026 07:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532711; cv=fail; b=IES04x+62rd24ghHK6g/fkzB0FRjGW2IuhTjbB3fl5R8ifIomVYcgefn61ddaAPEsoBI6FGS0m+ISpbgY5ZpajVWhNPjqqVmJ0/R0d9iY2XJwpfcE+HprLbSP1LccyL/gOdK3Ux2uXx6BTIUl1bFuxsI8UcgZV0j5ctUSH7/loo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532711; c=relaxed/simple;
	bh=mwWCnRBvJyQlR5CZ6HzePgtpM33h1QT+eyTlGgyZUwo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GxQfteSAX4AqdeC6858e/KDS2ZBA7k/LMKv1ful6i35kpehGsCcrdaMz7qa+u43lpz/FOkHsHw3oEABsAJOT7wdTyZymJPEif0Xh1mbPskIAJ/0MXRe9hzEdAh6ZMHuzzvlLdc2Mpqc+7eOP672okFp6zq7GOg0tJVp92m8E/rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=QSv1b690; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="QSv1b690"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6995bhVn1289633;
	Fri, 9 Oct 2026 07:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=WPT7Mue
	BQdjROvH4IX5gYtPC7YZANqyl0ly8SmZ8o3I=; b=QSv1b690EBG3p5NUr+8ky4Y
	zDpHzRmAhWrGR/zgFk8wT4jAwYGfywG+Mo5Q3JFRGDhchmE4ONBQmSL+cmzLt3Ka
	xdkm9AEP1ZX04mzVUSirBh4+m5HUapOwetzgf4mOPLaRA2a8FpwuIps8AQqqZLD6
	Pp+4HEKPkHdZtDaeTWDbPzp1VN2bvi4CfmowwAcSmnfDqzyjit23MjYJP1+PRxNX
	yMOZTT84z01WJ8ir2qownjKRtaAWDshPQz6Yo1BCq7DUMLaN29Ske7fM82S41GfE
	OOqFQVDLqZNf6nCxApkSfquPjel1+WBISPY7sjY2pAlOMYUWYaGjxsx1hx3AKzw=
	=
Received: from seypr02cu001.outbound.protection.outlook.com (mail-koreacentralazon11013022.outbound.protection.outlook.com [40.107.44.22])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4h5xdhsrvg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 09 Oct 2026 07:58:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm48i2rrrAMj0KFln4OfpwOLU9ZaBL+iXFbHy+M1mIrWs2GrvIn/QZhijiHf04vPT78guap3qsqWY5rL+AVuf2+bJYpAOEnQvV7HPNGVKkPDJlnwb/miAniowvP+DfwgeiGFjDEwYtW00KSigwkvDiO9TK+TOt2uVj8fFbHUS9OaWJKSNmP39915C9EaUfquxFuutj6yvDSe/Il2bK/W1jbC9jyrrV3jjJi+TzmNp1hP7wwBvt66VSe982+gZxNkov+vYCkj1M2eLAmF88XcvpkWVmFWdfIWbL0Q0mp9dkkJ9mLUcZ0WSJ+wmNarTwteXiO4PaB9KzseQhfj7Ew89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPT7MueBQdjROvH4IX5gYtPC7YZANqyl0ly8SmZ8o3I=;
 b=G0WAeArIW81xfmuiEBB3XXj2sueTDoHaQ3+eEH0CwB6VprARYVN7PzNkgUab+PPvLPf7aEZk9H19BU59h6i5lDiOxmFOl4xdq0cfe+iWGFzzJOIdoibnMnCT8hiI6ZWOfj33/84uowLzp3hVvlW1PVx9uTBIxw24YJnlNq1HdsH5bQZIKYQP7+C06AIXFkgytoDTethnG3jcEvMEsEqV9JCDTl9B7nXRhgEOTxLBnLWWHi5adY2LM8ZON8N00P1YMqhtiw3MwNSy0urREs3xC4rLidV63hbVwDecZV7oqOPi92AqPPMpg+OVZjRnuxysNtbZ0brVoBrB0UbsZWl//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com (2603:1096:301:fc::7)
 by SEZPR04MB5756.apcprd04.prod.outlook.com (2603:1096:101:77::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 07:57:53 +0000
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::a631:6b1a:332c:831c]) by PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::a631:6b1a:332c:831c%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 07:57:53 +0000
From: "Yuezhang.Mo@sony.com" <Yuezhang.Mo@sony.com>
To: Chi Zhiling <chizhiling@163.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linkinjeon@kernel.org" <linkinjeon@kernel.org>,
        "sj1557.seo@samsung.com"
	<sj1557.seo@samsung.com>,
        "dxdt@dev.snart.me" <dxdt@dev.snart.me>,
        "exfat@lists.linux.dev" <exfat@lists.linux.dev>
Subject: Re: [PATCH v1] exfat: mark straddling folio RO for 4K block size
Thread-Topic: [PATCH v1] exfat: mark straddling folio RO for 4K block size
Thread-Index: AQHdUMi6PIMYj26g8UGMn//t2iEhgbboI26AgAxgUz6AAEUHgIAAHReS
Date: Fri, 9 Oct 2026 07:57:52 +0000
Message-ID:
 <PUZPR04MB6316EBE2BDD9871D13EE986881922@PUZPR04MB6316.apcprd04.prod.outlook.com>
References: <20260930104332.4022207-2-Yuezhang.Mo@sony.com>
 <ff3a2271-542a-44a0-b5a0-700990119630@163.com>
 <PUZPR04MB6316DF5C2179DCD7B4200A6A81922@PUZPR04MB6316.apcprd04.prod.outlook.com>
 <c4cecbd4-9f4b-4b07-94fe-20e4abfdaf0b@163.com>
In-Reply-To: <c4cecbd4-9f4b-4b07-94fe-20e4abfdaf0b@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sony.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB6316:EE_|SEZPR04MB5756:EE_
x-ms-office365-filtering-correlation-id: 9d2c7400-f6ba-4b47-421c-08df25db0577
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|376014|22082099003|18002099003|10067099003|38070700021|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info:
 TlRkbpwqMsEQ+6thLYN5DHQ4J5y7M/LCK+fgKCbYh8wF7QwS5bTgzWmTsQ5YrThE6SxgSEx/jnFIt7STpuTVKlW1GSNH6YSnc65CvELOpfHTkQEUbb5gu9mTvwtJoHuj39hknRGiEVDmIFuVKFiComsAWn/+Qoc+pTx+vU5Y25vX+7zr+aFnX8nH5Z+8IbtWKLvu5EDzWyZ3OLiPTYprzX/i2zUK3e1pP2TjYgFsN/B4K2Xl3L9ozZivJY6xVlzNi1F7Iy+ZlCiuYQ6jdcdGYBLurlncOzg+JUo/HMZM7FqBARO9PfQ5K21dbSv6hKo5OJXS8nTebzUzfA4zDboAfm6vOS7nYpS6jLgi41vkDJL5vt6j1BUnZHTTJyznxprcshbzhGxthPKYCSiY+5aBh+cNYVSqC6bWGHTbAllMj8mXzHSEki2uHtmgH26ol1CZIO62ogNwkLTOzwQFfVtHGHVGp0OPR6q45B4AYeEdlzI0y8Rk26d1HTvZhWjY/JoCQphNVyRJ2/3BRpi3xuWAURR/L6CRAK2M2mtolGQfYF6iKzN6K7hM7/3+Nz3x6alj0codbP1w8b5mpUgL4BPL25ZPICYVseZ+7PJGfkfw+snBiD0LeME818aG73vpwL7mdxMLX76o9jrXc4hL9Ak7akNiDHILIQuRQEuMvGQmGpYizxKQhJ0mpdnIRba46SIR6lpBPkpbGp1cSAKW9SNdsupXrDSl2xq/2XvSZAa8N7Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB6316.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(38070700021)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?An1hxoVFLmxP4xh7oqKYG8EQMRZeZcuHwnVlthlL0TkmIRtJ6A0yO+Nj?=
 =?Windows-1252?Q?iEUBaVBow9w3GJ26kXGkR7oZMQvQ3EZgsqAiSDSwdsAXYUHJ6Dh6KuEP?=
 =?Windows-1252?Q?QRfFzVm5FANeGmhGqghmlrjySKrvO1tP2FkGV65ptNC215lRJe1FvYin?=
 =?Windows-1252?Q?UKAGP7ClqARrf29iFCbfkx5LwW4QwXZC+2qqXWhTm7CvrFV+HWvo1K1f?=
 =?Windows-1252?Q?iX/shVLUmKcb7hzHAEAdTE7ahUGBxoP84E7u+gvtkC37moIU2ooHroak?=
 =?Windows-1252?Q?tyFnlO27ncpv53YSbasDNdPpnVXa6c0OTBvWggM9vv+NhyXlbPJPd3CG?=
 =?Windows-1252?Q?iP4Cjy/Hs1JXRLqfNMLgnBPoHZHG/Ho4/JPPF39MsMgd250QdZSWhEdW?=
 =?Windows-1252?Q?2jlEp3RrW8cPwF2d8u+uTkiDAXYCavEr0o3sBV7isRaVX9TbaSGVtSVm?=
 =?Windows-1252?Q?5wJelmHr2g+AWnia1D8wFNDT6pem58KvU0/fzH1OoMW+kUi4111UbWTS?=
 =?Windows-1252?Q?z0yYst1IUIJe7CWwrnZIVcW8bZ6pY5DJdHrEDJ3C4kEAdKKAhk9pUEMO?=
 =?Windows-1252?Q?zUE+FZVh850viTo5XUmS29+AuLuU2KjM7pQCGAI+wtwT5OlHTzI0E2bw?=
 =?Windows-1252?Q?09aYhqgDUwRqqgJYHDgXwem6nxzyEXa1OU9Zh+NFKsMFT8/Yhupigi2B?=
 =?Windows-1252?Q?4hApyFx+gjD4ujZpN1qzmbzpHHvmfqutUJTImikYgZMOTHDvuxNnZk1f?=
 =?Windows-1252?Q?1pCBVpx67M8Od/nymQIHd8uBEOrgpmzMdhRIha4lvmwrVf5eKhLPkq0/?=
 =?Windows-1252?Q?kVjFfC3sAZmpH/FNAaOmwg/PvIKwPn42d+56csUeTrzRbFIsEHAZkQZE?=
 =?Windows-1252?Q?exljk9obnmDDULe0MulNgSPq9rYixAZDTTQk6+WhYGD5pHEIIxox74lH?=
 =?Windows-1252?Q?gyNQr4SPNgXYD14FVzpszfKFGRiSM2XKDaZezowRTcZ7CGMNrlAkGi2V?=
 =?Windows-1252?Q?joFjTztr0u+bCE7Fg4OB0XIDpoBXONZpZ7lS9vyoK9rJEsPHwawajjNS?=
 =?Windows-1252?Q?kqstfUW+AVPenlgJwGZnBw7rJ6Q9XtqWEiSzrVmUZj/G8kyTAeyJkx3G?=
 =?Windows-1252?Q?AV2RksbM2k+8FPC0s4HDCkGZKW1hmKDOjQDIQWFxlcx0ZVI7hP+3huin?=
 =?Windows-1252?Q?FcI3dtW2V15gI1GnpvmEAK59zXaFkk4isOntbYZ7jFngnEe7nCpUG8Yu?=
 =?Windows-1252?Q?uy7oRvQiU1OEwjoMjwyj4Na0OvHgNuFGPT8OjB2o2lEf/RCKwFMWSI1M?=
 =?Windows-1252?Q?JZfS5bBsGfW9Yrf3CTR/z0S3cOFLF2nvTPkdt3f9BfAh1KBevV7TP98u?=
 =?Windows-1252?Q?H0yRKnvJJpD0meYa8b8BzCrENJ5USfbG/acNgmaxFOvQcN9oewIg2uCJ?=
 =?Windows-1252?Q?6pSRgFCqBN1/NT7qee8Tp0Wf3GogEU8fp8rfzdHXGmfF/0gxutxMumjQ?=
 =?Windows-1252?Q?9A1aobGljG+YOudiP4WwfqJ0rTowVYFxtvB8xDnzkRcl9w/mKSz0GLgi?=
 =?Windows-1252?Q?gZKfk330EsWc0E+w/5gY3UeFLwaIoV95lDBhmmOsH+hc9FOv9OTmimGU?=
 =?Windows-1252?Q?YlugWymlaQJBUe4PoW+ZMEA8jGSWQLfq4r/t13vSaWUmfsZICyazxtUf?=
 =?Windows-1252?Q?XRVp65nkN0Syle17N5Wvz9eDzWZQJJFIoy05Vkmn8R4vr7KeFl9h2VKc?=
 =?Windows-1252?Q?mox04apia32hfUXN4hCMfejS245OvLehbXFaauCagvoxv5EFXxn0Igom?=
 =?Windows-1252?Q?KKey8kKQifGTxmXKYHQgYKwndtJWTXFrKdCImtqrSsQYhKOoKnKqSKAM?=
 =?Windows-1252?Q?SI7bpca/KVEZGzS0OgD38kKLil5NnVScHx8=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Ht78nFMI9LtfcYw1sVCL14z5tD9YXB266lZGTPu4bjrHEZIJkj8yIgY+v4BeYVVH7ZEcjs+P5SF9OdSU0r4bteSyzdfLWu4BLs6hl2LPBzQewQ0bK+LCg2aad9W4vTKub0wQPLBLduZSkK4Y8Qvqcx8R6bFIi7NXTlbzeqNjtYGg+kxkjRzASPPbnwLtJ+Y71JOkJ/TUz/6vdwCRQLbeZ7I7N970IJSLQV7C2GJ9ZpP8B/cdAbelzhEUr8yLkxMgTEISB6uf585D8ph6yGxLlAGrHFlWKiOTnz6CTiZez3rPMWvZy6OQjNh1cY3FUdXOSwc9uRhVqKuLfSf5JgqCsw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ukeSvEPtv4eZHUD7e2KsmC9NrgUeWNSUQ24ylCgQ/NFSjTucXHbx4uXSc77J8QwlQ5tLy26L37TQ/6R6+VPyMbA+HgpusdTP4kk3ZFQacyYvZoJHUYQOxbRZh6dsdk+YUg03ij9++CqV560f1AZN6EszbduAq2MpXYlk+IYDl+L4mBeUAl5mZ/auEMFK6/B/kwxF1UJ5oiyhm07pAgZE8AnA+MkZq02eIp9knU1ZLpmhDhZB+BXb3vbyw1hak5jrp5k7BbIrkQ6q2GgoDcrG4GTNZLkiFJoJlXUFZBisHW06bKhAu80CUjETHYVnpQSKo8TsxFxWA1YT7VyHNPOcyNtoXRpzUgdcU2NAeWVcusJIQb6gzabeEm9wLBf0WEmiwfFZGJXO21fsfOOWZRanhtycMelLuZ2MdqA4yQ2IwNGfmujbpKtrwQJfBSSQU34vrkJq1Ico8GL7L5kqn2FZfklpleRwspm83SCkb2y3CIdiyZ+HEdHlvJ9Xz+ec1uEafTcLTFgYI/gzlpIwMxPmdZwVoZt/7G6HcaqOvaJ9Qrv9tqZ4wUxXZEfR8GnYPr1pCaHdRlHZAzlz7WbjPr5BdlfNbMwOeZyRcTItkpJwEbUjPqarmAfeJWvkvXvejK0d
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB6316.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2c7400-f6ba-4b47-421c-08df25db0577
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 07:57:52.9042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SShJYschPL/vNeTpTyOCFRiGEMTtELTC7e0iv5Kh4Ai4k+Wxyh0Jdwx/Q6f3kyTJx27M3iS4kncBBm7fHu1mlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5756
X-Proofpoint-ORIG-GUID: yG9vo21daMIjnFCUcHITHe6j2WAX5SLl
X-Authority-Analysis: v=2.4 cv=YPQKWhGx c=1 sm=1 tr=0 ts=6ac89e8c cx=c_pps
 a=mSFsxCVuS8LUzYwKI3zE3g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=N659UExz7-8A:10
 a=660iZSQnnn4A:10 a=7j0FZ4iXMVMA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=bd-SKr3HlWZVCYFCRTQK:22
 a=z6gsHLkEAAAA:8 a=pm1G-R6WKgMaJh07EdgA:9 a=pILNOxqGKmIA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfXxDr3F32NUFcN
 FKD4fQ5ceQ6y20rlDFc+vVFgir2TGFIRYmxRxr5nFP+j3/wNlxXARxxC/Ile4KJiwqqzP9ZT/K+
 5EfnPP80J8vXzP4tCgn8ycnBn/NoHXY/4OX6mJ6wC0jIX9hBc0PQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX42AELQCoFkSD
 K1zIzulW3yNFJoQNdTvLdY5POz4ZuwVr0ZD1f4Oz89i3urJ0w3hgB4WU7GbKB3oYU7/lLwk2koO
 aFBQFm735MpDZOmRbmmKi+ASxEv4gsFlkZmREFZx3Sv4rw/18FXupoekLp5rbhrH6YbJjwYLGgi
 j03KXz/z7zL6SK1wcZaD368nbDwNEJGutcsJZ7kipl+ncHH1v7OKQyU17LJlyu7Bb2izATflsPT
 wi99hA0qvWMsVMJgXE9dilnVJf9axGR0snRtW85AsHIz217fd1alPTakZB+DAJoumhmfrSW6C5x
 Lo6tcFKzFpcMDgaGeG603oxXmpbgghkDxv3x7oTn0tauPFTZOJLlkTyyBJTm1obCWoSTPEz2inf
 iBxl13xVB1u4345s1rnwNRM2E63yToARidTiGDrD9CKCaTGwEsJXwPPC1UUdKNjJh27AN0zAeEG
 y9NKT1eglIYJYNU/qNA==
X-Proofpoint-GUID: yG9vo21daMIjnFCUcHITHe6j2WAX5SLl
X-Sony-Outbound-GUID: yG9vo21daMIjnFCUcHITHe6j2WAX5SLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01

> On 10/9/26 10:46 AM, Yuezhang.Mo@sony.com wrote:=0A=
>>>>    #include "exfat_raw.h"=0A=
>>>>    #include "exfat_fs.h"=0A=
>>>> @@ -91,6 +92,20 @@ static int exfat_cont_expand(struct inode *inode, l=
off_t size)=0A=
>>>>         */=0A=
>>>>        pagecache_isize_extended(inode, oldsize, inode->i_size);=0A=
>>>>=0A=
>>>> +     if (i_blocksize(inode) >=3D PAGE_SIZE && (oldsize & (PAGE_SIZE -=
 1))) {=0A=
>>>> +             struct folio *folio;=0A=
>>>> +=0A=
>>>> +             folio =3D filemap_lock_folio(inode->i_mapping,=0A=
>>>> +                             oldsize >> PAGE_SHIFT);=0A=
>>>> +             if (!IS_ERR(folio)) {=0A=
>>>> +                     if (folio_mkclean(folio))=0A=
>>>> +                             folio_mark_dirty(folio);=0A=
>>>> +=0A=
>>>> +                     folio_unlock(folio);=0A=
>>>> +                     folio_put(folio);=0A=
>>>> +             }=0A=
>>>> +     }=0A=
>>>=0A=
>>> I think fixing this issue specifically for the block size =3D 4K case m=
ay=0A=
>>> not be thorough enough, because pagecache_isize_extended() may also fai=
l=0A=
>>> to work when the block size is smaller than 4K.=0A=
>> =0A=
>> What condition might pagecache_isize_extended() fail to work when the bl=
ock=0A=
>> size is smaller than 4K?=0A=
>=0A=
> I didn=92t explain this clearly. What I meant is that the issue is not th=
e =0A=
> block size, but the fact that VDL in exFAT is not block-aligned. =0A=
> pagecache_isize_extended is designed to work at block granularity, so it =
=0A=
> won=92t work either if oldsize and newsize fall within the same block.=0A=
>=0A=
> /* Page straddling @from will not have any hole block created? */=0A=
> rounded_from =3D round_up(from, bsize);=0A=
> if (to <=3D rounded_from || !(rounded_from & (PAGE_SIZE - 1)))=0A=
>          return;=0A=
=0A=
I got it, thank you for the explanation.=0A=
