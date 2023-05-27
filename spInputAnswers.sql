ALTER PROCEDURE spInputAnswer
    @keyValueString VARCHAR(MAX),
    @idUser INT,
    @idForm INT
AS
    create table #keyValueTable (
        [key] int,
        [value] varchar(256),
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

        INSERT INTO AnswerGroup (fkForm,[timeStamp])
        VALUES(@idForm,@timeNow)

        SELECT 
            @idAnswerGroup=@@IDENTITY
        
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

        INSERT INTO AnswerItemNumeric
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
            dataType = 'N'

        INSERT INTO AnswerItemDate
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
            dataType = 'D'
        
    COMMIT TRANSACTION;

-- exec spInputAnswer '2;12,3;Ken,4;2023-05-27 14:01:19', 1,1
