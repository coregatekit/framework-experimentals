import { elysiaSchema } from "./elysia-schema";
import { uuid, varchar } from "drizzle-orm/pg-core";

export const owners = elysiaSchema.table("owners", {
  id: uuid().primaryKey(),
  owner_code: varchar({ length: 50 }).unique().notNull(),
  name: varchar({ length: 100 }).notNull(),
  email: varchar({ length: 100 }),
  phone_number: varchar({ length: 10 }).notNull(),
});
