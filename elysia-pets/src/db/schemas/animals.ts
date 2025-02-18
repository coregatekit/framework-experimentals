import { pgEnum, pgTable, uuid, varchar } from "drizzle-orm/pg-core";

export const animalTypeEnum = pgEnum("animal_type", [
  "Mammals",
  "Birds",
  "Reptiles",
  "Amphibians",
  "Invertebrates",
  "Fish",
]);

export const animals = pgTable("animals", {
  id: uuid().primaryKey(),
  name: varchar({ length: 100 }).notNull(),
  type: animalTypeEnum().notNull(),
});
