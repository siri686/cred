-- 1. Create tables
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(department_id),
    salary NUMERIC(10, 2) CHECK (salary >= 0)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Insert sample data
INSERT INTO employees
    (employee_id, employee_name, department_id, salary)
VALUES
    (1, 'Asha', 10, 45000),
    (2, 'Rahul', 20, 55000),
    (3, 'Priya', 10, 60000),
    (4, 'Arjun', 30, 40000),
    (5, 'Neha', 20, 65000);


INSERT INTO departments (department_id, department_name)
VALUES
    (10, 'Engineering'),
    (20, 'Analytics'),
    (30, 'Operations');

-- 3. Display records
SELECT * FROM employees;
SELECT * FROM departments;
