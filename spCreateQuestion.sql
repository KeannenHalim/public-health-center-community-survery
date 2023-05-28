ALTER PROCEDURE spCreateQuestion
	@questions varchar(MAX)
AS
	BEGIN TRANSACTION
		INSERT INTO Questions
		SELECT
			dataType,
			question,
			[timestamp],
			isAlive
		FROM
			parseQuestion(@questions)
	COMMIT TRANSACTION

--EXEC spCreateQuestion 'N;banyak istri,T;nama istri,D;ttl istri'
--SELECT * FROM Questions