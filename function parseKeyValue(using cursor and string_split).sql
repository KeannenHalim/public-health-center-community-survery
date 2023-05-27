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
    split oleh ';'*/
    DECLARE curValue CURSOR
    FOR
    SELECT 
        value
    FROM 
        string_split(@answers,',')

    declare
        /*temp variable untuk split oleh ';'*/
        @curBaris varchar(256),
        /*temp variable untuk split oleh ':'*/
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

-- SELECT 
--     [key],[value]
-- FROM
--     parseKeyValue('1;12,2;Ken,3;2023-05-27 14:01:19')