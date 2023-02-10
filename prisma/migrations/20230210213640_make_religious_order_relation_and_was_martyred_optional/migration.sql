-- DropForeignKey
ALTER TABLE "Saint" DROP CONSTRAINT "Saint_foundedReligiousOrderId_fkey";

-- AlterTable
ALTER TABLE "Saint" ALTER COLUMN "foundedReligiousOrderId" DROP NOT NULL,
ALTER COLUMN "wasMartyred" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Saint" ADD CONSTRAINT "Saint_foundedReligiousOrderId_fkey" FOREIGN KEY ("foundedReligiousOrderId") REFERENCES "ReligiousOrder"("id") ON DELETE SET NULL ON UPDATE CASCADE;
