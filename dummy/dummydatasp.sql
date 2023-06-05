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

--SELECT idUser, username, roleName FROM Users INNER JOIN [Role] ON Users.fkRole=[Role].idRole

EXEC dbo.spCreateForm 'Survei Akses Pelayanan dan Pembiayaan Kesehatan'
EXEC dbo.spCreateQuestion 1, 'T;Nama Lengkap,T;Umur,T;Jenis Kelamin,T;Pendidikan,T;Pekerjaan,N;Jumlah Penghasilan per Bulan,T;Penerima BLT?'
EXEC dbo.spCreateQuestion 1, 'T;Bila Anda atau anggota keluarga sakit di mana berobatnya?,T;Berapa jarak dari rumah Anda sampai ke fasilitas kesehatan yang ada?,T;Apa sarana transportasi yang digunakan?,T;Apakah keluarga Anda memiliki jaminan kesehatan BPJS/KIS/Asuransi Swasta?'

--SELECT * FROM Questions

EXEC dbo.spInputAnswer '1;Cagak Thamrin,2;77,3;Pria,4;Sarjana,5;Wirausaha,6;5237105,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Lasmanto Salahudin,2;93,3;Pria,4;SMP,5;TNI,6;2332322,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Farah Zulaika,2;61,3;Wanita,4;SMA,5;Guru,6;7077554,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Ajeng Prastuti,2;52,3;Wanita,4;Sarjana,5;Arsitek,6;3031318,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Violet Prastuti,2;99,3;Wanita,4;Sarjana,5;Wirausaha,6;6052974,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Zulaikha Hartati,2;97,3;Wanita,4;SD,5;Peternak,6;2760003,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Puput Uyainah,2;80,3;Wanita,4;SMA,5;Peternak,6;7981622,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Gamblang Sihotang,2;35,3;Pria,4;Magister,5;Peternak,6;6812479,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Cinta Melani,2;71,3;Wanita,4;SD,5;Peternak,6;9900961,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Ami Hartati,2;73,3;Wanita,4;SMP,5;Arsitek,6;6777062,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Wirda Pudjiastuti,2;81,3;Wanita,4;Diploma,5;Guru,6;2237551,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Indra Maulana,2;96,3;Pria,4;Magister,5;Perawat,6;6634224,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Manah Mustofa,2;81,3;Pria,4;Magister,5;Penulis,6;1164832,7;a. Ya,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Nabila Susanti,2;37,3;Wanita,4;SMA,5;Petani,6;7536993,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Shania Astuti,2;39,3;Wanita,4;Diploma,5;Swasta,6;4872387,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Dina Maryati,2;36,3;Wanita,4;SMA,5;Petani,6;1984733,7;a. Ya,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Victoria Maryati,2;50,3;Wanita,4;SMP,5;Nelayan,6;9699557,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Pranawa Halim,2;72,3;Pria,4;SD,5;Penulis,6;1327430,7;a. Ya,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Karen Widiastuti,2;25,3;Wanita,4;Magister,5;Penulis,6;7976492,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;Kendaraan umum,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Harjo Pranowo,2;21,3;Pria,4;SD,5;TNI,6;9594957,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;a. Jalan kaki,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Jumari Saefullah,2;39,3;Pria,4;SMA,5;Penulis,6;7844086,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Balamantri Tarihoran,2;65,3;Pria,4;SMP,5;Guru,6;3064916,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Bakidin Suryono,2;86,3;Pria,4;Magister,5;Guru,6;4345234,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Zulaikha Nuraini,2;19,3;Wanita,4;SMP,5;Arsitek,6;9754756,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Endah Fujiati,2;60,3;Wanita,4;Sarjana,5;Swasta,6;4274692,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Zulaikha Winarsih,2;100,3;Wanita,4;Sarjana,5;Penulis,6;1574419,7;a. Ya,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Vero Maulana,2;72,3;Pria,4;Diploma,5;Nelayan,6;1638348,7;a. Ya,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Tari Kuswandari,2;32,3;Wanita,4;SMP,5;Petani,6;5116747,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Yunita Laksmiwati,2;86,3;Wanita,4;Doktor,5;PNS,6;3330742,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Latika Hassanah,2;87,3;Wanita,4;Magister,5;Swasta,6;4934154,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Zaenab Permata,2;19,3;Wanita,4;SMP,5;PNS,6;7633900,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Timbul Hutasoit,2;42,3;Pria,4;Doktor,5;Arsitek,6;8599833,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Oni Nurdiyanti,2;91,3;Wanita,4;SMA,5;Perawat,6;8967237,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Lalita Hastuti,2;55,3;Wanita,4;SD,5;TNI,6;6603407,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Sarah Rahayu,2;50,3;Wanita,4;SMA,5;Arsitek,6;3200677,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Uchita Usamah,2;75,3;Wanita,4;SMA,5;Wirausaha,6;1334557,7;a. Ya,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Safina Anggraini,2;53,3;Wanita,4;Magister,5;Wirausaha,6;7238548,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Mujur Anggriawan,2;75,3;Pria,4;SMA,5;Wirausaha,6;2208528,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Nardi Marbun,2;61,3;Pria,4;Magister,5;Perawat,6;5378663,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Bahuraksa Firgantoro,2;92,3;Pria,4;Doktor,5;Wirausaha,6;1243318,7;a. Ya,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Halim Pangestu,2;53,3;Pria,4;SD,5;Penulis,6;2032293,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Gabriella Handayani,2;67,3;Wanita,4;Doktor,5;Swasta,6;1457035,7;a. Ya,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Wira Kuswoyo,2;48,3;Pria,4;SMA,5;Perawat,6;9817136,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Febi Safitri,2;52,3;Wanita,4;SMA,5;Peternak,6;9511323,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Mala Hasanah,2;30,3;Wanita,4;Diploma,5;Peternak,6;1576233,7;a. Ya,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Reksa Simbolon,2;84,3;Pria,4;SMA,5;Wirausaha,6;4110224,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Naradi Mansur,2;75,3;Pria,4;SMP,5;PNS,6;3435559,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Chelsea Yolanda,2;97,3;Wanita,4;SMP,5;Perawat,6;3940315,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Kasim Iswahyudi,2;27,3;Pria,4;Diploma,5;Wirausaha,6;3377067,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Intan Uyainah,2;86,3;Wanita,4;SMA,5;PNS,6;1571890,7;a. Ya,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Queen Purnawati,2;61,3;Wanita,4;Sarjana,5;Nelayan,6;1573741,7;a. Ya,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Mala Agustina,2;32,3;Wanita,4;SMP,5;Swasta,6;9871114,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Edi Setiawan,2;56,3;Pria,4;Sarjana,5;Arsitek,6;7829215,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Mariadi Anggriawan,2;32,3;Pria,4;SMP,5;Swasta,6;5579752,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Rendy Hardiansyah,2;45,3;Pria,4;Diploma,5;Peternak,6;3773617,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Lutfan Kusumo,2;80,3;Pria,4;SD,5;Peternak,6;7170565,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Clara Rahmawati,2;92,3;Wanita,4;SMA,5;Petani,6;5735061,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Hamima Pudjiastuti,2;25,3;Wanita,4;SMA,5;Arsitek,6;1317483,7;a. Ya,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;a. Jalan kaki,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Koko Setiawan,2;94,3;Pria,4;Magister,5;PNS,6;9513020,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Rachel Hartati,2;24,3;Wanita,4;SD,5;Petani,6;3396068,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Zahra Yuliarti,2;72,3;Wanita,4;Magister,5;Petani,6;1679129,7;a. Ya,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Gatot Tampubolon,2;98,3;Pria,4;SMP,5;Petani,6;8310010,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Rini Hastuti,2;22,3;Wanita,4;Sarjana,5;Nelayan,6;3007811,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Akarsana Firmansyah,2;85,3;Pria,4;Diploma,5;Arsitek,6;8022451,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Baktiadi Lazuardi,2;100,3;Pria,4;Doktor,5;Guru,6;4510812,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Marwata Utama,2;35,3;Pria,4;Magister,5;Swasta,6;7953825,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Jamalia Uyainah,2;65,3;Wanita,4;Diploma,5;Arsitek,6;7307161,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Usyi Purwanti,2;20,3;Wanita,4;SMA,5;Arsitek,6;9910598,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;Kendaraan umum,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Radit Maryadi,2;31,3;Pria,4;Diploma,5;Wirausaha,6;1008156,7;a. Ya,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Keisha Padmasari,2;27,3;Wanita,4;Doktor,5;PNS,6;4161865,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Ina Wijayanti,2;80,3;Wanita,4;Sarjana,5;Perawat,6;4697227,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Cahyanto Hutasoit,2;18,3;Pria,4;SD,5;Petani,6;3170358,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Nasrullah Maulana,2;18,3;Pria,4;SMA,5;PNS,6;8664794,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Eka Simanjuntak,2;76,3;Pria,4;SMA,5;Swasta,6;6908358,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Victoria Nurdiyanti,2;98,3;Wanita,4;SD,5;Penulis,6;4170868,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Tugiman Mangunsong,2;80,3;Pria,4;SMP,5;Penulis,6;3713091,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Galak Nainggolan,2;69,3;Pria,4;Doktor,5;TNI,6;8908284,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Zalindra Winarsih,2;92,3;Wanita,4;SMP,5;Arsitek,6;9643690,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Eli Mayasari,2;90,3;Wanita,4;Doktor,5;Perawat,6;4342094,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Jail Hidayat,2;27,3;Pria,4;Sarjana,5;Petani,6;2517422,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Malika Usada,2;100,3;Wanita,4;SMP,5;PNS,6;6988773,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Malika Wijayanti,2;34,3;Wanita,4;SD,5;Peternak,6;7244984,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Yahya Mustofa,2;31,3;Pria,4;Doktor,5;Perawat,6;9108400,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Yance Agustina,2;87,3;Wanita,4;SD,5;Swasta,6;1767630,7;a. Ya,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Jaeman Hakim,2;77,3;Pria,4;Diploma,5;Petani,6;5717200,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Uda Gunawan,2;29,3;Pria,4;Diploma,5;PNS,6;1076230,7;a. Ya,8;c. Diobati Sendiri,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Viktor Thamrin,2;61,3;Pria,4;Sarjana,5;Wirausaha,6;5664304,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Garang Gunawan,2;51,3;Pria,4;SD,5;TNI,6;7830509,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Hani Wahyuni,2;58,3;Wanita,4;Sarjana,5;TNI,6;4303194,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Gilda Andriani,2;89,3;Wanita,4;Sarjana,5;Guru,6;8391943,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Cengkir Natsir,2;39,3;Pria,4;Magister,5;Peternak,6;6687115,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Ophelia Farida,2;80,3;Wanita,4;Sarjana,5;Arsitek,6;8244117,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Hasta Marbun,2;93,3;Pria,4;SD,5;Swasta,6;7016055,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Jarwa Tampubolon,2;59,3;Pria,4;Doktor,5;Nelayan,6;2744977,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Asmuni Ramadan,2;51,3;Pria,4;SD,5;Arsitek,6;8539091,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Cornelia Safitri,2;31,3;Wanita,4;Doktor,5;Nelayan,6;2576141,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Septi Permata,2;48,3;Wanita,4;Doktor,5;Peternak,6;7565706,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Ozy Prabowo,2;28,3;Pria,4;Diploma,5;Peternak,6;1471330,7;a. Ya,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Danu Gunarto,2;39,3;Pria,4;SMP,5;Petani,6;5834303,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Ifa Wulandari,2;63,3;Wanita,4;SD,5;TNI,6;3237252,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;Kendaraan umum,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Wardi Nababan,2;38,3;Pria,4;Sarjana,5;Perawat,6;7332353,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Siti Melani,2;75,3;Wanita,4;SMP,5;Peternak,6;7017056,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Taswir Hidayanto,2;94,3;Pria,4;Magister,5;Wirausaha,6;1165574,7;a. Ya,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Icha Palastri,2;62,3;Wanita,4;Sarjana,5;Petani,6;7123766,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Yessi Yulianti,2;18,3;Wanita,4;SMP,5;Guru,6;6137806,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Kamidin Simbolon,2;54,3;Pria,4;SMP,5;Penulis,6;4183555,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Julia Nuraini,2;28,3;Wanita,4;SD,5;TNI,6;3206910,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Ozy Hidayanto,2;62,3;Pria,4;Diploma,5;TNI,6;9894508,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Galih Utama,2;34,3;Pria,4;SMA,5;Swasta,6;1132165,7;a. Ya,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Ismail Mahendra,2;31,3;Pria,4;SD,5;Perawat,6;6793468,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Drajat Wibisono,2;33,3;Pria,4;SMA,5;Peternak,6;4111916,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Martani Maulana,2;34,3;Pria,4;SMA,5;PNS,6;3011559,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Janet Nasyiah,2;79,3;Wanita,4;Sarjana,5;Petani,6;7958687,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Genta Yulianti,2;19,3;Wanita,4;SMP,5;Petani,6;5840572,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Mulyanto Suryono,2;82,3;Pria,4;Sarjana,5;PNS,6;5170917,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Dacin Sitompul,2;87,3;Pria,4;Sarjana,5;Perawat,6;9943671,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Padma Yuliarti,2;78,3;Wanita,4;Doktor,5;Guru,6;2308802,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Gara Prakasa,2;42,3;Pria,4;Magister,5;TNI,6;5858462,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Kiandra Mardhiyah,2;81,3;Wanita,4;SMA,5;Penulis,6;3277968,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Elma Usamah,2;17,3;Wanita,4;SD,5;Swasta,6;4265740,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;Kendaraan umum,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Febi Hassanah,2;53,3;Wanita,4;SMP,5;Perawat,6;4192460,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Indah Wijayanti,2;31,3;Wanita,4;Sarjana,5;Petani,6;5491873,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Ade Siregar,2;24,3;Pria,4;Sarjana,5;Wirausaha,6;1219397,7;a. Ya,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;Kendaraan umum,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Clara Purnawati,2;66,3;Wanita,4;Magister,5;Arsitek,6;9960236,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Simon Maryadi,2;48,3;Pria,4;Diploma,5;PNS,6;3571780,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Karsa Hidayanto,2;92,3;Pria,4;Diploma,5;Nelayan,6;8508776,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Ratih Hasanah,2;51,3;Wanita,4;Magister,5;Perawat,6;5380701,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Jamalia Permata,2;27,3;Wanita,4;Magister,5;Wirausaha,6;9015379,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Bagya Rajasa,2;79,3;Pria,4;SMP,5;Wirausaha,6;8245956,7;b. Tidak,8;c. Diobati Sendiri,9;d. Lebih dari 10 KM,10;b. Kendaraan pribadi,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Dalimin Hidayat,2;25,3;Pria,4;SMA,5;Perawat,6;8121402,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;Kendaraan umum,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Salwa Wahyuni,2;76,3;Wanita,4;SMP,5;Peternak,6;1556279,7;a. Ya,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Rika Purnawati,2;27,3;Wanita,4;Doktor,5;Guru,6;8393546,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Cengkal Pranowo,2;62,3;Pria,4;Diploma,5;Wirausaha,6;4999183,7;b. Tidak,8;a. Tenaga Kesehatan,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Umi Oktaviani,2;32,3;Wanita,4;SMP,5;Guru,6;6702619,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Kani Agustina,2;32,3;Wanita,4;SD,5;TNI,6;3028650,7;b. Tidak,8;c. Diobati Sendiri,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Prakosa Putra,2;82,3;Pria,4;Magister,5;Penulis,6;5221078,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Tomi Pratama,2;53,3;Pria,4;SMP,5;Petani,6;8117945,7;b. Tidak,8;a. Tenaga Kesehatan,9;a. Kurang dari 1 KM,10;b. Kendaraan pribadi,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Galang Waluyo,2;22,3;Pria,4;Diploma,5;Penulis,6;8417714,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswer '1;Usyi Handayani,2;58,3;Wanita,4;SMA,5;Swasta,6;3632295,7;b. Tidak,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Puspa Hartati,2;70,3;Wanita,4;Diploma,5;Petani,6;4500125,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;b. Kendaraan pribadi,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Prayoga Sitorus,2;85,3;Pria,4;Doktor,5;Perawat,6;1258363,7;a. Ya,8;b. Tradisional/Alternatif,9;b. 1-5 KM,10;Kendaraan umum,11;a. BPJ', 5, 1
EXEC dbo.spInputAnswer '1;Shania Winarsih,2;93,3;Wanita,4;SD,5;PNS,6;6718427,7;b. Tidak,8;a. Tenaga Kesehatan,9;b. 1-5 KM,10;a. Jalan kaki,11;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswer '1;Cindy Mayasari,2;49,3;Wanita,4;Sarjana,5;PNS,6;7800549,7;b. Tidak,8;b. Tradisional/Alternatif,9;a. Kurang dari 1 KM,10;a. Jalan kaki,11;a. BPJ', 4, 1
EXEC dbo.spInputAnswer '1;Asmuni Marpaung,2;85,3;Pria,4;Magister,5;PNS,6;8963494,7;b. Tidak,8;c. Diobati Sendiri,9;b. 1-5 KM,10;a. Jalan kaki,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Wadi Narpati,2;95,3;Pria,4;Magister,5;Swasta,6;9095012,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;b. KIS', 3, 1
EXEC dbo.spInputAnswer '1;Rahman Nababan,2;40,3;Pria,4;Diploma,5;PNS,6;6190788,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswer '1;Harsanto Wahyudin,2;84,3;Pria,4;Magister,5;Nelayan,6;4436441,7;b. Tidak,8;c. Diobati Sendiri,9;c. 6-10 KM,10;Kendaraan umum,11;b. KIS', 5, 1
EXEC dbo.spInputAnswer '1;Salimah Namaga,2;63,3;Wanita,4;SMA,5;Wirausaha,6;8262103,7;b. Tidak,8;a. Tenaga Kesehatan,9;d. Lebih dari 10 KM,10;a. Jalan kaki,11;a. BPJ', 3, 1
EXEC dbo.spInputAnswer '1;Dalima Kusmawati,2;93,3;Wanita,4;Magister,5;Arsitek,6;9794257,7;b. Tidak,8;b. Tradisional/Alternatif,9;c. 6-10 KM,10;Kendaraan umum,11;b. KIS', 4, 1
EXEC dbo.spInputAnswer '1;Kiandra Sudiati,2;87,3;Wanita,4;Doktor,5;PNS,6;5605354,7;b. Tidak,8;b. Tradisional/Alternatif,9;d. Lebih dari 10 KM,10;Kendaraan umum,11;c. Asuransi swasta', 5, 1

--SELECT * FROM AnswerGroup

--EXEC dbo.spCreateForm 'Survei Rumah dan Lingkungan'