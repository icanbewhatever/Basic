2장 데이터베이스를 구성하는 객체
--테이블 생성

CREATE TABLE 테이블 명 (
    컬럼명 데이터타입,
    컬럼명 데이터타입
);

테이블 생성 규칙
테이블명, 컬럼명의 최대 크기는 30 Byte
테이블명, 컬럼명 예약어  사용 불가
테이블명, 컬럼명으로 문자, 숫자, _ $ # 문자 사용가능, 첫 글자는 문자만
한 테이블에 만들 수 있는 컬럼은 최대 255개


CREATE TABLE table_1(
    column1 NUMBER(3), -- 123 12.3 1.00 문자X,(3)생략가능 단 숫자는 3개만 쓸 수있다
    col2 VARCHAR2(20), -- 'ABC' '10' ()생략불가능
    col3 DATE          --날짜  LOV - 총 4가지 데이터타입이 있다
    );

DROP TABLE ex2_1;

CREATE TABLE ex2_1(
    column1    CHAR(10),
    column2    VARCHAR(10)
    );

--문자 데이터 타입
INSERT INTO ex2_1 (column1, column2) 
VALUES ('abc', 'abc');
SELECT column1, LENGTH(column1) as len1,
       column2, LENGTH(column2) as len2
FROM ex2_1;

CREATE TABLE ex2_2(
        COLUMN1 VARCHAR2(3),
        COLUMN2 VARCHAR2(3 byte),
        COLUMN3 VARCHAR2(3 char)
);

INSERT INTO ex2_2 VALUES ('abc', 'abc','abc');

SELECT column1, LENGTH(column1) AS len1,
       column2, LENGTH(column1) AS len2,
       column3, LENGTH(column1) AS len3
FROM ex2_2;

INSERT INTO ex2_2 VALUES ('이현주','이현주','이현주'); 
-- 한글은 한 글자가 2byte이므로 오류발생 그러나 col3에서는char을 명시해서 입력이 가능하다

INSERT INTO ex2_2 (column3) VALUES('이현주');

SELECT column3, LENGTH (column3) AS len3, LENGTHB(column3) AS bytelen
FROM ex2_2;

--숫자 데이터 타입
CREATE TABLE ex2_3(
        COL_INT INTEGER,
        COL_DEC DECIMAL,
        COL_NUM NUMBER
        );
        
SELECT column_id, column_name, data_type, data_length
FROM user_tab_cols
WHERE table_name = 'EX2_3'
ORDER BY column_id;

--날짜 데이터 타입

INSERT INTO table_1
VALUES(100, '정말', SYSDATE);

CREATE TABLE ex2_8(
    COL1 VARCHAR2(10) PRIMARY KEY,
    COL2 VARCHAR2(10)
    );
SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_8';
INSERT INTO ex2_8 VALUES ('AA', 'AA');
    


--5. 시퀸스
--최소값 1,
--최대값 99999999,
--1000부터 시작해서
--1씩 증가하는
--ORDERS_SEQ 라는 시퀸스를 만들어보자

CREATE SEQUENCE my_seq1
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
NOCACHE;


DELETE ex2_8;
INSERT INTO ex2_8 (col1) VALUES ( my_seq1.NEXTVAL);
 INSERT INTO ex2_8 (col1) VALUES ( my_seq1.NEXTVAL);
  SELECT *
  FROM ex2_8;
   SELECT my_seq1.CURRVAL
   FROM DUAL;
    INSERT INTO ex2_8 (col1) VALUES (my_seq1.NEXTVAL);
     SELECT *
      FROM ex2_8;
       SELECT my_seq1.NEXTVAL
       FROM DUAL;
        INSERT INTO ex2_8 (col1) VALUES ( my_seq1.NEXTVAL);
         SELECT *
         FROM ex2_8;

CREATE SEQUENCE ORDERS_SEQ
INCREMENT BY 1
START WITH 1000
MINVALUE 1
MAXVALUE 99999999
NOCYCLE
NOCACHE;



3장
--1.SELECT 문
SELECT COUNT(emp_name)
FROM employees
WHERE salary > 20000;

SELECT employee_id, emp_name
FROM employees
WHERE salary > 20000;

SELECT employee_id, emp_name
FROM employees
WHERE salary >= 5000
ORDER BY employee_id;

SELECT employee_id, emp_name
FROM employees
WHERE job_id = 'IT_PROG' AND salary >= 5000
ORDER BY employee_id;

--두개의 테이블을 하나의 SQL문에서 사용하는 경우
SELECT d.department_id 
FROM employees e, departments d;

--원컬럼명에 별칭을 붙이는 경우(AS 생략가능)
SELECT d.department_id AS dep_id
FROM employees e, departments d;

SELECT hire_date
FROM employees
WHERE hire_date>'01/01/23';

SELECT e.hire_date AS hire
FROM employees e
WHERE hire_date>'01/01/23';

SELECT commission_pct, emp_name
FROM employees
WHERE commission_pct='0.15'
ORDER BY employee_id;

--2.INSERT 문
--1) 기본형태

CREATE TABLE ex3_1(
       col1 VARCHAR2(10),
       col2 NUMBER,
       col3 DATE
);
INSERT INTO ex3_1(col1, col2, col3) --기본형태
VALUES ('ABC', 10, '23/11/07'
);

INSERT INTO ex3_1(col1, col2, col3)
VALUES ('ABC', 10, SYSDATE
);

INSERT INTO ex3_1(col3, col1, col2)
VALUES (SYSDATE, 'DEF', 20
);

INSERT INTO ex3_1(col2, col3, col1)
VALUES (30, SYSDATE, 'LOV'
);

INSERT INTO ex3_1(col1, col2, col3)
VALUES ('DIAZ', 0, SYSDATE
);

--2) 컬럼명 기술 생략 형태 (컬럼명col 생략 가능 단, 순서그대로)

INSERT INTO ex3_1
VALUES ('LEE', 1, NULL);



--3) INSERT ~ SELECT 형태
DROP TABLE ex3_2;
CREATE TABLE ex3_2(
    emp_id NUMBER(6,0),
    emp_name VARCHAR2(100 BYTE)
);

--문제: 급여가 5000만원 이상인 사원정보를 새 테이블에 입력
INSERT INTO ex3_2
SELECT employee_id, emp_name
FROM employees
WHERE salary >= 5000;

SELECT COUNT(*)
FROM ex3_2;

INSERT INTO ex3_2
VALUES (300, 'luna');

--자동 형변환 = 묵시적 형변환
INSERT INTO ex3_1(col2)
VALUES ('10원');

--테이블 복사와 INSERT 구문 차이
--테이블 복사
--DDL구문: 테이블을 생성
    CREATE TABLE ex3_1 copy AS
    SELECT 컬럼명 col1, col2, col3
    FROM 테이블명 ex3_1;

--INSERT
--DML구문: 테이블 생성 X
CREATE TABLE ex3_1 copy(
컬럼명 데이터 타입
     col1 VARCHAR2(10 BYTE),
     col2 NUMBER,
     col3 DATE,
);

INSERT INTO 테이블명
SELECT 컬럼명
FROM 테이블명;


--3. UPDATE 구문
SELECT *
FROM ex3_1;

UPDATE ex3_1
SET col2 = 0;

UPDATE ex3_1
SET col2 = 40
WHERE col1 = 'ABC';

UPDATE ex3_1
SET col2 = 10
WHERE col3 = '23/11/07 10:18:37';

테이블 ex3_1에서 
컬럼 col1의 데이터가 DIAZ이고, 
컬럼 col3의 데이터나 널이 아닌 경우
col3 컬럼의 데이터에 시스템의 날짜/시간을 수정하세요.
UPDATE ex3_1
SET col3 = '23/11/10'-- 또는 SYSDATE
WHERE col3 is null; -- 또는 is not null

UPDATE ex3_1
SET col1 = 'MNO'
WHERE col1 is null;

SELECT * FROM ex3_1;





--4.MERGE 문
목표: 2000년 10월부터 12월 사이에 월 매출을 기준으로
    적정 매출을 달성한 사원에게 더 많은 보너스를 지급함
사용 테이블: 사원 employees, 판매 sales

문제1. 해당 월에 매출을 달성한 사원은 누구인가?
매출을 달성한 사원 목록ㅇ을 ex3_3 테이블에 삽입
사원번호가 사원테이블과 판매 테이블에 둘 다 있어야 함
2000년도 10월~ 12월 사이에 월 매출을 기준으로 함


DROP TABLE ex3_3;
CREATE TABLE ex3_3(
    employee_id NUMBER,
    bonus_amt   NUMBER DEFAULT 0
);

INSERT INTO ex3_3 (employee_id)
SELECT e.employee_id
FROM employees e, sales s
WHERE e.employee_id = s.employee_id
    AND s.SALES_MONTH BETWEEN 200010 AND 200012
GROUP BY e.employee_id
;

SELECT * FROM ex3_3 ORDER BY employee_id;


ex3_3 테이블 => 매출 달성한 사람 = 보너스 받는 사람 
1. 관리자 사번 manager_id가 146번인 사원을 찾아 SELECT 

2. ex3_3 테이블에 있는 사원의 사번과 일치하면
보너스 bonus_amt를 자신의 급여salary 1%를 보너스로 갱신

3. ex3_3 테이블에 있는 사원 사번 일치하지 않으면
1의 결과이 사원을 신규로 입력 (보너스 금액은 0.1%)
급여가 8000 미만인 사람만

SELECT employee_id, manager_id
FROM employees
WHERE manager_id = 146;

SELECT employee_id, manager_id, salary * 0.01
FROM employees
WHERE manager_id = 146;

1% : salary * 0.01
0.1% : salary * 0.01

SELECT * FROM ex3_3 ORDER BY employee_id;

-- INSERT INTO ex3_3 VALUES(300,0); -300은 EMPLOYEES테이블에 없어서 안나옴

-- 보너스 1% 받는 사람 명단 및 보너스 금액
SELECT employee_id, manager_id, salary, salary*0.01
FROM employees
WHERE employee_id IN (SELECT employee_id FROM ex3_3);


SELECT employee_id FROM ex3_3;

-- 보너스 0.1% 받는 사람 명단 및 보너스 금액
SELECT employee_id, manager_id, salary, salary*0.001
FROM employees
WHERE manager_id = 146
    AND employee_id NOT IN (SELECT employee_id FROM ex3_3)
    ;

SELECT employee_id, manager_id, salary
FROM   employees
WHERE  manager_id = 146
;


MERGE INTO ex3_3 d
    USING (SELECT employee_id, manager_id, salary
           FROM   employees
           WHERE  manager_id = 146) t
    ON (d.employee_id = t.employee_id)
WHEN MATCHED THEN 
    UPDATE SET d.bonus_amt=t.salary * 0.01
        DELETE WHERE t.employee_id = 161
WHEN NOT MATCHED THEN
    INSERT ( d.employee_id, d.bonus_amt) VALUES (t.employee_id, t.salary * 0.001)
    WHERE t.salary < 8000;

SELECT * FROM ex3_3;


-- DELETE : 데이터 삭제
DELETE ex3_3
WHERE employee_id = 155;

DELETE ex3_3;

-- COMMIT : 마지막 데이터 반영

INSERT INTO ex3_3 VALUES(300,100);
SELECT * FROM ex3_3;

COMMIT;

-- ROLLBACK : COMMIT의 반대, 변경하기 이전 상태

INSERT INTO ex3_3 VALUES(301,200);
SELECT * FROM ex3_3;

ROLLBACK;

SELECT * FROM ex3_3;

-- 의사컬럼
SELECT ROWNUM, employee_id
FROM   ex3_3;

INSERT INTO ex3_3 VALUES(302,300);
INSERT INTO ex3_3 VALUES(303,400);
INSERT INTO ex3_3 VALUES(304,500);

SELECT ROWNUM employee_id, ROWID
FROM ex3_3
WHERE ROWNUM < 3;

DROP SEQUENCE ex3_3_seq;
CREATE SEQUENCE ex3_3_seq
INCREMENT BY    1
START WITH      1
MINVALUE        1
MAXVALUE        30
NOCYCLE
NOCACHE
NOORDER;

SELECT * FROM ex3_3;

INSERT INTO ex3_3 VALUES(ex3_3_seq.NEXTVAL, 0);

SELECT ex3_3_seq.NEXTVAL
FROM DUAL;

SELECT ex3_3_seq.CURRVAL
FROM DUAL;


-- 문자연산자
-- shift+ won= ||

SELECT emp_name, salary || '-' || commission_pct
FROM employees
WHERE commission_pct <= 1
;

-- 산술연산자 => + - * /
고객이 쇼핑몰에서 'Mouse Pad'를 3개 구매했을 때 가격 계산하기

SELECT PROD_LIST_PRICE, PROD_LIST_PRICE*3||'$'
FROM PRODUCTS
WHERE PROD_DESC = 'Mouse Pad';

-- 논리연산자: >, <, >=, <=, =     같지않다 <>, !=. ^= !부정의 의미
고객이 쇼핑몰에서 제품을 구매할 때 10달러 이하 제품을 검색하기

SELECT prod_desc, prod_list_price||'$'
FROM products
WHERE prod_list_price<= 10;

-- 표현식
CASE WHEN 조건1 THEN 값1
     WHEN 조건2 THEN 값2
     ...
     ELSE 기타 값
END

ex.급여가
5000 이하로 받는 사람 C등급
5000 초과~ 15000미만 받는 사람 B
15000 이상 받는 사람  A
그 밖의 경우 D

SELECT employee_id, salary,
CASE WHEN salary <= 5000 THEN 'C등급'
     WHEN salary > 5000 AND salary < 1500 THEN 'B등급'
     WHEN salary >= 1500 THEN 'A등급'
     ELSE 'D등급'
END
FROM employees;


SELECT employee_id, salary,
CASE WHEN salary <= 5000 THEN 'C등급'
     WHEN salary > 5000 AND salary < 1000 THEN 'B등급'
     WHEN salary >= 10000 AND salary > 15000 THEN 'A등급'
     ELSE 'D등급'
END    
FROM employees;

--조건식 (where절에 활용)
논리연산자 : AND OR NOT
비교 조건식: ANY SOME ALL
            ANY(값1, 값2, 값3, ....) 어떤 조건 하나라도 만족하면 된다
            SOME(값1, 값2, 값3, ....) ANY와 같다
            ALL(값1, 값2, 값3, ....) 모든 조건을 만족
            
SELECT 컬럼 
FROM   테이블
WHERE  조건;
            
SELECT employee_id, salary 
FROM   employees
WHERE  salary = ANY(2000, 3000, 4000);

SELECT employee_id, salary 
FROM   employees
WHERE  salary = ALL(4000);  

SELECT employee_id, salary 
FROM   employees
WHERE  salary = 4000
    OR salary = 3000
    OR salary = 2000;

SELECT employee_id, salary 
FROM   employees
WHERE  salary < 4000
    AND salary < 5000
    AND salary < 3000;

SELECT employee_id, salary 
FROM   employees
WHERE  salary > ANY(2000, 3000, 4000)
;

SELECT employee_id, salary 
FROM   employees
WHERE  salary > 4000
    OR salary > 3000
    OR salary > 2000
;

SELECT employee_id, salary 
FROM   employees
WHERE  salary < ALL(4000)
; 


-- 논리 조건식
논리연산자: AND OR NOT

SELECT  employee_id, salary
FROM    employees
WHERE   salary > 8000 OR salary < 10000
;

SELECT  employee_id, salary
FROM    employees
WHERE   NOT (salary > 15000)
;

-- NULL 조건식
IS NULL
IS NOT NULL

SELECT  employee_id, salary
FROM    employees
WHERE   manager_id IS NOT NULL
;

-- BETWEEN AND 조건식
기준컬럼 BETWEEN 시작값 AND 종료값

SELECT  employee_id, salary
FROM    employees
WHERE   salary BETWEEN 2000 AND 2500
;

-- IN 조건식
조건절에 명시한 값이 포함된 내용을 결과로 반환 = ANY와 같지만 부등호가필요해 다르다 
IN (값1, 값2, 값3...)

SELECT  employee_id, salary
FROM    employees
WHERE   salary IN (2000, 3000, 4000)
;

-- EXISTS 조건식
EXISTS(서브쿼리 select with 조인조건)
조인조건: 테이블1.기준컬럼 = 테이블2.기준컬럼 
> 각각의 컬럼 두개를 합치기 위해서
기준테이블을 명시하기 위해 .기준컬럼으로 구별해준다
    예) employees.department_id = departments.department_id
        e.department_id = d.department_id
<서브쿼리>
SELECT  컬럼   *
FROM    테이블 employeees e
WHERE   조건  e.department_id = d.department_id
             AND salary >= 3000;
;

<메인쿼리> 급여가 3천만원 이상인 부서 아이디, 부서명을 조회해라
내가한거
SELECT  department_id, department_name
FROM    departments
WHERE   EXISTS( SELECT salary 
                FROM employees 
                WHERE salary >= 3000
                AND employees.department_id = departments.department_id)
;

수업시간에
SELECT  department_id, department_name
FROM    departments d
WHERE   EXISTS( SELECT * 
                FROM employees e 
                WHERE salary >= 14000
                AND e.department_id = d.department_id)
;

-- LIKE 조건식
LIKE '문자열 패턴' 검색
예) 사원테이블에서 사원이름이 '홍길동'인 사원을 조회
예) 사원테이블에서 사원이름이 '홍'으로 시작하는 사원을 조회
여러문자 %
한 문자 _

SELECT  emp_name
FROM    employees
WHERE   emp_name LIKE 'John%'
;

SELECT  emp_name
FROM    employees
WHERE   emp_name LIKE 'Jo__ %'
;


SELECT  emp_name
FROM    employees
WHERE   emp_name LIKE 'A%'
;

CREATE TABLE ex3_5(
    name    VARCHAR2(30)
);

INSERT INTO ex3_5 VALUES ('홍길동');
INSERT INTO ex3_5 VALUES ('홍길용');
INSERT INTO ex3_5 VALUES ('홍길상');
INSERT INTO ex3_5 VALUES ('홍길상동');
INSERT INTO ex3_5 VALUES ('홍길수');

SELECT * FROM ex3_5;

COMMIT;

SELECT *
FROM   ex3_5
WHERE  name LIKE '%동';

SELECT *
FROM   ex3_5
WHERE  name LIKE '홍__'
    OR name LIKE '%동';
    

<3장 문제 풀이 방법>

1.문제해석 > 정보찾기 (동사) , 정보분리
2.쿼리문 형태(문법)작성

1번 
    ex3_6 테이블을 만들고, 사원테이블에서 
    관리자사번이 124번이고 급여가 2천에서 3천 사이에 있는 
    사원의 사번, 사원명, 급여, 관리자사번을 입력하는
    INSERT문을 작성해보자

DROP TABLE ex3_6;

CREATE TABLE ex3_6(
       employee_id  NUMBER, 
       emp_name     VARCHAR2(30),
       salary       NUMBER,
       manager_id   NUMBER
       );

INSERT INTO ex3_6
    SELECT  employee_id, emp_name, salary, manager_id
    FROM    employees
    WHERE   manager_id = 124
        AND salary BETWEEN 2000 AND 3000
 ;

2번문제

다음을 입력

    DELETE ex3_3;
    
    INSERT INTO ex3_3 (employee_id)
    SELECT e.employee_id
    FROM    employees e, sales s
    WHERE   e.employee_id = s.employee_id
        AND s.SALES_MONTH BETWEEN'200010' AND '200012'
    GROUP BY e.employee_id
    ;
    
관리자 사번이 145번이 사원을 찾아
위 테이블에 있는 사원 사번과 일치하면
보너스 금액bonus_amt에 자신의 급여의 1%를 보너스로 갱신하고
ex3_3테이블에 있는 사원의 사원과 일치하지 않은 사원을
신규입력 (이때 보너스는 급여의 0.5% 한다)

> 사원찾기 - SELECT
> 갱신하고 - UPDATE
> 신규입력 - INSERT
>MERGE입력 - MERGE

관리자 사번이 145번이 사원을 찾아
위 테이블에 있는 사원 사번과 일치하면 => MATCHED
보너스 금액bonus_amt에 자신의 급여의 1%를 보너스로 갱신하고
ex3_3테이블에 있는 사원의 사원과 일치하지 않은 사원을
신규입력 (이때 보너스는 급여의 0.5% 한다) => NOT MATCHED

테이블 ex3_3, employees
컬럼  manager_id, employee_id, bonus_amt, salary
manager_id = 145
bonus_amt = bonus_amt + salary *0.01
bonus_amt = bonus_amt + salary *0.005

수업에서 푼거,

SELECT employee_id, salary
FROM employees
WHERE manager_id = 145;

MERGE INTO ex3_3 x
    USING (SELECT employee_id, salary
            FROM employees
            WHERE manager_id = 145) e
    ON (x.employee_id = e.employee_id)
WHEN MATCHED THEN
    UPDATE SET  x.bonus_amt = x.bonus_amt + e.salary *0.01
WHEN NOT MATCHED THEN
    INSERT (x.employee_id, x.bonus_amt) 
    VALUES (e.employee_id, e.salary *0.005)
;   



내가 푼 거
    SELECT employee_id, manager_id, salary, salary*0.01
    FROM employees
    WHERE manager_id = 145
        AND employee_id IN (SELECT employee_id
                            FROM ex3_3) ;
    
    SELECT employee_id, manager_id, salary, salary*0.005
    FROM  employees
    WHERE manager_id = 145
     AND employee_id NOT IN(SELECT employee_id
                            FROM ex3_3) ;
                            
   
    
    MERGE INTO ex3_3 b
        USING (SELECT employee_id, manager_id, salary
                FROM  employees
                WHERE manager_id = 145) a
        ON ( a.employee_id = b.employee_id)
    WHEN MATCHED THEN
       UPDATE SET b.bonus_amt = a.salary*0.01+ a.salary
    WHEN NOT MATCHED THEN
        INSERT (b.employee_id, b.bonus_amt)
        VALUES (a.employee_id, a.salary*0.005)
        WHERE manager_id = 145
     AND employee_id NOT IN(SELECT employee_id
                            FROM ex3_3) ;
    
    
    
3장3번문제 OK

-추출하는 쿼리를 작성 > SELECT

SELECT employee_id, emp_name, commission_pct
FROM    employees
WHERE commission_pct IS NULL
;


3장 4번문제 OK
논리연산자: AND OR NOT
비교연산자: > < >= <= ...

SELECT employee_id, salary
FROM    employees
WHERE   salary >= 2000
    AND salary <= 2500
;

3장 5번문제
아래 문장을 ANY와 ALL을 사용해서 동일한 결과 추출

SELECT employee_id, salary --사원번호, 급여 조회
FROM    employees          -- 사원 테이블로부터 
WHERE salary IN (2000, 3000, 4000) -- 급여가 2,3,4천 값이 포함되면
ORDER BY employee_id;      -- 사원 번호로 정렬

SELECT employee_id, salary --사원번호, 급여 조회
FROM    employees          -- 사원 테이블로부터 
WHERE salary NOT IN (2000, 3000, 4000) -- 급여가 2,3,4천 값이 포함 안되면
ORDER BY employee_id;      -- 사원 번호로 정렬

추출 => SELECT 
ANY, ALL을 사용해서 => 비교조건식

테이블: employees
컬럼: employee_id, salary
조건: 컬럼명 (비교연산자) ANY(값1, 값2, 값3)
     컬럼명 (비교연산자) ALL(값1, 값2, 값3)

---------------------------------내가 푼거
SELECT employee_id, salary
FROM    employees
WHERE salary = ANY (2000, 3000, 4000)
ORDER BY employee_id;

--급여가 2,3,4쳔 모두ALL 같으면
SELECT employee_id, salary
FROM    employees
WHERE salary = ALL (2000, 3000, 4000) -- 안되는 이유???? 
ORDER BY employee_id;

SELECT employee_id, salary
FROM    employees
WHERE salary = SOME(2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM    employees
WHERE   salary = 2000
    AND salary = 3000
    AND salary = 4000 ---왜 안되지? -- OR로 써줘야한다
ORDER BY employee_id;



SELECT employee_id, salary
FROM    employees
WHERE   salary = 3000
    OR salary = 3000
    OR salary = 4000 
ORDER BY employee_id;


--NOT IN 풀이


SELECT employee_id, salary 
FROM    employees         
WHERE salary > 2000
    AND salary > 3000
    AND salary > 4000
ORDER BY employee_id;      


SELECT employee_id, salary
FROM    employees
WHERE   salary != 2000
    AND salary != 3000
    AND salary != 4000 
ORDER BY employee_id;


SELECT employee_id, salary
FROM    employees
WHERE salary <> ALL(2000, 3000, 4000)
ORDER BY employee_id;


----SQL 함수
숫자함수

ABS (숫자)    절대값
CEIL (숫자)   올림
FLOOR(숫자)   버림
ROUND(숫자)   반올림 (5이상일때만)
**TRUNC(숫자, 숫자)   버림
POWER(숫자, 숫자)   제곱
**MOD(숫자,숫자)      나머지
REMINDER(숫자, 숫자)    나머지




SELECT ABS (10) FROM DUAL;
SELECT ABS (0) FROM DUAL;
SELECT ABS (-10) FROM DUAL;

SELECT CEIL(10.123), CEIL(10.541), CEIL(10) FROM DUAL;
SELECT FLOOR(10.123), FLOOR(10.541), FLOOR(10) FROM DUAL;

SELECT ROUND(10.123), ROUND(10.541), ROUND(10) FROM DUAL;
SELECT ROUND(10.157, 1), ROUND(10.157, 2), ROUND(10.157, 3) FROM DUAL;

SELECT TRUNC(115.55)FROM DUAL;
SELECT TRUNC(115.55, 1)FROM DUAL; -- n2의 소수점 첫자리 입력
SELECT TRUNC(115.55, -2)FROM DUAL; -- n2의 소수점 -2

SELECT POWER(2, 2), POWER(3, 3), POWER(4, -2) FROM DUAL;

SELECT SQRT(2), SQRT(3), SQRT(5) FROM DUAL;

SELECT MOD(13, 2), MOD(19 ,4) FROM DUAL;

SELECT REMAINDER(13, 2), REMAINDER(19 ,4) FROM DUAL; 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              -- 왜 -1이 나오나? 20에 1만 추가하면 더 가까워서


-----------문자함수
INITCAP(문자)     첫자대문자
LOWER(문자)       소문자
UPPER(문자)       대문자
CONCAT(문자)      두문자 연결
' '안에 쓰인 공백도 문자로 처리됨

SELECT INITCAP('never say goodbye'),
       INITCAP('NEVER SAY GOODBYE'),
       INITCAP('never6say good가bye')
FROM DUAL;


SELECT LOWER('never say goodbye'),
       LOWER('NEVER SAY GOODBYE'),
       LOWER('never6say good가bye')
FROM DUAL;

SELECT UPPER('never say goodbye'),
       UPPER('NEVER SAY GOODBYE'),
       UPPER('never6say good가bye')
FROM DUAL;

SELECT CONCAT('never', 'say goodbye'), 'never'||'say'||'goodbye'
FROM DUAL;   --' '안에 쓰인 공백도 문자로 처리됨

-----------------------------------------------------
SUBSTR (문자, 위치, 길이) 부분문자열 -- 공백주의
SUBSTRB (문자, 위치, 바이트) 부분문자열
LTRIM (문자, 잘라낼문) 왼쪽 문자열 제거
RTRIM (문자, 잘라낼문) 오른쪽 문자열 제거


SELECT SUBSTR('never say goodbye',7,3)
FROM DUAL;

SELECT SUBSTRB('점심시간은 언제인가요?',7,6) --1개/3 byte
FROM DUAL;

SELECT LTRIM('never say goodbye', 'never ') 
FROM DUAL;

SELECT RTRIM('never say goodbye', 'bye') 
FROM DUAL;

------------------------------
LPAD (문자열1, 길이, 문자열2)
RPAD (문자열1, 길이, 문자열2)
-> 문자열1에 총 문자열의 길이가 n이 될때까지 반복적으로 문자열2를 붙임

**REPLACE (문자열, 대상문자열, 바꿀문자열) -- > 문자열 대체, 공백사용가능 문자삭제할때도
TRANSLATE (문자열, 대상문자, 바꿀문자)--> 각각의 문자 대체,  한 글자씩 찾아 바꾼다
INSTRA (전체문자열, 검색할문자열, 시작위치, 발생횟수)

예시)
SELECT LPAD('123-4567', '13', '(032)') 
FROM DUAL;

SELECT RPAD('123-4567', '13', '(032)') 
FROM DUAL;

SELECT REPLACE('나는 너를 모르는데', '나', '너') 
FROM DUAL;

SELECT TRANSLATE('나는 너를 모르는데', '나는', '너를') 
FROM DUAL;

SELECT REPLACE('관계형 데이터베이스(RDBMS)가 가장 널리 쓰이고 있다.
그리고 이 관계형 데이터베이스를 이용하기 위한 표준 언어가 만들어져 있는데그것이 SQL이다.', 
                '관계', '소통') 
FROM DUAL;


SELECT TRANSLATE('관계형 데이터베이스(RDBMS)가 가장 널리 쓰이고 있다.
그리고 이 관계형 데이터베이스를 이용하기 위한 표준 언어가 만들어져 있는데그것이 SQL이다.', 
                '이용', '사람') 
FROM DUAL;

SELECT REPLACE('관계형 데이터베이스(RDBMS)가 가장 널리 쓰이고 있다.
그리고 이 관계형 데이터베이스를 이용하기 위한 표준 언어가 만들어져 있는데그것이 SQL이다.', 
                '관계', '소통') 
FROM DUAL;

---------------------INSTR

SELECT INSTR('관계형 데이터베이스(RDBMS)가 가장 널리 쓰이고 있다.
그리고 이 관계형 데이터베이스를 이용하기 위한 표준 언어가 만들어져 있는데그것이 SQL이다.', 
                검색할문자열, 시작위치, 발생횟수) 
FROM DUAL;


SELECT INSTR('관계형 데이터베이스가 가장 널리 쓰이고 있다.
그리고 이 관계형 데이터베이스를 이용하기 위한 표준 언어가 만들어져 있는데그것이 SQL이다.', 
                '데이터베이스', 10, 2) 
FROM DUAL;


***날짜함수
SYSDATE        - 현재 날짜/시간(시분초)반환
ADD_MONTHS     - 해당 날짜 기준 월(정수)를 더한 날짜 변환
MONTHS_BETWEEN (종료날짜, 시작날짜) - 날짜간 개월 수 반환
LAST_DAY(날짜)  - 해당 월 마지막 일자 반환

ROUND   반올림한 날짜
TRUNC   잘라낸 날짜
NEXT_DAY   다음주 주중 일자 반환
ROUND(날짜, 포맷)   반올림한 날짜 
TRUNC(ROUND(날짜, 포맷), 포맷)   잘라낸 날짜
NEXT_DAY(날짜, 찾을요일) 다음 해당 요일 일자 변환


SELECT ADD_MONTHS (SYSDATE,6)
FROM DUAL;

SELECT MONTHS_BETWEEN('2023/11/10', '2024/4/10')
FROM DUAL;

SELECT MONTHS_BETWEEN('2024/4/10', '2023/11/10')
FROM DUAL;

SELECT MONTHS_BETWEEN(ADD_MONTHS(SYSDATE,6), '2023/11/10')
FROM DUAL;

*****함수의 중첩 사용
함수(입력값, 입력값2)-a
입력값2 <= 다른함수()가 a에 들어갈수있다
함수(입력값1, 다른함수())
단, 반환되는 결과의 데이터타입이 일치하는 경우에만 가능


A(1,B(3,4))
B(3,4) > 5




함수(문자1, 문자2)

SELECT LAST_DAY('2024/2/1')
FROM DUAL;

SELECT LAST_DAY(ADD_MONTHS(SYSDATE,6))
FROM DUAL;

-----------------------------------------------
ROUND(날짜, 포맷)   반올림한 날짜 
TRUNC(ROUND(날짜, 포맷), 포맷)   잘라낸 날짜
NEXT_DAY()  다음에 올 요일의 일자

--16일 이상은 반올림 처리해서 12월로 감
SELECT ROUND(TO_DATE('2023/11/16'), 'MONTH')  --TO_DATE 날짜데이터타입으로 바꿔
FROM DUAL;

위의 반대
SELECT TRUNC(TO_DATE('2023/11/16'), 'MONTH')
FROM DUAL;
1일요일 2월요일 3화요일....
SELECT NEXT_DAY(SYSDATE, '토')
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, 7)
FROM DUAL;

-- 주민번호 중간에 하이픈 넣기
SELECT SUBSTR('5602131234567', 1, 6)||'-'||
       SUBSTR('5602131234567'), 4, 4)||'-'||
       SUBSTR('5602131234567'), 0, 4)
    FROM DUAL;

-- 전화번호 


***변환함수 TO_
--문자변환
--TO CHAR(숫자 or 날짜, 포맷)
1. 소수점 자릿수 맞춰서
2. 음수 = <>
3. 양수 음수 표시 + / -

SELECT TO_CHAR(123456789, '999,999,999') FROM DUAL;
--> 자리수 맞춰서 썻을때와 아닐때 차이가 있다.
SELECT TO_CHAR(1234567, '999,999') FROM DUAL;
SELECT TO_CHAR(1234567, '9,999,999') FROM DUAL; -- 자릿수 맞춰서
SELECT TO_CHAR(1234567.67, '9999999.9') FROM DUAL; -- 소수점 자릿수 맞춰서(반올림)
SELECT TO_CHAR(-123, '999PR') FROM DUAL; -- <음수표시>
SELECT TO_CHAR(123, 'RN') FROM DUAL; -- 로마숫자 표시
SELECT TO_CHAR(-123, 'S999') FROM DUAL; -- 양수+ S음수- 표시

SELECT TO_CHAR(123, '00000') FROM DUAL; -- 지정한 길이 만큼 0으로 채우기
SELECT TO_CHAR(123456, 'L999,999') FROM DUAL; --원화 표시 넣기L

-- 날짜 포맷에 맟줘서
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD DAY') FROM DUAL;

SELECT TO_CHAR(SYSDATE-5, 'FMYY/MM/DD DAY') FROM DUAL; -- 날짜 0 없애기
SELECT TO_CHAR(SYSDATE, '""YYYY"년 "MM"월 "DD"일"') FROM DUAL;


--숫자변환
TO NUMBER(문자, 포맷)
-- 문자나 날짜가 포함된 내용을 숫자로 변환하면 오류발생
SELECT TO_NUMBER('123') FROM DUAL;
SELECT TO_NUMBER('ABC') FROM DUAL;  --오류
SELECT TO_NUMBER(SYSDATE) FROM DUAL; --오류

--날짜 변환
TO DATE(문자, 포맷)

SELECT TO_DATE('20140101', 'YY-MM-DD') FROM DUAL;
SELECT TO_DATE('20140101', 'YY MM DD') FROM DUAL;
SELECT TO_DATE('20140101', 'YYYY-MM-DD') FROM DUAL;
SELECT TO_DATE('20140101 13:44:50', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_DATE('2014/01/01 13/44/45', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_DATE('2014-01-01 13/44/45', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_DATE('2014 01 01 13/44/45', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;


NLS (National Language Support, 국가별 언어 지원) 설정 확인
SELECT * FROM NLS_SESSION_PARAMETERS;
--SESSION 설정변경 명령어
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR-MM-DD HH24:MI:SS';


--NULL 함수
-- NULL 값의 처리: NULL 값의 여부에 따라 관련 값이 달라짐
NVL(표현식1, 표현식2)

SELECT NVL(표현식1, 표현식2) 
FROM 테이블
WHERE 조건;

SELECT NVL(manager_id, employee_id) 
FROM employees
WHERE manager_id IS NULL;

SELECT manager_id, NVL(manager_id, employee_id) 
FROM employees;

NVL2(표현식1, 표현식2, 표현식3) : 표현식1이 NULL이 아니면 표현식2를 반환, NULL이면 
                               표현식3을 반환
사원번호, 급여, 급여+보너스, 보너스 조회

--NULL과 수식연산자를 사용해 연산을 하면 결과값은 NULL
SELECT employee_id,
       NVL2(commission_pct, salary+(salary*commission_pct), salary) AS salary2,
       (NVL2(commission_pct, salary+(salary*commission_pct), salary) - salary) AS bonus
FROM employees;


SELECT employee_id, 
       NVL2(commission_pct, salary+(salary*commission_pct), salary) AS salary2
FROM employees;

SELECT employee_id, 
       NVL2(commission_pct, salary+(salary*commission_pct), salary) AS salary2,
       NVL2(commission_pct, salary+(salary*commission_pct), salary) - salary as bonus    
FROM employees;


COALESCE(표현식1, 표현식2,...) : 입력값으로 사용된 표현식들 중 NULL이 아닌 첫번째 표현식을 반환

SELECT (표현식1, 표현식2,...)
FROM 테이블;

SELECT employee_id,
       COALESCE(salary*commission_pct, salary)
FROM employees;

--사원번호, 커미션 비율, 수령급여

SELECT employee_id, commission_pct,
       COALESCE(salary+salary*commission_pct, salary)
FROM employees;


SELECT employee_id, commission_pct,
       COALESCE(salary*commission_pct, salary)
FROM employees
ORDER BY employee_id;

NLNVL(조건식)
목표: 커미션이 0.2미만인 사원을 조회 (0% 인 경우)

SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct < 0.2;

SELECT COUNT(*)
FROM employees
WHERE NVL(commission_pct,0) < 0.2;

SELECT count(*)
FROM employees
WHERE LNNVL(commission_pct >= 0.2);  --????????

NULLIF(표현식1, 표현식2) = NULL 또는 표현식1
SELECT 컬럼
FROM job_history;

[문제] 직무의 시작날짜와 종료날짜의 연도가 같으면 NULL, 
        같지 않으면 종료연도를 출력하는 쿼리를 작성하시오.
날짜 비교 = > 문자데이터 변경 및 연도 추출
SELECT employee_id, 
       TO_CHAR (start_date, 'YYYY') AS start_date,
       TO_CHAR (end_date,'YYYY')AS end_date
    FROM job_history;

---->>> NULLIF(종료년도, 시작년도)

SELECT employee_id, 
       TO_CHAR (start_date, 'YYYY') AS start_year,
       TO_CHAR (end_date,'YYYY')AS end_year,
       NULLIF(TO_CHAR (end_date,'YYYY'), TO_CHAR (start_date, 'YYYY')) nullif_year
FROM job_history;


DESC job_history;

--기타함수

GREATEST(표현식1,expr2...): 가장 큰 값
LEAST(expr1, expr2....): 가장 작은 값

SELECT GREATEST(1, 2, 3, 4, 5),
        LEAST(1, 2, 3, 4, 5)
FROM DUAL;

SELECT GREATEST(1+8, 2, 3, 4, 5),
        LEAST(1, 2, 3, 4, 5)
FROM DUAL;
-- 알파벳 순서대로 뒤의 알파벳이 greatest, 한글도 가능
SELECT GREATEST('apple', 'banana', 'orange', 'mango'),
        LEAST('apple', 'banana', 'orange', 'mango')
FROM DUAL;

SELECT GREATEST('홍길동', '유재석', '이특', '조세호'),
        LEAST('홍길동', '유재석', '이특', '조세호')
FROM DUAL;


DECODE(표현식, 값1, 결과1, 값2, 결과2, ..., 기본값)

SELECT prod_id, channel_id,
       DECODE(channel_id, 3, '이마트', 9, '롯테마트', 5, '트레이디스', 4,
       '티몬', '행사매대')
FROM   sales
WHERE rownum < 10;

--4장 실전문제 1번

내가 푼 것 --1
SELECT LPAD(phone_number, 16, '(02)')
FROM employees;

내가 푼 것 --2 다른 가능성??
SELECT REPLACE(phone_number, '011', '(02)'), 
        REPLACE(phone_number, '650', '(02)')
FROM employees;

풀이
--LPAD(문자열1, 길이, 문자열2)
SELECT phone_number,
       LPAD(SUBSTR(phone_number, 5, 12), 12, '(02)')
FROM employees;

--문자연산자
SELECT phone_number,
       '(02)' || SUBSTR(phone_number, 5, 12)
FROM employees;

--CONCAT (문자, 문자)
SELECT phone_number,
        CONCAT('(02)', SUBSTR(phone_number, 5, 12))
FROM employees;

사원테이블(employees)에는
phone_number라는 컬럼에
사원의 전화번호가 ###.###.#### 형태로 저장
서울 지역번호인 (02)를 붙여 전화번호를 출력

테이블 employees
컬럼  phone_number
조건
기능
문자열 부분
붙여

COMMIT;


--4장 실전문제 2 번
현재일자를 기준으로 사원 테이블의 입사일자를 참조해, 
근속년수가 10년 이상인 사원을 출력 쿼리를 작성, 
근속년수가 높은 사워 순서대로

사원번호 사원명 입사일자 근속년수

오름차순(ASC, ascending order) 1 > 2 > 3 > 4
내림차순(DESC, descending order) 4 > 3 >2 > 1
예)
오름차순 : ORDER BY 기준컬럼 ASC;
내림차순 : ORDER BY 기준컬럼 DESC;

SELECT employee_id, emp_name, hire_date
FROM employees
WHERE employee_id IN (SELECT employee_id FROM job_history)
;

SELECT employee_id, 
       TO_CHAR (start_date, 'YYYY') AS start_year,
       TO_CHAR (end_date,'YYYY')AS end_year
FROM job_history;


풀이방법

1.문제해석
> 정보찾기(동사): 사용할 쿼리문/ 함수확인,
> 정보분리, 사용할 테이블/컬럼/조건확인



현재일자를 기준으로 SYSDATE
사원 테이블employees 의 입사일자hire_date를 참조해,  
근속년수가 10년 이상인 사원을 출력 쿼리를 작성, 
  근속일수: 현재일자(SYSDATE)-시작일자hire_date 365일 = 1년
  365일/365=1년
  500일/365=1.xx년 > 소수점 잘라내기 (FLOOR/TRUNC) / 올림CEIL / 반올림 ROUND
근속년수가 높은 사원 순서대로

테이블: employees
컬럼: 사원번호 사원명 입사일자 근속년수
조건:
함수: 

SELECT 컬럼
FROM 테이블
WHERE 근속년수(SYSDATE - hire_date) >= 10
ORDER BY 기준컬럼 DESC;


SELECT employee_id, emp_name, hire_date, 
        ROUND((SYSDATE - hire_date) / 365)
FROM employees
WHERE ROUND((SYSDATE - hire_date) / 365) >= 10
ORDER BY ROUND((SYSDATE - hire_date) / 365) DESC
;

SELECT employee_id 사원번호, emp_name 사원명, hire_date 입사일자, 
        ROUND((SYSDATE - hire_date) / 365) 근속년수
FROM employees
WHERE ROUND((SYSDATE - hire_date) / 365) >= 10
ORDER BY ROUND((SYSDATE - hire_date) / 365) DESC
;


--4장 3번문제

고객테이블에 고객 전화번호 컬럼. 이 컬럼값은 '###-###-####' 인데
- 대신 / 로 바꾼다 출력쿼리

SELECT cust_main_phone_number, 
       REPLACE(cust_main_phone_number, '-', '/') new_phone_number
FROM customers;

풀이방법

바꿔 > REPLACE (문자열, 대상문자, 바꿀문자)
출력 > SELECT

테이블: customer
컬럼: cust_main_phone_number
함수: REPLACE (문자열, 대상문자, 바꿀문자)

--4장 문제4
고객 테이블(customer)의 고객 전화번호 컬럼(ust_main_phone_number)을 
다른 문자로 대체 일종의 암호화를 해서 쿼리 작성

SELECT cust_main_phone_number, 
       TRANSLATE(cust_main_phone_number, '01234568-', 'iloveyou*') new_phone_number
FROM customers;


풀이방법

대체 암호화 > TRANSLATE
쿼리 > SELECT? UPDATE???


UPDATE 테이블
SET 컬럼1 = 변경값1,
    컬럼2 = 변경값2 
;

UPDATE customers
SET cust_main_phone_number = TRANSLATE(cust_main_phone_number, '01234568-', 'iloveyou*')
;

UPDATE customers
SET cust_main_phone_number = TRANSLATE(cust_main_phone_number, 'iloveyou*', '01234568-')
;

COMMIT;


4장 5번문제

고객테이블 customers에는 고객의 출생년도 cust_year_of_birth 컬럼이 있다
현재일자sysdate 기준으로 이 컬럼을 활용해 30, 40, 50를 구분해 출력 나머지는 기타로 출력

테이블 customers, ABS(SYSDATE - cust_year_of_birth =
조건 NVL2(SYSDATE - cust_year_of_birth

SELECT cust_year_of_birth, ABS(SYSDATE YYYY- cust_year_of_birth)
FROM customers;

SELECT cust_year_of_birth, ROUND(SYSDATE - cust_year_of_birth)
FROM customers;


SELECT cust_year_of_birth
CASE WHEN SYSDATE - cust_year_of_birth >= 30 THEN '30대',
     WHEN SYSDATE - cust_year_of_birth >= 40 THEN '40대',
     WHEN SYSDATE - cust_year_of_birth >= 50 THEN '50대',
     ELSE '기타'
END
FROM customers;



풀이방법

SELECT  TO_CHAR(SYSDATE, 'YYYY') 현재년도, cust_year_of_birth 출생년도,
        TO_CHAR(SYSDATE, 'YYYY')-cust_year_of_birth 나이
FROM customers;

--TRUNC (n, i) 버림

SELECT  TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth), -1) 세대,
        TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10) 세대
FROM customers;

SELECT DECODE(TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10), 30, '30대', 40, '40대', 5, '50대', '기타') generation
FROM customers;

SELECT cust_year_of_birth 출생년도,
    DECODE(TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10), 30, '30대', 40, '40대', 5, '50대', '기타') generation
FROM customers;



--4장 6번 문제 
5문제는 30-50대 까지만 표현했는데, 모든 연령대를 표시하도록 쿼리를 DECODE 대신 CASE 표현식을 쓰자

**CASE 표현식
CASE WHEN 조건1 then 값1
     WHEN 조건2 then 값2
    ELSE   값3

SELECT cust_year_of_birth, 
    CASE WHEN TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth = 30 THEN '30대'
         WHEN TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth = 40 THEN '40대'
         WHEN TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth = 50 THEN '50대'
     ELSE '기타'
END
FROM customers;

SELECT cust_year_of_birth, TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10),
    CASE WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10) = 3 THEN '30대'
         WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10) = 4 THEN '40대'
         WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10) = 5 THEN '50대'
     ELSE '기타'
END
FROM customers;

풀이방법


CASE WHEN 나이의 앞자리가 1이면 then '10대'
     WHEN 나이의 앞자리가 2이면 then '20대'
    ELSE   '50대이상'

나이의 앞자리 => TRUNC( 현재년도 - 출생년도/10)

현재년도
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR (SYSDATE, 'YYYY')FROM DUAL;

출생년도
SELECT cust_year_of_birth FROM customers;
SELECT (TO_CHAR (SYSDATE, 'YYYY')- cust_year_of_birth) FROM customers;
SELECT TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth) / 10) FROM customers;


SELECT cust_year_of_birth,
       CASE WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth)/10)=1 THEN '10대'
            WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth)/10)=2 THEN '20대'
            WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth)/10)=3 THEN '30대'
            WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth)/10)=4 THEN '40대'
 ELSE '50대이상'
END
FROM customers;

SELECT CASE WHEN TRUNC (TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth) BETWEEN 10 AND 19 THEN '10대'
            WHEN TRUNC (TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth) BETWEEN 20 AND 29 THEN '20대'
            WHEN TRUNC (TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth) BETWEEN 30 AND 39 THEN '30대'
            WHEN TRUNC (TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth) BETWEEN 40 AND 49 THEN '40대'
 ELSE '50대이상'
END
FROM customers;


--5장 집계함수
-- COUNT (표현식)
SELECT COUNT(expr)
FROM 테이블명;

SELECT COUNT (*)
FROM employees;

SELECT COUNT (employee_id), COUNT (emp_name), COUNT (department_id)
FROM employees;

DISTINCT : 유일성 여부 확인, 중복제거

SELECT COUNT(DISTINCT department_id), COUNT(DISTINCT employee_id)
FROM employees;

--SUM(expr)
SELECT SUM(salary), SUM(DISTINCT salary) 
FROM employees;

--SUM(표현식)
SELECT SUM(salary)
FROM employees;

-- 표현식 연산자 활용
SELECT SUM(salary), SUM(salary + salary*0.02), SUM(salary)+SUM(salary)*2/100 --가로안, 밖에 계산가능
FROM employees;

-- 집계함수 내 함수 사용
SELECT SUM(salary + salary*0.02),SUM(salary + ROUND(salary*2/100)) --가로안, 밖에 계산가능
FROM employees;

-- MIN(표현식), MAX(표현식)
SELECT MIN(salary)
FROM employees;

SELECT MAX(salary)
FROM employees;

--AVG(expr)
SELECT AVG(salary), AVG(DISTINCT salary)
FROM employees;

-- VARIANCE(expr)
SELECT VARIANCE(salary)
FROM employees;

--STDDEV(expr)
SELECT STDDEV(salary)
FROM employees;

복습하기

SELECT COUNT(cust_year_of_birth), COUNT(DISTINCT cust_year_of_birth)
FROM customers;

SELECT SUM(cust_year_of_birth),  SUM(DISTINCT cust_year_of_birth)
FROM customers;

SELECT AVG(cust_year_of_birth)
FROM customers;

SELECT AVG (ABS (cust_year_of_birth)), 
        AVG (FLOOR (cust_year_of_birth)),
       TRUNC (AVG (cust_year_of_birth)), -- 왜 소수점들이 나오나
       SUBSTR(AVG(cust_year_of_birth), 1, 4)
FROM customers;


SELECT TRUNC (AVG (cust_year_of_birth))
FROM customers;


SELECT  SUBSTR(AVG(cust_year_of_birth), 1, 4)
FROM customers;

SELECT MIN(cust_year_of_birth), MAX(cust_year_of_birth)
FROM customers;


4장 문제 다시풀기
1번
SELECT phone_number, LPAD (SUBSTR(phone_number, 5, 12), 12, '(02)')
FROM employees;

SELECT SUBSTR(phone_number, 5, 12)
FROM employees;

SELECT phone_number, '(02)'||SUBSTR(phone_number, 5, 12)
FROM employees;

SELECT phone_number, CONCAT('(02)', SUBSTR(phone_number, 5, 12))
FROM employees;

2번
현재일자 기준 SYSDATE
사원 테이블의 입사일자 참조해
근속년수가 10년 이상인 사원, 
근속년수가 높은 사원 순서대로 결과

SELECT TO_CHAR(SYSDATE, 'DD/MM/YY')
FROM employees;

SELECT ROUND(SYSDATE - hire_date)
FROM employees;  


SELECT ROUND(SYSDATE - hire_date)/365/10 --어떻게 자동으로 일자 개수로 반환되지??
FROM employees;                     

-- 소수점 처리 어떻게?

SELECT employee_id 사원번호, emp_name 사원명, hire_date 입사일자, 
       ROUND(SYSDATE - hire_date)/365/10 근속년수
FROM employees
--WHERE ROUND(SYSDATE - hire_date)/365/10 >= 10
--ORDER BY ROUND(SYSDATE - hire_date)/365 DESC
;


SELECT employee_id 사원번호, emp_name 사원명, hire_date 입사일자, 
       ROUND((SYSDATE - hire_date)/365) 근속년수 -- 소숫점나오기 때문에 round 뒤에 ()
FROM employees
WHERE ROUND(SYSDATE - hire_date)/365 >= 10
ORDER BY ROUND(SYSDATE - hire_date)/365 DESC
;

-- **GROUB BY 와 HAVING 절

-- ** GROUP BY
-특정 그룹으로 묶어 데이터 집계 시 사용
-WHERE과 ORDER BY절 사이에 위치
-집계함수와 함께 사용
-SELECT 절에서 집계함수를 제외한 모든 컬럼과 표현식은 GROUP by 절에 명시해야 함

SELECT  컬럼1, 컬럼2, 집계함수(표현식)
FROM    테이블
WHERE   조건
GROUP BY 컬럼1, 컬럼2
ORDER BY  컬럼
;

SELECT  department_id, SUM(salary)
FROM    employees
WHERE   department_id = 70
GROUP BY department_id          --GROUB BY 를 써서 중복되는 데이터를 하나로 묶은다 
ORDER BY  department_id
;

<응용>

SELECT  department_id, SUM(salary), COUNT(employee_id)
FROM    employees
--WHERE   department_id = 70
GROUP BY department_id          
ORDER BY  department_id
;

SELECT  department_id, SUM(salary), COUNT(employee_id), AVG(salary)
FROM    employees
--WHERE   salary > 5000
GROUP BY department_id
ORDER BY  department_id
;

SELECT  department_id, SUM(salary), COUNT(employee_id), TRUNC(AVG(salary))
FROM    employees
--WHERE   salary > 5000
GROUP BY department_id
ORDER BY  TRUNC(AVG(salary)) DESC
;

--**SQL 구문순서
--SELECT 컬럼명 5
--FROM 테이블명 1
--WHERE 조건    2
--GROUP BY 그룹조건 3
--HAVING 그룹조건 4
--ORDER BY 6 ;


SELECT SUM(loan_jan_amt)
FROM kor_loan_status;

SELECT period, region, SUM(loan_jan_amt)
FROM kor_loan_status
--WHERE
GROUP BY period, region;
HAVING
ORDER BY

-- 기간별 대출액 합계
SELECT period, SUM(loan_jan_amt)
FROM kor_loan_status
GROUP BY period
ORDER BY period ASC  --DESC
;

-- 한국대출상태 테이블에서 2013년도 기간동안 대출액 합계를 기간순서(오름차순)으로 조회
SELECT period 기간, TRUNC (SUM(loan_jan_amt)) 대출합계
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period
ORDER BY period ASC  --DESC
;

-- 기간별 지역별 대출액 합계 조회
SELECT period, region, (SUM(loan_jan_amt))
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, region
ORDER BY period ASC  --DESC
;

-- 지역별 기간별 대출액 합계 조회
SELECT region, period, (SUM(loan_jan_amt))
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, region --순서상관없다
ORDER BY region
;


SELECT region, TRUNC (SUM(loan_jan_amt))
FROM kor_loan_status
GROUP BY region
ORDER BY SUM(loan_jan_amt) 
;

--**HAVING 절
1.GROUB BY절 바로 다음에 위치
2.SELECT 절에 사용했던 집계함수를 이용해 조건을 명시

SELECT 컬럼1, 컬럼2, 집계함수(표현식)
FROM    테이블
WHERE   조건
GROUP BY    컬럼1, 컬럼2
HAVING 집계함수 그룹조건
ORDER BY    컬럼;

-- 2013년 11월 기간,지역별 총 잔액 조회
SELECT period, region, SUM(loan_jan_amt) -- 오류 단일 그룹의 그룹 함수가 아닙니다
FROM kor_loan_status
WHERE period = '201311'
;

SELECT period, region, SUM(loan_jan_amt)
FROM kor_loan_status
WHERE period = '201311' AND SUM(loan_jan_amt) > 10000 --오류: 그룹 함수는 허가되지 않습니다
GROUP BY period, region
ORDER BY region
;

-- 2013년 11월 기간별/지역별 총 잔액이 (100억 초과) 내용 조회
SELECT period, region, SUM(loan_jan_amt)
FROM kor_loan_status
WHERE period = '201311' 
GROUP BY period, region
HAVING SUM(loan_jan_amt) > 10000
ORDER BY region
;

-- ROLLUP 절
SELECT 컬럼1, 컬럼2, 집계함수(표현식)
FROM  테이블
WHERE   조건
GROUP BY 컬럼1, 컬럼2
ORDER BY 컬럼
;

SELECT  period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY ROLLUP(period, gubun) -- 구분에 의해서????????
;

--표현식 2 개 - 2+ 1 레밸
SELECT  period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY ROLLUP(gubun, period)
;

-- 표현식 1개 > 1+1 레밸
SELECT  period, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY ROLLUP(period)
;

-- 표현식 3개 > 3+1 레밸
SELECT  period, gubun, region, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY ROLLUP(gubun, period, region)
;


SELECT  컬럼1, 컬럼2, 집계함수(표현식)
FROM    테이블
WHERE   조건
GROUP BY ROLLUP(표현식1, 표현식2)
;

--분할(partial) ROLLUP
ROLLIP만 사용한 형태: 2+1 레밸
(표현식2, 표현식3)
(표현식2)
(전체)
SELECT  컬럼1, 컬럼2, 집계함수(표현식)
FROM    테이블
WHERE   조건
GROUP BY 표현식1, ROLLUP(표현식1, 표현식2)
;
------------------------------------------
ROLLIP만 사용한 형태: 1+1 레밸
(표현식1, 표현식2)
(표현식1)
;

SELECT  gubun, period, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY gubun, ROLLUP(period)
;

-- CUBE

SELECT  컬럼
FROM    테이블
WHERE   조건
GROUP BY 그룹컬럼
;

표현식1개일때 but cube가 안쓰였을때,
SELECT  gubun
FROM    kor_loan_status
WHERE   gubun = '기타대출'
GROUP BY gubun
;

SELECT  gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   gubun = '기타대출'
GROUP BY gubun
;

표현식1개일때 with CUBE

SELECT  gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   gubun = '기타대출'
GROUP BY CUBE(gubun)
;

--표현식2개일때 wth CUBE - cube에 period를 먼저쓸때,
SELECT  period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   gubun = '기타대출'
GROUP BY CUBE(period, gubun)
;

--- cube에 gubun을 먼저쓸때,
SELECT  period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   gubun = '기타대출'
GROUP BY CUBE(gubun, period)
;
-->>> 순서를 다르게 해도 데이터 내용에 차이가 없고 같다 

SELECT  period, gubun, region, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   gubun = '기타대출'
GROUP BY CUBE(gubun, period, region)
;

--집합연산자
--수출 품목에 대한 테이블 생성
CREATE TABLE exp_goods(
        Country VARCHAR2(10),
        seq     NUMBER,
        Goods   VARCHAR2(80)
    );
    
INSERT INTO exp_goods VALUES ('일본', 1, '자동차');
INSERT INTO exp_goods VALUES ('일본', 2, '자동차부품');
INSERT INTO exp_goods VALUES ('일본', 3, '전자직접회로');
INSERT INTO exp_goods VALUES ('일본', 4, '선박');
INSERT INTO exp_goods VALUES ('일본', 5, '반도체웨이퍼');
INSERT INTO exp_goods VALUES ('일본', 6, '화물차');
INSERT INTO exp_goods VALUES ('일본', 7, '원유제외 석유류');
INSERT INTO exp_goods VALUES ('일본', 8, '건설기계');
INSERT INTO exp_goods VALUES ('일본', 9, '다이오드, 트래지스터');
INSERT INTO exp_goods VALUES ('일본', 10, '기계류');

COMMIT;

--수출품 테이블에서 국가가 한국인 상품을 모두 조회
--(단, 품목 번호 순서대로 조회할 것, 오름차순)

SELECT *
FROM exp_goods
WHERE country = '한국'
ORDER BY seq ASC;

SELECT goods
FROM exp_goods
WHERE country = '한국'
UNION
SELECT goods
FROM exp_goods
WHERE country = '일본'
ORDER BY 1;

SELECT goods
FROM exp_goods
WHERE country = '한국'
UNION ALL
SELECT goods
FROM exp_goods
WHERE country = '일본'
ORDER BY 1;


--한국만 수출하는 품목
SELECT goods
FROM exp_goods
WHERE country = '한국'
MINUS
SELECT goods
FROM exp_goods
WHERE country = '일본'
ORDER BY 1;

--일본만 수출하는 품목
SELECT goods
FROM exp_goods
WHERE country = '일본'
MINUS
SELECT goods
FROM exp_goods
WHERE country = '한국'
ORDER BY 1
;

<주의사항>
1 SELECT 리스트의 개수 및 데이터타입일치
2 ORDER BY 절은 마지막 SELECT 문에서만 사용 가능

SELECT  칼럼1, 컬럼2 
FROM    테이블
WHERE   조건

UNION

SELECT  칼럼1, 컬럼2
FROM    테이블
ORDER BY 컬럼
;
--UNION 
--UNION ALL

--INTERSECT
교집합 개념
두 개 이상의 개별 select 쿼리를 연결
개별 select 쿼리 반환 결과 중 중복된 것을 제외한 선행 쿼리 결과 추출

---MIUNS
차집합
두 개 이상의 개별 select 쿼리를 연결
개별 select 쿼리 반환 결과 중 중복된 것을 제외한 선행 쿼리 결과 추출

--집합 연산자 제한사항
--개별 select 쿼리의 select리스트 개수와 데이터 타입이 일치해야함
order by절은 맨 마지막 개별 select 쿼리에
BLOB, CLOB, BFILE 같은 LOB 타입 컬럼은 집합
union, intersect, minus 연산자는 long


SELECT  칼럼1, 컬럼2 --select 절의 컬럼의 개수와 타입이 일치 1제한사항
FROM    테이블
WHERE   조건
GROUP BY 그룹컬럼
HAVING   그룹조건
--ORDER BY 중간에 쓰지 않고 마지막에 쓴다 2제한사항
집합연산자
SELECT  칼럼1, 컬럼2
FROM    테이블
ORDER BY 컬럼
;

--5장 1번문제 - OK

사원테이블에서 입사년도별 사원 수를 구하는 쿼리를 작성

사원테이블 employees
입사년도 hire_date
사원 수 년도마다 총 몇명??
--내가 푼 것
SELECT TO_CHAR(hire_date, 'YYYY'), COUNT(employee_id)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

--<풀이방법>
1.문제해석
>정보 분리, 사용할 테이블/컬럼/조건확인
>정보 찾기(동사): 사용할 쿼리문/함수확인
2. 쿼리문 (테이블, CRUD) 및 쿼리문 작성
3. 문제 해석 내용을 데이터베이스 문법에 맞게 적용
4. 앞서 작성한 쿼리문 구문에 맞게 대입
5. 결과 테스트
6. 오류 발생시 내용확인(오류발생행렬관련)
7. 결과 재 테스트

SELECT  컬럼
FROM    테이블
WHERE   조건
GROUP BY 그룹컬럼
HAVING  그룹조건
ORDER BY 컬럼
;

사원테이블에서
입시년도별 > 포맷을 변경 TO_CHAR(값, 포맷)
사원수를 구하는 > COUNT(컬럼)

테이블: employees
컬럼: hire_date
함수(집계): TO_CHAR(값, 포맷), COUNT(칼럼)


--5장 2번문제 --OK
kor_loan_status 테이블에서 2012년도 월별, 지역별 대출 총 잔액을 구하는
쿼리는 작성하자
--나의 풀이
테이블 kor_loan_status
컬럼: 2012년도 월별 MM, 지역, 대출 총 잔액
함수: SUM
조건: 2012

SELECT period, region, SUM(loan_jan_amt)
FROM kor_loan_status
WHERE period LIKE '2012%'
GROUP BY period, region
ORDER BY 1
;

--5장 3번문제
아래 쿼리를 rollup을 사용하지않고, 집합 연산자로 동일한 결과가 
나오도록 쿼리를 작성해라


--시도1
SELECT period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY  GROUPING SETS(period, gubun);


--시도 2
SELECT period, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY period, gubun
UNION ALL
SELECT  gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY period, gubun
;

--시도 3 - 어떻게 각 기간의 총합계를 구할까??
SELECT  period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY period, gubun
UNION
SELECT  period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY period, gubun
;

<풀이방법>

--레밸별 데이터 결과
1. (기간, 구분)에 따른 대출총액
2.(기간)에 따른 대출총액

집합연산자를 사용해서 > 4가지: UNION, UNION ALL, INTERSECT, MINUS
동일한 결과가 나오도록 > SELECT 

SELECT  period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY period, gubun
UNION
SELECT  period, '', SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY period        ---gubun 을 빼고 써준다????
;

--> NULL쓰는 방법 > NULL 또는 ''

--놓친부분
--1. NULL 값을 select문에 넣어야하고, 그룹바이에 period 만 넣어준다




--5장 4번문제

SELECT period,
    CASE WHEN gubun = '주택담보대출' THEN SUM(loan_jan_amt) 
    ELSE 0 END 주택담보대출액,
    CASE WHEN gubun = '기타대출' THEN SUM(loan_jan_amt) 
    ELSE 0 END  기타대출액
FROM kor_loan_status
WHERE period = '201311'
GROUP BY period, gubun;

위의 결과를 집합연산자로 동일한 결과를 추출하는 쿼리를 작성하자

--내가 풀이

--2013년 11월 기타대출액 총 합계 + 주택담보대출액

SELECT period, 0 주택담보대출액, SUM(loan_jan_amt) 기타대출액
FROM kor_loan_status
WHERE period = '201311'
    AND gubun = '기타대출'
GROUP BY period

UNION

SELECT period, SUM(loan_jan_amt) 주택담보대출액, 0 기타대출액
FROM kor_loan_status
WHERE period = '201311'
    AND gubun = '주택담보대출'
GROUP BY period
;
--컬럼에 어떻게 널 값을 넣지??? >> 0 주택담보대출액
-- 값이 null이 아니라 0


--5장 문제 5번

SELECT region, SUM(loan_jan_amt) "201111", 
        0 "201112", 0 "201210", 0 "201212", 0 "201310", 0 "201311"
FROM kor_loan_status
WHERE period = '201111'
GROUP BY region
;

SELECT region 지역, 
    CASE WHEN period = '201111' THEN SUM(loan_jan_amt) ELSE 0  END "201111",
    CASE WHEN period = '201112' THEN SUM(loan_jan_amt) ELSE 0  END "201112"
  FROM kor_loan_status
WHERE period = '201111' 
GROUP BY region, period
ORDER BY 1
;


<문제풀이>

테이블 kor_loan_status
컬럼 region, 컬럼"201111", 201112, 201210,
조건
함수: SUM(loan_jan_amt)


--<1방법> SUM 과 CASE 의 중첩 
SELECT region 지역, SUM(CASE WHEN period = '201111' THEN loan_jan_amt ELSE 0 END)"201111",
               SUM(CASE WHEN period = '201112' THEN loan_jan_amt ELSE 0 END)"201112",
               SUM(CASE WHEN period = '201210' THEN loan_jan_amt ELSE 0 END)"201210",
               SUM(CASE WHEN period = '201211' THEN loan_jan_amt ELSE 0 END)"201211",
               SUM(CASE WHEN period = '201212' THEN loan_jan_amt ELSE 0 END)"201212",
               SUM(CASE WHEN period = '201310' THEN loan_jan_amt ELSE 0 END)"201310",
               SUM(CASE WHEN period = '201311' THEN loan_jan_amt ELSE 0 END)"201311"
FROM kor_loan_status
GROUP BY region
ORDER BY 1;


--SELECT region 지역, CASE WHEN period = '201111' THEN SUM(loan_jan_amt) ELSE 0 END "201111",
--               CASE WHEN period = '201112' THEN SUM(loan_jan_amt) ELSE 0 END"201112",
--               CASE WHEN period = '201210' THEN SUM(loan_jan_amt) ELSE 0 END"201210",
--               CASE WHEN period = '201211' THEN SUM(loan_jan_amt) ELSE 0 END"201211",
--               CASE WHEN period = '201212' THEN SUM(loan_jan_amt) ELSE 0 END"201212",
--               CASE WHEN period = '201310' THEN SUM(loan_jan_amt) ELSE 0 END"201310",
--               CASE WHEN period = '201311' THEN SUM(loan_jan_amt) ELSE 0 END"201311"
--FROM kor_loan_status
--GROUP BY region, loan_jan_amt
--ORDER BY 1;

--내가 놓친 것, case문을 썻지만 sum을 앞으로 빼주진 못했다

--<2방법> SELECT 중첩/활용
SELECT region, CASE WHEN period = '201111' THEN loan_jan_amt ELSE 0 END y1,
               CASE WHEN period = '201112' THEN loan_jan_amt ELSE 0 END y2,
               CASE WHEN period = '201210' THEN loan_jan_amt ELSE 0 END y3,
               CASE WHEN period = '201211' THEN loan_jan_amt ELSE 0 END y4,
               CASE WHEN period = '201212' THEN loan_jan_amt ELSE 0 END y5,
               CASE WHEN period = '201310' THEN loan_jan_amt ELSE 0 END y6,
               CASE WHEN period = '201311' THEN loan_jan_amt ELSE 0 END y7
FROM kor_loan_status;

SELECT region,
      SUM(y1) "201111", SUM(y2) "201112", SUM(y3) "201210",
         SUM(y4) "201211", SUM(y5) "201212", SUM(y6) "201310", SUM(y7) "201311"
         
FROM (SELECT region, CASE WHEN period = '201111' THEN loan_jan_amt ELSE 0 END y1,
               CASE WHEN period = '201112' THEN loan_jan_amt ELSE 0 END y2,
               CASE WHEN period = '201210' THEN loan_jan_amt ELSE 0 END y3,
               CASE WHEN period = '201211' THEN loan_jan_amt ELSE 0 END y4,
               CASE WHEN period = '201212' THEN loan_jan_amt ELSE 0 END y5,
               CASE WHEN period = '201310' THEN loan_jan_amt ELSE 0 END y6,
               CASE WHEN period = '201311' THEN loan_jan_amt ELSE 0 END y7
        FROM kor_loan_status)
GROUP BY region;

COMMIT;

--6장
*****SQL(DML) 매우중요
CRUD: 소프트웨어가 가지는 기본적인 데이터를 처리 기능 <프로젝트에서 많이 사용될 예정...>
Create(생성) Read(읽기) Update(수정) Delete (삭제)

Create(생성) > INSERT
Read(읽기)  > SELECT
Update(수정) > UPDATE
Delete (삭제) > DELETE

*****조인: 테이블간의 관계를 맺는 방법

1.내부조인

1)동등조인
- 가장 기본적이고 일반적인 조인방법
- where 절에서 등호= 연산자를 사용해 2개이상의 테이블이나 뷰를 연결한 조인 > 조인조건
- 컬럼 단위(기준으)로 조인조건 기술
- SELECT *
  FROM TAB1 a, TAB2 b
  WHERE a.col1 = b.col1
  
SELECT  T1.컬럼, T2.컬럼 
FROM    테이블1 T1, 테이블2 T2
WHERE   T1.컬럼명 = T2.컬럼명 (같은이름을 가지고 있는 컬럼명) --조인조건
;
  
SELECT  *
FROM    employees T1, departments T2
WHERE   T1.manager_id = T2.manager_id 
;
 
SELECT  T1.employee_id
FROM    employees T1, departments T2
WHERE   T1.manager_id = T2.manager_id 
; 
--부서번호를 기준으로 2개의 테이블을 동등 조인하고. 
--사원테이블, 사원이름, 부서번호를 부서테이블의 부서이름 컬럼을 조회
SELECT  a.employee_id, a.emp_name, a.department_id, b.department_id
FROM    employees a, departments b
WHERE   a.department_id = b.department_id --조인조건
; 

2)세미조인: 서브쿼리에서 존재하는 데이터만 메인쿼리에서 추출
EXISTS 연산자
: 조건에 만족하는 데이터가 하나라도 있으면 결과 반환

SELECT  컬럼
FROM    테이블1    
WHERE   EXISTS( SELECT  컬럼
                FROM    테이블2
                WHERE   조인조건 테이블1.컬럼 = 테이블2.컬럼
);

--부서번호, 부서이름 조회

SELECT  d.department_id, department_name
FROM   departments d 
WHERE   EXISTS( SELECT  *
                FROM    employees e
                WHERE   d.department_id = e.department_id
);


--IN 연산자: 조인조건이 없다, 일반적인 쿼리의 형태 문장
: OR 논리연산자를 사용한 형태와 같다.
특징
1. where 절에 조인조건이 없다
2. IN 절에 서브쿼리 컬럼과 메인쿼리 조건절에 명시된 컬럼이 같다/ 메인쿼리 where절과 = 서브쿼리의 select
3. 메인쿼리 select 에 별칭이 없다, 이미 서브쿼리에서 값을 줬기 때문에

SELECT
FROM
WHERE   컬럼 IN ( SELECT 컬럼
                  FROM  테이블
                  WHERE 조건
                  );

SELECT  *
FROM    employees e
WHERE   d.manager_id = e.manager_id --오류
;

사원테이블에서 급여가 3000만원 이상인 사원의 부서번호를 조회해
부서테이블의 부서번호에 내용이 포함되어 있으면 부서번호와 부서이름을 추출해 쿼리를 작성

SELECT  department_id, department_name      --별칭필요 없다
FROM    departments d 
WHERE   d.department_id IN ( SELECT e.department_id   -- 같은 컬럼에서 비교해야한다
                            FROM  employees e 
                            WHERE e.salary > 13000
                  );
--조인하는이유?? 다른테이블에 정보가 있기 때문에~


SELECT  *
FROM    employees e
WHERE   e.salary > 13000
;



서브쿼리 : 팀장이 없는 부서 번호 조회
SELECT department_id
FROM departments
WHERE manager_id is null;

메인쿼리 (동등 조인): 사원테이블과 부서테이블에서 (
팀장이 없는 부서번호를 조회해 메인쿼리의 내용과 일치하면)사원번호,이름,번호 및 부서명을 조회

SELECT e.employee_id, e.emp_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE e.department_id = d.department_id;

SELECT e.employee_id, e.emp_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE e.department_id = d.department_id
    AND e.department_id IN (SELECT d.department_id
                        FROM departments d
                        WHERE d.manager_id is null)
;

--안티조인: 세미조인(EXISTS, IN)과 반대개념, 앞에 NOT을 붙여 사용한다
--NOT IN

SELECT e.employee_id, e.emp_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE e.department_id = d.department_id
    AND e.department_id NOT IN (SELECT d.department_id
                        FROM departments d
                        WHERE d.manager_id is null)
;

--NOT EXISTS

서브쿼리
SELECT  *
FROM    departments
WHERE   manager_id is null
;

메인쿼리
팀장이 없는 부서에 존재하지 않는 데이터에서 사원 정보를 조회

SELECT  employee_id, emp_name, department_id
FROM    employees e
WHERE   NOT EXISTS (SELECT  *
                FROM    departments d
                WHERE   manager_id is null
            AND e.department_id = d.department_id)
;

--셀프조인
사용예시

SELECT  employee_id, emp_name, manager_id
FROM    employees
WHERE   salary > 9000 and salary < 11000
;

SELECT
FROM    employees e1, employees e2
WHERE   el.manager_id = e2.employee_id
;

2.외부조인
-일반조인을 확장한 개념
- 조인조건에 만족하는 데이터 뿐만 아니라, 어느 한 쪽 테이블에 조인 조건에 명시된
컬럼값이 없거나(null) 해당 로우가 아예 없더라도 데이터를 모두 추출1
- 조인조건에서 데이터가 없는 쪽 테이블 컬럼 끝에 (+)를 붙인다
- 조인조건이 여러개일 경우 모든 조인조건에 (+)를 붙여야한다


<일반조인>
동등조인: 기준컬럼의 값이 동일하고 널 값이 미포함
SELECT  d.department_id, d.department_name, j.job_id, j.department_id
FROM    departments d, job_history j
WHERE   d.department_id = j.department_id
;
<외부조인>
특징: 
-기준컬럼의 값이 동일하지(해당되는 null값 때문에) 않고 널 값이 포함
- 외부조인할 때 조인조건 2개 이상인 경우, 모든 조인 조건에 (+) 표시를 할 것
null로 처리한 값도 포함시켜 보여주기 때문에~
- (+) 연산자가 붙은 조건과 OR 와 IN 연산자를 같이 사용 불가
- 한번에 한 테이블에만 외부조인 가능

SELECT  d.department_id, d.department_name, j.job_id, j.department_id
FROM    departments d, job_history j
WHERE   d.department_id = j.department_id(+)
;

기준컬럼이 아닌 컬럼에 (+) 표시, 즉 널 값이 포함됨
SELECT  e.department_id, e.emp_name, j.job_id, j.department_id
FROM    employees e, job_history j
WHERE   e.employee_id = j.employee_id(+)
;


SELECT  e.department_id, e.emp_name, j.job_id, j.department_id
FROM    employees e, job_history j
WHERE   e.employee_id = j.employee_id(+)  -- 밑의 조건으로 (+)의미가 없다
    and e.department_id = j.department_id
;

외부조인할 때 조인조건 2개 이상인 경우, 모든 조인 조건에 (+) 표시를 할 것
null로 처리한 값도 포함시켜 보여주기 때문에~

SELECT  e.department_id, e.emp_name, j.job_id, j.department_id
FROM    employees e, job_history j
WHERE   e.employee_id = j.employee_id(+) 
    and e.department_id = j.department_id(+) 
;

(+) 연산자가 붙은 조건과 OR 와 IN 연산자를 같이 사용 불가
--포괄 조인 운영 (+)는 OR 또는 IN의 연산수를 허용하지 않습니다
SELECT  e.department_id, e.emp_name, j.job_id, j.department_id
FROM    employees e, job_history j
WHERE   e.employee_id = j.employee_id(+) 
    or e.department_id = j.department_id(+) 
;


3.ANSI 조인
<오라클 조인 : 동등조인 >
SELECT  T1.컬럼, T2컬럼
FROM    테이블 T1, 테이블 T2
WHERE   T1컬럼 = T2컬럼
;

<ANSI 조인>
SELECT  T1.컬럼, T2컬럼
FROM    테이블 T1
INNER JOIN 테이블2 T2
ON  T1컬럼 = T2컬럼
WHERE 조건 
;

<ANSI 조인>
SELECT  e.employee_id, d.department_name, e.hire_date
FROM    employees e
INNER JOIN  departments d
ON  e.department_id = d.department_id
WHERE    e.hire_date >= TO_DATE('2003-01-01') -- 문자열에서 날짜타입으로 변환
ORDER BY 3;

<오라클 조인 : 동등조인 >
SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
;


ANSI 외부조인
<오라클 조인: 외부조인>
SELECT  a.컬럼1, a컬럼2, b.컬럼.1, b.컬럼2
FROM    테이블 a, 테이블 b
WHERE   a.컬럼1 = b.컬럼
;

<ASNI 외부조인>
SELECT  a.컬럼1, a컬럼2, b.컬럼.1, b.컬럼2
FROM    테이블 a
LEFT (RIGHT) [OUTER] JOIN 테이블 b
ON (a.컬럼1 = b.컬럼)
WHERE...
;

--(+)와 의미는 같지만, (+) 널 값의 방향과는 반대된다
SELECT  a.emp_name, b.job_id
FROM    employees a LEFT OUTER JOIN job_history b  
-- LEFT OUTER JOIN 왼쪽에 있는 테이블 employees을 기준으로 삼는다, RIGHT 일 경우 job_history테이블 
--그러므로 왼쪽테이블을 다 쓰면 오른쪽은 null값이 나올 수 있다
ON (a.employee_id = b.employee_id)
;

SELECT  a.emp_name, b.job_id
FROM    employees a 
RIGHT OUTER JOIN job_history b  
ON a.employee_id = b.employee_id
 AND a.department_id = b.department_id
 ;

--ANSI CROSS 조인
<오라클 조인: 카타시안 조인>
SELECT  a.employee_id, a.emp_name, b.department_id, b.department_name
FROM    employees a, departments b;

<ANSI CROSS 조인>
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM    employees a
CROSS JOIN  departments b;


ANSI FULL OUTER 조인

DROP TABLE ex4_1;

CREATE TABLE dep4_1(
        dep_id      VARCHAR(10),
        dep_name    VARCHAR(20),
        manager_id VARCHAR(10)
);

INSERT INTO emp4_1 VALUES('100', '유재석', '10');
INSERT INTO emp4_1 VALUES('101', '강호동', '20');
INSERT INTO emp4_1 VALUES('102', '김구라', '50');
INSERT INTO emp4_1 VALUES('103', '김희철', '30');
INSERT INTO emp4_1 VALUES('105', '이경규', '50');
INSERT INTO emp4_1 VALUES('106', '박나래', '60');

DELETE dep4_1 
WHERE dep_id >= 100 and dep_id <= 106;

CREATE TABLE emp4_1(
        emp_id      VARCHAR(10),
        emp_name    VARCHAR(20),
        department_id VARCHAR(10)
);

ALTER TABLE emp4_1 RENAME COLUMN department_id to dep_id;
--기본
SELECT  e.emp_name, d.dep_id
FROM    emp4_1 e, dep4_1 d
WHERE   e.dep_id = d.dep_id;

SELECT  e.emp_name, d.dep_id
FROM    emp4_1 e
FULL OUTER JOIN dep4_1 d
ON  e.dep_id = d.dep_id;

COMMIT;



4. 서브쿼리: SQL 문장 내 보조로 사용되는 다른 SELECT 문

-메인쿼리 연관성에 따라: 조인조건 유무

SELECT절 > 서브쿼리
FROM절   > 인라인뷰
WHERE절  > 중첩쿼리

<서브쿼리>
SELECT  AVG(salary)
FROM    employees
--WHERE   조건
;

1) 연관성없는 서브쿼리
<메인쿼리>: 내 급여가 평균 아래인지 위인지
총 사원수(107) 평균 더 많이 (51명)
SELECT  count(*)
FROM    employees
WHERE   salary >= (SELECT  AVG(salary) FROM    employees)
;


<서브쿼리>: 상급부서가 없는 부서번호 조회

SELECT  department_id
FROM    departments
WHERE   parent_id is null
;


<메인쿼리>: 상급부서가 없는  부서의 개수 조회

SELECT COUNT(*)
FROM    departments
WHERE   department_id NOT IN (SELECT  department_id
                            FROM    departments 
                            WHERE   parent_id is null)
;

<서브쿼리>: 경력테이블로부터 사원번호와 직업번호 조회
SELECT  employee_id, job_id
FROM    job_history;


<메인쿼리>: 사원테이블에서 사원이름과 매칭, 사원번호와 직업번호도 조회
--동시에 2개의 컬럼 값이 동일할 경우
SELECT  emp_name, employee_id, job_id
FROM    employees
WHERE   (employee_id, job_id) IN (SELECT  employee_id, job_id
                                   FROM    job_history)
;
1개의 컬럼 값이 동일할 경우
SELECT  emp_name, employee_id, job_id
FROM    employees
WHERE   employee_id IN (SELECT  employee_id
                                   FROM    job_history)
;

COMMIT;

사원테이블의 급여를 전직원 동일하게 평균급여로 변경
UPDATE  employees
SET    salary = (SELECT AVG(salary) FROM employees) --가로넣기
;

평균급여보다 많이 받는 사람 삭제

SELECT COUNT(*) FROM employees;


DELETE  employees
WHERE   salary > (SELECT AVG(salary) FROM employees)
;

ROLLBACK;

2) 연관성 있는 서브쿼리

<서브쿼리>: 경력테이블에서 부서번호 조회

SELECT  department_id
FROM    job_history;


<메인쿼리>: 경력테이블에서 조회된 부서번호를 부서명과 함께 조회
SELECT  department_id, department_name
FROM    departments d
WHERE   EXISTS (SELECT department_id
                FROM    job_history j
                WHERE d.department_id = j.department_id);



<서브쿼리1> 사원테이블에서 사원명 조회 107건
SELECT  emp_name
FROM    employees;
WHERE   

<서브쿼리2>  부서명 조회 27건
SELECT  department_name
FROM    departments;
WHERE

<메인쿼리>  사원번호, 사원명, 부서번호, 부서명
SELECT  employee_id,
        (SELECT  e.emp_name 
         FROM employees e
         WHERE  e.employee_id = j.employee_id ) emp_name, --가로안에 (서브쿼리,조인조건)별칭
        department_id,
        (SELECT  d.department_name 
         FROM departments d
         WHERE d.department_id = j.department_id)department_id
FROM    job_history j;


<서브쿼리1> 사원테이블에서 평균급여조회

SELECT AVG(salary)
FROM employees;

<서브쿼리2> 평균급여 보다 높은급여를 받는 사원의 부서번호 조회
    
SELECT  department_id
FROM    employees
WHERE   salary > (SELECT AVG(salary) FROM employees)
--GROUP BY department_id
;

<메인쿼리> 평균급여 보다 높은급여를 받는 사원의 부서번호와 매칭되는 부서명 조회

SELECT  d.department_name, d.department_name
FROM    departments d
WHERE    EXISTS (SELECT  department_id
                FROM    employees e
                WHERE   e.department_id = d.department_id
                   AND e.salary > (SELECT AVG(salary) FROM employees))
                                   
;

<서브쿼리1> 부서테이블에서 상위부서(번호)가 90번인 부서번호 조회
SELECT  department_id
FROM    departments
WHERE   parent_id = 90;

<서브쿼리2> 사원테이블에서 상위부서(번호)가 90번인 부서번호, 평균급여 조회

SELECT  e.department_id, AVG(e.salary)
FROM    employees e, 
        departments d
WHERE   d.parent_id = 90
    AND  e.department_id = d.department_id 
GROUP BY   e.department_id
;

<서브쿼리3> (사원테이블에서 상위부서(번호)가 90번인 부서번호, 평균급여)에서 평균급여만 추출

SELECT  avg_sal
FROM    (SELECT  e.department_id, AVG(e.salary) avg_sal -- 별칭
            FROM    employees e, departments d
         WHERE   d.parent_id = 90
         AND  e.department_id = d.department_id 
        GROUP BY   e.department_id)
--WHERE
;
 <메인쿼리> 상위부서가 90번(기획부)인 모든 사원의 급여를 자신의 부서별 평균급여로 갱신
 
 UPDATE employees
 SET    salary = 부서별 평균급여
 WHERE  department_id IN (SELECT  department_id
                          FROM    departments
                          WHERE   parent_id = 90)
 ;
 
-- 서브쿼리 넣기 198p
 UPDATE employees e1
 SET    e1.salary = (SELECT  avg_sal
                     FROM      (SELECT  e.department_id, AVG(e.salary) avg_sal -- 별칭
                                FROM    employees e, departments d
                                WHERE   d.parent_id = 90
                                  AND  e.department_id = d.department_id 
                              GROUP BY   e.department_id) x1
                    WHERE e1.컬럼 = x1.컬럼 조인 조건         ) 
 WHERE  department_id IN (SELECT  department_id
                          FROM    departments
                          WHERE   parent_id = 90)
 ;
 COMMIT;
 
 -- WHERE 조인조건 넣기
 UPDATE employees e1
 SET    e1.salary = (SELECT  avg_sal
                     FROM      (SELECT  e.department_id, AVG(e.salary) avg_sal -- 별칭
                                FROM    employees e, departments d
                                WHERE   d.parent_id = 90
                                  AND  e.department_id = d.department_id 
                              GROUP BY   e.department_id) x1
                    WHERE e1.department_id = x1.department_id        ) 
 WHERE  department_id IN (SELECT  department_id
                          FROM    departments
                          WHERE   parent_id = 90)
 ;
 
ROLLBACK;

UPDATE  사원테이블 e1
SET     e1.급여 = (부서별 평균급여(서브쿼리))
WHERE   e1.부서번호 IN (상위부서가 기획부인 부서 (서브쿼리))
;


--인라인뷰: FROM 절에 서브쿼리가 사용된 경우

<서브쿼리1> 판매월, 평균판매금액 조회 >> 월평균판매액
조건1 2000년 1월~ 2000년 12월까지 판매된
조건2 이탈리아에서 판매된

SELECT  sales_month, ROUND (AVG(amount_sold)) month_avg
FROM    sales s, countries t, customers c
WHERE   sales_month BETWEEN '200001' AND '200012'
    AND country_name = 'Italy'
    AND s.cust_id = c.cust_id 
    AND t.country_id = c.country_id 
GROUP BY sales_month
;

문제> sales 와 countries 테이블에서 조인할 수있는 공통된 컬럼이 없다!
풀이> 다른테이블을 조인을 위한 연결고리로 만든다



<서브쿼리2> 판매테이블로부터 평균판매금액만 조회 >> 년평균판매액
조건1 2000년 1월~ 2000년 12월까지 판매된, 
조건2 이탈리아에서 판매된


SELECT  ROUND (AVG(s.amount_sold)) year_avg
FROM    sales s, countries t, customers c
WHERE   sales_month BETWEEN '200001' AND '200012'
    AND country_name = 'Italy'
    AND s.cust_id = c.cust_id 
    AND t.country_id = c.country_id 
;

--<메인쿼리> 2000년 이탈리아 평균 매출액(연평균)보다 큰 매출액을 달성한 월 평균 매출액을 조회
--
--SELECT  판매월, 평균판매액
--FROM    테이블
--WHERE   월평균판매액 > 연평균판매액

--SELECT  a.sales_month, a.month_avg 이렇게 써도 된다
SELECT  a.*
FROM    (SELECT  sales_month, ROUND (AVG(amount_sold)) month_avg
                FROM    sales s, countries t, customers c
                WHERE   sales_month BETWEEN '200001' AND '200012'
                    AND country_name = 'Italy'
                    AND s.cust_id = c.cust_id 
                    AND t.country_id = c.country_id 
                    GROUP BY sales_month
                    ) a,
                     (SELECT  ROUND (AVG(s.amount_sold)) year_avg
                       FROM    sales s, countries t, customers c
                        WHERE   sales_month BETWEEN '200001' AND '200012'
                         AND country_name = 'Italy'
                         AND s.cust_id = c.cust_id 
                         AND t.country_id = c.country_id ) b
WHERE   a.month_avg > b.year_avg
;

COMMIT;



6장 1번: 조인조건을 잘 쓰자, 부서명이 많은데 왜 한개만 써야하지?

SELECT e.employee_id, e.emp_name, js.job_title, j.start_date, j.end_date, d.department_name
FROM employees e, job_history j, departments d, jobs js
WHERE e.employee_id = 101
    AND e.department_id = d.department_id
    AND e.employee_id = j.employee_id
--    AND js.job_id = j.job_id
 ;

  
6장 2번
SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM employees a, 
     job_history b
WHERE a.employee_id = b.employee_id(+) -- (+)외부조인은 한 쪽으로만
 AND a.department_id(+) = b.department_id;

=> 두 개의 테이블을 outer-join 할 수 없습니다

SELECT  department_id
FROM    employees
GROUP BY    department_id
ORDER BY    department_id;

SELECT  department_id
FROM   job_history
GROUP BY    department_id
ORDER BY    department_id;
-- employees 테이블에 값이 더 나와서 기준컬럼으로 준다. 
--외부조인은 값이 적은 job_histroy 에 준다


6장 3번
외부조인을 할 때(+)연산자를 같이 사용할 수 없는데
IN절에 사용하는 값이 한 개이면 사용할 수 있다. 그 이유는?
--IN 연산자에 대한 개념

SELECT  employee_id
FROM    employees 
WHERE   e.department_id IN (10, 20, 30);

--동일 연산 수행 코드
SELECT  e.employee_id
FROM    employees e, departments d
WHERE   e.department_id IN (10, 20, 30);

SELECT  e.employee_id
FROM    employees e, departments d
WHERE   e.department_id = 10
  OR    e.department_id = 20
  OR    e.department_id = 30
;


SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id(+) = d.department_id
    OR e.department_id IN (10, 20, 30)
;
--괄 조인 운영 (+)는 OR 또는 IN의 연산수를 허용하지 않습니다
<예시>
1. 외부조인을 IN과 함께 쓰는 경우(오류)
SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id IN ( e.department_id (+), 200) 
;
--비정상~ ()괄호안에 값이 한개만 넣어야 값이 나옴 

2. 같은 의미의 코드(오류)
SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id(+) = d.department_id
    OR e.department_id IN  = 200 
;

3. IN절 데이터를 1개만 넣는 경우 (정상)
SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id(+) = d.department_id
    AND e.department_id IN (10) 
;

4.3번과 같은 코드 (정상)
SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id(+) = d.department_id
 AND e.department_id IN (10) 
;

답) IN절에 사용하는 값이 1개인 경우
의미상 OR을 사용한 것이 아니므로 외부조인 가능
--외부조인시 (+) 기호를 어떤 컬럼에 붙여야 할까?

SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id(+) = d.department_id
    OR e.department_id =10  
    OR  e.department_id =20
    OR  e.department_id =30
;
                


6장 4번

SELECT  a.department_id, a.department_name
FROM    departments a
INNER JOIN  employees b
ON  a.department_id = b.department_id
WHERE b.salary > 3000
ORDER BY a.department_name;


6장 5번

EXISTS > 조인조건 유: 연관성 있는 서브쿼리
IN  > 조인조건 무: 연관성 없는 서브쿼리

SELECT  d.department_id, d.department_name
FROM    departments d, job_history j
WHERE   d.department_id =  j.department_id;

SELECT  d.department_id, d.department_name
FROM    departments d
WHERE   d.department_id IN (SELECT department_id
                            FROM job_history)
 ;

6장 6번
연도별 이탈리아 최소매출사원명 최소매출액

SELECT  SUBSTR(s.sales_month,1,4), c.country_name, e.emp_name, MIN(s.amount_sold)
FROM    sales s, employees e, countries c
WHERE   c.country_name = 'Italy'
    AND s.employee_id = e.employee_id
GROUP BY SUBSTR(s.sales_month,1,4), e.emp_name, c.country_name
ORDER BY 1;

--풀이방법
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
--이거 본다음
--결과는 이렇게 만들면 되요
SELECT  years, 
                 MAX(amount_sold) AS max_sold,
                 MIN(amount_sold) AS min_sold
          FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id, 
                        SUM(a.amount_sold) AS amount_sold
                   FROM sales a,
                        customers b,
                        countries c
                  WHERE a.cust_id = b.CUST_ID
                    AND b.country_id = c.COUNTRY_ID
                    AND c.country_name = 'Italy'
                  GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id
               ) K
          GROUP BY years;

--8장 PL/SQL
/*
[:=] 우항의 값을 좌항에 할당

**블록  
[이름부] -- CREATE로 이름생성
[IS(AS)] -- 프로시저, 사용자함수의 변수/상수 선언
    변수명 데이터타입;
DECLARE -- 일반 프로그램의 변수/상수 선언
    선언부1
    선언부2
BEGIN
    실행부1;
    실행부2;
[EXCEPTION
    예외처리부]
END;

함수: 입력값을 활용해 특정 연산을 수행 후 결과 값 반환
프로시저: 특정 로직을 처리하고 결과 값은 반환하지 않음. 서브프로그램
*/

--익명블록

DECLARE
    vi_num  NUMBER;       --i_num 이름으로 변수 선언(생성)
BEGIN                     --여기서부터 프로그램을 시작하겠다
     vi_num := 100;       --어떤 값이던지 넣을 수 있다
    DBMS_OUTPUT.PUT_LINE(vi_num);  --가로가 있으면 함수, 함수(기능): 로그확인
END;
--/  프로그램 작성이 끝났음 SQL*PLUS 설정 여부에 따라 선택사용
--PL/SQL 프로시저가 성공적으로 완료되었습니다. => 컴파일 + 실행완료
/
DECLARE
    a INTEGER := 2**2*3**2;
    b NUMBER := 3+4;
BEGIN
       /*  DBMS_OUTPUT.PUT_LINE
    : DBMS 출력으로 입력값에 대한 로그 확인*/
   DBMS_OUTPUT.PUT_LINE('a='||TO_CHAR(a));
   DBMS_OUTPUT.PUT_LINE('b='||b);       --자동형변환
   DBMS_OUTPUT.PUT_LINE(b);
END;
/ 
DECLARE --선언부
--a는 2의 2승 곱하기 3의2승
    a INTEGER := 2**2*3**2;
    b NUMBER := 3+4;
    c VARCHAR2(30) := '우리나라';
    d BOOLEAN := false;
    e DATE := SYSDATE;
    f INT := 33;
BEGIN --실행부
    DBMS_OUTPUT.PUT_LINE('===========================');
    DBMS_OUTPUT.PUT_LINE('a='||TO_CHAR(a));
    DBMS_OUTPUT.PUT_LINE('b='||b);       --자동형변환
    DBMS_OUTPUT.PUT_LINE(b);
    DBMS_OUTPUT.PUT_LINE(c);
    --불리안 값 출력방법
     DBMS_OUTPUT.PUT_LINE('d='|| CASE WHEN 'ture' ELSE 'false' END); -- DBMS_OUTPUT.PUT_LINE(d);
     DBMS_OUTPUT.PUT_LINE(e);
     DBMS_OUTPUT.PUT_LINE(f);
      DBMS_OUTPUT.PUT_LINE(b+f);
END;
/
DECLARE
    vs_emp_name VARCHAR2(80);   --잘못된 데이터타입 설정 위험!
    vs_dep_name VARCHAR2(80);   --변수선언
BEGIN
    SELECT e.emp_name, d.department_name
    INTO    vs_emp_name, vs_dep_name     --순서, 개수 일치
    FROM    employees e, departments d
    WHERE  e.department_id = d.department_id
        AND employee_id = 100
     ;
    DBMS_OUTPUT.PUT_LINE(vs_emp_name);
END;
/
DECLARE
    num CONSTANT NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=======================================');
    DBMS_OUTPUT.PUT_LINE('num='||num);
END;


8장 1번
구구단 3단

DECLARE
  a  NUMBER := (3*1);
  b  NUMBER := (3*2);
  c  NUMBER := (3*3);
  d  NUMBER := (3*4);
  e  NUMBER := (3*5);
  f  NUMBER := (3*6);
 g   NUMBER := (3*7);
 h   NUMBER := (3*8);
  i  NUMBER := (3*9);
BEGIN
    DBMS_OUTPUT.PUT_LINE(a);
    DBMS_OUTPUT.PUT_LINE(b);
    DBMS_OUTPUT.PUT_LINE(c);
    DBMS_OUTPUT.PUT_LINE(d);
    DBMS_OUTPUT.PUT_LINE(e);
    DBMS_OUTPUT.PUT_LINE(f);
    DBMS_OUTPUT.PUT_LINE(g);
    DBMS_OUTPUT.PUT_LINE(h);
    DBMS_OUTPUT.PUT_LINE(i);
END;


<문제풀이>
유형1

BEGIN
    DBMS_OUTPUT.PUT_LINE('===================================');
    DBMS_OUTPUT.PUT_LINE('3*1=3');
    DBMS_OUTPUT.PUT_LINE('3*2=6');
    DBMS_OUTPUT.PUT_LINE('3*3=9');
    DBMS_OUTPUT.PUT_LINE('3*4=12');
    DBMS_OUTPUT.PUT_LINE('3*5=15');
    DBMS_OUTPUT.PUT_LINE('3*6=18');
    DBMS_OUTPUT.PUT_LINE('3*7=21');
    DBMS_OUTPUT.PUT_LINE('3*8=24');
    DBMS_OUTPUT.PUT_LINE('3*9=27');
END;

유형2

DECLARE
    num NUMBER := 1;  --> 2 > 3
    dan NUMBER := 2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('===================================');
    DBMS_OUTPUT.PUT_LINE('3 * ' || num || ' = ' || 3*num);
    num := num + 1;
    DBMS_OUTPUT.PUT_LINE('3 * ' || num || ' = ' || 3*num);
    num := num + 1;
    DBMS_OUTPUT.PUT_LINE('3 * ' || num || ' = ' || 3*num);
    num := num + 1;
    DBMS_OUTPUT.PUT_LINE('3 * ' || num || ' = ' || 3*num);
    num := num + 1;
    DBMS_OUTPUT.PUT_LINE('3 * ' || num || ' = ' || 3*num);
    num := num + 1;
    DBMS_OUTPUT.PUT_LINE('3 * ' || num || ' = ' || 3*num);
    num := num + 1;
    DBMS_OUTPUT.PUT_LINE('3 * ' || num || ' = ' || 3*num);
    num := num + 1;
    DBMS_OUTPUT.PUT_LINE('3 * ' || num || ' = ' || 3*num);
    num := num + 1;
    DBMS_OUTPUT.PUT_LINE('3 * ' || num || ' = ' || 3*num);
END;


commit;