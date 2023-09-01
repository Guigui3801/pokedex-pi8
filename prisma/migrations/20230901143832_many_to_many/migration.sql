/*
  Warnings:

  - You are about to drop the column `pokemonName` on the `Type` table. All the data in the column will be lost.
  - You are about to drop the column `slot` on the `Type` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Type" DROP CONSTRAINT "Type_pokemonName_fkey";

-- AlterTable
ALTER TABLE "Type" DROP COLUMN "pokemonName",
DROP COLUMN "slot";

-- CreateTable
CREATE TABLE "_PokemonToType" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_PokemonToType_AB_unique" ON "_PokemonToType"("A", "B");

-- CreateIndex
CREATE INDEX "_PokemonToType_B_index" ON "_PokemonToType"("B");

-- AddForeignKey
ALTER TABLE "_PokemonToType" ADD CONSTRAINT "_PokemonToType_A_fkey" FOREIGN KEY ("A") REFERENCES "Pokemon"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PokemonToType" ADD CONSTRAINT "_PokemonToType_B_fkey" FOREIGN KEY ("B") REFERENCES "Type"("id") ON DELETE CASCADE ON UPDATE CASCADE;
