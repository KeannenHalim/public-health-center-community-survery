ALTER FUNCTION parseKeyValue (
    @answers varchar(256)
)
    RETURNS @keyValuePair TABLE(
        [key] varchar(256),
        [value] varchar(256)
    )
AS
BEGIN
    INSERT INTO @keyValuePair
    SELECT
        [key],
        [value]
    FROM 
        openjson(@answers)

    RETURN
END

-- SELECT 
--     [key],[value]
-- FROM
--     parseKeyValue('{"name":"ken","age":27,"tanggal":"2011-05-31T00:00:00"}')