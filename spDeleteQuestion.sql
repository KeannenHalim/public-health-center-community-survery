ALTER PROCEDURE spDeleteQuestion
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
        UPDATE Questions
        SET isAlive = 0
        WHERE idQuestion = @currIdQuestion

        FETCH NEXT FROM curId INTO
        @currIdQuestion
    END

    CLOSE curId
    DEALLOCATE curId

-- EXEC spDeleteQuestion '1;2'
-- SELECT * FROM Questions