/*
  Warnings:

  - You are about to drop the `Types` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Types" DROP CONSTRAINT "Types_pokemonName_fkey";

-- DropTable
DROP TABLE "Types";

-- CreateTable
CREATE TABLE "Type" (
    "slot" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "Type_pkey" PRIMARY KEY ("slot")
);

-- AddForeignKey
ALTER TABLE "Type" ADD CONSTRAINT "Type_name_fkey" FOREIGN KEY ("name") REFERENCES "Pokemon"("name") ON DELETE RESTRICT ON UPDATE CASCADE;
