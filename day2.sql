-- Verify row counts
SELECT COUNT(*) AS total_departments FROM departments;
SELECT COUNT(*) AS total_employees FROM employees;

-- Test the relationship using JOIN
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.salary
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id
ORDER BY e.employee_id;

--Aggregate query
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
ORDER BY d.department_id;
