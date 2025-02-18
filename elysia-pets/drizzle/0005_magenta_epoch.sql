ALTER TABLE "elysia-pets"."animals" ADD COLUMN "created_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "elysia-pets"."animals" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "elysia-pets"."animals" ADD COLUMN "deleted_at" timestamp;--> statement-breakpoint
ALTER TABLE "elysia-pets"."breeds" ADD COLUMN "created_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "elysia-pets"."breeds" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "elysia-pets"."breeds" ADD COLUMN "deleted_at" timestamp;--> statement-breakpoint
ALTER TABLE "elysia-pets"."owners" ADD COLUMN "created_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "elysia-pets"."owners" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "elysia-pets"."owners" ADD COLUMN "deleted_at" timestamp;--> statement-breakpoint
ALTER TABLE "elysia-pets"."pets" ADD COLUMN "created_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "elysia-pets"."pets" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "elysia-pets"."pets" ADD COLUMN "deleted_at" timestamp;