/* =========================================================
   RELATIONAL ALGEBRA OPERATORS USING POSTGRESQL
   COMPLETE SCRIPT WITH OUTPUT COMMENTS
   ========================================================= */

------------------------------------------------------------
-- 1. CLEAN START
------------------------------------------------------------
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS cse_students;
DROP TABLE IF EXISTS ece_students;
DROP TABLE IF EXISTS courses;

------------------------------------------------------------
-- 2. CREATE STUDENTS TABLE
------------------------------------------------------------
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    marks INT
);

------------------------------------------------------------
-- 3. INSERT DATA INTO STUDENTS
------------------------------------------------------------
INSERT INTO students VALUES
(1, 'Kapish', 20, 'CSE', 85),
(2, 'Aman', 21, 'ECE', 78),
(3, 'Riya', 20, 'CSE', 92),
(4, 'Neha', 22, 'ME', 70);

------------------------------------------------------------
-- 4. SELECTION ( σ )
-- σ age > 20 (students)
------------------------------------------------------------
SELECT *
FROM students
WHERE age > 20;

-- OUTPUT:
-- id | name  | age | department | marks
-- -------------------------------------
-- 2  | Aman  | 21  | ECE        | 78
-- 4  | Neha  | 22  | ME         | 70

------------------------------------------------------------
-- 5. PROJECTION ( π )
-- π name, department (students)
------------------------------------------------------------
SELECT name, department
FROM students;

-- OUTPUT:
-- name   | department
-- -------------------
-- Kapish | CSE
-- Aman   | ECE
-- Riya   | CSE
-- Neha   | ME

------------------------------------------------------------
-- 6. CREATE TABLES FOR SET OPERATIONS
------------------------------------------------------------
CREATE TABLE cse_students (
    id INT,
    name VARCHAR(50)
);

CREATE TABLE ece_students (
    id INT,
    name VARCHAR(50)
);

------------------------------------------------------------
-- 7. INSERT DATA INTO SET TABLES
------------------------------------------------------------
INSERT INTO cse_students VALUES
(1, 'Kapish'),
(3, 'Riya');

INSERT INTO ece_students VALUES
(2, 'Aman'),
(3, 'Riya');

------------------------------------------------------------
-- 8. UNION ( ∪ )
-- cse_students ∪ ece_students
------------------------------------------------------------
SELECT * FROM cse_students
UNION
SELECT * FROM ece_students;

-- OUTPUT:
-- id | name
-- ----------
-- 1  | Kapish
-- 2  | Aman
-- 3  | Riya
-- (Riya appears only once because UNION removes duplicates)

------------------------------------------------------------
-- 9. SET DIFFERENCE ( − )
-- cse_students − ece_students
------------------------------------------------------------
SELECT * FROM cse_students
EXCEPT
SELECT * FROM ece_students;

-- OUTPUT:
-- id | name
-- ----------
-- 1  | Kapish
-- (Riya removed because it exists in both tables)

------------------------------------------------------------
-- 10. SET INTERSECTION ( ∩ )
-- cse_students ∩ ece_students
------------------------------------------------------------
SELECT * FROM cse_students
INTERSECT
SELECT * FROM ece_students;

-- OUTPUT:
-- id | name
-- ----------
-- 3  | Riya
-- (Only common tuple)

------------------------------------------------------------
-- 11. RENAME ( ρ )
-- Rename columns and table using alias
------------------------------------------------------------
SELECT
    id AS student_id,
    name AS student_name,
    department AS dept
FROM students AS S;

-- OUTPUT:
-- student_id | student_name | dept
-- --------------------------------
-- 1          | Kapish       | CSE
-- 2          | Aman         | ECE
-- 3          | Riya         | CSE
-- 4          | Neha         | ME

------------------------------------------------------------
-- 12. CREATE COURSES TABLE
------------------------------------------------------------
CREATE TABLE courses (
    course_id INT,
    course_name VARCHAR(50)
);

------------------------------------------------------------
-- 13. INSERT DATA INTO COURSES
------------------------------------------------------------
INSERT INTO courses VALUES
(101, 'DBMS'),
(102, 'Operating Systems');

------------------------------------------------------------
-- 14. CARTESIAN PRODUCT ( × )
-- students × courses
------------------------------------------------------------
SELECT *
FROM students
CROSS JOIN courses;

-- OUTPUT:
-- id | name  | age | department | marks | course_id | course_name
-- ----------------------------------------------------------------
-- 1  | Kapish| 20  | CSE        | 85    | 101       | DBMS
-- 1  | Kapish| 20  | CSE        | 85    | 102       | Operating Systems
-- 2  | Aman  | 21  | ECE        | 78    | 101       | DBMS
-- 2  | Aman  | 21  | ECE        | 78    | 102       | Operating Systems
-- 3  | Riya  | 20  | CSE        | 92    | 101       | DBMS
-- 3  | Riya  | 20  | CSE        | 92    | 102       | Operating Systems
-- 4  | Neha  | 22  | ME         | 70    | 101       | DBMS
-- 4  | Neha  | 22  | ME         | 70    | 102       | Operating Systems
-- (Total rows = 4 × 2 = 8)

------------------------------------------------------------
-- END OF SCRIPT
------------------------------------------------------------
