-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sge_jhonatan
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sge_jhonatan` ;

-- -----------------------------------------------------
-- Schema sge_jhonatan
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sge_jhonatan` ;
USE `sge_jhonatan` ;

-- -----------------------------------------------------
-- Table `sge_jhonatan`.`professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_jhonatan`.`professor` ;

CREATE TABLE IF NOT EXISTS `sge_jhonatan`.`professor` (
  `idprofessor` INT NOT NULL,
  `E-mail` VARCHAR(45) NULL,
  `Nome` VARCHAR(45) NULL,
  `Especialiação` VARCHAR(45) NULL,
  PRIMARY KEY (`idprofessor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge_jhonatan`.`disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_jhonatan`.`disciplina` ;

CREATE TABLE IF NOT EXISTS `sge_jhonatan`.`disciplina` (
  `iddisciplina` INT NOT NULL,
  `Ano` INT NULL,
  `Cod_disciplina` VARCHAR(45) NULL,
  `Cargo_horário` INT NULL,
  PRIMARY KEY (`iddisciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge_jhonatan`.`turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_jhonatan`.`turma` ;

CREATE TABLE IF NOT EXISTS `sge_jhonatan`.`turma` (
  `idturma` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Ano` VARCHAR(45) NULL,
  `disciplina_iddisciplina` INT NOT NULL,
  `disciplina_iddisciplina1` INT NOT NULL,
  `aluno_idaluno` INT NOT NULL,
  PRIMARY KEY (`idturma`, `disciplina_iddisciplina1`, `aluno_idaluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge_jhonatan`.`aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_jhonatan`.`aluno` ;

CREATE TABLE IF NOT EXISTS `sge_jhonatan`.`aluno` (
  `idaluno` INT NOT NULL,
  `Alunocol` VARCHAR(45) NULL,
  `Dt_nascimento` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `E-mail` VARCHAR(45) NULL,
  `turma_idturma` VARCHAR(45) NULL,
  `turma_idturma1` INT NOT NULL,
  PRIMARY KEY (`idaluno`, `turma_idturma1`),
  INDEX `fk_aluno_turma_idx` (`turma_idturma1` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_turma`
    FOREIGN KEY (`turma_idturma1`)
    REFERENCES `sge_jhonatan`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge_jhonatan`.`turma_has_disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_jhonatan`.`turma_has_disciplina` ;

CREATE TABLE IF NOT EXISTS `sge_jhonatan`.`turma_has_disciplina` (
  `turma_idturma` INT NOT NULL,
  `disciplina_iddisciplina` INT NOT NULL,
  PRIMARY KEY (`turma_idturma`, `disciplina_iddisciplina`),
  INDEX `fk_turma_has_disciplina_disciplina1_idx` (`disciplina_iddisciplina` ASC) VISIBLE,
  INDEX `fk_turma_has_disciplina_turma1_idx` (`turma_idturma` ASC) VISIBLE,
  CONSTRAINT `fk_turma_has_disciplina_turma1`
    FOREIGN KEY (`turma_idturma`)
    REFERENCES `sge_jhonatan`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_iddisciplina`)
    REFERENCES `sge_jhonatan`.`disciplina` (`iddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge_jhonatan`.`turma_has_professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_jhonatan`.`turma_has_professor` ;

CREATE TABLE IF NOT EXISTS `sge_jhonatan`.`turma_has_professor` (
  `turma_idturma` INT NOT NULL,
  `professor_idprofessor` INT NOT NULL,
  PRIMARY KEY (`turma_idturma`, `professor_idprofessor`),
  INDEX `fk_turma_has_professor_professor1_idx` (`professor_idprofessor` ASC) VISIBLE,
  INDEX `fk_turma_has_professor_turma1_idx` (`turma_idturma` ASC) VISIBLE,
  CONSTRAINT `fk_turma_has_professor_turma1`
    FOREIGN KEY (`turma_idturma`)
    REFERENCES `sge_jhonatan`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_has_professor_professor1`
    FOREIGN KEY (`professor_idprofessor`)
    REFERENCES `sge_jhonatan`.`professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sge_jhonatan`.`professor_has_disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sge_jhonatan`.`professor_has_disciplina` ;

CREATE TABLE IF NOT EXISTS `sge_jhonatan`.`professor_has_disciplina` (
  `professor_idprofessor` INT NOT NULL,
  `disciplina_iddisciplina` INT NOT NULL,
  PRIMARY KEY (`professor_idprofessor`, `disciplina_iddisciplina`),
  INDEX `fk_professor_has_disciplina_disciplina1_idx` (`disciplina_iddisciplina` ASC) VISIBLE,
  INDEX `fk_professor_has_disciplina_professor1_idx` (`professor_idprofessor` ASC) VISIBLE,
  CONSTRAINT `fk_professor_has_disciplina_professor1`
    FOREIGN KEY (`professor_idprofessor`)
    REFERENCES `sge_jhonatan`.`professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_iddisciplina`)
    REFERENCES `sge_jhonatan`.`disciplina` (`iddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
