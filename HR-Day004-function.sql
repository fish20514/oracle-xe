/*
�Լ�(Function)
    �Ű������� �޾� Ư�� ���(�۾�)�� �����ϰ� ����� ��ȯ�ϴ� ������ �Ǿ��ֽ��ϴ�.
�Լ� ����
    - ������ �Լ� - ������ �Ű������� �޾� ��� �� ��ȯ
    - ������ �Լ� - ������ �Ű������� �޾� ��� �� ��ȯ
*/

-- ������ �Լ�

/*
��ҹ��� ��ȯ �Լ�
*/

-- LOWER() �Լ� - �ҹ��ڷ� ��ȯ
SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'higgins';

-- UPPER() �Լ� - �빮�ڷ� ��ȯ
SELECT UPPER('higgins') FROM dual;

--INITCAP() �Լ� - ù���ڸ� �빮�ڷ� ��ȯ
SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = INITCAP('higgins');

/*
���� ���� �Լ�
*/

-- CONCAT() �Լ� - �ΰ� �Ķ���� ���� �����մϴ�.
SELECT CONCAT('Hello', 'World') FROM dual;

-- SUBSTR() - ������ ������ ���ڿ��� �����մϴ�.
SELECT SUBSTR('HelloWorld', 1, 5) FROM dual;

--LENGTH() - ���ڿ� ���̸� ���� ������ ǥ���մϴ�.
SELECT LENGTH('HelloWorld') FROM dual;

--INSTR() - �̸��� ������ ������ ���� ��ġ�� ã���ϴ�.
SELECT INSTR('HelloWorld', 'W') FROM dual;

-- LPAD() - ���̰� n�� �ǵ��� ���ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ�մϴ�.
SELECT LPAD('salary', 10, '*') FROM dual;

-- RPAD() - ���̰� n�� �ǵ��� �����ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ�մϴ�.
SELECT RPAD('salary', 10, '*') FROM dual;

-- REPLACE() - ���ڿ� ġȯ
SELECT REPLACE('JACK and JUE', 'J', 'BL') FROM dual;

--TRIM() - ���ڿ����� ���� ���ڳ� ���� ���ڸ� �ڸ��ϴ�.
SELECT TRIM('H' FROM 'HelloWorld') FROM dual;


/*
���� �Լ�
*/

-- ROUND() - ������ �Ҽ��� �ڸ����� ���� �ݿø� �մϴ�.
SELECT ROUND(45.926, 2) FROM dual;

-- TRUNC() - ������ �Ҽ��� �ڸ����� ���� truncate �մϴ�.
SELECT TRUNC(45.926, 2) FROM dual;

-- MOD() - ���� �������� ��ȯ �մϴ�.
SELECT MOD(1600, 300) FROM dual;

/*
��¥ �Լ�
*/

/*
SYSDATE() �Լ�
    ��ȯ�� - ��¥, �ð�
*/

SELECT sysdate FROM dual;

/*
��¥ ����
    - ��¥�� ���ڸ� ���ϰų� ���� ��� ��¥ ���� ���մϴ�.
    - �� ��¥ ������ �ϼ��� �˾Ƴ��� ���� ���� ������ �մϴ�.
    - �ð� ���� 24�� ���� ��¥�� �ð��� ���մϴ�.
*/

SELECT last_name, (sysdate-hire_date)/7 As WEEKS
FROM employees
WHERE department_id = 90;


/*
��¥ ���� �Լ�

MONTHS_BETWEEN() - �� ��¥ ���� ����
ADD_MONTHS() - ��¥�� �� �߰�
NEXT_DAY() - ������ ��¥�� ������
LAST_DAY() - ���� ������ ��
ROUND() - ��¥ �ݿø�
TRUNC() - ��¥ truncate
*/

SELECT MONTHS_BETWEEN('22-12-16', '21-12-16') FROM dual;
SELECT ADD_MONTHS('22-12-16', 1) FROM dual;
SELECT NEXT_DAY('22-12-16', 1) FROM dual;
SELECT LAST_DAY('22-12-16') FROM dual;
SELECT ROUND(SYSDATE, 'MONTH') FROM dual;
SELECT TRUNC(SYSDATE, 'MONTH') FROM dual;


/*
��ȯ�Լ�
*/

/*
TO_CHAR() �Լ� - ��¥ �Ǵ� ���� ��밡��
    YYYY- ���ڷ� �� ��ü ����
    YEAR - ���� ö�ڷ� ǥ��� ����
    MM - ���� 2�ڸ� ��
    MONTH - ��ü �� �̸�
    MON - ���� 3�� ���
    DY - 3���ڷ� �� ���� ���
    DAY - ������ ��ü �̸�
    DD - ���� ������ ���� ��
    AM �Ǵ� PM - �ڿ��� ǥ��
    A.M. �Ǵ� P.M. - ��ħǥ�� �ִ� �ڿ��� ǥ��
    HH �Ǵ� HH12 �Ǵ� HH24 - �Ϸ� �ð� �Ǵ� ���� �ð�(1-12) �Ǵ� ���� �ð�(0~23)
    MI - ��(0~59)
    SS - ��(0~59)
    TIMESTAMP Ÿ��
    FF - �и�������
*/

SELECT last_name, TO_CHAR(hire_date, 'YYYY-MM-DD') As HIREDATE
FROM employees;

SELECT TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD HH24:MI:SS.FF2') FROM dual;


/*
TO_CHAR() ���ڿ� ���
*/
SELECT TO_CHAR(salary, '$99,999.00') SALARY
FROM employees
WHERE last_name = 'Ernst';

-- TO_DATE() - ���ڸ� DATE Ÿ������ ��ȯ
SELECT last_name, TO_CHAR(hire_date, 'YYYY-MM-DD')
FROM employees
WHERE hire_date < TO_DATE('2005-01-01', 'YYYY-MM-DD');



/*
�Լ� ��ø
    ���� �� �Լ��� ��� �����ε� ��ø�� �� �ֽ��ϴ�.
    ��ø�� �Լ��� ���� ���� �������� ���� ���� ������ �򰡵˴ϴ�.
*/

SELECT last_name, UPPER(CONCAT(SUBSTR(LAST_NAME, 1, 8), '_US'))
FROM employees
WHERE department_id = 60;


/*
NVL() �Լ�
    null ���� ���� ������ ��ȯ�մϴ�.
    null�� ������ �ȵ˴ϴ�.
*/

SELECT last_name, salary, NVL(commission_pct, 0), 
    (salary*12) + (salary*12*NVL(commission_pct, 0)) AN_SAL
FROM employees;


/*
NVL2() �Լ�
    ù��° ǥ������ �˻��մϴ�. ù��° ǥ������ null�� �ƴϸ� NVL2 �Լ��� �ι�° ǥ������ ��ȯ�մϴ�.
    ù��° ǥ������ null�̸� ����° ǥ������ ��ȯ�մϴ�.
*/

SELECT last_name, salary, commission_pct,
    NVL2(commission_pct,
            'SAL+COMM', 'SAL') income
FROM employees
WHERE department_id IN (50, 80);

/*
NULLIF() �Լ�
    �� ǥ������ �� ������ null ��ȯ, �ٸ��� expr1�� ��ȯ �մϴ�.
    �׷��� expr1�� ���� ���ͷ� NULL�� ������ �� �����ϴ�.
*/

SELECT first_name, LENGTH(first_name) "expr1",
    last_name, LENGTH(last_name) "expr2",
    NULLIF(LENGTH(first_name), LENGTH(last_name)) result
FROM employees;

