# Data Engineering – Week 1

This repository contains my Week 1 work from Data Engineering training, covering Git and GitHub, PostgreSQL setup, SQL fundamentals, relational database design, normalization, and ER diagrams. It also tracks my progress with database performance and Redis.


## Day 1: Environment Setup and Git/GitHub

### Tasks Completed
- Installed and configured Git on Windows.
- Configured Git username and email.
- Initialized a local Git repository.
- Created a GitHub repository and connected it to the local repository.
- Practiced staging, committing, pushing, and working with branches.
- Installed PostgreSQL and configured pgAdmin.
- Created a database for SQL practice.

### Key Learnings
- Git version control fundamentals.
- GitHub repository management and basic branching.
- PostgreSQL database creation and management.
- Executing SQL queries using a database client.

## Day 2: SQL Fundamentals

### Tasks Completed
- Created database tables and inserted sample records.
- Retrieved records using `SELECT`.
- Filtered data using `WHERE`.
- Combined related records using `JOIN`.
- Used aggregate functions such as `COUNT()`, `SUM()`, and `AVG()`.
- Grouped records using `GROUP BY`.
- Practiced `LEFT JOIN` to include records even when matching records were unavailable in the related table.

### Key Learnings
- Retrieving and filtering data.
- Combining information from multiple tables.
- Summarizing data using aggregate functions.
- Understanding the difference between `JOIN` and `LEFT JOIN`.

## Day 3: Schema Design, Normalization, and ER Diagram

### Tasks Completed
- Designed a relational database schema for a college enrollment system.
- Created three related tables: `students`, `courses`, and `enrollments`.
- Defined primary keys and foreign keys.
- Applied constraints to maintain data integrity.
- Inserted sample student, course, and enrollment records.
- Created an ER diagram to represent table relationships.
- Studied First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF).

### Database Schema

#### 1. Students

| Column | Description |
|---|---|
| `student_id` | Primary key |
| `student_name` | Student's name |
| `email` | Unique email address |

#### 2. Courses

| Column | Description |
|---|---|
| `course_id` | Primary key |
| `course_name` | Course name |
| `fee` | Course fee |

#### 3. Enrollments

| Column | Description |
|---|---|
| `enrollment_id` | Primary key |
| `student_id` | Foreign key referencing `students` |
| `course_id` | Foreign key referencing `courses` |
| `enrollment_date` | Date of enrollment |

A unique constraint on `(student_id, course_id)` prevents the same student from enrolling in the same course more than once.

### Relationships

- One student can have multiple enrollments.
- One course can have multiple enrollments.
- The `enrollments` table connects students and courses.
- Together, these relationships represent a many-to-many relationship between students and courses.

### Normalization

- **First Normal Form (1NF):** Each column contains a single, atomic value.
- **Second Normal Form (2NF):** Every non-key attribute depends on the whole candidate key, not just part of it.
- **Third Normal Form (3NF):** Non-key attributes depend on the key, not on other non-key attributes.

Normalization helps reduce unnecessary data duplication and maintain data consistency.

### ER Diagram

The ER diagram represents the relationships between the students, courses, and enrollments tables.

**Diagram location:** `diagrams/day3-schema.png`

## Day 4: Indexes, Query Performance, and Redis

**Status: In Progress**

### Planned Tasks
- Learn the purpose of database indexes.
- Create and test indexes in PostgreSQL.
- Compare query execution plans using `EXPLAIN` and, where appropriate, `EXPLAIN ANALYZE`.
- Understand how indexes can improve data retrieval performance.
- Learn the basics of Redis and its use as an in-memory data store.
- Document practical examples and observations.

### Learning Objectives
- Understand how indexes affect query performance.
- Identify queries that may benefit from indexing.
- Learn the basic differences between PostgreSQL and Redis.

*This section will be updated after completing the assigned exercises.*

## Project Structure

```text
cred/
├── README.md
├── day1.sql
├── day2.sql
├── day3.sql
└── diagrams/
    └── day3-schema.png
```

## Technologies Used

- **Version Control:** Git, GitHub
- **Database:** PostgreSQL
- **Database Client:** pgAdmin
- **Query Language:** SQL
- **Database Concepts:** Joins, aggregate functions, constraints, normalization, relational schema design, and ER diagrams
- **Day 4 Topics:** Indexes, query performance, and Redis (in progress)

## How to Run the SQL Scripts

1. Install PostgreSQL and open pgAdmin, or connect using `psql`.
2. Create or select your practice database.
3. Clone this repository:

   ```bash
   git clone https://github.com/siri686/cred.git
   ```

4. Open the required `.sql` file in your SQL editor.
5. Execute the statements and verify the results.
6. Follow the appropriate order when running scripts that depend on tables created by earlier scripts.

**Note:** If a script creates tables that already exist, use a fresh practice database or reset the relevant tables before running it again.

## Key Outcomes

By the end of the first three days, I gained practical experience with:

- Git and GitHub workflows.
- PostgreSQL setup and database management.
- SQL data retrieval, filtering, joins, and aggregation.
- Primary keys, foreign keys, and database constraints.
- Relational schema design and normalization.
- ER diagrams and relationships between database tables.

## Conclusion

Week 1 is helping me build a strong foundation in Data Engineering through practical exercises in version control, SQL, PostgreSQL, and relational database design. I am continuing with database indexing, query performance, Redis, and final documentation as part of the remaining training tasks.
