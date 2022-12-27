/*
���� ������
    SELECT ����Ʈ�� ǥ������ ������ ��ġ�ؾ� �մϴ�.
    ������ ������ ù��° QUERY ������ ������ ��ġ�ؾ� �մϴ�.
    UNION, UNION ALL, INTERSECT, MINUS
*/

/*
UNION ������
    �ߺ� ���� ���ŵ� �� QUERY�� ��
*/

SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;

SELECT employee_id, job_id
FROM employees
WHERE employee_id in (SELECT employee_id
                        FROM job_history)
;

/*
UNION ALL ������
    �ߺ� ���� ���Ե� �� query�� ��
*/

SELECT employee_id, job_id, department_id
FROM employees
UNION ALL
SELECT employee_id, job_id, department_id
FROM job_history
ORDER BY employee_id;

/*
INTERSECT ������
    �� query�� �������� �� (������)
*/

SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

/*
<����> ������ ������ ��ġ���Ѿ� �մϴ�.
*/

SELECT location_id, department_name "Department",
        TO_CHAR(NULL) "Warehouse location"
FROM departments
UNION
SELECT location_id, TO_CHAR(NULL) "Department",
        state_province
FROM locations;

DESCRIBE departments;
DESC departments;
DESC locations;


/*
[�⺻����]
    SELECT �÷���1, �÷���2...                       5
    FROM ���̺��                                   1
    WHERE ������                                    2
    GROUP BY �÷���                                 3
    HAVING ������                                   4
    ORDER BY �÷���[ASC|DESC] => ��������|��������    6
*/

SELECT t.employee_id, t.name
FROM(
SELECT employee_id, first_name as name
FROM employees
WHERE first_name like '%a%'
ORDER BY name
)
WHERE t.name like '%a%';