ALTER PROCEDURE spDeleteForm
	@idUser INT,
	@idForm INT
AS
	DECLARE 
		@prevTitle VARCHAR(128)

	SELECT
		@prevTitle=title
	FROM
		Form
	WHERE
		idForm=@idForm

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