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
    WHEN OTHER THEN
    
        V_RESULT_MSG := 'SQLCODE['||SQLCODE||'], MESSAGE => '||SQLERRM;
        
        DBMS_OUTPUT.PUT_LINE( V_RESULT_MSG );
END; -- �۾� ����