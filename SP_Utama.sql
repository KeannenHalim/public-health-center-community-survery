/*Semua exec yang ada di sini jangan dijankan sebelum menjalankan data dummy
karena nantinya akan ada perbedaan id karena urutan memasukkan berubah*/
/*FUNCTIONS*/
--sudah ada di SP_CRUD hanya ditulis kembali
ALTER FUNCTION parseKeyValue (
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
ALTER FUNCTION parseKeyCharValueVarchar (
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
    /*harus di full outer join bukan inner join karena jika hanya ada sebuah pertanyaan bertipe numeric misalnya
    dan tidak ada orang yang menjawab pertanyaan tersebut, maka ketika di inner join, tidak akan muncul apa apa
    karena tidak memenuhi kondisi untuk inner join */
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

------------------------------------------------------

CREATE PROCEDURE spCreateReport
    @idForm INT,
    @filter NVARCHAR(1000),
    @agregat NVARCHAR(1000)
AS
   exec spGenerateTablePivot @idForm,@filter,@agregat,1

-- exec spCreateReport 1, null, 'avg([7]) as [rata7], min([7]) as [min7]'

----------------------------------------------------

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

-- exec spLogin 'admin','password'
-- exec spLogin 'admin5','password'
---------------------------------------------

/*FORMS*/

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

--exec spGetFormHistory 3,'2023-06-04 12:36:28', '2024-06-09 12:37:28'
------------------------------------------

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

--contoh ada di dummy data
-----------------------------------------------

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

--exec spGetQuestion 1,1
--exec spChangeQuestions 1,'1;NAMA LENGKAP,2;TANGGAL LAHIR'
--------------------------------------------

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

--contoh ada di dummy data
---------------------------------------------

CREATE PROCEDURE spGetAnswerAllUser
    @idForm INT,
    @filter NVARCHAR(1000)
AS
    exec spGenerateTablePivot @idForm,@filter,null,0

--exec spGetAnswerAllUser 1,null
-------------------------------------------

CREATE PROCEDURE spGetQuestionHistory
	@idQuestion INT,
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
			LogChangeQuestions 
			INNER JOIN Users
				ON LogChangeQuestions.fkUser=Users.idUser
		WHERE
			fkQuestions=@idQuestion
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
			LogChangeQuestions INNER JOIN Users
				ON LogChangeQuestions.fkUser=Users.idUser
		WHERE
			fkQuestions=@idQuestion
			AND [timeStamp]>=@timestampStart 
			AND [timeStamp]<=@timestampEnd
		ORDER BY
			[timeStamp]
	END

--exec spGetQuestionHistory 1,'2023-06-04 12:36:28', '2024-06-09 12:37:28'
------------------------------------------------

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

--exec spGetQuestionAnswer 1,1
----------------------------------------

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
--exec spGetQuestionAnswer 1,1
--exec spChangeAnswers '1;superman,3;2000',1,1,1