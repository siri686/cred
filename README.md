# Data Engineering Training — Week 1

**Repository:** [cred](https://github.com/siri686/cred)  
**Focus:** PostgreSQL, SQL, database design, query optimization, Redis, and version control

## Overview

This repository contains hands-on exercises completed during my Data Engineering training. The work progresses from environment setup and SQL fundamentals to relational schema design, normalization, index analysis, and caching with Redis.

The repository includes SQL scripts, database design documentation, an entity-relationship diagram, verification evidence, and a Python script for PostgreSQL-to-Redis caching.

## Technology Stack

| Technology | Purpose |
|---|---|
| Git and GitHub | Version control and source code management |
| PostgreSQL 17 | Relational database and SQL execution |
| pgAdmin 4 | Database administration and query verification |
| SQL | Table creation, querying, joins, constraints, and aggregation |
| Python 3.12 | Database access and caching workflow |
| Redis | In-memory caching |
| Docker Desktop | Running Redis in a container |
| `psycopg2-binary` | Connecting Python to PostgreSQL |
| `redis-py` | Connecting Python to Redis |

## Training Progress

- **Day 1:** PostgreSQL environment setup and database fundamentals
- **Day 2:** SQL querying, joins, and aggregation
- **Day 3:** Relational schema design, normalization, and verification
- **Day 4:** Indexes, query execution plans, and performance analysis
- **Additional practice:** Redis setup, Docker, and Python-based caching

---

## Day 1 — PostgreSQL Setup and Database Fundamentals

### Objectives
- Configure the local PostgreSQL environment.
- Connect to PostgreSQL using pgAdmin.
- Create relational tables and insert sample records.
- Practice database constraints and basic SQL operations.

### Implementation
- Installed and configured PostgreSQL and pgAdmin.
- Created a practice database.
- Created `departments` and `employees` tables.
- Inserted sample department and employee data.
- Practiced `CREATE TABLE`, `INSERT`, and `SELECT`.
- Applied primary keys, foreign keys, `NOT NULL`, `UNIQUE`, and `CHECK` constraints.

### Verification
- Inspected table data using SELECT queries.
- Practiced checking record counts and relationships.
- Organized SQL scripts for repeatable practice.

### Learning Outcomes
- PostgreSQL environment setup and database connectivity.
- Relational tables and basic data manipulation.
- Constraints and referential integrity.

**Files:** `day1.sql`, `day1_postgresql.md`

## Day 2 — SQL Fundamentals and Data Analysis

### Objectives
- Retrieve and filter records.
- Combine data from related tables.
- Summarize records using aggregate functions.

### Implementation
- Used `SELECT` and `WHERE` to retrieve filtered records.
- Practiced `JOIN` to combine employee and department information.
- Used `COUNT`, `AVG`, and other aggregate functions.
- Applied `GROUP BY` to calculate department-level summaries.
- Practiced `LEFT JOIN` to retain rows from the left table even when no matching row exists.

### Verification
- Executed SQL exercises against the practice tables.
- Reviewed the output of filtering, joining, and aggregation queries.

### Learning Outcomes
- SQL data retrieval and filtering.
- Joining relational tables.
- Aggregate queries and grouped analysis.

**File:** `day2.sql`

## Day 3 — Schema Design, Normalization, and ER Diagram

### Objectives
- Design a normalized three-table schema.
- Establish primary-key and foreign-key relationships.
- Apply constraints to maintain data integrity.
- Verify the schema and explain normalization principles.

### Schema Design

The college enrollment example uses three related tables:

| Table | Responsibility |
|---|---|
| `students` | Stores student IDs, names, and email addresses |
| `courses` | Stores course IDs, course names, and fees |
| `enrollments` | Connects students to courses and stores enrollment dates |

### Relationships

- One student can have multiple enrollments.
- One course can have multiple enrollments.
- `enrollments` implements the many-to-many relationship between students and courses.

### Constraints
- `PRIMARY KEY` identifies each record.
- `FOREIGN KEY` maintains relationships between tables.
- `UNIQUE` prevents duplicate email addresses and duplicate student-course enrollment pairs.
- `NOT NULL` requires essential values.
- `CHECK (fee >= 0)` prevents negative course fees.

### Normalization Concepts

- **First Normal Form (1NF):** Each column stores an atomic value, and records are identifiable.
- **Second Normal Form (2NF):** Non-key attributes must depend on the whole of every relevant candidate key, without partial dependencies.
- **Third Normal Form (3NF):** Non-key attributes should depend on keys rather than transitively on other non-key attributes.

Separating student, course, and enrollment information helps reduce unnecessary duplication and maintain consistency. Normalization is assessed from the schema's functional dependencies, not merely from the number of tables.

### Verification
- Checked the existence of the three tables.
- Verified sample record counts.
- Used a three-table JOIN to inspect student-course relationships.
- Inspected PostgreSQL constraint metadata.
- Prepared a negative-fee test to verify the `CHECK` constraint.

### Learning Outcomes
- Relational schema design.
- Normalization principles.
- Referential integrity and uniqueness constraints.
- SQL-based database verification.

**Files:** `day3.sql`, `diagrams/day3-schema.png`, `screenshots/day3_normalization_verification.png`  
**Documentation:** See the normalization explanation and verification notes maintained with the SQL exercises.

## Day 4 — Indexes and Query Performance

### Objectives
- Understand how indexes support data retrieval.
- Inspect query execution plans.
- Understand why PostgreSQL may choose a sequential scan instead of an index scan.

### Implementation
- Practiced creating an index on `enrollments(student_id)`.
- Used `EXPLAIN` to inspect planned query execution.
- Used `EXPLAIN ANALYZE` to inspect actual execution behavior and timing.
- Investigated how table size and the query planner's cost estimates affect index usage.

### Key Learning

An index does not guarantee that PostgreSQL will use an index scan. The planner evaluates estimated costs, table size, available statistics, and query conditions before choosing an execution plan.

`EXPLAIN` displays the planned execution strategy. `EXPLAIN ANALYZE` executes the query and reports actual execution information.

### Verification Evidence
Query plans and performance observations should be documented using the actual output produced in PostgreSQL.

**File:** `day4.sql`

## Additional Practice — Redis, Docker, and Python Caching

### Objectives
- Run Redis in a Docker container.
- Connect Python to PostgreSQL and Redis.
- Cache a database query result to reduce repeated database reads.

### Implementation
- Ran Redis using Docker Desktop with port mapping `6379:6379`.
- Installed the Python dependencies for PostgreSQL and Redis connectivity.
- Created `redis_cache.py` to retrieve the enrollment count from PostgreSQL.
- Stored the result in Redis under the key `enrollment_count`.
- Configured a cache expiration time of 300 seconds.
- Practiced reading the cached value and checking its time to live (TTL).

### Caching Workflow

1. Python connects to PostgreSQL.
2. The script checks Redis for the cached result.
3. If the result is cached, it can be reused.
4. If the result is missing, the script queries PostgreSQL and stores the result in Redis.
5. The cached entry expires according to the configured TTL.

### Learning Outcomes
- Redis fundamentals.
- Docker-based service setup.
- Python database connectivity.
- Cache misses, cache hits, and expiration.

**Files:** `redis_cache.py`, `requirements.txt`

---

## Repository Structure

```text
cred/
├── README.md
├── day1.sql
├── day1_postgresql.md
├── day2.sql
├── day3.sql
├── day4.sql
├── redis_cache.py
├── requirements.txt
├── diagrams/
│   └── day3-schema.png
└── screenshots/
    └── day3_normalization_verification.png
```

The structure above reflects the intended repository contents. Keep the entries aligned with the files actually present on the `main` branch.

## Running the SQL Exercises

### Prerequisites
- PostgreSQL installed and running.
- pgAdmin 4 or another PostgreSQL client.
- A practice database.

### Steps
1. Clone the repository:

   ```bash
   git clone https://github.com/siri686/cred.git
   cd cred
   ```

2. Open pgAdmin and connect to your practice database.
3. Open the relevant `.sql` file in Query Tool.
4. Execute the statements in the appropriate order.
5. Inspect the result grid and messages to verify execution.

**Important:** Some scripts create tables and insert sample records. Do not repeatedly execute the complete script against an already populated database. Use a fresh practice database or reset the relevant tables carefully before rerunning it.

## Running the Redis Python Exercise

### Prerequisites
- Python installed.
- Docker Desktop running.
- A Redis container accessible on the configured host and port.
- PostgreSQL and the practice tables populated.

Install the Python dependencies:

```bash
pip install -r requirements.txt
```

Ensure the Redis container is running and PostgreSQL connection settings in `redis_cache.py` match your local environment. Run:

```bash
python redis_cache.py
```

Do not commit database passwords, access tokens, or other secrets to the repository. Use environment variables or another appropriate local configuration method for credentials.

## Improvements and Verification

The training work is being strengthened through:
- Clearer SQL organization and database verification queries.
- Explicit documentation of normalization concepts and relational constraints.
- Verification of table counts and JOIN results.
- Inspection of index usage and query execution plans.
- Documentation of the Redis caching workflow and its output.

Verification statements should reflect the actual results observed in the local environment. Screenshots are intended to support the relevant SQL and database explanations.

## Overall Learning Outcomes

This training work develops practical experience in:

- Git and GitHub workflows.
- PostgreSQL setup and relational database operations.
- SQL filtering, joins, and aggregation.
- Schema design, normalization, and referential integrity.
- Indexes and query execution plans.
- Python-based database connectivity.
- Redis caching and Docker-based service setup.

## Conclusion

The repository documents my progress through foundational Data Engineering tasks, from relational database setup and SQL querying to database design, performance analysis, and caching. The scripts, documentation, and verification evidence provide a record of the practical exercises and concepts covered during training.
