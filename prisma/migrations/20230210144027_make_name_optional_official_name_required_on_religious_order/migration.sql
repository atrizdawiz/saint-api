/*
  Warnings:

  - Made the column `officialName` on table `ReligiousOrder` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "ReligiousOrder" ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "officialName" SET NOT NULL;
