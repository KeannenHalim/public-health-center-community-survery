ALTER PROCEDURE spInputAnswer
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

-- exec spInputAnswer '2;12,3;Ken,4;2023-05-27 14:01:19', 1,1
