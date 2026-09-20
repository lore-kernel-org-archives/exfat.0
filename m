Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180021F3B8A
	for <exfat@lists.linux.dev>; Sun, 20 Sep 2026 02:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789870682; cv=fail; b=YTgrsbMsY3hExF1KbTZYKSV+QLwEodd/jcFuF73G4+sJxNUxJ7seH5ocfTqfNPPlx0r8bQv5MyZR8UtRv5bKt1rLroJZI0p80TzPo4NxfRP0auNCuZhKJvC8RVoWlxXAfoDFaf9uEwGvx95hQy3GkveladKmmlzuRyuk9LMOJp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789870682; c=relaxed/simple;
	bh=ogZXLMOuKGuGCbYJ1Bi4XgglGUuzxR70KsO51rUbZvQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dlOrMW//x8mVP4xOA242hXKfcqjqkxBPlYxv8rPwGfm/3gRe8TT5UicWKwMY1WanS15w08kug/w8xv4t56giCSGTjN1Aw48p179IDjqK9kj5Kt1pOBzV2ykJjuzjeQ49o6i+M9CDbjPyErgwjY2hECyB4dsXIJMU106GsipOomQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=sckASM9h; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="sckASM9h"
Received: from pps.filterd (m0209324.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K2Cn1d2419467;
	Sun, 20 Sep 2026 02:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=ogZXLMO
	uKGuGCbYJ1Bi4XgglGUuzxR70KsO51rUbZvQ=; b=sckASM9hcBFa392eEnZbim4
	bfGxhzbv2qSIXEy3dpcI5VHEHfSllu8Eza/fclwfhBlxwRN4tFsXOdK9siMRPurH
	n8xd6BG5tWhA8wQwbapDDa66PtGyjRb1RCIrFVZM3D1hkaXBEOu5C65lXWdrNsxq
	WdOGzmfsyEXLRCX8zKXJGnItb1NSYwfuMrX8Ce1lZ6mXCgRQ3p6Y38Tm/pvrgjwM
	wAXC6MW5PjQIV18YvrX2c6B+IcXDNA9VaWeYWSgQDqqPihN3LqmBNpoZGRfkDVHJ
	mH8vFbaeTMzZqNZzwgp0JrMi1rC/E6A/yDv0x/NOX6dzQNz8KAD4inOtl3h16Mw=
	=
Received: from seypr02cu001.outbound.protection.outlook.com (mail-koreacentralazon11013028.outbound.protection.outlook.com [40.107.44.28])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4gsk27gsa9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 20 Sep 2026 02:17:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLhUP3DBUWYVQcAmNFvxGH1gqOqB9tHwtPEg8sJ4FTAi0zxDDXseAIUCUyFF93GyiqUYlqjZoiuv7rWuLq8wM3M9TpB9hxCOo5xchjDxzfUVJ85yZAsPfGHfTnaVf8Wx2mXxqmrfAAXCQO9Esg+WOiVqYdNmqvevoHollhSRXvWICSD53xTwcp+sTiD4KRgdZIcQglaXshmQFf4Ft6nSNi1nBxeciusudcLMMb4vInU0Z66zZYrGLGRtzwarrSplTPgPV6pSLzOGm2JyRvVTyJM1vKB9JGfqN3MbfyIefZ+FulxccG9Blc6Fuz0s9GGX+f3u6w8rQ/3lbbe9O08aog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogZXLMOuKGuGCbYJ1Bi4XgglGUuzxR70KsO51rUbZvQ=;
 b=TRbi5MB7JfsvNPdebjKnED1LmyrPl1HX9py+/60drTQ7xmilHcAg9GDK50D8hx3We9bjv906ucCSSik3bq2cuxnY7E0qkLg/DF4pWJm17UKnsNcgOMCd4VyJZBLeHRP6CkDcItw9Hl+Yyyv1Yt76aUBCEuQFgLp8C85p6tehXlwNWg8bVigC705ctvi60hA3qlabfkuMyXFaoMCJ8g2lw74oTtSbjLmtTEFiC17McwLjl64zijcFmhECck0auZ99kippnGsDlddJtGhad/UuZCojIPxoL/S4h6r25Ll3OqlmvfUzaKn4bepB08wZW44bcGNOH6kTc+mjeO2zdboKXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com (2603:1096:301:fc::7)
 by SEYPR04MB6918.apcprd04.prod.outlook.com (2603:1096:101:d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Sun, 20 Sep
 2026 02:17:02 +0000
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::a631:6b1a:332c:831c]) by PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::a631:6b1a:332c:831c%6]) with mapi id 15.21.0428.014; Sun, 20 Sep 2026
 02:17:02 +0000
From: "Yuezhang.Mo@sony.com" <Yuezhang.Mo@sony.com>
To: Chi Zhiling <chizhiling@163.com>, Namjae Jeon <linkinjeon@kernel.org>,
        "dxdt@dev.snart.me" <dxdt@dev.snart.me>
CC: "exfat@lists.linux.dev" <exfat@lists.linux.dev>,
        Sungjong Seo
	<sj1557.seo@samsung.com>,
        Hyunchul Lee <hyc.lee@gmail.com>,
        ChenXiaoSong
	<chenxiaosong@chenxiaosong.com>,
        liubaolin <liubaolin12138@163.com>
Subject: Re: exfat: question about valid_size and page cache
Thread-Topic: exfat: question about valid_size and page cache
Thread-Index:
 AQHdRYO9q6PXWEoCvEuVMfXNtoWYnrbQh00AgAApJYCAAbx5jIAAIXAAgAFAfbSAACbtgIACykDI
Date: Sun, 20 Sep 2026 02:17:01 +0000
Message-ID:
 <PUZPR04MB6316FC1A97FFF6A062C9A6D881852@PUZPR04MB6316.apcprd04.prod.outlook.com>
References: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com>
 <CAKYAXd9wnmVyp4ONjYQPs5pxo_ruDmCN_yu7Ma4agDP1n-NNBA@mail.gmail.com>
 <7380972e-de54-4b56-a67c-842be8887c5f@163.com>
 <PUZPR04MB631662C55F38599C3E6496FF81B82@PUZPR04MB6316.apcprd04.prod.outlook.com>
 <fd531465-622d-43d3-8c2f-ff38fb527061@163.com>
 <PUZPR04MB6316BE1BAD8C0AE697150E6981872@PUZPR04MB6316.apcprd04.prod.outlook.com>
 <0fa9e808-0401-42fa-8ecc-776cbc67e918@163.com>
In-Reply-To: <0fa9e808-0401-42fa-8ecc-776cbc67e918@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB6316:EE_|SEYPR04MB6918:EE_
x-ms-office365-filtering-correlation-id: cfe5e1dd-bd6b-4809-0553-08df16bd41da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10070799003|38070700021|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 APJhB159lioAONXybVcM6kpHN+j4zZcnwRc/Jws37pPH34atZlP1zXSNDckmUFFemtauNtH4+jzW6KSjssil8GHxj28glHEpmG2jVOjbbKiMP9yP32yRb+bJjgjjDa2UoozaiVQ/IfO9j0vdq1tDjCh6fHmzvYSe7LWjpQl9MNE8kRtDp+cx+yw7zWvYQgbIPHZdn4Vu/eJXPa26t8ix+ueBkb91ylfJsOlg9T5InaoIkZ5aCUNDL2v3bHJCODBE5GQg8Yo5m3D/zMcNEqIHQMU6mj8nNQsbq9Go3gh6c8rRew+SomgBArJqwWSvUHHjupFskr7t+u1rteUse+esLt7nyHiE7W8ObU30UlEkEZicRUhTCFxBO6W7qkxWDfzg3ktql2rpge+dY6eFrtFfvN6rs+4MnWuaDmxH/p/vUTMdwf9WbaFcIcgUmlGNeI0nv6u+WAWbRkiDZj7wEFG9ori55+uhsm4AzoZ9HKobRPZABZg/bHRfXclwOjJO3OifwUyIyAehzB3pD+QH2BSV0iiUC3PcpdzEk/BMK3r4IVsbPz1h37IBLtVtqMvKDZj1ozcxL5zBlEueHjW7PDYchgxpBg3seQrEguPiZVqH56/bxhGSw0tBDgT6CoQj0929i9/C5TLMz4BRmpMfqyA26FxBImtkdG4C8dT6QhimvzZicXOqJKKJMY0TkSUwBAOKmGnp1LmF2MLk1kbqA5GhIyQqUwbcoWV1S3+jZ/EIlxQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB6316.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10070799003)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?YIQeLW/25GZBfp5jN9sfscn7Lw6A6DvQKi2Mbmf004jcWFPLe45tMmt1?=
 =?Windows-1252?Q?VLy7SI4ep35kufyCXP3bvkfvcgXbFpG1vamKwF8Pbz+utcU+QWV3vRND?=
 =?Windows-1252?Q?K1twJOENK1/yjXkp5Ec+K/CCC/Net07EWnj34cHTIeZE6p2EhGih3doc?=
 =?Windows-1252?Q?cn54H9ceDipIraLJz0DhsKnkpt6qCCQfXVSjJFp0e+xVqUqEhqtReq3W?=
 =?Windows-1252?Q?GO5ON2E9jrhaEujgjlMPp8HOh8vqV3xEHj0oHb65bgH4j3JwUVVe+yNe?=
 =?Windows-1252?Q?lEGeccy2TmBfu4Xxmbv0jFP94hLCd5qCC22JlKxZotgg57KSIqUy/g0H?=
 =?Windows-1252?Q?dN0LBXZfNMURdBjsSvzEx3XVZUe10t7B0+UsS626x7KYqM6LQsf7ZVFg?=
 =?Windows-1252?Q?xzn4w4hv+r9uiEhdGjxoI0JP9fwIyh4fYy4yPu+BAGyY0CdJfoOALpL8?=
 =?Windows-1252?Q?5EEat5HtMtVSW/skyTjU0OjXdPVg0VG11ZG7NAwexI4CjroXNU47OVyT?=
 =?Windows-1252?Q?/BdSvZQoRPbmtIl9WuCmpF/Y/mZ9fSrELZkabgB9qy6rPA/2eovj6FeO?=
 =?Windows-1252?Q?fHevKxWRx1Fv+woNKoGIqUbBmBUMSECBiIT9GXhFCjeS6Mtn23ImKiJP?=
 =?Windows-1252?Q?Vc0D9x20DAXUt84a0FJmZQL1znuaz/APzUhozhWSEGewehe0y0cQAYsJ?=
 =?Windows-1252?Q?cJ0gUUG8GNEJiioZExmWMgBHAhVQo/j3dAtZCNjLMhqLKK0yHkuMz34G?=
 =?Windows-1252?Q?V8N3PaC+fnyqf223O1wqDaz+4UKE7GI+/hW9XIgeYSPmIs02qnXaTFCQ?=
 =?Windows-1252?Q?O1pQHEgA3CPtPVmxICxPFj7IhV7XaSKQTQ/+NgmwNwssx1+3pPUNnFRf?=
 =?Windows-1252?Q?rqyVwO6ZnIjelZuwD04ohdCVol/efkTTIQ294ZDS0YNnGmDSNQLbzP91?=
 =?Windows-1252?Q?Ut477pYuegKXpk2FMP2mXUVdBRId9aIJYNE2jtsdyVhZQ9XbO4Lw7P46?=
 =?Windows-1252?Q?Wly7UcFWmkT9JYBq7Euhb4mF+GJGzEWuxUquYBHPZUmH+5pSQZd6YGvT?=
 =?Windows-1252?Q?p+HJMH/hgxf22AcPAUdQPFy2TAwDgw0IH+TDlbLE7wZLUSojaexkfs46?=
 =?Windows-1252?Q?9TpxRGvo9JxmImNTjgLvcN43Akf9g9u+mGVg2pvu/4zP40ps91rpsCHf?=
 =?Windows-1252?Q?7BgGyJJVRZxuhQTq5mbdGi2fuYZyakcItPg2x7xfkjANLVvX4ULGmzLX?=
 =?Windows-1252?Q?ly2mjhUuSSnnQIynZSukDTAyyy/45i9+QLLSqfhJJDrVYnDEfSSo0UTv?=
 =?Windows-1252?Q?VY8lBvbc51wjmhvZM3U3BvnJ5X9shC4+jU0FucRQ1cnvggGzUZwl3hdR?=
 =?Windows-1252?Q?EPdaAB0ITntqvTW0eBGX0FJYwJegMG4r6uroKx/I8BMclhY3zY/X4EZB?=
 =?Windows-1252?Q?00NSAH25CeJRMeyHfQWYvt4is3iUxnYyLQLTDMDDJS5aFtQYUlQMxhdX?=
 =?Windows-1252?Q?eGjcy0e1L7W3cuVWQdoAxSpJlexntXqrBnIjavwgqcUPAhT4gK0aPNRp?=
 =?Windows-1252?Q?UlRzE/SaStT5eaoQYYPj22grrrBiO+rW6o6qzXBjGgi9URTywnQxyhNd?=
 =?Windows-1252?Q?N/qcJG3ite4FhREXPfwk9v2zEL2ItzaA7H6qS5qX8bX3fEGj8PZHCIrC?=
 =?Windows-1252?Q?34ybz+23BVQ+bHmA9iWsXdGTd+Dx2rnF3EqnvqZ/RAfFWqSu6d2fgj+l?=
 =?Windows-1252?Q?RiH+PuYTZVe3rzhBwowxGJ7pUMWxpMAesnbOAvmP/U9J4lPyUVkVGRca?=
 =?Windows-1252?Q?zAK22fQ4eGj3YpVW5KjDOuJiPt6ZA0ezxjr2R25zVX0wzJ1ljVxuu3GT?=
 =?Windows-1252?Q?qwq4DB55oP8HB2JoKXN3OsAbMnomjczTyihypxCcS+K1kFmA7cNtJhyZ?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	4QtW8OWBrMa0r/SzbmXstGv8pMnEPeas8UuwWU4Khp8CNDfaC4gYIw8BhAFvjQiCy4OMVBDnxFTW+eFUXjzNSTYWHN7epUkElY3i6ye7yxbSvq7fn8lSoyA/T9qjZoRETfI8bH03qpxRObVZ1y+tYopZObz/CvGkyapMVi6LitEHDZ6Xa7e+zc2qiy8gvapondAE9QKF6paefd2zidSmpHtc4K5fmpqO9npjX35wtT32VRk4PJ2gEo1+TYbBNG+TM2sJF75lZNhr3h98YsmLwsbWSGXca0EtIJAhRqRdKRh3txWYmZQGN9z2k+7a+yHjzfmfah3v5zrDMWnovvM9Tg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	k56RT39Vxt4sF9swjvuOPgN9ee33b0UBXrjLoXZ2lcutVOFjSz7qY1R+gI7n2O1MmARaEjNK9uCiryJOeHI6znx96jS8R1a/vyMKzUVCtjMuxZQLJpQdx9uQd6eaTPJm3I1e230vRLhOZRPVeBlvYyHWJBKRUuFP+G7Kf4TKuE/yB/KGU0/25Ca5MXQ07D+NXM5p8QevqD3e+b4yEMyRdfNrPCqMy1l17b+PxMLALEslg4nZ4yr6NdIUaJZLSqQmIdn7EBztzuLdsRH3CKB19WoialeXQifep3V9q+qkfdKmtgGF9afcM0eOA9ZzRvr7+rzouo3mUzqTD8X3zOWvvOhUWkNzP2X/SQrGzFZwztLkWxtGTmgsMWeavPiJgxyOlmV1v9JOwEYvE/Bz6AsTZWuDX0gU9nW50fMVdGQy2YydWyuq0BigoauZRVcYOZtetIh6CxIWyUgNC6Sjuut2ElITqh2Fr99yKSv+jbnUJ/x5KBlN7PWF7rkOWhoSH+8Tc6Zbw9KZZ38tKSAe0Ls0qdfXplGWkikukUBTF7VM08zjqHrGLrAWRNhA8lRJISI1QIoKmts1V1SJ2MOVm/VBXdLybYLXfQssOV34OKonlYueS5BQqX2CArju6jbDK3PK
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB6316.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe5e1dd-bd6b-4809-0553-08df16bd41da
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2026 02:17:01.9116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g7wUbyCi44qH+Kj4OS1j8iLKq0/YueNDkWmKfjmUpD/Rt28/uhvpfbgWvCZsgNglBz3Oco2iOjouXpTjwn1J8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6918
X-Proofpoint-GUID: xgMb7gFMAmbBTGhHmbdSonXWXvTm4SjC
X-Authority-Analysis: v=2.4 cv=U5EHnuru c=1 sm=1 tr=0 ts=6aaf4227 cx=c_pps
 a=hnWJsWHqrt4mB8fUynRQ3A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=N659UExz7-8A:10
 a=VdqzKS8jKosA:10 a=7j0FZ4iXMVMA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=I_Y4LlEPCAdqsIK1J1Zo:22
 a=Byx-y9mGAAAA:8 a=z6gsHLkEAAAA:8 a=ZUJAj8c5l9IcerkTsp8A:9 a=pILNOxqGKmIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDAyOSBTYWx0ZWRfX90KuTbrZ/D8C
 NTibrXo1aOEYPbDjI/k9VavzoZmAtipWl0x/lQmSzYDraIFbfpwsTLCybR/wdiNE7CI+3u9Nu6u
 wAG/IVlAjVRcVuULxbuhpU9zSxdwvNDZUrMX4GS12cu6zD22Q+2Y+xl8HYEqJ+uecvhYuIEuQ3T
 z4pgFLXXKgIZVaZQ7kfSKihDJPlHWPCD29aRiPdb8IaWwcVodt9+TvChmJ9uVjXsDFWXuYc7Uxj
 WxwMPEj2gj/De9eWvCTpqHZp7UBoDm8FXBr7M0BTtXw/sBh8ZXtP9rrOKnd5t8p5pA/VSqiZyPy
 CUxHfnoXVH2DUlnWzwHMg07Po5EFUbCC2FhjXoHg9nSqZc+0TOiIUZ+SUtXHlc4XXkWvZTEzxoU
 C/3c56oNplLQkrOReFBXCoXE2ndFh4WSsDjfgHL2+tzAmFE9YNjLkCEvvDdVN0W8Kc7x7MU8gaf
 Gk6dWlVPRDBAJbh4F8Q==
X-Proofpoint-ORIG-GUID: xgMb7gFMAmbBTGhHmbdSonXWXvTm4SjC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDAyOSBTYWx0ZWRfXwFhhbKwcVWhh
 ItyJajXCrwZr/nU+0ltPyvzFDFjILPYkE//rHQxYkvJwhWFRLHa4o0Qtcahkfe3DrJT7hupT0PH
 PfzMbE25j4hIhIdKxtJFKPyoLQq9dmFwKsHKBVTEVQY1Jr0oZphY
X-Sony-Outbound-GUID: xgMb7gFMAmbBTGhHmbdSonXWXvTm4SjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_01,2026-09-16_02,2025-10-01_01

On 9/18/26 15:37 PM, chizhiling@163.com wrote:=0A=
> On 9/18/26 1:56 PM, Yuezhang.Mo@sony.com wrote:=0A=
>> On 9/17/26 18:10 PM, chizhiling@163.com wrote:=0A=
>>> On 9/17/26 5:21 PM, Yuezhang.Mo@sony.com wrote:=0A=
>>>>=0A=
>>>> Revisited the implementation of exfat_zero_new_range(), I think it is =
unnecessarily duplicating=0A=
>>>> existing functionality.=0A=
>>>>=0A=
>>>> exfat_iomap_read_end_io() already takes care of zeroing the page cache=
 beyond valid_size. By using=0A=
>>>> read_cache_folio() to obtain an uptodate folio, we can reuse the exist=
ing exfat_iomap_read_end_io()=0A=
>>>> implementation instead of introducing another zeroing mechanism. Then =
just need to use=0A=
>>>> folio_mark_dirty() to mark the folio dirty, causing it to be written b=
ack.=0A=
>>>=0A=
>>> Yes, you're right. In my local branch, I implemented this by calling=0A=
>>> __filemap_get_folio() and exfat_read_folio(). The relevant code is=0A=
>>> below. It's a bit ugly, so I=92d really appreciate it if you have any=
=0A=
>>> better suggestions:=0A=
>>=0A=
>> Why not simply use read_cache_folio()? Also, it is necessary to hold map=
ping->invalidate_lock.=0A=
>=0A=
> I only did a quick search under fs/ and noticed that=0A=
> __filemap_get_folio() is used more often. I=92ll change it to use=0A=
> read_cache_folio() in the next version and test it.=0A=
>=0A=
> Why should we hold invalidate_lock? Is it because invalidate_lock is=0A=
> supposed to protect valid_size?=0A=
>=0A=
=0A=
Yes, the current implementation uses inode_lock to protect updates to valid=
_size=0A=
and zeroed_size. We can consider using invalidate_lock to protect them inst=
ead.=0A=
What lock does your method intend to use for this?=0A=
