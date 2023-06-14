ALTER PROCEDURE spChangeUser
    @idUser INT,
    @username VARCHAR(30),
    @password VARCHAR(128),
    @roleName VARCHAR(20)
AS
    BEGIN TRANSACTION;
        IF @username is not NULL
        BEGIN
            UPDATE Users
            SET [username] = @username
            WHERE
                idUser = @idUser
        END

        IF @password is not NULL
        BEGIN
            UPDATE Users
            SET [password] = @password
            WHERE
                idUser = @idUser
        END

        IF @roleName is not NULL
        BEGIN
            DECLARE
                @idRole INT

            SELECT
                @idRole=idRole
            FROM
                [Role]
            WHERE
                roleName=@roleName

            UPDATE Users
            SET fkRole = @idRole
            WHERE
                idUser = @idUser
        
        END
    COMMIT TRANSACTION;
    
   