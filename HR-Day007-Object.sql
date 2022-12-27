/*
데이터베이스 객체
    테이블 : 기본 저장단위이며 행으로 구성되어 있습니다.
    뷰 : 하나 이상의 테이블에 있는 데이터의 부분 집합을 논리적으로 나타냅니다.
    시퀀스 : 숫자 값을 생성합니다.
    인덱스 : 데이터 검색 query의 성능을 향상 시킵니다.
    동의어 : 객체에 다른 이름을 부여 합니다.
*/

-- 뷰 생성
CREATE VIEW empvu80
AS SELECT employee_id, last_name, salary
    FROM employees
    WHERE department_id = 80;


SELECT employee_id, last_name, salary
    FROM employees
    WHERE department_id = 80;
    
DESC empvu80;
SELECT * FROM empvu80;

-- alias 사용 뷰 생성
CREATE VIEW salvu50
AS SELECT employee_id ID_NUMBER, last_name NAME,
        salary*12 ANN_SALRARY
        FROM employees
        WHERE department_id = 50;
        
DESC salvu50;

SELECT * FROM salvu50;

-- 뷰 수정
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
복합 뷰 생성
    두 개 이상 기본 테이블에 의해 정의된 뷰
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
뷰 DML 작업 수행 규칙
    1. 행 제거 할수 없는 경우
    - 그룹 함수
    - GROUP BY 절
    - DISTINCT 키워드
    - Pseuducolumn ROWNUM 키워드
    2. 뷰의 데이터 수정할 수 없는 경우
       - 그룹 함수
    - GROUP BY 절
    - DISTINCT 키워드
    - Pseuducolumn ROWNUM 키워드
    - 표현식으로 정의되는 열
    - 뷰에서 선택되지 않은 기본 테이블의 NOT NULL 열
*/

-- WITH CHECK OPTION 절 사용 - DML 작업이 뷰 영역에만 적용
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

-- DML 작업거부
CREATE OR REPLACE VIEW empvu10
    (employee_number, employee_name, job_title)
AS SELECT employee_id, laste_name, job_id
    FROM employees
    WHERE department_id = 10
    WITH READ ONLY;
    
SELECT * FROM empvu10;

DELETE FROM empvu10;

-- 뷰 제거
DROP VIEW empvu10;


CREATE SEQUENCE my_seq
    INCREMENT BY 1                -- 증가값(1씩증가)
    START WITH 1                  -- 시작값
    MINVALUE 1                    -- 최소값
    MAXVALUE 99999999             -- 최대값
    NOCYCLE                       -- 최대값 도달시 시작값부터 반복안함
    CACHE 20                      -- CACHE 사용 20까지 미리저장
    ORDER;                        -- 요청 순서대로 값을 생성한다.

SELECT my_seq.NEXTVAL FROM dual;

DESC dept;

SELECT * FROM dept3;

INSERT INTO dept3 VALUES (my_seq.NEXTVAL , 'A', 1, SYSDATE);
INSERT INTO dept3 VALUES (my_seq.NEXTVAL , 'B', 2, SYSDATE);
INSERT INTO dept3 VALUES (my_seq.NEXTVAL , 'C', 1, SYSDATE);
INSERT INTO dept3 VALUES (my_seq.NEXTVAL , 'D', 2, SYSDATE);

-- 시퀀스 제거
DROP SEQUENCE my_seq;


/*
인덱스(Index) 
    Oracle 서버 인덱스는 포인터를 사용하여 행 검색 속도를 높일 수 있는 스키마 객체입니다.
*/


-- EMPLOYEE 테이블의 LAST_NAME 열에 대한 query 액세스 속도를 향상시킵니다.
CREATE INDEX emp_last_name_idx
    ON employees(last_name);

-- 인덱스 제거
DROP INDEX emp_last_name_idx;

/*
동의어
    동의어를 생성하여 객체에 대체 이름을 부여할 수 있습니다.
*/

-- 동의어 생성
CREATE SYNONYM d_sum
FOR dept_sum_vu;

SELECT * FROM d_sum;