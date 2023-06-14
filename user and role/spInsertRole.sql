ALTER PROCEDURE spInsertRole
    @roleName VARCHAR(20)
AS
    INSERT INTO Role (roleName)
    VALUES(@roleName)

-- exec spInsertRole 'raja'