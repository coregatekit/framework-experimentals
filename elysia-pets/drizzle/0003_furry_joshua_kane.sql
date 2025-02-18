CREATE TABLE "elysia-pets"."owners" (
	"id" uuid PRIMARY KEY NOT NULL,
	"owner_code" varchar(50) NOT NULL,
	"name" varchar(100) NOT NULL,
	"email" varchar(100),
	"phone_number" varchar(10) NOT NULL,
	CONSTRAINT "owners_owner_code_unique" UNIQUE("owner_code")
);
