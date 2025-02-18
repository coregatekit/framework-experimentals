CREATE TABLE "elysia-pets"."breeds" (
	"id" uuid PRIMARY KEY NOT NULL,
	"name" varchar NOT NULL,
	"animal_id" uuid NOT NULL
);
--> statement-breakpoint
ALTER TABLE "elysia-pets"."breeds" ADD CONSTRAINT "breeds_animal_id_animals_id_fk" FOREIGN KEY ("animal_id") REFERENCES "elysia-pets"."animals"("id") ON DELETE set null ON UPDATE no action;