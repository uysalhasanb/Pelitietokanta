-- Create tables and references for database Pelikanta
-- ===================================================

USE Pelikanta
GO

CREATE TABLE Julkaisija (
                JulkaisijaID INT NOT NULL,
                JulkaisijanNimi VARCHAR(30) NOT NULL,
                CONSTRAINT Julkaisija_pk PRIMARY KEY (JulkaisijaID)
)

CREATE TABLE Kaveri (
                KaveriID INT IDENTITY NOT NULL,
                Etunimi VARCHAR(20) NOT NULL,
                Sukunimi VARCHAR(20) NOT NULL,
                CONSTRAINT Kaveri_pk PRIMARY KEY (KaveriID)
)

CREATE TABLE Alusta (
                AlaustaID INT NOT NULL,
                AlustanNimi VARCHAR(20) NOT NULL,
                CONSTRAINT Alusta_pk PRIMARY KEY (AlaustaID)
)

CREATE TABLE Ikaryhma (
                IkaryhmaID INT NOT NULL,
                Ikaryhmateksti VARCHAR(20) NOT NULL,
                CONSTRAINT Ikaryhma_pk PRIMARY KEY (IkaryhmaID)
)

CREATE TABLE Genre (
                GenreID INT NOT NULL,
                GenrenNimi VARCHAR(30) NOT NULL,
                CONSTRAINT Genre_pk PRIMARY KEY (GenreID)
)

CREATE TABLE Peli (
                PeliID INT NOT NULL,
                Nimi VARCHAR(30) NOT NULL,
                JulkaisijaID INT NOT NULL,
                GenreID INT NOT NULL,
                IkaryhmaID INT NOT NULL,
                CONSTRAINT Peli_pk PRIMARY KEY (PeliID)
)

CREATE TABLE Pisteet (
                KaveriID INT NOT NULL,
                PeliID INT NOT NULL,
                Maksimipisteet INT NOT NULL,
                Paivamaara DATETIME,
                CONSTRAINT Pisteet_pk PRIMARY KEY (KaveriID, PeliID)
)

CREATE TABLE Pelialusta (
                PeliID INT NOT NULL,
                AlaustaID INT NOT NULL,
                MuistinMaara INT,
                Naytonohjain VARCHAR(100),
                Tallennustila INT,
                Prosessori VARCHAR(20),
                CONSTRAINT Pelialusta_pk PRIMARY KEY (PeliID, AlaustaID)
)

ALTER TABLE Peli ADD CONSTRAINT Julkaisija_Peli_fk
FOREIGN KEY (JulkaisijaID)
REFERENCES Julkaisija (JulkaisijaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Pisteet ADD CONSTRAINT Kaveri_Pisteet_fk
FOREIGN KEY (KaveriID)
REFERENCES Kaveri (KaveriID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Pelialusta ADD CONSTRAINT Alusta_Pelialusta_fk
FOREIGN KEY (AlaustaID)
REFERENCES Alusta (AlaustaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Peli ADD CONSTRAINT Ikaryhma_Peli_fk
FOREIGN KEY (IkaryhmaID)
REFERENCES Ikaryhma (IkaryhmaID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Peli ADD CONSTRAINT Genre_Peli_fk
FOREIGN KEY (GenreID)
REFERENCES Genre (GenreID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Pelialusta ADD CONSTRAINT Peli_Pelialusta_fk
FOREIGN KEY (PeliID)
REFERENCES Peli (PeliID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Pisteet ADD CONSTRAINT Peli_Pisteet_fk
FOREIGN KEY (PeliID)
REFERENCES Peli (PeliID)
ON DELETE NO ACTION
ON UPDATE NO ACTION