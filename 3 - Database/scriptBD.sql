-- MySQL Script generated by MySQL Workbench
-- Mon Nov  6 16:47:56 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pecasCarros
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pecasCarros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pecasCarros` DEFAULT CHARACTER SET utf8 ;
USE `pecasCarros` ;

-- -----------------------------------------------------
-- Table `pecasCarros`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pecasCarros`.`usuario` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `administrador` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pecasCarros`.`relatorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pecasCarros`.`relatorio` (
  `registroId` INT NOT NULL AUTO_INCREMENT,
  `acao` VARCHAR(100) NULL,
  `data` DATE NULL,
  `descricao` TEXT NULL,
  `fk_userId` INT NOT NULL,
  PRIMARY KEY (`registroId`),
  INDEX `fk_relatorio_usuario1_idx` (`fk_userId` ASC),
  CONSTRAINT `fk_relatorio_usuario1`
    FOREIGN KEY (`fk_userId`)
    REFERENCES `pecasCarros`.`usuario` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pecasCarros`.`vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pecasCarros`.`vendedor` (
  `vendedorId` INT NOT NULL AUTO_INCREMENT,
  `nomeVendedor` VARCHAR(45) NULL,
  `preco` DOUBLE NULL,
  `link` VARCHAR(100) NULL,
  `fk_userId` INT NOT NULL,
  PRIMARY KEY (`vendedorId`),
  INDEX `fk_vendedor_usuario1_idx` (`fk_userId` ASC) ,
  CONSTRAINT `fk_vendedor_usuario1`
    FOREIGN KEY (`fk_userId`)
    REFERENCES `pecasCarros`.`usuario` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pecasCarros`.`peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pecasCarros`.`peca` (
  `pecaId` INT NOT NULL AUTO_INCREMENT,
  `nomePeca` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(30) NULL,
  `idGeralPeca` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`pecaId`, `idGeralPeca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pecasCarros`.`carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pecasCarros`.`carro` (
  `carroId` INT NOT NULL AUTO_INCREMENT,
  `nomeCarro` VARCHAR(45) NULL,
  `DescricaoCarro` TEXT NULL,
  PRIMARY KEY (`carroId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pecasCarros`.`versao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pecasCarros`.`versao` (
  `versaoId` INT NOT NULL AUTO_INCREMENT,
  `nomeVersao` VARCHAR(45) NOT NULL,
  `anoVersao` VARCHAR(5) NOT NULL,
  `fk_carroId` INT NOT NULL,
  PRIMARY KEY (`versaoId`),
  UNIQUE INDEX `nomeVersao_UNIQUE` (`nomeVersao` ASC) ,
  INDEX `fk_versao_carro1_idx` (`fk_carroId` ASC),
  CONSTRAINT `fk_versao_carro1`
    FOREIGN KEY (`fk_carroId`)
    REFERENCES `pecasCarros`.`carro` (`carroId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pecasCarros`.`modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pecasCarros`.`modelo` (
  `modeloId` INT NOT NULL AUTO_INCREMENT,
  `nomeModelo` VARCHAR(45) NOT NULL,
  `anoModelo` VARCHAR(5) NULL,
  `fk_versaoId` INT NOT NULL,
  PRIMARY KEY (`modeloId`),
  INDEX `fk_modelo_versao1_idx` (`fk_versaoId` ASC) ,
  CONSTRAINT `fk_modelo_versao1`
    FOREIGN KEY (`fk_versaoId`)
    REFERENCES `pecasCarros`.`versao` (`versaoId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pecasCarros`.`vendedor_peca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pecasCarros`.`vendedor_peca` (
  `fk_vendedorId` INT NOT NULL,
  `fk_pecaId` INT NOT NULL,
  `fk_idGeralPeca` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`fk_vendedorId`, `fk_pecaId`, `fk_idGeralPeca`),
  INDEX `fk_vendedor_has_peca_peca1_idx` (`fk_pecaId` ASC, `fk_idGeralPeca` ASC) ,
  INDEX `fk_vendedor_has_peca_vendedor1_idx` (`fk_vendedorId` ASC) ,
  CONSTRAINT `fk_vendedor_has_peca_vendedor1`
    FOREIGN KEY (`fk_vendedorId`)
    REFERENCES `pecasCarros`.`vendedor` (`vendedorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendedor_has_peca_peca1`
    FOREIGN KEY (`fk_pecaId` , `fk_idGeralPeca`)
    REFERENCES `pecasCarros`.`peca` (`pecaId` , `idGeralPeca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pecasCarros`.`peca_modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pecasCarros`.`peca_modelo` (
  `fk_pecaId` INT NOT NULL,
  `fk_idGeralPeca` VARCHAR(30) NOT NULL,
  `fk_modeloId` INT NOT NULL,
  PRIMARY KEY (`fk_pecaId`, `fk_idGeralPeca`, `fk_modeloId`),
  INDEX `fk_peca_has_modelo_modelo1_idx` (`fk_modeloId` ASC) ,
  INDEX `fk_peca_has_modelo_peca1_idx` (`fk_pecaId` ASC, `fk_idGeralPeca` ASC) ,
  CONSTRAINT `fk_peca_has_modelo_peca1`
    FOREIGN KEY (`fk_pecaId` , `fk_idGeralPeca`)
    REFERENCES `pecasCarros`.`peca` (`pecaId` , `idGeralPeca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peca_has_modelo_modelo1`
    FOREIGN KEY (`fk_modeloId`)
    REFERENCES `pecasCarros`.`modelo` (`modeloId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
