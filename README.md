# Pokémon SV VGC Worlds — Database Final Project

Relational database project built around **Pokémon Scarlet/Violet VGC Worlds** data. The database tracks **players, tournaments, teams (6 Pokémon), movesets, items/tera types, match results, and combat points**, with an ERD + data dictionary and an MS Access front-end connected via ODBC.

---

## Repository Contents

- **PokemonVGC.sql**  
  SQL script to create the database schema (tables, keys, relationships) and support loading data.

- **PokemonVGC_Database.accdb**  
  MS Access database front-end (linked tables + queries/forms/reports).

- **Final Project ERD.png**  
  Crow’s Foot ERD showing entities, PK/FK fields, and relationships.

- **Data Dictionary.pdf**  
  Full data dictionary: entities, attributes, data types, PK/FK details, and constraints.

- **Pokemon SV VGC Worlds(3NF).csv**  
  Normalized dataset export aligned to the 3NF design (used for importing/testing).

---

## Schema Overview (Tables)

- **Player** — player identity + country  
- **Pokemon** — species, types, ability  
- **Tournament** — name, location, dates  
- **Team** — teams owned by players  
- **TeamRosters** — bridging table: Team ↔ Pokémon (includes **Slot_No 1–6**)  
- **PokemonMoves** — moves per Pokémon (Move_Slot 1–4)  
- **Tera_Item** — tera type + held item per Pokémon (by player + tournament context)  
- **Match** — tournament matches (Team 1 vs Team 2, winner, score, round placement)  
- **CombatPoints** — combat points earned per team per tournament  

> See **Final Project ERD.png** and **Data Dictionary.pdf** for complete field-level details.

---

## How to Run (SQL Server)

1. Open **SQL Server Management Studio (SSMS)** and connect to your SQL instance.
2. Create/select your target database (depending on how your script is written).
3. Run the script:  
   - `PokemonVGC.sql`
4. (Optional) Load data from the CSV:
   - Use **Import Flat File** or `BULK INSERT` depending on your setup.

---

## How to Use the Access Front-End (ODBC Linked Tables)

1. Install a SQL Server ODBC driver (Microsoft ODBC Driver for SQL Server).
2. Create an **ODBC DSN** pointing to your SQL Server + database.
3. Open:  
   - `PokemonVGC_Database.accdb`
4. In Access:
   - **External Data → New Data Source → From Database → ODBC Database**
   - Choose **Link to the data source**
   - Select your DSN and link the tables

---

## Features / Example Queries

- **Full Team Roster:** Player → Team → 6 Pokémon (ordered by Slot_No)
- **Pokémon Usage:** how often each Pokémon appears in teams
- **Item / Tera Usage:** aggregate held items and tera types
- **Combat Points Leaderboard:** total points by player/team/tournament
- **Match Outcomes:** win rate and performance by round placement

---

## Tools Used

- **Microsoft SQL Server + SSMS**
- **Microsoft Access**
- **ODBC** (Access ↔ SQL Server connection)

---

## Notes

- Slot and move constraints are represented by:
  - `TeamRosters.Slot_No` (1–6)
  - `PokemonMoves.Move_Slot` (1–4)

For exact data types, PK/FK relationships, and constraints, refer to **Data Dictionary.pdf**.
