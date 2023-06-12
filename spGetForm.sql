ALTER PROCEDURE spGetForm (
	@title VARCHAR(128),
	@isAlive bit
)
AS
	IF @title IS NULL
	BEGIN
		BEGIN TRANSACTION
			SELECT
				idForm,
				Title
			FROM
				Form
			WHERE
				isAlive = @isAlive
		COMMIT TRANSACTION
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION
			SELECT
				idForm,
				title
			FROM
				Form
			WHERE
				title LIKE CONCAT('%',@title,'%') AND isAlive = @isAlive
		COMMIT TRANSACTION
	END

--EXEC spGetForm NULL,1
--EXEC spGetForm 'akses' ,0
--SELECT * FROM Form