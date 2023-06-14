ALTER PROCEDURE spCreateUser
	@username VARCHAR(30),
	@password VARCHAR(128),
	@role VARCHAR(20)
AS
	DECLARE
		@idRole INT

	SELECT
		@idRole=idRole
	FROM
		[Role]
	WHERE
		roleName=@role

	BEGIN TRANSACTION
		INSERT INTO 
			Users (username, [password], fkRole)
		VALUES 
			(@username, @password, @idRole)
	COMMIT TRANSACTION

--SELECT * FROM [Role]
--SELECT * FROM Users
--EXEC spCreateUser 'dummy_user', 'password', 'kader'