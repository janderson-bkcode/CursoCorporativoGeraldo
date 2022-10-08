

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `rua` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ClienteEventual`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ClienteEventual` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ClienteEventual` (
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_ClienteEventual_1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Filial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Filial` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Filial` (
  `idFilial` INT NOT NULL,
  `numeroFilial` VARCHAR(45) NULL,
  `veiculos_resp` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`idFilial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_Habitual`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cliente_Habitual` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_Habitual` (
  `idCliente` INT NOT NULL,
  `Filial_idFilial` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Habitual_Filial1_idx` (`Filial_idFilial` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Habitual_1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Habitual_Filial1`
    FOREIGN KEY (`Filial_idFilial`)
    REFERENCES `mydb`.`Filial` (`idFilial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente_empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cliente_empresa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_empresa` (
  `idCliente` INT NOT NULL,
  `cnpj` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_Cliente_empresa_1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reserva`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Reserva` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Reserva` (
  `registro_locacao` INT NOT NULL,
  `data_locacao` DATETIME NULL,
  `dataTerminoLoc` DATETIME NULL,
  `local_chegada` VARCHAR(45) NULL,
  `local_saida` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Filial_idFilial` INT NOT NULL,
  PRIMARY KEY (`registro_locacao`),
  INDEX `fk_Reserva_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Reserva_Filial1_idx` (`Filial_idFilial` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Filial1`
    FOREIGN KEY (`Filial_idFilial`)
    REFERENCES `mydb`.`Filial` (`idFilial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Veiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Veiculo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Veiculo` (
  `idVeiculo` INT NOT NULL,
  `placa` VARCHAR(45) NULL,
  `Filial_idFilial` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  INDEX `fk_Veiculo_Filial1_idx` (`Filial_idFilial` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_Filial1`
    FOREIGN KEY (`Filial_idFilial`)
    REFERENCES `mydb`.`Filial` (`idFilial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoVeiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TipoVeiculo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`TipoVeiculo` (
  `idVeiculo` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `Veiculo_idVeiculo` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  CONSTRAINT `fk_TipoVeiculo_Veiculo1`
    FOREIGN KEY (`idVeiculo`)
    REFERENCES `mydb`.`Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `mydb`.`Acessorio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Acessorio` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Acessorio` (
  `idAcessorio` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,
  `Veiculo_idVeiculo` INT NOT NULL,
  PRIMARY KEY (`idAcessorio`, `Veiculo_idVeiculo`),
  INDEX `fk_Acessorio_Veiculo1_idx` (`Veiculo_idVeiculo` ASC) VISIBLE,
  CONSTRAINT `fk_Acessorio_Veiculo1`
    FOREIGN KEY (`Veiculo_idVeiculo`)
    REFERENCES `mydb`.`Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

