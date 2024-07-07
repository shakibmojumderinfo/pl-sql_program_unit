SET SERVEROUTPUT ON;


CREATE OR REPLACE FUNCTION count_b_date(
    b_str_date DATE DEFAULT SYSDATE,
    b_end_date DATE)
  RETURN VARCHAR2
IS
  b_year NUMBER;
  b_month NUMBER;
  b_day NUMBER;
  result VARCHAR2(100);
BEGIN
  SELECT EXTRACT(YEAR FROM b_end_date) - EXTRACT(YEAR FROM b_str_date) INTO b_year FROM DUAL;
  SELECT EXTRACT(MONTH FROM b_end_date) - EXTRACT(MONTH FROM b_str_date) INTO b_month FROM DUAL;
  SELECT EXTRACT(DAY FROM b_end_date) - EXTRACT(DAY FROM b_str_date) INTO b_day FROM DUAL;
  
  result := TO_CHAR(b_year) || ' years, ' || TO_CHAR(b_month) || ' months, ' || TO_CHAR(b_day) || ' days';
  
  RETURN result;
END;
/

SELECT count_b_date(DATE '2000-01-01', SYSDATE) FROM DUAL;

create or replace function get_sal
(p_id employees.employee_id%TYPE)
RETURN NUMBER
IS
v_salary NUMBER(12,2);
BEGIN
SELECT salary INTO v_salary
FROM employees
WHERE employee_id=p_id;
RETURN v_salary;
END;

SELECT get_sal(100) FROM DUAL;

VARIABLE :b_salary :=get_sal(107);
EXECUTE :b_salary :=get_sal(107);
BEGIN
:b_salary :=get_sal(107);
END;
PRINT b_salary;




















