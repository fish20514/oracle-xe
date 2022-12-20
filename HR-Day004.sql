/*
ġȯ ����
    - ���� ���ۻ���(&) �� ���� ���ۻ���(&&) ġȯ�� ��� �� �ӽ�����
*/

/*
���� ���ۻ��� ġȯ ���� ���
    �����տ� & ���̸� ������ ���� �Է��ϵ��� �� �� �ֽ��ϴ�.
*/

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;

/*
���� �� ��¥ ���� ġȯ ������ ����
    ��¥ �� �� ���� ���� ���� ���� ����ǥ�� ����մϴ�.
*/

SELECT last_name, department_id, salary*12
FROM employees
WHERE job_id = '&job_title';

-- �� �̸�, ǥ���� �� �ؽ�Ʈ ����
SELECT employees_id, last_name, job_id, &column_name
FROM employees
WHERE &condition
ORDER BY &order_column;

/*
���� ���ۻ��� ġȯ ���� ���
    ������ �Ź� ���� �Է��� �ʿ� ���� ������ ��� ���� ���ۻ���(&&) ����մϴ�.
*/

SELECT employee_id, last_name, job_id, &&column_name
FROM employees
ORDER BY &column_name;

/*
DEFINE ���� ���
    DEFINE ���� ����Ͽ� ���� �����ϰ� �� �Ҵ��մϴ�.
    UNDEFINE ���� ����Ͽ� ���� �����մϴ�.
*/

DEFINE employee_num = 200
SELECT employee_id, last+name, salary, department_id
FROM employees
WHERE employee_id = &employee_num;

UNDEFINE employee_num;

/*
VERIFY ���� ���
    VERIFY ������ ����Ͽ� SQL Developer�� ġȯ ������ ������ �ٲٱ� ���Ŀ� ġȯ ������ ǥ�ø� ����մϴ�.
*/

SET VERIFY ON
SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id = &employee_num;


/*
���ε� ����
    ����Ŭ���� ����ϴ� ����
    ġȯ�������� ���� ���� ���ػ��!!!
    
    �ڹ� ������ JDBC
        -> STATEMENT ġȯ����
        -> PREPARESTATEMENT ���ε庯��
        ���̹�Ƽ��
        -> #������
*/
VAR employee_num NUMBER
EXEC :employee_num := 200

SELECT employee_id, last_name, salary
FROM employees
WHERE employee_id = :employee_num;
