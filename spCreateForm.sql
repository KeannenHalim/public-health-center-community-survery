ALTER PROCEDURE spCreateForm
	@title varchar(128)
AS
	BEGIN TRANSACTION
		INSERT INTO Form (title, timeStamp, isAlive)
		SELECT
			@title,
			GETDATE(),
			1

		SELECT idForm=@@IDENTITY

	COMMIT TRANSACTION

--EXEC spCreateForm 'test form2'
--SELECT * FROM Form
