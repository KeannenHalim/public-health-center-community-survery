ALTER PROCEDURE spInsertRole
    @roleName VARCHAR(20)
AS
    BEGIN TRANSACTION
        INSERT INTO Role (roleName)
        VALUES(@roleName)
    COMMIT TRANSACTION

-- exec spInsertRole 'raja'