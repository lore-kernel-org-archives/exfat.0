Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0162374E48
	for <exfat@lists.linux.dev>; Fri, 18 Sep 2026 05:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789711053; cv=fail; b=uxK6okmEd7BiCVPB+qojFJpZwlHjFCoEunaidKDQ7V0GTT920uT/vS1hcftDglL7v8CglBp8G4LjXtG5PBsZx4+AMHMSwUFvYjpe+emOFAapVv6x3PD2EiCMfOtLFs6wjxY/asJ2XzKz1TnnJsJcKRPnItgNFe1r6Mbfm5pbmew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789711053; c=relaxed/simple;
	bh=whoqhPbMbVLk3akaCWbQOmW9GWQ201WU0RV+JFJ/AAY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=URpbOrjT0ejwiysiw6ZBm6HMZiypZcyozK5Ee1UHpvrLLXXH6V2IDIaUcdUleLmXvdyb4kfEDWaJ8JBfGp8w4Z9ijSOn2X9g//C69hmTbKobKQm9sm2G+dGnsvv7jnkltiQ6VD+8xTciTWga2gJykU8wq/jb6moDmY7Eq+4oa7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=K6T10XGE; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="K6T10XGE"
Received: from pps.filterd (m0209325.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I57KNm1717416;
	Fri, 18 Sep 2026 05:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=whoqhPb
	MbVLk3akaCWbQOmW9GWQ201WU0RV+JFJ/AAY=; b=K6T10XGEjIQeVKu3AX0oIvr
	iJdWRCIKxw5qInZrWulgzbozrbIkkFJ061kIEWg+NrvYD6rYRMLO4O4ra/SpqV+f
	4Og82bOHMddLwBPx9GMf7USybaiWDK0KNEd4wA3joNRdyFGKCcSxjWfdEr1S9cKg
	sRBoT2VeJHHFw92ug6RF1ba0XrHsjMChZlNwZJmNzgUMFvTB706skFJiapzTMTlH
	Vb+hUEwtNIy5Qbr/z9Bc0RbcfhTdsCty/HLS59128ZTVA40FaRJKoQGe0gy+hOlP
	TZMhk57Y6LVqs0HrMRpK1pqbaTHc6673xItB6RXOm1hv/G+NlZsUpfQx3xQiedA=
	=
Received: from typpr03cu001.outbound.protection.outlook.com (mail-japaneastazon11012045.outbound.protection.outlook.com [52.101.126.45])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4gmuyvync7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 05:56:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YiBNYcaQ30Ygx+lCEY95KPdnIIRtHijKrep49Koe1Ti1HEGmBaxjWqbasPkBXmdMF2EAOqOoKRWWqUYUzZZoMYKYR0p489erDDxpK6Pdei1WERVX/2nClLeYHZSmtPypdrFf3eXWRA7j2aAbcHdwtW/bs14oU6JFIjUQ7yynjWKRFMV0gM2qbjaz9sOeZT+nJj0qNbg3faSYtkVKx51ltCuoAAiYiPw3yca1HVwDT1rRVAf9hcUXQmvW3FJ7doyAfGDo1wGaMh70KMjTJC+YbAs1ylnm/WMS8DNpwGEPsgqGIAKXH2/EoDMpgoCTgEzoQB30xX+SMZVJ8JNco9Q2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whoqhPbMbVLk3akaCWbQOmW9GWQ201WU0RV+JFJ/AAY=;
 b=eMd2KoVJioboQ6AIQGdjJzRlX2tTVn/1elWrqdRN4P/olKzZ1kgH8jZlevi93gRI8mwcFNB6M/GgHSwuh542MXS97jSH0elIOPlfYwQibf9quqBMp4ImsSOaxsg5iMiSn7thf/Palux7ZvMioFuItlqTiQem33QCuV6gcwMtJBC957nqDZxZhF1HcvBnBQtTrukG+vg/m0INeUnBx8vJ7iQ+3EA6VYmAQ4eMV4WQaZmVICD/WR93xGwILt7q7z7y264sFyXPyOxQqmcR2aqYUWPH1pGjiokcNgPMywKksJ0NMg93QL4kfWQI5wTv0EHGnee7UHq1in3+iBLWSuiXwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com (2603:1096:301:fc::7)
 by SEZPR04MB7988.apcprd04.prod.outlook.com (2603:1096:101:232::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 05:56:48 +0000
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::a631:6b1a:332c:831c]) by PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::a631:6b1a:332c:831c%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 05:56:47 +0000
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
Thread-Index: AQHdRYO9q6PXWEoCvEuVMfXNtoWYnrbQh00AgAApJYCAAbx5jIAAIXAAgAFAfbQ=
Date: Fri, 18 Sep 2026 05:56:47 +0000
Message-ID:
 <PUZPR04MB6316BE1BAD8C0AE697150E6981872@PUZPR04MB6316.apcprd04.prod.outlook.com>
References: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com>
 <CAKYAXd9wnmVyp4ONjYQPs5pxo_ruDmCN_yu7Ma4agDP1n-NNBA@mail.gmail.com>
 <7380972e-de54-4b56-a67c-842be8887c5f@163.com>
 <PUZPR04MB631662C55F38599C3E6496FF81B82@PUZPR04MB6316.apcprd04.prod.outlook.com>
 <fd531465-622d-43d3-8c2f-ff38fb527061@163.com>
In-Reply-To: <fd531465-622d-43d3-8c2f-ff38fb527061@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB6316:EE_|SEZPR04MB7988:EE_
x-ms-office365-filtering-correlation-id: 800bf45b-cbe1-4cce-2e41-08df1549a080
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|10070799003|1800799024|376014|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 m8MT9n9uMhe51NksfytlHXmBW/wW/8zzqkJPnCdMNe9famAqwKjCo83EqJQYgyNKi3euashZ0OBjMRVH4gkfYRaSxdiaS0h8RVU/uv1qB8Sjrvdtt4/Jm6nUzJdDoyefRHqpT4x4NlkGPFxAKwzBEZ5lFvwEueuLn1xuNXrgk9lpWK4HGnaPcn460h4w7kd2D9ACTIBuAqq+t51AxdwnA7IyE1Cbm9NhfE9Xh+8XOOtQUBugVdLPSO9+jPVd/LC1j8VvSf5peefWujzvLX4Wi7eLU3j0k+49ehx+a9Vdn/cDiMpsmNtk6PLRUhG6Ym3fMtEmbK/PM4wTHAVvp9Tm+Yf6WyvS5MAyDvna4a6wAzg2/M7KXz0iSw8aIeH2Czy/g20qSzgB9P/VDKZ5wsGNN7LdJ+gCYEFU3enaLBFjlLoQDCBQfQOrxwICPpVCLkHYfGbNWfkczHXUdsSubQyN8xhVwD23i+hHDGnj8wfxzXIBNp5RUgEonMmOwE/4FgoGeUYSJOod7HbPIfO+7U3JA6/YRlVARc+p2vOQU/Pbpz1zTwRb/mR42i4KjBFyCUMqFVlKrzLM8EHmmjgcy2ayVJJmz26SlGk6j1n29D8zssexlWfuiTA6L0QhVQ1H1XadXL7GCFzjJ0Kw/0D1cHLa6Qey/IDxZ9qBRkDl9MHFEIWRK6BF2xlbWKcXjlNWTbvw7W59Nz1yU513V5kcIJeq5S9mQMCc7tkldP9dDy7/kk8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB6316.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?rijFtNZOD0pquMnClvpb9m8z5S/pxIKawuP7bkyQEAmiU7Akuqro6d6U?=
 =?Windows-1252?Q?8VXGrdseHIrPSalH9G/GEz1ki0qIQr+UCUJl+dJXDiwL2ux9WkiGOMH5?=
 =?Windows-1252?Q?mF1anWmgXdfLE/XnPhYIkvun0iPizKmS8P3fTg8aKpFt70Nv4emMd1cl?=
 =?Windows-1252?Q?F9IKqMDIrEKzNrCquxCYkqf6DuQzV31NN/XDZdlhnFLm4lcytYstaZn2?=
 =?Windows-1252?Q?gak3OceNqObFQUaLoM223ZP9n5nESxcGW1eaKJ8xYLMrL1nQdjk7MrD5?=
 =?Windows-1252?Q?Sf7AappxhjzaAWzck8PbYw5f+cIX49B7xlbePkTF1o+NHefX8+rSbZVI?=
 =?Windows-1252?Q?5OYsD0zfjLSSUVIDLqHOwg0EC08rYyZwUXrnXNLZdBkxs1mKncVC4zhh?=
 =?Windows-1252?Q?K1ueAvdqoGfA3h8fSPhNnqyMhDxEQZ4d8+02Es3cbGmpOG6GlCxdvSHa?=
 =?Windows-1252?Q?MkH3R/zLKV1h2Irhs7zSIFoej9ulWXHLz3AOufiFobzgqAplL+j0ew1H?=
 =?Windows-1252?Q?aHfHwZolHZSMMmkQlxnQng9RCg+XEgU/G9pkm4t/KPOvv5JgtLNewUl0?=
 =?Windows-1252?Q?QCrGVVAbtocGC/VOrgwRFBLa066IBo14ji0DxlXc+mVOftiMBNTlYt7p?=
 =?Windows-1252?Q?qSIkVe3a6HnCmpYjJ5Fosj11pBGHRFm2k1kYvCUeItwK4rjuIP4f4Ueu?=
 =?Windows-1252?Q?ZgFNbvBBDiy6sfY98ZhnPwWO42Wj32foXKBZv0M1KCjp75BlYrJ1nZJD?=
 =?Windows-1252?Q?PmipO3wrJH00COFmWsDYtgFduN3CnVtdFAcr7ArS3qEFoPYi94jIioYx?=
 =?Windows-1252?Q?TEOwAGAv3DL08fSevKPSgYStUlbqrAiNMVf397+5jaBD9qIBWZ554DTx?=
 =?Windows-1252?Q?zEK0h0ebs0d/f2fX7ckDl/tzozX7sRSSs8uG5qzCDJN8o7bqoi1Snyu4?=
 =?Windows-1252?Q?Q4N5NMe16Ao63mUOi6yAy/t82gZIw87tJM9okw3ww6NEzqTAcKk1SZli?=
 =?Windows-1252?Q?BXlIrmmAFdJlkMh3yoDmlIrffFF43iqcF1Zjq0tg549UGqrZ2c1Uk4XX?=
 =?Windows-1252?Q?q3MQQb5YRiePNq0RGLVYo7cAja263w0vs6PH5OphHB3jgBH00mCXYbwP?=
 =?Windows-1252?Q?dLvqclWb8OvySREp4lYh6/xHD/QneMjtC9BOTUhYlXCpuG8HV9lYlouQ?=
 =?Windows-1252?Q?VPfAX62ESCw/CUoMgXKU9zEjfzYs2suEvZ9zeLwyxU7d6PBj0EFr0MvI?=
 =?Windows-1252?Q?moDOl75f9Ns8CXl1i4oA2O/1oWfCBcuVctPnexfey0XqxKpWGF4IJc/o?=
 =?Windows-1252?Q?pYpikxEBJOtxCD9kJJM+syjB7bA9LkSTPuA7qjGUGqXii5La3MMB92+C?=
 =?Windows-1252?Q?QIwbOqa8DQjN7AC987OwCB8m9IS+bOtYLTjyvhhBvcYm+NZtwa384klf?=
 =?Windows-1252?Q?FXeHYZkhBlNEN5caFigD9P9EEPus4I16+tJFtRycr+dmVZ0S6mYYxUoH?=
 =?Windows-1252?Q?jsnJF40dENFQl4jG1KRQ5QVujJ+lFqNZQ7hqVGMSeF5jJcoBFn93DiH8?=
 =?Windows-1252?Q?LewRu6I2DaNmfACvYJ7tovtLePJHj6q8UV6pD6EAB7DKYsnN5KKQS/qj?=
 =?Windows-1252?Q?8DJFQwgO3Xmr9beqrVYAYd34ZG5btSRayNicn9e9NS81sG9pVPBZS2vp?=
 =?Windows-1252?Q?WdD2bqfZb4kSSFJYGOiuwxTRqm3u/4ewUNMU3FwTocTKEyBLNbW/1b9P?=
 =?Windows-1252?Q?5Ma4hJoOQdO1/tCFkEjNeL3v2gHv8pAD/TF2O+VLt5EjhuIiiZtSskud?=
 =?Windows-1252?Q?pQ27m7zLxZ8K2Lr1fHmrk+iZojjeGj3HO8sxpebHh5Q0+S+piOzmYzXS?=
 =?Windows-1252?Q?JoCYwijR7VZJUISAifRZvdRGsT9rqfYglMrELbSaKR34OTGM+16lxBb6?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	XW2hrli2VNN8hKWvHXVYVNnyLPqQhAnMfD7VtT04ekG2d9YPJkHDUVoD75iYsloiTkrA1wRQ9zW4KI8zSUG/GULOwPPEB2S/jOFPaN7vF8HsgkBF77vNhlsuoQxWmCCxrZ0vkbzsce8lQMEzFyTvOQ42cN/U4cOsLqv1btA18Xu6a1+Af3DHQnvXDuvfGtQMdp43OccwMUfOBmZDgneay3vLSdVkn1N0xausLf4CzSflNKoU890RRBdWATMtgG2uKA7ng4EaEQNw45OyCI1lPNJhfbdpCHlCbghpdlS1Kk5jKj77dlQjOgd3+7vHDBDVQshX50Q42ZsuL42d7n0X6Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5kU5S0n2K6qU5WLFhe2ISdTTIzyBLEIjc20EqutCrbeImMn8tM3pxFoscIjuLWyVeUH7l0pPRNoxF05qhgcfTA0XYm46mv6fONA7Y7iOdp6p2A0KGBYLokj8fNp46IfbY8IVNO68jgMG2Vhh8a7R8UXkloGnIdU3LGGAUPSgHkQzfU92zP0OwQUlCOGWOciFOtXRnubIJNE2aQT99nWyOC4k7fkN3PzCqOVIJNCJykFcpOcIhVwYpvQ+T/gj77QRpSDz7anxynzH5Kh3tmT9AqaAv8WaUDntlz2QIVjA1ct67KE3/xC81E290320574uwZgGdkMip2IG6SuUMVbBD8QvHVh7o38TSRvRiUdNcaCQXOIpYh3dPoujt5wCnl6LQ/bpq2jF/fEg2XlxrF0Bxm3g0R4xvkGfgOtDXL8IlAjDY2hH7iQfKSKSJJ9E2RB1ccX2QhIJ3dNI3zHBlskCnNuHmauAkDCmT8e196yvkn4xnhknw+crEjz1oRbSi2OY4cex8yxLXH1dULAAd5GcOAoSnSJb7RqgntScl8ArX1kXc0ASxme9wscmfFoUJUStRCOF62jLQ/b2bTASt1YqB+ZVa7h53OWDAOZ3IlptLe6VesfJHt5lRh4CjP0fDihY
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB6316.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 800bf45b-cbe1-4cce-2e41-08df1549a080
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2026 05:56:47.9387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5b7Q5x1GQoQz8INS2n5mP6eLWJJyZURZTJXJ+pJzC4JMD072JxjsbDre0eRaCrWPbYbjhlOuH6U244hK5ZbxWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7988
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA3NyBTYWx0ZWRfX7ws9OP9lP79m
 KW6CcpXL5KqnggMAT0oGMa5UEN6tr0074k+Y2frDxZSRP4RNKMf7AcjZSkGT6MHt3P3uV6t2uxC
 bqc3yhj+2E9F4pNuzSKe01fQNxDxNNzkA9OT7v3sVAaCsbIr6AjS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA3NyBTYWx0ZWRfXzN7wFrdqV7nF
 BS+NuNvkr/r0esSmP1S+bAsrTBZhUYv78ZUqQ9LEW+X3Hp109iTdeFQG2BulXKd6omzDIP3fJQ0
 Y2QOJvLHETuspBud5ARvT93726loHddqv8cqJVX1q7uKOzvhFRgoWQUfNWeE6prYQICeEykdiV/
 zsl3KoRjCtY2NUmidvXwsq0ucOVLDkctZNWvhudJfE2KM59ZvYwfa3SFoGVoNLP3mY/IKbdO8ay
 udEyycSEaKLssRKCi6C7pgWZrgyQJLNiknNyjqYXe4jZogOGHHJiRwohoN1/5MaOiu1KJ8p3l1G
 bBq5Nk8qNSCVSiGg7BLyPFcQCWLaNhigk8/wZb3iC+JJvl/6UvZPcmd0qJrAfrFF+SAsCwCqORG
 oWlApUlnAYCjJUmf8AJIdz/WE3dAOx4JrAcRZwk6mKCilz0IMpLBx1E8V6IB+Rk429xenpaTecu
 q5bfS6BoVBlOnrHmwUQ==
X-Authority-Analysis: v=2.4 cv=XKOl2ghE c=1 sm=1 tr=0 ts=6aacd2a9 cx=c_pps
 a=h8E/4LCcHWFDFiW/Oqp/PQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=N659UExz7-8A:10
 a=VdqzKS8jKosA:10 a=7j0FZ4iXMVMA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=FGjXJT7Bex8XaPnzAX5M:22
 a=Byx-y9mGAAAA:8 a=z6gsHLkEAAAA:8 a=qJPdQlWdWx7TmYbd7KYA:9 a=pILNOxqGKmIA:10
X-Proofpoint-ORIG-GUID: gH3NuHmEfmYa1mDJNhZvP-22TG97SwKj
X-Proofpoint-GUID: gH3NuHmEfmYa1mDJNhZvP-22TG97SwKj
X-Sony-Outbound-GUID: gH3NuHmEfmYa1mDJNhZvP-22TG97SwKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01

On 9/17/26 18:10 PM, chizhiling@163.com wrote:=0A=
> On 9/17/26 5:21 PM, Yuezhang.Mo@sony.com wrote:=0A=
> >=0A=
> > Revisited the implementation of exfat_zero_new_range(), I think it is u=
nnecessarily duplicating=0A=
> > existing functionality.=0A=
> >=0A=
> > exfat_iomap_read_end_io() already takes care of zeroing the page cache =
beyond valid_size. By using=0A=
> > read_cache_folio() to obtain an uptodate folio, we can reuse the existi=
ng exfat_iomap_read_end_io()=0A=
> > implementation instead of introducing another zeroing mechanism. Then j=
ust need to use=0A=
> > folio_mark_dirty() to mark the folio dirty, causing it to be written ba=
ck.=0A=
> =0A=
> Yes, you're right. In my local branch, I implemented this by calling=0A=
> __filemap_get_folio() and exfat_read_folio(). The relevant code is=0A=
> below. It's a bit ugly, so I=92d really appreciate it if you have any=0A=
> better suggestions:=0A=
=0A=
Why not simply use read_cache_folio()? Also, it is necessary to hold mappin=
g->invalidate_lock.=0A=
=0A=
>=0A=
> > I=92ve also been looking into another issue today: the VM_FAULT_RETRY=
=0A=
> > returned by exfat_page_mkwrite() seems to be ignored by the memory=0A=
> > management subsystem. As a result, an mmap write may actually proceed=
=0A=
> > beyond valid_size without advancing valid_size.=0A=
=0A=
It looks like you are right, the PTE is still set to be writable when VM_FA=
ULT_RETRY=0A=
is returned. inode_lock does not seem suitable for protecting valid_size.=
