/*
  Warnings:

  - You are about to drop the column `created_at` on the `rectangle` table. All the data in the column will be lost.
  - You are about to drop the column `image_url` on the `rectangle` table. All the data in the column will be lost.
  - You are about to drop the column `pixel_group_id` on the `rectangle` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `rectangle` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[rect_row,col]` on the table `Rectangle` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `updated_at` to the `PixelGroup` table without a default value. This is not possible if the table is not empty.
  - Added the required column `billing_address` to the `Purchase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `billing_state` to the `Purchase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `billing_zip` to the `Purchase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `credit_card_last_four` to the `Purchase` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `rectangle` DROP FOREIGN KEY `Rectangle_pixel_group_id_fkey`;

-- AlterTable
ALTER TABLE `pixelgroup` ADD COLUMN `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `image_url` VARCHAR(191) NULL,
    ADD COLUMN `updated_at` DATETIME(3) NOT NULL;

-- AlterTable
ALTER TABLE `purchase` ADD COLUMN `billing_address` VARCHAR(191) NOT NULL,
    ADD COLUMN `billing_state` VARCHAR(191) NOT NULL,
    ADD COLUMN `billing_zip` VARCHAR(191) NOT NULL,
    ADD COLUMN `credit_card_last_four` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `rectangle` DROP COLUMN `created_at`,
    DROP COLUMN `image_url`,
    DROP COLUMN `pixel_group_id`,
    DROP COLUMN `updated_at`,
    ADD COLUMN `pixelGroupId` INTEGER NULL,
    ADD COLUMN `purchase_id` INTEGER NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Rectangle_rect_row_col_key` ON `Rectangle`(`rect_row`, `col`);

-- AddForeignKey
ALTER TABLE `Rectangle` ADD CONSTRAINT `Rectangle_purchase_id_fkey` FOREIGN KEY (`purchase_id`) REFERENCES `Purchase`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rectangle` ADD CONSTRAINT `Rectangle_pixelGroupId_fkey` FOREIGN KEY (`pixelGroupId`) REFERENCES `PixelGroup`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
