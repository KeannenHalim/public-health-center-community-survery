ALTER PROCEDURE spCreateQuestion
	@questions varchar(MAX)
AS
	DECLARE
		@timeNow DATETIME

	BEGIN TRANSACTION
		SELECT
            @timeNow = GETDATE()

		INSERT INTO Questions (dataType,question,[timeStamp],isAlive)
		SELECT
			[key] as 'dataType',
			[value] as 'question',
			@timeNow as 'timestamp',
			1 as 'isAlive'
		FROM
			parseKeyCharValueVarchar(@questions)
	COMMIT TRANSACTION

--EXEC spCreateQuestion 'N;banyak istri,T;nama istri,D;ttl istri'
-- SELECT * FROM Questions