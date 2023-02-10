-- AlterTable
ALTER TABLE "Saint" ADD COLUMN     "ambigousDateOfBirth" TEXT,
ADD COLUMN     "ambigousDateOfHeavenlyBirth" TEXT,
ADD COLUMN     "dateOfCanonization" DATE,
ALTER COLUMN "dateOfBirth" DROP NOT NULL,
ALTER COLUMN "dateOfHeavenlyBirth" DROP NOT NULL;
