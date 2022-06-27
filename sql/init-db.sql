DROP DATABASE IF EXISTS sequra;
CREATE DATABASE sequra;
USE sequra;

-- Create merchants table
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS merchants;
CREATE TABLE `merchants` (
                             `id` int(11) NOT NULL,
                             `name` varchar(255) NOT NULL,
                             `email` varchar(255) NOT NULL,
                             `cif` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `merchants`
    ADD PRIMARY KEY (`id`);

-- Create merchants table
DROP TABLE IF EXISTS shoppers;
CREATE TABLE `shoppers` (
                             `id` int(11) NOT NULL,
                             `name` varchar(255) NOT NULL,
                             `email` varchar(255) NOT NULL,
                             `nif` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `shoppers`
    ADD PRIMARY KEY (`id`);

-- Create merchants table
DROP TABLE IF EXISTS orders;
CREATE TABLE `orders` (
                            `id` int(11) NOT NULL,
                            `merchant_id` int(11) NOT NULL,
                            `shopper_id` int(11) NOT NULL,
                            `amount` varchar(255) NOT NULL, -- Money better represented as string
                            `created_at` datetime NOT NULL,
                            `completed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `orders`
    ADD PRIMARY KEY (`id`);

-- Let's load some data from the CSV
LOAD DATA INFILE '/var/lib/mysql-files/merchants.csv'
    INTO TABLE merchants
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';
LOAD DATA INFILE '/var/lib/mysql-files/shoppers.csv'
    INTO TABLE shoppers
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

SET @@SESSION.sql_mode='ALLOW_INVALID_DATES';
LOAD DATA INFILE '/var/lib/mysql-files/orders.csv'
    INTO TABLE orders
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
   (
    `id`,`merchant_id`,`shopper_id`,`amount`, @created_at_var, @completed_at_var
       )
    SET `created_at`=STR_TO_DATE( @created_at_var, '%d/%m/%Y %k:%i:%s' ),
         `completed_at`=STR_TO_DATE( @completed_at_var, '%d/%m/%Y %k:%i:%s' );

UPDATE orders SET completed_at = NULL WHERE completed_at = '0000-00-00 00:00:00';
COMMIT;