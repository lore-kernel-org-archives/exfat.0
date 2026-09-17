Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2985B4A262C
	for <exfat@lists.linux.dev>; Thu, 17 Sep 2026 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637273; cv=fail; b=fQk9dbQF4iILepgOEW0ISPfii+Gj8qFd1bJ1Yiv+Y9OpgBdR4y7Yx9OMgYs5T38N3IMdvPoS4HjqWQ0j0IS+gQ7d8yuo+HiLFDFe0y+g1x65Bh07AEhRR9+XQgp62ct07rqaKIy/nP3xQzZJR4fUaYInELKHb37q1cOMHtnxX+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637273; c=relaxed/simple;
	bh=Bdrq9/0/7LpqZD3GWewf9q0ZUCRtOQL45+k+/pJ8TPM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VMyWr/lysC1hoFdfEu1J0oNZuvWXc7r94o4rLWnzoAD9cSSlXpv03PmeQ1JY4kJHUFNNdcglhQpjB8zxUXOAnYbyCN8y05hjylRUDLv8bFwqc68O4mf+lYxp3y658b/9e5hVzhRBmjXei0GtT9InUkdv+Z2FGIkQjDppe+5H5xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=UG7CTZsd; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="UG7CTZsd"
Received: from pps.filterd (m0209326.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H8eMTa3693491;
	Thu, 17 Sep 2026 09:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=/TfwrOS
	V2wI5okQm4ibVmNV9yUU3Tp20beaQQ01y6U8=; b=UG7CTZsdo8yQb12/FQll6BF
	/X372Z/9nBqns4Mlxmeekb2beuuP8y8EEdy47lMSxPKEkpBv1wY5hwY4qE7YlPUE
	PMftFvN+NoAF7BODC4xfsM/z+co4ZqOLz5568cqXqKV5k1XOXVpIf26OJyUgy7YO
	adtm/7VvYyeOuxBtgMgedZ7XQ5LTEBNeYDxr7zRcq3JpaVWQTZ+7n4NGBAlIq2dm
	lTdlKU/TWQv2bt3hE75KX+JRDzPjuLew969g7pBjGdWm3uFrGqBXMDe9n5zbjBuu
	tMEeibhidmNi8DuJT8jI93DiGoU3Y74GK/q1fmFUNFNlDd0hCsv9ooi3u03R+Jw=
	=
Received: from os8pr02cu002.outbound.protection.outlook.com (mail-japanwestazon11012042.outbound.protection.outlook.com [40.107.75.42])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4gmvxc6fvv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 17 Sep 2026 09:21:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCtBW3SUFdXj/ASl+B7ofuc5Qjti7AqLK3+gKdmKpOSVK4KDBgL6BWmj5aOXpod0mSLvhUf+V0VQN+7f5AR44UM9DfJXzkWYC7QYgNkr13PQpBrLQuZrrXcH4Bnr2Qqxpt5MHGjWwIX1M55VtDUNSKdfWqZ4NFDzq/m4eqVgjsgPAzPj/9vaurNytBrnD0XvZjsS16CyOWdGkpMKlRNRZUxZOxX0ZMyGuVN0O7m+joKozky01PNWAjIbaOwd+Qtb3BTIwTTaDFZESzq6zjz9eC/2gUW5owqPPlGavAPKAfKBtQBuAXGHNXfWPbJCgdQNYo2mfiRAZUCwcOBW5NvMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TfwrOSV2wI5okQm4ibVmNV9yUU3Tp20beaQQ01y6U8=;
 b=ss89ywn0bUSQIUdh/v3UuKlIO5wHhABSoEi3S21K8dwXE9H9dM/ebXpOSdUF+gP3/E+8BhdB3lHscAAubxdeNlcWXpTyeduKPDnG2dO4hBPlIBxsJhGjaQFHR5o9Bp6wbPlohzdf6uvJCUdYl1tarT36K3+aPoxFdQwLWiUer6a2e90lAmAVJHUp3aa1vwOLQq2v7Vikqfi2gerycVQRw7WBvm/z3oGU7aJ7m/vBBdjI9Rhch3e4Uw2pfhVYi1sFjq+CW9lqEi4ovZH0q3yQ0kqWLGPee0XbkmDf0SXMgJAkHT8hImKbUG+i+csqKpxdbnjc5AGasFYW7FLX5JEhNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com (2603:1096:301:fc::7)
 by SEZPR04MB7187.apcprd04.prod.outlook.com (2603:1096:101:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 09:21:31 +0000
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::a631:6b1a:332c:831c]) by PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::a631:6b1a:332c:831c%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 09:21:30 +0000
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
Thread-Index: AQHdRYO9q6PXWEoCvEuVMfXNtoWYnrbQh00AgAApJYCAAbx5jA==
Date: Thu, 17 Sep 2026 09:21:30 +0000
Message-ID:
 <PUZPR04MB631662C55F38599C3E6496FF81B82@PUZPR04MB6316.apcprd04.prod.outlook.com>
References: <34e67580-7b8c-491b-8beb-496a0d49077b@163.com>
 <CAKYAXd9wnmVyp4ONjYQPs5pxo_ruDmCN_yu7Ma4agDP1n-NNBA@mail.gmail.com>
 <7380972e-de54-4b56-a67c-842be8887c5f@163.com>
In-Reply-To: <7380972e-de54-4b56-a67c-842be8887c5f@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB6316:EE_|SEZPR04MB7187:EE_
x-ms-office365-filtering-correlation-id: 4eb58461-f172-4e59-4efa-08df149d0f33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10070799003|38070700021|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 WJFb074vCmOcsWbNMrApeu6JdUm9rRAANfJyl6eOHmwdTci5xbgzn16bnGvBUFNUt4aZZ0qzuRjgPT+L6QUQ7hdTOrxQtVLF/t3VX4mZ79bT12OQ45ZJtYDPlIc/qhhmEFava0l4fgv3H4gTuovaA0F9331xU2R66kMK0IlYHlycW6tVJKQmKIq/fOVXDLhqw3eM2qhLGnAb62liBdhFMOD7mYNCnwbv6Rq9V+3UH4Li5WEkHZyviRIUkqJ2/dNryyKloQHonhGGU4ls6bIz5qsCiv59nmW9C4ZukfUfUXKp1uIHR+QheSSTPZ/q29bcVwziKwmUwWMVXjRJMoun883Wu8qZO9IcpH1/Z30Ee8MFOje4I1HCg6y47nokWdt6zE57AMgRNRc+TVzkjazhexVeqwwQPlNIVL21yUI+A8I2cMtHjoLWg+f4JA0tonIPWHyiokBkjvIL+7hlp3yRgMlKIPZPsOJU9bowfh8DvdjqKjnkVXRP2tZDQFVeqX4PMMT6udsXX1LkJ6GdCM0RCOx0sO5PuxtbIkh+k/GXACou85vl2i9fQM/8P780dg77/n97wKQER0HGtrdZxeuuhUf40di2kyCXwopL/S+LIcLFnVVJXsSmwHsdi1/CcMagg8m5Dhh3iYImKU8aMU5sJBYvQ26hcN+2LvZxtvZRRxtQzgX0WZsthGBqE53M2/aBCkhW7j5Gr3xyd8LX5eIvIXNuP7kB+2iBfYI+Ww5UMX0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB6316.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10070799003)(38070700021)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gZ0IF9dJNOlOs0Y8WEId4MN5ItaZxxY2LURJrDdagRUggDxwTK2Qz8tZL9?=
 =?iso-8859-1?Q?RAfgJR7TQ9g/IAgBhVWVfSv7MvyZ+xiIxFyKtLBnLEcucW6XkSF4+ZprMY?=
 =?iso-8859-1?Q?J156iDO0W8BIaEKdPENKR0GLYcSmq5jDsNt8BOVoCA9JFWhWGVUpNClR75?=
 =?iso-8859-1?Q?WRBH6USKeiPU8PrBCITjOl3sVh+FqH/DiRVN9ijDHj3crQszxkkd7vbvpD?=
 =?iso-8859-1?Q?XoH9QyGGE65IQD/1Zb2BRy/3CIveyu1Ez65KzGsUodDYILg7zzUa+UdcVZ?=
 =?iso-8859-1?Q?qdsIdWsBzOhxfnTkz1zTbFyB8My2dnhQ8WnwB2EDPCib+D4M2HUV1RrAnl?=
 =?iso-8859-1?Q?8f2nfjYK2bKlRNezm2u/cOD3iuAFIPSxhpZdodxn/WEU2ry/Wg6ld00Log?=
 =?iso-8859-1?Q?6ygaIhAigx+LeScqPxaKiGwIiRAQqaLjGtbsd8T/qmhCReVQ+ncbWScniy?=
 =?iso-8859-1?Q?WpKcroHupaKciqc1eZh4oJqG+qFP1hmSf4wkzTPB0xJhRNEvr91+9iVFIt?=
 =?iso-8859-1?Q?W01WOEO/pKTy9vvXQ2MkOpaoM759icH7SzAg8sg9MqLYNJodD7R9JHKeNT?=
 =?iso-8859-1?Q?0WPVGDiYyEpifmSWGcEkhL/R6xyg9d34f6jTP5vbm2rGvpo48d770+M9f1?=
 =?iso-8859-1?Q?PEpM7IhmDIlr5SNavsPba4AcolSIjFelQSrnibXS/r/ZZ1/IfHeg2K4EXL?=
 =?iso-8859-1?Q?vNAOetmpOi7SdPQuWEXBPbBLcGnxYlwvoqVCbC3501zozlGyeet0EuOXn7?=
 =?iso-8859-1?Q?2QMRCHRtC6ZRC4HHg/wHmnBjyPH7rFIZolG6ksTbHj7frhwF7SdTQ2DwiB?=
 =?iso-8859-1?Q?p/NcAS86Ps4KoPFXc7V8LKc+4xRBGH1E3sNqshI4WHGoWbm6jhqN157cl5?=
 =?iso-8859-1?Q?DPY/VpliVlpPzQ1cb51SMgJkrnTw7WMcYTz5vAFGq1VWbNDEbEVbkCf549?=
 =?iso-8859-1?Q?6oFdZhZFxnAATjHzvGClV3v+MIGWaZSXJe68m/ijKBubjbTAentlSkhgby?=
 =?iso-8859-1?Q?pwdhefD5aOJISVMFuEiy5fsVGhLGeASocWaXu+8usqtzFvZhFjUzsNgEGL?=
 =?iso-8859-1?Q?2L4v2coLI8KQ1B1o+IBwIQW57E8ok9aA8nMjypNHDzJbvA+AZYOFSgu+Ng?=
 =?iso-8859-1?Q?wRvNHZZ5bQLn33Kon7Y5ESrLJ4WgdxxBx5gl8GyzvgfwtGYwNB2KFI/1q6?=
 =?iso-8859-1?Q?Tc8ZJep1NYnsUIDtttPbIfUViHnFWl0puP4mb+gSWcfmuPReG8YW+2q+U5?=
 =?iso-8859-1?Q?g8pSYmfVbXOS5V3DZO7zHrnNj28E6bfvlDdflxd8KggqI24kc6E/WPDsLS?=
 =?iso-8859-1?Q?RvVntHMIG0DW/5+ieqMZDLD7WUrVCkr/ZMbpni+RORykkTbfb9tA/oCC+U?=
 =?iso-8859-1?Q?0jPure1I+9ZW6daoYDDxHxCVLM5WJQfkYx9UfmpqFDd7S20EAF+hMqdc88?=
 =?iso-8859-1?Q?Zp2/2YR2a3pdXb4+RgzXr+ddio4ZwWaq9fVnMgc2WX7kuKQtPjEETJrOuo?=
 =?iso-8859-1?Q?yGOCHjzlXZ0enuIFDPTxtna918LTpnhRee3dE/sCF0GXS6LUmiVrjoJYmY?=
 =?iso-8859-1?Q?mjgSibl4kgFWogpIxc7GTuF3ZFYLO976a/JkYtqPqsb5ra4sASGvUxn3Sc?=
 =?iso-8859-1?Q?JGIIRLLYNVkvkTSSH2oqDlzSKALT/tbZB0nsbxyXQ8Ejz2/4sSS0kEICJf?=
 =?iso-8859-1?Q?Pe84aDSZOKynV0eyBfBePtgwr7bhwCP6N5ugwK0vG2C5SkoVNkHfvoN6oA?=
 =?iso-8859-1?Q?KIpjMjyrgFWqNOFruuA2FE8znsyKtYjbNDHDWAggPEvaF6vR9o0/9RniMa?=
 =?iso-8859-1?Q?/NO3r7oMemZSJexhgk7K2fa+2LYqP7QGo4ruQXtn47oXqAaRadvt?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: exfat@lists.linux.dev
List-Id: <exfat.lists.linux.dev>
List-Subscribe: <mailto:exfat+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:exfat+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	C4osmJBGrnFtnv/goyaAI4pRUHZiGDAHEHCMM7eY+mlVr2UdxF68q8GRuMF+NqmIxPHavWHO7vTNoGABZOajuBskfHRRqzlOETZV9PfK5wqsqSG76UpStLNqRhOdQZ+vreJinHga5IhzrsOvyo1C963YGZG18UjFWMnCmmrd73iBNCCaEGogtMjyKNnAAjSWtAW7QLsn5RAyLBY0kPuxZ5E4x3934kgc0ZfyoAV41KB2zceIxgvEafZ6SOKBmeiB7wWPdkqOvQwPsNoxw3yPaDm5SiPG69nsVV+WDogP73ZDHfBRDrbciKi8JRNdkToIoYac9UFVQ71NSyIdHjlXkQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BfSLpWXWRPVPN4frbbYM/xvJrFeVo5CGmQC2zTCQtW572yRQqIY4yrhXhKLx/Cy5VtQPLBSHhYF0RxstkrGFjJGvH+zPp9fnqYSxfl/EV2nB4mCPL1rqbdyljGmw1RRtk/ugLFh3vWFQYJQeJQp19GfMDKhImq2bxBruSrF3/txPjZtBf9Zm3pCiONCC82z965vNPv1vSE2qWaiMsQMQ6mzhxe3asQYLEB+ZZ3H6qQ/R2UeSJGaoexgX6nmAZYFwldNA6ddImG4994bSvWIPcpmYTXUfM4zJblURoeE0ssspkVbnRixt39OWXwIcn7lIisNa0B/V+4f+p3icrYlCRo0wC1cfh3C4Eo4XFaM6z5DVkrAloKe7/K3bbM/KJCyn/NecdbxbuwfKFq1PCZe6SmsKYEerQHTLQXjB/SZjAAMyKTgKelmgdiIWs5oA8/9mjyQ1Fr5LywOd1gPOjRvIIXr27gsRvTYdeEAGBGJ61S7ZLrAw5kwp4lOFCHZF3qRRXunVyEu8gD5fn8AEWFH33QBxA7fswpFU/LqWSEwuLeMeM6BIdUdM5lAD4PPsnqk2SmqKP3KseUCmjlYUqqMouR22uJWRO8hDrtnpiCARdE5p3N84iUutCZhnbTzzs3n8
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB6316.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb58461-f172-4e59-4efa-08df149d0f33
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 09:21:30.6763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqVMElSejkTQy0z7D17v6VteGacuXKVb8lekpJl70lN6rIYerDzr7Aw9bTWDXg/AFtoV4x5G0Ah5XaJFwvoHgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7187
X-Authority-Analysis: v=2.4 cv=JcopPkKV c=1 sm=1 tr=0 ts=6aabb127 cx=c_pps
 a=gILl2YsJFsAC4NlHuk1fdw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=7j0FZ4iXMVMA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=lmptg-Pxpg44AF-n8Qp9:22
 a=lxzzal2JU9ZQosXl0HIA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfX4/ZVFSrn2Rgb
 drsYUY5UdeKD/27L6b+PbD7csSi5AbtscxNQZCvJhS+uILsvYianR0OuRwicCtLy57tjQYeU4g8
 jpFbxxl8DEKI/67RHEvb5W7X1LzmeueudDj2tN43z9c5IZiGCg/1XruXc0YnMWUIXcPdcbN4Rco
 T/7x+sqWcwX/qhU4G08U2lhhXPj8SBoy0bS2H7DRgKail6LY6TuqzqYN/Qnp7MKwkx+6dFDFyjQ
 N0+NUhq5UnBhWxliSW8PXWbA0u65apQIjAxbaoZtmiECBNNWptxBlJDxDEkkNGeE8X7Q9oMcNc9
 t3g/0oLT8maM6BC98QPhi4zaIz4FCYtLxhMYy0HMPLpypU+pQdnmRF6h4oNfiTw3Efgw0vV0cg/
 0i4S8Rrrr90SEackomIxjXd0TZOpqv0W01luOV5BqgWdv4Ex3gyfS3dWJ7sRdwlsvidL/1GDomR
 px0nY9/3xes3WkzYJZA==
X-Proofpoint-GUID: hddwgPcykujjnlI1JlXbsuk6PGHlkYsm
X-Proofpoint-ORIG-GUID: hddwgPcykujjnlI1JlXbsuk6PGHlkYsm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfX20bmXaDhZJ4R
 UzT3w2FJ+hs5esFSO0X5/b6tKD7GyLfVhl/xMKmx0Y0/VvzoEZWvJzeowF6WrjKUgomu6g8n62/
 vhpLbQiUMRzUh2Ve9w1CpDFz1hI15jMkw4JZbtECbzVNFe8ZoZe3
X-Sony-Outbound-GUID: hddwgPcykujjnlI1JlXbsuk6PGHlkYsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01

=0A=
> However, it looks like exfat_zero_new_range() has some missing handling.=
=0A=
> One issue is that it does not mark the uptodate blocks as dirty, which=0A=
> could cause some blocks not to be written back and potentially expose=0A=
> stale data.=0A=
=0A=
Hi Chi,=0A=
=0A=
The issue you discovered can be reproduced with the following fsx operation=
 sequence:=0A=
=0A=
# cat exfat.fsxops =0A=
write 0xde00 0x8000 0x4000=0A=
truncate 0x0 0x11200 0x15e00=0A=
truncate 0x0 0x26000 0x11200=0A=
write 0x57600 0xf800 0x53200=0A=
truncate 0x0 0x11c00 0x66e00=0A=
write 0x71400 0x2c00 0x3ea00=0A=
read 0xf000 0x4000 0x74000=0A=
# ./xfstests-dev/ltp/fsx -Z -h -r 4096 -t 512 -w 512 -R -W --replay-ops=3De=
xfat.fsxops /mnt/file =0A=
=0A=
Revisited the implementation of exfat_zero_new_range(), I think it is unnec=
essarily duplicating=0A=
existing functionality.=0A=
=0A=
exfat_iomap_read_end_io() already takes care of zeroing the page cache beyo=
nd valid_size. By using=0A=
read_cache_folio() to obtain an uptodate folio, we can reuse the existing e=
xfat_iomap_read_end_io()=0A=
implementation instead of introducing another zeroing mechanism. Then just =
need to use =0A=
folio_mark_dirty() to mark the folio dirty, causing it to be written back.=
=0A=
=0A=
>                         if (iomap_is_partially_uptodate(folio,=0A=
>                                        offset_in_folio(folio, bpos), bloc=
ksize)) {=0A=
>                                bpos +=3D blocksize;=0A=
>=0A=
> >>>>>>> We didn't mark this block as dirty.=0A=
=0A=
