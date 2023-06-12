ALTER PROCEDURE spChangeAnswers
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

-- exec spChangeAnswer '1;Cagak Thamrin,2;1999-01-01,3;77,4;Pria,5;Sarjana,6;Wirausaha,7;1786383,8;a. Ya,9;b. Tradisional/Alternatif,10;a. Kurang dari 1 KM,11;Kendaraan umum,12;a. BPJ', 3, 1,1