/*

DCL (Data Control Language) ������ ���Ǿ�
    DCL�� ���̺� �����͸� �����Ҷ� �ʿ��� ������ �����ϴ� ������
    GRANT, REVOKE�� �ֽ��ϴ�.
*/

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- ����� �����ϱ�
-- CREATE USER ���̵� IDENTIFIED BY ��й�ȣ;

CREATE USER scott IDENTIFIED BY tiger;

-- Grant �����ֱ�
GRANT CREATE SESSION TO scott; -- �����ͺ��̽��� ���� �� �� �ִ� ����
REVOKE CREATE SESSION FROM scott;

GRANT CREATE DATABASE LINK TO scott;
GRANT CREATE SEQUENCE TO scott;
GRANT CREATE SYNONYM TO scott;
GRANT CREATE TABLE TO scott;
GRANT DROP ANY TABLE TO scott;
GRANT CREATE PROCEDURE TO scott;
GRANT CREATE TRIGGER TO scott;
GRANT CREATE VIEW TO scott;

-- �� �̿� ��� ���� �ֱ�
GRANT CONNECT, DBA, RESOURCE to scott;

-- �� ���� ��ȸ
SELECT * FROM dba_sys_privs WHERE grantee='DBA';

-- �� �����ϱ�
REVOKE CONNECT, DBA, RESOURCE FROM scott;

-- role �����ϱ�
CREATE ROLE role01;

-- role ���� �Ҵ�
GRANT CREATE SESSION, CREATE TABLE, INSERT ANY TABLE TO role01;

-- role �ο�
GREANT role01 TO scott;

-- role ȸ��
REVOKE role01 FROM scott;

-- ����� ��й�ȣ �ٲٱ�
ALTER USER scott IDENTIFIED BY ��й�ȣ;

-- ����� �����ϱ�
DROP USER scott;
DROP USER scott CASCADE;

