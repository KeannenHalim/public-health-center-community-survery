/*Semua exec yang ada di sini jangan dijankan sebelum menjalankan data dummy
karena nantinya akan ada perbedaan id karena urutan memasukkan berubah*/
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

--SELECT * from parseKeyValue ('1;ken,2;do')
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

-- SELECT * from parseKeyCharValueVarchar ('D;ken,T;do')
------------------------------------------------

/*ROLES*/
CREATE PROCEDURE spInsertRole
    @roleName VARCHAR(20)
AS
    BEGIN TRANSACTION
        INSERT INTO Role (roleName)
        VALUES(@roleName)
    COMMIT TRANSACTION

--exec spInsertRole 'testRole'
--------------------------------------------------

CREATE PROCEDURE spGetAllRole
AS
    SELECT
        idRole,
        roleName
    FROM 
        Role


--exec spGetAllRole
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

--exec spChangeRole 4,'TestRole'
------------------------------------------------

CREATE PROCEDURE spDeleteRole
    @roleName VARCHAR(20)
AS
    BEGIN TRANSACTION
        DELETE FROM Role
        WHERE roleName = @roleName
    COMMIT TRANSACTION

--exec spDeleteRole 'TestRole'
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

-- EXEC dbo.spCreateUser 'admin2', 'password', 'admin'
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

--exec spGetAllUser
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

--exec spChangeUser 6,admin3,admin,admin
--exec spChangeUser 6,null,admin,admin
--exec spChangeUser 6,admin3,null,admin
--exec spChangeUser 6,admin3,admin,null
--------------------------------------------

CREATE PROCEDURE spDeleteUser
    @username VARCHAR(30)
AS 
    BEGIN TRANSACTION
        DELETE FROM Users
        WHERE
            username = @username
    COMMIT TRANSACTION

--exec spDeleteUser 'admin3'
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

--exec spCreateForm 'testForm'
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

--exec spGetForm null,1
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

--exec spChangeForm 1,3,'TESTFORM'
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

--exec spDeleteForm 1,3
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

--exec spGetQuestion 1,1
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

--exec spDeleteQuestions '23;24'
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

--exec spGetAnswerGroup 1,'2023-06-04 12:36:28', '2024-06-09 12:37:28'
--------------------------------------------