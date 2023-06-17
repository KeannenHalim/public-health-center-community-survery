ALTER PROCEDURE spDeleteUser
    @username VARCHAR(30)
AS 
    BEGIN TRANSACTION
        DELETE FROM Users
        WHERE
            username = @username
    COMMIT TRANSACTION