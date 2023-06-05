INSERT INTO
	[Role](roleName)
VALUES
	('kader'),
	('penanggung jawab'),
	('admin')

--SELECT * FROM [Role]

INSERT INTO
	Users(username, [password], fkRole)
VALUES
	('admin', 'password', 3),
	('aldo', 'password', 2),
	('keanen', 'password', 1),
	('erwin', 'password', 1),
	('vito', 'password', 1)

SELECT idUser, username, roleName FROM Users INNER JOIN [Role] ON Users.fkRole=[Role].idRole

EXEC dbo.spCreateForm 'Survei Akses Pelayanan dan Pembiayaan Kesehatan'
EXEC dbo.spCreateQuestion 1, 'T;Nama Lengkap,T;Umur,T;Jenis Kelamin,T;Pendidikan,T;Pekerjaan,N;Jumlah Penghasilan per Bulan,T;Penerima BLT?'
EXEC dbo.spCreateQuestion 1, 'T;Bila Anda atau anggota keluarga sakit di mana berobatnya?,T;Berapa jarak dari rumah Anda sampai ke fasilitas kesehatan yang ada?,T;Apa sarana transportasi yang digunakan?,T;Apakah keluarga Anda memiliki jaminan kesehatan BPJS/KIS/Asuransi Swasta?'

SELECT * FROM Questions

EXEC dbo.spInputAnswer '1;Cagak Thamrin,2;,3;Pria,4;Sarjana,5;Wirausaha,6;8584381,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Lasmanto Salahudin,2;93,3;Pria,4;SMP,5;TNI,6;7268633,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Farah Zulaika,2;61,3;Wanita,4;Jr. Ters. Jakarta No. 233,5;Guru,6;7626897,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Ajeng Prastuti,2;52,3;Wanita,4;Jln. Sutami No. 692,5;Arsitek,6;8394743,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Violet Prastuti,2;99,3;Wanita,4;Dk. Ronggowarsito No. 375,5;Wirausaha,6;9674032,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Zulaikha Hartati,2;97,3;Wanita,4;,5;Peternak,6;2085221,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Puput Uyainah,2;80,3;Wanita,4;Psr. Urip Sumoharjo No. 685,5;Peternak,6;3096883,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Gamblang Sihotang,2;35,3;Pria,4;Gg. Kyai Mojo No. 407,5;Peternak,6;6591111,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Cinta Melani,2;71,3;Wanita,4;,5;Peternak,6;5072557,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Ami Hartati,2;73,3;Wanita,4;SMP,5;Arsitek,6;4538966,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Wirda Pudjiastuti,2;81,3;Wanita,4;Wanita,5;Guru,6;8472078,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Indra Maulana,2;96,3;Pria,4;Gg. Bata Putih No. 469,5;Perawat,6;9695947,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Manah Mustofa,2;81,3;Pria,4;Magister,5;Penulis,6;1117696,7;a. Ya,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Nabila Susanti,2;37,3;Wanita,4;SMA,5;Petani,6;7646069,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Shania Astuti,2;39,3;Wanita,4;Diploma,5;Swasta,6;8657618,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Dina Maryati,2;36,3;Wanita,4;Ds. Pelajar Pejuang 45 No. 38,5;Petani,6;4756829,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Victoria Maryati,2;50,3;Wanita,4;Kpg. Ciwastra No. 859,5;Nelayan,6;3298903,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Pranawa Halim,2;72,3;Pria,4;,5;Penulis,6;6297430,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Karen Widiastuti,2;25,3;Wanita,4;Jln. Baha No. 850,5;Penulis,6;4257261,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;Kendaraan umum,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Harjo Pranowo,2;21,3;Pria,4;,5;TNI,6;9731471,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;a. Jalan kaki,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Jumari Saefullah,2;39,3;Pria,4;,5;Penulis,6;7351083,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Balamantri Tarihoran,2;65,3;Pria,4;SMP,5;Guru,6;1143084,7;a. Ya,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Bakidin Suryono,2;86,3;Pria,4;Magister,5;Guru,6;1216725,7;a. Ya,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Zulaikha Nuraini,2;19,3;Wanita,4;SMP,5;Arsitek,6;4340295,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Endah Fujiati,2;60,3;Wanita,4;Sarjana,5;Swasta,6;3704671,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Zulaikha Winarsih,2;100,3;Wanita,4;Psr. Baing No. 740,5;Penulis,6;8227867,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Vero Maulana,2;72,3;Pria,4;,5;Nelayan,6;9759211,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Tari Kuswandari,2;32,3;Wanita,4;Gg. Ronggowarsito No. 914,5;Petani,6;8087668,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Yunita Laksmiwati,2;86,3;Wanita,4;Psr. Padang No. 622,5;PNS,6;7110720,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Latika Hassanah,2;87,3;Wanita,4;Magister,5;Swasta,6;6568140,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Zaenab Permata,2;19,3;Wanita,4;SMP,5;PNS,6;7023148,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Timbul Hutasoit,2;42,3;Pria,4;Doktor,5;Arsitek,6;2887918,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Oni Nurdiyanti,2;91,3;Wanita,4;Kpg. Achmad Yani No. 606,5;Perawat,6;2204192,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Lalita Hastuti,2;55,3;Wanita,4;SD,5;TNI,6;8508812,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Sarah Rahayu,2;50,3;Wanita,4;Kpg. Astana Anyar No. 553,5;Arsitek,6;6337197,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Uchita Usamah,2;75,3;Wanita,4;SMA,5;Wirausaha,6;3709185,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Safina Anggraini,2;53,3;Wanita,4;Jln. Ciwastra No. 27,5;Wirausaha,6;8068616,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Mujur Anggriawan,2;75,3;Pria,4;,5;Wirausaha,6;3060772,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Nardi Marbun,2;61,3;Pria,4;,5;Perawat,6;1598327,7;a. Ya,8;c. Diobati Sendiri,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Bahuraksa Firgantoro,2;92,3;Pria,4;Ds. Bakti No. 28,5;Wirausaha,6;5918606,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Halim Pangestu,2;53,3;Pria,4;SD,5;Penulis,6;9325554,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Gabriella Handayani,2;67,3;Wanita,4;Psr. Raden No. 482,5;Swasta,6;5714036,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Wira Kuswoyo,2;48,3;Pria,4;SMA,5;Perawat,6;5487196,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Febi Safitri,2;52,3;Wanita,4;,5;Peternak,6;9856765,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Mala Hasanah,2;30,3;Wanita,4;Dk. Kalimalang No. 950,5;Peternak,6;3230347,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Reksa Simbolon,2;84,3;Pria,4;,5;Wirausaha,6;1824143,7;a. Ya,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Naradi Mansur,2;75,3;Pria,4;,5;PNS,6;9494760,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Chelsea Yolanda,2;97,3;Wanita,4;Kpg. Bagas Pati No. 450,5;Perawat,6;3683918,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Kasim Iswahyudi,2;27,3;Pria,4;Ds. Cihampelas No. 417,5;Wirausaha,6;5359434,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Intan Uyainah,2;86,3;Wanita,4;,5;PNS,6;8323525,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Queen Purnawati,2;61,3;Wanita,4;Kpg. Suryo No. 400,5;Nelayan,6;2624514,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Mala Agustina,2;32,3;Wanita,4;,5;Swasta,6;6979317,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Edi Setiawan,2;56,3;Pria,4;Sarjana,5;Arsitek,6;1184686,7;a. Ya,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Mariadi Anggriawan,2;32,3;Pria,4;Pria,5;Swasta,6;2844887,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Rendy Hardiansyah,2;45,3;Pria,4;Diploma,5;Peternak,6;8356238,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Lutfan Kusumo,2;80,3;Pria,4;,5;Peternak,6;7849792,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Clara Rahmawati,2;92,3;Wanita,4;SMA,5;Petani,6;5019495,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Hamima Pudjiastuti,2;25,3;Wanita,4;Ds. Thamrin No. 726,5;Arsitek,6;1285346,7;a. Ya,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;a. Jalan kaki,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Koko Setiawan,2;94,3;Pria,4;Dk. Cikapayang No. 475,5;PNS,6;2313804,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Rachel Hartati,2;24,3;Wanita,4;,5;Petani,6;7962967,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Zahra Yuliarti,2;72,3;Wanita,4;Wanita,5;Petani,6;8603141,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Gatot Tampubolon,2;98,3;Pria,4;,5;Petani,6;8819977,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Rini Hastuti,2;22,3;Wanita,4;Sarjana,5;Nelayan,6;5977227,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Akarsana Firmansyah,2;85,3;Pria,4;Kpg. Wora Wari No. 38,5;Arsitek,6;5292442,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Baktiadi Lazuardi,2;100,3;Pria,4;Pria,5;Guru,6;4723268,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Marwata Utama,2;35,3;Pria,4;Magister,5;Swasta,6;8903161,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Jamalia Uyainah,2;65,3;Wanita,4;Ki. Bahagia No. 946,5;Arsitek,6;7315463,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Usyi Purwanti,2;20,3;Wanita,4;Ds. Cut Nyak Dien No. 178,5;Arsitek,6;7033427,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;Kendaraan umum,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Radit Maryadi,2;31,3;Pria,4;,5;Wirausaha,6;6339552,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Keisha Padmasari,2;27,3;Wanita,4;Doktor,5;PNS,6;2677928,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Ina Wijayanti,2;80,3;Wanita,4;Psr. PHH. Mustofa No. 201,5;Perawat,6;4903261,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Cahyanto Hutasoit,2;18,3;Pria,4;Ds. Dewi Sartika No. 258,5;Petani,6;3952928,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Nasrullah Maulana,2;18,3;Pria,4;Psr. Casablanca No. 942,5;PNS,6;2034430,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Eka Simanjuntak,2;76,3;Pria,4;,5;Swasta,6;9180696,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Victoria Nurdiyanti,2;98,3;Wanita,4;Ki. Basoka Raya No. 882,5;Penulis,6;5148107,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Tugiman Mangunsong,2;80,3;Pria,4;Kpg. Dr. Junjunan No. 874,5;Penulis,6;3894794,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Galak Nainggolan,2;69,3;Pria,4;Jr. Diponegoro No. 673,5;TNI,6;4298606,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Zalindra Winarsih,2;92,3;Wanita,4;Psr. Kartini No. 107,5;Arsitek,6;7484872,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Eli Mayasari,2;90,3;Wanita,4;Doktor,5;Perawat,6;5877150,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Jail Hidayat,2;27,3;Pria,4;Jln. Adisumarmo No. 815,5;Petani,6;8670247,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Malika Usada,2;100,3;Wanita,4;Ki. Gatot Subroto No. 963,5;PNS,6;9630289,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Malika Wijayanti,2;34,3;Wanita,4;SD,5;Peternak,6;5345635,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Yahya Mustofa,2;31,3;Pria,4;Ki. Basuki Rahmat No. 71,5;Perawat,6;3767833,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Yance Agustina,2;87,3;Wanita,4;,5;Swasta,6;9906814,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Jaeman Hakim,2;77,3;Pria,4;Diploma,5;Petani,6;2275164,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Uda Gunawan,2;29,3;Pria,4;Dk. Sumpah Pemuda No. 822,5;PNS,6;7302430,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Viktor Thamrin,2;61,3;Pria,4;Jr. Jayawijaya No. 917,5;Wirausaha,6;4592673,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Garang Gunawan,2;51,3;Pria,4;SD,5;TNI,6;1269033,7;a. Ya,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Hani Wahyuni,2;58,3;Wanita,4;Jln. K.H. Maskur No. 229,5;TNI,6;6851043,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Gilda Andriani,2;89,3;Wanita,4;Psr. Katamso No. 405,5;Guru,6;9391908,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Cengkir Natsir,2;39,3;Pria,4;Dk. Surapati No. 588,5;Peternak,6;5130685,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Ophelia Farida,2;80,3;Wanita,4;Gg. Adisucipto No. 898,5;Arsitek,6;1146616,7;a. Ya,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Hasta Marbun,2;93,3;Pria,4;Jln. Tangkuban Perahu No. 134,5;Swasta,6;1325864,7;a. Ya,8;c. Diobati Sendiri,9;c. 6-10 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Jarwa Tampubolon,2;59,3;Pria,4;Doktor,5;Nelayan,6;3743244,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Asmuni Ramadan,2;51,3;Pria,4;SD,5;Arsitek,6;3520068,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Cornelia Safitri,2;31,3;Wanita,4;Kpg. Pattimura No. 637,5;Nelayan,6;6844875,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Septi Permata,2;48,3;Wanita,4;Doktor,5;Peternak,6;2681199,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Ozy Prabowo,2;28,3;Pria,4;,5;Peternak,6;1490772,7;a. Ya,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Danu Gunarto,2;39,3;Pria,4;,5;Petani,6;7544775,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Ifa Wulandari,2;63,3;Wanita,4;Jr. Yap Tjwan Bing No. 140,5;TNI,6;3946843,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;Kendaraan umum,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Wardi Nababan,2;38,3;Pria,4;Sarjana,5;Perawat,6;3432680,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Siti Melani,2;75,3;Wanita,4;SMP,5;Peternak,6;6080421,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Taswir Hidayanto,2;94,3;Pria,4;Kpg. Sentot Alibasa No. 406,5;Wirausaha,6;1336205,7;a. Ya,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Icha Palastri,2;62,3;Wanita,4;Sarjana,5;Petani,6;6942758,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Yessi Yulianti,2;18,3;Wanita,4;Gg. Jend. Sudirman No. 532,5;Guru,6;5449040,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Kamidin Simbolon,2;54,3;Pria,4;,5;Penulis,6;8132837,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Julia Nuraini,2;28,3;Wanita,4;SD,5;TNI,6;3246042,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Ozy Hidayanto,2;62,3;Pria,4;Gg. Asia Afrika No. 194,5;TNI,6;6399978,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Galih Utama,2;34,3;Pria,4;,5;Swasta,6;5300368,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Ismail Mahendra,2;31,3;Pria,4;,5;Perawat,6;7340480,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Drajat Wibisono,2;33,3;Pria,4;Jr. Jend. A. Yani No. 813,5;Peternak,6;4845444,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Martani Maulana,2;34,3;Pria,4;,5;PNS,6;3520776,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Janet Nasyiah,2;79,3;Wanita,4;Sarjana,5;Petani,6;7798456,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Genta Yulianti,2;19,3;Wanita,4;Wanita,5;Petani,6;6070997,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Mulyanto Suryono,2;82,3;Pria,4;Sarjana,5;PNS,6;5486306,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Dacin Sitompul,2;87,3;Pria,4;Jln. Pattimura No. 895,5;Perawat,6;7236986,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Padma Yuliarti,2;78,3;Wanita,4;Doktor,5;Guru,6;4188733,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Gara Prakasa,2;42,3;Pria,4;,5;TNI,6;4962012,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Kiandra Mardhiyah,2;81,3;Wanita,4;SMA,5;Penulis,6;4655906,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Elma Usamah,2;17,3;Wanita,4;SD,5;Swasta,6;8148768,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Febi Hassanah,2;53,3;Wanita,4;SMP,5;Perawat,6;5692899,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Indah Wijayanti,2;31,3;Wanita,4;Psr. Camar No. 915,5;Petani,6;2522763,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Ade Siregar,2;24,3;Pria,4;Sarjana,5;Wirausaha,6;7415722,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;Kendaraan umum,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Clara Purnawati,2;66,3;Wanita,4;Jr. Basudewo No. 917,5;Arsitek,6;5870475,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Simon Maryadi,2;48,3;Pria,4;Diploma,5;PNS,6;8643734,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Karsa Hidayanto,2;92,3;Pria,4;Diploma,5;Nelayan,6;5519585,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Ratih Hasanah,2;51,3;Wanita,4;Magister,5;Perawat,6;6030007,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Jamalia Permata,2;27,3;Wanita,4;Gg. Kebonjati No. 838,5;Wirausaha,6;8247073,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Bagya Rajasa,2;79,3;Pria,4;,5;Wirausaha,6;5531618,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Dalimin Hidayat,2;25,3;Pria,4;,5;Perawat,6;1014654,7;a. Ya,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Salwa Wahyuni,2;76,3;Wanita,4;Ki. Untung Suropati No. 91,5;Peternak,6;2090758,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Rika Purnawati,2;27,3;Wanita,4;Jr. Asia Afrika No. 340,5;Guru,6;7201245,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Cengkal Pranowo,2;62,3;Pria,4;Diploma,5;Wirausaha,6;7834909,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Umi Oktaviani,2;32,3;Wanita,4;SMP,5;Guru,6;7919957,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Kani Agustina,2;32,3;Wanita,4;,5;TNI,6;6178724,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Prakosa Putra,2;82,3;Pria,4;Magister,5;Penulis,6;5787484,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Tomi Pratama,2;53,3;Pria,4;,5;Petani,6;3679835,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Galang Waluyo,2;22,3;Pria,4;,5;Penulis,6;9079662,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Usyi Handayani,2;58,3;Wanita,4;,5;Swasta,6;6002185,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Puspa Hartati,2;70,3;Wanita,4;Diploma,5;Petani,6;6301591,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Prayoga Sitorus,2;85,3;Pria,4;Doktor,5;Perawat,6;2371307,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;Kendaraan umum,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Shania Winarsih,2;93,3;Wanita,4;Ki. PHH. Mustofa No. 926,5;PNS,6;1845329,7;a. Ya,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Cindy Mayasari,2;49,3;Wanita,4;Sarjana,5;PNS,6;8502438,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Asmuni Marpaung,2;85,3;Pria,4;Magister,5;PNS,6;8808927,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Wadi Narpati,2;95,3;Pria,4;Jr. Abdul Muis No. 680,5;Swasta,6;8424639,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Rahman Nababan,2;40,3;Pria,4;Jln. Ters. Pasir Koja No. 904,5;PNS,6;8285316,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Harsanto Wahyudin,2;84,3;Pria,4;Ds. Abdul No. 821,5;Nelayan,6;9435421,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;Kendaraan umum,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Salimah Namaga,2;63,3;Wanita,4;,5;Wirausaha,6;7220568,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Dalima Kusmawati,2;93,3;Wanita,4;Jln. Cut Nyak Dien No. 39,5;Arsitek,6;8536296,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;Kendaraan umum,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Kiandra Sudiati,2;87,3;Wanita,4;Ki. Raden Saleh No. 41,5;PNS,6;4462125,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;c. Asuransi swasta', 5, 1

SELECT * FROM AnswerGroup

EXEC dbo.spCreateForm 'Survei Rumah dan Lingkungan'