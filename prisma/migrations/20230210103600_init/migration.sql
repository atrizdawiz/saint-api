-- CreateTable
CREATE TABLE "Quote" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "title" VARCHAR(255) NOT NULL,
    "content" TEXT,
    "authorId" INTEGER NOT NULL,

    CONSTRAINT "Quote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReligiousOrder" (
    "id" SERIAL NOT NULL,
    "description" TEXT,
    "saintId" INTEGER NOT NULL,

    CONSTRAINT "ReligiousOrder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Saint" (
    "id" SERIAL NOT NULL,
    "name" TEXT,

    CONSTRAINT "Saint_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ReligiousOrder_saintId_key" ON "ReligiousOrder"("saintId");

-- AddForeignKey
ALTER TABLE "Quote" ADD CONSTRAINT "Quote_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "Saint"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReligiousOrder" ADD CONSTRAINT "ReligiousOrder_saintId_fkey" FOREIGN KEY ("saintId") REFERENCES "Saint"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
