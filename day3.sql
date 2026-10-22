-- 1. Create students table
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE
);

-- 2. Create courses table
CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    fee NUMERIC(10, 2) NOT NULL CHECK (fee >= 0)
);

-- 3. Create enrollments table
CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    UNIQUE (student_id, course_id)
);

-- 4. Insert sample students
INSERT INTO students VALUES
    (1, 'Siri', 'siri@example.com'),
    (2, 'Rahul', 'rahul@example.com'),
    (3, 'Priya', 'priya@example.com');

-- 5. Insert sample courses
INSERT INTO courses VALUES
    (101, 'SQL Basics', 3000.00),
    (102, 'Python Basics', 4000.00),
    (103, 'Data Engineering', 5000.00);

-- 6. Insert enrollment records
INSERT INTO enrollments VALUES
    (1, 1, 101, '2026-10-15'),
    (2, 1, 103, '2026-10-16'),
    (3, 2, 102, '2026-10-16'),
    (4, 3, 101, '2026-10-17');


SELECT * FROM students;
SELECT * FROM enrollments;
SELECT * FROM courses;


-- 1. Verify that all three tables exist
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN ('students', 'courses', 'enrollments')
ORDER BY table_name;


-- 2. Verify the number of records in each table
SELECT
    (SELECT COUNT(*) FROM students) AS total_students,
    (SELECT COUNT(*) FROM courses) AS total_courses,
    (SELECT COUNT(*) FROM enrollments) AS total_enrollments;


-- 3. Verify student-course relationships using JOIN
SELECT
    s.student_name,
    s.email,
    c.course_name,
    c.fee,
    e.enrollment_date
FROM students AS s
JOIN enrollments AS e
    ON s.student_id = e.student_id
JOIN courses AS c
    ON e.course_id = c.course_id
ORDER BY s.student_name;


-- 4. Verify primary keys, foreign keys, and unique constraints
SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type
FROM information_schema.table_constraints AS tc
WHERE tc.table_schema = 'public'
  AND tc.table_name IN ('students', 'courses', 'enrollments')
  AND tc.constraint_type IN ('PRIMARY KEY', 'FOREIGN KEY', 'UNIQUE')
ORDER BY tc.table_name, tc.constraint_type;


-- 5. Verify table count, row counts, foreign keys, and JOIN results in one output
SELECT
    (SELECT COUNT(*)
     FROM information_schema.tables
     WHERE table_schema = 'public'
       AND table_name IN ('students', 'courses', 'enrollments'))
        AS tables_verified,

    (SELECT COUNT(*) FROM students)
        AS total_students,

    (SELECT COUNT(*) FROM courses)
        AS total_courses,

    (SELECT COUNT(*) FROM enrollments)
        AS total_enrollments,

    (SELECT COUNT(*)
     FROM information_schema.table_constraints
     WHERE constraint_schema = 'public'
       AND table_name = 'enrollments'
       AND constraint_type = 'FOREIGN KEY')
        AS foreign_keys_verified,

    (SELECT COUNT(*)
     FROM students AS s
     JOIN enrollments AS e ON s.student_id = e.student_id
     JOIN courses AS c ON e.course_id = c.course_id)
        AS join_rows_verified;


-- 6. Test the CHECK constraint (expected to fail because fee is negative)
-- Run separately; do not expect this statement to succeed.
INSERT INTO courses (course_id, course_name, fee)
VALUES (999, 'Invalid Fee Test', -100);