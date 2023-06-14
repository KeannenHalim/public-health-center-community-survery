ALTER PROCEDURE spGetAllRole
AS
    SELECT
        idRole,
        roleName
    FROM 
        Role

-- exec spGetAllRole