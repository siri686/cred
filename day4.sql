-- 1. Check PostgreSQL version
SELECT version();

-- 2. Check the current database
SELECT current_database();

-- 3. List existing tables
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;

-- Check primary keys and foreign keys
SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type,
    kcu.column_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
    ON tc.constraint_name = kcu.constraint_name
   AND tc.table_schema = kcu.table_schema
WHERE tc.table_schema = 'public'
  AND tc.table_name IN ('students', 'courses', 'enrollments')
  AND tc.constraint_type IN ('PRIMARY KEY', 'FOREIGN KEY')
ORDER BY tc.table_name, tc.constraint_type;

SELECT
    table_name,
    constraint_name,
    constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'public'
  AND table_name IN ('students', 'courses', 'enrollments')
ORDER BY table_name, constraint_type;



-- Day 4: Indexes and Query Performance

-- 1. Check existing indexes first
SELECT indexname, indexdef
FROM pg_indexes
WHERE schemaname = 'public'
  AND tablename IN ('students', 'enrollments')
ORDER BY tablename, indexname;

-- 2. Create an index for enrollment lookups
CREATE INDEX IF NOT EXISTS idx_enrollments_student_id
ON enrollments(student_id);

CREATE INDEX IF NOT EXISTS idx_students_email
ON students(email);
-- 3. Update table statistics
ANALYZE enrollments;

-- 4. View the query execution plan
EXPLAIN
SELECT *
FROM enrollments
WHERE student_id = 1;

-- 5. Measure actual execution time
EXPLAIN ANALYZE
SELECT *
FROM enrollments
WHERE student_id = 1;
