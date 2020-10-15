-- MySQL Workbench Synchronization
-- Generated: 2020-10-15 19:23
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: estercita

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `m02ex01_modelatge_bbdd_amazon`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_amazon`.`Book_catalogue` (
  `book_catalogue_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada llibre',
  `book_catalogue_unitats_dispo` INT(11) NULL DEFAULT NULL COMMENT 'Quantitat disponible de cada llibre.',
  `book_catalogue_preu` FLOAT(11) NOT NULL COMMENT 'Preu de cada llibre, en decimals.',
  `author_author_id` INT(11) NOT NULL,
  `book_catalogue_títol` VARCHAR(30) NOT NULL COMMENT 'Títol del llibre.',
  PRIMARY KEY (`book_catalogue_id`, `book_catalogue_preu`),
  INDEX `fk_Book_catalogue_author1_idx` (`author_author_id` ASC) VISIBLE,
  INDEX `book_catalogue_títol` (`book_catalogue_títol` ASC) VISIBLE,
  CONSTRAINT `fk_Book_catalogue_author1`
    FOREIGN KEY (`author_author_id`)
    REFERENCES `m02ex01_modelatge_bbdd_amazon`.`Author_amazon` (`author_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_amazon`.`Bill` (
  `bill_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Número de factura.',
  `Client_client_id` INT(11) NOT NULL,
  `Author_author_id` INT(11) NOT NULL COMMENT 'L\'identificador de cada autor.',
  `Book_catalogue_book_catalogue_id` INT(11) NOT NULL,
  `Book_catalogue_book_catalogue_preu` FLOAT(11) NOT NULL,
  PRIMARY KEY (`bill_id`),
  INDEX `fk_Bill_Author1_idx` (`Author_author_id` ASC) VISIBLE,
  INDEX `fk_Bill_Book_catalogue_idx` (`Book_catalogue_book_catalogue_id` ASC, `Book_catalogue_book_catalogue_preu` ASC) VISIBLE,
  INDEX `fk_Bill_Client1_idx` (`Client_client_id` ASC) VISIBLE,
  INDEX `bill_preu` (`Book_catalogue_book_catalogue_preu` ASC) VISIBLE,
  INDEX `bill_book` (`Book_catalogue_book_catalogue_id` ASC) VISIBLE,
  CONSTRAINT `fk_Bill_Author1`
    FOREIGN KEY (`Author_author_id`)
    REFERENCES `m02ex01_modelatge_bbdd_amazon`.`Author_amazon` (`author_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bill_Book_catalogue1`
    FOREIGN KEY (`Book_catalogue_book_catalogue_id` , `Book_catalogue_book_catalogue_preu`)
    REFERENCES `m02ex01_modelatge_bbdd_amazon`.`Book_catalogue` (`book_catalogue_id` , `book_catalogue_preu`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Bill_Client1`
    FOREIGN KEY (`Client_client_id`)
    REFERENCES `m02ex01_modelatge_bbdd_amazon`.`Client_AZ` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_amazon`.`Author_amazon` (
  `author_id` INT(11) NOT NULL AUTO_INCREMENT,
  `author_nom` VARCHAR(25) NOT NULL,
  `author_cognom` VARCHAR(45) NOT NULL,
  `author_direcció` VARCHAR(45) NOT NULL,
  `author_llibres_escrits` INT(11) NOT NULL,
  PRIMARY KEY (`author_id`),
  INDEX `author_nom` (`author_nom` ASC) VISIBLE,
  INDEX `author_cognom` (`author_cognom` ASC) VISIBLE,
  INDEX `author_llibres_escrits` (`author_llibres_escrits` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_amazon`.`Client_AZ` (
  `client_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada usuari.',
  `client_nom` VARCHAR(40) NOT NULL COMMENT 'Nom d\'usuari. Haurà de ser únic.',
  `client_email` VARCHAR(30) NOT NULL COMMENT 'Email d\'usuari. Haurà de ser única.',
  `client_contrassenya` VARCHAR(20) NOT NULL COMMENT 'Contrassenya d\'usuari. No cal que sigui única. ',
  PRIMARY KEY (`client_id`),
  UNIQUE INDEX `client_nom_UNIQUE` (`client_nom` ASC) VISIBLE,
  UNIQUE INDEX `client_email_UNIQUE` (`client_email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
