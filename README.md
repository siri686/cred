# Data Engineering Training — Week 1 (Days 1–4)

## Overview

This repository documents my hands-on Data Engineering training, covering Git and GitHub workflows, PostgreSQL fundamentals, SQL queries, relational database design, normalization, indexing, and query performance.

The goal is to build practical skills in creating databases, maintaining data integrity, querying relational data, and understanding how indexes affect query execution.

## Technologies Used

- **Git and GitHub** — version control and source code management
- **PostgreSQL 17** — relational database management
- **pgAdmin 4** — database administration and SQL execution
- **SQL** — schema creation, data manipulation, joins, aggregation, and verification

## Repository Structure

```text
cred/
├── README.md
├── day1.sql
├── day2.sql
├── day3.sql
├── day4.sql
├── day3_normalization.md
└── screenshots/
```

Additional files, such as Redis or Python practice scripts, may be present as the training progresses.

## Day 1 — PostgreSQL Setup and SQL Fundamentals

### Objectives
- Set up PostgreSQL and connect through pgAdmin.
- Create relational tables and insert sample records.
- Practice basic SQL queries and database constraints.

### Work Completed
- Created `departments` and `employees` tables.
- Inserted sample department and employee records.
- Practiced `CREATE TABLE`, `INSERT`, and `SELECT`.
- Used primary keys, foreign keys, `NOT NULL`, `UNIQUE`, and `CHECK` constraints.
- Practiced retrieving and inspecting table data.

### Skills Learned
- PostgreSQL database interaction
- Table creation and data insertion
- Relational constraints and data integrity

## Day 2 — SQL Queries and Data Analysis

### Objectives
- Practice retrieving and analyzing relational data.
- Understand how to combine records and summarize information.

### Work Practiced
- Filtering and retrieving data using `SELECT` and `WHERE`.
- Combining related records using `JOIN`.
- Summarizing data using aggregate functions such as `COUNT` and `AVG`.
- Grouping results using `GROUP BY`.
- Organizing SQL practice queries in a version-controlled repository.

### Skills Learned
- Relational data retrieval
- SQL joins and aggregation
- Basic data analysis using SQL

## Day 3 — Schema Design and Normalization

### Objectives
- Design a normalized three-table relational schema.
- Establish relationships between students, courses, and enrollments.
- Verify database constraints and relationships in PostgreSQL.

### Tables Designed

| Table | Purpose |
|---|---|
| `students` | Stores student IDs, names, and email addresses |
| `courses` | Stores course IDs, course names, and fees |
| `enrollments` | Connects students to courses and stores enrollment dates |

### Relationships

- One student can enroll in multiple courses.
- One course can have multiple students.
- The `enrollments` table implements the many-to-many relationship between students and courses.

### Constraints Implemented
- `PRIMARY KEY` for record identification.
- `FOREIGN KEY` to maintain relationships between tables.
- `UNIQUE` to prevent duplicate student emails and duplicate student-course enrollment pairs.
- `NOT NULL` to require essential values.
- `CHECK` to prevent negative course fees.

### Normalization Concepts
- **First Normal Form (1NF):** Keep values atomic and records identifiable.
- **Second Normal Form (2NF):** Examine functional dependencies and avoid partial dependencies on candidate keys.
- **Third Normal Form (3NF):** Keep student and course attributes in their respective tables rather than unnecessarily duplicating descriptive information in enrollment records.

### Verification
- Checked table existence and row counts.
- Used a three-table `JOIN` to inspect student-course relationships.
- Inspected PostgreSQL constraint metadata.
- Prepared a constraint test for the non-negative course fee rule.

See `day3_normalization.md` and the `screenshots/` folder for the normalization explanation and available verification evidence.

## Day 4 — Indexes and Query Performance

### Objectives
- Understand how database indexes support data retrieval.
- Practice creating indexes and inspecting query execution plans.
- Compare query plans using PostgreSQL's `EXPLAIN` and `EXPLAIN ANALYZE`.

### Work Practiced
- Created an index on `enrollments(student_id)`.
- Examined index usage for queries filtering by `student_id`.
- Used `EXPLAIN` to inspect the planned execution strategy.
- Used `EXPLAIN ANALYZE` to inspect actual execution behavior and timing.
- Investigated why PostgreSQL may choose a sequential scan rather than an index scan for a small table.

### Key Learning
An index can improve data retrieval for suitable queries, but it does not guarantee an index scan. PostgreSQL's query planner considers factors such as table size, available statistics, and estimated execution cost.

`EXPLAIN` shows the planned execution strategy, while `EXPLAIN ANALYZE` executes the query and reports actual execution details.

## Verification and Evidence

SQL files are maintained in this repository so that the exercises can be reviewed and executed in PostgreSQL.

The verification evidence should demonstrate:
- Successful table creation and data retrieval.
- Correct relationships between related tables.
- The constraints recorded by PostgreSQL.
- Query execution plans and index behavior.

Screenshots should represent actual results from the local PostgreSQL environment.

## Version Control Workflow

Git is used to track changes to SQL scripts, documentation, and verification evidence.

Typical workflow:

```bash
git status
git add README.md day1.sql day2.sql day3.sql day4.sql
git commit -m "Update Data Engineering training documentation"
git push origin feature/git-practice
```

Add any new documentation or screenshots to the staging command when needed.

## Learning Outcomes

Through these exercises, I am developing practical skills in:

- PostgreSQL setup and database interaction.
- SQL queries, joins, and aggregate functions.
- Relational schema design and normalization concepts.
- Primary keys, foreign keys, and data integrity constraints.
- Index creation and query-plan analysis.
- Git and GitHub version control.

## Conclusion

Week 1 is helping me build a strong foundation in Data Engineering through practical exercises in version control, SQL, PostgreSQL, and relational database design. I am continuing with database indexing, query performance, Redis, and final documentation as part of the remaining training tasks.
