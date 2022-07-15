USE PerformanceReview;

INSERT INTO Users (Name, FechaNacimiento, Edad)
VALUES ('Daniel Sebastiao', '1984-02-24', 38),
       ('Edwin Julian','1992-05-16', 30),
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