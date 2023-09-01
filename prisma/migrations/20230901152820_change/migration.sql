/*
  Warnings:

  - You are about to drop the `Type` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_PokemonToType` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_PokemonToType" DROP CONSTRAINT "_PokemonToType_A_fkey";

-- DropForeignKey
ALTER TABLE "_PokemonToType" DROP CONSTRAINT "_PokemonToType_B_fkey";

-- DropTable
DROP TABLE "Type";

-- DropTable
DROP TABLE "_PokemonToType";

-- CreateTable
CREATE TABLE "PokemonTypes" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "PokemonTypes_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "_PokemonToPokemonTypes" (
    "A" INTEGER NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "PokemonTypes_name_key" ON "PokemonTypes"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_PokemonToPokemonTypes_AB_unique" ON "_PokemonToPokemonTypes"("A", "B");

-- CreateIndex
CREATE INDEX "_PokemonToPokemonTypes_B_index" ON "_PokemonToPokemonTypes"("B");

-- AddForeignKey
ALTER TABLE "_PokemonToPokemonTypes" ADD CONSTRAINT "_PokemonToPokemonTypes_A_fkey" FOREIGN KEY ("A") REFERENCES "Pokemon"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PokemonToPokemonTypes" ADD CONSTRAINT "_PokemonToPokemonTypes_B_fkey" FOREIGN KEY ("B") REFERENCES "PokemonTypes"("name") ON DELETE CASCADE ON UPDATE CASCADE;
