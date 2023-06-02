CREATE PROCEDURE spChangeAnswer
    @keyValueString VARCHAR(MAX),
    @idUser INT,
    @idForm INT,
    @idAnswerGroup INT
AS
    create table #keyValueTable (
        [key] int,
        [value] varchar(256),
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
            VALUES (@currValue,@timeNow,1,@idUser,@idAnswerGroup,@currKey)


            FETCH NEXT FROM curAnswer INTO
                @currKey,
                @currValue
        END

        CLOSE curAnswer
        DEALLOCATE curAnswer
    COMMIT TRANSACTION;

-- exec spChangeAnswer '2;13,3;Kenen,4;2023-05-29 14:01:19', 1,1,1
