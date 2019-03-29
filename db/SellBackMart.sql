CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NULL,
  `name` VARCHAR(100) NOT NULL,
  `password` VARCHAR(150) NOT NULL,
  `department` VARCHAR(100) NULL,
  `major` VARCHAR(100) NULL,
  `validated` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `message` (
  `id` INT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `read` TINYINT NOT NULL,
  `receiver_id` INT NOT NULL,
  `sender_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_user_idx` (`receiver_id` ASC) VISIBLE,
  INDEX `fk_message_user1_idx` (`sender_id` ASC) VISIBLE,
  CONSTRAINT `fk_message_user`
    FOREIGN KEY (`receiver_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_user1`
    FOREIGN KEY (`sender_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `item` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `price` FLOAT NOT NULL,
  `image` VARCHAR(100) NULL,
  `condition` INT NOT NULL,
  `inactive` TINYINT NOT NULL DEFAULT 0,
  `description` VARCHAR(1000) NOT NULL,
  `isbn` VARCHAR(45) NULL,
  `author` VARCHAR(150) NULL,
  `edition` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_item_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_item_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_item_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  `review` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transaction_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_transaction_item1_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `fk_transaction_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `mydb`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
