-- MySQL Workbench Synchronization
-- Generated: 2020-10-15 19:30
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: estercita

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `m02ex01_modelatge_bbdd_culampolla`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_culampolla`.`Employee` (
  `employee_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Conté l\'id de cada empleat.',
  `employee_nom` VARCHAR(15) NOT NULL COMMENT 'Conté el nom de cada empleat.',
  `employee_cognom` VARCHAR(40) NOT NULL COMMENT 'Conté el cognom de cada empleat.',
  `employee_antiguitat` DATE NOT NULL COMMENT 'Conté la data d\'incorporació a l\'empresa de cada empleat.',
  PRIMARY KEY (`employee_id`),
  INDEX `employee_antiguitat` (`employee_antiguitat` ASC) VISIBLE,
  INDEX `employee_cognom` (`employee_cognom` ASC) VISIBLE,
  INDEX `employee_nom` (`employee_nom` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_culampolla`.`Glasses` (
  `glasses_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Conté l\'id de cada ullera.',
  `glasses_graduació_esquerre` FLOAT(11) NOT NULL COMMENT 'Conté la graduació del vidre esquerre de cada ullera.',
  `glasses_graduació_dret` FLOAT(11) NOT NULL COMMENT 'Conté la graduació del vidre dret de cada ullera.',
  `glasses_tipus_montura` VARCHAR(1) NOT NULL COMMENT 'Possibles Valors:\nF = flotant\nP = pasta\nM = Metàl·lica',
  `glasses_color_montura` VARCHAR(15) NOT NULL COMMENT 'Conté el color de la montura de cada ullera.',
  `glasses_color_vidre_esquerre` VARCHAR(1) NOT NULL COMMENT 'Possibles Valors:\nD = per defecte\nT = transparent\nV = verd\nB = blau\nG = gris\nM = marró',
  `glasses_color_vidre_dret` VARCHAR(1) NOT NULL COMMENT 'Possibles Valors:\nD = per defecte\nT = transparent\nV = verd\nB = blau\nG = gris\nM = marró',
  `glasses_preu` FLOAT(11) NOT NULL COMMENT 'Conté el preu cada ullera.',
  `Brand_brand_id` INT(11) NOT NULL COMMENT 'Conté l\'id de la marca de cada ullera.',
  `Provider_provider_id` INT(11) NOT NULL COMMENT 'Conté l\'id del proveïdor de cada ullera.',
  `Employee_employee_id` INT(11) NOT NULL COMMENT 'Conté l\'id de l\'empleat que ha venut cada ullera.',
  PRIMARY KEY (`glasses_id`),
  INDEX `fk_Glasses_Employee1_idx` (`Employee_employee_id` ASC) VISIBLE,
  INDEX `fk_Glasses_Brand1_idx` (`Brand_brand_id` ASC) VISIBLE,
  INDEX `fk_Glasses_Provider1_idx` (`Provider_provider_id` ASC) VISIBLE,
  INDEX `glasses_tipus_montura` (`glasses_tipus_montura` ASC) VISIBLE,
  INDEX `glasses_color_montura` (`glasses_color_montura` ASC) VISIBLE,
  INDEX `glasses_preu` (`glasses_preu` ASC) VISIBLE,
  CONSTRAINT `fk_Glasses_Employee1`
    FOREIGN KEY (`Employee_employee_id`)
    REFERENCES `m02ex01_modelatge_bbdd_culampolla`.`Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Brand1`
    FOREIGN KEY (`Brand_brand_id`)
    REFERENCES `m02ex01_modelatge_bbdd_culampolla`.`Brand` (`brand_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_Provider1`
    FOREIGN KEY (`Provider_provider_id`)
    REFERENCES `m02ex01_modelatge_bbdd_culampolla`.`Provider` (`provider_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_culampolla`.`Brand` (
  `brand_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Conté l\'id de cada marca.',
  `brand_name` VARCHAR(45) NULL DEFAULT NULL COMMENT 'Conté el nom de cada marca.',
  `Provider_provider_id` INT(11) NOT NULL COMMENT 'Conté l\'id del proveïdor de cada marca.',
  PRIMARY KEY (`brand_id`),
  INDEX `fk_Brand_Provider1_idx` (`Provider_provider_id` ASC) VISIBLE,
  INDEX `brand_name` (`brand_name` ASC) VISIBLE,
  CONSTRAINT `fk_Brand_Provider1`
    FOREIGN KEY (`Provider_provider_id`)
    REFERENCES `m02ex01_modelatge_bbdd_culampolla`.`Provider` (`provider_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_culampolla`.`Provider` (
  `provider_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Conté l\'id de cada proveïdor.',
  `provider_nom` VARCHAR(45) NOT NULL COMMENT 'Conté el nom de cada proveïdor.',
  `provider_telèfon` VARCHAR(20) NOT NULL COMMENT 'Conté el telèfon de cada proveïdor.',
  `provider_fax` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Conté el fax de cada proveïdor.',
  `provider_NIF` VARCHAR(10) NOT NULL COMMENT 'Conté el NIF de cada proveïdor.',
  PRIMARY KEY (`provider_id`),
  UNIQUE INDEX `provider_NIF_UNIQUE` (`provider_NIF` ASC) VISIBLE,
  INDEX `provider_nom` (`provider_nom` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_culampolla`.`Address` (
  `address_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Conté l\'id de cada adreça.',
  `address_carrer` VARCHAR(45) NOT NULL COMMENT 'Conté el carrer de cada adreça.',
  `address_número` INT(11) NOT NULL COMMENT 'Conté el número de carrer de cada adreça.',
  `address_pis` INT(11) NULL DEFAULT NULL COMMENT 'Conté el pis de cada adreça.',
  `address_porta` VARCHAR(3) NULL DEFAULT NULL COMMENT 'Conté la porta de cada adreça.',
  `address_ciutat` VARCHAR(25) NOT NULL COMMENT 'Conté la ciutat de cada adreça.',
  `address_CP` VARCHAR(5) NOT NULL COMMENT 'Conté el codi postal de cada adreça.',
  `address_país` VARCHAR(25) NOT NULL COMMENT 'Conté el país de cada adreça.',
  PRIMARY KEY (`address_id`),
  INDEX `address_ciutat` (`address_ciutat` ASC) VISIBLE,
  INDEX `address_país` (`address_país` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_culampolla`.`Client_CA` (
  `client_CA_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Conté l\'id de cada usuari.',
  `client_CA_nom` VARCHAR(25) NOT NULL COMMENT 'Conté el nom de cada usuari.',
  `client_CA_cognom` VARCHAR(60) NOT NULL COMMENT 'Conté el cognom de cada usuari.',
  `client_CA_telèfon` VARCHAR(20) NOT NULL COMMENT 'Conté el telèfon de cada usuari.',
  `client_CA_email` VARCHAR(60) NOT NULL COMMENT 'Conté l\'email de cada usuari.',
  `client_CA_registre` DATE NOT NULL COMMENT 'Conté la data de registre.',
  `client_CA_recomanació` INT(11) NULL DEFAULT NULL COMMENT 'Conté l\'id del client que li ha recomanat l\'establiment (sempre i quan algú li hagi recomanat)',
  PRIMARY KEY (`client_CA_id`),
  INDEX `client_CA_nom` (`client_CA_nom` ASC) VISIBLE,
  INDEX `client_CA_cognom` (`client_CA_cognom` ASC) VISIBLE,
  INDEX `client_CA_telèfon` (`client_CA_telèfon` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_culampolla`.`client_CA_has_address` (
  `client_CA_has_address_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Conté l\'id de cada adreça de cada client.',
  `Client_CA_client_CA_id` INT(11) NOT NULL COMMENT 'Conté l\'id de cada client.',
  `Address_address_id` INT(11) NOT NULL COMMENT 'Conté l\'id de cada adreça.',
  PRIMARY KEY (`client_CA_has_address_id`, `Client_CA_client_CA_id`),
  INDEX `fk_client_CA_has_address_Client_CA1_idx` (`Client_CA_client_CA_id` ASC) VISIBLE,
  INDEX `fk_client_CA_has_address_Address1_idx` (`Address_address_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_CA_has_address_Client_CA1`
    FOREIGN KEY (`Client_CA_client_CA_id`)
    REFERENCES `m02ex01_modelatge_bbdd_culampolla`.`Client_CA` (`client_CA_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_client_CA_has_address_Address1`
    FOREIGN KEY (`Address_address_id`)
    REFERENCES `m02ex01_modelatge_bbdd_culampolla`.`Address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_culampolla`.`provider_has_address` (
  `provider_has_address_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Conté l\'id de cada adreça de cada proveïdor.',
  `Provider_provider_id` INT(11) NOT NULL COMMENT 'Conté l\'id de cada proveïdor.',
  `Address_address_id` INT(11) NOT NULL COMMENT 'Conté l\'id de cada adreça.',
  PRIMARY KEY (`provider_has_address_id`, `Provider_provider_id`),
  INDEX `fk_provider_has_address_Provider1_idx` (`Provider_provider_id` ASC) VISIBLE,
  INDEX `fk_provider_has_address_Address1_idx` (`Address_address_id` ASC) VISIBLE,
  CONSTRAINT `fk_provider_has_address_Provider1`
    FOREIGN KEY (`Provider_provider_id`)
    REFERENCES `m02ex01_modelatge_bbdd_culampolla`.`Provider` (`provider_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_provider_has_address_Address1`
    FOREIGN KEY (`Address_address_id`)
    REFERENCES `m02ex01_modelatge_bbdd_culampolla`.`Address` (`address_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
