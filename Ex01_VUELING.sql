-- MySQL Workbench Synchronization
-- Generated: 2020-10-15 19:01
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: estercita

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `m02ex01_modelatge_bbdd_vueling`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_vueling`.`Plane` (
  `plane_ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'id de cada seient (per enumerar cada registre).',
  `plane_model` VARCHAR(45) NULL DEFAULT NULL COMMENT 'model de cada avió',
  `plane_capacitat` INT(11) NULL DEFAULT NULL COMMENT 'número de persones que hi caben',
  PRIMARY KEY (`plane_ID`),
  INDEX `plane_model` (`plane_model` ASC) VISIBLE,
  INDEX `plane_capacitat` (`plane_capacitat` ASC) VISIBLE,
  UNIQUE INDEX `plane_ID_UNIQUE` (`plane_ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_vueling`.`Seat` (
  `seat_ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'id de cada seient (per enumerar cada registre).',
  `Plane_plane_ID` INT(11) NOT NULL,
  PRIMARY KEY (`seat_ID`),
  UNIQUE INDEX `Seat_ID_UNIQUE` (`seat_ID` ASC) VISIBLE,
  INDEX `fk_Seat_Plane_idx` (`Plane_plane_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Seat_Plane`
    FOREIGN KEY (`Plane_plane_ID`)
    REFERENCES `m02ex01_modelatge_bbdd_vueling`.`Plane` (`plane_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_vueling`.`Model` (
  `model_id` INT(11) NOT NULL AUTO_INCREMENT,
  `model_LCombustible` INT(11) NULL DEFAULT NULL COMMENT 'Quants L de combustible utilitza per km.',
  `model_AnyFabricació` YEAR NULL DEFAULT NULL COMMENT 'Any de fabricació en 4 xifres.',
  `model_CiutatFabricació` VARCHAR(15) NULL DEFAULT NULL COMMENT 'Ciutat de fabricació, paraula sencera.',
  PRIMARY KEY (`model_id`),
  UNIQUE INDEX `model_id_UNIQUE` (`model_id` ASC) VISIBLE,
  INDEX `model_LComb` USING BTREE (`model_LCombustible`) VISIBLE,
  INDEX `model_AnyFab` (`model_AnyFabricació` ASC) VISIBLE,
  INDEX `model_CiutatFab` (`model_CiutatFabricació` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
