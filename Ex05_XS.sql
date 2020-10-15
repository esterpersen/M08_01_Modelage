-- MySQL Workbench Synchronization
-- Generated: 2020-10-15 19:28
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: estercita

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `m02ex01_modelatge_bbdd_xs`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_xs`.`User_xs` (
  `user_xs_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Conté el número de registre de cada usuari.',
  `user_xs_nom` VARCHAR(25) NOT NULL COMMENT 'Conté el nom de cada usuari. Valor únic per no confondre usuaris.',
  `user_xs_mail` VARCHAR(35) NOT NULL COMMENT 'Conté el mail de cada usuari. Valor únic per no confondre usuaris.',
  `user_xs_contrassenya` VARCHAR(20) NOT NULL COMMENT 'Conté la contrassenya de cada usuari. ',
  PRIMARY KEY (`user_xs_id`),
  UNIQUE INDEX `user_xs_mail_UNIQUE` (`user_xs_mail` ASC) VISIBLE,
  UNIQUE INDEX `user_xs_nom_UNIQUE` (`user_xs_nom` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_xs`.`Photo` (
  `photo_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Conté el número de registre de cada foto.',
  `photo_lloc` VARCHAR(40) NULL DEFAULT NULL COMMENT 'Adreça de la foto. Es pot deixar en blanc. ',
  `photo_url_foto` VARCHAR(45) NOT NULL COMMENT 'Url d\'on està emmagatzemada la foto. Serà un link acabat en .img',
  `photo_descripció` VARCHAR(2000) NULL DEFAULT NULL COMMENT 'Descripció o comentari de la foto.',
  `User_xs_user_xs_id` INT(11) NOT NULL,
  PRIMARY KEY (`photo_id`),
  UNIQUE INDEX `photo_url_foto_UNIQUE` (`photo_url_foto` ASC) VISIBLE,
  INDEX `fk_Photo_User_xs1_idx` (`User_xs_user_xs_id` ASC) VISIBLE,
  CONSTRAINT `fk_Photo_User_xs1`
    FOREIGN KEY (`User_xs_user_xs_id`)
    REFERENCES `m02ex01_modelatge_bbdd_xs`.`User_xs` (`user_xs_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_xs`.`Friendship` (
  `friendship_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Conté el número de registre de cada amistat.',
  `User_xs_user_xs_id2` INT(11) NOT NULL,
  `User_xs_user_xs_id` INT(11) NOT NULL,
  `Relationship_relationship_id` INT(11) NOT NULL,
  PRIMARY KEY (`friendship_id`),
  INDEX `fk_Friendship_User_xs1_idx` (`User_xs_user_xs_id2` ASC) VISIBLE,
  INDEX `fk_Friendship_User_xs2_idx` (`User_xs_user_xs_id` ASC) VISIBLE,
  INDEX `fk_Friendship_Relationship1_idx` (`Relationship_relationship_id` ASC) VISIBLE,
  CONSTRAINT `fk_Friendship_User_xs1`
    FOREIGN KEY (`User_xs_user_xs_id2`)
    REFERENCES `m02ex01_modelatge_bbdd_xs`.`User_xs` (`user_xs_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Friendship_User_xs2`
    FOREIGN KEY (`User_xs_user_xs_id`)
    REFERENCES `m02ex01_modelatge_bbdd_xs`.`User_xs` (`user_xs_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Friendship_Relationship1`
    FOREIGN KEY (`Relationship_relationship_id`)
    REFERENCES `m02ex01_modelatge_bbdd_xs`.`Relationship` (`relationship_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `m02ex01_modelatge_bbdd_xs`.`Relationship` (
  `relationship_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Conté el número de registre de cada relació.',
  `relationship_nom` VARCHAR(15) NOT NULL COMMENT 'Nom de cada tipus de relació. No pot estar en blanc.',
  PRIMARY KEY (`relationship_id`),
  UNIQUE INDEX `relationship_nom_UNIQUE` (`relationship_nom` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
