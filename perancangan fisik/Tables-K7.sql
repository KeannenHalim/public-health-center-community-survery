------------------------------------------------------------------------------------------------
--Users
ALTER TABLE Users
DROP CONSTRAINT FK_Users_Role

--Questions
ALTER TABLE Questions
DROP CONSTRAINT FK_Questions_Form

--AnswerGroup
ALTER TABLE AnswerGroup
DROP CONSTRAINT FK_AnswerGroup_Form

--AnswerItemText
ALTER TABLE AnswerItemText
DROP CONSTRAINT FK_AnswerItemText_User

ALTER TABLE AnswerItemText
DROP CONSTRAINT FK_AnswerItemText_AnswerGroup

ALTER TABLE AnswerItemText
DROP CONSTRAINT FK_AnswerItemText_Question

--AnswerItemNumeric
ALTER TABLE AnswerItemNumeric
DROP CONSTRAINT FK_AnswerItemNumeric_User

ALTER TABLE AnswerItemNumeric
DROP CONSTRAINT FK_AnswerItemNumeric_AnswerGroup

ALTER TABLE AnswerItemNumeric
DROP CONSTRAINT FK_AnswerItemNumeric_Question

--AnswerItemDate
ALTER TABLE AnswerItemDate
DROP CONSTRAINT FK_AnswerItemDate_User

ALTER TABLE AnswerItemDate
DROP CONSTRAINT FK_AnswerItemDate_AnswerGroup

ALTER TABLE AnswerItemDate
DROP CONSTRAINT FK_AnswerItemDate_Question

--LogChangeQuestions
ALTER TABLE LogChangeQuestions
DROP CONSTRAINT FK_LogChangeQuestions_User

ALTER TABLE LogChangeQuestions
DROP CONSTRAINT FK_LogChangeQuestions__Question

--LogChangeForm
ALTER TABLE LogChangeForm
DROP CONSTRAINT FK_LogChangeForm_User

ALTER TABLE LogChangeForm
DROP CONSTRAINT FK_LogChangeForm_Form

DROP TABLE Role
DROP TABLE Users
DROP TABLE AnswerItemText
DROP TABLE AnswerItemNumeric
DROP TABLE AnswerItemDate
DROP TABLE Questions
DROP TABLE Form
DROP TABLE AnswerGroup
DROP TABLE LogChangeQuestions
DROP TABLE LogChangeForm


--untuk pertama kali, eksekusi mulai baris ini sampai ke bawah
CREATE TABLE Role(
	idRole int IDENTITY(1,1) PRIMARY KEY,
	roleName varchar(20),
);

-------------------------------------------------------------------------------------------------

CREATE TABLE Users(
	idUser int IDENTITY(1,1) PRIMARY KEY,
	username varchar(30),
	password varchar(128), --soalnya di encode pake sha 256
	fkRole int
);

-------------------------------------------------------------------------------------------------

--tipe data bit di sql server = 0 (false), 1 (true) dan null

CREATE TABLE AnswerItemText(
	id int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
	answer varchar(150),
	timestamp datetime,
	isLatest bit,
	fkUser int,
	fkAnswerGroup int,
	fkQuestion int
);

CREATE CLUSTERED INDEX idx_answerItemText
	ON dbo.AnswerItemText(fkQuestion)

-------------------------------------------------------------------------------------------------

CREATE TABLE AnswerItemNumeric(
	id int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
	answer INT,
	timestamp datetime,
	isLatest bit,
	fkUser int,
	fkAnswerGroup int,
	fkQuestion int
);

CREATE CLUSTERED INDEX idx_answerItemNumeric
	ON dbo.AnswerItemNumeric(fkQuestion)

-------------------------------------------------------------------------------------------------

CREATE TABLE AnswerItemDate(
	id int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
	answer date,
	timestamp datetime,
	isLatest bit,
	fkUser int,
	fkAnswerGroup int,
	fkQuestion int
);

CREATE CLUSTERED INDEX idx_answerItemDate
	ON dbo.AnswerItemDate(fkQuestion)

-------------------------------------------------------------------------------------------------

CREATE TABLE Questions(
	idQuestion int IDENTITY(1,1) PRIMARY KEY,
	dataType char(1), --N untuk numeric, T untuk text, D untuk date
	question varchar(250),
	[timestamp] datetime,
	isAlive bit, --untuk mengetahui apakah pertanyaan sudah dihapus atau belum
	fkForm INT
);

-------------------------------------------------------------------------------------------------

CREATE TABLE Form(
	idForm int IDENTITY(1,1) PRIMARY KEY,
	title varchar(128),
	timeStamp datetime,
	isAlive bit
);

-------------------------------------------------------------------------------------------------

CREATE TABLE AnswerGroup(
	idAnswer int IDENTITY(1,1) PRIMARY KEY NONCLUSTERED,
	timeStamp datetime,
	fkForm int
);

CREATE CLUSTERED INDEX idx_answerGroup
	ON dbo.AnswerGroup(timeStamp)

-------------------------------------------------------------------------------------------------

CREATE TABLE LogChangeQuestions(
	prevValue varchar(250),
	timeStamp datetime,
	fkUser int,
	fkQuestions int
);

CREATE CLUSTERED INDEX idx_logChangeQuestions
	ON dbo.LogChangeQuestions(timeStamp)

-------------------------------------------------------------------------------------------------

CREATE TABLE LogChangeForm(
	prevValue varchar(128),
	timeStamp datetime,
	fkUser int,
	fkForm int
);

CREATE CLUSTERED INDEX idx_logChangeForm
	ON dbo.LogChangeForm(timeStamp)

-------------------------------------------------------------------------------------------------

--Users
ALTER TABLE Users
ADD CONSTRAINT FK_Users_Role
FOREIGN KEY (fkRole) REFERENCES [Role](idRole)

--Questions
ALTER TABLE Questions
ADD CONSTRAINT FK_Questions_Form
FOREIGN KEY (fkForm) REFERENCES Form(idForm)

--AnswerGroup
ALTER TABLE AnswerGroup
ADD CONSTRAINT FK_AnswerGroup_Form
FOREIGN KEY (fkForm) REFERENCES Form(idForm)

--AnswerItemText
ALTER TABLE AnswerItemText
ADD CONSTRAINT FK_AnswerItemText_User
FOREIGN KEY (fkUser) REFERENCES Users(idUser)

ALTER TABLE AnswerItemText
ADD CONSTRAINT FK_AnswerItemText_AnswerGroup
FOREIGN KEY (fkAnswerGroup) REFERENCES AnswerGroup(idAnswer)

ALTER TABLE AnswerItemText
ADD CONSTRAINT FK_AnswerItemText_Question
FOREIGN KEY (fkQuestion) REFERENCES Questions(idQuestion)

--AnswerItemNumeric
ALTER TABLE AnswerItemNumeric
ADD CONSTRAINT FK_AnswerItemNumeric_User
FOREIGN KEY (fkUser) REFERENCES Users(idUser)

ALTER TABLE AnswerItemNumeric
ADD CONSTRAINT FK_AnswerItemNumeric_AnswerGroup
FOREIGN KEY (fkAnswerGroup) REFERENCES AnswerGroup(idAnswer)

ALTER TABLE AnswerItemNumeric
ADD CONSTRAINT FK_AnswerItemNumeric_Question
FOREIGN KEY (fkQuestion) REFERENCES Questions(idQuestion)

--AnswerItemDate
ALTER TABLE AnswerItemDate
ADD CONSTRAINT FK_AnswerItemDate_User
FOREIGN KEY (fkUser) REFERENCES Users(idUser)

ALTER TABLE AnswerItemDate
ADD CONSTRAINT FK_AnswerItemDate_AnswerGroup
FOREIGN KEY (fkAnswerGroup) REFERENCES AnswerGroup(idAnswer)

ALTER TABLE AnswerItemDate
ADD CONSTRAINT FK_AnswerItemDate_Question
FOREIGN KEY (fkQuestion) REFERENCES Questions(idQuestion)

--LogChangeQuestions
ALTER TABLE LogChangeQuestions
ADD CONSTRAINT FK_LogChangeQuestions_User
FOREIGN KEY (fkUser) REFERENCES Users(idUser)

ALTER TABLE LogChangeQuestions
ADD CONSTRAINT FK_LogChangeQuestions__Question
FOREIGN KEY (fkQuestions) REFERENCES Questions(idQuestion)

--LogChangeForm
ALTER TABLE LogChangeForm
ADD CONSTRAINT FK_LogChangeForm_User
FOREIGN KEY (fkUser) REFERENCES Users(idUser)

ALTER TABLE LogChangeForm
ADD CONSTRAINT FK_LogChangeForm_Form
FOREIGN KEY (fkForm) REFERENCES Form(idForm)