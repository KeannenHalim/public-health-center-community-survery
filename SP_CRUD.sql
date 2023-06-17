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


/*MAIN*/
CREATE PROCEDURE spGenerateTablePivot
    @idForm INT,
    @filter NVARCHAR(1000),
    @agregat NVARCHAR(1000),
    @isForAgregat BIT
AS
    DECLARE 
        @columnNumeric NVARCHAR(256),
        @columnDate NVARCHAR(256),
        @columnText NVARCHAR(256),
        @columnResult NVARCHAR(500),
        @guid1 NVARCHAR(2000),
        @queryText NVARCHAR(4000),
        @currCol VARCHAR(4)

    SET @columnNumeric = ''
    SET @columnDate = ''
    SET @columnText = ''
    SET @columnResult = ''

    SELECT @guid1=REPLACE(NEWID(),'-','')
    SELECT @filter=REPLACE(@filter,';',' AND ')
    --untuk menyimpan question yang sesuai dengan id form yang diinginkan
    CREATE table #tempQuestion(
        idQuestion INT,
        question VARCHAR(250),
        dataType char(1)
    )

    INSERT INTO #tempQuestion
    SELECT
        idQuestion,
        question,
        dataType
    FROM 
        Questions
    WHERE 
        fkForm = @idForm AND isAlive = 1

    --temp untuk answer item text
    create table #tempAnswerItemText(
        idAnswerGroup INT,
        idQuestion INT,
        answer VARCHAR(150)
    )

    --temp untuk answer item Numeric
    create table #tempAnswerItemNumeric(
        idAnswerGroup INT,
        idQuestion INT,
        answer INT
    )

    --temp untuk answer item Date
    create table #tempAnswerItemDate(
        idAnswerGroup INT,
        idQuestion INT,
        answer DATE
    )

    --untuk answer item text
    --pilih sesuai dengan form yang diinginkan
    INSERT INTO #tempAnswerItemText
    SELECT
        AnswerItemText.fkAnswerGroup as 'idAnswerGroup',
        AnswerItemText.fkQuestion as 'idQuestion',
        AnswerItemText.answer
    FROM 
        AnswerItemText INNER JOIN #tempQuestion ON
            AnswerItemText.fkQuestion = #tempQuestion.idQuestion
    WHERE
        AnswerItemText.isLatest = 1

    --cursor untuk id question nya ada apa saja
    DECLARE curItemText CURSOR 
    FOR 
    SELECT 
        DISTINCT
        idQuestion
    FROM 
        #tempAnswerItemText
    ORDER BY
        idQuestion

    --buat temp global table
    SET @queryText = 'create table ##tempText_'+@guid1+'
    (
        idAnswerGroup INT,'

    OPEN curItemText

    FETCH NEXT FROM curItemText INTO
        @currCol

    --ambil semua kolom distinct nya
    WHILE @@FETCH_STATUS=0
    BEGIN 
        SET @columnText += '['+@currCol+'],'
        SET @queryText += '['+@currCol+']'+' VARCHAR(150),'
        FETCH NEXT FROM curItemText INTO
            @currCol
    END

    CLOSE curItemText
    DEALLOCATE curItemText

    SET @queryText = LEFT(@queryText,LEN(@queryText)-1)

    SET @queryText += '
    )'

    EXEC sp_executesql @queryText

    --masukkan hasilnya pivot ke dalam global temp table
    IF(LEN(@columnText) != 0)
    BEGIN
        SET @columnText = LEFT(@columnText, LEN(@columnText)-1)
        SET @columnResult+= @columnText
        SET @queryText = '
        INSERT INTO ##tempText_'+@guid1+'
        SELECT '+ 'idAnswerGroup,' +
            @columnText+
        ' FROM 
            #tempAnswerItemText
        PIVOT
        (
            min(answer)
            FOR idQuestion in ('+@columnText+')
        )as p'
        EXEC sp_executesql @queryText
    END

    --untuk answer item Numeric
    --pilih sesuai dengan form yang diinginkan
    INSERT INTO #tempAnswerItemNumeric
    SELECT
        AnswerItemNumeric.fkAnswerGroup as 'idAnswerGroup',
        AnswerItemNumeric.fkQuestion as 'idQuestion',
        AnswerItemNumeric.answer
    FROM 
        AnswerItemNumeric INNER JOIN #tempQuestion ON
            AnswerItemNumeric.fkQuestion = #tempQuestion.idQuestion
    WHERE
        AnswerItemNumeric.isLatest = 1

    --cursor untuk id question nya ada apa saja
    DECLARE curItemText CURSOR 
    FOR 
    SELECT 
        DISTINCT
        idQuestion
    FROM 
        #tempAnswerItemNumeric
    ORDER BY
        idQuestion

    --buat temp global table
    SET @queryText = 'create table ##tempNumeric_'+@guid1+'
    (
        idAnswerGroup INT,'

    OPEN curItemText

    FETCH NEXT FROM curItemText INTO
        @currCol

    --ambil semua kolom distinct nya
    WHILE @@FETCH_STATUS=0
    BEGIN 
        SET @columnNumeric += '['+@currCol+'],'
        SET @queryText += '['+@currCol+']'+' INT,'
        FETCH NEXT FROM curItemText INTO
            @currCol
    END

    CLOSE curItemText
    DEALLOCATE curItemText

    SET @queryText = LEFT(@queryText,LEN(@queryText)-1)

    SET @queryText += '
    )'

    EXEC sp_executesql @queryText

    --masukkan hasilnya pivot ke dalam global temp table
     IF(LEN(@columnNumeric) != 0)
    BEGIN
        SET @columnNumeric = LEFT(@columnNumeric, LEN(@columnNumeric)-1)
        SET @columnResult+=','+@columnNumeric
        SET @queryText = '
        INSERT INTO ##tempNumeric_'+@guid1+'
        SELECT '+ 'idAnswerGroup,' +
            @columnNumeric+
        ' FROM 
            #tempAnswerItemNumeric
        PIVOT
        (
            min(answer)
            FOR idQuestion in ('+@columnNumeric+')
        )as p'
        EXEC sp_executesql @queryText
    END

     --untuk answer item Date
    --pilih sesuai dengan form yang diinginkan
    INSERT INTO #tempAnswerItemDate
    SELECT
        AnswerItemDate.fkAnswerGroup as 'idAnswerGroup',
        AnswerItemDate.fkQuestion as 'idQuestion',
        AnswerItemDate.answer
    FROM 
        AnswerItemDate INNER JOIN #tempQuestion ON
            AnswerItemDate.fkQuestion = #tempQuestion.idQuestion
    WHERE
        AnswerItemDate.isLatest = 1

    --cursor untuk id question nya ada apa saja
    DECLARE curItemText CURSOR 
    FOR 
    SELECT 
        DISTINCT
        idQuestion
    FROM 
        #tempAnswerItemDate
    ORDER BY
        idQuestion

    --buat temp global table
    SET @queryText = 'create table ##tempDate_'+@guid1+'
    (
        idAnswerGroup INT,'
    
    OPEN curItemText

    FETCH NEXT FROM curItemText INTO
        @currCol

    --ambil semua kolom distinct nya
    WHILE @@FETCH_STATUS=0
    BEGIN 
        SET @columnDate += '['+@currCol+'],'
        SET @queryText += '['+@currCol+']'+' DATE,'
        FETCH NEXT FROM curItemText INTO
            @currCol
    END

    CLOSE curItemText
    DEALLOCATE curItemText

    SET @queryText = LEFT(@queryText,LEN(@queryText)-1)

    SET @queryText += '
    )'

    EXEC sp_executesql @queryText

    --masukkan hasilnya pivot ke dalam global temp table
     IF(LEN(@columnDate) != 0)
    BEGIN
        SET @columnDate = LEFT(@columnDate, LEN(@columnDate)-1)
        SET @columnResult+=','+@columnDate
        SET @queryText = '
        INSERT INTO ##tempDate_'+@guid1+'
        SELECT '+ 'idAnswerGroup,' +
            @columnDate+
        ' FROM 
            #tempAnswerItemDate
        PIVOT
        (
            min(answer)
            FOR idQuestion in ('+@columnDate+')
        )as p'
        EXEC sp_executesql @queryText
    END

    IF @isForAgregat = 0
    BEGIN
    SET @queryText ='select '+CONCAT('##tempText_',@guid1)+
                    '.idAnswerGroup'
        IF LEN(@columnResult) != 0
        BEGIN
            SET @queryText+=','+@columnResult
        END
    END
    ELSE
    BEGIN
        SET @queryText ='select '
		SET @queryText += @agregat
    END

    SET @queryText+=' from '+
                    CONCAT('##tempText_',@guid1)+' full outer join '+
                    CONCAT('##tempNumeric_',@guid1)+' ON '+CONCAT('##tempText_',@guid1)+
                    '.idAnswerGroup = '+CONCAT('##tempNumeric_',@guid1)+'.idAnswerGroup'+
                    ' full outer join '+CONCAT('##tempDate_',@guid1)+' ON '+CONCAT('##tempNumeric_',@guid1)+'.idAnswerGroup = '+
                    CONCAT('##tempDate_',@guid1)+'.idAnswerGroup'
    IF @filter is not NULL
    BEGIN
        SET @queryText = @queryText+ ' WHERE '+@filter
    END
    EXEC sp_executesql @queryText
    
    IF @isForAgregat = 0
    BEGIN
        SELECT *
        FROM 
            #tempQuestion
    END

    --untuk drop tablenya
    SET @queryText = 'drop table ##tempText_'+@guid1
    EXEC sp_executesql @queryText

    SET @queryText = 'drop table ##tempNumeric_'+@guid1
    EXEC sp_executesql @queryText

    SET @queryText = 'drop table ##tempDate_'+@guid1
    EXEC sp_executesql @queryText


CREATE PROCEDURE spCreateReport
    @idForm INT,
    @filter NVARCHAR(1000),
    @agregat NVARCHAR(1000)
AS
   exec spGenerateTablePivot @idForm,@filter,@agregat,1

-- exec spCreateReport 1, null, 'avg([7]) as [rata7], min([7]) as [min7]'


/*ROLES*/
CREATE PROCEDURE spInsertRole
    @roleName VARCHAR(20)
AS
    BEGIN TRANSACTION
        INSERT INTO Role (roleName)
        VALUES(@roleName)
    COMMIT TRANSACTION


CREATE PROCEDURE spGetAllRole
AS
    SELECT
        idRole,
        roleName
    FROM 
        Role


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


CREATE PROCEDURE spDeleteRole
    @roleName VARCHAR(20)
AS
    BEGIN TRANSACTION
        DELETE FROM Role
        WHERE roleName = @roleName
    COMMIT TRANSACTION

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


CREATE PROCEDURE spGetAllUser
AS
    SELECT
        idUser,
        username,
        roleName
    FROM 
        Users INNER JOIN Role ON
            Users.fkRole = Role.idRole


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


CREATE PROCEDURE spDeleteUser
    @username VARCHAR(30)
AS 
    BEGIN TRANSACTION
        DELETE FROM Users
        WHERE
            username = @username
    COMMIT TRANSACTION


CREATE PROCEDURE spLogin
    @username varchar(30),
    @password varchar(128)
AS
    DECLARE
        @idUser int,
        @idRole int,
        @roleName varchar(20)

    SET @roleName = 'unknown'
    SET @idUser = -1
    SELECT
        @idUser = idUser,
        @idRole = fkRole
    FROM 
        Users
    WHERE
        username = @username AND password = @password

    SELECT
        @roleName = roleName
    FROM 
        Role
    WHERE
        idRole = @idRole

    SELECT
        @idUser as 'idUser',
        @roleName as 'role'


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


CREATE PROCEDURE spGetFormHistory
	@idForm INT,
	@timestampStart DATETIME,
	@timestampEnd DATETIME
AS
	IF (@timestampStart IS NULL AND @timestampEnd IS NULL)
	BEGIN
		SELECT
			[timeStamp],
			prevValue,
			username
		FROM
			LogChangeForm
			INNER JOIN Users
				ON LogChangeForm.fkUser=Users.idUser
		WHERE
			fkForm=@idForm
		ORDER BY
			[timeStamp]
	END
	ELSE
	BEGIN
		SELECT
			[timeStamp],
			prevValue,
			username
		FROM
			LogChangeForm INNER JOIN Users
				ON LogChangeForm.fkUser=Users.idUser
		WHERE
			fkForm=@idForm
			AND [timeStamp]>=@timestampStart 
			AND [timeStamp]<=@timestampEnd
		ORDER BY
			[timeStamp]
	END


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


/*QUESTIONS*/
CREATE PROCEDURE spCreateQuestions
	@idForm INT,
	@questions varchar(MAX)
AS
	DECLARE
		@timeNow DATETIME

	BEGIN TRANSACTION
		SELECT
            @timeNow = GETDATE()

		INSERT INTO Questions (dataType,question,[timeStamp],isAlive,fkForm)
		SELECT
			[key] as 'dataType',
			[value] as 'question',
			@timeNow as 'timestamp',
			1 as 'isAlive',
			@idForm as 'fkForm'
		FROM
			parseKeyCharValueVarchar(@questions)
	COMMIT TRANSACTION


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


CREATE PROCEDURE spChangeQuestions
	@idUser int,
	@Questions varchar(MAX)
AS
	DECLARE
		@oldQuestion varchar(250),
		@timestamp datetime,
		@idQuestion INT,
		@newQuestion VARCHAR(250)

	SELECT @timestamp = GETDATE()

	DECLARE curQuest CURSOR
	FOR
	SELECT
		[key],
		[value]
	FROM 
		parseKeyValue(@Questions)

	OPEN curQuest

	FETCH NEXT FROM curQuest INTO
		@idQuestion,
		@newQuestion
	
	WHILE @@FETCH_STATUS=0
	BEGIN
		SELECT
			@oldQuestion = question
		FROM
			Questions
		WHERE
			idQuestion = @idQuestion
			

		BEGIN TRANSACTION
		
		INSERT INTO LogChangeQuestions (prevValue, [timeStamp], fkUser, fkQuestions)
		VALUES (@oldQuestion, @timestamp, @idUser, @idQuestion)

		UPDATE Questions
		SET
			question = @newQuestion
		WHERE
			idQuestion = @idQuestion

		COMMIT TRANSACTION
		
		FETCH NEXT FROM curQuest INTO
		@idQuestion,
		@newQuestion
	END

	CLOSE curQuest
	DEALLOCATE curQuest


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


/*ANSWERS*/
CREATE PROCEDURE spInputAnswers
    @keyValueString VARCHAR(MAX),
    @idUser INT,
    @idForm INT
AS
    --untuk menyimpan pasangan key value yang sudah di parse
    create table #keyValueTable (
        [key] int,
        [value] varchar(150),
        dataType char(1)
    )

    declare 
        @timeNow datetime,
        @idAnswerGroup int

    INSERT INTO #keyValueTable
    SELECT
        [key],
        [value],
        dataType
    FROM 
        parseKeyValue(@keyValueString) t1 inner join Questions ON
            t1.[key] = Questions.idQuestion

    BEGIN TRANSACTION;
        SELECT
            @timeNow = GETDATE()

        --insert ke tabel AnswerGroup
        INSERT INTO AnswerGroup (fkForm,[timeStamp])
        VALUES(@idForm,@timeNow)

        --ambil identity dari record yang baru dimasukkan
        SELECT 
            @idAnswerGroup=@@IDENTITY
        
        --insert jawaban ke answer item text
        INSERT INTO AnswerItemText
        SELECT
            [value],
            @timeNow,
            1,
            @idUser,
            @idAnswerGroup,
            [key]
        FROM 
            #keyValueTable
        WHERE
            dataType = 'T'

        --insert jawaban ke answer item numeric
        INSERT INTO AnswerItemNumeric
        SELECT
            convert(int,[value]),
            @timeNow,
            1,
            @idUser,
            @idAnswerGroup,
            [key]
        FROM 
            #keyValueTable
        WHERE
            dataType = 'N'

        --insert jawaban ke answer item date
        INSERT INTO AnswerItemDate
        SELECT
            convert(date,[value]),
            @timeNow,
            1,
            @idUser,
            @idAnswerGroup,
            [key]
        FROM 
            #keyValueTable
        WHERE
            dataType = 'D'
        
    COMMIT TRANSACTION;


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


CREATE PROCEDURE spGetAnswerAllUser
    @idForm INT,
    @filter NVARCHAR(1000)
AS
    exec spGenerateTablePivot @idForm,@filter,null,0


CREATE PROCEDURE spGetQuestionAnswer
	@idAnswerGroup INT,
	@isLatest BIT
AS
	CREATE TABLE #tblQuestions (
		idQuestion INT,
		dataType CHAR,
		question VARCHAR(256)
	)

	CREATE TABLE #tblAnswers (
		fkQuestion INT,
		answer VARCHAR(256),
		[timeStamp] DATETIME
	)

	DECLARE
		@idForm INT

	SELECT
		@idForm = fkForm
	FROM 
		AnswerGroup
	WHERE
		idAnswer = @idAnswerGroup

	INSERT INTO #tblQuestions
		SELECT
			idQuestion,
			dataType,
			question
		FROM
			Questions
		WHERE
			fkForm=@idForm AND isAlive = 1

	INSERT INTO #tblAnswers
		SELECT
			fkQuestion,
			answer,
			[timestamp]
		FROM
			AnswerItemText
		WHERE
			fkAnswerGroup=@idAnswerGroup AND isLatest = @isLatest

	INSERT INTO #tblAnswers
		SELECT
			fkQuestion,
			answer,
			[timestamp]
		FROM
			AnswerItemDate
		WHERE
			fkAnswerGroup=@idAnswerGroup AND isLatest = @isLatest

	INSERT INTO #tblAnswers
		SELECT
			fkQuestion,
			answer,
			[timestamp]
		FROM
			AnswerItemNumeric
		WHERE
			fkAnswerGroup=@idAnswerGroup AND isLatest = @isLatest

	IF @isLatest = 1
	BEGIN
		SELECT
			idQuestion,
			dataType,
			question,
			answer
		FROM
			#tblQuestions LEFT JOIN #tblAnswers
				ON #tblQuestions.idQuestion=#tblAnswers.fkQuestion
	END
	ELSE
	BEGIN
		SELECT
			idQuestion,
			dataType,
			question,
			answer,
			[timeStamp]
		FROM
			#tblQuestions LEFT JOIN #tblAnswers
				ON #tblQuestions.idQuestion=#tblAnswers.fkQuestion
		ORDER BY
			[timeStamp]
	END


CREATE PROCEDURE spChangeAnswers
    @keyValueString VARCHAR(MAX),
    @idUser INT,
    @idForm INT,
    @idAnswerGroup INT
AS
    create table #keyValueTable (
        [key] int,
        [value] varchar(150),
        dataType char(1)
    )

    declare 
        @timeNow datetime,
        @currKey VARCHAR(256),
        @currValue VARCHAR(256)

    INSERT INTO #keyValueTable
    SELECT
        [key],
        [value],
        dataType
    FROM 
        parseKeyValue(@keyValueString) t1 inner join Questions ON
            t1.[key] = Questions.idQuestion

    BEGIN TRANSACTION;
        SELECT
            @timeNow = GETDATE()

        UPDATE AnswerGroup
        SET [timeStamp] = @timeNow
        WHERE  idAnswer = @idAnswerGroup AND fkForm = @idForm
        
        DECLARE curAnswer CURSOR
        FOR 
        SELECT
            [key],
            [value] 
        FROM 
            #keyValueTable
        WHERE 
            dataType = 'T'

        OPEN curAnswer

        FETCH NEXT FROM curAnswer INTO
            @currKey,
            @currValue
        
        WHILE @@FETCH_STATUS=0
        BEGIN
            UPDATE AnswerItemText
            SET isLatest = 0
            WHERE fkAnswerGroup = @idAnswerGroup AND fkQuestion = @currKey

            INSERT INTO AnswerItemText (answer,[timestamp],isLatest,fkUser,fkAnswerGroup,fkQuestion)
            VALUES (@currValue,@timeNow,1,@idUser,@idAnswerGroup,@currKey)


            FETCH NEXT FROM curAnswer INTO
                @currKey,
                @currValue
        END

        CLOSE curAnswer
        DEALLOCATE curAnswer

        DECLARE curAnswer CURSOR
        FOR 
        SELECT
            [key],
            [value] 
        FROM 
            #keyValueTable
        WHERE 
            dataType = 'N'

        OPEN curAnswer

        FETCH NEXT FROM curAnswer INTO
            @currKey,
            @currValue
        
        WHILE @@FETCH_STATUS=0
        BEGIN
            UPDATE AnswerItemNumeric
            SET isLatest = 0
            WHERE fkAnswerGroup = @idAnswerGroup AND fkQuestion = @currKey

            INSERT INTO AnswerItemNumeric (answer,[timestamp],isLatest,fkUser,fkAnswerGroup,fkQuestion)
            VALUES (convert(int,@currValue),@timeNow,1,@idUser,@idAnswerGroup,@currKey)


            FETCH NEXT FROM curAnswer INTO
                @currKey,
                @currValue
        END

        CLOSE curAnswer
        DEALLOCATE curAnswer

        DECLARE curAnswer CURSOR
        FOR 
        SELECT
            [key],
            [value] 
        FROM 
            #keyValueTable
        WHERE 
            dataType = 'D'

        OPEN curAnswer

        FETCH NEXT FROM curAnswer INTO
            @currKey,
            @currValue
        
        WHILE @@FETCH_STATUS=0
        BEGIN
            UPDATE AnswerItemDate
            SET isLatest = 0
            WHERE fkAnswerGroup = @idAnswerGroup AND fkQuestion = @currKey

            INSERT INTO AnswerItemDate (answer,[timestamp],isLatest,fkUser,fkAnswerGroup,fkQuestion)
            VALUES (convert(date,@currValue),@timeNow,1,@idUser,@idAnswerGroup,@currKey)


            FETCH NEXT FROM curAnswer INTO
                @currKey,
                @currValue
        END

        CLOSE curAnswer
        DEALLOCATE curAnswer
    COMMIT TRANSACTION;


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