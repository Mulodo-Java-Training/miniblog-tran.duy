-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema miniblog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema miniblog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `miniblog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `miniblog` ;

-- -----------------------------------------------------
-- Table `miniblog`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniblog`.`users` (
  `id` INT(11) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `avatar` VARCHAR(99) NOT NULL,
  `gender` TINYINT(1) NOT NULL DEFAULT 0,
  `birthdate` DATETIME NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `boss` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniblog`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniblog`.`posts` (
  `id` INT(11) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` MEDIUMTEXT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `deactived` TINYINT(1) NOT NULL DEFAULT 0,
  `users_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `users_id`),
  INDEX `fk_posts_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_posts_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `miniblog`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miniblog`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miniblog`.`comments` (
  `id` INT(11) NOT NULL,
  `title` VARCHAR(99) NOT NULL,
  `description` MEDIUMTEXT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `deactived` TINYINT(1) NOT NULL DEFAULT 0,
  `posts_id` INT(11) NOT NULL,
  `users_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `posts_id`, `users_id`),
  INDEX `fk_comments_posts_idx` (`posts_id` ASC),
  INDEX `fk_comments_users1_idx` (`users_id` ASC),
  CONSTRAINT `fk_comments_posts`
    FOREIGN KEY (`posts_id`)
    REFERENCES `miniblog`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `miniblog`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
