/*
  Warnings:

  - Added the required column `pokemonName` to the `Type` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Type" DROP CONSTRAINT "Type_name_fkey";

-- AlterTable
ALTER TABLE "Type" ADD COLUMN     "pokemonName" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Type" ADD CONSTRAINT "Type_pokemonName_fkey" FOREIGN KEY ("pokemonName") REFERENCES "Pokemon"("name") ON DELETE RESTRICT ON UPDATE CASCADE;
