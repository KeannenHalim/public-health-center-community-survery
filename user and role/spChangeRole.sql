ALTER PROCEDURE spChangeRole
    @idRole int,
    @roleName VARCHAR(20)
AS
    BEGIN TRANSACTION
        UPDATE Role
        SET roleName = @roleName
        WHERE
            idRole = @idRole
    COMMIT TRANSACTION

-- exec spChangeRole 1, 'kaders ni bos'