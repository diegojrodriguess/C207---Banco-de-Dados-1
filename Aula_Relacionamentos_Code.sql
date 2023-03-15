-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Escola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Escola` (
  `idEscola` INT NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`idEscola`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diretor` (
  `idDiretor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `Escola_idEscola` INT NOT NULL,
  PRIMARY KEY (`idDiretor`),
  INDEX `fk_Diretor_Escola_idx` (`Escola_idEscola` ASC) VISIBLE,
  CONSTRAINT `fk_Diretor_Escola`
    FOREIGN KEY (`Escola_idEscola`)
    REFERENCES `mydb`.`Escola` (`idEscola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Escritor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Escritor` (
  `idEscritor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEscritor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Livro` (
  `idLivro` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `numero_pag` INT NULL,
  `Escritor_idEscritor` INT NOT NULL,
  PRIMARY KEY (`idLivro`),
  INDEX `fk_Livro_Escritor1_idx` (`Escritor_idEscritor` ASC) VISIBLE,
  CONSTRAINT `fk_Livro_Escritor1`
    FOREIGN KEY (`Escritor_idEscritor`)
    REFERENCES `mydb`.`Escritor` (`idEscritor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Filme` (
  `idFilme` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `diretor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFilme`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ator` (
  `idAtor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NULL,
  PRIMARY KEY (`idAtor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Atuar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Atuar` (
  `Filme_idFilme` INT NOT NULL,
  `Ator_idAtor` INT NOT NULL,
  PRIMARY KEY (`Filme_idFilme`, `Ator_idAtor`),
  INDEX `fk_Filme_has_Ator_Ator1_idx` (`Ator_idAtor` ASC) VISIBLE,
  INDEX `fk_Filme_has_Ator_Filme1_idx` (`Filme_idFilme` ASC) VISIBLE,
  CONSTRAINT `fk_Filme_has_Ator_Filme1`
    FOREIGN KEY (`Filme_idFilme`)
    REFERENCES `mydb`.`Filme` (`idFilme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filme_has_Ator_Ator1`
    FOREIGN KEY (`Ator_idAtor`)
    REFERENCES `mydb`.`Ator` (`idAtor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
