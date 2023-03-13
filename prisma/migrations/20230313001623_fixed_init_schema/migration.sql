/*
  Warnings:

  - You are about to alter the column `name` on the `User` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(20)`.
  - A unique constraint covering the columns `[name]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userId` to the `Category` table without a default value. This is not possible if the table is not empty.
  - Added the required column `group` to the `Label` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Label` table without a default value. This is not possible if the table is not empty.
  - Added the required column `public` to the `Link` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Link` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userPreferencesShowEmail` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userPreferencesShowStatus` to the `User` table without a default value. This is not possible if the table is not empty.
  - Made the column `name` on table `User` required. This step will fail if there are existing NULL values in that column.
  - Made the column `email` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Category" ADD COLUMN     "userId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Label" ADD COLUMN     "group" VARCHAR(20) NOT NULL,
ADD COLUMN     "userId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Link" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "public" BOOLEAN NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "userPreferencesShowEmail" BOOLEAN NOT NULL,
ADD COLUMN     "userPreferencesShowStatus" BOOLEAN NOT NULL,
ALTER COLUMN "name" SET NOT NULL,
ALTER COLUMN "name" SET DATA TYPE VARCHAR(20),
ALTER COLUMN "email" SET NOT NULL;

-- CreateTable
CREATE TABLE "UserPreferences" (
    "showEmail" BOOLEAN NOT NULL,
    "showStatus" BOOLEAN NOT NULL,

    CONSTRAINT "UserPreferences_pkey" PRIMARY KEY ("showEmail","showStatus")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_name_key" ON "User"("name");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_userPreferencesShowEmail_userPreferencesShowStatus_fkey" FOREIGN KEY ("userPreferencesShowEmail", "userPreferencesShowStatus") REFERENCES "UserPreferences"("showEmail", "showStatus") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Label" ADD CONSTRAINT "Label_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
