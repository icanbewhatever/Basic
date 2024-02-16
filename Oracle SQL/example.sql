�Լ������ϱ�

�����Լ�
-ABS(n): ���밪 ��ȯ
SELECT ABS(10), ABS(-10), ABS(-10.123)
FROM DUAL;

-CEIL(n): n�� ���ų� ���� ū ���� ��ȯ
SELECT CEIL(10.123), CEIL(10.567), CEIL(11.001)
FROM DUAL;


FLOOR�Լ�

CREATE OR REPLACE VIEW emp_dept_v1 AS
SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
FROM employees a,
     departments b
WHERE a.department_id = b.department_id;

SELECT *
FROM emp_dept_v1;

DROP VIEW emp_dept_v1;


--�ó��

CREATE OR REPLACE PUBLIC SYNONYM channels_synonym
FOR channels;

SELECT COUNT (*)
FROM channels_synonym;

GRANT SELECT ON channels_synonym TO PUBLIC; -- PUBLIC ���� ����
GRANT SELECT ON channels_synonym ora_user;  -- PRIVATE ���� ����
ora_user����ڿ��� channels_synonym �ó�Կ� ���� ��ȸ ������ �ο���

SELECT *
FROM channels_synonym;

DROP SYNONYM channels_synonym; 
DROP PUBLIC SYNONYM channels_synonym; 


--***������

DROP SEQUENCE seq_1;

CREATE SEQUENCE seq_1
INCREMENT BY    2
START WITH      3
MINVALUE    2 -- ����Ŭ�� �ٽ� ������ ��, minivalue���� ����
MAXVALUE   10
CYCLE
NOCACHE
;

DELETE ex2_8;

DESC ex2_8;

seq_1.CURRVAL
seq_1.NEXTVAL

--�ǻ��÷��� ���� ���
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
SELECT seq_1.NEXTVAL FROM DUAL; --10�̻� �ȵȴ� �׷��� ����

SELECT * FROM ex2_8;

SELECT *
FROM SALES PARTITION (SALES_Q1_1998);


2�� ����Ǯ��

1������ -- OK
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

-- CONSTRAINTS check1�� �÷��� ���� �� ��� �������� but �� �ؿ� �� ��� ����Ѵ�
����)

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



<Ǯ��>

CREATE TABLE ���̺�� (
    �÷��� ������Ÿ�� (��������),   --��ǥ �� �����ֱ�
    CONSTRAINTS ��Ī �������� (�÷�)
);                           -- �������� ���̺�� ���� �ٷ� ���ֱ�

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS -- �������� ������ �ý��� ���̺�
WHERE table_name = 'ORDERS' 
;

INSERT INTO ORDERS(ORDER_ID, ORDER_MODE, PROMOTION_ID)
VALUES (1, 'offline', 11); -- üũ ��������(ORA_USER.CHECK1)�� ����Ǿ����ϴ�

INSERT INTO ORDERS(ORDER_ID, ORDER_MODE, PROMOTION_ID)
VALUES (4, 'online', 11);

INSERT INTO ORDERS(ORDER_ID, ORDER_MODE, PROMOTION_ID)
VALUES (1, 'direct', 11); -- ���Ἲ ���� ����(ORA_USER.SYS_C007471)�� ����˴ϴ�



2������ -- OK
- �������: �⺻Ű�� 3��, ����Ʈ 0

DROP TABLE ORDER_ITEMS;

CREATE TABLE ORDER_ITEMS (
        ORDER_ID      NUMBER(12, 0),
        LINE_ITEM_ID  NUMBER(3, 0),   
        PRODUCT_ID    NUMBER(3, 0),
        UNIT_PRICE    NUMBER(8, 2) DEFAULT 0,
        QUANTITY      NUMBER(8, 0) DEFAULT 0,
        CONSTRAINTS P_ID PRIMARY KEY (ORDER_ID, LINE_ITEM_ID)
); ---��� ��� ����? �̰� �³�? -- ����


INSERT INTO ORDER_ITEMS(ORDER_ID, LINE_ITEM_ID, PRODUCT_ID)
VALUES(1, 1, 11);

INSERT INTO ORDER_ITEMS(ORDER_ID, LINE_ITEM_ID, PRODUCT_ID)
VALUES(1, 22, 11);

INSERT INTO ORDER_ITEMS(ORDER_ID, LINE_ITEM_ID, PRODUCT_ID)
VALUES(1, 33, 11);


3������

CREATE TABLE PROMOTIONS(
    PROMO_ID    NUMBER(6, 0) PRIMARY KEY,
    PROMO_NAME  VARCHAR2(20)
);

--5������
--������ �ǻ��÷��� ����� ���̺� ORDERS1�� ORDER_ID �÷��� ������ ������
--(3��)�� �����Ͻÿ�

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


--1.SELECT ��
--
--SELECT * Ȥ�� �÷�
--FROM ���̺�
--WHERE ����
--ORDER BY �÷�

--����1, ������̺��� �޿��� 5000�� �ʰ��ؼ� �޴� �����ȣ�� �̸���
--��ȸ�ϴ� �������� �ۼ��Ͻÿ�

SELECT employee_id, emp_name, salary
FROM employees
WHERE salary > 5000
ORDER BY 3 DESC;

--����2, ������̺��� �޿��� 5000�� �ʰ��ؼ� �޴� �����ȣ�� �̸���
--��ȸ�ϴ� �������� �ۼ��Ͻÿ�
--job_id �� IT ���α׷����� ����� ��ȸ�ϰ�ʹ�

SELECT employee_id, emp_name, salary, job_id
FROM employees
WHERE salary > 5000 AND job_id = 'IT_PROG'
ORDER BY 3 DESC;

--<���빮��>
--������̺��� �޿��� ���� ���� �޴� ����� ��ȸ�Ͻÿ�

SELECT employee_id, emp_name, SUM(salary)
FROM employees
GROUP BY employee_id, emp_name
HAVING  SUM(salary)>20000
;

SELECT employee_id, emp_name, MAX(DISTINCT salary)
FROM employees
--GROUP BY employee_id, emp_name
;

<Ǯ��>
SELECT  MAX(salary)
FROM employees
;

COMMIT;

--2. INSERT ��

INSERT INTO ���̺��(�÷�1, �÷�2,..)
VALUES (��1, ��2,...);

INSERT INTO ���̺��
VALUES (��1, ��2,...);

INSERT INTO ���̺��(�÷�1, �÷�2,..)
SELECT (��1, ��2,...);


--����, ������̺� ������ ������ �����Ͽ� �����͸� �����Ͻÿ�
--(�����ȣ, ����̸�, �̸���, ��ȭ��ȣ)


INSERT INTO employees (employee_id, emp_name, email, phone_number, hire_date)
VALUES (999, 'Luna', 'Lunita', '123456', SYSDATE);

SELECT *
FROM employees
WHERE employee_id=999;

ROLLBACK;


INSERT INTO ���̺��
VALUES (��1, ��2,...);

INSERT INTO ���̺��(�÷�1, �÷�2,..)
SELECT (��1, ��2,...);

DELETE ORDERS1
WHERE ORDER_ID=2;


<5�� �ٽ�Ǯ��>

1��  �Ի�⵵�� ������� ���ϴ� ������ �ۼ�

SELECT TO_CHAR(hire_date, 'YYYY')
FROM employees;

SELECT TO_CHAR(hire_date, 'YYYY'), COUNT(employee_id)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

2�� kor_loan_status ���̺��� 2012�⵵ ����, ������ ���� �� �ܾ� ���� �ۼ�

SELECT  period, region, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2012%'
GROUP BY period, region
ORDER BY 1;


3��, ���տ����ڷ� ������ ����� �����ض�
SELECT period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE period Like '2013%'
GROUP BY period, ROLLUP(gubun);

-- �� ������ ������ �������� �ʰ� �ؿ���?
--���ǿ� ��Ÿ���� �Ǵ� ���ô㺸������ �������� �ʰ� ���� ��� ������?


SELECT PERIOD, GUBUN, SUM(LOAN_JAN_AMT)
FROM    kor_loan_status
WHERE period Like '2013%'
GROUP BY period, gubun

UNION

SELECT  PERIOD, '', SUM(LOAN_JAN_AMT)
FROM    kor_loan_status
WHERE period Like '2013%'
GROUP BY period;


4��, ���տ����ڷ� ������ ����� �����ض�

SELECT period,
       CASE WHEN gubun = '���ô㺸����' THEN SUM(loan_jan_amt) ELSE 0 END ���ô㺸�����,
       CASE WHEN gubun = '��Ÿ����' THEN SUM(loan_jan_amt) ELSE 0 END ��Ÿ�����
FROM kor_loan_status
WHERE period = '201311'
GROUP BY period, gubun;

SELECT  period, 0 ���ô㺸�����, SUM(loan_jan_amt) ��Ÿ�����
FROM    kor_loan_status
WHERE   period = '201311'
    AND gubun = '��Ÿ����'
GROUP BY period
UNION
SELECT  period, SUM(loan_jan_amt) ���ô㺸�����, 0 ��Ÿ�����
FROM    kor_loan_status
WHERE   period = '201311'
    AND gubun = '���ô㺸����'
GROUP BY period;

5�� 

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



��������


where �� ��������

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

<��������>: ������̺�κ��� �����ȣ�� ������ȣ ��ȸ

SELECT employee_id, job_id
FROM    job_history;

<��������>: ������̺��� ����̸��� ��Ī, �����ȣ�� ������ȣ�� ��ȸ

SELECT  emp_name, employee_id, job_id
FROM    employees
WHERE  employee_id IN (SELECT employee_id
                                 FROM   job_history);

������̺��� �޿��� ������ �����ϰ� ��ձ޿��� ����

UPDATE employees
SET salary = (SELECT AVG(salary) FROM employees);


��ձ޿����� ���� �޴� ��� ����

SELECT  emp_name
FROM    employees
WHERE   salary > (SELECT AVG(salary) FROM employees);

DELETE employees
WHERE salary > (SELECT AVG(salary) FROM employees);

<��������>: ������̺��� ��ȸ�� �μ���ȣ�� �μ���� �Բ� ��ȸ

SELECT   department_id
FROM    job_history;


SELECT   department_id, department_name
FROM    departments d
WHERE   EXISTS (SELECT   department_id
                FROM    job_history j
                WHERE j.department_id = d.department_id);

<��������1> ������̺��� ����� ��ȸ 107��
 SELECT COUNT(*)
 FROM employees;

<��������2>  �μ��� ��ȸ 27��

 SELECT COUNT(department_id)
 FROM departments;
 
 <��������>  �����ȣ, �����, �μ���ȣ, �μ���
 
 SELECT employee_id, emp_name, department_id, 
               (SELECT  department_name
                FROM    departments d
                WHERE d.department_id = e.department_id) department_name
 FROM   employees e
 ;
 
 <��������1> ������̺��� ��ձ޿���ȸ
SELECT AVG(salary)
FROM employees;
                
<��������2> ��ձ޿� ���� �����޿��� �޴� ����� �μ���ȣ ��ȸ

SELECT employee_id
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

<��������> ��ձ޿� ���� �����޿��� �޴� ����� �μ���ȣ�� ��Ī�Ǵ� �μ��� ��ȸ

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
WHERE a.employee_id = b.employee_id(+) -- �ܺ������� �� �����θ�
 AND a.department_id = b.department_id(+);

6�� 6��
������ ��Ż���� �ּҸ������� �ּҸ����

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





                                   
