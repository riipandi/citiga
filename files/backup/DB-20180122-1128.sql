#
# TABLE STRUCTURE FOR: cxsessions
#

DROP TABLE IF EXISTS `cxsessions`;

CREATE TABLE `cxsessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` bigint(20) NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  PRIMARY KEY (`id`,`ip_address`),
  KEY `cxsessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: groups
#

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `groups` (`id`, `name`, `description`) VALUES (1, 'admin', 'Administrator');
INSERT INTO `groups` (`id`, `name`, `description`) VALUES (2, 'operator', 'Operator');
INSERT INTO `groups` (`id`, `name`, `description`) VALUES (3, 'guest', 'Guest User');


#
# TABLE STRUCTURE FOR: login_attempts
#

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: lplpo
#

DROP TABLE IF EXISTS `lplpo`;

CREATE TABLE `lplpo` (
  `id_lplpo` varchar(64) NOT NULL,
  `kode_obat` varchar(64) NOT NULL,
  `stok_awal` varchar(255) DEFAULT NULL,
  `pengeluaran` int(12) NOT NULL,
  `pemakaian` int(12) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `stok_akhir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lplpo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: t_harga
#

DROP TABLE IF EXISTS `t_harga`;

CREATE TABLE `t_harga` (
  `id_harga` varchar(36) NOT NULL,
  `kode_obat` varchar(36) DEFAULT NULL,
  `kemas` int(12) DEFAULT NULL,
  `tgl_expired` datetime DEFAULT NULL,
  `tgl_masuk` datetime DEFAULT NULL,
  `qty_kemas` int(12) DEFAULT NULL,
  `qty_total` int(12) DEFAULT NULL,
  `harga_satuan` float DEFAULT NULL,
  `sumber_data` varchar(64) DEFAULT NULL,
  `harga_beli` int(64) DEFAULT NULL,
  `jenis` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_harga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `t_harga` (`id_harga`, `kode_obat`, `kemas`, `tgl_expired`, `tgl_masuk`, `qty_kemas`, `qty_total`, `harga_satuan`, `sumber_data`, `harga_beli`, `jenis`) VALUES ('125b19c5-9d44-49e0-aeba-e95fd4f64fe9', 'OBT1616ID', 12, '2017-05-30 00:00:00', '2017-05-30 00:00:00', 10, 107, '100', 'MANIDRI', 100, 'JKN');
INSERT INTO `t_harga` (`id_harga`, `kode_obat`, `kemas`, `tgl_expired`, `tgl_masuk`, `qty_kemas`, `qty_total`, `harga_satuan`, `sumber_data`, `harga_beli`, `jenis`) VALUES ('2be47cef-083a-4423-95a0-dfe7c667df61', 'OBT140140ID', 90, '2017-05-30 00:00:00', '2017-05-30 00:00:00', 100, 8988, '1500', 'MANIDRI', 1000, 'JKN');
INSERT INTO `t_harga` (`id_harga`, `kode_obat`, `kemas`, `tgl_expired`, `tgl_masuk`, `qty_kemas`, `qty_total`, `harga_satuan`, `sumber_data`, `harga_beli`, `jenis`) VALUES ('38ca16cf-06e2-45f5-a300-c49a8352533d', 'OBT178178ID', 10, '2017-05-30 00:00:00', '2017-05-30 00:00:00', 12, 120, '1000', 'MANIDRI', 1000, 'JKN');


#
# TABLE STRUCTURE FOR: t_obat
#

DROP TABLE IF EXISTS `t_obat`;

CREATE TABLE `t_obat` (
  `id` varchar(36) NOT NULL,
  `kode_obat` varchar(36) DEFAULT NULL,
  `nama_obat` varchar(255) DEFAULT NULL,
  `id_satuan` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT1', 'OBT11ID', 'ACYCLOVIR CREAM', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT10', 'OBT1010ID', 'AMITRIPTILINA HCL TAB SALUT 25 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT100', 'OBT100100ID', 'HIDROKORTISON KRIM 2,5%', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT101', 'OBT101101ID', 'IBUPROFEN SUP 125 MG', 'c020745c-a1cd-57e8-bd85-6abb53ee9f7a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT102', 'OBT102102ID', 'IBUPROFEN SYR 100 MG/5 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT103', 'OBT103103ID', 'IBUPROFEN SYR 200 MG/5ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT104', 'OBT104104ID', 'IBUPROFEN TAB 400 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT105', 'OBT105105ID', 'IODINA TES 10ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT106', 'OBT106106ID', 'ISONIAZIDE 100 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT107', 'OBT107107ID', 'ISOSORBID DINITRAT TAB 10 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT108', 'OBT108108ID', 'ISOSORBID DINITRAT TAB SUBLINGUAL 5 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT109', 'OBT109109ID', 'JELLY DOPLER 250 GR', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT11', 'OBT1111ID', 'AMLODIPINE 10 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT110', 'OBT110110ID', 'KALSIUM HIDROKSIDA PASTA', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT111', 'OBT111111ID', 'KALSIUM LAKTAT TAB 500 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT112', 'OBT112112ID', 'KARBAMAZEPIN TAB 200 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT113', 'OBT113113ID', 'KARBAZOKROM NA SULFONAT INJ', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT114', 'OBT114114ID', 'KARBAZOKROM NA SULFONAT TAB', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT115', 'OBT115115ID', 'KARBOGLISERIN TETES TELINGA 10 %', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT116', 'OBT116116ID', 'KATOPRIL 25MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT117', 'OBT117117ID', 'KATOPRIL TAB 12.5 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT118', 'OBT118118ID', 'KETOKONAZOL TAB 200 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT119', 'OBT119119ID', 'KETOROLAC 30', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT12', 'OBT1212ID', 'AMLODIPINE 5 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT120', 'OBT120120ID', 'KLINDAMISIN 300 MG', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT121', 'OBT121121ID', 'KLINDAMISIN KAP 150 MG', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT122', 'OBT122122ID', 'KLORAMFENIKOL 500MG', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT123', 'OBT123123ID', 'KLORAMFENIKOL KAPS', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT124', 'OBT124124ID', 'KLORAMFENIKOL SALEP MATA 1%', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT125', 'OBT125125ID', 'KLORAMFENIKOL SUSPENSI', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT126', 'OBT126126ID', 'KLORAMFENIKOL TETES MATA 0,5%', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT127', 'OBT127127ID', 'KLORAMFENIKOL TETES TELINGA 3 %', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT128', 'OBT128128ID', 'KLORFENIRAMIN MALEAT (CTM) TAB 4 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT129', 'OBT129129ID', 'KLORPROMAZIN TAB SALUT 25 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT13', 'OBT1313ID', 'AMOKSISILIN 500 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT130', 'OBT130130ID', 'KODEIN TAB 10 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT131', 'OBT131131ID', 'KOTRIMOKSAZOL SUSP : SULF 200+TRIM 20', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT132', 'OBT132132ID', 'KOTRIMOKSAZOL TAB DWS :SULF 400+TRIM 80', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT133', 'OBT133133ID', 'KOTRIMOKSAZOL TAB PED : SULF 100+TRIM 20', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT134', 'OBT134134ID', 'LACTOSA POWDER', '3ed01c12-f18e-5128-bf35-15ff7ab31024');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT135', 'OBT135135ID', 'LARVASIDA CAIR', 'ab5a1cf4-67c6-569d-b06f-7de8ec67a648');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT136', 'OBT136136ID', 'LIDOKAIN INJ 2%', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT137', 'OBT137137ID', 'LIDOKAIN INJ KOMPLEX 2 ML', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT138', 'OBT138138ID', 'LISINOPRIL TAB 10 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT139', 'OBT139139ID', 'LORATADIN TAB 10MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT14', 'OBT1414ID', 'AMOKSISILIN SYR KERING 125 MG/ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT140', 'OBT140140ID', 'MAGNESIUM SULFAT INJ (IV) 20% 25 ML', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT141', 'OBT141141ID', 'METFORMIN 500 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT142', 'OBT142142ID', 'METFROMIN 850 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT143', 'OBT143143ID', 'METILDOPA TAB 250 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT144', 'OBT144144ID', 'METILERGOMETRIN MALEAT INJ 0,200MG/ML', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT145', 'OBT145145ID', 'METILERGOMETRIN MALEAT TAB SALUT 0,125', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT146', 'OBT146146ID', 'METILPREDNISOLON INJ 125MG', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT147', 'OBT147147ID', 'METILPREDNISOLON TAB 4 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT148', 'OBT148148ID', 'METOCLOPRAMIDE 10 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT149', 'OBT149149ID', 'METRONIDAZOL 500 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT15', 'OBT1515ID', 'AMOKSISILIN SYR KERING 250 MG/ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT150', 'OBT150150ID', 'METRONIDAZOL INFUS 500 MG/100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT151', 'OBT151151ID', 'METRONIDAZOLE OVULA 500 MG', 'c020745c-a1cd-57e8-bd85-6abb53ee9f7a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT152', 'OBT152152ID', 'MICONAZOLE CREAM', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT153', 'OBT153153ID', 'MINERAL MIX', '26c2deb3-ddab-534e-a82a-cb5a33162304');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT154', 'OBT154154ID', 'MONOKLORKAMFER MENTOL CAIRAN', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT155', 'OBT155155ID', 'MULTIVITAMIN SYRUP', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT156', 'OBT156156ID', 'MUMMYING PASTA', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT157', 'OBT157157ID', 'NAT DIKLOFENAC 50MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT158', 'OBT158158ID', 'NATRIUM BIKARBONAT TAB 500 NG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT159', 'OBT159159ID', 'NATRIUM KLORIDA LAR INFUS 0,9% STERIL', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT16', 'OBT1616ID', 'AMOXCICILLIN DROP', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT160', 'OBT160160ID', 'NATRIUM TIROKSIN TABLET', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT161', 'OBT161161ID', 'NIFEDIPINE 10 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT162', 'OBT162162ID', 'NISTATIN TAB VAGINAL 100.000 IU/G', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT163', 'OBT163163ID', 'OAT FDC KATAGORI', 'fbb49efd-a195-5257-9e68-fe18e976e8e0');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT164', 'OBT164164ID', 'OAT FDC KATAGORI ANAK', 'fbb49efd-a195-5257-9e68-fe18e976e8e0');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT165', 'OBT165165ID', 'OAT FDC KATAGORI II', 'fbb49efd-a195-5257-9e68-fe18e976e8e0');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT166', 'OBT166166ID', 'OBAT ANTI TUBERKULOSIS KATAGORI', 'fbb49efd-a195-5257-9e68-fe18e976e8e0');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT167', 'OBT167167ID', 'OBAT BATUK HITAM (OBH) CAIRAN 100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT168', 'OBT168168ID', 'OBAT BATUK PILEK SYRUP', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT169', 'OBT169169ID', 'OBAT BATUK PILEK TAB', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT17', 'OBT1717ID', 'AMOXCICILLIN INJ 1 GR', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT170', 'OBT170170ID', 'OKSITETRASIKLIN HCL 1% SALEP MATA', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT171', 'OBT171171ID', 'OKSITETRASIKLIN HCL 3% SALEP KULIT', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT172', 'OBT172172ID', 'OKSITOKSIN INJ 10 IU/ML 1 ML', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT173', 'OBT173173ID', 'OMEPRAZOLE INJ 40 MG/10 ML', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT174', 'OBT174174ID', 'OMEPRAZOLE KAPSUL 20 MG', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT175', 'OBT175175ID', 'ONDANCENTRON 4 MG INJ', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT176', 'OBT176176ID', 'PAPAVERIN HCL.40 MG TABLET', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT177', 'OBT177177ID', 'PARAFIN GLISERIN FENOLFTALEIN SUSPENSI', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT178', 'OBT178178ID', 'PARASETAMOL DROP', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT179', 'OBT179179ID', 'PARASETAMOL INFUS', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT18', 'OBT1818ID', 'AMPISILIN 1 GR INJ', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT180', 'OBT180180ID', 'PARASETAMOL SYR 120 ML/5 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT181', 'OBT181181ID', 'PARASETAMOL TAB 100 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT182', 'OBT182182ID', 'PARASETAMOL TAB 500 MG STRIP', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT183', 'OBT183183ID', 'PERMETRIN KRIM 5 %', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT184', 'OBT184184ID', 'PIRIDOKSIN (VIT B6) TAB 10 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT185', 'OBT185185ID', 'PIROXICAM 10 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT186', 'OBT186186ID', 'POLIKRESOLUM 10 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT187', 'OBT187187ID', 'POVIDON IODIDA 10% 30 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT188', 'OBT188188ID', 'POVIDON IODIDA 10% 300 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT189', 'OBT189189ID', 'POVIDON IODIN 10% 1LTR', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT19', 'OBT1919ID', 'ANALOG INSULIN MIX ACTING INJ', '210ada1a-2b6d-5931-b720-699c0210de6d');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT190', 'OBT190190ID', 'PREDNISON TAB 5 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT191', 'OBT191191ID', 'PROKAIN PENISILINE INJ', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT192', 'OBT192192ID', 'PROPRANOLOL HCL TAB 40 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT193', 'OBT193193ID', 'PYRAZINAMIDE 500 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT194', 'OBT194194ID', 'RANITIDIN INJ', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT195', 'OBT195195ID', 'RANITIDINE TAB 150 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT196', 'OBT196196ID', 'RESERPIN TAB 0,25 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT197', 'OBT197197ID', 'RETINOL (VIT A) KAPS 200.000 IU', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT198', 'OBT198198ID', 'RETINOL 100.000 IU', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT199', 'OBT199199ID', 'RIFAMPISIN 450 MG', '9eb81ec0-562a-58ff-9a76-3e2df078fa8c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT2', 'OBT22ID', 'ACYCLOVIR TAB 400', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT20', 'OBT2020ID', 'ANTALGIN INJ 250 MG/ML 2ML', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT200', 'OBT200200ID', 'RINGER LAKTAT LAR INFUS STERIL', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT201', 'OBT201201ID', 'SALBUTAMOL CAIRAN IH', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT202', 'OBT202202ID', 'SALBUTAMOL INHALER', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT203', 'OBT203203ID', 'SALBUTAMOL TAB 2 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT204', 'OBT204204ID', 'SALEP 2-4 KOMBINASI', '7ee1243a-9a8f-5750-ae76-d399081af2b1');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT205', 'OBT205205ID', 'SALEP LUKA BAKAR', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT206', 'OBT206206ID', 'SALISIL BEDAK 2% 50 GRAM', '58b99715-26bd-5659-a6aa-56c41c8aad5b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT207', 'OBT207207ID', 'SEFADROKSIL KAPSUL 500 MG', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT208', 'OBT208208ID', 'SEFADROKSIL SYR 250 MG', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT209', 'OBT209209ID', 'SEFIKSIM KAPSUL 100MG', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT21', 'OBT2121ID', 'ANTALGIN TAB 500 MG STRIP', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT210', 'OBT210210ID', 'SEFIKSIM SYR 100MG/5ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT211', 'OBT211211ID', 'SEFOTAXIM INJ 1 GR', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT212', 'OBT212212ID', 'SEFTRIAKSON INJ 1 GRM', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT213', 'OBT213213ID', 'SEMEN SENG FOSFAT SERBUK CAIRAN', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT214', 'OBT214214ID', 'SETIRIZIN SYRUP', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT215', 'OBT215215ID', 'SIANOKOBALAMIN (VIT B12) INJ 500 MCG/ML', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT216', 'OBT216216ID', 'SIMVASTATIN 10 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT217', 'OBT217217ID', 'SIPROFLOKSASIN 500MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT218', 'OBT218218ID', 'SPIRONOLACTON TAB 25MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT219', 'OBT219219ID', 'STREPTOMISIN INJ 1.000 MG/VIAL', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT22', 'OBT2222ID', 'ANTASIDA DOEN STRIP', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT220', 'OBT220220ID', 'SULFASETAMID NATRIUM TETES MATA 15%', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT221', 'OBT221221ID', 'TAB TAMBAH DARAH :BESI II SULFAT 200 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT222', 'OBT222222ID', 'TABLET ZINK DISPERTSIBLE', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT223', 'OBT223223ID', 'TABURIA', 'ab5a1cf4-67c6-569d-b06f-7de8ec67a648');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT224', 'OBT224224ID', 'TEMPORARY STOPPING FLETCHER CAIR & SERB', '1c15096b-9146-5e1a-9e95-e738443a07bf');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT225', 'OBT225225ID', 'TEOFILIN TAB SR 300 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT226', 'OBT226226ID', 'TERBUTALIN INJ', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT227', 'OBT227227ID', 'TERBUTALIN TAB 2,5 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT228', 'OBT228228ID', 'TETRASIKLIN KAPS 250 MG', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT229', 'OBT229229ID', 'THIAMFENICOL 500 MG KAPSUL', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT23', 'OBT2323ID', 'ANTASIDA DOEN SUSPENSI', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT230', 'OBT230230ID', 'TIAMIN HCL (VIT B1) INJ 100 MG/ML 1 ML', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT231', 'OBT231231ID', 'TIAMIN HCL (VIT B1) TAB 50 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT232', 'OBT232232ID', 'TRIHEKSIFENIDIL HCL TAB 2 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT233', 'OBT233233ID', 'TRIKRESOL FORMALIN (TKF) CAIRAN 10 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT234', 'OBT234234ID', 'TUBERKULIN TEST', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT235', 'OBT235235ID', 'VAKSIN RABIES KERING UNTUK MANUSIA', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT236', 'OBT236236ID', 'VITAMIN B KOMPLEK TAB', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT237', 'OBT237237ID', 'VITAMIN NEUROTROPIK', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT238', 'OBT238238ID', 'VITAMIN NEUROTROPIK 5000 INJ', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT239', 'OBT239239ID', 'VITAMIN NEUROTROPIK INJ', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT24', 'OBT2424ID', 'ANTI BAKTERI DOEN', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT240', 'OBT240240ID', 'WIDA 2A INFUS', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT241', 'OBT241241ID', 'ZINK SYR 20 MG/5ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT242', 'OBT242242ID', 'BORAX GLYCERIN ', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT243', 'OBT243243ID', 'ADS 0.05 ML', '54033453-24fe-56ec-8213-ffd1469e120c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT244', 'OBT244244ID', 'ADS 0.5 ML', '54033453-24fe-56ec-8213-ffd1469e120c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT245', 'OBT245245ID', 'ADS 5 ML', '54033453-24fe-56ec-8213-ffd1469e120c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT246', 'OBT246246ID', 'ALAT SUNTIK 1 ML', '54033453-24fe-56ec-8213-ffd1469e120c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT247', 'OBT247247ID', 'ALAT SUNTIK 3 ML ', '54033453-24fe-56ec-8213-ffd1469e120c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT248', 'OBT248248ID', 'ALAT SUNTIK 3ML BD', '54033453-24fe-56ec-8213-ffd1469e120c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT249', 'OBT249249ID', 'ALAT SUNTIK 5 ML', '54033453-24fe-56ec-8213-ffd1469e120c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT25', 'OBT2525ID', 'ANTI FUNGI DOEN KOMBINASI', '7ee1243a-9a8f-5750-ae76-d399081af2b1');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT250', 'OBT250250ID', 'ALAT SUNTIK BD 1ML', '54033453-24fe-56ec-8213-ffd1469e120c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT251', 'OBT251251ID', 'BATANG PENGADUK 10 CM', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT252', 'OBT252252ID', 'BATANG PENGADUK 30 CM', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT253', 'OBT253253ID', 'BEAKER GLASS 50 ML', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT254', 'OBT254254ID', 'BLUE TIP', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT255', 'OBT255255ID', 'BOX SLIDE', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT256', 'OBT256256ID', 'BULP PIPET UKUR', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT257', 'OBT257257ID', 'CATGUT CHROMIC', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT258', 'OBT258258ID', 'CATGUT PLAIN 3/0', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT259', 'OBT259259ID', 'CAWAN PETRI 10 CM', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT26', 'OBT2626ID', 'ANTI HEMMOROID DOEN', 'c020745c-a1cd-57e8-bd85-6abb53ee9f7a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT260', 'OBT260260ID', 'DECK GLASS ', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT261', 'OBT261261ID', 'FOLY CATETHER 16 ', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT262', 'OBT262262ID', 'FOLY CATETHER 18 ', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT263', 'OBT263263ID', 'FOOGING MASKER SINGLE FILTER', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT264', 'OBT264264ID', 'GELAS UKUR 100 ML', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT265', 'OBT265265ID', 'HAEMOCYTOMETER SET', '210ada1a-2b6d-5931-b720-699c0210de6d');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT266', 'OBT266266ID', 'HAEMOMETER SAHLI', '210ada1a-2b6d-5931-b720-699c0210de6d');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT267', 'OBT267267ID', 'HOLDER VACUTAINER', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT268', 'OBT268268ID', 'INFUSION SET ANAK ', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT269', 'OBT269269ID', 'INFUSION SET DEWASA ', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT27', 'OBT2727ID', 'ANTI MIGREN DOEN', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT270', 'OBT270270ID', 'IV CATHETHER 18', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT271', 'OBT271271ID', 'IV CATHETHER 18 BD', '1c15096b-9146-5e1a-9e95-e738443a07bf');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT272', 'OBT272272ID', 'IV CATHETHER 20 BD', '1c15096b-9146-5e1a-9e95-e738443a07bf');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT273', 'OBT273273ID', 'IV CATHETHER 22', '1c15096b-9146-5e1a-9e95-e738443a07bf');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT274', 'OBT274274ID', 'IV CATHETHER 24', '1c15096b-9146-5e1a-9e95-e738443a07bf');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT275', 'OBT275275ID', 'JARUM KULIT 10/12', '79afe0bb-094f-599a-aee5-8863a71588fa');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT276', 'OBT276276ID', 'JARUM LANSET ', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT277', 'OBT277277ID', 'JARUM OTOT 32/36', '79afe0bb-094f-599a-aee5-8863a71588fa');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT278', 'OBT278278ID', 'KAPAS PEMBALUT / ABSORBEN 250 MG', 'ab5a1cf4-67c6-569d-b06f-7de8ec67a648');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT279', 'OBT279279ID', 'KAPAS PEMBALUT 100 GRAM', 'ab5a1cf4-67c6-569d-b06f-7de8ec67a648');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT28', 'OBT2828ID', 'AQUA PRO INJ STERIL BEBAS PIROGEN 20 ML', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT280', 'OBT280280ID', 'KASA PEMBALUT HIDROFIL 4M X 15 CM', 'ac639d75-86c8-562a-8785-e736b7e127ca');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT281', 'OBT281281ID', 'KASA STERIL 16X16 CM ', 'ad044363-deae-5b6c-8e19-91c603af1fd5');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT282', 'OBT282282ID', 'KERTAS LENSA', '27475774-373f-5784-88f4-8658ae8168e3');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT283', 'OBT283283ID', 'KERTAS PH', '27475774-373f-5784-88f4-8658ae8168e3');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT284', 'OBT284284ID', 'KERTAS PUYER', '2f6d3fcc-aa9a-5ca2-a5b4-7e1ec1b6d243');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT285', 'OBT285285ID', 'KERTAS SARING', '27475774-373f-5784-88f4-8658ae8168e3');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT286', 'OBT286286ID', 'MASKER DISPOSIBLE', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT287', 'OBT287287ID', 'MASKER DISPOSIBLE KARET', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT288', 'OBT288288ID', 'MASKER DISPOSIBLE TALI', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT289', 'OBT289289ID', 'MASKER N95', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT29', 'OBT2929ID', 'AS TRANEKSAMAT INJ 50MG/ML', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT290', 'OBT290290ID', 'MICROPORE 0.5 INC', 'f5094a52-0945-561f-9faf-2fc0193b52e1');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT291', 'OBT291291ID', 'MORTIR 16 CM', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT292', 'OBT292292ID', 'NEEDLE 24G', '1c15096b-9146-5e1a-9e95-e738443a07bf');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT293', 'OBT293293ID', 'NELATON CATETER 18/20', '1c15096b-9146-5e1a-9e95-e738443a07bf');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT294', 'OBT294294ID', 'OBJECK GLASS', '54033453-24fe-56ec-8213-ffd1469e120c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT295', 'OBT295295ID', 'PIPET HB', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT296', 'OBT296296ID', 'PIPET PLASTIK 5 ML', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT297', 'OBT297297ID', 'PIPET UKUR 1 ML', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT298', 'OBT298298ID', 'PIPET UKUR 10 ML', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT299', 'OBT299299ID', 'PIPET UKUR 5 ML', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT3', 'OBT33ID', 'ALBENDAZOL 400 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT30', 'OBT3030ID', 'ASAM ASKORBAT (VIT C) TAB 50 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT300', 'OBT300300ID', 'PLASTIK KLIP', '3ed01c12-f18e-5128-bf35-15ff7ab31024');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT301', 'OBT301301ID', 'PLESTER 5 YARD X 2 INCH', 'f5094a52-0945-561f-9faf-2fc0193b52e1');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT302', 'OBT302302ID', 'POT DAHAK DIAMETER 6 CM', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT303', 'OBT303303ID', 'SAFETY BOX', '54033453-24fe-56ec-8213-ffd1469e120c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT304', 'OBT304304ID', 'SARUNG TANGAN NON STERIL M ', '0759f3a3-1965-5b75-bc92-73a0dad4b486');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT305', 'OBT305305ID', 'SARUNG TANGAN NON STERIL S ', '0759f3a3-1965-5b75-bc92-73a0dad4b486');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT306', 'OBT306306ID', 'SARUNG TANGAN OBGYN STERIL', '0759f3a3-1965-5b75-bc92-73a0dad4b486');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT307', 'OBT307307ID', 'SARUNG TANGAN STERIL 6.5', '0759f3a3-1965-5b75-bc92-73a0dad4b486');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT308', 'OBT308308ID', 'SARUNG TANGAN STERIL 7', '0759f3a3-1965-5b75-bc92-73a0dad4b486');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT309', 'OBT309309ID', 'SILK NO 3/0 & JARUM BEDAH ', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT31', 'OBT3131ID', 'ASAM MEFENAMAT 500MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT310', 'OBT310310ID', 'TABUNG CENTRIFUGE', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT311', 'OBT311311ID', 'TABUNG DURHAM', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT312', 'OBT312312ID', 'TABUNG HB', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT313', 'OBT313313ID', 'TABUNG REAKSI 10 CM', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT314', 'OBT314314ID', 'TABUNG REAKSI 7 CM', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT315', 'OBT315315ID', 'TABUNG WESTERGEEN', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT316', 'OBT316316ID', 'TABUNG WINTROB', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT317', 'OBT317317ID', 'VACUTAINER NEEDLE 21 G', '54033453-24fe-56ec-8213-ffd1469e120c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT318', 'OBT318318ID', ' BISTURI ', '54033453-24fe-56ec-8213-ffd1469e120c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT319', 'OBT319319ID', ' KARTU GOLONGAN DARAH ', '27475774-373f-5784-88f4-8658ae8168e3');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT32', 'OBT3232ID', 'ASAM TRANEKSAMAT TAB 500', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT320', 'OBT320320ID', ' ETIKET ', '2f6d3fcc-aa9a-5ca2-a5b4-7e1ec1b6d243');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT321', 'OBT321321ID', ' KASA + TULE 1% STERIL 10X10 ', '27475774-373f-5784-88f4-8658ae8168e3');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT322', 'OBT322322ID', 'AQUA BIDESTILATA STERIL', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT323', 'OBT323323ID', 'AQUADEST 20 LT', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT324', 'OBT324324ID', 'ASAM KLORIDA 0,1 N 100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT325', 'OBT325325ID', 'ASAM SULFOSALISILAT 20% 100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT326', 'OBT326326ID', 'BILIRUBIN T/D 2X100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT327', 'OBT327327ID', 'BUN (UREUM) LIQUID+STANDAR', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT328', 'OBT328328ID', 'CHOLESTEROL TOT+STD 4X100ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT329', 'OBT329329ID', 'CREATIN+STD 2X100ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT33', 'OBT3333ID', 'ASERING 500 CC (LAR ELEKTROLIT)', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT330', 'OBT330330ID', 'GLUCOSA OX LIQUID', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT331', 'OBT331331ID', 'GLUKOSA STIK (GLUCO  DR)', '27cdc8a0-ed0b-5796-8687-648c46310e72');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT332', 'OBT332332ID', 'HB + CONTROL 3X2 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT333', 'OBT333333ID', 'HDL CHOLSTEROL+STD 4X80 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT334', 'OBT334334ID', 'KREATIN + STDR 200 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT335', 'OBT335335ID', 'LARUTAN BENEDICT 100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT336', 'OBT336336ID', 'LARUTAN DRABKIN', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT337', 'OBT337337ID', 'LARUTAN EDTA 10%', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT338', 'OBT338338ID', 'LARUTAN EOSIN 2% 100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT339', 'OBT339339ID', 'LARUTAN ETANOL ASAM 100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT34', 'OBT3434ID', 'ATTAPULGITE TAB 600 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT340', 'OBT340340ID', 'LARUTAN ETHER ALKOHOL', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT341', 'OBT341341ID', 'LARUTAN GIEMSA STAIN 100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT342', 'OBT342342ID', 'LARUTAN IODIUM', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT343', 'OBT343343ID', 'LARUTAN KARBOL FUCHIN 100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT344', 'OBT344344ID', 'LARUTAN KOH 10%', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT345', 'OBT345345ID', 'LARUTAN METHYLEN BLUE', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT346', 'OBT346346ID', 'LARUTAN NA-SITRAT 3,8% 100ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT347', 'OBT347347ID', 'LARUTAN PEWARNA RAPID', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT348', 'OBT348348ID', 'LARUTAN REAGEN REES ECKER', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT349', 'OBT349349ID', 'LARUTAN TURK 100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT35', 'OBT3535ID', 'AZITROMISIN TAB 500 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT350', 'OBT350350ID', 'MINYAK IMERSI', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT351', 'OBT351351ID', 'RAPID TES HIV 1', '60bd0d66-048b-5ec2-97ab-71a2aad7d03d');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT352', 'OBT352352ID', 'RAPID TES HIV 2', '60bd0d66-048b-5ec2-97ab-71a2aad7d03d');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT353', 'OBT353353ID', 'RAPID TES HIV 3 (BIOMERIUX)', '60bd0d66-048b-5ec2-97ab-71a2aad7d03d');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT354', 'OBT354354ID', 'RAPID TES SIFILIS', '60bd0d66-048b-5ec2-97ab-71a2aad7d03d');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT355', 'OBT355355ID', 'REAGEN CD4', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT356', 'OBT356356ID', 'REAGEN CD4 CONTROL', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT357', 'OBT357357ID', 'REAGEN PEWARNA GRAM', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT358', 'OBT358358ID', 'REAGEN TEST GOLONGAN DARAH (A-B)', '1c15096b-9146-5e1a-9e95-e738443a07bf');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT359', 'OBT359359ID', 'REGENT P2 TBC', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT36', 'OBT3636ID', 'BENZATIN BENZIL PENISILIN INJ.2,4 JT', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT360', 'OBT360360ID', 'RPR SIFILIS', '60bd0d66-048b-5ec2-97ab-71a2aad7d03d');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT361', 'OBT361361ID', 'SGOT', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT362', 'OBT362362ID', 'SGPT', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT363', 'OBT363363ID', 'TEST KEHAMILAN STRIP', '60bd0d66-048b-5ec2-97ab-71a2aad7d03d');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT364', 'OBT364364ID', 'TP RAPID SIFILIS (TPHA)', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT365', 'OBT365365ID', 'URINE RAPID TEST', '60bd0d66-048b-5ec2-97ab-71a2aad7d03d');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT366', 'OBT366366ID', 'URINE STIK 10 PARAMETER', '60bd0d66-048b-5ec2-97ab-71a2aad7d03d');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT367', 'OBT367367ID', 'XILOL 2.5 LT', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT368', 'OBT368368ID', 'XYLENE', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT37', 'OBT3737ID', 'BETAHISTIN MESILATE TAB', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT38', 'OBT3838ID', 'BETAMETASON KRIM 0,1 %', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT39', 'OBT3939ID', 'BISAKODIL SUP 10 MG', 'c020745c-a1cd-57e8-bd85-6abb53ee9f7a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT4', 'OBT44ID', 'ALBENDAZOLE SUSPENSI 200MG/5ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT40', 'OBT4040ID', 'BISAKODIL SUP 5 MG', 'c020745c-a1cd-57e8-bd85-6abb53ee9f7a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT41', 'OBT4141ID', 'BISOPROLOL TAB 2.5 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT42', 'OBT4242ID', 'BISOPROLOL TAB 5 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT43', 'OBT4343ID', 'BROMHEXIN HCL NEBULIZER', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT44', 'OBT4444ID', 'BUDESONID  INHALER 200 MCG', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT45', 'OBT4545ID', 'BUDESONID INHALER 160', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT46', 'OBT4646ID', 'BUDESONID INHALER 80', '6389247c-13bb-5c71-92e9-a7464388dc78');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT47', 'OBT4747ID', 'CEFAZOLIN INJ 1GR', '3e522ff6-7550-5b1b-a15d-d3a9b76f30c6');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT48', 'OBT4848ID', 'CEFIXIME 400 MG + AZITROMISIN 1000 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT49', 'OBT4949ID', 'CIMETIDIN 200 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT5', 'OBT55ID', 'ALUPURINOL TAB 100 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT50', 'OBT5050ID', 'CITODUR (TAMBAL GIGI SEMENTARA)', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT51', 'OBT5151ID', 'CURCUMA TAB', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT52', 'OBT5252ID', 'DEKSAMETASON INJ 5 MG/ML 1 ML', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT53', 'OBT5353ID', 'DEKSAMETASON TAB 0,5 MG STRIP', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT54', 'OBT5454ID', 'DEVITALISASI PASTA (NON ARSEN)', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT55', 'OBT5555ID', 'DIAZEPAM INJ 5 MG/ML 2 ML', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT56', 'OBT5656ID', 'DIAZEPAM RECTAL 10MG', 'c020745c-a1cd-57e8-bd85-6abb53ee9f7a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT57', 'OBT5757ID', 'DIAZEPAM RECTAL 5MG', 'c020745c-a1cd-57e8-bd85-6abb53ee9f7a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT58', 'OBT5858ID', 'DIAZEPAM TAB 2 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT59', 'OBT5959ID', 'DIFENHIDRAMIN INJ 10 MG/ML', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT6', 'OBT66ID', 'ALUPURINOL TAB 300 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT60', 'OBT6060ID', 'DIGOXIN TAB 0,25 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT61', 'OBT6161ID', 'DILTIAZEM HCL 30 MG TAB', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT62', 'OBT6262ID', 'DIMENHIDRINAT TAB 50 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT63', 'OBT6363ID', 'DOKSISIKLIN 100MG', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT64', 'OBT6464ID', 'DOMPERIDON 10 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT65', 'OBT6565ID', 'DOMPERIDONE SUSPENSI 5 MG/ 5 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT66', 'OBT6666ID', 'EKSTRAK BELLADON TAB 10 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT67', 'OBT6767ID', 'EPINEFRINA HCL/BITARTRAT(ADRENALIN) INJ', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT68', 'OBT6868ID', 'ERITROMISIN KAPL 250 MG', '9eb81ec0-562a-58ff-9a76-3e2df078fa8c');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT69', 'OBT6969ID', 'ERITROMISIN SYRUP', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT7', 'OBT77ID', 'AMBROXOL 30 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT70', 'OBT7070ID', 'ETAKRIDIN (RIVANOL) LAR 0,1% 300 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT71', 'OBT7171ID', 'ETANOL 70% 100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT72', 'OBT7272ID', 'ETANOL 70% 1000 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT73', 'OBT7373ID', 'ETIL KLORIDA SEPROT 100 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT74', 'OBT7474ID', 'EUGENOL CAIRAN', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT75', 'OBT7575ID', 'FENITOIN NATRIUM KAPS 100 MG', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT76', 'OBT7676ID', 'FENOBARBITAL INJ 50MG/ML', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT77', 'OBT7777ID', 'FENOBARBITAL TAB 30 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT78', 'OBT7878ID', 'FITOMENADION (VIT K) INJ 10 MG/ML 1 ML', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT79', 'OBT7979ID', 'FITOMENADION (VIT K) TAB SALUT 10 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT8', 'OBT88ID', 'AMINOFILIN INJ 24 MG/ML 10 ML', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT80', 'OBT8080ID', 'FLUCONAZOLE 150 MG', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT81', 'OBT8181ID', 'FUROSEMID TAB 40 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT82', 'OBT8282ID', 'FUROSEMIDE 10 MG/ML INJEKESI', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT83', 'OBT8383ID', 'GARAM ORALIT 200 ML AIR', '26c2deb3-ddab-534e-a82a-cb5a33162304');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT84', 'OBT8484ID', 'GEMFIBROZIL 300 MG KAPSUL', '3e8ab1e9-6bc1-5530-a9b3-aa455776607a');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT85', 'OBT8585ID', 'GENTAMISIN INJN', '0ba62039-1b40-573e-8589-25f8b7ee1077');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT86', 'OBT8686ID', 'GENTAMISIN SALEP KULIT', '35a55afe-d859-59dd-beb2-0c83ee5c041b');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT87', 'OBT8787ID', 'GENTIAN VIOLET LARUTAN 1% 10 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT88', 'OBT8888ID', 'GLASS IONOMER CERMENT (GC IX)', '26c2deb3-ddab-534e-a82a-cb5a33162304');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT89', 'OBT8989ID', 'GLIBENKLAMID TAB 5 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT9', 'OBT99ID', 'AMINOFILIN TAB 200 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT90', 'OBT9090ID', 'GLIMEPIRIDE TAB 2 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT91', 'OBT9191ID', 'GLIMEPIRIDE TAB 4 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT92', 'OBT9292ID', 'GLISERIL GUAIAKOLAT TAB 100 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT93', 'OBT9393ID', 'GLUKOSA LAR INFUS 40% STERIL 25 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT94', 'OBT9494ID', 'GLUKOSA LAR INFUS 5% STERIL 500 ML', '2305f8fe-0a02-500a-8015-3fa0238a3bbb');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT95', 'OBT9595ID', 'GRISEOFULVIN TAB 125 MG MICRONIZED', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT96', 'OBT9696ID', 'HALOPERIDOL TAB 0,5 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT97', 'OBT9797ID', 'HALOPERIDOL TAB 1,5 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT98', 'OBT9898ID', 'HEMAFORT TAB', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');
INSERT INTO `t_obat` (`id`, `kode_obat`, `nama_obat`, `id_satuan`) VALUES ('OBT99', 'OBT9999ID', 'HIDROKLORTIAZID (HCT) TAB 25 MG', 'd568eaef-4bda-5c18-a7de-dc7b4da80dce');


#
# TABLE STRUCTURE FOR: t_penerimaan
#

DROP TABLE IF EXISTS `t_penerimaan`;

CREATE TABLE `t_penerimaan` (
  `id_penerimaan` varchar(64) NOT NULL,
  `tgl_penerimaan` date DEFAULT NULL,
  `cabang_farmasi` varchar(128) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `jml_penerimaan` int(10) DEFAULT NULL,
  `closed` int(1) DEFAULT 0,
  PRIMARY KEY (`id_penerimaan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `t_penerimaan` (`id_penerimaan`, `tgl_penerimaan`, `cabang_farmasi`, `alamat`, `jml_penerimaan`, `closed`) VALUES ('78dc9f3c-6732-4e33-8cf0-b2cb2889fafd', '2017-05-30', 'KOTAMADYA SUKABUMI', 'fuck', 9132000, 1);


#
# TABLE STRUCTURE FOR: t_penerimaan_detail
#

DROP TABLE IF EXISTS `t_penerimaan_detail`;

CREATE TABLE `t_penerimaan_detail` (
  `t_p_detail` varchar(64) NOT NULL,
  `id_penerimaan` varchar(64) DEFAULT NULL,
  `kode_obat` varchar(64) DEFAULT NULL,
  `kemas` varchar(12) DEFAULT NULL,
  `jml_kemas` int(12) DEFAULT NULL,
  `qty_total` int(12) DEFAULT NULL,
  `harga_beli` int(12) DEFAULT NULL,
  `harga_jual` int(12) DEFAULT NULL,
  `jenis_data` varchar(64) DEFAULT NULL,
  `sumber_obat` varchar(64) DEFAULT NULL,
  `harga_sub` int(64) DEFAULT NULL,
  `tgl_expired` date DEFAULT NULL,
  PRIMARY KEY (`t_p_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `t_penerimaan_detail` (`t_p_detail`, `id_penerimaan`, `kode_obat`, `kemas`, `jml_kemas`, `qty_total`, `harga_beli`, `harga_jual`, `jenis_data`, `sumber_obat`, `harga_sub`, `tgl_expired`) VALUES ('0bcfbfa8-6dba-431b-a6b2-370fbc9c169b', '78dc9f3c-6732-4e33-8cf0-b2cb2889fafd', 'OBT1616ID', '12', 10, 120, 100, 100, 'JKN', 'MANIDRI', 12000, '2017-05-30');
INSERT INTO `t_penerimaan_detail` (`t_p_detail`, `id_penerimaan`, `kode_obat`, `kemas`, `jml_kemas`, `qty_total`, `harga_beli`, `harga_jual`, `jenis_data`, `sumber_obat`, `harga_sub`, `tgl_expired`) VALUES ('893d376f-dee5-42a9-a4fc-611cda4cb199', '78dc9f3c-6732-4e33-8cf0-b2cb2889fafd', 'OBT140140ID', '90', 100, 9000, 1000, 1500, 'JKN', 'MANIDRI', 9000000, '2017-05-30');
INSERT INTO `t_penerimaan_detail` (`t_p_detail`, `id_penerimaan`, `kode_obat`, `kemas`, `jml_kemas`, `qty_total`, `harga_beli`, `harga_jual`, `jenis_data`, `sumber_obat`, `harga_sub`, `tgl_expired`) VALUES ('8bd17a18-1854-40f1-b980-00e06b8aad56', '78dc9f3c-6732-4e33-8cf0-b2cb2889fafd', 'OBT178178ID', '10', 12, 120, 1000, 1000, 'JKN', 'MANIDRI', 120000, '2017-05-30');


#
# TABLE STRUCTURE FOR: t_satuan
#

DROP TABLE IF EXISTS `t_satuan`;

CREATE TABLE `t_satuan` (
  `id_satuan` varchar(36) NOT NULL,
  `satuan` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id_satuan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('0759f3a3-1965-5b75-bc92-73a0dad4b486', 'PASANG');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('0ba62039-1b40-573e-8589-25f8b7ee1077', 'AMPUL');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('1c15096b-9146-5e1a-9e95-e738443a07bf', 'SET');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('210ada1a-2b6d-5931-b720-699c0210de6d', 'UNIT');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('2305f8fe-0a02-500a-8015-3fa0238a3bbb', 'BOTOL');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('26c2deb3-ddab-534e-a82a-cb5a33162304', 'SACHET');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('27475774-373f-5784-88f4-8658ae8168e3', 'LEMBAR');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('27cdc8a0-ed0b-5796-8687-648c46310e72', 'STIK');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('2f6d3fcc-aa9a-5ca2-a5b4-7e1ec1b6d243', 'RIM');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('35a55afe-d859-59dd-beb2-0c83ee5c041b', 'TUBE');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('3e522ff6-7550-5b1b-a15d-d3a9b76f30c6', 'VIAL');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('3e8ab1e9-6bc1-5530-a9b3-aa455776607a', 'KAPSUL');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('3ed01c12-f18e-5128-bf35-15ff7ab31024', 'KG');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('54033453-24fe-56ec-8213-ffd1469e120c', 'PCS');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('58b99715-26bd-5659-a6aa-56c41c8aad5b', 'KOTAK');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('60bd0d66-048b-5ec2-97ab-71a2aad7d03d', 'STRIP');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('6389247c-13bb-5c71-92e9-a7464388dc78', 'BUAH');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('79afe0bb-094f-599a-aee5-8863a71588fa', 'LUSIN');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('7ee1243a-9a8f-5750-ae76-d399081af2b1', 'POT');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('9eb81ec0-562a-58ff-9a76-3e2df078fa8c', 'KAPLET');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('ab5a1cf4-67c6-569d-b06f-7de8ec67a648', 'BUNGKUS');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('ac639d75-86c8-562a-8785-e736b7e127ca', 'ROL');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('ad044363-deae-5b6c-8e19-91c603af1fd5', 'BOX');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('c020745c-a1cd-57e8-bd85-6abb53ee9f7a', 'SUPP');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('d568eaef-4bda-5c18-a7de-dc7b4da80dce', 'TABLET');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('f5094a52-0945-561f-9faf-2fc0193b52e1', 'ROLL');
INSERT INTO `t_satuan` (`id_satuan`, `satuan`) VALUES ('fbb49efd-a195-5257-9e68-fe18e976e8e0', 'PAKET');


#
# TABLE STRUCTURE FOR: t_settings
#

DROP TABLE IF EXISTS `t_settings`;

CREATE TABLE `t_settings` (
  `kode` varchar(255) DEFAULT NULL,
  `nama_toko` varchar(255) DEFAULT NULL,
  `alamat_toko` text DEFAULT NULL,
  `kecamatan` varchar(64) DEFAULT NULL,
  `kota` varchar(64) DEFAULT NULL,
  `propinsi` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `t_settings` (`kode`, `nama_toko`, `alamat_toko`, `kecamatan`, `kota`, `propinsi`) VALUES ('P3272050202', 'PUSKESMAS SELABATU', 'Jl. RA Kosasih No 147 tlp (0266) 213939\r\n', 'CIKOLE', 'SUKABUMI', 'JAWA BARAT');


#
# TABLE STRUCTURE FOR: t_transaksi
#

DROP TABLE IF EXISTS `t_transaksi`;

CREATE TABLE `t_transaksi` (
  `id_transaksi` varchar(50) NOT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `total_harga` double(255,0) DEFAULT NULL,
  `no_resep` varchar(64) DEFAULT NULL,
  `status` int(1) DEFAULT 0,
  `dibayar` int(12) DEFAULT NULL,
  `kembalian` int(12) DEFAULT NULL,
  `jenis_pasien` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `t_transaksi` (`id_transaksi`, `tgl_transaksi`, `total_harga`, `no_resep`, `status`, `dibayar`, `kembalian`, `jenis_pasien`) VALUES ('1febae41-c8f9-5a89-800d-f6a4a81f7a24', '2017-05-30', '19300', 'RSP30052017085935-0CDF', 1, 20000, 700, 'UMUM');


#
# TABLE STRUCTURE FOR: t_transaksi_detail
#

DROP TABLE IF EXISTS `t_transaksi_detail`;

CREATE TABLE `t_transaksi_detail` (
  `t_t_detail` varchar(36) NOT NULL,
  `id_transaksi` varchar(36) DEFAULT NULL,
  `kode_obat` varchar(255) DEFAULT NULL,
  `id_harga` varchar(36) DEFAULT NULL,
  `qty_trans` int(12) DEFAULT NULL,
  `harga_satuan` int(12) DEFAULT NULL,
  `harga_sub` int(12) DEFAULT NULL,
  `qty_retur` int(11) DEFAULT NULL,
  `qty_sisa` int(11) DEFAULT NULL,
  `jns_trans` varchar(32) DEFAULT NULL,
  `qty_masuk` int(11) DEFAULT NULL,
  `harga_masuk` int(11) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `saldo` int(12) DEFAULT NULL,
  `qty_in` int(12) DEFAULT NULL,
  PRIMARY KEY (`t_t_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `t_transaksi_detail` (`t_t_detail`, `id_transaksi`, `kode_obat`, `id_harga`, `qty_trans`, `harga_satuan`, `harga_sub`, `qty_retur`, `qty_sisa`, `jns_trans`, `qty_masuk`, `harga_masuk`, `tgl`, `saldo`, `qty_in`) VALUES ('1bc82d03-7977-4603-99b6-80c5485d4e74', 'BARANG-MASUK', 'OBT1616ID', '125b19c5-9d44-49e0-aeba-e95fd4f64fe9', NULL, NULL, NULL, NULL, 120, 'MASUK', 120, 100, '2017-05-30', 12000, 120);
INSERT INTO `t_transaksi_detail` (`t_t_detail`, `id_transaksi`, `kode_obat`, `id_harga`, `qty_trans`, `harga_satuan`, `harga_sub`, `qty_retur`, `qty_sisa`, `jns_trans`, `qty_masuk`, `harga_masuk`, `tgl`, `saldo`, `qty_in`) VALUES ('1f782ae4-7410-4992-a43d-41efa4d16ab7', 'BARANG-MASUK', 'OBT178178ID', '38ca16cf-06e2-45f5-a300-c49a8352533d', NULL, NULL, NULL, NULL, 120, 'MASUK', 120, 1000, '2017-05-30', 120000, 120);
INSERT INTO `t_transaksi_detail` (`t_t_detail`, `id_transaksi`, `kode_obat`, `id_harga`, `qty_trans`, `harga_satuan`, `harga_sub`, `qty_retur`, `qty_sisa`, `jns_trans`, `qty_masuk`, `harga_masuk`, `tgl`, `saldo`, `qty_in`) VALUES ('211787ff-9f8b-4bbe-9a27-a1b4d861884d', '1febae41-c8f9-5a89-800d-f6a4a81f7a24', 'OBT1616ID', '125b19c5-9d44-49e0-aeba-e95fd4f64fe9', 13, 100, 1300, NULL, 107, 'KELUAR', NULL, NULL, '2017-05-30', 10700, NULL);
INSERT INTO `t_transaksi_detail` (`t_t_detail`, `id_transaksi`, `kode_obat`, `id_harga`, `qty_trans`, `harga_satuan`, `harga_sub`, `qty_retur`, `qty_sisa`, `jns_trans`, `qty_masuk`, `harga_masuk`, `tgl`, `saldo`, `qty_in`) VALUES ('8e464dec-b326-4cb6-beac-7ad8b66761f3', 'BARANG-MASUK', 'OBT140140ID', '2be47cef-083a-4423-95a0-dfe7c667df61', NULL, NULL, NULL, NULL, 9000, 'MASUK', 9000, 1000, '2017-05-30', 9000000, 9000);
INSERT INTO `t_transaksi_detail` (`t_t_detail`, `id_transaksi`, `kode_obat`, `id_harga`, `qty_trans`, `harga_satuan`, `harga_sub`, `qty_retur`, `qty_sisa`, `jns_trans`, `qty_masuk`, `harga_masuk`, `tgl`, `saldo`, `qty_in`) VALUES ('cbfa3c06-7acc-429d-8c26-35552c35e460', '1febae41-c8f9-5a89-800d-f6a4a81f7a24', 'OBT140140ID', '2be47cef-083a-4423-95a0-dfe7c667df61', 12, 1500, 18000, NULL, 8988, 'KELUAR', NULL, NULL, '2017-05-30', 8982000, NULL);


#
# TABLE STRUCTURE FOR: t_users
#

DROP TABLE IF EXISTS `t_users`;

CREATE TABLE `t_users` (
  `id` varchar(36) NOT NULL,
  `username` varchar(32) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`username`,`email`),
  KEY `t_users_id` (`id`),
  KEY `t_users_username` (`username`),
  KEY `t_users_email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `t_users` (`id`, `username`, `realname`, `email`, `password`, `is_active`) VALUES ('bace0701-15e3-5144-97c5-47487d543032', 'admin', 'Admin Sistem', 'admin@lokal.web', 'd033e22ae348aeb5660fc2140aec35850c4da997', '1');
INSERT INTO `t_users` (`id`, `username`, `realname`, `email`, `password`, `is_active`) VALUES ('cf00c54f-43b5-5d93-98ea-6d6f620e2d96', 'operator', 'Operator Sistem', 'operator@lokal.web', 'fe96dd39756ac41b74283a9292652d366d73931f', '1');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES (1, '127.0.0.1', 'admin', '$2y$10$b/FMxkaYYODQ.G1ERi/8EOhLVLtTKzn8jMut5gGbhSARnLsLPArCi', '', 'admin@localhost', '', NULL, NULL, NULL, 1268889823, 1268889823, 1, 'Admin', 'Sistem', 'Good Company', '081234567890');
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES (2, '::1', 'aris', '$2y$08$ZzVfMR1YdHDP18bawy0gC.h1W8C6yA6j7lgHVGFXagUDUDwuZRq5W', NULL, 'aris@gmail.com', NULL, NULL, NULL, NULL, 1516595142, NULL, 1, 'Aris', 'Ripandi', NULL, '0844553444');
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES (3, '::1', 'geri', '$2y$08$NZz3M0Bc1cYEC8cddLD97uNfptb4rTnzDE303BoCREkq2ufTe/rkO', NULL, 'geri@gmail.com', NULL, NULL, NULL, NULL, 1516595268, NULL, 0, 'Geri', 'Sugiran', NULL, '08456787654');


#
# TABLE STRUCTURE FOR: users_groups
#

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES (1, 1, 1);
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES (2, 1, 2);
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES (3, 2, 3);
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES (4, 3, 3);


