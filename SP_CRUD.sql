/*FUNCTIONS*/
CREATE FUNCTION parseKeyValue (
    @answers varchar(256)
)
    RETURNS @keyValuePair TABLE(
        id int,
        [key] int,
        [value] varchar(256)
    )
AS
BEGIN
    /*cursor untuk split pertama ketika
    split oleh ','*/
    DECLARE curValue CURSOR
    FOR
    SELECT 
        value
    FROM 
        string_split(@answers,',')

    declare
        /*temp variable untuk split oleh ','*/
        @curBaris varchar(256),
        /*temp variable untuk split oleh ';'*/
        @curKeyVal varchar(256),
        @i int,
        @j int

    SET @i = 0
    OPEN curValue
        FETCH NEXT FROM curValue INTO 
            @curBaris
        
        WHILE @@FETCH_STATUS=0
        BEGIN 
            /*cursor untuk membagi antara key 
            dengan value*/
            DECLARE curBarisKeyValue CURSOR
            FOR
            SELECT
                value
            FROM 
                string_split(@curBaris,';')

            OPEN curBarisKeyValue

            FETCH NEXT FROM curBarisKeyValue INTO 
                @curKeyVal
            
            SET @j = 0
            WHILE @@FETCH_STATUS=0
            BEGIN
                /*kalau j 0 berarti key*/ 
                IF @j = 0
                BEGIN
                    INSERT INTO @keyValuePair ([id],[key])
                    SELECT
                        @i as 'id',
                        @curKeyVal as 'key'
                END
                /*kalau j 1 berarti value*/ 
                ELSE IF @j = 1
                BEGIN
                    UPDATE @keyValuePair
                    SET 
                        [value] = @curKeyVal
                    WHERE 
                        id = @i
                END
                SET @j = @j+1
                FETCH NEXT FROM curBarisKeyValue INTO 
                @curKeyVal
            END

            CLOSE curBarisKeyValue
            DEALLOCATE curBarisKeyValue

            SET @i = @i+1
            FETCH NEXT FROM curValue INTO 
            @curBaris
        END
    CLOSE curValue
    DEALLOCATE curValue

    RETURN
END

-------------------------------------------
CREATE FUNCTION parseKeyCharValueVarchar (
    @answers varchar(256)
)
    RETURNS @keyValuePair TABLE(
        id int,
        [key] CHAR(1),
        [value] varchar(256)
    )
AS
BEGIN
    /*cursor untuk split pertama ketika
    split oleh ','*/
    DECLARE curValue CURSOR
    FOR
    SELECT 
        value
    FROM 
        string_split(@answers,',')

    declare
        /*temp variable untuk split oleh ','*/
        @curBaris varchar(256),
        /*temp variable untuk split oleh ';'*/
        @curKeyVal varchar(256),
        @i int,
        @j int

    SET @i = 0
    OPEN curValue
        FETCH NEXT FROM curValue INTO 
            @curBaris
        
        WHILE @@FETCH_STATUS=0
        BEGIN 
            /*cursor untuk membagi antara key 
            dengan value*/
            DECLARE curBarisKeyValue CURSOR
            FOR
            SELECT
                value
            FROM 
                string_split(@curBaris,';')

            OPEN curBarisKeyValue

            FETCH NEXT FROM curBarisKeyValue INTO 
                @curKeyVal
            
            SET @j = 0
            WHILE @@FETCH_STATUS=0
            BEGIN
                /*kalau j 0 berarti key*/ 
                IF @j = 0
                BEGIN
                    INSERT INTO @keyValuePair ([id],[key])
                    SELECT
                        @i as 'id',
                        @curKeyVal as 'key'
                END
                /*kalau j 1 berarti value*/ 
                ELSE IF @j = 1
                BEGIN
                    UPDATE @keyValuePair
                    SET 
                        [value] = @curKeyVal
                    WHERE 
                        id = @i
                END
                SET @j = @j+1
                FETCH NEXT FROM curBarisKeyValue INTO 
                @curKeyVal
            END

            CLOSE curBarisKeyValue
            DEALLOCATE curBarisKeyValue

            SET @i = @i+1
            FETCH NEXT FROM curValue INTO 
            @curBaris
        END
    CLOSE curValue
    DEALLOCATE curValue

    RETURN
END

------------------------------------------------

/*ROLES*/
CREATE PROCEDURE spInsertRole
    @roleName VARCHAR(20)
AS
    BEGIN TRANSACTION
        INSERT INTO Role (roleName)
        VALUES(@roleName)
    COMMIT TRANSACTION

--------------------------------------------------

CREATE PROCEDURE spGetAllRole
AS
    SELECT
        idRole,
        roleName
    FROM 
        Role

--------------------------------------------------

CREATE PROCEDURE spChangeRole
    @idRole int,
    @roleName VARCHAR(20)
AS
    BEGIN TRANSACTION
        UPDATE Role
        SET roleName = @roleName
        WHERE
            idRole = @idRole
    COMMIT TRANSACTION

------------------------------------------------

CREATE PROCEDURE spDeleteRole
    @roleName VARCHAR(20)
AS
    BEGIN TRANSACTION
        DELETE FROM Role
        WHERE roleName = @roleName
    COMMIT TRANSACTION

-----------------------------------------------
/*USERS*/
CREATE PROCEDURE spCreateUser
	@username VARCHAR(30),
	@password VARCHAR(128),
	@role VARCHAR(20)
AS
	DECLARE
		@idRole INT

	SELECT
		@idRole=idRole
	FROM
		[Role]
	WHERE
		roleName=@role

	BEGIN TRANSACTION
		INSERT INTO 
			Users (username, [password], fkRole)
		VALUES 
			(@username, @password, @idRole)
	COMMIT TRANSACTION

---------------------------------------------

CREATE PROCEDURE spGetAllUser
AS
    SELECT
        idUser,
        username,
        roleName
    FROM 
        Users INNER JOIN Role ON
            Users.fkRole = Role.idRole

--------------------------------------------

CREATE PROCEDURE spChangeUser
    @idUser INT,
    @username VARCHAR(30),
    @password VARCHAR(128),
    @roleName VARCHAR(20)
AS
    BEGIN TRANSACTION;
        IF @username is not NULL
        BEGIN
            UPDATE Users
            SET [username] = @username
            WHERE
                idUser = @idUser
        END

        IF @password is not NULL
        BEGIN
            UPDATE Users
            SET [password] = @password
            WHERE
                idUser = @idUser
        END

        IF @roleName is not NULL
        BEGIN
            DECLARE
                @idRole INT

            SELECT
                @idRole=idRole
            FROM
                [Role]
            WHERE
                roleName=@roleName

            UPDATE Users
            SET fkRole = @idRole
            WHERE
                idUser = @idUser
        
        END
    COMMIT TRANSACTION;

--------------------------------------------

CREATE PROCEDURE spDeleteUser
    @username VARCHAR(30)
AS 
    BEGIN TRANSACTION
        DELETE FROM Users
        WHERE
            username = @username
    COMMIT TRANSACTION

---------------------------------------------

/*FORMS*/
CREATE PROCEDURE spCreateForm
	@title varchar(128)
AS
	BEGIN TRANSACTION
		INSERT INTO Form (title, timeStamp, isAlive)
		SELECT
			@title,
			GETDATE(),
			1

		SELECT idForm=@@IDENTITY

	COMMIT TRANSACTION

--------------------------------------------

CREATE PROCEDURE spGetForm (
	@title VARCHAR(128),
	@isAlive bit
)
AS
	IF @title IS NULL
	BEGIN
		SELECT
			idForm,
			Title
		FROM
			Form
		WHERE
			isAlive = @isAlive
	END
	ELSE
	BEGIN
		SELECT
			idForm,
			title
		FROM
			Form
		WHERE
			title LIKE CONCAT('%',@title,'%') AND isAlive = @isAlive
	END

------------------------------------------

CREATE PROCEDURE spChangeForm
	@idUser INT,
	@idForm INT,
	@newTitle VARCHAR(256)
AS
	DECLARE
		@prevTitle VARCHAR(256),
		@timenow datetime
	
	SELECT 
		@timenow = GETDATE()

	SELECT
		@prevTitle=title
	FROM
		Form
	WHERE
		idForm=@idForm
	
	BEGIN TRANSACTION
		UPDATE Form
		SET timeStamp = @timenow
		WHERE
			idForm = @idForm

		INSERT INTO LogChangeForm (prevValue, [timeStamp], fkUser, fkForm)
		VALUES (@prevTitle, @timenow, @idUser, @idForm)

		UPDATE Form
		SET
			title=@newTitle
		WHERE
			idForm=@idForm
	COMMIT TRANSACTION

--------------------------------------

CREATE PROCEDURE spDeleteForm
	@idUser INT,
	@idForm INT
AS
	BEGIN TRANSACTION
		UPDATE Form
		SET
			isAlive = 0
		WHERE
			idForm = @idForm

		EXEC spChangeForm @idUser, @idForm, ''
	COMMIT TRANSACTION

-------------------------------------

/*QUESTIONS*/

CREATE PROCEDURE spGetQuestion
	@idForm int,
	@isAlive bit
AS

	SELECT 
		idQuestion, question
	FROM 
		Questions
	WHERE 
		fkForm = @idForm AND isAlive = @isAlive

----------------------------------------------

CREATE PROCEDURE spDeleteQuestions
    @idQuestions VARCHAR(256)
AS
    DECLARE curId CURSOR 
    FOR
    SELECT
        value
    FROM 
        string_split(@idQuestions,';')

    DECLARE 
        @currIdQuestion INT
    
    OPEN curId
    
    FETCH NEXT FROM curId INTO
        @currIdQuestion

    WHILE @@FETCH_STATUS=0
    BEGIN
		BEGIN TRANSACTION
			UPDATE Questions
			SET isAlive = 0
			WHERE idQuestion = @currIdQuestion

			FETCH NEXT FROM curId INTO
			@currIdQuestion
		COMMIT TRANSACTION
    END

    CLOSE curId
    DEALLOCATE curId

-----------------------------------------

/*ANSWERS*/

CREATE PROCEDURE spGetAnswerGroup
	@idForm INT,
	@timestampStart DATETIME,
    @timestampEnd DATETIME
AS
	SELECT
		AnswerGroup.idAnswer,
		AnswerGroup.[timeStamp]
	FROM
		AnswerGroup
	WHERE
		fkForm=@idForm
		AND AnswerGroup.[timeStamp]>=@timestampStart
		AND AnswerGroup.[timeStamp]<=@timestampEnd
	ORDER BY
		AnswerGroup.[timeStamp]

--------------------------------------------

--SELECT 'TEST: FUNCTION - parseKeyValue'
--SELECT 
--    [key],[value]
--FROM
--    parseKeyValue('1;12,2;Ken,3;2023-05-27 14:01:19')

--SELECT 'TEST: FUNCTION - parseKeyCharValueVarchar'
-- SELECT 
--     [key],[value]
-- FROM
--     parseKeyCharValueVarchar('N;banyak istri,T;nama istri,D;ttl istri')

--SELECT 'TEST: SP - spInsertRole'
-- exec spInsertRole 'raja'

--SELECT 'TEST: SP - spGetAllRole'
-- exec spGetAllRole

--SELECT 'TEST: SP - spChangeRole'
-- exec spChangeRole 1, 'kaders ni bos'

--SELECT 'TEST: SP - spDeleteRole'
-- exec spDeleteRole 'raja'

--SELECT 'TEST: SP - spCreateUser'
--SELECT * FROM Users
--EXEC spCreateUser 'dummy_user', 'password', 'kader'
--SELECT * FROM Users

--SELECT 'TEST: SP - spGetAllUser'
-- exec spGetAllUser

--SELECT 'TEST: SP - spChangeUser'
-- exec spGetAllUser
-- EXEC spChangeUser 1, 'ganti uname nih boss', NULL, NULL
-- exec spGetAllUser

--SELECT 'TEST: SP - spDeleteUser'
-- exec spGetAllUser
-- EXEC spChangeUser 1, 'ganti uname nih boss', NULL, NULL
-- exec spGetAllUser

--SELECT 'TEST: SP - spLogin'
-- exec spLogin 'admin','password'
--exec spLogin 'abc','abc'

--SELECT 'TEST: SP - spCreateForm'
--EXEC spCreateForm 'test form2'
--SELECT * FROM Form

--SELECT 'TEST: SP - spGetForm'
--EXEC spGetForm NULL,1
--EXEC spGetForm 'akses' ,0

--SELECT 'TEST: SP - spGetFormHistory'
--EXEC spGetFormHistory 1, NULL, NULL
--EXEC spGetFormHistory 1, '2023-06-10 17:35:27.307', '2023-06-10 17:35:27.307'

--SELECT 'TEST: SP - spChangeForm'
--SELECT * FROM Form
--EXEC spChangeForm 1, 1, 'survei akses pelayanan dan pembiayaan kesehatan'
--EXEC spChangeForm 1, 1, 'Survei Akses Pelayanan dan Pembiayaan Kesehatan'
--EXEC spChangeForm 1, 2, 'Survei Akses Pelayanan dan Pembiayaan Kesehatan'
--EXEC spChangeForm 1, 2, 'Survei Kesehatan Lansia'
--SELECT * FROM Form

--SELECT 'TEST: SP - spDeleteForm'
--SELECT * FROM Form
--SELECT * FROM LogChangeForm
--EXEC spDeleteForm 1, 3
--SELECT * FROM Form
--SELECT * FROM LogChangeForm

--SELECT 'TEST: SP - spCreateQuestions'
--SELECT * FROM Questions
-- EXEC spCreateQuestions 99, 'N;banyak istri,T;nama istri,D;ttl istri'
--SELECT * FROM Questions

--SELECT 'TEST: SP - spGetQuestion'
--EXEC spGetQuestion 1,1

--SELECT 'TEST: SP - spGetQuestion'
-- SELECT * FROM Questions
-- EXEC spChangeQuestion 1 , '2;Lahir tanggal,1;nama lengkap banget'
-- SELECT * FROM Questions

--SELECT 'TEST: SP - spDeleteQuestion'
-- SELECT * FROM Questions
-- EXEC spDeleteQuestions '1;2'
-- SELECT * FROM Questions

--SELECT 'TEST: SP - spInputAnswers'
-- exec spInputAnswers '2;12,3;Ken,4;2023-05-27 14:01:19', 1,1

--SELECT 'TEST: SP - spGetAnswerGroup'
-- EXEC spGetAnswerGroup 1, '2023-06-04 12:36:28', '2023-06-09 12:37:28'
--SELECT * FROM AnswerGroup

--SELECT 'TEST: SP - spGetAnswerAllUser'
-- exec spGetAnswerAllUser 1,null

--SELECT 'TEST: SP - spGetQuestionAnswer'
-- EXEC spGetQuestionAnswer 1,0

--SELECT 'TEST: SP - spChangeAnswers'
-- exec spChangeAnswers '1;Cagak Thamrin,2;1999-01-01,3;77,4;Pria,5;Sarjana,6;Wirausaha,7;1786383,8;a. Ya,9;b. Tradisional/CREATEnatif,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;a. BPJ', 3, 1,1