import { drizzle, PostgresJsDatabase } from "drizzle-orm/postgres-js";
import { Sql } from "postgres";
import { animals } from "./schemas/animals";
import { breeds } from "./schemas/breeds";

async function main() {
  console.log("🚀 Seeding database...");

  try {
    const db = drizzle(process.env.DATABASE_URL!);

    await seedAnimals(db);
    await seedBreeds(db);

    console.log("✅ Seeding complete!");
    process.exit(0);
  } catch (error) {
    console.log("❌ Seeding failed!");
    console.error(error);
    process.exit(1);
  }
}

type AnimalType =
  | "Mammals"
  | "Birds"
  | "Reptiles"
  | "Amphibians"
  | "Invertebrates"
  | "Fish";

async function seedAnimals(
  db: PostgresJsDatabase<Record<string, never>> & { $client: Sql<{}> }
) {
  try {
    const animalData: { id: string; name: string; type: AnimalType }[] = [
      {
        id: "1F709365-7BA5-418D-B5A4-CB9C23672166",
        name: "Dog",
        type: "Mammals",
      },
      {
        id: "2F709365-7BA5-418D-B5A4-CB9C23672167",
        name: "Cat",
        type: "Mammals",
      },
      {
        id: "3F709365-7BA5-418D-B5A4-CB9C23672168",
        name: "Bird",
        type: "Birds",
      },
      {
        id: "4F709365-7BA5-418D-B5A4-CB9C23672169",
        name: "Fish",
        type: "Fish",
      },
      {
        id: "5F709365-7BA5-418D-B5A4-CB9C23672170",
        name: "Rabbit",
        type: "Mammals",
      },
      {
        id: "6F709365-7BA5-418D-B5A4-CB9C23672171",
        name: "Hamster",
        type: "Mammals",
      },
      {
        id: "7F709365-7BA5-418D-B5A4-CB9C23672172",
        name: "Cow",
        type: "Mammals",
      },
    ];
    await db.insert(animals).values(animalData).execute();
  } catch (error) {
    throw new Error(`Failed to seed animals: ${error}`);
  }
}

async function seedBreeds(
  db: PostgresJsDatabase<Record<string, never>> & { $client: Sql<{}> }
) {
  try {
    const breedData: { id: string; name: string; animal_id: string }[] = [
      {
        id: "B22C1D5C-6DFE-4A07-A2AF-DC7570305A8B",
        name: "Golden Retriever",
        animal_id: "6F709365-7BA5-418D-B5A4-CB9C23672171",
      },
      {
        id: "4C88109B-4CA8-49AB-8FD6-C676311E9657",
        name: "Siamese",
        animal_id: "2F709365-7BA5-418D-B5A4-CB9C23672167",
      },
      {
        id: "376EEAB5-99AD-4433-B0E8-82E3E60ED053",
        name: "Parrot",
        animal_id: "3F709365-7BA5-418D-B5A4-CB9C23672168",
      },
      {
        id: "617967F6-4458-4D27-971C-C52A1ADB1CBF",
        name: "Goldfish",
        animal_id: "4F709365-7BA5-418D-B5A4-CB9C23672169",
      },
      {
        id: "8025FC5D-9FA4-4C82-94D8-964EE0D43198",
        name: "Scottish Fold",
        animal_id: "2F709365-7BA5-418D-B5A4-CB9C23672167",
      },
      {
        id: "2710A996-6F5E-45F2-9AFD-F2F8BA87687F",
        name: "Bulldog",
        animal_id: "6F709365-7BA5-418D-B5A4-CB9C23672171",
      },
    ];
    await db.insert(breeds).values(breedData).execute();
  } catch (error) {
    throw new Error(`Failed to seed breeds: ${error}`);
  }
}

main();
