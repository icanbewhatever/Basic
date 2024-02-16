함수연습하기

숫자함수
-ABS(n): 절대값 반환
SELECT ABS(10), ABS(-10), ABS(-10.123)
FROM DUAL;

-CEIL(n): n과 같거나 가장 큰 정수 반환
SELECT CEIL(10.123), CEIL(10.567), CEIL(11.001)
FROM DUAL;


FLOOR함수

CREATE OR REPLACE VIEW emp_dept_v1 AS
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
FROM employees a,
     departments b
WHERE a.department_id = b.department_id;

SELECT *
FROM emp_dept_v1;

DROP VIEW emp_dept_v1;


--시노님

CREATE OR REPLACE PUBLIC SYNONYM channels_synonym
FOR channels;

SELECT COUNT (*)
FROM channels_synonym;

GRANT SELECT ON channels_synonym TO PUBLIC; -- PUBLIC 권한 설정
GRANT SELECT ON channels_synonym ora_user;  -- PRIVATE 권한 설정
ora_user사용자에게 channels_synonym 시노님에 대한 조회 권한을 부여함

SELECT *
FROM channels_synonym;

DROP SYNONYM channels_synonym; 
DROP PUBLIC SYNONYM channels_synonym; 


--***시퀀스

DROP SEQUENCE seq_1;

CREATE SEQUENCE seq_1
INCREMENT BY    2
START WITH      3
MINVALUE    2 -- 사이클이 다시 시작할 땐, minivalue부터 시작
MAXVALUE   10
CYCLE
NOCACHE
;

DELETE ex2_8;

DESC ex2_8;

seq_1.CURRVAL
seq_1.NEXTVAL

--의사컬럼과 같이 사용
INSERT INTO ex2_8 VALUES (seq_1.NEXTVAL, 'B1', 'C2');
INSERT INTO ex2_8 VALUES (seq_1.NEXTVAL, 'B2', 'C2');
INSERT INTO ex2_8 VALUES (seq_1.NEXTVAL, 'B3', 'C2');
INSERT INTO ex2_8 VALUES (seq_1.NEXTVAL, 'B4', 'C2');
INSERT INTO ex2_8 VALUES (seq_1.NEXTVAL, 'B5', 'C2');
INSERT INTO ex2_8 VALUES (seq_1.NEXTVAL, 'B6', 'C2');
INSERT INTO ex2_8 VALUES (seq_1.NEXTVAL, 'B7', 'C2');
INSERT INTO ex2_8 VALUES (seq_1.NEXTVAL, 'B8', 'C2');
INSERT INTO ex2_8 VALUES (seq_1.NEXTVAL, 'B9', 'C2');
INSERT INTO ex2_8 VALUES (seq_1.NEXTVAL, 'B10', 'C2');

INSERT INTO ex2_8 VALUES (seq_1.NEXTVAL, 'B11', 'C2');

SELECT seq_1.CURRVAL FROM DUAL;
SELECT seq_1.NEXTVAL FROM DUAL; --10이상 안된다 그래서 오류

SELECT * FROM ex2_8;

SELECT *
FROM SALES PARTITION (SALES_Q1_1998);


2장 문제풀이

1번문제 -- OK
DROP TABLE ORDERS;
CREATE TABLE ORDERS (
       ORDER_ID     NUMBER(12, 0) PRIMARY KEY,
       ORDER_DATE   DATE,
       ORDER_MODE   VARCHAR2(8 byte) CONSTRAINTS check1 CHECK(ORDER_MODE IN ('direct', 'online')), 
       CUSTOMER_ID  NUMBER(6, 0),
       ORDERS_STATUS    NUMBER(2, 0),
       ORDER_TOTAL  NUMBER(8, 2) DEFAULT 0,
       SALES_REP_ID NUMBER(6,0),
       PROMOTION_ID NUMBER(6,0)
       );

-- CONSTRAINTS check1를 컬럼명 옆에 쓸 경우 생략가능 but 맨 밑에 쓸 경우 써야한다
예시)

DROP TABLE ORDERS;
CREATE TABLE ORDERS (
       ORDER_ID     NUMBER(12, 0),
       ORDER_DATE   DATE,
       ORDER_MODE   VARCHAR2(8 byte), 
       CUSTOMER_ID  NUMBER(6, 0),
       ORDERS_STATUS    NUMBER(2, 0),
       ORDER_TOTAL  NUMBER(8, 2) DEFAULT 0,
       SALES_REP_ID NUMBER(6,0),
       PROMOTION_ID NUMBER(6,0),
       CONSTRAINTS pk_order_id PRIMARY KEY (ORDER_ID),
       CONSTRAINTS ck_order_mode CHECK(ORDER_MODE IN ('direct', 'online'))
);



<풀이>

CREATE TABLE 테이블명 (
    컬럼명 데이터타입 (제약조건),   --쉼표 꼭 적어주기
    CONSTRAINTS 명칭 제약조건 (컬럼)
);                           -- 잊지말고 테이블명 옆에 바로 써주기

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS -- 제약조건 포함한 시스템 테이블
WHERE table_name = 'ORDERS' 
;

INSERT INTO ORDERS(ORDER_ID, ORDER_MODE, PROMOTION_ID)
VALUES (1, 'offline', 11); -- 체크 제약조건(ORA_USER.CHECK1)이 위배되었습니다

INSERT INTO ORDERS(ORDER_ID, ORDER_MODE, PROMOTION_ID)
VALUES (4, 'online', 11);

INSERT INTO ORDERS(ORDER_ID, ORDER_MODE, PROMOTION_ID)
VALUES (1, 'direct', 11); -- 무결성 제약 조건(ORA_USER.SYS_C007471)에 위배됩니다



2번문제 -- OK
- 제약사항: 기본키는 3개, 디폴트 0

DROP TABLE ORDER_ITEMS;

CREATE TABLE ORDER_ITEMS (
        ORDER_ID      NUMBER(12, 0),
        LINE_ITEM_ID  NUMBER(3, 0),   
        PRODUCT_ID    NUMBER(3, 0),
        UNIT_PRICE    NUMBER(8, 2) DEFAULT 0,
        QUANTITY      NUMBER(8, 0) DEFAULT 0,
        CONSTRAINTS P_ID PRIMARY KEY (ORDER_ID, LINE_ITEM_ID)
); ---어떻게 써야 하지? 이게 맞나? -- 정답


INSERT INTO ORDER_ITEMS(ORDER_ID, LINE_ITEM_ID, PRODUCT_ID)
VALUES(1, 1, 11);

INSERT INTO ORDER_ITEMS(ORDER_ID, LINE_ITEM_ID, PRODUCT_ID)
VALUES(1, 22, 11);

INSERT INTO ORDER_ITEMS(ORDER_ID, LINE_ITEM_ID, PRODUCT_ID)
VALUES(1, 33, 11);


3번문제

CREATE TABLE PROMOTIONS(
    PROMO_ID    NUMBER(6, 0) PRIMARY KEY,
    PROMO_NAME  VARCHAR2(20)
);

--5번문제
--시퀀스 의사컬럼을 사용해 테이블 ORDERS1의 ORDER_ID 컬럼에 적절한 데이터
--(3행)을 삽입하시오

DROP SEQUENCE ORDERS1_SEQ;

CREATE SEQUENCE ORDERS1_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 10000
CYCLE
NOCACHE;

DROP TABLE ORDERS1;

DELETE FROM ORDERS1;

CREATE TABLE ORDERS1(
        ORDER_ID    NUMBER,
        COL2        VARCHAR(20));

INSERT INTO ORDERS1(order_id) VALUES(ORDERS1_SEQ.NEXTVAL);
INSERT INTO ORDERS1(order_id) VALUES(ORDERS1_SEQ.NEXTVAL);
INSERT INTO ORDERS1(order_id) VALUES(ORDERS1_SEQ.NEXTVAL);

DESC ORDERS1;

SELECT * FROM ORDERS1;

SELECT ORDERS1_SEQ.CURRVAL FROM DUAL;


--1.SELECT 문
--
--SELECT * 혹은 컬럼
--FROM 테이블
--WHERE 조건
--ORDER BY 컬럼

--예제1, 사원테이블에서 급여가 5000이 초과해서 받는 사원번호와 이름을
--조회하는 쿼리문을 작성하시오

SELECT employee_id, emp_name, salary
FROM employees
WHERE salary > 5000
ORDER BY 3 DESC;

--예제2, 사원테이블에서 급여가 5000이 초과해서 받는 사원번호와 이름을
--조회하는 쿼리문을 작성하시오
--job_id 가 IT 프로그래머인 사원을 조회하고싶다

SELECT employee_id, emp_name, salary, job_id
FROM employees
WHERE salary > 5000 AND job_id = 'IT_PROG'
ORDER BY 3 DESC;

--<응용문제>
--사원테이블에서 급여를 제일 많이 받는 사람을 조회하시오

SELECT employee_id, emp_name, SUM(salary)
FROM employees
GROUP BY employee_id, emp_name
HAVING  SUM(salary)>20000
;

SELECT employee_id, emp_name, MAX(DISTINCT salary)
FROM employees
--GROUP BY employee_id, emp_name
;

<풀이>
SELECT  MAX(salary)
FROM employees
;

COMMIT;

--2. INSERT 문

INSERT INTO 테이블명(컬럼1, 컬럼2,..)
VALUES (값1, 값2,...);

INSERT INTO 테이블명
VALUES (값1, 값2,...);

INSERT INTO 테이블명(컬럼1, 컬럼2,..)
SELECT (값1, 값2,...);


--문제, 사원테이블에 본인의 정보를 포함하여 데이터를 삽입하시오
--(사원번호, 사원이름, 이메일, 전화번호)


INSERT INTO employees (employee_id, emp_name, email, phone_number, hire_date)
VALUES (999, 'Luna', 'Lunita', '123456', SYSDATE);

SELECT *
FROM employees
WHERE employee_id=999;

ROLLBACK;


INSERT INTO 테이블명
VALUES (값1, 값2,...);

INSERT INTO 테이블명(컬럼1, 컬럼2,..)
SELECT (값1, 값2,...);

DELETE ORDERS1
WHERE ORDER_ID=2;


<5장 다시풀기>

1번  입사년도별 사원수를 구하는 쿼리를 작성

SELECT TO_CHAR(hire_date, 'YYYY')
FROM employees;

SELECT TO_CHAR(hire_date, 'YYYY'), COUNT(employee_id)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

2번 kor_loan_status 테이블에서 2012년도 월별, 지역별 대출 총 잔액 쿼리 작성

SELECT  period, region, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2012%'
GROUP BY period, region
ORDER BY 1;


3번, 집합연산자로 동일한 결과를 추출해라
SELECT period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE period Like '2013%'
GROUP BY period, ROLLUP(gubun);

-- 왜 구분을 위에는 생략하지 않고 밑에만?
--조건에 기타대출 또는 주택담보대출을 설정하지 않고 값이 어떻게 나오나?


SELECT PERIOD, GUBUN, SUM(LOAN_JAN_AMT)
FROM    kor_loan_status
WHERE period Like '2013%'
GROUP BY period, gubun

UNION

SELECT  PERIOD, '', SUM(LOAN_JAN_AMT)
FROM    kor_loan_status
WHERE period Like '2013%'
GROUP BY period;


4번, 집합연산자로 동일한 결과를 추출해라

SELECT period,
       CASE WHEN gubun = '주택담보대출' THEN SUM(loan_jan_amt) ELSE 0 END 주택담보대출액,
       CASE WHEN gubun = '기타대출' THEN SUM(loan_jan_amt) ELSE 0 END 기타대출액
FROM kor_loan_status
WHERE period = '201311'
GROUP BY period, gubun;

SELECT  period, 0 주택담보대출액, SUM(loan_jan_amt) 기타대출액
FROM    kor_loan_status
WHERE   period = '201311'
    AND gubun = '기타대출'
GROUP BY period
UNION
SELECT  period, SUM(loan_jan_amt) 주택담보대출액, 0 기타대출액
FROM    kor_loan_status
WHERE   period = '201311'
    AND gubun = '주택담보대출'
GROUP BY period;

5번 

SELECT region,
    SUM(CASE WHEN period = '201111' THEN (loan_jan_amt) ELSE 0 END) "201111",
    SUM(CASE WHEN period = '201112' THEN (loan_jan_amt) ELSE 0 END) "201112",
    SUM(CASE WHEN period = '201112' THEN (loan_jan_amt) ELSE 0 END) "201112",
    SUM(CASE WHEN period = '201112' THEN (loan_jan_amt) ELSE 0 END) "201112",
    SUM(CASE WHEN period = '201112' THEN (loan_jan_amt) ELSE 0 END) "201112",
    SUM(CASE WHEN period = '201112' THEN (loan_jan_amt) ELSE 0 END) "201112",
    SUM(CASE WHEN period = '201112' THEN (loan_jan_amt) ELSE 0 END) "201112",
FROM kor_loan_status
GROUP BY region;



동등조인


where 절 서브쿼리

SELECT  count(*)
FROM    employees
WHERE   salary >= (SELECT AVG(salary) FROM employees)
;

SELECT  count(*)
FROM    employees
WHERE   department_id IN( SELECT department_id
                            FROM    departments
                            WHERE parent_id is null);
                            
SELECT  employee_id, job_id, emp_name
FROM    employees
WHERE   (employee_id, job_id) IN (SELECT employee_id, job_id
                                    FROM job_history);


SELECT  department_id
FROM    departments
WHERE   parent_id is null
;

SELECT count(*)
FROM   departments
WHERE   department_id NOT IN (SELECT  department_id
                        FROM    departments
                        WHERE   parent_id is null);

<서브쿼리>: 경력테이블로부터 사원번호와 직업번호 조회

SELECT employee_id, job_id
FROM    job_history;

<메인쿼리>: 사원테이블에서 사원이름과 매칭, 사원번호와 직업번호도 조회

SELECT  emp_name, employee_id, job_id
FROM    employees
WHERE  employee_id IN (SELECT employee_id
                                 FROM   job_history);

사원테이블의 급여를 전직원 동일하게 평균급여로 변경

UPDATE employees
SET salary = (SELECT AVG(salary) FROM employees);


평균급여보다 많이 받는 사람 삭제

SELECT  emp_name
FROM    employees
WHERE   salary > (SELECT AVG(salary) FROM employees);

DELETE employees
WHERE salary > (SELECT AVG(salary) FROM employees);

<메인쿼리>: 경력테이블에서 조회된 부서번호를 부서명과 함께 조회

SELECT   department_id
FROM    job_history;


SELECT   department_id, department_name
FROM    departments d
WHERE   EXISTS (SELECT   department_id
                FROM    job_history j
                WHERE j.department_id = d.department_id);

<서브쿼리1> 사원테이블에서 사원명 조회 107건
 SELECT COUNT(*)
 FROM employees;

<서브쿼리2>  부서명 조회 27건

 SELECT COUNT(department_id)
 FROM departments;
 
 <메인쿼리>  사원번호, 사원명, 부서번호, 부서명
 
 SELECT employee_id, emp_name, department_id, 
               (SELECT  department_name
                FROM    departments d
                WHERE d.department_id = e.department_id) department_name
 FROM   employees e
 ;
 
 <서브쿼리1> 사원테이블에서 평균급여조회
SELECT AVG(salary)
FROM employees;
                
<서브쿼리2> 평균급여 보다 높은급여를 받는 사원의 부서번호 조회

SELECT employee_id
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

<메인쿼리> 평균급여 보다 높은급여를 받는 사원의 부서번호와 매칭되는 부서명 조회

--SELECT employee_id, department_name
--FROM employees e, departments d
--WHERE salary > (SELECT AVG(salary) FROM employees)
--    AND e.department_id = d.department_id ;


SELECT  d.department_name
FROM    departments d
WHERE   EXISTS (SELECT  e.department_id
                FROM    employees e
                WHERE   e.department_id = d.department_id
                   AND e.salary > (SELECT AVG(salary) FROM employees));



SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM employees a, 
     job_history b
WHERE a.employee_id = b.employee_id(+) -- 외부조인은 한 쪽으로만
 AND a.department_id = b.department_id(+);

6장 6번
연도별 이탈리아 최소매출사원명 최소매출액

SELECT  SUBSTR(s.sales_month,1,4), 
        c.country_name, e.emp_name, MIN(s.amount_sold)
FROM    sales s, employees e, countries c
WHERE   c.country_name = 'Italy'
    AND s.employee_id = e.employee_id
GROUP BY SUBSTR(s.sales_month,1,4), e.emp_name, c.country_name
ORDER BY 1;


SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id;

SELECT  years,
        MAX(amount_sold),
        MIN(amount_sold)
FROM    (SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id)
GROUP BY years;        





                                   
