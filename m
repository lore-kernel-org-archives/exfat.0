Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E0150C2BD;
	Tue, 29 Sep 2026 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677749; cv=fail; b=Kfpq/yeefAtTThEg50+fTVj/iaLwbIM9MZl4/4W3CC6KhiDfFh6y3eM5dHagCcxFJ/4G0ttPBAAvVUL0wVNVNxuTS+vZUIXT8WchP2OvzLj1DcjY+Et+SST99I+e+8azHcLUZo8heUv1FwsYHZMswq7ODiEw8UFE4Qui0Rk8u4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677749; c=relaxed/simple;
	bh=HQnMGR9rwW8zlSrqpO1DxtlqKRUwPgbmQBk940aZxk8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ubqcDdG8fELLvOme32fictaP+X0QJd0vF0OUXisEfmyCH5TjSBTZdyoxXnUreWjX5ETediOPicGELNJoh6DqT+RoDTobjKmzgsAJQN83W8nyooUmZWunBX/RYe7Ytm1BTk59Mz2nb8RU0JzXYx0yyzroHmX8BbqByb+t3ODcgy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=IPsTfxZ0; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="IPsTfxZ0"
Received: from pps.filterd (m0209329.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7xGLT732918;
	Tue, 29 Sep 2026 10:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=kihvXDO
	588M7hOwkqQCgdB5pjdetMZ0zrfQNzncZnLg=; b=IPsTfxZ0qR+1pN/qjzbu3rf
	AkhOPGaqTtm50uzllkrkttaDQmXK9KsLwskV2vd4WV7Tqtbu6QbumkPbGfq1rF9R
	l1pe4Z+Du9xqKBjbo9pFMk1EJI2UxWwFZWXcunhH/TuhZCqCjMB3GhjjBkNoIHcv
	gSICNlyGTnT7kaWdC6WRoinExRFED2oZT2aIhBPw9eZNYfw3hijZ9/DPeXV2nehR
	etHAKoK4TvnBSqmj73FlsHSdPu9RhHZ9+HWlzzryjwmIGRUY6Ts4+FoV2tUP4oNE
	tbOTQVvU5qkqf1yxDreH4JV+B5S5R/pKU25HDy2vfm+LENRHxmC8yGgJNEVm4Ng=
	=
Received: from tydpr03cu002.outbound.protection.outlook.com (mail-japaneastazon11013005.outbound.protection.outlook.com [52.101.127.5])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4gx4pxkvan-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 29 Sep 2026 10:26:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyGTs9oWlFsu2YvEp1y5EEwd9mxCHJtq3zhPIR1WawmtUTI3seH0rOgyIEQix31fEjRIdbmGoP8HpOwqOJVc6CApdu9zqy7UlQ98YSnz9e4pexfUApg+l4J0+0OzkiiHjBAVPdOAt2hNisfrWboBVCLRWdcJ4i6ByT05jEEAr97HNm8LeBnH9ZGtMbECJ98sfcPl73yny5M/0wVk0qHxTPRJ/PHF3iUdyoJVzU5SkEpZgj3+AdJdAWJd11PYp28zvkptQm1Eo7S9f6qWGGhQ0ShAyBpbqzZT4VDi2kBz1498Jj/nT1PcqFdIC77IJf9+mMHcq/ONV7E/pqAbX33Jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kihvXDO588M7hOwkqQCgdB5pjdetMZ0zrfQNzncZnLg=;
 b=nSO1FkFDD16E6ZCp6rhRnqLdvTGpaK92PQ0XvVzM+ECsb0CfOoYSjowfrToMJCBkAxdIUrffqKxQN8nLBmtfPeIUwc5R28hyeB9Ub01MWfHueQHejYocFaNhNKMVS4aP++eQwbIMvEVUYlTdV353uihQ0tcLG0LQsBe6gY+AjrwYt63/VPg/DDO+FHMy1Bj79n7EmGIUay0zFr/hFoIwBIZxMMa5phzkBD5BbbKdGz/96UGXI8HK4EoQDwIB2wsKfpDxwV3c1RqKe7szIesM/ovDusy7V05QQMrYGPxg6OOCkaeeMaqzPOHYUh1pPegflgN5ZKEeoamD7a1Vfz/04w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com (2603:1096:301:fc::7)
 by SE3PR04MB9081.apcprd04.prod.outlook.com (2603:1096:101:2ed::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 10:26:34 +0000
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::a631:6b1a:332c:831c]) by PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::a631:6b1a:332c:831c%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 10:26:33 +0000
From: "Yuezhang.Mo@sony.com" <Yuezhang.Mo@sony.com>
To: Chi Zhiling <chizhiling@163.com>,
        "exfat@lists.linux.dev"
	<exfat@lists.linux.dev>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "chenxiaosong@chenxiaosong.com" <chenxiaosong@chenxiaosong.com>,
        "dxdt@dev.snart.me" <dxdt@dev.snart.me>,
        "hyc.lee@gmail.com"
	<hyc.lee@gmail.com>,
        "linkinjeon@kernel.org" <linkinjeon@kernel.org>,
        "liubaolin12138@163.com" <liubaolin12138@163.com>,
        "sj1557.seo@samsung.com"
	<sj1557.seo@samsung.com>,
        Chi Zhiling <chizhiling@kylinos.cn>
Subject: Re: [PATCH v1 2/5] exfat: dirty all new pages when extending
 valid_size
Thread-Topic: [PATCH v1 2/5] exfat: dirty all new pages when extending
 valid_size
Thread-Index: AQHdTlbXi+tmR5grhkq8P6PcLAqiFrblDt9K
Date: Tue, 29 Sep 2026 10:26:33 +0000
Message-ID:
 <PUZPR04MB63169342024E0071F334B25B818C2@PUZPR04MB6316.apcprd04.prod.outlook.com>
References: <20260927080305.831641-1-chizhiling@163.com>
 <20260927080305.831641-3-chizhiling@163.com>
In-Reply-To: <20260927080305.831641-3-chizhiling@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sony.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB6316:EE_|SE3PR04MB9081:EE_
x-ms-office365-filtering-correlation-id: 08743719-206d-4b93-f883-08df1e142257
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|10070799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 nl7rhErHgiEnW5GLJ5BP4bM0u+i1HVeuC6LVFn/3VG/uBTFh7drEZ18Sm/a5vXjOlVIt5LqTIaB2tODe3Tv9kHHmntDdTk4i1aCT0Xm3IGCGiBl/kKWyjz4KM/FKuC8itk6FiyFt/MxGfydLBm/0VaR50J8GUX5aLyKb2v/cJlf34idkvnJqYGsfs6Odtog7Wds5afTN+kCOZ5L2Itrs9Kv9SvEzFCiZH0I00C6KLe1qH2hbvgmUjy3g3Wgp0PUFKBFqnVX0JQlRfggO6YHm3wzEOX/CX3taXxEZoYjGJzHRkI5IuZU0p/2A1pZGYf7i7afsJxR6NeLPbTdF7y+mnBv6+MXoWJ08KvNLC1k5Gg6C/Lwk1zTsYGJJ3UAxUNE37MgZor2+DJN/ryaiIoRoTL/KWNn/8JQn9H9Gr5QEUw+6A3OqAS+4NoxfTprGljJZpFfyBRvZRP6ZXbrOnCXme0VkoC6pgVzA5gde3UcbUXIWoqS8J+A16DzZMkSD7zLZMIM1lKh1eZCMrNBscdFWQ5fEQpGVJfDqVe5TPHGGLMtg9eWKAym7MKu8cR4LPXdl+JfzA9LXACb6f0t3w7ZTqxF618KwAVzeweXfipyZyBzBft44mEhzW+wrCBDcMLsu1rMYBqfU5REucPWjIwuN9ySFMFsdD2ShyMwJYEa7DS/FCxWqKDFwJR7GRqDV6U/e4++20QfeznbKHUMLLu0uUUdAtkThMImdJnj2Z9Y4O0Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB6316.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(10070799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8Da8ojldk+gqHMyGrPz4LKfBXyjiu0Co30fEvJ6TUj7zwoNSECecyIPgaX?=
 =?iso-8859-1?Q?CgwL+oRwbshOaRhyJAE/MXc5fq470t1BWAlgBTqrvtkNgw7AkIV264jCZX?=
 =?iso-8859-1?Q?D4lko8kYNBUYIBapEIwcQTIaXYzTJC2ymMCFRu0mpW4Dsib2AEJRqBBeJK?=
 =?iso-8859-1?Q?keqVKMwla7HkZABJeWpgjgBZR2CrxCJK5RQ2ke8RhYXRh/MW+8GhfS/JU0?=
 =?iso-8859-1?Q?+uC2BEPe8xoHgIpJHrmmZJEebtb+81p+61TEAhhaFVz8+ACkEamSa6UnLU?=
 =?iso-8859-1?Q?Xx/gP9aNZ4wZYouBg64q153yICqo9djLQRb3q1NcN5sJftOjSXrnr9DbQY?=
 =?iso-8859-1?Q?eXxNBdrur/lOSNaomwFKb/6EnYZBkFZ7X7I+8AyP6Kks8dOFxXi/6AlUgh?=
 =?iso-8859-1?Q?tO/S8Yu+U8OS0xXbBLUoeM25B9ArgomqoEYx3NsE36O7+BZf/0ZSM2iTc5?=
 =?iso-8859-1?Q?xNpUuffL3dE/Qwz7g1+7GYU/dG67jm0eX5VqjRisIXXQxjMzdHfZxujEZB?=
 =?iso-8859-1?Q?13ZkHWMRmcJA0F/9kBGZf/rqWezVsP1NMxFXSag/eya6zg60cMhzvUOBka?=
 =?iso-8859-1?Q?k0Yhjm1bt/4h5azH75Snl4ocOkl1BsoEdhsmWdCakIqTJ2ol1RhaYZzuqR?=
 =?iso-8859-1?Q?/Fwd7DmiZlfnUyzjZLbZsC5RH8xf94nM/oaZXMZFpxx5ST+1rE9MVSJTKU?=
 =?iso-8859-1?Q?BtvCDAgj1MRFzR8ubkLzc05XqI6COMsS/eUlGk7sds553b89q5hjaN7pZ6?=
 =?iso-8859-1?Q?XaWcvaAH1z1DnpwadTyWN91Wvw6Enqyj0Y2RODUdU+IXzzqhTFTjQefmrn?=
 =?iso-8859-1?Q?CksSo8JXjfCoWcGeZJwn3FwgtqVZKYvkbEBw2pWaxSZHgFXO34+iEBbA95?=
 =?iso-8859-1?Q?XYjdc0SmrVQK1ru0XmRNk2DZBPGVk1D/Z367YGcK6ULGyUOsB1xBT2VxCq?=
 =?iso-8859-1?Q?COWxEZIKd8zT3jG/yNOVINn7Ia6efK1mAFZVD5hxXsQOUajTnOJTW52GCP?=
 =?iso-8859-1?Q?YgRW2cuqBCzMqkanFlefYOM+1otMlP0bQ2/qE+kmo7wEQBH0QXWWEa9YFl?=
 =?iso-8859-1?Q?utnkzthtgIxfM2u/omBeshybcAQkgPsWC/zaNzgKFrcTPV7poX4JVougXe?=
 =?iso-8859-1?Q?61YWRcO8Tqsj+KmGrUa67lHN8F3a4vT6bxOkL+Gsq+iykHrcBucj5F5zlS?=
 =?iso-8859-1?Q?CT7YCsw/ViWRy5fC6xWVticmXPsakLAYWq1hEJcCkKYK70O+15lPuVmys0?=
 =?iso-8859-1?Q?G54UN0jl87U1+84r+dBc/sJZrZjJLmhCmlhjTdKL7plUfwHWjxbfg/GPZ+?=
 =?iso-8859-1?Q?ddyhS3WC4QLdwSmHIYvENRtkY6KmJLH7UNLbcHP+N+Jk2apJkQP0AahOeC?=
 =?iso-8859-1?Q?Wx5EcI+UUd46++PUzYWmiUn/5d6dzBIfuFJkajTX35UWxJsRGqnZSW0LB6?=
 =?iso-8859-1?Q?Rv9V3cYeC0BO9Ah6PE4fxl18ic5rtb9wDg0kWlSbsUt0tIT8BSSnr8Fnpy?=
 =?iso-8859-1?Q?95Hnp46sFsgk9ZGVIi9EL9KZaLH7iIxN3lDEs/BxtcySXEx6oUE8LdUYYs?=
 =?iso-8859-1?Q?1pRyHl1lh9Kt3ffjIdNvw6bQsYXlyqeEvhSSauZePuVaaPrfEVIgDSlZUs?=
 =?iso-8859-1?Q?4rF0jfj6CK5ood1IYv7AZFO0J5gMKnv6ZTsS6RVjCRtKsAQMEsVdAZHrSI?=
 =?iso-8859-1?Q?FBVkoJ3xbw6tVBaUERYX0xKEkdfp0y3reESlT7u7DJkNAGCPLBAhMtOk45?=
 =?iso-8859-1?Q?++NOg178eIiEVpPyqI7BObXT0WrMy3ykHzAgBqSyKRPbRxRZ3pCY3kYaKm?=
 =?iso-8859-1?Q?w/1jt6G8LELVDpVygPW3jfusoMjzfVE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	teP066jCxzAsHyEtmGmUUJRRpKYioNuj1aYFe4yCpfYlL1JiyHhXIjbEDEZzLpB64Y8jyi5BdL86NSrtg9Dt7D2plcZZTdYX15VoHorxEvvZAAtfDFxeWZF5WUvqR1k+bN7sPuNV4DlpnxFG+NQJlY/ZchCC7EHdn9k96B6RZaDXa/Ta1O8j6dcToJbVB86+R2L2yRPgn2TOpo2kwq9zltxTD1c1McjiBN8pOHniJt99f6gpFDdcdB41V46a57K2BTrnTKNO0rNQQnsQmqZ9gv+5UDzIQu6ZefFv5dT9j8y3ovIEWLSn/QfhvtmUi4O7aqd/zsC0GDp3+Zd4Z1z0kA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Hr2lGBjAyIqVGAktB0s5YdHQi1/mp5xIbDpPHdhisGaWgMm71lIPDBdsAdEKeL6emK1JdcHJ8KekPiHMl2AklFIwGgBekg/TaLnuIuVzU16WerzI2PbXFurWqN3lqTViV1R0QKlp1j5K6PDin19+4fplFWo0WOZT4bJu7m8KSr4Nkg4VZA+vgbv0H2D3dgmWN3xrB8o47svgxO3+NJLVYeaxrCZdtbvuV59JAwwcAhCdTVN63JurOkv3xp4kQirnJt46lmP2OUwVlqaPvhF5VbOuKtx8kS+1Vadc97H8tQGmtejh+wpOa+2B0g/XdG6zSgsl02rMmgX8oMGAsbYuaglNQhrzDcUrqIFM2h8WvSGLibmmsfgi9gxIhpppjr/OZPH7hmH4K0od570h0yWEAd3jEj+wIgr6zdpb8fu7q2B3jpVs69o6wVB2xWcgYhu7+0+Ja2RgpeGUeR9vfXct0toi/ZpwjeRfxNFEudZBK6U897nERl0OV3D7vIsTRgIoU87n036sqgDKxfr9flqzC5eJaFMdx8/bKq3QkzexocJ5Ycbj04JjeztoccrWCqH+BP2TZj0A6n+FKHiJybR3rRYoBhC4AfaLXiioT9S9N488e3Fyxgyqpcfypwv2G7H4
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB6316.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08743719-206d-4b93-f883-08df1e142257
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 10:26:33.3839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3B2+MVLWN4q0jZMc4E+8b8D7674OPzbVDIcIJVPDMUXQtsOnMQOlfgVfDsX+K9AIOGoxgE7U99aDXP8lRphVkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR04MB9081
X-Authority-Analysis: v=2.4 cv=Y85tIReN c=1 sm=1 tr=0 ts=6abb9265 cx=c_pps
 a=epqbmFPxbllvowI4OUgUBw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=7j0FZ4iXMVMA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=pQehfwC0D4oxWvs5GOjV:22
 a=VhS8QjjJVuzDGRbum-kA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: _uy4R2q1--1baHGUPRSxKHKFNw3BLLd8
X-Proofpoint-ORIG-GUID: _uy4R2q1--1baHGUPRSxKHKFNw3BLLd8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX7BpMnQjS8ZWg
 e3GsvZRMiVpXRQgTbZCFOKidDjTRIGRk/GRZby7hHJdbfW8cuh/Hx5Xz19czIVIx99QKlMNSBVG
 HoU9OAFaHTaZ48xeNV41O+im4k2Rsy8agZCAEYLWrDaqfwLR/bUCMNsRlXtPfovHcgw1kLTHNQq
 SlyZ2AMm2rPoXLtwGzab97P6TjagEVrE2mIoWXaaYo/KHEob4vXMgKacKOZCRm15LZT92THX2Lg
 Syfskw6SyxvpVgmtsPOQHKuX+fDbiik1xqMrd2ptOlDI2zWqS8noUs4Dh/1pL0XyZI+eZAO6pdb
 2NsX2ltJtvBKE050ej5FqGXGs+uh1txab3/7Qq+vzGpiaX3kfVfCSS2zYN3njixIh38ze//WzpS
 b0viVlJZDhsW2bxMkstYS2GhwFy7cjazB5xezmnYFbbidq3bO8DNIr7955IoftzRrYIP51Xav5V
 IuJDPPuYPRtDdljeVPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MSBTYWx0ZWRfX3isWfGmukjMK
 7C0fWixr1JOq9PaM3BU7tzR4MsbCXM028liaQfpZ+gVG0QchjYnUEEHhRRDkGGvuElRe/YYREnA
 sseqRsh9XNqiEP0fcXQFqiuwKUsdp4kAfErZ0eYHsdOHx1GezHgx
X-Sony-Outbound-GUID: _uy4R2q1--1baHGUPRSxKHKFNw3BLLd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01

> +               if (folio->mapping =3D=3D mapping) {=0A=
>                         folio_mark_dirty(folio);=0A=
> +                       pos =3D next;=0A=
=0A=
Setting 'pos' under this condition may result in an infinite loop.=0A=
=0A=
> +               }=0A=
>                 folio_unlock(folio);=0A=
>                 folio_put(folio);=0A=
> -               pos =3D next;=0A=
>         }=0A=
> =0A=
>        return 0;=0A=
=0A=
=0A=
=0A=
