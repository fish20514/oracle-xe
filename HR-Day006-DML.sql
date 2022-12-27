/*
DML(������ ���۾�)
    DML ���� ������ ���� ��쿡 �����մϴ�.
    - ���̺��� �� �� �߰�
    - ���̺��� ���� �� ����
    - ���̺����� ���� �� ����
*/

/*
INSERT ��
    �� ���� ���� ���� �����ϴ� �� ���� �����մϴ�.
    
[�⺻����]
    INSERT INTO ���̺��� (�÷���1, �÷���2...)
    VALUES(��1, ��2...);
    
    �Ǵ�
    
    INSERT INTO ���̺��� (�÷���1, �÷���2...) subquery;
*/

SELECT * FROM departments;

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (280, 'Public Relations' , 100, 1700);
ROLLBACK;
COMMIT;

-- null ���� ���� �� ���� (������)

INSERT INTO departments (department_id, department_name)
VALUE(290, 'Purchasing');


-- NULL Ű���� ����
INSERT INTO departments
VALUES(300, 'Fiance', NULL, NULL);

/*
INSERT ���� subquery�� �ۼ�
*/

DROP TABLE sales_reps;

CREATE TABLE sales_reps
As (SELECT employee_id id, last_name, salary, commission_pct
FROM employees WHERE 1=2);

DESC sales_reps;

INSERT INTO sales_reps (id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';

SELECT * FROM sales_reps;

/*
UPDATE ��
    ���̺��� ���� ���� �����մϴ�.
[�⺻����]
    UPDATE ���̺���
    SET �÷���1 = ������,
        �÷���2 = ������ ....
    WHERE ������

CREATE TABLE copy_emp
AS SELECT * FROM employees WHERE 1=2;
*/

UPDATE employees
SET department_id = 50
WHERE employee_id = 113;


SELECT * FROM employees
WHERE employee_id = 113;

COMMIT;

UPDATE copy_emp
SET department_id = 110;

SELECT * FROM copy_emp;

-- �ٸ� ���̺��� ������� �� ����
UPDATE copy_emp
SET department_id = (SELECT department_id
                        FROM employees
                        WHERE employee_id = 100)
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE employee_id = 200);
                
/*
DELETE ��
    DELETE ���� ����Ͽ� ���̺����� ���� ���� ������ �� �ֽ��ϴ�.
*/

DELETE FROM departments
WHERE department_id = 300;

SELECT * FROM departments
WHERE department_id = 300;

ROLLBACK;
COMMIT;

DELETE FROM copy_emp;
ROLLBACK;

/*
TRUNCATE ��
    ���̺��� �� ���·�, ���̺� ������ �״�� ���ܵ�ä ���̺����� ��� ���� �����մϴ�.
    DML ���� �ƴ϶� ppl(������ ���Ǿ�) ���̹Ƿ� ���� ����� �� �����ϴ�.
*/

TRUNCATE TABLE copy_emp;

ROLLBACK;


/*
Ʈ�����(Transaction)
    ������ ó���� �� �����Դϴ�.
    ����Ŭ���� �߻��ϴ� ���� ���� SQL ���ɹ����� �ϳ��� �������� �۾� ������ ó���ϴµ�
    �̸� Ʈ������̶�� �մϴ�.
    
    COMMIT : SQL���� ����� ���������� DB�� �ݿ�
    ROLLBACK : SQL���� �������� ����� ��
    SAVEPOINT : Ʈ������� �������� ǥ���ϴ� �ӽ� ������
*/

SELECT * FROM sales_reps;
DELETE FROM sales_reps;

DESC sales_reps;

INSERT INTO sales_reps
VALUES (1, '��ī��', 300, 0.1);

SAVEPOINT mypoint;

INSERT INTO sales_reps
VALUES (2, '������', 400, 0);
INSERT INTO sales_reps
VALUES (3, '���̸�', 1000, 0.3);
INSERT INTO sales_reps
VALUES (4, '���α�', 1200, 0.2);
ROLLBACK TO mypoint;

COMMIT;

/*
SELECT ���� FOR UPDATE ��
    EMPLOYEES ���̺����� job_id�� SA_REP�� ���� ��޴ϴ�.
*/

SELECT employee_id, salary, commission_pct, job_id
FROM employees
WHERE job_id = 'SA_REP'
FOR UPDATE
ORDER BY employee_id;
