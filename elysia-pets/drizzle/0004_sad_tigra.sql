CREATE TYPE "public"."pet_gender" AS ENUM('Male', 'Female');--> statement-breakpoint
CREATE TABLE "elysia-pets"."pets" (
	"id" uuid PRIMARY KEY NOT NULL,
	"pet_code" varchar(50) NOT NULL,
	"name" varchar(100) NOT NULL,
	"breed_id" uuid NOT NULL,
	"owner_id" uuid NOT NULL,
	"gender" "pet_gender" NOT NULL,
	"color" varchar(50),
	"weight" varchar(10),
	"height" varchar(10),
	CONSTRAINT "pets_pet_code_unique" UNIQUE("pet_code")
);
--> statement-breakpoint
ALTER TABLE "elysia-pets"."pets" ADD CONSTRAINT "pets_breed_id_breeds_id_fk" FOREIGN KEY ("breed_id") REFERENCES "elysia-pets"."breeds"("id") ON DELETE restrict ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "elysia-pets"."pets" ADD CONSTRAINT "pets_owner_id_owners_id_fk" FOREIGN KEY ("owner_id") REFERENCES "elysia-pets"."owners"("id") ON DELETE cascade ON UPDATE no action;