/*
  Warnings:

  - Added the required column `name` to the `ReligiousOrder` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ReligiousOrder" ADD COLUMN     "acronym" TEXT,
ADD COLUMN     "name" TEXT NOT NULL,
ADD COLUMN     "officialName" TEXT;
