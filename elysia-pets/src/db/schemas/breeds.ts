import { uuid, varchar } from "drizzle-orm/pg-core";
import { elysiaSchema, timestamps } from "./elysia-schema";
import { relations } from "drizzle-orm";
import { animals } from "./animals";

export const breeds = elysiaSchema.table("breeds", {
  id: uuid().primaryKey().defaultRandom(),
  name: varchar().notNull(),
  animal_id: uuid()
    .references(() => animals.id, { onDelete: "set null" })
    .notNull(),
  ...timestamps,
});

export const breedsRelations = relations(breeds, ({ one }) => ({
  animal: one(animals, {
    fields: [breeds.animal_id],
    references: [animals.id],
  }),
}));
