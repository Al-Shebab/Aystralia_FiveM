ALTER TABLE `items` CHANGE COLUMN `weight` `weight` FLOAT NOT NULL DEFAULT 1;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('coke', 'Cocaine Powder', 0.01, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('coke_pooch', 'Processed Cocaine', 0.05, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('opium', 'Opium', 0.01, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('opium_pooch', 'Heroin', 0.05, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('weed', 'Weed Leaves', 0.01, 0, 1);
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('weed_pooch', 'Weed', 0.05, 0, 1);