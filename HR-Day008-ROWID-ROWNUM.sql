/*
ROWID�� ROWNUM
    ����Ŭ���� ���̺��� �����ϸ� �⺻������ �����Ǵ� �÷��Դϴ�.
    ROWID : ROW ������ ���̵� (ROW�� �����ص� ������ ����)
    ROWNUM : ���� INDEX (ROW ������ ����� �� �ִ�.)
    
ROWID - �ش� �������� ������ġ�� ����Ű�� ��Ҷ�� �Ҽ� �ֽ��ϴ�.
    ������Ʈ ��ȣ (6�ڸ�)
        �ش� �����Ͱ� ���ϴ� ������Ʈ ��ȣ��.
    ��� ���� ��ȣ (3�ڸ�)
        ���̺����̽��� ��� ���Ϲ�ȣ�� �ǹ��ϸ�, �������ͺ��� ������ ���� ������.
    ��� ��ȣ (6�ڸ�)
        ���� �ȿ� ��� ��������� �ǹ��Ѵ�.
    ������ ��ȣ (3�ڸ�)
        ������ ��ȣ�� ��Ϻ��� �����Ͱ� ����Ǿ� �ִ� ������ ���Ѵ�.
    
*/

SELECT *
FROM (
    SELECT ROWNUM AS rno, employee_id, first_name, last_name
    FROM employees;


-- ROW�� ������ �˰�ʹٸ�?
SELECT COUNT(*) FROM employees;
SELECT MAX(ROWNUM) FROM employees; -- ���ݴ� ������. (Ȯ������ �ʽ��ϴ�) 
SELECT COUNT(ROWNUM) FROM employees;