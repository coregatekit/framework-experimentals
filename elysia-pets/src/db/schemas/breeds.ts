import { uuid, varchar } from "drizzle-orm/pg-core";
import { elysiaSchema } from "./elysia-schema";
import { relations } from "drizzle-orm";
import { animals } from "./animals";

export const breeds = elysiaSchema.table("breeds", {
  id: uuid().primaryKey(),
  name: varchar().notNull(),
  animal_id: uuid()
    .references(() => animals.id, { onDelete: "set null" })
    .notNull(),
});

export const breedsRelations = relations(breeds, ({ one }) => ({
  animal: one(animals, {
    fields: [breeds.animal_id],
    references: [animals.id],
  }),
}));
