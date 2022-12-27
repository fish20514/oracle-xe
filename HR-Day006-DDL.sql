/*
DDL(������ ���Ǿ�)
    ������ ���̽� ���� ��ü(���̺�, ������...)���� �����ϰ� �����ϰ� �����ϱ� ���ؼ� ���Ǵ� SQL
*/


/*
CREATE TABLE ��
    �����͸� ������ ���̺��� �����մϴ�.
*/

CREATE TABLE dept(
    deptno NUMBER(6),
    dname VARCHAR2(200),
    loc VARCHAR2(200),
    create_date DATE DEFAULT SYSDATE
    );
    
DESC dept;

/*
����������
    VARCHAR2(size) ���� ���� ���� ������ (4000)
    NUMBER(p,s) ���� ���� ���� ������
    CHAR(size) ���� ���� ���� ������(2000)
    DATE ��¥ �� �ð� ��
    LONG ���� ���� ���� ������(�ִ� 2GB)
    CLOB ���� ������(�ִ� 4GB)
    RAW and LONG RAW ���� ���� ������
    BLOB ���̳ʸ� ������(�ִ� 4GB)
    BFILE �ܺ� ���Ͽ� ����� ���̳� ������(�ִ� 4GB)
    ROWID ���̺� �ִ� ���� ������ �ּҸ� ��Ÿ���� base-64
*/

INSERT INTO dept
SELECT department_id, department_name, location_id, SUSDATE
FROM departments;

COMMIT;

-- ���̺� �����ϱ�
CREATE TABLE dept2 AS SELECT * FROM dept;

SELECT * FROM dept2;

/*
ALTER ��
    ��ü�� ������ �� ����մϴ�.
*/
CREATE TABLE simple(num NUMBER); -- ���̺� ����

ALTER TABLE simple ADD(name VARCHAR2(3));
ALTER TABLE simple MODIFY(name VARCHAR2(30));
ALTER TABLE simple DROP COLUMN name;

ALTER TABLE ADD(add VARCHAR2(50));

ALTER TABLE simple ADD(addr VARCHAR2(50));
ALTER TABLE simple ADD(addr);

/*
��������(Constraint)
    ���̺��� �ش��÷��� ������ �ʴ� �����͸� �Է�/����/���� �Ǵ� ���� �����ϱ�
    ���� ���̺� ���� �Ǵ� ����� �����ϴ� �����Դϴ�.(����� �������� �ŷڼ��� ���̱� ���� ���)
    
    NOT NULL
        NULL�� �Է��� �Ǿ�� �ȵǴ� �÷��� �ο��ϴ�
        �������� �÷�  ���������� �ο��� �� �ִ� ���������Դϴ�.
    UNIQUE KEY(����Ű)
        ����� ���� �ߺ����� �ʰ� ���� �����ϰ�
        �����Ǿ�� �� �� ����ϴ� ���������Դϴ�.
        (NULL�� ���ȴ�)
    PRIMARY KEY(��ǥŰ/�⺻Ű)
        NOT NULL���ǰ� UNIQUE KEY�� ��ģ �����Դϴ�.
    CHECK
        ���ǿ� �´� �����͸� �Էµǵ��� ������ �ο��ϴ� ���������Դϴ�.
    FOREIGN KEY(�ܷ�Ű)
        �θ� ���̺��� PRIMARY KEY�� â���ϴ� �÷��� ���̴� ���������Դϴ�.
*/

CREATE TABLE dept4(
    deptno NUMBER(2) CONSTRAINT dept4_deptno_pk PRIMARY KEY,
    dname VARCHAR2(15) DEFAULT '������',
    loc CHAR(1) CONSTRAINT dept4_loc_ck CHECK(loc in ('1', '2'))
    );
    
INSERT INTO dept4 (deptno, dname, loc)
VALUES(1, '������', 1);
COMMIT;

SELECT * FROM dept4;

CREATE TABLE dept5(
deptno NUMBER(2) PRIMARY KEY,
dname VARCHAR2(15) NOT NULL
);

INSERT INTO dept5 (deptno, dname)
VALUES(1, 'QA');

CREATE TABLE emp(
empno NUMBER(4) PRIMARY KEY,
ename VARCHAR2(15) NOT NULL,
deptno NUMBER(2),
CONSTRAINT emp_dept5_fk FOREIGN KEY (deptno)
    REFERENCES dept5(deptno)
);

SELECT * FROM dept5;

INSERT INTO emp
VALUES (1, 'MIKE', 1);

COMMIT;

DELETE FROM dept5
WHERE deptno = 1;

-- ���� ���� �˻��ϱ�

SELECT * FROM user_constraints
WHERE constraint_name = 'DEPT4_DEPTNO_PK';

-- ���� ������ ���� �Ұ���, ������ �����մϴ�.
ALTER TABLE dept4 DROP CONSTRAINT dept4_loc_ck;

-- ���� ���� �߰��ϱ�
ALTER TABLE dept4 ADD (CONSTRAINT dept4_loc2_ck CHECK(loc IN('1', '2')));

CREATE TABLE emp2 