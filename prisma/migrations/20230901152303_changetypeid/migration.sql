/*
  Warnings:

  - The primary key for the `Type` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[name]` on the table `Type` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "_PokemonToType" DROP CONSTRAINT "_PokemonToType_B_fkey";

-- DropIndex
DROP INDEX "Type_id_key";

-- AlterTable
ALTER TABLE "Type" DROP CONSTRAINT "Type_pkey",
ADD CONSTRAINT "Type_pkey" PRIMARY KEY ("name");

-- AlterTable
ALTER TABLE "_PokemonToType" ALTER COLUMN "B" SET DATA TYPE TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Type_name_key" ON "Type"("name");

-- AddForeignKey
ALTER TABLE "_PokemonToType" ADD CONSTRAINT "_PokemonToType_B_fkey" FOREIGN KEY ("B") REFERENCES "Type"("name") ON DELETE CASCADE ON UPDATE CASCADE;
