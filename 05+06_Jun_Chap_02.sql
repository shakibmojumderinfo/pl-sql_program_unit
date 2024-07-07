SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE query_emp
(p_id IN employees.employee_id%TYPE,
p_name OUT employees.last_name%TYPE,
p_salary OUT employees.salary%TYPE) IS
BEGIN
SELECT last_name, salary INTO p_name, p_salary
FROM employees 
WHERE employee_id = p_id;
END;

DESCRIBE query_emp;

DECLARE 
v_name VARCHAR2(255);
v_salary NUMBER(12, 2);
p_id number := 150;
BEGIN
query_emp(p_id, v_name, v_salary);
DBMS_OUTPUT.PUT_LINE('Emp Name :' ||v_name || ', ' || 'Emp Salary: ' || v_salary);
end;
/

CREATE OR REPLACE PROCEDURE format_phone(p_phone_no IN OUT VARCHAR2)
IS
BEGIN
p_phone_no := '(' || SUBSTR (p_phone_no, 1, 3) ||
              ')' || SUBSTR(p_phone_no, 4, 3) ||
              '-' || SUBSTR(p_phone_no, 7);
        END;

DECLARE
p_phone VARCHAR2(15):= '0132343434';
BEGIN 
format_phone(p_phone);
DBMS_OUTPUT.PUT_LINE(p_phone);
END;
/

VARIABLE b_phone_no 

CREATE OR REPLACE PROCEDURE raise_salary (
    p_id      IN employees.employee_id%TYPE,
    p_percent IN NUMBER
) IS
BEGIN
    UPDATE employees
    SET
        salary = salary * ( 1 + p_percent / 100 )
    WHERE
        employee_id = p_id;

END raise_salary;

EXECUTE raise_salary(176, 10);


select employee_id, salary
from employees
WHERE employee_id = 176;

SET SERVEROUTPUT ON;

DECLARE 
    v_emp_name employees.last_name%TYPE;
    DF
    F
    


































