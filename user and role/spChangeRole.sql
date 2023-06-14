ALTER PROCEDURE spChangeRole
    @idRole int,
    @roleName VARCHAR(20)
AS
    UPDATE Role
    SET roleName = @roleName
    WHERE
        idRole = @idRole

-- exec spChangeRole 1, 'kaders ni bos'