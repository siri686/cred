SELECT version();
SELECT current_database();


-- Day 1: PostgreSQL database and SQL practice

-- 1. Create departments first
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Create employees with a foreign key
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(department_id),
    salary NUMERIC(10, 2) CHECK (salary >= 0)
);

-- 3. Insert department records first
INSERT INTO departments (department_id, department_name)
VALUES
    (10, 'Engineering'),
    (20, 'Analytics'),
    (30, 'Operations');

-- 4. Insert employee records
INSERT INTO employees
    (employee_id, employee_name, department_id, salary)
VALUES
    (1, 'Asha', 10, 45000),
    (2, 'Rahul', 20, 55000),
    (3, 'Priya', 10, 60000),
    (4, 'Arjun', 30, 40000),
    (5, 'Neha', 20, 65000);

-- 5. Display records
SELECT * FROM departments;
SELECT * FROM employees;
