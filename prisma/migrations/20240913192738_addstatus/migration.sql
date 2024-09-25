/*
  Warnings:

  - A unique constraint covering the columns `[user_id,created_at]` on the table `Purchase` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `pixelgroup` ADD COLUMN `status` VARCHAR(191) NOT NULL DEFAULT 'Pending Payment';

-- AlterTable
ALTER TABLE `purchase` ADD COLUMN `status` VARCHAR(191) NOT NULL DEFAULT 'Pending Payment';

-- AlterTable
ALTER TABLE `rectangle` ADD COLUMN `status` VARCHAR(191) NOT NULL DEFAULT 'Pending Payment';

-- CreateIndex
CREATE UNIQUE INDEX `Purchase_user_id_created_at_key` ON `Purchase`(`user_id`, `created_at`);
