ALTER PROCEDURE spCreateQuestion
	@idForm INT,
	@questions varchar(MAX)
AS
	DECLARE
		@timeNow DATETIME

	BEGIN TRANSACTION
		SELECT
            @timeNow = GETDATE()

		INSERT INTO Questions (dataType,question,[timeStamp],isAlive,fkForm)
		SELECT
			[key] as 'dataType',
			[value] as 'question',
			@timeNow as 'timestamp',
			1 as 'isAlive',
			@idForm as 'fkForm'
		FROM
			parseKeyCharValueVarchar(@questions)
	COMMIT TRANSACTION

-- EXEC spCreateQuestion 1, 'N;banyak istri,T;nama istri,D;ttl istri'
--SELECT * FROM Questions