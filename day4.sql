CREATE INDEX idx_students_email
ON students(email);

CREATE INDEX idx_enrollments_student_id
ON enrollments(student_id);

EXPLAIN
SELECT *
FROM enrollments
WHERE student_id = 1;

EXPLAIN ANALYZE
SELECT *
FROM enrollments
WHERE student_id = 1;