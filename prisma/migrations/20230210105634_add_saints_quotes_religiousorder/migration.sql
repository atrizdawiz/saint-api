/*
  Warnings:

  - You are about to drop the column `saintId` on the `ReligiousOrder` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "ReligiousOrder" DROP CONSTRAINT "ReligiousOrder_saintId_fkey";

-- DropIndex
DROP INDEX "ReligiousOrder_saintId_key";

-- AlterTable
ALTER TABLE "ReligiousOrder" DROP COLUMN "saintId";

-- AlterTable
ALTER TABLE "Saint" ADD COLUMN     "religiousOrderId" INTEGER;

-- AddForeignKey
ALTER TABLE "Saint" ADD CONSTRAINT "Saint_religiousOrderId_fkey" FOREIGN KEY ("religiousOrderId") REFERENCES "ReligiousOrder"("id") ON DELETE SET NULL ON UPDATE CASCADE;
