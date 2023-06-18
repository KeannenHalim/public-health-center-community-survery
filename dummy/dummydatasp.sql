--delete data and reset table identity
DELETE FROM [Role]
DBCC CHECKIDENT ('[Role]', RESEED, 0);
DELETE FROM Form
DBCC CHECKIDENT ('[Form]', RESEED, 0);
DELETE FROM Users
DBCC CHECKIDENT ('[Users]', RESEED, 0);
DELETE FROM Questions
DBCC CHECKIDENT ('[Questions]', RESEED, 0);
DELETE FROM AnswerGroup
DBCC CHECKIDENT ('[AnswerGroup]', RESEED, 0);
DELETE FROM AnswerItemDate
DBCC CHECKIDENT ('[AnswerItemDate]', RESEED, 0);
DELETE FROM AnswerItemNumeric
DBCC CHECKIDENT ('[AnswerItemNumeric]', RESEED, 0);
DELETE FROM AnswerItemText
DBCC CHECKIDENT ('[AnswerItemText]', RESEED, 0);


EXEC dbo.spInsertRole 'kader'
EXEC dbo.spInsertRole 'penanggung jawab'
EXEC dbo.spInsertRole 'admin'

--SELECT * FROM [Role]

EXEC dbo.spCreateUser 'admin', 'password', 'admin'
EXEC dbo.spCreateUser 'aldo', 'password', 'penanggung jawab'
EXEC dbo.spCreateUser 'keannen', 'password', 'kader'
EXEC dbo.spCreateUser 'erwin', 'password', 'kader'
EXEC dbo.spCreateUser 'vito', 'password', 'kader'

--SELECT idUser, username, roleName FROM Users INNER JOIN [Role] ON Users.fkRole=[Role].idRole

EXEC dbo.spCreateForm 'Survei Akses Pelayanan dan Pembiayaan Kesehatan'
EXEC dbo.spCreateQuestions 1, 'T;Nama Lengkap,D;Tanggal Lahir,T;Umur,T;Jenis Kelamin,T;Pendidikan,T;Pekerjaan,N;Jumlah Penghasilan per Bulan,T;Penerima BLT?'
EXEC dbo.spCreateQuestions 1, 'T;Bila Anda atau anggota keluarga sakit di mana berobatnya?,T;Berapa jarak dari rumah Anda sampai ke fasilitas kesehatan yang ada?,T;Apa sarana transportasi yang digunakan?,T;Apakah keluarga Anda memiliki jaminan kesehatan BPJS/KIS/Asuransi Swasta?'


--SELECT * FROM Questions

EXEC dbo.spInputAnswers '1;Cagak Thamrin,2;1999-01-01,3;77,4;Pria,5;Sarjana,6;Wirausaha,7;1786383,8;a. Ya,9;b. Tradisional/Alternatif,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Lasmanto Salahudin,2;1999-01-01,3;93,4;Pria,5;SMP,6;TNI,7;4226675,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Farah Zulaika,2;1999-01-01,3;61,4;Wanita,5;SMA,6;Guru,7;7099420,8;b. Tidak,9;b. Tradisional/Alternatif,10;c. 6-10 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Ajeng Prastuti,2;1999-01-01,3;52,4;Wanita,5;Sarjana,6;Arsitek,7;7745624,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;a. Jalan kaki,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Violet Prastuti,2;1999-01-01,3;99,4;Wanita,5;Sarjana,6;Wirausaha,7;3700972,8;b. Tidak,9;a. Tenaga Kesehatan,10;d. Lebih dari 10 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Zulaikha Hartati,2;1999-01-01,3;97,4;Wanita,5;SD,6;Peternak,7;6453052,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;a. Jalan kaki,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Puput Uyainah,2;1999-01-01,3;80,4;Wanita,5;SMA,6;Peternak,7;6887716,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;a. Jalan kaki,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Gamblang Sihotang,2;1999-01-01,3;35,4;Pria,5;Magister,6;Peternak,7;9610796,8;b. Tidak,9;c. Diobati Sendiri,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Cinta Melani,2;1999-01-01,3;71,4;Wanita,5;SD,6;Peternak,7;3308021,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;Kendaraan umum,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Ami Hartati,2;1999-01-01,3;73,4;Wanita,5;SMP,6;Arsitek,7;1866355,8;a. Ya,9;b. Tradisional/Alternatif,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Wirda Pudjiastuti,2;1999-01-01,3;81,4;Wanita,5;Diploma,6;Guru,7;3333115,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;a. Jalan kaki,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Indra Maulana,2;1999-01-01,3;96,4;Pria,5;Magister,6;Perawat,7;6599175,8;b. Tidak,9;c. Diobati Sendiri,10;d. Lebih dari 10 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Manah Mustofa,2;1999-01-01,3;81,4;Pria,5;Magister,6;Penulis,7;9958432,8;b. Tidak,9;a. Tenaga Kesehatan,10;d. Lebih dari 10 KM,11;a. Jalan kaki,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Nabila Susanti,2;1999-01-01,3;37,4;Wanita,5;SMA,6;Petani,7;1351553,8;a. Ya,9;c. Diobati Sendiri,10;b. 1-5 KM,11;Kendaraan umum,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Shania Astuti,2;1999-01-01,3;39,4;Wanita,5;Diploma,6;Swasta,7;8975538,8;b. Tidak,9;c. Diobati Sendiri,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Dina Maryati,2;1999-01-01,3;36,4;Wanita,5;SMA,6;Petani,7;2582446,8;b. Tidak,9;c. Diobati Sendiri,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Victoria Maryati,2;1999-01-01,3;50,4;Wanita,5;SMP,6;Nelayan,7;3615538,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;Kendaraan umum,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Pranawa Halim,2;1999-01-01,3;72,4;Pria,5;SD,6;Penulis,7;2171232,8;b. Tidak,9;c. Diobati Sendiri,10;d. Lebih dari 10 KM,11;a. Jalan kaki,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Karen Widiastuti,2;1999-01-01,3;25,4;Wanita,5;Magister,6;Penulis,7;6028877,8;b. Tidak,9;c. Diobati Sendiri,10;c. 6-10 KM,11;Kendaraan umum,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Harjo Pranowo,2;1999-01-01,3;21,4;Pria,5;SD,6;TNI,7;6949434,8;b. Tidak,9;c. Diobati Sendiri,10;c. 6-10 KM,11;a. Jalan kaki,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Jumari Saefullah,2;1999-01-01,3;39,4;Pria,5;SMA,6;Penulis,7;3764935,8;b. Tidak,9;b. Tradisional/Alternatif,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Balamantri Tarihoran,2;1999-01-01,3;65,4;Pria,5;SMP,6;Guru,7;9315816,8;b. Tidak,9;b. Tradisional/Alternatif,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Bakidin Suryono,2;1999-01-01,3;86,4;Pria,5;Magister,6;Guru,7;8996309,8;b. Tidak,9;b. Tradisional/Alternatif,10;d. Lebih dari 10 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Zulaikha Nuraini,2;1999-01-01,3;19,4;Wanita,5;SMP,6;Arsitek,7;6411638,8;b. Tidak,9;c. Diobati Sendiri,10;c. 6-10 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Endah Fujiati,2;1999-01-01,3;60,4;Wanita,5;Sarjana,6;Swasta,7;1992697,8;a. Ya,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Zulaikha Winarsih,2;1999-01-01,3;100,4;Wanita,5;Sarjana,6;Penulis,7;7720755,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;a. Jalan kaki,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Vero Maulana,2;1999-01-01,3;72,4;Pria,5;Diploma,6;Nelayan,7;9866474,8;b. Tidak,9;b. Tradisional/Alternatif,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Tari Kuswandari,2;1999-01-01,3;32,4;Wanita,5;SMP,6;Petani,7;9784917,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;Kendaraan umum,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Yunita Laksmiwati,2;1999-01-01,3;86,4;Wanita,5;Doktor,6;PNS,7;7346595,8;b. Tidak,9;a. Tenaga Kesehatan,10;d. Lebih dari 10 KM,11;b. Kendaraan pribadi,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Latika Hassanah,2;1999-01-01,3;87,4;Wanita,5;Magister,6;Swasta,7;6758946,8;b. Tidak,9;a. Tenaga Kesehatan,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Zaenab Permata,2;1999-01-01,3;19,4;Wanita,5;SMP,6;PNS,7;9470051,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;a. Jalan kaki,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Timbul Hutasoit,2;1999-01-01,3;42,4;Pria,5;Doktor,6;Arsitek,7;1250750,8;a. Ya,9;c. Diobati Sendiri,10;b. 1-5 KM,11;Kendaraan umum,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Oni Nurdiyanti,2;1999-01-01,3;91,4;Wanita,5;SMA,6;Perawat,7;7159639,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Lalita Hastuti,2;1999-01-01,3;55,4;Wanita,5;SD,6;TNI,7;5514918,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Sarah Rahayu,2;1999-01-01,3;50,4;Wanita,5;SMA,6;Arsitek,7;9150711,8;b. Tidak,9;b. Tradisional/Alternatif,10;a. Kurang dari 1 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Uchita Usamah,2;1999-01-01,3;75,4;Wanita,5;SMA,6;Wirausaha,7;1778878,8;a. Ya,9;a. Tenaga Kesehatan,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Safina Anggraini,2;1999-01-01,3;53,4;Wanita,5;Magister,6;Wirausaha,7;5335168,8;b. Tidak,9;c. Diobati Sendiri,10;d. Lebih dari 10 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Mujur Anggriawan,2;1999-01-01,3;75,4;Pria,5;SMA,6;Wirausaha,7;6872973,8;b. Tidak,9;b. Tradisional/Alternatif,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Nardi Marbun,2;1999-01-01,3;61,4;Pria,5;Magister,6;Perawat,7;4167493,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Bahuraksa Firgantoro,2;1999-01-01,3;92,4;Pria,5;Doktor,6;Wirausaha,7;5586160,8;b. Tidak,9;a. Tenaga Kesehatan,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Halim Pangestu,2;1999-01-01,3;53,4;Pria,5;SD,6;Penulis,7;6188550,8;b. Tidak,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Gabriella Handayani,2;1999-01-01,3;67,4;Wanita,5;Doktor,6;Swasta,7;6773938,8;b. Tidak,9;b. Tradisional/Alternatif,10;a. Kurang dari 1 KM,11;a. Jalan kaki,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Wira Kuswoyo,2;1999-01-01,3;48,4;Pria,5;SMA,6;Perawat,7;6749011,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;Kendaraan umum,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Febi Safitri,2;1999-01-01,3;52,4;Wanita,5;SMA,6;Peternak,7;2245736,8;b. Tidak,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Mala Hasanah,2;1999-01-01,3;30,4;Wanita,5;Diploma,6;Peternak,7;8827345,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;a. Jalan kaki,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Reksa Simbolon,2;1999-01-01,3;84,4;Pria,5;SMA,6;Wirausaha,7;3255250,8;b. Tidak,9;b. Tradisional/Alternatif,10;d. Lebih dari 10 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Naradi Mansur,2;1999-01-01,3;75,4;Pria,5;SMP,6;PNS,7;3710181,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Chelsea Yolanda,2;1999-01-01,3;97,4;Wanita,5;SMP,6;Perawat,7;3690053,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Kasim Iswahyudi,2;1999-01-01,3;27,4;Pria,5;Diploma,6;Wirausaha,7;7541380,8;b. Tidak,9;b. Tradisional/Alternatif,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Intan Uyainah,2;1999-01-01,3;86,4;Wanita,5;SMA,6;PNS,7;2078865,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Queen Purnawati,2;1999-01-01,3;61,4;Wanita,5;Sarjana,6;Nelayan,7;6745333,8;b. Tidak,9;b. Tradisional/Alternatif,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Mala Agustina,2;1999-01-01,3;32,4;Wanita,5;SMP,6;Swasta,7;5810238,8;b. Tidak,9;c. Diobati Sendiri,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Edi Setiawan,2;1999-01-01,3;56,4;Pria,5;Sarjana,6;Arsitek,7;3825190,8;b. Tidak,9;a. Tenaga Kesehatan,10;d. Lebih dari 10 KM,11;a. Jalan kaki,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Mariadi Anggriawan,2;1999-01-01,3;32,4;Pria,5;SMP,6;Swasta,7;2576053,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Rendy Hardiansyah,2;1999-01-01,3;45,4;Pria,5;Diploma,6;Peternak,7;5648023,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;Kendaraan umum,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Lutfan Kusumo,2;1999-01-01,3;80,4;Pria,5;SD,6;Peternak,7;8347705,8;b. Tidak,9;b. Tradisional/Alternatif,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Clara Rahmawati,2;1999-01-01,3;92,4;Wanita,5;SMA,6;Petani,7;2877438,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Hamima Pudjiastuti,2;1999-01-01,3;25,4;Wanita,5;SMA,6;Arsitek,7;4050975,8;b. Tidak,9;b. Tradisional/Alternatif,10;c. 6-10 KM,11;a. Jalan kaki,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Koko Setiawan,2;1999-01-01,3;94,4;Pria,5;Magister,6;PNS,7;5263998,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;a. Jalan kaki,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Rachel Hartati,2;1999-01-01,3;24,4;Wanita,5;SD,6;Petani,7;3878938,8;b. Tidak,9;b. Tradisional/Alternatif,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Zahra Yuliarti,2;1999-01-01,3;72,4;Wanita,5;Magister,6;Petani,7;5153945,8;b. Tidak,9;b. Tradisional/Alternatif,10;d. Lebih dari 10 KM,11;Kendaraan umum,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Gatot Tampubolon,2;1999-01-01,3;98,4;Pria,5;SMP,6;Petani,7;6185575,8;b. Tidak,9;c. Diobati Sendiri,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Rini Hastuti,2;1999-01-01,3;22,4;Wanita,5;Sarjana,6;Nelayan,7;4034802,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;a. Jalan kaki,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Akarsana Firmansyah,2;1999-01-01,3;85,4;Pria,5;Diploma,6;Arsitek,7;4884645,8;b. Tidak,9;a. Tenaga Kesehatan,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Baktiadi Lazuardi,2;1999-01-01,3;100,4;Pria,5;Doktor,6;Guru,7;2800814,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;a. Jalan kaki,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Marwata Utama,2;1999-01-01,3;35,4;Pria,5;Magister,6;Swasta,7;3160060,8;b. Tidak,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Jamalia Uyainah,2;1999-01-01,3;65,4;Wanita,5;Diploma,6;Arsitek,7;4592165,8;b. Tidak,9;b. Tradisional/Alternatif,10;d. Lebih dari 10 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Usyi Purwanti,2;1999-01-01,3;20,4;Wanita,5;SMA,6;Arsitek,7;9086230,8;b. Tidak,9;a. Tenaga Kesehatan,10;c. 6-10 KM,11;Kendaraan umum,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Radit Maryadi,2;1999-01-01,3;31,4;Pria,5;Diploma,6;Wirausaha,7;9848069,8;b. Tidak,9;c. Diobati Sendiri,10;a. Kurang dari 1 KM,11;a. Jalan kaki,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Keisha Padmasari,2;1999-01-01,3;27,4;Wanita,5;Doktor,6;PNS,7;5345972,8;b. Tidak,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Ina Wijayanti,2;1999-01-01,3;80,4;Wanita,5;Sarjana,6;Perawat,7;7988577,8;b. Tidak,9;c. Diobati Sendiri,10;d. Lebih dari 10 KM,11;b. Kendaraan pribadi,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Cahyanto Hutasoit,2;1999-01-01,3;18,4;Pria,5;SD,6;Petani,7;8455631,8;b. Tidak,9;b. Tradisional/Alternatif,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Nasrullah Maulana,2;1999-01-01,3;18,4;Pria,5;SMA,6;PNS,7;7861371,8;b. Tidak,9;a. Tenaga Kesehatan,10;d. Lebih dari 10 KM,11;Kendaraan umum,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Eka Simanjuntak,2;1999-01-01,3;76,4;Pria,5;SMA,6;Swasta,7;3950495,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Victoria Nurdiyanti,2;1999-01-01,3;98,4;Wanita,5;SD,6;Penulis,7;1798917,8;a. Ya,9;c. Diobati Sendiri,10;a. Kurang dari 1 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Tugiman Mangunsong,2;1999-01-01,3;80,4;Pria,5;SMP,6;Penulis,7;6427625,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Galak Nainggolan,2;1999-01-01,3;69,4;Pria,5;Doktor,6;TNI,7;3398093,8;b. Tidak,9;c. Diobati Sendiri,10;d. Lebih dari 10 KM,11;b. Kendaraan pribadi,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Zalindra Winarsih,2;1999-01-01,3;92,4;Wanita,5;SMP,6;Arsitek,7;6975036,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Eli Mayasari,2;1999-01-01,3;90,4;Wanita,5;Doktor,6;Perawat,7;1997999,8;a. Ya,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Jail Hidayat,2;1999-01-01,3;27,4;Pria,5;Sarjana,6;Petani,7;4576583,8;b. Tidak,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Malika Usada,2;1999-01-01,3;100,4;Wanita,5;SMP,6;PNS,7;5428964,8;b. Tidak,9;b. Tradisional/Alternatif,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Malika Wijayanti,2;1999-01-01,3;34,4;Wanita,5;SD,6;Peternak,7;1595074,8;a. Ya,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;a. Jalan kaki,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Yahya Mustofa,2;1999-01-01,3;31,4;Pria,5;Doktor,6;Perawat,7;6347939,8;b. Tidak,9;c. Diobati Sendiri,10;d. Lebih dari 10 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Yance Agustina,2;1999-01-01,3;87,4;Wanita,5;SD,6;Swasta,7;2777539,8;b. Tidak,9;c. Diobati Sendiri,10;d. Lebih dari 10 KM,11;Kendaraan umum,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Jaeman Hakim,2;1999-01-01,3;77,4;Pria,5;Diploma,6;Petani,7;2505533,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Uda Gunawan,2;1999-01-01,3;29,4;Pria,5;Diploma,6;PNS,7;9921179,8;b. Tidak,9;c. Diobati Sendiri,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Viktor Thamrin,2;1999-01-01,3;61,4;Pria,5;Sarjana,6;Wirausaha,7;5102667,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;a. Jalan kaki,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Garang Gunawan,2;1999-01-01,3;51,4;Pria,5;SD,6;TNI,7;7173119,8;b. Tidak,9;c. Diobati Sendiri,10;d. Lebih dari 10 KM,11;a. Jalan kaki,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Hani Wahyuni,2;1999-01-01,3;58,4;Wanita,5;Sarjana,6;TNI,7;3901994,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;Kendaraan umum,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Gilda Andriani,2;1999-01-01,3;89,4;Wanita,5;Sarjana,6;Guru,7;3377615,8;b. Tidak,9;b. Tradisional/Alternatif,10;d. Lebih dari 10 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Cengkir Natsir,2;1999-01-01,3;39,4;Pria,5;Magister,6;Peternak,7;2224291,8;b. Tidak,9;a. Tenaga Kesehatan,10;d. Lebih dari 10 KM,11;Kendaraan umum,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Ophelia Farida,2;1999-01-01,3;80,4;Wanita,5;Sarjana,6;Arsitek,7;3679497,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;Kendaraan umum,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Hasta Marbun,2;1999-01-01,3;93,4;Pria,5;SD,6;Swasta,7;7057885,8;b. Tidak,9;c. Diobati Sendiri,10;c. 6-10 KM,11;a. Jalan kaki,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Jarwa Tampubolon,2;1999-01-01,3;59,4;Pria,5;Doktor,6;Nelayan,7;9112079,8;b. Tidak,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Asmuni Ramadan,2;1999-01-01,3;51,4;Pria,5;SD,6;Arsitek,7;7711099,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;Kendaraan umum,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Cornelia Safitri,2;1999-01-01,3;31,4;Wanita,5;Doktor,6;Nelayan,7;8212862,8;b. Tidak,9;a. Tenaga Kesehatan,10;d. Lebih dari 10 KM,11;a. Jalan kaki,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Septi Permata,2;1999-01-01,3;48,4;Wanita,5;Doktor,6;Peternak,7;9095251,8;b. Tidak,9;c. Diobati Sendiri,10;d. Lebih dari 10 KM,11;Kendaraan umum,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Ozy Prabowo,2;1999-01-01,3;28,4;Pria,5;Diploma,6;Peternak,7;1266609,8;a. Ya,9;b. Tradisional/Alternatif,10;d. Lebih dari 10 KM,11;Kendaraan umum,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Danu Gunarto,2;1999-01-01,3;39,4;Pria,5;SMP,6;Petani,7;9772159,8;b. Tidak,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Ifa Wulandari,2;1999-01-01,3;63,4;Wanita,5;SD,6;TNI,7;9985960,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;Kendaraan umum,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Wardi Nababan,2;1999-01-01,3;38,4;Pria,5;Sarjana,6;Perawat,7;8188237,8;b. Tidak,9;b. Tradisional/Alternatif,10;d. Lebih dari 10 KM,11;b. Kendaraan pribadi,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Siti Melani,2;1999-01-01,3;75,4;Wanita,5;SMP,6;Peternak,7;1692352,8;a. Ya,9;c. Diobati Sendiri,10;d. Lebih dari 10 KM,11;Kendaraan umum,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Taswir Hidayanto,2;1999-01-01,3;94,4;Pria,5;Magister,6;Wirausaha,7;7934258,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;Kendaraan umum,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Icha Palastri,2;1999-01-01,3;62,4;Wanita,5;Sarjana,6;Petani,7;2491784,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;a. Jalan kaki,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Yessi Yulianti,2;1999-01-01,3;18,4;Wanita,5;SMP,6;Guru,7;8904022,8;b. Tidak,9;b. Tradisional/Alternatif,10;c. 6-10 KM,11;a. Jalan kaki,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Kamidin Simbolon,2;1999-01-01,3;54,4;Pria,5;SMP,6;Penulis,7;6526559,8;b. Tidak,9;c. Diobati Sendiri,10;a. Kurang dari 1 KM,11;a. Jalan kaki,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Julia Nuraini,2;1999-01-01,3;28,4;Wanita,5;SD,6;TNI,7;8624791,8;b. Tidak,9;c. Diobati Sendiri,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Ozy Hidayanto,2;1999-01-01,3;62,4;Pria,5;Diploma,6;TNI,7;8993103,8;b. Tidak,9;c. Diobati Sendiri,10;c. 6-10 KM,11;a. Jalan kaki,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Galih Utama,2;1999-01-01,3;34,4;Pria,5;SMA,6;Swasta,7;7002724,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;Kendaraan umum,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Ismail Mahendra,2;1999-01-01,3;31,4;Pria,5;SD,6;Perawat,7;1233131,8;a. Ya,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;a. Jalan kaki,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Drajat Wibisono,2;1999-01-01,3;33,4;Pria,5;SMA,6;Peternak,7;6015600,8;b. Tidak,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Martani Maulana,2;1999-01-01,3;34,4;Pria,5;SMA,6;PNS,7;1363834,8;a. Ya,9;c. Diobati Sendiri,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Janet Nasyiah,2;1999-01-01,3;79,4;Wanita,5;Sarjana,6;Petani,7;5789321,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Genta Yulianti,2;1999-01-01,3;19,4;Wanita,5;SMP,6;Petani,7;7673710,8;b. Tidak,9;a. Tenaga Kesehatan,10;c. 6-10 KM,11;a. Jalan kaki,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Mulyanto Suryono,2;1999-01-01,3;82,4;Pria,5;Sarjana,6;PNS,7;2519421,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Dacin Sitompul,2;1999-01-01,3;87,4;Pria,5;Sarjana,6;Perawat,7;1595687,8;a. Ya,9;c. Diobati Sendiri,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Padma Yuliarti,2;1999-01-01,3;78,4;Wanita,5;Doktor,6;Guru,7;3043614,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;a. Jalan kaki,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Gara Prakasa,2;1999-01-01,3;42,4;Pria,5;Magister,6;TNI,7;8248119,8;b. Tidak,9;b. Tradisional/Alternatif,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Kiandra Mardhiyah,2;1999-01-01,3;81,4;Wanita,5;SMA,6;Penulis,7;7561700,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Elma Usamah,2;1999-01-01,3;17,4;Wanita,5;SD,6;Swasta,7;7428944,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;Kendaraan umum,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Febi Hassanah,2;1999-01-01,3;53,4;Wanita,5;SMP,6;Perawat,7;8886859,8;b. Tidak,9;c. Diobati Sendiri,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Indah Wijayanti,2;1999-01-01,3;31,4;Wanita,5;Sarjana,6;Petani,7;1163949,8;a. Ya,9;a. Tenaga Kesehatan,10;d. Lebih dari 10 KM,11;Kendaraan umum,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Ade Siregar,2;1999-01-01,3;24,4;Pria,5;Sarjana,6;Wirausaha,7;2465999,8;b. Tidak,9;a. Tenaga Kesehatan,10;c. 6-10 KM,11;Kendaraan umum,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Clara Purnawati,2;1999-01-01,3;66,4;Wanita,5;Magister,6;Arsitek,7;5299437,8;b. Tidak,9;b. Tradisional/Alternatif,10;c. 6-10 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Simon Maryadi,2;1999-01-01,3;48,4;Pria,5;Diploma,6;PNS,7;1793899,8;a. Ya,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Karsa Hidayanto,2;1999-01-01,3;92,4;Pria,5;Diploma,6;Nelayan,7;7283861,8;b. Tidak,9;c. Diobati Sendiri,10;d. Lebih dari 10 KM,11;a. Jalan kaki,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Ratih Hasanah,2;1999-01-01,3;51,4;Wanita,5;Magister,6;Perawat,7;1031741,8;a. Ya,9;c. Diobati Sendiri,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Jamalia Permata,2;1999-01-01,3;27,4;Wanita,5;Magister,6;Wirausaha,7;8616087,8;b. Tidak,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Bagya Rajasa,2;1999-01-01,3;79,4;Pria,5;SMP,6;Wirausaha,7;1009117,8;a. Ya,9;c. Diobati Sendiri,10;d. Lebih dari 10 KM,11;b. Kendaraan pribadi,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Dalimin Hidayat,2;1999-01-01,3;25,4;Pria,5;SMA,6;Perawat,7;9257393,8;b. Tidak,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Salwa Wahyuni,2;1999-01-01,3;76,4;Wanita,5;SMP,6;Peternak,7;9611978,8;b. Tidak,9;a. Tenaga Kesehatan,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Rika Purnawati,2;1999-01-01,3;27,4;Wanita,5;Doktor,6;Guru,7;4640939,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Cengkal Pranowo,2;1999-01-01,3;62,4;Pria,5;Diploma,6;Wirausaha,7;8051715,8;b. Tidak,9;a. Tenaga Kesehatan,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Umi Oktaviani,2;1999-01-01,3;32,4;Wanita,5;SMP,6;Guru,7;3645015,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Kani Agustina,2;1999-01-01,3;32,4;Wanita,5;SD,6;TNI,7;5367109,8;b. Tidak,9;c. Diobati Sendiri,10;a. Kurang dari 1 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Prakosa Putra,2;1999-01-01,3;82,4;Pria,5;Magister,6;Penulis,7;5630634,8;b. Tidak,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Tomi Pratama,2;1999-01-01,3;53,4;Pria,5;SMP,6;Petani,7;7167717,8;b. Tidak,9;a. Tenaga Kesehatan,10;a. Kurang dari 1 KM,11;b. Kendaraan pribadi,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Galang Waluyo,2;1999-01-01,3;22,4;Pria,5;Diploma,6;Penulis,7;2625736,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 5, 1
EXEC dbo.spInputAnswers '1;Usyi Handayani,2;1999-01-01,3;58,4;Wanita,5;SMA,6;Swasta,7;5302465,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;a. Jalan kaki,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Puspa Hartati,2;1999-01-01,3;70,4;Wanita,5;Diploma,6;Petani,7;6841768,8;b. Tidak,9;b. Tradisional/Alternatif,10;c. 6-10 KM,11;b. Kendaraan pribadi,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Prayoga Sitorus,2;1999-01-01,3;85,4;Pria,5;Doktor,6;Perawat,7;2688393,8;b. Tidak,9;b. Tradisional/Alternatif,10;b. 1-5 KM,11;Kendaraan umum,12;a. BPJ', 5, 1
EXEC dbo.spInputAnswers '1;Shania Winarsih,2;1999-01-01,3;93,4;Wanita,5;SD,6;PNS,7;8750208,8;b. Tidak,9;a. Tenaga Kesehatan,10;b. 1-5 KM,11;a. Jalan kaki,12;c. Asuransi swasta', 3, 1
EXEC dbo.spInputAnswers '1;Cindy Mayasari,2;1999-01-01,3;49,4;Wanita,5;Sarjana,6;PNS,7;9426561,8;b. Tidak,9;b. Tradisional/Alternatif,10;a. Kurang dari 1 KM,11;a. Jalan kaki,12;a. BPJ', 4, 1
EXEC dbo.spInputAnswers '1;Asmuni Marpaung,2;1999-01-01,3;85,4;Pria,5;Magister,6;PNS,7;4713912,8;b. Tidak,9;c. Diobati Sendiri,10;b. 1-5 KM,11;a. Jalan kaki,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Wadi Narpati,2;1999-01-01,3;95,4;Pria,5;Magister,6;Swasta,7;6400955,8;b. Tidak,9;a. Tenaga Kesehatan,10;d. Lebih dari 10 KM,11;Kendaraan umum,12;b. KIS', 3, 1
EXEC dbo.spInputAnswers '1;Rahman Nababan,2;1999-01-01,3;40,4;Pria,5;Diploma,6;PNS,7;1954371,8;a. Ya,9;b. Tradisional/Alternatif,10;d. Lebih dari 10 KM,11;Kendaraan umum,12;c. Asuransi swasta', 4, 1
EXEC dbo.spInputAnswers '1;Harsanto Wahyudin,2;1999-01-01,3;84,4;Pria,5;Magister,6;Nelayan,7;4644471,8;b. Tidak,9;c. Diobati Sendiri,10;c. 6-10 KM,11;Kendaraan umum,12;b. KIS', 5, 1
EXEC dbo.spInputAnswers '1;Salimah Namaga,2;1999-01-01,3;63,4;Wanita,5;SMA,6;Wirausaha,7;6363953,8;b. Tidak,9;a. Tenaga Kesehatan,10;d. Lebih dari 10 KM,11;a. Jalan kaki,12;a. BPJ', 3, 1
EXEC dbo.spInputAnswers '1;Dalima Kusmawati,2;1999-01-01,3;93,4;Wanita,5;Magister,6;Arsitek,7;6139773,8;b. Tidak,9;b. Tradisional/Alternatif,10;c. 6-10 KM,11;Kendaraan umum,12;b. KIS', 4, 1
EXEC dbo.spInputAnswers '1;Kiandra Sudiati,2;1999-01-01,3;87,4;Wanita,5;Doktor,6;PNS,7;8986380,8;b. Tidak,9;b. Tradisional/Alternatif,10;d. Lebih dari 10 KM,11;Kendaraan umum,12;c. Asuransi swasta', 5, 1

--SELECT * FROM AnswerGroup
--SELECT * FROM AnswerItemDate
--SELECT * FROM AnswerItemNumeric
--SELECT * FROM AnswerItemText

EXEC dbo.spCreateForm 'Survei Kesehatan Lansia'
EXEC dbo.spCreateQuestions 2, 'T;Nama Lengkap,D;Tanggal Lahir,T;Umur,T;Jenis Kelamin,T;Pendidikan,T;Pekerjaan,N;Jumlah Penghasilan per Bulan,T;Penerima BLT?'
EXEC dbo.spCreateQuestions 2, 'T;Apakah di rumah Anda ada lansia?,T;Apakah ada Posyandu Lansia di tempat Anda?,T;Apakah Anda memanfaatkan Posyandu Lansia?,T;Penyakit apa yang dimiliki oleh lansia di rumah Anda?'

--SELECT * FROM Questions

EXEC dbo.spInputAnswers '13;Cagak Thamrin,14;1999-01-01,15;77,16;Pria,17;Sarjana,18;Wirausaha,19;6650194,20;b. Tidak,21;a. Ya,22;a. Ya,23;b. Tidak,24;a. Rematik', 3, 2
EXEC dbo.spInputAnswers '13;Lasmanto Salahudin,14;1999-01-01,15;93,16;Pria,17;SMP,18;TNI,19;9349712,20;b. Tidak,21;b. Tidak,22;b. Tidak,23;b. Tidak,24;b. Hipertensi (Darah Tinggi)', 4, 2
EXEC dbo.spInputAnswers '13;Farah Zulaika,14;1999-01-01,15;61,16;Wanita,17;SMA,18;Guru,19;9977567,20;b. Tidak,21;b. Tidak,22;a. Ya,23;b. Tidak,24;b. Hipertensi (Darah Tinggi)', 5, 2
EXEC dbo.spInputAnswers '13;Ajeng Prastuti,14;1999-01-01,15;52,16;Wanita,17;Sarjana,18;Arsitek,19;4266686,20;b. Tidak,21;a. Ya,22;a. Ya,23;b. Tidak,24;c. TBC', 3, 2
EXEC dbo.spInputAnswers '13;Violet Prastuti,14;1999-01-01,15;99,16;Wanita,17;Sarjana,18;Wirausaha,19;4632260,20;b. Tidak,21;a. Ya,22;a. Ya,23;a. Ya,24;b. Hipertensi (Darah Tinggi)', 4, 2
EXEC dbo.spInputAnswers '13;Zulaikha Hartati,14;1999-01-01,15;97,16;Wanita,17;SD,18;Peternak,19;4613655,20;b. Tidak,21;a. Ya,22;b. Tidak,23;b. Tidak,24;a. Rematik', 5, 2
EXEC dbo.spInputAnswers '13;Puput Uyainah,14;1999-01-01,15;80,16;Wanita,17;SMA,18;Peternak,19;2631958,20;b. Tidak,21;a. Ya,22;b. Tidak,23;b. Tidak,24;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswers '13;Gamblang Sihotang,14;1999-01-01,15;35,16;Pria,17;Magister,18;Peternak,19;8555758,20;b. Tidak,21;b. Tidak,22;b. Tidak,23;b. Tidak,24;b. Hipertensi (Darah Tinggi)', 4, 2
EXEC dbo.spInputAnswers '13;Cinta Melani,14;1999-01-01,15;71,16;Wanita,17;SD,18;Peternak,19;4701077,20;b. Tidak,21;a. Ya,22;b. Tidak,23;b. Tidak,24;Diabetes Mellitus (Kencing Manis)', 5, 2
EXEC dbo.spInputAnswers '13;Ami Hartati,14;1999-01-01,15;73,16;Wanita,17;SMP,18;Arsitek,19;6530577,20;b. Tidak,21;b. Tidak,22;b. Tidak,23;b. Tidak,24;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswers '13;Wirda Pudjiastuti,14;1999-01-01,15;81,16;Wanita,17;Diploma,18;Guru,19;7888127,20;b. Tidak,21;a. Ya,22;a. Ya,23;b. Tidak,24;Diabetes Mellitus (Kencing Manis)', 4, 2
EXEC dbo.spInputAnswers '13;Indra Maulana,14;1999-01-01,15;96,16;Pria,17;Magister,18;Perawat,19;1442812,20;a. Ya,21;a. Ya,22;a. Ya,23;a. Ya,24;b. Hipertensi (Darah Tinggi)', 5, 2
EXEC dbo.spInputAnswers '13;Manah Mustofa,14;1999-01-01,15;81,16;Pria,17;Magister,18;Penulis,19;1373116,20;a. Ya,21;b. Tidak,22;a. Ya,23;b. Tidak,24;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswers '13;Nabila Susanti,14;1999-01-01,15;37,16;Wanita,17;SMA,18;Petani,19;5945366,20;b. Tidak,21;a. Ya,22;a. Ya,23;a. Ya,24;Diabetes Mellitus (Kencing Manis)', 4, 2
EXEC dbo.spInputAnswers '13;Shania Astuti,14;1999-01-01,15;39,16;Wanita,17;Diploma,18;Swasta,19;9788128,20;b. Tidak,21;b. Tidak,22;b. Tidak,23;b. Tidak,24;b. Hipertensi (Darah Tinggi)', 5, 2
EXEC dbo.spInputAnswers '13;Dina Maryati,14;1999-01-01,15;36,16;Wanita,17;SMA,18;Petani,19;4641545,20;b. Tidak,21;a. Ya,22;b. Tidak,23;b. Tidak,24;c. TBC', 3, 2
EXEC dbo.spInputAnswers '13;Victoria Maryati,14;1999-01-01,15;50,16;Wanita,17;SMP,18;Nelayan,19;6075990,20;b. Tidak,21;b. Tidak,22;b. Tidak,23;b. Tidak,24;b. Hipertensi (Darah Tinggi)', 4, 2
EXEC dbo.spInputAnswers '13;Pranawa Halim,14;1999-01-01,15;72,16;Pria,17;SD,18;Penulis,19;1954408,20;a. Ya,21;b. Tidak,22;a. Ya,23;b. Tidak,24;b. Hipertensi (Darah Tinggi)', 5, 2
EXEC dbo.spInputAnswers '13;Karen Widiastuti,14;1999-01-01,15;25,16;Wanita,17;Magister,18;Penulis,19;1970574,20;a. Ya,21;b. Tidak,22;a. Ya,23;a. Ya,24;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswers '13;Harjo Pranowo,14;1999-01-01,15;21,16;Pria,17;SD,18;TNI,19;6329933,20;b. Tidak,21;a. Ya,22;b. Tidak,23;b. Tidak,24;Diabetes Mellitus (Kencing Manis)', 4, 2
EXEC dbo.spInputAnswers '13;Jumari Saefullah,14;1999-01-01,15;39,16;Pria,17;SMA,18;Penulis,19;3402362,20;b. Tidak,21;b. Tidak,22;a. Ya,23;a. Ya,24;b. Hipertensi (Darah Tinggi)', 5, 2
EXEC dbo.spInputAnswers '13;Balamantri Tarihoran,14;1999-01-01,15;65,16;Pria,17;SMP,18;Guru,19;8180558,20;b. Tidak,21;b. Tidak,22;b. Tidak,23;b. Tidak,24;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswers '13;Bakidin Suryono,14;1999-01-01,15;86,16;Pria,17;Magister,18;Guru,19;2490538,20;b. Tidak,21;b. Tidak,22;b. Tidak,23;b. Tidak,24;b. Hipertensi (Darah Tinggi)', 4, 2
EXEC dbo.spInputAnswers '13;Zulaikha Nuraini,14;1999-01-01,15;19,16;Wanita,17;SMP,18;Arsitek,19;6841290,20;b. Tidak,21;b. Tidak,22;a. Ya,23;b. Tidak,24;b. Hipertensi (Darah Tinggi)', 5, 2
EXEC dbo.spInputAnswers '13;Endah Fujiati,14;1999-01-01,15;60,16;Wanita,17;Sarjana,18;Swasta,19;1533820,20;a. Ya,21;a. Ya,22;a. Ya,23;a. Ya,24;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswers '13;Zulaikha Winarsih,14;1999-01-01,15;100,16;Wanita,17;Sarjana,18;Penulis,19;8370143,20;b. Tidak,21;a. Ya,22;a. Ya,23;a. Ya,24;Diabetes Mellitus (Kencing Manis)', 4, 2
EXEC dbo.spInputAnswers '13;Vero Maulana,14;1999-01-01,15;72,16;Pria,17;Diploma,18;Nelayan,19;1503032,20;a. Ya,21;a. Ya,22;a. Ya,23;b. Tidak,24;Diabetes Mellitus (Kencing Manis)', 5, 2
EXEC dbo.spInputAnswers '13;Tari Kuswandari,14;1999-01-01,15;32,16;Wanita,17;SMP,18;Petani,19;4314542,20;b. Tidak,21;b. Tidak,22;a. Ya,23;a. Ya,24;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswers '13;Yunita Laksmiwati,14;1999-01-01,15;86,16;Wanita,17;Doktor,18;PNS,19;2176507,20;b. Tidak,21;a. Ya,22;b. Tidak,23;b. Tidak,24;a. Rematik', 4, 2
EXEC dbo.spInputAnswers '13;Latika Hassanah,14;1999-01-01,15;87,16;Wanita,17;Magister,18;Swasta,19;4907580,20;b. Tidak,21;a. Ya,22;b. Tidak,23;b. Tidak,24;a. Rematik', 5, 2

--SELECT * FROM AnswerGroup
--SELECT * FROM AnswerItemDate
--SELECT * FROM AnswerItemNumeric
--SELECT * FROM AnswerItemText

--SELECT * FROM Form