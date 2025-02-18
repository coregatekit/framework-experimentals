CREATE TYPE "public"."animal_type" AS ENUM('Mammals', 'Birds', 'Reptiles', 'Amphibians', 'Invertebrates', 'Fish');--> statement-breakpoint
CREATE TABLE "elysia-pets"."animals" (
	"id" uuid PRIMARY KEY NOT NULL,
	"name" varchar(100) NOT NULL,
	"type" "animal_type" NOT NULL
);
