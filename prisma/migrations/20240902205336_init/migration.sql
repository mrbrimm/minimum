-- CreateTable
CREATE TABLE `Rectangle` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `rect_row` INTEGER NOT NULL,
    `col` INTEGER NOT NULL,
    `purchased` BOOLEAN NOT NULL DEFAULT false,
    `pixel_group_id` INTEGER NULL,
    `image_url` VARCHAR(191) NULL,
    `link_title` VARCHAR(191) NULL,
    `target_url` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Rectangle_rect_row_col_key`(`rect_row`, `col`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Purchase` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `rectangleCount` INTEGER NOT NULL,
    `amountPaid` INTEGER NOT NULL,
    `image_url` VARCHAR(191) NULL,
    `link_title` VARCHAR(191) NULL,
    `target_url` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `isAdmin` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
