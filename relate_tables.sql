ALTER TABLE UserRole
    ADD CONSTRAINT FK_User_Role FOREIGN KEY (IdUser) REFERENCES Users (Id);

ALTER TABLE UserRole
    ADD CONSTRAINT FK_Role_User FOREIGN KEY (IdRole) REFERENCES Role (Id);
