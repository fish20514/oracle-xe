/*
�����ͺ��̽� ��ü
    ���̺� : �⺻ ��������̸� ������ �����Ǿ� �ֽ��ϴ�.
    �� : �ϳ� �̻��� ���̺� �ִ� �������� �κ� ������ �������� ��Ÿ���ϴ�.
    ������ : ���� ���� �����մϴ�.
    �ε��� : ������ �˻� query�� ������ ��� ��ŵ�ϴ�.
    ���Ǿ� : ��ü�� �ٸ� �̸��� �ο� �մϴ�.
*/

-- �� ����
CREATE VIEW empvu80
AS SELECT employee_id, last_name, salary
    FROM employees
    WHERE department_id = 80;


SELECT employee_id, last_name, salary
    FROM employees
    WHERE department_id = 80;
    
DESC empvu80;
SELECT * FROM empvu80;

-- alias ��� �� ����
CREATE VIEW salvu50
AS SELECT employee_id ID_NUMBER, last_name NAME,
        salary*12 ANN_SALRARY
        FROM employees
        WHERE department_id = 50;
        
DESC salvu50;

SELECT * FROM salvu50;

-- �� ����
CREATE OR REPLACE VIEW empvu80
    (id_number, name, sal, department_id)
AS SELECT employee_id, first_name || ' ' || last_name,
        salary, department_id
    FROM employees
    WHERE department_id = 80;
    
SELECT * FROM empvu80;

UPDATE empvu 80 SET
department_id = 80
WHERE id_number = 145;

SELECT * FROM employees
WHERE employee_id = 145;

/*
���� �� ����
    �� �� �̻� �⺻ ���̺� ���� ���ǵ� ��
*/
CREATE OR REPLACE VIEW dept_sum_vu
    (name, minsal, maxsal, avgsal)
AS SELECT d.department_name, MIN(e.salary),
        MAX(e.salary), AVG(e.salary)
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
GROUP BY d.department_name;

SELECT * FROM dept_sum_vu;
WHERE 


UPDATE dept_sum_vu SET
NAME = 'Marketing'
WHERE NAME = 'Marketing';

/*
�� DML �۾� ���� ��Ģ
    1. �� ���� �Ҽ� ���� ���
    - �׷� �Լ�
    - GROUP BY ��
    - DISTINCT Ű����
    - Pseuducolumn ROWNUM Ű����
    2. ���� ������ ������ �� ���� ���
       - �׷� �Լ�
    - GROUP BY ��
    - DISTINCT Ű����
    - Pseuducolumn ROWNUM Ű����
    - ǥ�������� ���ǵǴ� ��
    - �信�� ���õ��� ���� �⺻ ���̺��� NOT NULL ��
*/

-- WITH CHECK OPTION �� ��� - DML �۾��� �� �������� ����
CREATE OR REPLACE VIEW empvu20
AS SELECT * 
    FROM employees
    WHERE department_id = 20
    WITH CHECK OPTION CONSTRAINT empvu20_ck;
    
    
SELECT * FROM empvu20;

UPDATE empvu20
SET department_id = 10
WHERE employee_id = 201;


SELECT * FROM empvu20;

-- DML �۾��ź�
CREATE OR REPLACE VIEW empvu10
    (employee_number, employee_name, job_title)
AS SELECT employee_id, laste_name, job_id
    FROM employees
    WHERE department_id = 10
    WITH READ ONLY;
    
SELECT * FROM empvu10;

DELETE FROM empvu10;

-- �� ����
DROP VIEW empvu10;


CREATE SEQUENCE my_seq
    INCREMENT BY 1                -- ������(1������)
    START WITH 1                  -- ���۰�
    MINVALUE 1                    -- �ּҰ�
    MAXVALUE 99999999             -- �ִ밪
    NOCYCLE                       -- �ִ밪 ���޽� ���۰����� �ݺ�����
    CACHE 20                      -- CACHE ��� 20���� �̸�����
    ORDER;                        -- ��û ������� ���� �����Ѵ�.

SELECT my_seq.NEXTVAL FROM dual;

DESC dept;

SELECT * FROM dept3;

INSERT INTO dept3 VALUES (my_seq.NEXTVAL , 'A', 1, SYSDATE);
INSERT INTO dept3 VALUES (my_seq.NEXTVAL , 'B', 2, SYSDATE);
INSERT INTO dept3 VALUES (my_seq.NEXTVAL , 'C', 1, SYSDATE);
INSERT INTO dept3 VALUES (my_seq.NEXTVAL , 'D', 2, SYSDATE);

-- ������ ����
DROP SEQUENCE my_seq;


/*
�ε���(Index) 
    Oracle ���� �ε����� �����͸� ����Ͽ� �� �˻� �ӵ��� ���� �� �ִ� ��Ű�� ��ü�Դϴ�.
*/


-- EMPLOYEE ���̺��� LAST_NAME ���� ���� query �׼��� �ӵ��� ����ŵ�ϴ�.
CREATE INDEX emp_last_name_idx
    ON employees(last_name);

-- �ε��� ����
DROP INDEX emp_last_name_idx;

/*
���Ǿ�
    ���Ǿ �����Ͽ� ��ü�� ��ü �̸��� �ο��� �� �ֽ��ϴ�.
*/

-- ���Ǿ� ����
CREATE SYNONYM d_sum
FOR dept_sum_vu;

SELECT * FROM d_sum;