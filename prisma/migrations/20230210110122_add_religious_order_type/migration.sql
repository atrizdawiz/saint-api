/*
  Warnings:

  - Added the required column `type` to the `ReligiousOrder` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "ReligiousOrderType" AS ENUM ('CANONS_REGULAR', 'MONASTIC', 'MENIDICANT', 'CLERIC');

-- AlterTable
ALTER TABLE "ReligiousOrder" ADD COLUMN     "type" "ReligiousOrderType" NOT NULL;
