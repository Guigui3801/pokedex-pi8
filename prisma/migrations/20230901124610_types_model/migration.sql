/*
  Warnings:

  - The primary key for the `Pokemon` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `types` on the `Pokemon` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[name]` on the table `Pokemon` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `id` to the `Pokemon` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Pokemon" DROP CONSTRAINT "Pokemon_pkey",
DROP COLUMN "types",
ADD COLUMN     "id" INTEGER NOT NULL,
ADD CONSTRAINT "Pokemon_pkey" PRIMARY KEY ("id");

-- CreateTable
CREATE TABLE "Types" (
    "pokemonName" TEXT NOT NULL,
    "slot" INTEGER NOT NULL,
    "type" TEXT NOT NULL,

    CONSTRAINT "Types_pkey" PRIMARY KEY ("slot")
);

-- CreateIndex
CREATE UNIQUE INDEX "Pokemon_name_key" ON "Pokemon"("name");

-- AddForeignKey
ALTER TABLE "Types" ADD CONSTRAINT "Types_pokemonName_fkey" FOREIGN KEY ("pokemonName") REFERENCES "Pokemon"("name") ON DELETE RESTRICT ON UPDATE CASCADE;
