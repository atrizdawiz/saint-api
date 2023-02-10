/*
  Warnings:

  - Added the required column `founderSaintId` to the `Saint` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Saint" ADD COLUMN     "founderSaintId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Saint" ADD CONSTRAINT "Saint_founderSaintId_fkey" FOREIGN KEY ("founderSaintId") REFERENCES "ReligiousOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
