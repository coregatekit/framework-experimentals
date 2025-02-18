ALTER TABLE "elysia-pets"."animals" ALTER COLUMN "id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "elysia-pets"."breeds" ALTER COLUMN "id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "elysia-pets"."owners" ALTER COLUMN "id" SET DEFAULT gen_random_uuid();--> statement-breakpoint
ALTER TABLE "elysia-pets"."pets" ALTER COLUMN "id" SET DEFAULT gen_random_uuid();