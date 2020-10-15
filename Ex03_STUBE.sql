-- MySQL Workbench Synchronization
-- Generated: 2020-10-15 19:09
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: estercita

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `m02ex01_modelatge_bbdd_stube`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_stube`.`User` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'L\'id del registre',
  `user_email` VARCHAR(40) NOT NULL COMMENT 'L\'email de cada usuari. Ha de ser únic.',
  `user_contrassenya` VARCHAR(20) NOT NULL COMMENT 'La contrassenya de cada usuari. Ha de ser única (faltaria saber com posar un nombre mínim de caràcters).',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC) VISIBLE,
  UNIQUE INDEX `user_contrassenya_UNIQUE` (`user_contrassenya` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_stube`.`Video` (
  `video_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'L\'id del registre',
  `video_descripció` VARCHAR(2000) NOT NULL COMMENT 'Descripció de cada vídeo. Màxim 2.000 caràcters.',
  `video_títol` VARCHAR(80) NOT NULL COMMENT 'Títol del vídeo. Màxim 80 caràcters. ',
  `video_url` VARCHAR(60) NOT NULL COMMENT 'Url de cada vídeo. Serà la suma de la URL de la web Stube+l\'identificador únic de cada vídeo. ',
  `video_identificador` VARCHAR(20) NOT NULL COMMENT 'Identificador únic de cada vídeo. L\'unirem al final de la URL de la web Stube per formar la URL única de cada vídeo. ',
  `User_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`video_id`),
  UNIQUE INDEX `video_identificador_UNIQUE` (`video_identificador` ASC) VISIBLE,
  INDEX `video_títol` (`video_títol` ASC) VISIBLE,
  INDEX `fk_Video_User1_idx` (`User_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Video_User1`
    FOREIGN KEY (`User_user_id`)
    REFERENCES `m02ex01_modelatge_bbdd_stube`.`User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
