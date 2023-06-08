ALTER PROCEDURE spCreateForm
	@title varchar(128)
AS
	BEGIN TRANSACTION
		INSERT INTO Form (title, timeStamp, isAlive)
		SELECT
			@title,
			GETDATE(),
			1

		SELECT
			idForm
		FROM
			Form
		WHERE
			title = @title

	COMMIT TRANSACTION

--EXEC spCreateForm 'test form'
--SELECT * FROM Form
