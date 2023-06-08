ALTER FUNCTION parseQuestion (
	@questions varchar(256)
)
RETURNS @parsedQuestion TABLE (
	id int,
	dataType char,
	question varchar(256),
	[timestamp] datetime,
	isAlive int
)
AS
BEGIN
	--cursor untuk parsing @questions menjadi baris-baris pasangan 'dataType;pertanyaan'
	DECLARE curRow CURSOR
	FOR
	SELECT
		value
	FROM
		string_split(@questions, ',')

	DECLARE
		@currRow varchar(256), --baris pasangan 'dataType;pertanyaan'
		@currValue varchar(256), --hasil split curRow. dapat berupa dataType, maupun pertanyaan
		@i int,
		@j int, --membedakan cursor sedang berada pada datatype atau pertanyaan table hasil split curRow
		@timeNow dateTime

	SET @timeNow = GETDATE()

	OPEN curRow
		FETCH NEXT FROM curRow INTO
			@currRow

		SET @i = 0
		WHILE @@FETCH_STATUS = 0
		BEGIN
			DECLARE curValue CURSOR
			FOR
			SELECT
				value
			FROM
				string_split(@currRow, ';')

			OPEN curValue
			FETCH NEXT FROM curValue INTO
				@currValue

			SET @j = 0
			WHILE @@FETCH_STATUS = 0
			BEGIN
				IF @j = 0
				BEGIN
					INSERT INTO @parsedQuestion ([id], [dataType])
                    SELECT
                        @i,
                        @currValue

					SET @j = 1
				END
				ELSE
				BEGIN
					UPDATE @parsedQuestion
					SET
						question = @currValue,
						[timestamp] = @timeNow,
						isAlive = 1
					WHERE
						id = @i
				END

				FETCH NEXT FROM curValue INTO
					@currValue
			END

			CLOSE curValue
			DEALLOCATE curValue

			SET @i = @i+1
			FETCH NEXT FROM curRow INTO
				@currRoW
		END

	CLOSE curRow
	DEALLOCATE curRow

	RETURN
END

--SELECT * FROM Questions
--SELECT * FROM parseQuestion('N;age,T;name,D;birth date')