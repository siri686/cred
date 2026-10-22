# Data Engineering – Week 1

Week 1 work from my Data Engineering training: Git and GitHub setup, PostgreSQL database setup, SQL fundamentals, and relational database schema design with normalization and an ER diagram.

## Week 1 progress

| **Day** | **Focus** | **Status** |
|---|---|---|
| Day 1 | Git/GitHub and PostgreSQL setup | Done |
| Day 2 | SQL fundamentals, joins, and aggregate functions | Done |
| Day 3 | Schema design, normalization, and ER diagram | Done |
| Day 4 | Indexes, query performance, and Redis | In progress |
| Day 5 | Review and documentation | Not yet completed |

## Day 1: Environment setup and Git/GitHub

- Set up Git on Windows and configured the Git username and email.
- Initialized a local Git repository.
- Created a GitHub repository and connected it to the local repository.
- Practiced staging, committing, pushing, and working with branches.
- Installed PostgreSQL and configured pgAdmin.
- Created a database for SQL practice.

### Key learnings

- Git version control basics.
- GitHub repository and branch workflow.
- PostgreSQL database setup and management.

## Day 2: SQL fundamentals

- Practiced creating tables and inserting sample records.
- Used `SELECT` statements to retrieve data.
- Applied `WHERE` conditions to filter records.
- Practiced `JOIN` queries to combine data from related tables.
- Used aggregate functions such as `COUNT()`, `SUM()`, and `AVG()`.
- Practiced `GROUP BY` to summarize data.

### Key learnings

- Retrieving and filtering data.
- Combining records from multiple tables.
- Summarizing data using aggregate functions.

## Day 3: Schema design, normalization, and ER diagram

- Designed a relational schema for a college enrollment database.
- Created three tables: `students`, `courses`, and `enrollments`.
- Defined primary keys and foreign key relationships.
- Added constraints to maintain data integrity.
- Inserted sample records for practice.
- Created an ER diagram showing entities and their relationships.
- Practiced normalization concepts: 1NF, 2NF, and 3NF.

### Database tables

**Students**
- `student_id` – Primary key
- `student_name`
- `email` – Unique constraint

**Courses**
- `course_id` – Primary key
- `course_name`
- `fee`

**Enrollments**
- `enrollment_id` – Primary key
- `student_id` – Foreign key
- `course_id` – Foreign key
- `enrollment_date`
- Unique constraint on `(student_id, course_id)`

### Relationships

- One student can have multiple enrollments.
- One course can have multiple enrollments.
- The `enrollments` table connects students and courses, representing a many-to-many relationship.

### Normalization

- **1NF:** Each column contains atomic values.
- **2NF:** Non-key attributes depend on the whole candidate key.
- **3NF:** Non-key attributes depend on the key, not on other non-key attributes.

### ER diagram

The ER diagram is stored at:

`diagrams/day3-schema.png`

## Project structure

```text
cred/
├── README.md
├── day1.sql
├── day2.sql
├── day3.sql
└── diagrams/
    └── day3-schema.png
```


## Summary

During the first three days, I practiced Git/GitHub workflows, PostgreSQL setup, SQL querying, relational schema design, database constraints, normalization, and EDuring the first three days, I practiced Git/GitHub workflows, PostgreSQL setup, SQL querying, relational schema design, database constraints, normalization, and ER diagram creation.R diagram creation.
