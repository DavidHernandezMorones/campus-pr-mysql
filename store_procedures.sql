USE PerformanceReview;

DELIMITER #
CREATE PROCEDURE sp_InsertInto()
BEGIN
    INSERT INTO Users (Name, FechaNacimiento, Edad)
    VALUES ('Daniel Sebastiao', '1984-02-24', 38),
           ('Edwin Julian', '1992-05-16', 30),
           ('Mariano Paciencia', '1972-10-8', 50),
           ('Saulo Villasenor', '1983-09-29', 37),
           ('Hector Cisnero', '1983-11-14', 37),
           ('Horeb Gastelum', '1992-04-03', 30),
           ('David', '1999-11-25', 45);

    INSERT INTO Role (ProfileName)
    VALUES ('Admin'),
           ('RH'),
           ('Student'),
           ('Squad');

    INSERT INTO UserRole (IdUser, IdRole)
    VALUES (1, 1),
           (1, 2),
           (1, 3),
           (2, 1),
           (3, 2),
           (5, 4),
           (6, 3);
END#

CREATE PROCEDURE sp_InsertUsers(IN name VARCHAR(50), IN nacimiento DATE, IN edad INT)
BEGIN
    INSERT INTO Users (Name, FechaNacimiento, Edad)
    VALUES (name, nacimiento, edad);
END#

CREATE PROCEDURE sp_InsertRoles(IN pname VARCHAR(50))
BEGIN
    INSERT INTO Role (ProfileName)
    VALUES (pname);
END#

CREATE PROCEDURE sp_InsertUserRole(IN userId INT, IN roleId INT)
BEGIN
    INSERT INTO UserRole(IdUser, IdRole)
    VALUES (userid, roleId);
END#

CREATE PROCEDURE sp_UserQueries(IN iduser INTEGER)
BEGIN
    IF iduser IS NULL THEN
        SELECT * FROM Users;
    END IF;
    IF iduser IS NOT NULL THEN
        SELECT * FROM Users WHERE Id = iduser;
    END IF;
END #

CREATE PROCEDURE sp_Queries()
BEGIN
    -- Todos los usuarios
    SELECT id, Name, FechaNacimiento, CreateDate, Edad
    FROM Users;

    -- Todos los roles
    SELECT Id, ProfileName
    FROM Role;

    -- Todos los usuarios con al menos un rol
    SELECT Users.Id, Users.Name, Users.FechaNacimiento, Users.Edad, Users.CreateDate, Role.ProfileName
    FROM Users
             INNER JOIN UserRole
                        ON Users.Id = UserRole.IdUser
             INNER JOIN Role
                        ON UserRole.IdRole = Role.Id;

    -- Los usuarios sin rol
    SELECT Name, FechaNacimiento, Edad, CreateDate
    FROM Users
             LEFT JOIN UserRole
                       ON Users.Id = UserRole.IdUser
    WHERE UserRole.Id IS NULL;

    -- La suma total de las edades
    SELECT SUM(Edad) TotalEdades FROM Users;

    -- la cantidad registros en usuario
    SELECT COUNT(Id) Usuarios FROM Users;

    -- la cantidad registros en Role
    SELECT COUNT(Id) Roles FROM Role;

    -- la cantidad registros en UserRole
    SELECT COUNT(Id) UsuariosConRol FROM UserRole;

END #

DELIMITER ;
