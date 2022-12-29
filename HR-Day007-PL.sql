/*
PL/SQL(Procedural Language extension to SQL)
    SQL�� Ȯ���� ������ ����Դϴ�.
    ���� SQL�� �ϳ��� ���(Block)���� �����Ͽ� SQL�� ������ �� �ֽ��ϴ�.
*/


/*
�͸����ν��� - DB�� ������� �ʽ��ϴ�.
[�⺻����]
    DECLARE -- ��������
    BEGIN -- ó�� ���� ����
    EXCEPTION -- ���� ó��
    END -- ó�� ���� ����
*/

-- ���� ����� ����ϵ��� ����
SET SERVEROUTPUT ON

-- ��ũ��Ʈ ��� �ð��� ����ϵ��� ����
SET TIMING ON

DECLARE -- ������ ���� �ϴ� ����
    V_STRD_DT VARCHAR(8);
    V_STRD_DEPTNO NUMBER;
    
    V_DEPTNO NUMBER;
    V_DNAME VARCHAR2(50);
    V_LOC VARCHAR2(50);
    
    V_RESULT_MSG VARCHAR2(500) DEFAULT 'SUCCESS';

BEGIN -- �۾� ����
    -- �������� -> �����Լ� ���.
    V_STRD_DT := TO_CHAR(SYSDATE, 'YYYYMMDD');
    
    -- ��ȸ �μ���ȣ ���� ����
    V_STRD_DEPTNO := 10;
    BEGIN
        -- ��ȸ
        SELECT T1.department_id
            , T1.department_name
            , T1.location_id
        INTO V_DEPTNO
            ,V_DNAME
            ,V_LOC
        FROM departments
        WHERE T1.department_id = V_STRD_DEPTNO;
    END;
    
    -- ��ȸ ��� ���� ����
    V_RESULT_MSG := 'RESULT > DEPTNO='||V_DEPTNO||', DNAME='||V_DNAME||', LOC='||V_LOC;
    
    -- ��ȸ ��� ���
    DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
    
-- ����ó��
EXCEPTION
    WHEN OTHER THEN
    
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], MESSAGE => '||SQLERRM;
        
        DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
END; -- �۾� ����



/*
���ν���

[�⺻����]
CREATE OR REPLACE PROCEDURE ���ν����̸� (�Ķ����1, �Ķ����2...);
    IS [As]
        �����
    BEGIN
        [����� - PL/SQL BLOCK]
    
    [EXCEPTION]
        [EXCEPTION ó��]
END;
*/

CREATE OR REPLACE PROCEDURE print_hello_proc
    IS
        msg VARCHAR2(20) := 'hello world'; -- ���� �ʱⰪ ����
    BEGIN -- ������ ����
        DBMS_OUTPUT.PUT_LINE(msg);
    END; -- ������ ��
-- ���ν��� ����

EXEC print_hello_proc;


CREATE TABLE emp2 AS
SELECT * FROM employees;


-- IN �Ű�����
CREATE OR REPLACE PROCEDURE update_emp_salary_proc(eno IN NUMBER) IS
    BEGIN
        UPDATE emp2 SET salary = salary*1.1
        WHERE employee_id = eno;
        COMMIT;
    END;
    
-- 3100    
SELECT * FROM emp2
WHERE employee_id = 115;

EXEC update_emp2_salary_proc(115);


-- OUT �Ű����� / call by reference

CREATE OR REPLACE PROCEDURE find_emp2_proc(v_eno IN NUMBER,
    v_fname OUT NVARCHAR2, v_lname OUT NVARCHAR2, v_sal OUT NUMBER)
    IS
    BEGIN
        SELECT first_name, last_name, salary
        INTO v_fname, v_lname, v_sal
        FROM employees WHERE employee_id = v_eno;
    END;
    
VARIABLE v_fname NVARCHAR2(25);
VARIABLE v_lname NVARCHAR2(25);
VARIABLE v_sall NUMBER(8,2);

EXECUTE find_emp2_proc(115, :v_fname, :v_lname, :v_sall);
PRINT v_fname;
PRINT v_lname;
PRINT v_sall;


-- IN OUT �Ű� ����
-- �Ű������� �����ϰ� ��ȯ������ ������.
CREATE OR REPLACE PROCEDURE find_emp2_sal(v_eno IN OUT NUMBER)
IS
    BEGIN
        SELECT salary
        INTO v_eno
        FROM emp2 WHERE employee_id = v_eno;
    END;

DECLARE
    v_eno NUMBER := 115;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('eno ='||v_eno);
        find_emp2_sal(v_eno);
        DBMS OUTPUT.PUT_LINE('eno ='||v_eno);
    END;

VAR v_eno NUMBER;
EXEC :v_eno := 115;
PRINT v_eno;
EXEC find_emp2_sal(:v_eno);
PRINT v_eno;


/*
�Լ�(Function)
    Ư�� ��ɵ��� ���ȭ, ���� �� �� �־ ������ �������� �����ϰ� ����� �ֽ��ϴ�.

[�⺻����]
CREATE OR REPLACE PROCEDURE �Լ��� [(�Ķ����1, �Ķ����2...)];
    IS [As]
        �����
    BEGIN
        [����� - PL/SQL BLOCK]
    
    [EXCEPTION]
        [EXCEPTION ó��]
    RETURN ����;
END;
*/

CREATE OR REPLACE FUNCTION FN_GET_DEPT_NAME(
    P_DEPT_NO IN NUMBER
) RETURN VARCHAR2
    IS
        V_TEST_NAME VARCHAR(30);
    BEGIN
        SELECT department_name
        INTO V_TEST_NAME
        FROM departments
        WHERE department_id = P_DEPT_NO;
        
    RETURN V_TEST_NAME;
    END;

SELECT FN_GET_DEPT_NAME(10) FROM dual;

/*
Ʈ����(TRIGGER)
    INSERT, UPDATE, DELETE ���� TABLE�� ���� ������ �� ���������� ����Ǵ� ���ν��� �Դϴ�.

[�⺻����]

CREATE OR REPLACE TRIGGER Ʈ���Ÿ�
    - Ʈ���� �ɼ�
    BEFORE OR AFTER
    INSERT OR UPDATE OR DELETE ON ���̺��
    [FOR EACH ROW]
DECLARE
    �����;
BEGIN
    �����
    [INSERTING, UPDATING, DELETING)
[EXCEPTION]
    ����ó����;
END;
*/

SELECT * FROM dept5;

CREATE TABLE dept6(
    deptno NUMBER(6) PRIMARY KEY,
    dname VARCHAR(200),
    loc VARCHAR2(200),
    create_date DATE DEFAULT SYSDATE,
    update_date DATE DEFAULT SYSDATE
    );
    
CREATE OR REPLACE TRIGGER tr_dept6
    BEFORE UPDATE ON dept6
    FOR EACH ROW
    BEGIN
        :NEW.update_date := SYSDATE;
    END;
    
SELECT 
    deptno,
    dname,
    loc,
    TO_CHAR(create_date, 'YYYYMMDD HH24:MI:SS')
    TO_CHAR(update_date, 'YYYYMMDD HH24:MI:SS')
FROM dept6;
    
INSERT INTO dept6(deptno, dname, loc)
VALUES (1, 'DEV', '����Ư����');
COMMIT;


UPDATE dept6 SET
loc = '������'
WHERE deptno = 1;

