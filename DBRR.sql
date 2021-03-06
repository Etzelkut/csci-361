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
-- Table `mydb`.`Route`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Route` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Route` (
  `RouteID` INT NOT NULL auto_increment,
  `First_Station` INT NOT NULL,
  `Last_Station` INT NOT NULL,
  PRIMARY KEY (`RouteID`),
  CONSTRAINT `fk_Route__Station_1`
    FOREIGN KEY (`First_Station`)
    REFERENCES `mydb`.`Station` (`StationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Route__Station_2`
    FOREIGN KEY (`Last_Station`)
    REFERENCES `mydb`.`Station` (`StationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Train`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Train` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Train` (
  `ID` INT NOT NULL auto_increment,
  `Train_model` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `UserID` INT NOT NULL auto_increment,
  `Lname` VARCHAR(45) NOT NULL,
  `Fname` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Status` VARCHAR(45) NULL DEFAULT 'Passenger',
  `Password` VARCHAR(45) NULL DEFAULT '12345',
  PRIMARY KEY (`Username`),
  UNIQUE INDEX `User_UNIQUE` (`UserID` ASC, `Email` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Trip` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Trip` (
  `Status` TINYINT NULL DEFAULT 1,
  `Ticket_Seat_Number` INT NOT NULL,
  `Ticket_Train_ID` INT NOT NULL,
  `Ticket_Vagon_type` VARCHAR(45) NOT NULL,
  `Leg_Serial_number` INT NOT NULL,
  `RouteID`INT NOT NULL,
  `PassID` INT NOT NULL,
  PRIMARY KEY (`Ticket_Seat_Number`, `Ticket_Train_ID`, `Ticket_Vagon_type`, `Leg_Serial_number`, `RouteID`, `PassID`),
  INDEX `fk_Trip__User_1_idx` (`PassID` ASC) VISIBLE,
  CONSTRAINT `fk_Trip__Ticket_1`
    FOREIGN KEY (`Ticket_Seat_Number` , `Ticket_Train_ID` , `Ticket_Vagon_type` , `Leg_Serial_number` , `RouteID`)
    REFERENCES `mydb`.`Ticket` (`Seat_Number` , `Train_ID` , `Vagon_type` , `Leg_Serial_number` , `RouteID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trip__User_1`
    FOREIGN KEY (`PassID`)
    REFERENCES `mydb`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`Station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Station` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Station` (
  `StationID` INT NOT NULL auto_increment,
  `Location` VARCHAR(45) NOT NULL,
  `ManagerID` INT NOT NULL,
  PRIMARY KEY (`StationID`, `ManagerID`),
  INDEX `fk_Station__User_1_idx` (`ManagerID` ASC) VISIBLE,
  CONSTRAINT `fk_Station__User_1`
    FOREIGN KEY (`ManagerID`)
    REFERENCES `mydb`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EmployeeID`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EmployeeID` ;

CREATE TABLE IF NOT EXISTS `mydb`.`EmployeeID` (
  `idStation_Employee` INT NOT NULL auto_increment,
  `FName` VARCHAR(45) NULL,
  `LName` VARCHAR(45) NULL,
  `Position` VARCHAR(45) NULL,
  `StationID` INT NOT NULL,
  PRIMARY KEY (`idStation_Employee`),
  INDEX `fk_EmployeeID__Station_1_idx` (`StationID` ASC) VISIBLE,
  CONSTRAINT `fk_EmployeeID__Station_1`
    FOREIGN KEY (`StationID`)
    REFERENCES `mydb`.`Station` (`StationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Work_E`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Work_E` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Work_E` (
  `Date` DATE NULL,
  `Start_time` TIME NULL,
  `End_time` TIME NULL,
  `Hours` INT NULL DEFAULT(timediff(`End_time`,`Start_time`)),
  `EmployeeID` INT NOT NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `fk_Work_E__EmployeeID_1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `mydb`.`EmployeeID` (`idStation_Employee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fare`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fare` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Fare` (
  `FareCode` VARCHAR(45) NOT NULL,
  `Price` VARCHAR(45) NOT NULL,
  `Train_ID` INT NOT NULL,
  `Vagon_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FareCode`, `Train_ID`, `Vagon_type`),
  INDEX `fk_Fare__Vagon1_idx` (`Train_ID` ASC, `Vagon_type` ASC) VISIBLE,
  CONSTRAINT `fk_Fare__Vagon1`
    FOREIGN KEY (`Train_ID` , `Vagon_type`)
    REFERENCES `mydb`.`Vagon` (`Train_ID` , `Vagon_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Leg_of_Route`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Leg_of_Route` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Leg_of_Route` (
  `Serial_number_in_route` INT NOT NULL,
  -- `Status` TINYINT(1) NULL,
  `RouteID` INT NOT NULL,
  `Date_dep` DATETIME NOT NULL,
  `Date_arr` DATETIME NOT NULL,
  `Station_dep` INT NOT NULL,
  `Station_arr` INT NOT NULL,
  `DateT` DATE NOT NULL DEFAULT(DATE(`Date_dep`)),
  `Train_ID` INT NOT NULL, 
  PRIMARY KEY (`Serial_number_in_route`, `RouteID`, `Date_dep`),
  INDEX `fk_Leg_of_Route_Route_1_idx` (`RouteID` ASC) VISIBLE,
  INDEX `fk_Leg_of_Route_Station_1_idx` (`Station_arr` ASC) VISIBLE,
  INDEX `fk_Leg_of_Route_Station_2_idx` (`Station_dep` ASC) VISIBLE,
  INDEX `fk_Traind_ID_1_idx` (`Train_ID` ASC) VISIBLE,
  INDEX `DateT_UNIQUE` (`DateT` ASC) VISIBLE,
  CONSTRAINT `fk_Traind_ID_1`
    FOREIGN KEY (`Train_ID`)
    REFERENCES `mydb`.`Train` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Leg_of_Route_Route_1`
    FOREIGN KEY (`RouteID`)
    REFERENCES `mydb`.`Route` (`RouteID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Leg_of_Route_Station_1`
    FOREIGN KEY (`Station_arr`)
    REFERENCES `mydb`.`Station` (`StationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Leg_of_Route_Station_2`
    FOREIGN KEY (`Station_dep`)
    REFERENCES `mydb`.`Station` (`StationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ticket` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Ticket` (
  `Seat_Number` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Train_ID` INT NOT NULL,
  `Vagon_type` VARCHAR(45) NOT NULL,
  `Leg_Serial_number` INT NOT NULL,
  `RouteID` INT NOT NULL,
  `Pass_Name` VARCHAR(45) NULL,
  `PassID` INT NOT NULL,
  `Vagon_num` INT NOT NULL,
  PRIMARY KEY (`Seat_Number`, `Train_ID`, `Vagon_type`, `Leg_Serial_number`, `RouteID`, `Vagon_num`,`Date`, `PassID`),
  INDEX `fk_Ticket__Vagon1_idx` (`Train_ID` ASC, `Vagon_type` ASC, `Vagon_num` ASC) VISIBLE,
  INDEX `fk_Ticket__Leg_of_Route1_idx` (`Leg_Serial_number` ASC, `RouteID` ASC, `Date` ASC) VISIBLE,
  INDEX `fk_Ticket__User_1_idx` (`PassID` ASC) VISIBLE,
  INDEX `fk_Ticket_Leg_of_Route1_idx` (`Date` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket__Vagon1`
    FOREIGN KEY (`Train_ID` , `Vagon_type`, `Vagon_num`)
    REFERENCES `mydb`.`Vagon` (`Train_ID` , `Vagon_type`,`Vagon_num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket__Leg_of_Route1`
    FOREIGN KEY (`Leg_Serial_number` , `RouteID`)
    REFERENCES `mydb`.`Leg_of_Route` (`Serial_number_in_route` , `RouteID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Leg_of_Route1`
    FOREIGN KEY (`Date`)
    REFERENCES `mydb`.`Leg_of_Route` (`DateT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket__User_1`
    FOREIGN KEY (`PassID`)
    REFERENCES `mydb`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Vagon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Vagon` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Vagon` (
  `Train_ID` INT NOT NULL,
  `Vagon_type` VARCHAR(45) NOT NULL,
  `Vagon_num` INT NOT NULL,
  `Max_seats` INT NULL DEFAULT(20),
  PRIMARY KEY (`Train_ID`, `Vagon_type`, `Vagon_num`),
  CONSTRAINT `fk_Vagon_Train_1`
    FOREIGN KEY (`Train_ID`)
    REFERENCES `mydb`.`Train` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS APP_LOGS;
create table IF NOT EXISTS APP_LOGS(
    LOG_ID varchar(100) primary key,
    ENTRY_DATE timestamp,
    LOGGER varchar(100),
    LOG_LEVEL varchar(100),    
    MESSAGE TEXT,
    EXCEPTION TEXT
);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
