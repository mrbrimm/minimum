/*
  Warnings:

  - You are about to drop the column `amountPaid` on the `purchase` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `purchase` table. All the data in the column will be lost.
  - You are about to drop the column `rectangleCount` on the `purchase` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `purchase` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `purchase` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `rectangle` table. All the data in the column will be lost.
  - You are about to drop the column `link_title` on the `rectangle` table. All the data in the column will be lost.
  - You are about to drop the column `target_url` on the `rectangle` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `rectangle` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `user` table. All the data in the column will be lost.
  - Added the required column `amount_paid` to the `Purchase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rectangle_count` to the `Purchase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Purchase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Purchase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Rectangle` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Rectangle_rect_row_col_key` ON `rectangle`;

-- AlterTable
ALTER TABLE `purchase` DROP COLUMN `amountPaid`,
    DROP COLUMN `createdAt`,
    DROP COLUMN `rectangleCount`,
    DROP COLUMN `updatedAt`,
    DROP COLUMN `userId`,
    ADD COLUMN `amount_paid` INTEGER NOT NULL,
    ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `rectangle_count` INTEGER NOT NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL,
    ADD COLUMN `user_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `rectangle` DROP COLUMN `createdAt`,
    DROP COLUMN `link_title`,
    DROP COLUMN `target_url`,
    DROP COLUMN `updatedAt`,
    ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL,
    ADD COLUMN `user_id` INTEGER NULL;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `createdAt`,
    DROP COLUMN `updatedAt`,
    ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- CreateTable
CREATE TABLE `PixelGroup` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `target_url` VARCHAR(191) NULL,
    `link_title` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Rectangle` ADD CONSTRAINT `Rectangle_pixel_group_id_fkey` FOREIGN KEY (`pixel_group_id`) REFERENCES `PixelGroup`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rectangle` ADD CONSTRAINT `Rectangle_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Purchase` ADD CONSTRAINT `Purchase_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
