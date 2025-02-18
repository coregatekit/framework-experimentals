import { relations } from "drizzle-orm";
import { elysiaSchema } from "./elysia-schema";
import { pgEnum, uuid, varchar } from "drizzle-orm/pg-core";
import { breeds } from "./breeds";
import { owners } from "./owners";

export const PetGenderEnum = pgEnum("pet_gender", ["Male", "Female"]);

export const pets = elysiaSchema.table("pets", {
  id: uuid().primaryKey(),
  pet_code: varchar({ length: 50 }).unique().notNull(),
  name: varchar({ length: 100 }).notNull(),
  breed_id: uuid()
    .references(() => breeds.id, { onDelete: "restrict" })
    .notNull(),
  owner_id: uuid()
    .references(() => owners.id, { onDelete: "cascade" })
    .notNull(),
  gender: PetGenderEnum().notNull(),
  color: varchar({ length: 50 }),
  weight: varchar({ length: 10 }),
  height: varchar({ length: 10 }),
});

export const petsRelations = relations(pets, ({ one }) => ({
  breed: one(breeds, {
    fields: [pets.breed_id],
    references: [breeds.id],
  }),
  owner: one(owners, {
    fields: [pets.owner_id],
    references: [owners.id],
  }),
}));
