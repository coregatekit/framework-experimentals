import { elysiaSchema, timestamps } from "./elysia-schema";
import { pgEnum, uuid, varchar } from "drizzle-orm/pg-core";

export const animalTypeEnum = pgEnum("animal_type", [
  "Mammals",
  "Birds",
  "Reptiles",
  "Amphibians",
  "Invertebrates",
  "Fish",
]);

export const animals = elysiaSchema.table("animals", {
  id: uuid().primaryKey().defaultRandom(),
  name: varchar({ length: 100 }).notNull(),
  type: animalTypeEnum().notNull(),
  ...timestamps
});
