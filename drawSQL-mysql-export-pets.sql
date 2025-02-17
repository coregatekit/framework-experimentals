CREATE TABLE `pets`(
    `id` CHAR(36) NOT NULL,
    `pet_code` TINYTEXT NOT NULL,
    `name` TEXT NOT NULL COMMENT 'Name of the pet',
    `breed_id` CHAR(36) NOT NULL,
    `owner_id` CHAR(36) NOT NULL COMMENT 'An id of the owner',
    `gender` ENUM('Male', 'Female', 'None') NOT NULL COMMENT 'Gender of the pet',
    `color` TINYTEXT NOT NULL,
    `age` BIGINT NOT NULL,
    `weight` BIGINT NOT NULL,
    `height` BIGINT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `pets` ADD INDEX `pets_name_index`(`name`);
ALTER TABLE
    `pets` ADD UNIQUE `pets_pet_code_unique`(`pet_code`);
CREATE TABLE `breeds`(
    `id` CHAR(36) NOT NULL,
    `name` TEXT NOT NULL COMMENT 'Name of the breed',
    `animal_id` CHAR(36) NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `breeds` ADD INDEX `breeds_name_index`(`name`);
ALTER TABLE
    `breeds` ADD PRIMARY KEY(`animal_id`);
CREATE TABLE `animals`(
    `id` CHAR(36) NOT NULL,
    `name` TEXT NOT NULL COMMENT 'Name of the animal',
    `type` ENUM(
        'Mammals',
        'Birds',
        'Reptiles',
        'Amphibians',
        'Invertebrates',
        'Fish'
    ) NOT NULL COMMENT 'A type of animal',
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `animals` ADD INDEX `animals_name_index`(`name`);
ALTER TABLE
    `animals` ADD UNIQUE `animals_name_unique`(`name`);
CREATE TABLE `owners`(
    `id` CHAR(36) NOT NULL,
    `owner_code` TINYTEXT NOT NULL,
    `name` TEXT NOT NULL,
    `email` TEXT NULL,
    `phone_number` TEXT NOT NULL,
    PRIMARY KEY(`id`)
);
ALTER TABLE
    `owners` ADD INDEX `owners_name_index`(`name`);
ALTER TABLE
    `owners` ADD INDEX `owners_phone_number_index`(`phone_number`);
ALTER TABLE
    `owners` ADD UNIQUE `owners_owner_code_unique`(`owner_code`);
ALTER TABLE
    `pets` ADD CONSTRAINT `pets_breed_id_foreign` FOREIGN KEY(`breed_id`) REFERENCES `breeds`(`id`);
ALTER TABLE
    `pets` ADD CONSTRAINT `pets_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `owners`(`id`);
ALTER TABLE
    `animals` ADD CONSTRAINT `animals_id_foreign` FOREIGN KEY(`id`) REFERENCES `breeds`(`animal_id`);