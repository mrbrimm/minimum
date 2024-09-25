/*
  Warnings:

  - Made the column `user_id` on table `rectangle` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `rectangle` DROP FOREIGN KEY `Rectangle_user_id_fkey`;

-- AlterTable
ALTER TABLE `pixelgroup` ADD COLUMN `user_id` INTEGER NOT NULL DEFAULT 6;

-- AlterTable
ALTER TABLE `purchase` ADD COLUMN `pixelGroupId` INTEGER NOT NULL DEFAULT 1;

-- AlterTable
ALTER TABLE `rectangle` MODIFY `user_id` INTEGER NOT NULL DEFAULT 6;

-- AddForeignKey
ALTER TABLE `PixelGroup` ADD CONSTRAINT `PixelGroup_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Purchase` ADD CONSTRAINT `Purchase_pixelGroupId_fkey` FOREIGN KEY (`pixelGroupId`) REFERENCES `PixelGroup`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rectangle` ADD CONSTRAINT `Rectangle_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
