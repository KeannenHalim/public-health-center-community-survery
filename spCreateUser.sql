ALTER PROCEDURE spCreateUser
	@username VARCHAR(128),
	@password VARCHAR(128),
	@role VARCHAR(32)
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

	INSERT INTO Users (username, [password], fkRole)
	VALUES (@username, @password, @idRole)
	
	COMMIT TRANSACTION

--SELECT * FROM [Role]
--SELECT * FROM Users
--EXEC spCreateUser 'dummy_user', 'password', 'kader'