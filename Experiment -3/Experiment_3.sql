DO $$
DECLARE
    emp_id     INTEGER := 101;
    emp_name   VARCHAR(50) := 'KAPISH GUPTA';
    emp_salary NUMERIC := 50000;
BEGIN
    RAISE NOTICE 'Employee ID: %', emp_id;
    RAISE NOTICE 'Employee Name: %', emp_name;
    RAISE NOTICE 'Employee Salary: %', emp_salary;
END;
$$ LANGUAGE plpgsql;
