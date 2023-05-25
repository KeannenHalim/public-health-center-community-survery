------------------------------------------------------------------------------------------------

--DROP TABLE Role;

CREATE TABLE Role(
	idRole int IDENTITY(1,1) PRIMARY KEY,
	roleName varchar(32),
);

-------------------------------------------------------------------------------------------------

--DROP TABLE User;

CREATE TABLE User(
	idUser int IDENTITY(1,1) PRIMARY KEY,
	userName varchar(128),
	password varchar(128),
	fkRole int
);

-------------------------------------------------------------------------------------------------

--tipe data bit di sql server = 0 (false), 1 (true) dan null

--DROP TABLE AnswerItemText

CREATE TABLE AnswerItemText(
	id int IDENTITY(1,1) PRIMARY KEY,
	answer varchar(256),
	timestamp datetime,
	isLatest bit,
	fkUser int,
	fkAnswerGroup int
);

-------------------------------------------------------------------------------------------------

--DROP TABLE AnswerItemNumeric

CREATE TABLE AnswerItemNumeric(
	id int IDENTITY(1,1) PRIMARY KEY,
	answer varchar(256),
	timestamp datetime,
	isLatest bit,
	fkUser int,
	fkAnswerGroup int
);

-------------------------------------------------------------------------------------------------

--DROP TABLE AnswerItemDate

CREATE TABLE AnswerItemDate(
	id int IDENTITY(1,1) PRIMARY KEY,
	answer varchar(256),
	timestamp datetime,
	isLatest bit,
	fkUser int,
	fkAnswerGroup int
);

-------------------------------------------------------------------------------------------------

--DROP TABLE Questions

CREATE TABLE Questions(
	idQuestion int IDENTITY(1,1) PRIMARY KEY,
	dataType char(1),
	question varchar(256),
	timeStamp datetime,
	isAlive bit --untuk mengetahui apakah pertanyaan sudah dihapus atau belum
);

-------------------------------------------------------------------------------------------------

--DROP TABLE Form

CREATE TABLE Form(
	idForm int IDENTITY(1,1) PRIMARY KEY,
	title varchar(128),
	timeStamp datetime,
	isAlive bit
);

-------------------------------------------------------------------------------------------------

--DROP TABLE AnswerGroup

CREATE TABLE AnswerGroup(
	idAnswer int IDENTITY(1,1) PRIMARY KEY,
	timeStamp datetime,
	fkForm int
);

-------------------------------------------------------------------------------------------------

--DROP TABLE LogChangeQuestions

CREATE TABLE LogChangeQuestions(
	prevValue varchar(256),
	timeStamp datetime,
	fkUser int,
	fkQuestions int
);

-------------------------------------------------------------------------------------------------

--DROP TABLE LogChangeForm

CREATE TABLE LogChangeForm(
	prevValue varchar(128),
	timeStamp datetime,
	fkUser int,
	fkForm int
);

-------------------------------------------------------------------------------------------------