-- MySQL Script generated by MySQL Workbench
-- Sun Dec 30 00:54:58 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema movie
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema movie
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movie` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `movie` ;

-- -----------------------------------------------------
-- Table `movie`.`movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`movie` ;

CREATE TABLE IF NOT EXISTS `movie`.`movie` (
  `id` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `date` INT NULL,
  `imdb` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
  `rate` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
  `name` VARCHAR(300) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`director` ;

CREATE TABLE IF NOT EXISTS `movie`.`director` (
  `id` INT NOT NULL,
  `name` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`actor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`actor` ;

CREATE TABLE IF NOT EXISTS `movie`.`actor` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`producer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`producer` ;

CREATE TABLE IF NOT EXISTS `movie`.`producer` (
  `id` INT NOT NULL,
  `name` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`language` ;

CREATE TABLE IF NOT EXISTS `movie`.`language` (
  `id` INT NOT NULL,
  `type` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`comment` ;

CREATE TABLE IF NOT EXISTS `movie`.`comment` (
  `id` INT NOT NULL,
  `summary` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
  `movie_id` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `score` DOUBLE NULL,
  `time` TIMESTAMP NULL,
  `helpfulness` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_comment_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie`.`movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_comment_movie1_idx` ON `movie`.`comment` (`movie_id` ASC);


-- -----------------------------------------------------
-- Table `movie`.`format`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`format` ;

CREATE TABLE IF NOT EXISTS `movie`.`format` (
  `id` INT NOT NULL,
  `type` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`movie_has_format`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`movie_has_format` ;

CREATE TABLE IF NOT EXISTS `movie`.`movie_has_format` (
  `movie_id` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `format_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `format_id`),
  CONSTRAINT `fk_movie_has_format_format1`
    FOREIGN KEY (`format_id`)
    REFERENCES `movie`.`format` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_format_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie`.`movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_movie_has_format_movie1_idx` ON `movie`.`movie_has_format` (`movie_id` ASC);


-- -----------------------------------------------------
-- Table `movie`.`actor_act_movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`actor_act_movie` ;

CREATE TABLE IF NOT EXISTS `movie`.`actor_act_movie` (
  `movie_id` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `actor_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `actor_id`),
  CONSTRAINT `fk_actor_act_movie_actor1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `movie`.`actor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actor_act_movie_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie`.`movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_actor_act_movie_movie1_idx` ON `movie`.`actor_act_movie` (`movie_id` ASC);


-- -----------------------------------------------------
-- Table `movie`.`director_direct_movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`director_direct_movie` ;

CREATE TABLE IF NOT EXISTS `movie`.`director_direct_movie` (
  `movie_id` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `director_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `director_id`),
  CONSTRAINT `fk_director_direct_movie_director`
    FOREIGN KEY (`director_id`)
    REFERENCES `movie`.`director` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_director_direct_movie_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie`.`movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_director_direct_movie_movie1_idx` ON `movie`.`director_direct_movie` (`movie_id` ASC);


-- -----------------------------------------------------
-- Table `movie`.`producer_produce_movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`producer_produce_movie` ;

CREATE TABLE IF NOT EXISTS `movie`.`producer_produce_movie` (
  `movie_id` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `producer_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `producer_id`),
  CONSTRAINT `fk_producer_produce_movie_producer1`
    FOREIGN KEY (`producer_id`)
    REFERENCES `movie`.`producer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producer_produce_movie_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie`.`movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_producer_produce_movie_producer1_idx` ON `movie`.`producer_produce_movie` (`producer_id` ASC);

CREATE INDEX `fk_producer_produce_movie_movie1_idx` ON `movie`.`producer_produce_movie` (`movie_id` ASC);


-- -----------------------------------------------------
-- Table `movie`.`studio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`studio` ;

CREATE TABLE IF NOT EXISTS `movie`.`studio` (
  `id` INT NOT NULL,
  `name` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`studio_sponsor_movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`studio_sponsor_movie` ;

CREATE TABLE IF NOT EXISTS `movie`.`studio_sponsor_movie` (
  `movie_id` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `studio_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `studio_id`),
  CONSTRAINT `fk_studio_sponsor_movie_studio1`
    FOREIGN KEY (`studio_id`)
    REFERENCES `movie`.`studio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_studio_sponsor_movie_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie`.`movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_studio_sponsor_movie_studio1_idx` ON `movie`.`studio_sponsor_movie` (`studio_id` ASC);

CREATE INDEX `fk_studio_sponsor_movie_movie1_idx` ON `movie`.`studio_sponsor_movie` (`movie_id` ASC);


-- -----------------------------------------------------
-- Table `movie`.`movie_has_language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`movie_has_language` ;

CREATE TABLE IF NOT EXISTS `movie`.`movie_has_language` (
  `movie_id` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `language_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `language_id`),
  CONSTRAINT `fk_movie_has_language_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `movie`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_language_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie`.`movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_movie_has_language_language1_idx` ON `movie`.`movie_has_language` (`language_id` ASC);

CREATE INDEX `fk_movie_has_language_movie1_idx` ON `movie`.`movie_has_language` (`movie_id` ASC);


-- -----------------------------------------------------
-- Table `movie`.`writer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`writer` ;

CREATE TABLE IF NOT EXISTS `movie`.`writer` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`writer_write_movies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`writer_write_movies` ;

CREATE TABLE IF NOT EXISTS `movie`.`writer_write_movies` (
  `movie_id` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `writer_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `writer_id`),
  CONSTRAINT `fk_movie_has_writer_writer1`
    FOREIGN KEY (`writer_id`)
    REFERENCES `movie`.`writer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_writer_write_movies_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie`.`movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_movie_has_writer_writer1_idx` ON `movie`.`writer_write_movies` (`writer_id` ASC);

CREATE INDEX `fk_writer_write_movies_movie1_idx` ON `movie`.`writer_write_movies` (`movie_id` ASC);


-- -----------------------------------------------------
-- Table `movie`.`subtitle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`subtitle` ;

CREATE TABLE IF NOT EXISTS `movie`.`subtitle` (
  `id` INT NOT NULL,
  `language` VARCHAR(150) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `movie`.`movie_has_subtitle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`movie_has_subtitle` ;

CREATE TABLE IF NOT EXISTS `movie`.`movie_has_subtitle` (
  `movie_id` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `subtitle_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `subtitle_id`),
  CONSTRAINT `fk_movie_has_subtitle_subtitle1`
    FOREIGN KEY (`subtitle_id`)
    REFERENCES `movie`.`subtitle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_subtitle_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie`.`movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_movie_has_subtitle_subtitle1_idx` ON `movie`.`movie_has_subtitle` (`subtitle_id` ASC);

CREATE INDEX `fk_movie_has_subtitle_movie1_idx` ON `movie`.`movie_has_subtitle` (`movie_id` ASC);


-- -----------------------------------------------------
-- Table `movie`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`user` ;

CREATE TABLE IF NOT EXISTS `movie`.`user` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL,
  `comment_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `movie`.`comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_user_comment1_idx` ON `movie`.`user` (`comment_id` ASC);


-- -----------------------------------------------------
-- Table `movie`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`genre` ;

CREATE TABLE IF NOT EXISTS `movie`.`genre` (
  `id` INT NOT NULL,
  `type` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`.`movie_has_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`movie_has_genre` ;

CREATE TABLE IF NOT EXISTS `movie`.`movie_has_genre` (
  `movie_id` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `genre_id`),
  CONSTRAINT `fk_movie_has_genre_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie`.`movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_genre_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `movie`.`genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_movie_has_genre_genre1_idx` ON `movie`.`movie_has_genre` (`genre_id` ASC);

CREATE INDEX `fk_movie_has_genre_movie1_idx` ON `movie`.`movie_has_genre` (`movie_id` ASC);


-- -----------------------------------------------------
-- Table `movie`.`star_starring_movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie`.`star_starring_movie` ;

CREATE TABLE IF NOT EXISTS `movie`.`star_starring_movie` (
  `movie_id` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `actor_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `actor_id`),
  CONSTRAINT `fk_movie_has_actor_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie`.`movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_actor_actor1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `movie`.`actor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_movie_has_actor_actor1_idx` ON `movie`.`star_starring_movie` (`actor_id` ASC);

CREATE INDEX `fk_movie_has_actor_movie1_idx` ON `movie`.`star_starring_movie` (`movie_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
