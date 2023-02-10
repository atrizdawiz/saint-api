/*
  Warnings:

  - You are about to drop the column `founderSaintId` on the `Saint` table. All the data in the column will be lost.
  - Added the required column `foundedIn` to the `ReligiousOrder` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dateOfBirth` to the `Saint` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dateOfHeavenlyBirth` to the `Saint` table without a default value. This is not possible if the table is not empty.
  - Added the required column `foundedReligiousOrderId` to the `Saint` table without a default value. This is not possible if the table is not empty.
  - Added the required column `wasMartyred` to the `Saint` table without a default value. This is not possible if the table is not empty.
  - Made the column `name` on table `Saint` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Saint" DROP CONSTRAINT "Saint_founderSaintId_fkey";

-- AlterTable
ALTER TABLE "ReligiousOrder" ADD COLUMN     "foundedIn" DATE NOT NULL;

-- AlterTable
ALTER TABLE "Saint" DROP COLUMN "founderSaintId",
ADD COLUMN     "alias" TEXT,
ADD COLUMN     "dateOfBirth" DATE NOT NULL,
ADD COLUMN     "dateOfHeavenlyBirth" DATE NOT NULL,
ADD COLUMN     "foundedReligiousOrderId" INTEGER NOT NULL,
ADD COLUMN     "nationality" TEXT,
ADD COLUMN     "wasMartyred" BOOLEAN NOT NULL,
ALTER COLUMN "name" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "Saint" ADD CONSTRAINT "Saint_foundedReligiousOrderId_fkey" FOREIGN KEY ("foundedReligiousOrderId") REFERENCES "ReligiousOrder"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
