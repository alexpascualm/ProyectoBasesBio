-- MySQL Script generated by MySQL Workbench
-- Thu Apr  7 19:08:06 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Toxic
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Toxic` ;

-- -----------------------------------------------------
-- Schema Toxic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Toxic` DEFAULT CHARACTER SET utf8 ;
USE `Toxic` ;

-- -----------------------------------------------------
-- Table `Toxic`.`Animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Toxic`.`Animal` ;

CREATE TABLE IF NOT EXISTS `Toxic`.`Animal` (
  `Nombre` VARCHAR(45) NOT NULL,
  `Origen` VARCHAR(45) NULL,
  `Peso` INT NULL,
  `Nocturno/Diurno` VARCHAR(45) NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;

INSERT INTO `Animal` VALUES ('Rana Dardo', 'Anfibio', 1, 'Nocturna'),('Viuda Negra', 'Bicho', 1, 'Nocturna'),('Escorpion', 'Bicho', 1, 'Nocturna'),('Tarántula', 'Bicho', 1, 'Nocturna'),('Víbora', 'Reptil', 1, 'Nocturna'),('Mamba Negra', 'Reptil', 3, 'Diurna'),('Lince Iberico Mutante', 'Felino', 30, 'Nocturna'),('Bacalao bacano','Marino',7,'Diurno'),('Avispa de mar','Marino',2,'Nocturno'),('Cobra Kai','Reptil',3,'Nocturno'),('Ornitorrinco','Mamifero',6,'Diurno'),('Pulpo Pol','Marino',6,'Diurno'),('La ex del carlos','Simio',59,'Nocturno'),('Lolo','Mamifero',100,'Diurno'),('Gusano de la muerte','Insecto',1,'Nocturno');

-- -----------------------------------------------------
-- Table `Toxic`.`Zona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Toxic`.`Zona` ;

CREATE TABLE IF NOT EXISTS `Toxic`.`Zona` (
  `Nombre` VARCHAR(50) NOT NULL,
  `Clima` VARCHAR(45) NULL,
  PRIMARY KEY (`Nombre`))
ENGINE = InnoDB;

INSERT INTO `Zona` VALUES ('Amazonas','Lluvioso'),('Spain','Soleado'),('Caribe','Tropical'),('Alpes','Extremo'),('Sahara','Desértico'), ('Tailandia','Tropical'),('Webo','Duro');

-- -----------------------------------------------------
-- Table `Toxic`.`Centro_de_Investigacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Toxic`.`Centro_de_Investigacion` ;

CREATE TABLE IF NOT EXISTS `Toxic`.`Centro_de_Investigacion` (
  `Nombre` VARCHAR(45) NOT NULL,
  `Tipo_Servicio` VARCHAR(45) NULL,
  `Zona_Nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`Nombre`),
  INDEX `fk_Centro_de_Investigacion_Zona1_idx` (`Zona_Nombre` ASC) VISIBLE,
  CONSTRAINT `fk_Centro_de_Investigacion_Zona1`
    FOREIGN KEY (`Zona_Nombre`)
    REFERENCES `Toxic`.`Zona` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Centro_de_Investigacion` VALUES ('NaturaSt','Privado','Amazonas'),('BioTox','Privado','Amazonas'),('VenPaCa','Publico','Spain'),('QueCalorCito','Privado','Caribe'),('GalliniceaInvestigadores','Privado','Webo'),('ColdI+d','Privado','Alpes'),('DustInvestigation','Público','Sahara'),('CalimaSharianaST','Privada','Sahara'),('ToxicologyMuayThai','Público','Tailandia');

-- -----------------------------------------------------
-- Table `Toxic`.`Antídoto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Toxic`.`Antídoto` ;

CREATE TABLE IF NOT EXISTS `Toxic`.`Antídoto` (
  `idAntídoto` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `Centro_de_Investigacion_Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAntídoto`),
  INDEX `fk_Antídoto_Centro_de_Investigacion1_idx` (`Centro_de_Investigacion_Nombre` ASC) VISIBLE,
  CONSTRAINT `fk_Antídoto_Centro_de_Investigacion1`
    FOREIGN KEY (`Centro_de_Investigacion_Nombre`)
    REFERENCES `Toxic`.`Centro_de_Investigacion` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Antídoto` VALUES (150,date('2005-03-14'),'NaturaSt'),(151,date('2005-03-17'),'NaturaSt'),(152,date('2010-11-30'),'BioTox'),(153,date('2005-03-14'),'venPaCa'),(154,date('2005-03-14'),'NaturaSt'),(155,date('2020-01-01'),'GalliniceaInvestigadores'),(202,DATE('2002-12-07'),'ColdI+d'),(203,DATE('2005-11-08'),'DustInvestigation'),(204,DATE('2008-05-13'),'ToxicologyMuayThai'),(205,DATE('2002-12-07'),'CalimaSharianaST');

-- -----------------------------------------------------
-- Table `Toxic`.`Venenos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Toxic`.`Venenos` ;

CREATE TABLE IF NOT EXISTS `Toxic`.`Venenos` (
  `idVenenos` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Grado` INT NULL,
  `Animal_Nombre` VARCHAR(45) NOT NULL,
  `Antídoto_idAntídoto` INT NULL,
  PRIMARY KEY (`idVenenos`),
  INDEX `fk_Venenos_Animal1_idx` (`Animal_Nombre` ASC) VISIBLE,
  INDEX `fk_Venenos_Antídoto1_idx` (`Antídoto_idAntídoto` ASC) VISIBLE,
  CONSTRAINT `fk_Venenos_Animal1`
    FOREIGN KEY (`Animal_Nombre`)
    REFERENCES `Toxic`.`Animal` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venenos_Antídoto1`
    FOREIGN KEY (`Antídoto_idAntídoto`)
    REFERENCES `Toxic`.`Antídoto` (`idAntídoto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Venenos` VALUES (77, 'Hemotoxico',10,'Rana Dardo',150),(78, 'Hemotoxico',9,'Viuda Negra',null),(79, 'Neurotóxico',5,'Escorpion',153),(80, 'Hemotoxico',6,'Tarántula',151),(81, 'Hemotoxico',8,'Víbora',154),(82, 'Hemotoxico',10,'Mamba Negra',152),(83, 'Hemotoxico',10,'Lince Iberico Mutante',null),(851,'Neurotóxico',10,'Avispa de mar',202),(850,'Hemotóxico',7,'Bacalao Bacano',null),(852,'Hemotóxico',4,'Cobra Kai',203),(853,'Neurotóxico',2,'Ornitorrinco',205),(854,'Hemotóxico',9,'Pulpo Pol',null),(855,'Hemotóxico',8,'La ex del carlos',204),(856,'Neurotóxico',10,'Lolo',null),(857,'Hemotóxico',1,'Gusano de la muerte',null);

-- -----------------------------------------------------
-- Table `Toxic`.`Investigador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Toxic`.`Investigador` ;

CREATE TABLE IF NOT EXISTS `Toxic`.`Investigador` (
  `DNI` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Estudios` VARCHAR(45) NULL,
  `Centro_de_Investigacion_Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `fk_Investigador_Centro_de_Investigacion1_idx` (`Centro_de_Investigacion_Nombre` ASC) VISIBLE,
  CONSTRAINT `fk_Investigador_Centro_de_Investigacion1`
    FOREIGN KEY (`Centro_de_Investigacion_Nombre`)
    REFERENCES `Toxic`.`Centro_de_Investigacion` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Investigador` vALUES (7532147,'Alberto Redondo','Biología','NaturaSt'),(7532137,'Rosa Melano','Biología','NaturaSt'),(7532127,'Román Olalla','Biólogo','NaturaSt'),(7532117,'Anibal Lekter','Biólogo','BioTox'),(7532107,'Alberto Redondo','Biólogo','BioTox'),(7532157,'José Luis Martinez García','Biólogo','venPaCa'), (7532647,'Francisco Cuesta','Biólogo','venPaCa'), (7532177,'Mohammed Elmansouri','Biólogo','QueCalorCito'),(7538147,'Ash Ketchump','Bioinformático','QueCalorCito'),(7532149,'Chuck Norris','Ingeniero Biomecánico','GalliniceaInvestigadores'),(7542147,'Jeff Bezos','Medicina','GalliniceaInvestigadores'),(253614899,'Dolores Fuertes de la barriga','Ingeniería','ColdI+d'),(523614899,'Dolores Fuertes de la Espalda','Biologia','ColdI+d'),(955614856,'Fernando Alonso','Ingeniería','ToxicologyMuayThay'),(568914899,'Jose antonio Centurion','Bioquimica','ToxicologyMuayThai'),(25468759,'Ibai','Administración','CalimaSharianaST'),(32663459,'Knecro','Biologia','CalimaSharianaST'),(324538759,'Monkey D Garp','Medicina','DustInvestigation'),(324526779,'Monkey D Dragon','Ingenieria','DustInvestigation');

-- -----------------------------------------------------
-- Table `Toxic`.`Habita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Toxic`.`Habita` ;

CREATE TABLE IF NOT EXISTS `Toxic`.`Habita` (
  `Zona_Nombre` VARCHAR(50) NOT NULL,
  `Animal_Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Zona_Nombre`, `Animal_Nombre`),
  INDEX `fk_Habita_Zona1_idx` (`Zona_Nombre` ASC) VISIBLE,
  INDEX `fk_Habita_Animal1_idx` (`Animal_Nombre` ASC) VISIBLE,
  CONSTRAINT `fk_Habita_Zona1`
    FOREIGN KEY (`Zona_Nombre`)
    REFERENCES `Toxic`.`Zona` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Habita_Animal1`
    FOREIGN KEY (`Animal_Nombre`)
    REFERENCES `Toxic`.`Animal` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `Habita` values ('Amazonas','Rana Dardo'),('Amazonas','Viuda Negra'),('Spain','Lince Iberico Mutante'),('Sahara','Escorpion'),('Tailandia','Tarántula'),('Spain','Víbora'),('Tailandia','Mamba Negra'),('Spain','Escorpion'),('Caribe','Tarántula'),('Tailandia','Bacalao Bacano'),('Tailandia','Avispa de mar'),('Tailandia','Cobra Kai'),('Sahara','Ornitorrinco'),('Spain','Pulpo Pol'),('Sahara','La ex del carlos'),('Alpes','Lolo'),('Tailandia','Gusana de la muerte');
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
