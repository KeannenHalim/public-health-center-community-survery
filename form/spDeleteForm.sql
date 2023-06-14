ALTER PROCEDURE spDeleteForm
	@idUser INT,
	@idForm INT
AS
	BEGIN TRANSACTION
		UPDATE Form
		SET
			isAlive = 0
		WHERE
			idForm = @idForm

		EXEC spChangeForm @idUser, @idForm, ''
	COMMIT TRANSACTION

--SELECT * FROM Form
--SELECT * FROM LogChangeForm
--EXEC spDeleteForm 1, 3