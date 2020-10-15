-- MySQL Workbench Synchronization
-- Generated: 2020-10-15 19:07
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: estercita

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `m02ex01_modelatge_bbdd_quadres`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_quadres`.`Paint` (
  `paint_id` INT(11) NOT NULL AUTO_INCREMENT,
  `paint_preu` FLOAT(11) NOT NULL,
  `paint_autor` VARCHAR(45) NULL DEFAULT NULL,
  `Buyer_buyer_id` INT(11) NOT NULL,
  PRIMARY KEY (`paint_id`),
  UNIQUE INDEX `Paint_id_UNIQUE` (`paint_id` ASC) VISIBLE,
  INDEX `paint_preu` (`paint_preu` ASC) VISIBLE,
  INDEX `fk_Paint_Buyer1_idx` (`Buyer_buyer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Paint_Buyer1`
    FOREIGN KEY (`Buyer_buyer_id`)
    REFERENCES `m02ex01_modelatge_bbdd_quadres`.`Buyer` (`buyer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_quadres`.`Buyer` (
  `buyer_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada comprador',
  `buyer_nom` VARCHAR(15) NULL DEFAULT NULL COMMENT 'Nom de cada comprador',
  `buyer_cognom` VARCHAR(25) NULL DEFAULT NULL COMMENT 'Cognom de cada comprador',
  `buyer_DNI` VARCHAR(9) NULL DEFAULT NULL COMMENT 'DNI de cada comprador- ha de ser únic.',
  PRIMARY KEY (`buyer_id`),
  UNIQUE INDEX `buyer_DNI_UNIQUE` (`buyer_DNI` ASC) VISIBLE,
  INDEX `buyer_nom` (`buyer_nom` ASC) VISIBLE,
  INDEX `buyer_cognom` (`buyer_cognom` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_quadres`.`Author(QUADRES)` (
  `author_id` INT(11) NOT NULL AUTO_INCREMENT,
  `author_nom` VARCHAR(15) NULL DEFAULT NULL,
  `author_cognom` VARCHAR(25) NULL DEFAULT NULL,
  `author_nacionalitat` VARCHAR(15) NULL DEFAULT NULL,
  `author_naixement` DATE NULL DEFAULT NULL,
  `author_defunció` DATE NULL DEFAULT NULL,
  `author_estil` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  INDEX `author_nom` (`author_nom` ASC) VISIBLE,
  INDEX `author_cognom` (`author_cognom` ASC) VISIBLE,
  INDEX `author_nacionalitat` (`author_nacionalitat` ASC) VISIBLE,
  INDEX `author_estil` (`author_estil` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `m02ex01_modelatge_bbdd_quadres`.`company_has_address` ;

DROP TABLE IF EXISTS `m02ex01_modelatge_bbdd_quadres`.`company` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
