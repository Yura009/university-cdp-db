# 📚 University CDP-DB

A PostgreSQL-based CDP (Career Development Program) database project. This repository contains schema definitions, test data scripts, indexes, triggers, functions, and analysis to support a simple educational platform with students, subjects, phones, grades, and auditing logic.

---

## 🗂️ Project Structure

```
university-cdp-db/
├── schema/
│   ├── init_schema.sql         # CREATE TABLE statements for students, phones, subjects, exam_results
│   └── indexes.sql             # Index creation scripts (B-Tree, GIN, GiST, Hash)
├── data/
│   ├── insert_students.sql     # Population script for 100,000 students
│   ├── insert_phones.sql       # Population script for 100,000 phone numbers
│   ├── insert_subjects.sql     # Population script for 1,000 subjects
│   └── insert_exam_results.sql # Population logic for 1 million exam results
├── scripts/
│   ├── add_constraint_for_name.sql                # Validation to block '@', '#', '$' in student names
│   ├── update_student_timestamp.sql               # Trigger to auto-update updated_datetime on student update
│   ├── queries.sql                                # Customer queries for selecting data
│   ├── create_snapshot_table.sql                  # Creation snapshot of table
│   ├── find_average_mark_for_input_subject.sql    # Creation snapshot of table
├── doc/
│   ├── index_investigation.md  # Performance analysis of different index types
│   └── ERD-diagram.png         # Entity-Relationship Diagram of the database
└── README.md                   # This documentation file
```

---

## 🛠️ Setup Instructions

**1. Create the database and schema**
```bash
psql -U <your_user> -d <your_db> -f schema/init_schema.sql
```

**2. Populate test data**
```bash
psql -U <your_user> -d <your_db> -f data/insert_students.sql
psql -U <your_user> -d <your_db> -f data/insert_phones.sql
psql -U <your_user> -d <your_db> -f data/insert_subjects.sql
psql -U <your_user> -d <your_db> -f data/insert_exam_results.sql
```

**3. Build indexes**
```bash
psql -U <your_user> -d <your_db> -f schema/indexes.sql
```

**4. Add triggers and helper functions**
```bash
psql -U <your_user> -d <your_db> -f schema/triggers.sql
psql -U <your_user> -d <your_db> -f schema/functions.sql
```

**5. Run supporting scripts**
```bash
psql -U <your_user> -d <your_db> -f scripts/validate_student_name.sql
psql -U <your_user> -d <your_db> -f scripts/update_timestamp_trigger.sql
psql -U <your_user> -d <your_db> -f scripts/immutable_address_trigger.sql
```

**6. Analyze performance and review documentation**
- See `doc/index_investigation.md` for index timing & storage comparisons.
- Diagram available in `doc/ERD-diagram.png`.

---

## 📦 Main Components

### Schema (`schema/init_schema.sql`)

Defines four main tables with proper constraints:
- `students(name, surname, date_of_birth, primary_skill, timestamps)`
- `phones(student_id → students, phone_number)`
- `subjects(subject_name, tutor, description)`
- `exam_results(student_id → students, subject_id → subjects, mark INT [1–5])`

### Indexes (`schema/indexes.sql`)

Enhance query performance using:
- **B-Tree** on `students.name` for exact search
- **Hash** as alternative index
- **GIN + pg_trgm** (trigram) for partial match on `surname` and phone numbers
- **GiST + pg_trgm** for space-efficient text search
- Foreign-key B-Tree indexes for fast JOINs

### Triggers (`schema/indexes.sql`)

- Automatic updating of `students.updated_datetime` on UPDATE
- Validation constraint rejecting special characters in student names
- Snapshot mechanism: insert new snapshot record when an exam result is inserted or updated
- Immutable `student_address` table with logic to offload updates to a history table

### Functions (`schema/scripts/`)

- `add_constraint_for_name.sql`
- `create_snapshot_table.sql`
- `find_average_mark_for_input_subject.sql`
- `find_average_mark_for_input_user.sql`
- `find_students_in_red_zone.sql`
- `queries.sql`
- `update_student_timestamp.sql`

---

## ✅ Usage Tips

- Use `\dt` or `SELECT * FROM information_schema.tables` in `psql` to view tables
- Use `EXPLAIN ANALYZE` to inspect query plans and validate index usage
- The project is modular—run each category (schema, data, indexes, triggers, functions) independently for clarity

---

## 💬 Contributions & Questions

Feel free to explore, test queries, or extend functionality.  
If you run into issues, open an issue or reach out!

Enjoy building with **University CDP-DB**!