DROP DATABASE IF EXISTS sequra;
CREATE DATABASE sequra;
USE sequra;

-- Create merchants table
DROP TABLE IF EXISTS merchants;
CREATE TABLE `merchants` (
                             `id` int(11) NOT NULL,
                             `name` varchar(255) NOT NULL,
                             `email` int(255) NOT NULL,
                             `cif` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `merchants`
    ADD PRIMARY KEY (`id`);

-- Create merchants table
DROP TABLE IF EXISTS shoppers;
CREATE TABLE `shoppers` (
                             `id` int(11) NOT NULL,
                             `name` varchar(255) NOT NULL,
                             `email` int(255) NOT NULL,
                             `nif` int(10) NOT NULL
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
                            `completed_At` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `orders`
    ADD PRIMARY KEY (`id`);