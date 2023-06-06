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

--EXEC DELETE DULU
-- DELETE FROM AnswerItemDate
-- DELETE FROM AnswerItemNumeric
-- DELETE FROM AnswerItemText
-- DELETE FROM AnswerGroup
-- DELETE FROM Questions
-- DELETE FROM Form

EXEC dbo.spCreateForm 'Survei Kesehatan Lansia'
EXEC dbo.spCreateQuestion 2, 'T;Nama Lengkap,D;Tanggal Lahir,T;Umur,T;Jenis Kelamin,T;Pendidikan,T;Pekerjaan,N;Jumlah Penghasilan per Bulan,T;Penerima BLT?'
EXEC dbo.spCreateQuestion 2, 'T;Apakah di rumah Anda ada lansia?,T;Apakah ada Posyandu Lansia di tempat Anda?,T;Apakah Anda memanfaatkan Posyandu Lansia?,T;Penyakit apa yang dimiliki oleh lansia di rumah Anda?'


--SELECT * FROM Questions

EXEC dbo.spInputAnswer '1;Cagak Thamrin,2;1999-01-01,3;77,4;Pria,5;Sarjana,6;Wirausaha,7;6650194,8;b. Tidak,9;a. Ya,10;a. Ya,11;b. Tidak,12;a. Rematik', 3, 2
EXEC dbo.spInputAnswer '1;Lasmanto Salahudin,2;1999-01-01,3;93,4;Pria,5;SMP,6;TNI,7;9349712,8;b. Tidak,9;b. Tidak,10;b. Tidak,11;b. Tidak,12;b. Hipertensi (Darah Tinggi)', 4, 2
EXEC dbo.spInputAnswer '1;Farah Zulaika,2;1999-01-01,3;61,4;Wanita,5;SMA,6;Guru,7;9977567,8;b. Tidak,9;b. Tidak,10;a. Ya,11;b. Tidak,12;b. Hipertensi (Darah Tinggi)', 5, 2
EXEC dbo.spInputAnswer '1;Ajeng Prastuti,2;1999-01-01,3;52,4;Wanita,5;Sarjana,6;Arsitek,7;4266686,8;b. Tidak,9;a. Ya,10;a. Ya,11;b. Tidak,12;c. TBC', 3, 2
EXEC dbo.spInputAnswer '1;Violet Prastuti,2;1999-01-01,3;99,4;Wanita,5;Sarjana,6;Wirausaha,7;4632260,8;b. Tidak,9;a. Ya,10;a. Ya,11;a. Ya,12;b. Hipertensi (Darah Tinggi)', 4, 2
EXEC dbo.spInputAnswer '1;Zulaikha Hartati,2;1999-01-01,3;97,4;Wanita,5;SD,6;Peternak,7;4613655,8;b. Tidak,9;a. Ya,10;b. Tidak,11;b. Tidak,12;a. Rematik', 5, 2
EXEC dbo.spInputAnswer '1;Puput Uyainah,2;1999-01-01,3;80,4;Wanita,5;SMA,6;Peternak,7;2631958,8;b. Tidak,9;a. Ya,10;b. Tidak,11;b. Tidak,12;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswer '1;Gamblang Sihotang,2;1999-01-01,3;35,4;Pria,5;Magister,6;Peternak,7;8555758,8;b. Tidak,9;b. Tidak,10;b. Tidak,11;b. Tidak,12;b. Hipertensi (Darah Tinggi)', 4, 2
EXEC dbo.spInputAnswer '1;Cinta Melani,2;1999-01-01,3;71,4;Wanita,5;SD,6;Peternak,7;4701077,8;b. Tidak,9;a. Ya,10;b. Tidak,11;b. Tidak,12;Diabetes Mellitus (Kencing Manis)', 5, 2
EXEC dbo.spInputAnswer '1;Ami Hartati,2;1999-01-01,3;73,4;Wanita,5;SMP,6;Arsitek,7;6530577,8;b. Tidak,9;b. Tidak,10;b. Tidak,11;b. Tidak,12;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswer '1;Wirda Pudjiastuti,2;1999-01-01,3;81,4;Wanita,5;Diploma,6;Guru,7;7888127,8;b. Tidak,9;a. Ya,10;a. Ya,11;b. Tidak,12;Diabetes Mellitus (Kencing Manis)', 4, 2
EXEC dbo.spInputAnswer '1;Indra Maulana,2;1999-01-01,3;96,4;Pria,5;Magister,6;Perawat,7;1442812,8;a. Ya,9;a. Ya,10;a. Ya,11;a. Ya,12;b. Hipertensi (Darah Tinggi)', 5, 2
EXEC dbo.spInputAnswer '1;Manah Mustofa,2;1999-01-01,3;81,4;Pria,5;Magister,6;Penulis,7;1373116,8;a. Ya,9;b. Tidak,10;a. Ya,11;b. Tidak,12;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswer '1;Nabila Susanti,2;1999-01-01,3;37,4;Wanita,5;SMA,6;Petani,7;5945366,8;b. Tidak,9;a. Ya,10;a. Ya,11;a. Ya,12;Diabetes Mellitus (Kencing Manis)', 4, 2
EXEC dbo.spInputAnswer '1;Shania Astuti,2;1999-01-01,3;39,4;Wanita,5;Diploma,6;Swasta,7;9788128,8;b. Tidak,9;b. Tidak,10;b. Tidak,11;b. Tidak,12;b. Hipertensi (Darah Tinggi)', 5, 2
EXEC dbo.spInputAnswer '1;Dina Maryati,2;1999-01-01,3;36,4;Wanita,5;SMA,6;Petani,7;4641545,8;b. Tidak,9;a. Ya,10;b. Tidak,11;b. Tidak,12;c. TBC', 3, 2
EXEC dbo.spInputAnswer '1;Victoria Maryati,2;1999-01-01,3;50,4;Wanita,5;SMP,6;Nelayan,7;6075990,8;b. Tidak,9;b. Tidak,10;b. Tidak,11;b. Tidak,12;b. Hipertensi (Darah Tinggi)', 4, 2
EXEC dbo.spInputAnswer '1;Pranawa Halim,2;1999-01-01,3;72,4;Pria,5;SD,6;Penulis,7;1954408,8;a. Ya,9;b. Tidak,10;a. Ya,11;b. Tidak,12;b. Hipertensi (Darah Tinggi)', 5, 2
EXEC dbo.spInputAnswer '1;Karen Widiastuti,2;1999-01-01,3;25,4;Wanita,5;Magister,6;Penulis,7;1970574,8;a. Ya,9;b. Tidak,10;a. Ya,11;a. Ya,12;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswer '1;Harjo Pranowo,2;1999-01-01,3;21,4;Pria,5;SD,6;TNI,7;6329933,8;b. Tidak,9;a. Ya,10;b. Tidak,11;b. Tidak,12;Diabetes Mellitus (Kencing Manis)', 4, 2
EXEC dbo.spInputAnswer '1;Jumari Saefullah,2;1999-01-01,3;39,4;Pria,5;SMA,6;Penulis,7;3402362,8;b. Tidak,9;b. Tidak,10;a. Ya,11;a. Ya,12;b. Hipertensi (Darah Tinggi)', 5, 2
EXEC dbo.spInputAnswer '1;Balamantri Tarihoran,2;1999-01-01,3;65,4;Pria,5;SMP,6;Guru,7;8180558,8;b. Tidak,9;b. Tidak,10;b. Tidak,11;b. Tidak,12;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswer '1;Bakidin Suryono,2;1999-01-01,3;86,4;Pria,5;Magister,6;Guru,7;2490538,8;b. Tidak,9;b. Tidak,10;b. Tidak,11;b. Tidak,12;b. Hipertensi (Darah Tinggi)', 4, 2
EXEC dbo.spInputAnswer '1;Zulaikha Nuraini,2;1999-01-01,3;19,4;Wanita,5;SMP,6;Arsitek,7;6841290,8;b. Tidak,9;b. Tidak,10;a. Ya,11;b. Tidak,12;b. Hipertensi (Darah Tinggi)', 5, 2
EXEC dbo.spInputAnswer '1;Endah Fujiati,2;1999-01-01,3;60,4;Wanita,5;Sarjana,6;Swasta,7;1533820,8;a. Ya,9;a. Ya,10;a. Ya,11;a. Ya,12;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswer '1;Zulaikha Winarsih,2;1999-01-01,3;100,4;Wanita,5;Sarjana,6;Penulis,7;8370143,8;b. Tidak,9;a. Ya,10;a. Ya,11;a. Ya,12;Diabetes Mellitus (Kencing Manis)', 4, 2
EXEC dbo.spInputAnswer '1;Vero Maulana,2;1999-01-01,3;72,4;Pria,5;Diploma,6;Nelayan,7;1503032,8;a. Ya,9;a. Ya,10;a. Ya,11;b. Tidak,12;Diabetes Mellitus (Kencing Manis)', 5, 2
EXEC dbo.spInputAnswer '1;Tari Kuswandari,2;1999-01-01,3;32,4;Wanita,5;SMP,6;Petani,7;4314542,8;b. Tidak,9;b. Tidak,10;a. Ya,11;a. Ya,12;b. Hipertensi (Darah Tinggi)', 3, 2
EXEC dbo.spInputAnswer '1;Yunita Laksmiwati,2;1999-01-01,3;86,4;Wanita,5;Doktor,6;PNS,7;2176507,8;b. Tidak,9;a. Ya,10;b. Tidak,11;b. Tidak,12;a. Rematik', 4, 2
EXEC dbo.spInputAnswer '1;Latika Hassanah,2;1999-01-01,3;87,4;Wanita,5;Magister,6;Swasta,7;4907580,8;b. Tidak,9;a. Ya,10;b. Tidak,11;b. Tidak,12;a. Rematik', 5, 2

SELECT * FROM AnswerGroup
SELECT * FROM AnswerItemDate
SELECT * FROM AnswerItemNumeric
SELECT * FROM AnswerItemText

--EXEC dbo.spCreateForm 'Survei Rumah dan Lingkungan'