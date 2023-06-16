ALTER PROCEDURE spChangeForm
	@idUser INT,
	@idForm INT,
	@newTitle VARCHAR(256)
AS
	DECLARE
		@prevTitle VARCHAR(256),
		@timenow datetime
	
	SELECT 
		@timenow = GETDATE()

	SELECT
		@prevTitle=title
	FROM
		Form
	WHERE
		idForm=@idForm
	
	BEGIN TRANSACTION
		UPDATE Form
		SET timeStamp = @timenow
		WHERE
			idForm = @idForm

		INSERT INTO LogChangeForm (prevValue, [timeStamp], fkUser, fkForm)
		VALUES (@prevTitle, @timenow, @idUser, @idForm)

		UPDATE Form
		SET
			title=@newTitle
		WHERE
			idForm=@idForm
	COMMIT TRANSACTION

--SELECT * FROM Form
--EXEC spChangeForm 1, 1, 'survei akses pelayanan dan pembiayaan kesehatan'
--EXEC spChangeForm 1, 1, 'Survei Akses Pelayanan dan Pembiayaan Kesehatan'
--EXEC spChangeForm 1, 2, 'Survei Akses Pelayanan dan Pembiayaan Kesehatan'
--EXEC spChangeForm 1, 2, 'Survei Kesehatan Lansia'