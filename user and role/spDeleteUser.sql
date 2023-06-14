ALTER PROCEDURE spDeleteUser
    @username VARCHAR(30)
AS 
    DELETE FROM Users
    WHERE
        username = @username