Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0032E1E1A3D
	for <exfat@lists.linux.dev>; Fri,  9 Oct 2026 02:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514027; cv=fail; b=Wpg06hUYqLzblqK7+82laJbaRxkhLcIHc6V2ZR9iZs3D1NLcJKjANuACGJvS+ekppuXGSIDjRkR41OIhTjXdepyc8j6v/StjuD9mL3QnZggVtv10IIbnd/hzYSyuwEizXL/cYNHIby0zK5JYkQQaWw4NXQ7B65UABpPV0ZJYMqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514027; c=relaxed/simple;
	bh=7j/5RKQVqSuwtLDO4BWzPODB7HSpBYWNwUvT4l110UQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hnws1M3FgGn8HxI/e/xZY4FSohgzUPEeqOAktogXK3+QyUGeHFkMphcVrmsIqDynptCdK50/FSSpc1L2NgIz7uaK2Rb9IsztK1wEuZZYX8LvWHHoxpD+jW62dbVChtyhSGBJCR6eZOjduqHbVvrsl7xUoN8X0KrnSSbZbhhePgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=P63N3R/O; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="P63N3R/O"
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990PBbI743899;
	Fri, 9 Oct 2026 02:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=4J/fAWn
	/6h976P/K7ZxckVK2tgrjHZ+bPBYMn2WcYek=; b=P63N3R/O8+E+OK1snIOa1ko
	Xw1Li+yKLPax5IxgFNIrY+4G0NqGq0gvWq3zsHAQ9nWh5y1ZhlnJ8E8Vb+aheZxJ
	0FZ9UTtss/+18MuMOVov6HafTfVfTL2MpuZ/l7mTBEyomaqd4KblEvhhUBHDCGKo
	rxEwCi+ibtHG+TLupZ5mYRRsXXTCDIT66MRj5gdfIo4uwpwLsCuTyFVDFcydKBdZ
	Wh3VWU0OVXWaJFlIWJEH+c8H58/ObE5DrVp01P0HUjWkgvNQLFDpkVLaHdG4Ybx3
	Mp6Q4tfxC4006h3wub6zPpqfJIFRsmasMlM62yUZyiroaaXBzpb65eOr/D6WEXQ=
	=
Received: from seypr02cu001.outbound.protection.outlook.com (mail-koreacentralazon11013055.outbound.protection.outlook.com [40.107.44.55])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4h5xdgherr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 09 Oct 2026 02:46:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLMBcdCoxbO8BVHGtTRhAkP1uB+uOJN4x3LhVhfV+aXR7L+ZoIwcR5VELzX/y+InmuXTCsPyZCTkB/PMN0aaTJ09WBiqsgswlJUZ14rTuWYLQgojlf/QQGCjIhGMzhoa574O0nVOVjANvV9dx2kVr4wVo09d7SHsisISBt6uIuCqXd9FPZZbxPFCp9vLTvGS0mAXtEhcT94qk7E7ubaRO2wdw5mr8RSxa//L+CoiJGp2gA8wo8dv314q5u+hStKSN/pdcrEJ7Wf3e7uRFhryGMuYH0LhuYa33lF/zUUJnBlXBsgOW7wO4U9YznEAKZ/cMgowTA5wzlmhJB5BdSXbgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J/fAWn/6h976P/K7ZxckVK2tgrjHZ+bPBYMn2WcYek=;
 b=ST2If/owM/63I6p/1770qR4GwxrWItsXvE6+bZuRqKoFl23/l1QaKM1kgpx5MDcWh2DvljB7ZjDSi9aUHCxFB/5inpb79Clh/iwjkCh5+9sqN0Vh33/b60XHRd/iyhIDCNjKQgyhDi6XjJ9BE7vkKyyqLvAlLRNBiOEkQHx5Hrqlv98NSAeHwYCIQyAFo51cVsQ9KMUoM9xCmkbCtHPGbvxc2TTc/7tdJIoRjuKLnNzAL+PR8dtfoKBaUr3+iTwcLi9zxsZayBjsVdWfygefZqjdeP5fqDEY0H4H/7miwSQLE0AFyNUgybaVAj72PWXPfzxK0TRcuzu8v8M2SItQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com (2603:1096:301:fc::7)
 by KL1PR0401MB6211.apcprd04.prod.outlook.com (2603:1096:820:9b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 02:46:21 +0000
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::a631:6b1a:332c:831c]) by PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::a631:6b1a:332c:831c%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 02:46:21 +0000
From: "Yuezhang.Mo@sony.com" <Yuezhang.Mo@sony.com>
To: Chi Zhiling <chizhiling@163.com>,
        "exfat@lists.linux.dev"
	<exfat@lists.linux.dev>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linkinjeon@kernel.org" <linkinjeon@kernel.org>,
        "sj1557.seo@samsung.com"
	<sj1557.seo@samsung.com>,
        "dxdt@dev.snart.me" <dxdt@dev.snart.me>
Subject: Re: [PATCH v1] exfat: mark straddling folio RO for 4K block size
Thread-Topic: [PATCH v1] exfat: mark straddling folio RO for 4K block size
Thread-Index: AQHdUMi6PIMYj26g8UGMn//t2iEhgbboI26AgAxgUz4=
Date: Fri, 9 Oct 2026 02:46:21 +0000
Message-ID:
 <PUZPR04MB6316DF5C2179DCD7B4200A6A81922@PUZPR04MB6316.apcprd04.prod.outlook.com>
References: <20260930104332.4022207-2-Yuezhang.Mo@sony.com>
 <ff3a2271-542a-44a0-b5a0-700990119630@163.com>
In-Reply-To: <ff3a2271-542a-44a0-b5a0-700990119630@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sony.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB6316:EE_|KL1PR0401MB6211:EE_
x-ms-office365-filtering-correlation-id: da8a4de2-4720-4986-ddb4-08df25af8054
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|38070700021|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 xg2qTKUVXT2MxL98NN6xGdqb0eshvpNES7ZKT0tHWg4yKyDXnlaVz/EdtBkFzwy6d7auPLwDOaChHTy1iY24nXit+WKzgX4yv/5LS5gskJPoIdwjMCPmM1jKbgy/RyJCwC8+rII1mPCKE6UHyN1YL4KhQYlOEZX0e0jXHBbsD3X7JHXJHDx8EvFnjgEkyPyqQhraHf/WuQp1vWThpfUkRZKi0RwG8DHfMfiyZw27LswtxVsuNTR+nvk3IwMfYW+Twvyj1Ta+8NAftJaL6x30TslbReKv70YnCpGY8lA2NGD6iUKI+cFk0+OKxMnw4Gf17b7I5aSxHJNnRvUuc4h22qKzmnAcdwRQjiBLgy/Fs7ExZFwJFG2w9OApw6suqdZ+5vvtOzTBpnlJX/5PQRa6Se7CMdKDhcH3K+EJARHZtzAzuKuiCHPQgxN/Ypaa3Mh6HPfxePfBxX+bg2N7ZpC4qjbtM6Pdvbl3INFRCNMktgW+Zc7MH1lvTalPs0IyR3ncxzDH6mcdSNKEwFENdfiEpAj2BIXLuVPPk5dChSmJxmmklOK+u+nnh9Q8n08a7hnNurl3e8JcAdPBm0EuS0H08xFqojtpTMNobh+Kjo1kUrrsM6i0/vD2k0ZGt+6Oi3v1zXnMllgxieqH76Cc/fzP2ZKS2sGYWfyNnGDfV8GAGUhr4bHyEnEeCEPSXLfaOeOT9HnkAc27I0ei4XhBKN79JsgRW0PXsAPjCUlhNb0l51U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB6316.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Sw10ySij6DTPG/D+aeETngdLFsKHndhcFA/UufGp1T/LUW+rOlHiHDYAe2?=
 =?iso-8859-1?Q?IHRWVKKJfX0ki8yiaLighOaPI55fN7LVH3s/UdfaIrnumHxHSDlZ6wcA4D?=
 =?iso-8859-1?Q?p0gBs8SQyWTDlsCCa9SNx3NGFaONc5OVfkWvs0lC1ic/+psGLHSlXbxzGm?=
 =?iso-8859-1?Q?9FQFk/j0Oa4iyfhX4VSte7iZHezfF8vYojclQ1RvLOqx6m5xb3urzqcrc2?=
 =?iso-8859-1?Q?ShtMGKG7BfToAEBNt+QBqjptm2AWzJB1d3mwudIm6yRnDwinchb4dqa0X0?=
 =?iso-8859-1?Q?SA+iTBNoDtoTuzo0gE5593ETnaJrAQQ0iB2IYwyFEuMD2AwHszE7N69U4x?=
 =?iso-8859-1?Q?SuPEA+eWygREH+eLBMlGyLw9MzKuyoDh2+5XMDRyzccXhK2EraKl52YYaV?=
 =?iso-8859-1?Q?VrvhUKA4i62a8bJa5fdNHbiH20TVTK+6IPeqGWvLBnvExxVH9nUVOSkX1v?=
 =?iso-8859-1?Q?H5Xf6bkqIv8LTLO2gywEhTngahKrq46jJqO2MMMjpyPZMWp+Mj/zjjpsZD?=
 =?iso-8859-1?Q?oU5CZtEa4xpbUoPPT/j6Rzt4t8pgbihovD/dlj1XXrQvtA5PD1vHwbXwxC?=
 =?iso-8859-1?Q?bFvNqQdE6YVupX+2Tro+8ztuzJ1gLoC9KuS2xt8YJ52+zdSgXdpepENbZA?=
 =?iso-8859-1?Q?2Iy/akPGiyghboYqDZD+mb872VyRn380ieJanFO1wGtaztz/EcXrqNYj3J?=
 =?iso-8859-1?Q?mjq+uJWNT68i3QTJP92v9SccZ56LTRL+0Tvgpg4FC7RF+eOADePDqpPUD0?=
 =?iso-8859-1?Q?Mr7mGD2I4+wuA1PPEt5fNz4JSqHeSLm3mSuT++lRlfro5YBJeuIIkLr96C?=
 =?iso-8859-1?Q?5EH0xhmmm8xjQVvVNiwWQGHeGP/ijYhE3Wi//VoXgPfBwTVjILnWGemJT2?=
 =?iso-8859-1?Q?y8oNbzJYGv5BYg+04nQgf6oxrnot5sCtG7jCYgR2FiuIolvtzcWe/GuGFZ?=
 =?iso-8859-1?Q?7q6DeTZtWeyy7blsj6Ix4XZSGDVGGRJbGIEk0Ffo5zyFbXQEbb9G80GqgH?=
 =?iso-8859-1?Q?goka2tWRb7NK6V2opTDbSMfoCaPXp6MkLXbI9jGdemq5DKg5zRLetQfVvP?=
 =?iso-8859-1?Q?GqOhtgyGWGTNnb8/HpRtC+G+9LDJqnyYKunn/iFJI8K9FwfvbByCdKjTPd?=
 =?iso-8859-1?Q?m6gZaTj/bYt4AYnEl8varfZCHgwuC7aP27A+svgPr391VOqlIF39ghnkdE?=
 =?iso-8859-1?Q?6sKg+UjfGyv6FY9aED4iXupSz+kfb56/shzCtS/xw+eLx2q9qSQ4BsF1Q2?=
 =?iso-8859-1?Q?iLVmkqbxuzL6iIIiVjtY4fRRg6RsdCB0cyZprQDQlaEMkBAaP/oDY/Wggd?=
 =?iso-8859-1?Q?KlaUjZgjJCi9ytJaAbweToRwV0S4unr3e3DdpR6E6nrRiXKWJHJb/Rsiuc?=
 =?iso-8859-1?Q?RAB8NG5nXSFXlqRImuOsCa6lpB4OfTMrpnX7BMdBhGikx4iJpvKlUbtAAn?=
 =?iso-8859-1?Q?w2z7G/MP+KatgZ0Be5sKMsUbCf34RR9igtHaPwY4NixETqIqeltBOkrPL9?=
 =?iso-8859-1?Q?b7CtO6fFm4EJMPEWTDIlv0XRwbG9zJ/LY4MyWjwfN3gz303yhGaWgtx6Ym?=
 =?iso-8859-1?Q?Jef1fDKB0X1ZMW1kJPSSS4J1sfeHnqjCScC5+VxaNJXQUa9/B1jL0TPIqk?=
 =?iso-8859-1?Q?FGQ2mi09Tdppf7LQL8krQm39KiW9LzUwyzCf2Ml6LICSio490i7cvncmBe?=
 =?iso-8859-1?Q?vyAEiyXhpHPj/KLnzN7/ulmPeHG3DH8NyLyDkG0UqQLn86ZQydvURsY3Mq?=
 =?iso-8859-1?Q?yoSSMljUrqQ66ueGlM/3VV7qcyhQNcV2GpisiSXl4jxpb/D7ZUJ0ROqiCa?=
 =?iso-8859-1?Q?wBOfGK+3rpT2tYL9a7LsNgwDw5Ns3+M=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	K5ETp1uJBlbe8WnCtHkEaw5cbXg5LCuoon2KmzSZZSV1Xio1UFg5GMs0q3Wa38AZtvqQ8Qh3VpM3nWLrhzO7b4+/ayNhiND8QHxVNe65GS1R9BxSo5lwxePaAIsqW5JZY0KPxvQFIi87Hd/48VSdkXKFRUgZc1pHLWQNB055wtOmjQDM3ikpBcRRcBOeCMJDP4AuYDzOQsAa1tNA6iwnqctyMCn6hhmrwmX9Ez3CYdE6WzcyTUyu8x7qyL0uLR5PJ1Ddiv6HCq+138EySE4GsMtXTJjbafcRVinOWbCi0dkSOdzGmOhhFskfL2nSZ+zlaP9wAJh94lc4IDZlXtaX1A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	h6D9ovPRLpLHrxjhmeojZ3gqDyFwaWxi0BGAB2A8gjGWmmVlxV86mSwCHTVHbSVFBNL0eFgigCAZhIa3KDXltp54VT8q/bj094hGS5GLL19h9IuUXgMR3wk0Sdksi4wg57xR8By2vQHr0uvMDSKIWf49JomoVyOPVPPFCUNdf3ZheXYr4IwkJ424HU5wp0ua2UF/a7c4jxUs4K1E5EQrel+GCs1XWY+9/UTQHSQbQyHbeuRIV3b3b5CYyjJt6T2jNeXySA0LxFKtj7ZS/E0qsRg5bxFoDFpgVKPZifCJyFH5Q9kvTjUZ//8N7+lalOkBn02OKDQK6y5T+G+uRNKpLn7+O23WLfjw0V5/Q26GBaTIpjY4QT+qgEUbVvo9dflEkAP+/QRP39H0iWwARI+aFEaL22ovrgJAm3eb1ea7h17iYDWX6vMKKO/NqJ90MHDelSuFZuU1fLLatT9WMSeo73jZg03os6bOEmbLyMfdlrQALljwNqdQA/u1TkqGMvlnnWhuIF0wlUOlsubP6SbPbQWDGTd/PSHzkfrvXCIfXd8Qc8UncfJpCj7dhXhwAZviU4GAU6c5Q4Hq1trEJNYDfPhOUbezFP2W+QFCuzKCK8WSt9/16zqYbFm/nl/oWo1b
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB6316.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8a4de2-4720-4986-ddb4-08df25af8054
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 02:46:21.2035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: io2FG6bm5NAk4JtlhpzNRtd2yKD2URjBQMhMQG5PELOjfkm4RvH34tlqZvIVdvV+23Y6OhwAu0QQP1VoTixKFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6211
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxMCBTYWx0ZWRfX07A+SRwJd+kH
 baYk075HItZE/PMa4OuPjVz2LsgtzPPt17h8ODFurSD38YpIm9q+CTs9Mysz10J6ahAklFj6+20
 T2hWB4kdqkq/k4JfnjeZWsJdhgT2rGGLCO64/7PK3DEEQ0NMDrvO
X-Proofpoint-ORIG-GUID: kGMMzGww79DzcqTDg-K1u5UpbTFoKqjN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxMCBTYWx0ZWRfXwddkfUIU4GAo
 VZpLT2Kwdbo+J/2x6AWm/UtnuN93Cv3SoekRALqb6yVAOXg4xl7fnlzQoCOQTRxsho0vvSl1ow8
 a6lvsaJtDwleYsxW+0pCVe8OM1hL7TPJJrk8zPl+ssa2E344mW52siOdZSrai3Y8Hrm94mRkrCd
 QP+ABalgIYoKUXl0sAstbqF7pObVqwTI9PxxYnrp/ST5ulq4V50lQVHNi6j50LvYzOJmoD4JDQj
 GnGXzQUx6yWrI9ftlUabXTKhpXrLc1X7sYPiDmKYaMzPiRIPEIT7qDvKY5F4XSFk+1J2hIX1A5z
 vW8EZ1gHutj3T9roDOu6cnSc45NeZlITL+K8rY/oSmFaT92al/LLPnlaGKRGj9N/rTOqY51XSzi
 P+hpCaEHlsojJ4Z5H7n7w0ZmQ5UC8wIkX83Z5wz7Ap08YS1Nhf/JyPR8G15Xcc/d7vaJ8UW5gm/
 s0zzS82M07rwqZ3YdSQ==
X-Authority-Analysis: v=2.4 cv=YsCa1IYX c=1 sm=1 tr=0 ts=6ac85585 cx=c_pps
 a=9sSFmBz/HBx1ZOhNuxQbag==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=7j0FZ4iXMVMA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=cIyGuqrkuvkXWOl_fzuj:22
 a=hL5X9aV1IJL_vOGeEhwA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: kGMMzGww79DzcqTDg-K1u5UpbTFoKqjN
X-Sony-Outbound-GUID: kGMMzGww79DzcqTDg-K1u5UpbTFoKqjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_01,2026-10-08_01,2025-10-01_01

> >   #include "exfat_raw.h"=0A=
> >   #include "exfat_fs.h"=0A=
> > @@ -91,6 +92,20 @@ static int exfat_cont_expand(struct inode *inode, lo=
ff_t size)=0A=
> >        */=0A=
> >       pagecache_isize_extended(inode, oldsize, inode->i_size);=0A=
> >=0A=
> > +     if (i_blocksize(inode) >=3D PAGE_SIZE && (oldsize & (PAGE_SIZE - =
1))) {=0A=
> > +             struct folio *folio;=0A=
> > +=0A=
> > +             folio =3D filemap_lock_folio(inode->i_mapping,=0A=
> > +                             oldsize >> PAGE_SHIFT);=0A=
> > +             if (!IS_ERR(folio)) {=0A=
> > +                     if (folio_mkclean(folio))=0A=
> > +                             folio_mark_dirty(folio);=0A=
> > +=0A=
> > +                     folio_unlock(folio);=0A=
> > +                     folio_put(folio);=0A=
> > +             }=0A=
> > +     }=0A=
>=0A=
> I think fixing this issue specifically for the block size =3D 4K case may=
=0A=
> not be thorough enough, because pagecache_isize_extended() may also fail=
=0A=
> to work when the block size is smaller than 4K.=0A=
=0A=
What condition might pagecache_isize_extended() fail to work when the block=
=0A=
size is smaller than 4K?=0A=
=0A=
>=0A=
> We should set the folio containing valid_size to RO whenever valid_size=
=0A=
> !=3D i_size and valid_size is not page-aligned, regardless of the block s=
ize.=0A=
=0A=
We should set the folio containing oldsize to RO, rather than valid_size.=
=0A=
This is because, when the folio containing oldsize was first set to RW, old=
size=0A=
constrained valid_size, after the file size is subsequently expanded, that =
=0A=
constraint changes, necessitating a re-setting of valid_size.=0A=
=0A=
=0A=
=0A=
