--SQL queries
SELECT employee_name, salary
FROM employees
WHERE salary > 50000;


SELECT
    e.employee_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;

--Count employees sby departments
SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Find the second-highest distinct salary
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);