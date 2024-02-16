2�� �����ͺ��̽��� �����ϴ� ��ü
--���̺� ����

CREATE TABLE ���̺� �� (
    �÷��� ������Ÿ��,
    �÷��� ������Ÿ��
);

���̺� ���� ��Ģ
���̺��, �÷����� �ִ� ũ��� 30 Byte
���̺��, �÷��� �����  ��� �Ұ�
���̺��, �÷������� ����, ����, _ $ # ���� ��밡��, ù ���ڴ� ���ڸ�
�� ���̺� ���� �� �ִ� �÷��� �ִ� 255��


CREATE TABLE table_1(
    column1 NUMBER(3), -- 123 12.3 1.00 ����X,(3)�������� �� ���ڴ� 3���� �� ���ִ�
    col2 VARCHAR2(20), -- 'ABC' '10' ()�����Ұ���
    col3 DATE          --��¥  LOV - �� 4���� ������Ÿ���� �ִ�
    );

DROP TABLE ex2_1;

CREATE TABLE ex2_1(
    column1    CHAR(10),
    column2    VARCHAR(10)
    );

--���� ������ Ÿ��
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

INSERT INTO ex2_2 VALUES ('������','������','������'); 
-- �ѱ��� �� ���ڰ� 2byte�̹Ƿ� �����߻� �׷��� col3������char�� ����ؼ� �Է��� �����ϴ�

INSERT INTO ex2_2 (column3) VALUES('������');

SELECT column3, LENGTH (column3) AS len3, LENGTHB(column3) AS bytelen
FROM ex2_2;

--���� ������ Ÿ��
CREATE TABLE ex2_3(
        COL_INT INTEGER,
        COL_DEC DECIMAL,
        COL_NUM NUMBER
        );
        
SELECT column_id, column_name, data_type, data_length
FROM user_tab_cols
WHERE table_name = 'EX2_3'
ORDER BY column_id;

--��¥ ������ Ÿ��

INSERT INTO table_1
VALUES(100, '����', SYSDATE);

CREATE TABLE ex2_8(
    COL1 VARCHAR2(10) PRIMARY KEY,
    COL2 VARCHAR2(10)
    );
SELECT constraint_name, constraint_type, table_name, search_condition
FROM user_constraints
WHERE table_name = 'EX2_8';
INSERT INTO ex2_8 VALUES ('AA', 'AA');
    


--5. ������
--�ּҰ� 1,
--�ִ밪 99999999,
--1000���� �����ؼ�
--1�� �����ϴ�
--ORDERS_SEQ ��� �������� ������

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



3��
--1.SELECT ��
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

--�ΰ��� ���̺��� �ϳ��� SQL������ ����ϴ� ���
SELECT d.department_id 
FROM employees e, departments d;

--���÷��� ��Ī�� ���̴� ���(AS ��������)
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

--2.INSERT ��
--1) �⺻����

CREATE TABLE ex3_1(
       col1 VARCHAR2(10),
       col2 NUMBER,
       col3 DATE
);
INSERT INTO ex3_1(col1, col2, col3) --�⺻����
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

--2) �÷��� ��� ���� ���� (�÷���col ���� ���� ��, �����״��)

INSERT INTO ex3_1
VALUES ('LEE', 1, NULL);



--3) INSERT ~ SELECT ����
DROP TABLE ex3_2;
CREATE TABLE ex3_2(
    emp_id NUMBER(6,0),
    emp_name VARCHAR2(100 BYTE)
);

--����: �޿��� 5000���� �̻��� ��������� �� ���̺� �Է�
INSERT INTO ex3_2
SELECT employee_id, emp_name
FROM employees
WHERE salary >= 5000;

SELECT COUNT(*)
FROM ex3_2;

INSERT INTO ex3_2
VALUES (300, 'luna');

--�ڵ� ����ȯ = ������ ����ȯ
INSERT INTO ex3_1(col2)
VALUES ('10��');

--���̺� ����� INSERT ���� ����
--���̺� ����
--DDL����: ���̺��� ����
    CREATE TABLE ex3_1 copy AS
    SELECT �÷��� col1, col2, col3
    FROM ���̺�� ex3_1;

--INSERT
--DML����: ���̺� ���� X
CREATE TABLE ex3_1 copy(
�÷��� ������ Ÿ��
     col1 VARCHAR2(10 BYTE),
     col2 NUMBER,
     col3 DATE,
);

INSERT INTO ���̺��
SELECT �÷���
FROM ���̺��;


--3. UPDATE ����
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

���̺� ex3_1���� 
�÷� col1�� �����Ͱ� DIAZ�̰�, 
�÷� col3�� �����ͳ� ���� �ƴ� ���
col3 �÷��� �����Ϳ� �ý����� ��¥/�ð��� �����ϼ���.
UPDATE ex3_1
SET col3 = '23/11/10'-- �Ǵ� SYSDATE
WHERE col3 is null; -- �Ǵ� is not null

UPDATE ex3_1
SET col1 = 'MNO'
WHERE col1 is null;

SELECT * FROM ex3_1;





--4.MERGE ��
��ǥ: 2000�� 10������ 12�� ���̿� �� ������ ��������
    ���� ������ �޼��� ������� �� ���� ���ʽ��� ������
��� ���̺�: ��� employees, �Ǹ� sales

����1. �ش� ���� ������ �޼��� ����� �����ΰ�?
������ �޼��� ��� ��Ϥ��� ex3_3 ���̺� ����
�����ȣ�� ������̺�� �Ǹ� ���̺� �� �� �־�� ��
2000�⵵ 10��~ 12�� ���̿� �� ������ �������� ��


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


ex3_3 ���̺� => ���� �޼��� ��� = ���ʽ� �޴� ��� 
1. ������ ��� manager_id�� 146���� ����� ã�� SELECT 

2. ex3_3 ���̺� �ִ� ����� ����� ��ġ�ϸ�
���ʽ� bonus_amt�� �ڽ��� �޿�salary 1%�� ���ʽ��� ����

3. ex3_3 ���̺� �ִ� ��� ��� ��ġ���� ������
1�� ����� ����� �űԷ� �Է� (���ʽ� �ݾ��� 0.1%)
�޿��� 8000 �̸��� �����

SELECT employee_id, manager_id
FROM employees
WHERE manager_id = 146;

SELECT employee_id, manager_id, salary * 0.01
FROM employees
WHERE manager_id = 146;

1% : salary * 0.01
0.1% : salary * 0.01

SELECT * FROM ex3_3 ORDER BY employee_id;

-- INSERT INTO ex3_3 VALUES(300,0); -300�� EMPLOYEES���̺� ��� �ȳ���

-- ���ʽ� 1% �޴� ��� ��� �� ���ʽ� �ݾ�
SELECT employee_id, manager_id, salary, salary*0.01
FROM employees
WHERE employee_id IN (SELECT employee_id FROM ex3_3);


SELECT employee_id FROM ex3_3;

-- ���ʽ� 0.1% �޴� ��� ��� �� ���ʽ� �ݾ�
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


-- DELETE : ������ ����
DELETE ex3_3
WHERE employee_id = 155;

DELETE ex3_3;

-- COMMIT : ������ ������ �ݿ�

INSERT INTO ex3_3 VALUES(300,100);
SELECT * FROM ex3_3;

COMMIT;

-- ROLLBACK : COMMIT�� �ݴ�, �����ϱ� ���� ����

INSERT INTO ex3_3 VALUES(301,200);
SELECT * FROM ex3_3;

ROLLBACK;

SELECT * FROM ex3_3;

-- �ǻ��÷�
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


-- ���ڿ�����
-- shift+ won= ||

SELECT emp_name, salary || '-' || commission_pct
FROM employees
WHERE commission_pct <= 1
;

-- ��������� => + - * /
���� ���θ����� 'Mouse Pad'�� 3�� �������� �� ���� ����ϱ�

SELECT PROD_LIST_PRICE, PROD_LIST_PRICE*3||'$'
FROM PRODUCTS
WHERE PROD_DESC = 'Mouse Pad';

-- ��������: >, <, >=, <=, =     �����ʴ� <>, !=. ^= !������ �ǹ�
���� ���θ����� ��ǰ�� ������ �� 10�޷� ���� ��ǰ�� �˻��ϱ�

SELECT prod_desc, prod_list_price||'$'
FROM products
WHERE prod_list_price<= 10;

-- ǥ����
CASE WHEN ����1 THEN ��1
     WHEN ����2 THEN ��2
     ...
     ELSE ��Ÿ ��
END

ex.�޿���
5000 ���Ϸ� �޴� ��� C���
5000 �ʰ�~ 15000�̸� �޴� ��� B
15000 �̻� �޴� ���  A
�� ���� ��� D

SELECT employee_id, salary,
CASE WHEN salary <= 5000 THEN 'C���'
     WHEN salary > 5000 AND salary < 1500 THEN 'B���'
     WHEN salary >= 1500 THEN 'A���'
     ELSE 'D���'
END
FROM employees;


SELECT employee_id, salary,
CASE WHEN salary <= 5000 THEN 'C���'
     WHEN salary > 5000 AND salary < 1000 THEN 'B���'
     WHEN salary >= 10000 AND salary > 15000 THEN 'A���'
     ELSE 'D���'
END    
FROM employees;

--���ǽ� (where���� Ȱ��)
�������� : AND OR NOT
�� ���ǽ�: ANY SOME ALL
            ANY(��1, ��2, ��3, ....) � ���� �ϳ��� �����ϸ� �ȴ�
            SOME(��1, ��2, ��3, ....) ANY�� ����
            ALL(��1, ��2, ��3, ....) ��� ������ ����
            
SELECT �÷� 
FROM   ���̺�
WHERE  ����;
            
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


-- �� ���ǽ�
��������: AND OR NOT

SELECT  employee_id, salary
FROM    employees
WHERE   salary > 8000 OR salary < 10000
;

SELECT  employee_id, salary
FROM    employees
WHERE   NOT (salary > 15000)
;

-- NULL ���ǽ�
IS NULL
IS NOT NULL

SELECT  employee_id, salary
FROM    employees
WHERE   manager_id IS NOT NULL
;

-- BETWEEN AND ���ǽ�
�����÷� BETWEEN ���۰� AND ���ᰪ

SELECT  employee_id, salary
FROM    employees
WHERE   salary BETWEEN 2000 AND 2500
;

-- IN ���ǽ�
�������� ����� ���� ���Ե� ������ ����� ��ȯ = ANY�� ������ �ε�ȣ���ʿ��� �ٸ��� 
IN (��1, ��2, ��3...)

SELECT  employee_id, salary
FROM    employees
WHERE   salary IN (2000, 3000, 4000)
;

-- EXISTS ���ǽ�
EXISTS(�������� select with ��������)
��������: ���̺�1.�����÷� = ���̺�2.�����÷� 
> ������ �÷� �ΰ��� ��ġ�� ���ؼ�
�������̺��� ����ϱ� ���� .�����÷����� �������ش�
    ��) employees.department_id = departments.department_id
        e.department_id = d.department_id
<��������>
SELECT  �÷�   *
FROM    ���̺� employeees e
WHERE   ����  e.department_id = d.department_id
             AND salary >= 3000;
;

<��������> �޿��� 3õ���� �̻��� �μ� ���̵�, �μ����� ��ȸ�ض�
�����Ѱ�
SELECT  department_id, department_name
FROM    departments
WHERE   EXISTS( SELECT salary 
                FROM employees 
                WHERE salary >= 3000
                AND employees.department_id = departments.department_id)
;

�����ð���
SELECT  department_id, department_name
FROM    departments d
WHERE   EXISTS( SELECT * 
                FROM employees e 
                WHERE salary >= 14000
                AND e.department_id = d.department_id)
;

-- LIKE ���ǽ�
LIKE '���ڿ� ����' �˻�
��) ������̺��� ����̸��� 'ȫ�浿'�� ����� ��ȸ
��) ������̺��� ����̸��� 'ȫ'���� �����ϴ� ����� ��ȸ
�������� %
�� ���� _

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

INSERT INTO ex3_5 VALUES ('ȫ�浿');
INSERT INTO ex3_5 VALUES ('ȫ���');
INSERT INTO ex3_5 VALUES ('ȫ���');
INSERT INTO ex3_5 VALUES ('ȫ���');
INSERT INTO ex3_5 VALUES ('ȫ���');

SELECT * FROM ex3_5;

COMMIT;

SELECT *
FROM   ex3_5
WHERE  name LIKE '%��';

SELECT *
FROM   ex3_5
WHERE  name LIKE 'ȫ__'
    OR name LIKE '%��';
    

<3�� ���� Ǯ�� ���>

1.�����ؼ� > ����ã�� (����) , �����и�
2.������ ����(����)�ۼ�

1�� 
    ex3_6 ���̺��� �����, ������̺��� 
    �����ڻ���� 124���̰� �޿��� 2õ���� 3õ ���̿� �ִ� 
    ����� ���, �����, �޿�, �����ڻ���� �Է��ϴ�
    INSERT���� �ۼ��غ���

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

2������

������ �Է�

    DELETE ex3_3;
    
    INSERT INTO ex3_3 (employee_id)
    SELECT e.employee_id
    FROM    employees e, sales s
    WHERE   e.employee_id = s.employee_id
        AND s.SALES_MONTH BETWEEN'200010' AND '200012'
    GROUP BY e.employee_id
    ;
    
������ ����� 145���� ����� ã��
�� ���̺� �ִ� ��� ����� ��ġ�ϸ�
���ʽ� �ݾ�bonus_amt�� �ڽ��� �޿��� 1%�� ���ʽ��� �����ϰ�
ex3_3���̺� �ִ� ����� ����� ��ġ���� ���� �����
�ű��Է� (�̶� ���ʽ��� �޿��� 0.5% �Ѵ�)

> ���ã�� - SELECT
> �����ϰ� - UPDATE
> �ű��Է� - INSERT
>MERGE�Է� - MERGE

������ ����� 145���� ����� ã��
�� ���̺� �ִ� ��� ����� ��ġ�ϸ� => MATCHED
���ʽ� �ݾ�bonus_amt�� �ڽ��� �޿��� 1%�� ���ʽ��� �����ϰ�
ex3_3���̺� �ִ� ����� ����� ��ġ���� ���� �����
�ű��Է� (�̶� ���ʽ��� �޿��� 0.5% �Ѵ�) => NOT MATCHED

���̺� ex3_3, employees
�÷�  manager_id, employee_id, bonus_amt, salary
manager_id = 145
bonus_amt = bonus_amt + salary *0.01
bonus_amt = bonus_amt + salary *0.005

�������� Ǭ��,

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



���� Ǭ ��
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
    
    
    
3��3������ OK

-�����ϴ� ������ �ۼ� > SELECT

SELECT employee_id, emp_name, commission_pct
FROM    employees
WHERE commission_pct IS NULL
;


3�� 4������ OK
��������: AND OR NOT
�񱳿�����: > < >= <= ...

SELECT employee_id, salary
FROM    employees
WHERE   salary >= 2000
    AND salary <= 2500
;

3�� 5������
�Ʒ� ������ ANY�� ALL�� ����ؼ� ������ ��� ����

SELECT employee_id, salary --�����ȣ, �޿� ��ȸ
FROM    employees          -- ��� ���̺�κ��� 
WHERE salary IN (2000, 3000, 4000) -- �޿��� 2,3,4õ ���� ���ԵǸ�
ORDER BY employee_id;      -- ��� ��ȣ�� ����

SELECT employee_id, salary --�����ȣ, �޿� ��ȸ
FROM    employees          -- ��� ���̺�κ��� 
WHERE salary NOT IN (2000, 3000, 4000) -- �޿��� 2,3,4õ ���� ���� �ȵǸ�
ORDER BY employee_id;      -- ��� ��ȣ�� ����

���� => SELECT 
ANY, ALL�� ����ؼ� => �����ǽ�

���̺�: employees
�÷�: employee_id, salary
����: �÷��� (�񱳿�����) ANY(��1, ��2, ��3)
     �÷��� (�񱳿�����) ALL(��1, ��2, ��3)

---------------------------------���� Ǭ��
SELECT employee_id, salary
FROM    employees
WHERE salary = ANY (2000, 3000, 4000)
ORDER BY employee_id;

--�޿��� 2,3,4�� ���ALL ������
SELECT employee_id, salary
FROM    employees
WHERE salary = ALL (2000, 3000, 4000) -- �ȵǴ� ����???? 
ORDER BY employee_id;

SELECT employee_id, salary
FROM    employees
WHERE salary = SOME(2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM    employees
WHERE   salary = 2000
    AND salary = 3000
    AND salary = 4000 ---�� �ȵ���? -- OR�� ������Ѵ�
ORDER BY employee_id;



SELECT employee_id, salary
FROM    employees
WHERE   salary = 3000
    OR salary = 3000
    OR salary = 4000 
ORDER BY employee_id;


--NOT IN Ǯ��


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


----SQL �Լ�
�����Լ�

ABS (����)    ���밪
CEIL (����)   �ø�
FLOOR(����)   ����
ROUND(����)   �ݿø� (5�̻��϶���)
**TRUNC(����, ����)   ����
POWER(����, ����)   ����
**MOD(����,����)      ������
REMINDER(����, ����)    ������




SELECT ABS (10) FROM DUAL;
SELECT ABS (0) FROM DUAL;
SELECT ABS (-10) FROM DUAL;

SELECT CEIL(10.123), CEIL(10.541), CEIL(10) FROM DUAL;
SELECT FLOOR(10.123), FLOOR(10.541), FLOOR(10) FROM DUAL;

SELECT ROUND(10.123), ROUND(10.541), ROUND(10) FROM DUAL;
SELECT ROUND(10.157, 1), ROUND(10.157, 2), ROUND(10.157, 3) FROM DUAL;

SELECT TRUNC(115.55)FROM DUAL;
SELECT TRUNC(115.55, 1)FROM DUAL; -- n2�� �Ҽ��� ù�ڸ� �Է�
SELECT TRUNC(115.55, -2)FROM DUAL; -- n2�� �Ҽ��� -2

SELECT POWER(2, 2), POWER(3, 3), POWER(4, -2) FROM DUAL;

SELECT SQRT(2), SQRT(3), SQRT(5) FROM DUAL;

SELECT MOD(13, 2), MOD(19 ,4) FROM DUAL;

SELECT REMAINDER(13, 2), REMAINDER(19 ,4) FROM DUAL; 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              -- �� -1�� ������? 20�� 1�� �߰��ϸ� �� �������


-----------�����Լ�
INITCAP(����)     ù�ڴ빮��
LOWER(����)       �ҹ���
UPPER(����)       �빮��
CONCAT(����)      �ι��� ����
' '�ȿ� ���� ���鵵 ���ڷ� ó����

SELECT INITCAP('never say goodbye'),
       INITCAP('NEVER SAY GOODBYE'),
       INITCAP('never6say good��bye')
FROM DUAL;


SELECT LOWER('never say goodbye'),
       LOWER('NEVER SAY GOODBYE'),
       LOWER('never6say good��bye')
FROM DUAL;

SELECT UPPER('never say goodbye'),
       UPPER('NEVER SAY GOODBYE'),
       UPPER('never6say good��bye')
FROM DUAL;

SELECT CONCAT('never', 'say goodbye'), 'never'||'say'||'goodbye'
FROM DUAL;   --' '�ȿ� ���� ���鵵 ���ڷ� ó����

-----------------------------------------------------
SUBSTR (����, ��ġ, ����) �κй��ڿ� -- ��������
SUBSTRB (����, ��ġ, ����Ʈ) �κй��ڿ�
LTRIM (����, �߶󳾹�) ���� ���ڿ� ����
RTRIM (����, �߶󳾹�) ������ ���ڿ� ����


SELECT SUBSTR('never say goodbye',7,3)
FROM DUAL;

SELECT SUBSTRB('���ɽð��� �����ΰ���?',7,6) --1��/3 byte
FROM DUAL;

SELECT LTRIM('never say goodbye', 'never ') 
FROM DUAL;

SELECT RTRIM('never say goodbye', 'bye') 
FROM DUAL;

------------------------------
LPAD (���ڿ�1, ����, ���ڿ�2)
RPAD (���ڿ�1, ����, ���ڿ�2)
-> ���ڿ�1�� �� ���ڿ��� ���̰� n�� �ɶ����� �ݺ������� ���ڿ�2�� ����

**REPLACE (���ڿ�, ����ڿ�, �ٲܹ��ڿ�) -- > ���ڿ� ��ü, �����밡�� ���ڻ����Ҷ���
TRANSLATE (���ڿ�, �����, �ٲܹ���)--> ������ ���� ��ü,  �� ���ھ� ã�� �ٲ۴�
INSTRA (��ü���ڿ�, �˻��ҹ��ڿ�, ������ġ, �߻�Ƚ��)

����)
SELECT LPAD('123-4567', '13', '(032)') 
FROM DUAL;

SELECT RPAD('123-4567', '13', '(032)') 
FROM DUAL;

SELECT REPLACE('���� �ʸ� �𸣴µ�', '��', '��') 
FROM DUAL;

SELECT TRANSLATE('���� �ʸ� �𸣴µ�', '����', '�ʸ�') 
FROM DUAL;

SELECT REPLACE('������ �����ͺ��̽�(RDBMS)�� ���� �θ� ���̰� �ִ�.
�׸��� �� ������ �����ͺ��̽��� �̿��ϱ� ���� ǥ�� �� ������� �ִµ��װ��� SQL�̴�.', 
                '����', '����') 
FROM DUAL;


SELECT TRANSLATE('������ �����ͺ��̽�(RDBMS)�� ���� �θ� ���̰� �ִ�.
�׸��� �� ������ �����ͺ��̽��� �̿��ϱ� ���� ǥ�� �� ������� �ִµ��װ��� SQL�̴�.', 
                '�̿�', '���') 
FROM DUAL;

SELECT REPLACE('������ �����ͺ��̽�(RDBMS)�� ���� �θ� ���̰� �ִ�.
�׸��� �� ������ �����ͺ��̽��� �̿��ϱ� ���� ǥ�� �� ������� �ִµ��װ��� SQL�̴�.', 
                '����', '����') 
FROM DUAL;

---------------------INSTR

SELECT INSTR('������ �����ͺ��̽�(RDBMS)�� ���� �θ� ���̰� �ִ�.
�׸��� �� ������ �����ͺ��̽��� �̿��ϱ� ���� ǥ�� �� ������� �ִµ��װ��� SQL�̴�.', 
                �˻��ҹ��ڿ�, ������ġ, �߻�Ƚ��) 
FROM DUAL;


SELECT INSTR('������ �����ͺ��̽��� ���� �θ� ���̰� �ִ�.
�׸��� �� ������ �����ͺ��̽��� �̿��ϱ� ���� ǥ�� �� ������� �ִµ��װ��� SQL�̴�.', 
                '�����ͺ��̽�', 10, 2) 
FROM DUAL;


***��¥�Լ�
SYSDATE        - ���� ��¥/�ð�(�ú���)��ȯ
ADD_MONTHS     - �ش� ��¥ ���� ��(����)�� ���� ��¥ ��ȯ
MONTHS_BETWEEN (���ᳯ¥, ���۳�¥) - ��¥�� ���� �� ��ȯ
LAST_DAY(��¥)  - �ش� �� ������ ���� ��ȯ

ROUND   �ݿø��� ��¥
TRUNC   �߶� ��¥
NEXT_DAY   ������ ���� ���� ��ȯ
ROUND(��¥, ����)   �ݿø��� ��¥ 
TRUNC(ROUND(��¥, ����), ����)   �߶� ��¥
NEXT_DAY(��¥, ã������) ���� �ش� ���� ���� ��ȯ


SELECT ADD_MONTHS (SYSDATE,6)
FROM DUAL;

SELECT MONTHS_BETWEEN('2023/11/10', '2024/4/10')
FROM DUAL;

SELECT MONTHS_BETWEEN('2024/4/10', '2023/11/10')
FROM DUAL;

SELECT MONTHS_BETWEEN(ADD_MONTHS(SYSDATE,6), '2023/11/10')
FROM DUAL;

*****�Լ��� ��ø ���
�Լ�(�Է°�, �Է°�2)-a
�Է°�2 <= �ٸ��Լ�()�� a�� �����ִ�
�Լ�(�Է°�1, �ٸ��Լ�())
��, ��ȯ�Ǵ� ����� ������Ÿ���� ��ġ�ϴ� ��쿡�� ����


A(1,B(3,4))
B(3,4) > 5




�Լ�(����1, ����2)

SELECT LAST_DAY('2024/2/1')
FROM DUAL;

SELECT LAST_DAY(ADD_MONTHS(SYSDATE,6))
FROM DUAL;

-----------------------------------------------
ROUND(��¥, ����)   �ݿø��� ��¥ 
TRUNC(ROUND(��¥, ����), ����)   �߶� ��¥
NEXT_DAY()  ������ �� ������ ����

--16�� �̻��� �ݿø� ó���ؼ� 12���� ��
SELECT ROUND(TO_DATE('2023/11/16'), 'MONTH')  --TO_DATE ��¥������Ÿ������ �ٲ�
FROM DUAL;

���� �ݴ�
SELECT TRUNC(TO_DATE('2023/11/16'), 'MONTH')
FROM DUAL;
1�Ͽ��� 2������ 3ȭ����....
SELECT NEXT_DAY(SYSDATE, '��')
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, 7)
FROM DUAL;

-- �ֹι�ȣ �߰��� ������ �ֱ�
SELECT SUBSTR('5602131234567', 1, 6)||'-'||
       SUBSTR('5602131234567'), 4, 4)||'-'||
       SUBSTR('5602131234567'), 0, 4)
    FROM DUAL;

-- ��ȭ��ȣ 


***��ȯ�Լ� TO_
--���ں�ȯ
--TO CHAR(���� or ��¥, ����)
1. �Ҽ��� �ڸ��� ���缭
2. ���� = <>
3. ��� ���� ǥ�� + / -

SELECT TO_CHAR(123456789, '999,999,999') FROM DUAL;
--> �ڸ��� ���缭 �������� �ƴҶ� ���̰� �ִ�.
SELECT TO_CHAR(1234567, '999,999') FROM DUAL;
SELECT TO_CHAR(1234567, '9,999,999') FROM DUAL; -- �ڸ��� ���缭
SELECT TO_CHAR(1234567.67, '9999999.9') FROM DUAL; -- �Ҽ��� �ڸ��� ���缭(�ݿø�)
SELECT TO_CHAR(-123, '999PR') FROM DUAL; -- <����ǥ��>
SELECT TO_CHAR(123, 'RN') FROM DUAL; -- �θ����� ǥ��
SELECT TO_CHAR(-123, 'S999') FROM DUAL; -- ���+ S����- ǥ��

SELECT TO_CHAR(123, '00000') FROM DUAL; -- ������ ���� ��ŭ 0���� ä���
SELECT TO_CHAR(123456, 'L999,999') FROM DUAL; --��ȭ ǥ�� �ֱ�L

-- ��¥ ���˿� ���༭
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD DAY') FROM DUAL;

SELECT TO_CHAR(SYSDATE-5, 'FMYY/MM/DD DAY') FROM DUAL; -- ��¥ 0 ���ֱ�
SELECT TO_CHAR(SYSDATE, '""YYYY"�� "MM"�� "DD"��"') FROM DUAL;


--���ں�ȯ
TO NUMBER(����, ����)
-- ���ڳ� ��¥�� ���Ե� ������ ���ڷ� ��ȯ�ϸ� �����߻�
SELECT TO_NUMBER('123') FROM DUAL;
SELECT TO_NUMBER('ABC') FROM DUAL;  --����
SELECT TO_NUMBER(SYSDATE) FROM DUAL; --����

--��¥ ��ȯ
TO DATE(����, ����)

SELECT TO_DATE('20140101', 'YY-MM-DD') FROM DUAL;
SELECT TO_DATE('20140101', 'YY MM DD') FROM DUAL;
SELECT TO_DATE('20140101', 'YYYY-MM-DD') FROM DUAL;
SELECT TO_DATE('20140101 13:44:50', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_DATE('2014/01/01 13/44/45', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_DATE('2014-01-01 13/44/45', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_DATE('2014 01 01 13/44/45', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;


NLS (National Language Support, ������ ��� ����) ���� Ȯ��
SELECT * FROM NLS_SESSION_PARAMETERS;
--SESSION �������� ��ɾ�
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR-MM-DD HH24:MI:SS';


--NULL �Լ�
-- NULL ���� ó��: NULL ���� ���ο� ���� ���� ���� �޶���
NVL(ǥ����1, ǥ����2)

SELECT NVL(ǥ����1, ǥ����2) 
FROM ���̺�
WHERE ����;

SELECT NVL(manager_id, employee_id) 
FROM employees
WHERE manager_id IS NULL;

SELECT manager_id, NVL(manager_id, employee_id) 
FROM employees;

NVL2(ǥ����1, ǥ����2, ǥ����3) : ǥ����1�� NULL�� �ƴϸ� ǥ����2�� ��ȯ, NULL�̸� 
                               ǥ����3�� ��ȯ
�����ȣ, �޿�, �޿�+���ʽ�, ���ʽ� ��ȸ

--NULL�� ���Ŀ����ڸ� ����� ������ �ϸ� ������� NULL
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


COALESCE(ǥ����1, ǥ����2,...) : �Է°����� ���� ǥ���ĵ� �� NULL�� �ƴ� ù��° ǥ������ ��ȯ

SELECT (ǥ����1, ǥ����2,...)
FROM ���̺�;

SELECT employee_id,
       COALESCE(salary*commission_pct, salary)
FROM employees;

--�����ȣ, Ŀ�̼� ����, ���ɱ޿�

SELECT employee_id, commission_pct,
       COALESCE(salary+salary*commission_pct, salary)
FROM employees;


SELECT employee_id, commission_pct,
       COALESCE(salary*commission_pct, salary)
FROM employees
ORDER BY employee_id;

NLNVL(���ǽ�)
��ǥ: Ŀ�̼��� 0.2�̸��� ����� ��ȸ (0% �� ���)

SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct < 0.2;

SELECT COUNT(*)
FROM employees
WHERE NVL(commission_pct,0) < 0.2;

SELECT count(*)
FROM employees
WHERE LNNVL(commission_pct >= 0.2);  --????????

NULLIF(ǥ����1, ǥ����2) = NULL �Ǵ� ǥ����1
SELECT �÷�
FROM job_history;

[����] ������ ���۳�¥�� ���ᳯ¥�� ������ ������ NULL, 
        ���� ������ ���Ῥ���� ����ϴ� ������ �ۼ��Ͻÿ�.
��¥ �� = > ���ڵ����� ���� �� ���� ����
SELECT employee_id, 
       TO_CHAR (start_date, 'YYYY') AS start_date,
       TO_CHAR (end_date,'YYYY')AS end_date
    FROM job_history;

---->>> NULLIF(����⵵, ���۳⵵)

SELECT employee_id, 
       TO_CHAR (start_date, 'YYYY') AS start_year,
       TO_CHAR (end_date,'YYYY')AS end_year,
       NULLIF(TO_CHAR (end_date,'YYYY'), TO_CHAR (start_date, 'YYYY')) nullif_year
FROM job_history;


DESC job_history;

--��Ÿ�Լ�

GREATEST(ǥ����1,expr2...): ���� ū ��
LEAST(expr1, expr2....): ���� ���� ��

SELECT GREATEST(1, 2, 3, 4, 5),
        LEAST(1, 2, 3, 4, 5)
FROM DUAL;

SELECT GREATEST(1+8, 2, 3, 4, 5),
        LEAST(1, 2, 3, 4, 5)
FROM DUAL;
-- ���ĺ� ������� ���� ���ĺ��� greatest, �ѱ۵� ����
SELECT GREATEST('apple', 'banana', 'orange', 'mango'),
        LEAST('apple', 'banana', 'orange', 'mango')
FROM DUAL;

SELECT GREATEST('ȫ�浿', '���缮', '��Ư', '����ȣ'),
        LEAST('ȫ�浿', '���缮', '��Ư', '����ȣ')
FROM DUAL;


DECODE(ǥ����, ��1, ���1, ��2, ���2, ..., �⺻��)

SELECT prod_id, channel_id,
       DECODE(channel_id, 3, '�̸�Ʈ', 9, '���׸�Ʈ', 5, 'Ʈ���̵�', 4,
       'Ƽ��', '���Ŵ�')
FROM   sales
WHERE rownum < 10;

--4�� �������� 1��

���� Ǭ �� --1
SELECT LPAD(phone_number, 16, '(02)')
FROM employees;

���� Ǭ �� --2 �ٸ� ���ɼ�??
SELECT REPLACE(phone_number, '011', '(02)'), 
        REPLACE(phone_number, '650', '(02)')
FROM employees;

Ǯ��
--LPAD(���ڿ�1, ����, ���ڿ�2)
SELECT phone_number,
       LPAD(SUBSTR(phone_number, 5, 12), 12, '(02)')
FROM employees;

--���ڿ�����
SELECT phone_number,
       '(02)' || SUBSTR(phone_number, 5, 12)
FROM employees;

--CONCAT (����, ����)
SELECT phone_number,
        CONCAT('(02)', SUBSTR(phone_number, 5, 12))
FROM employees;

������̺�(employees)����
phone_number��� �÷���
����� ��ȭ��ȣ�� ###.###.#### ���·� ����
���� ������ȣ�� (02)�� �ٿ� ��ȭ��ȣ�� ���

���̺� employees
�÷�  phone_number
����
���
���ڿ� �κ�
�ٿ�

COMMIT;


--4�� �������� 2 ��
�������ڸ� �������� ��� ���̺��� �Ի����ڸ� ������, 
�ټӳ���� 10�� �̻��� ����� ��� ������ �ۼ�, 
�ټӳ���� ���� ��� �������

�����ȣ ����� �Ի����� �ټӳ��

��������(ASC, ascending order) 1 > 2 > 3 > 4
��������(DESC, descending order) 4 > 3 >2 > 1
��)
�������� : ORDER BY �����÷� ASC;
�������� : ORDER BY �����÷� DESC;

SELECT employee_id, emp_name, hire_date
FROM employees
WHERE employee_id IN (SELECT employee_id FROM job_history)
;

SELECT employee_id, 
       TO_CHAR (start_date, 'YYYY') AS start_year,
       TO_CHAR (end_date,'YYYY')AS end_year
FROM job_history;


Ǯ�̹��

1.�����ؼ�
> ����ã��(����): ����� ������/ �Լ�Ȯ��,
> �����и�, ����� ���̺�/�÷�/����Ȯ��



�������ڸ� �������� SYSDATE
��� ���̺�employees �� �Ի�����hire_date�� ������,  
�ټӳ���� 10�� �̻��� ����� ��� ������ �ۼ�, 
  �ټ��ϼ�: ��������(SYSDATE)-��������hire_date 365�� = 1��
  365��/365=1��
  500��/365=1.xx�� > �Ҽ��� �߶󳻱� (FLOOR/TRUNC) / �ø�CEIL / �ݿø� ROUND
�ټӳ���� ���� ��� �������

���̺�: employees
�÷�: �����ȣ ����� �Ի����� �ټӳ��
����:
�Լ�: 

SELECT �÷�
FROM ���̺�
WHERE �ټӳ��(SYSDATE - hire_date) >= 10
ORDER BY �����÷� DESC;


SELECT employee_id, emp_name, hire_date, 
        ROUND((SYSDATE - hire_date) / 365)
FROM employees
WHERE ROUND((SYSDATE - hire_date) / 365) >= 10
ORDER BY ROUND((SYSDATE - hire_date) / 365) DESC
;

SELECT employee_id �����ȣ, emp_name �����, hire_date �Ի�����, 
        ROUND((SYSDATE - hire_date) / 365) �ټӳ��
FROM employees
WHERE ROUND((SYSDATE - hire_date) / 365) >= 10
ORDER BY ROUND((SYSDATE - hire_date) / 365) DESC
;


--4�� 3������

�����̺� �� ��ȭ��ȣ �÷�. �� �÷����� '###-###-####' �ε�
- ��� / �� �ٲ۴� �������

SELECT cust_main_phone_number, 
       REPLACE(cust_main_phone_number, '-', '/') new_phone_number
FROM customers;

Ǯ�̹��

�ٲ� > REPLACE (���ڿ�, �����, �ٲܹ���)
��� > SELECT

���̺�: customer
�÷�: cust_main_phone_number
�Լ�: REPLACE (���ڿ�, �����, �ٲܹ���)

--4�� ����4
�� ���̺�(customer)�� �� ��ȭ��ȣ �÷�(ust_main_phone_number)�� 
�ٸ� ���ڷ� ��ü ������ ��ȣȭ�� �ؼ� ���� �ۼ�

SELECT cust_main_phone_number, 
       TRANSLATE(cust_main_phone_number, '01234568-', 'iloveyou*') new_phone_number
FROM customers;


Ǯ�̹��

��ü ��ȣȭ > TRANSLATE
���� > SELECT? UPDATE???


UPDATE ���̺�
SET �÷�1 = ���氪1,
    �÷�2 = ���氪2 
;

UPDATE customers
SET cust_main_phone_number = TRANSLATE(cust_main_phone_number, '01234568-', 'iloveyou*')
;

UPDATE customers
SET cust_main_phone_number = TRANSLATE(cust_main_phone_number, 'iloveyou*', '01234568-')
;

COMMIT;


4�� 5������

�����̺� customers���� ���� ����⵵ cust_year_of_birth �÷��� �ִ�
��������sysdate �������� �� �÷��� Ȱ���� 30, 40, 50�� ������ ��� �������� ��Ÿ�� ���

���̺� customers, ABS(SYSDATE - cust_year_of_birth =
���� NVL2(SYSDATE - cust_year_of_birth

SELECT cust_year_of_birth, ABS(SYSDATE YYYY- cust_year_of_birth)
FROM customers;

SELECT cust_year_of_birth, ROUND(SYSDATE - cust_year_of_birth)
FROM customers;


SELECT cust_year_of_birth
CASE WHEN SYSDATE - cust_year_of_birth >= 30 THEN '30��',
     WHEN SYSDATE - cust_year_of_birth >= 40 THEN '40��',
     WHEN SYSDATE - cust_year_of_birth >= 50 THEN '50��',
     ELSE '��Ÿ'
END
FROM customers;



Ǯ�̹��

SELECT  TO_CHAR(SYSDATE, 'YYYY') ����⵵, cust_year_of_birth ����⵵,
        TO_CHAR(SYSDATE, 'YYYY')-cust_year_of_birth ����
FROM customers;

--TRUNC (n, i) ����

SELECT  TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth), -1) ����,
        TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10) ����
FROM customers;

SELECT DECODE(TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10), 30, '30��', 40, '40��', 5, '50��', '��Ÿ') generation
FROM customers;

SELECT cust_year_of_birth ����⵵,
    DECODE(TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10), 30, '30��', 40, '40��', 5, '50��', '��Ÿ') generation
FROM customers;



--4�� 6�� ���� 
5������ 30-50�� ������ ǥ���ߴµ�, ��� ���ɴ븦 ǥ���ϵ��� ������ DECODE ��� CASE ǥ������ ����

**CASE ǥ����
CASE WHEN ����1 then ��1
     WHEN ����2 then ��2
    ELSE   ��3

SELECT cust_year_of_birth, 
    CASE WHEN TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth = 30 THEN '30��'
         WHEN TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth = 40 THEN '40��'
         WHEN TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth = 50 THEN '50��'
     ELSE '��Ÿ'
END
FROM customers;

SELECT cust_year_of_birth, TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10),
    CASE WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10) = 3 THEN '30��'
         WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10) = 4 THEN '40��'
         WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth)/10) = 5 THEN '50��'
     ELSE '��Ÿ'
END
FROM customers;

Ǯ�̹��


CASE WHEN ������ ���ڸ��� 1�̸� then '10��'
     WHEN ������ ���ڸ��� 2�̸� then '20��'
    ELSE   '50���̻�'

������ ���ڸ� => TRUNC( ����⵵ - ����⵵/10)

����⵵
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR (SYSDATE, 'YYYY')FROM DUAL;

����⵵
SELECT cust_year_of_birth FROM customers;
SELECT (TO_CHAR (SYSDATE, 'YYYY')- cust_year_of_birth) FROM customers;
SELECT TRUNC ((TO_CHAR(SYSDATE, 'YYYY')- cust_year_of_birth) / 10) FROM customers;


SELECT cust_year_of_birth,
       CASE WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth)/10)=1 THEN '10��'
            WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth)/10)=2 THEN '20��'
            WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth)/10)=3 THEN '30��'
            WHEN TRUNC ((TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth)/10)=4 THEN '40��'
 ELSE '50���̻�'
END
FROM customers;

SELECT CASE WHEN TRUNC (TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth) BETWEEN 10 AND 19 THEN '10��'
            WHEN TRUNC (TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth) BETWEEN 20 AND 29 THEN '20��'
            WHEN TRUNC (TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth) BETWEEN 30 AND 39 THEN '30��'
            WHEN TRUNC (TO_CHAR(SYSDATE, 'YYYY') - cust_year_of_birth) BETWEEN 40 AND 49 THEN '40��'
 ELSE '50���̻�'
END
FROM customers;


--5�� �����Լ�
-- COUNT (ǥ����)
SELECT COUNT(expr)
FROM ���̺��;

SELECT COUNT (*)
FROM employees;

SELECT COUNT (employee_id), COUNT (emp_name), COUNT (department_id)
FROM employees;

DISTINCT : ���ϼ� ���� Ȯ��, �ߺ�����

SELECT COUNT(DISTINCT department_id), COUNT(DISTINCT employee_id)
FROM employees;

--SUM(expr)
SELECT SUM(salary), SUM(DISTINCT salary) 
FROM employees;

--SUM(ǥ����)
SELECT SUM(salary)
FROM employees;

-- ǥ���� ������ Ȱ��
SELECT SUM(salary), SUM(salary + salary*0.02), SUM(salary)+SUM(salary)*2/100 --���ξ�, �ۿ� ��갡��
FROM employees;

-- �����Լ� �� �Լ� ���
SELECT SUM(salary + salary*0.02),SUM(salary + ROUND(salary*2/100)) --���ξ�, �ۿ� ��갡��
FROM employees;

-- MIN(ǥ����), MAX(ǥ����)
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

�����ϱ�

SELECT COUNT(cust_year_of_birth), COUNT(DISTINCT cust_year_of_birth)
FROM customers;

SELECT SUM(cust_year_of_birth),  SUM(DISTINCT cust_year_of_birth)
FROM customers;

SELECT AVG(cust_year_of_birth)
FROM customers;

SELECT AVG (ABS (cust_year_of_birth)), 
        AVG (FLOOR (cust_year_of_birth)),
       TRUNC (AVG (cust_year_of_birth)), -- �� �Ҽ������� ������
       SUBSTR(AVG(cust_year_of_birth), 1, 4)
FROM customers;


SELECT TRUNC (AVG (cust_year_of_birth))
FROM customers;


SELECT  SUBSTR(AVG(cust_year_of_birth), 1, 4)
FROM customers;

SELECT MIN(cust_year_of_birth), MAX(cust_year_of_birth)
FROM customers;


4�� ���� �ٽ�Ǯ��
1��
SELECT phone_number, LPAD (SUBSTR(phone_number, 5, 12), 12, '(02)')
FROM employees;

SELECT SUBSTR(phone_number, 5, 12)
FROM employees;

SELECT phone_number, '(02)'||SUBSTR(phone_number, 5, 12)
FROM employees;

SELECT phone_number, CONCAT('(02)', SUBSTR(phone_number, 5, 12))
FROM employees;

2��
�������� ���� SYSDATE
��� ���̺��� �Ի����� ������
�ټӳ���� 10�� �̻��� ���, 
�ټӳ���� ���� ��� ������� ���

SELECT TO_CHAR(SYSDATE, 'DD/MM/YY')
FROM employees;

SELECT ROUND(SYSDATE - hire_date)
FROM employees;  


SELECT ROUND(SYSDATE - hire_date)/365/10 --��� �ڵ����� ���� ������ ��ȯ����??
FROM employees;                     

-- �Ҽ��� ó�� ���?

SELECT employee_id �����ȣ, emp_name �����, hire_date �Ի�����, 
       ROUND(SYSDATE - hire_date)/365/10 �ټӳ��
FROM employees
--WHERE ROUND(SYSDATE - hire_date)/365/10 >= 10
--ORDER BY ROUND(SYSDATE - hire_date)/365 DESC
;


SELECT employee_id �����ȣ, emp_name �����, hire_date �Ի�����, 
       ROUND((SYSDATE - hire_date)/365) �ټӳ�� -- �Ҽ��������� ������ round �ڿ� ()
FROM employees
WHERE ROUND(SYSDATE - hire_date)/365 >= 10
ORDER BY ROUND(SYSDATE - hire_date)/365 DESC
;

-- **GROUB BY �� HAVING ��

-- ** GROUP BY
-Ư�� �׷����� ���� ������ ���� �� ���
-WHERE�� ORDER BY�� ���̿� ��ġ
-�����Լ��� �Բ� ���
-SELECT ������ �����Լ��� ������ ��� �÷��� ǥ������ GROUP by ���� ����ؾ� ��

SELECT  �÷�1, �÷�2, �����Լ�(ǥ����)
FROM    ���̺�
WHERE   ����
GROUP BY �÷�1, �÷�2
ORDER BY  �÷�
;

SELECT  department_id, SUM(salary)
FROM    employees
WHERE   department_id = 70
GROUP BY department_id          --GROUB BY �� �Ἥ �ߺ��Ǵ� �����͸� �ϳ��� ������ 
ORDER BY  department_id
;

<����>

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

--**SQL ��������
--SELECT �÷��� 5
--FROM ���̺�� 1
--WHERE ����    2
--GROUP BY �׷����� 3
--HAVING �׷����� 4
--ORDER BY 6 ;


SELECT SUM(loan_jan_amt)
FROM kor_loan_status;

SELECT period, region, SUM(loan_jan_amt)
FROM kor_loan_status
--WHERE
GROUP BY period, region;
HAVING
ORDER BY

-- �Ⱓ�� ����� �հ�
SELECT period, SUM(loan_jan_amt)
FROM kor_loan_status
GROUP BY period
ORDER BY period ASC  --DESC
;

-- �ѱ�������� ���̺��� 2013�⵵ �Ⱓ���� ����� �հ踦 �Ⱓ����(��������)���� ��ȸ
SELECT period �Ⱓ, TRUNC (SUM(loan_jan_amt)) �����հ�
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period
ORDER BY period ASC  --DESC
;

-- �Ⱓ�� ������ ����� �հ� ��ȸ
SELECT period, region, (SUM(loan_jan_amt))
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, region
ORDER BY period ASC  --DESC
;

-- ������ �Ⱓ�� ����� �հ� ��ȸ
SELECT region, period, (SUM(loan_jan_amt))
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, region --�����������
ORDER BY region
;


SELECT region, TRUNC (SUM(loan_jan_amt))
FROM kor_loan_status
GROUP BY region
ORDER BY SUM(loan_jan_amt) 
;

--**HAVING ��
1.GROUB BY�� �ٷ� ������ ��ġ
2.SELECT ���� ����ߴ� �����Լ��� �̿��� ������ ���

SELECT �÷�1, �÷�2, �����Լ�(ǥ����)
FROM    ���̺�
WHERE   ����
GROUP BY    �÷�1, �÷�2
HAVING �����Լ� �׷�����
ORDER BY    �÷�;

-- 2013�� 11�� �Ⱓ,������ �� �ܾ� ��ȸ
SELECT period, region, SUM(loan_jan_amt) -- ���� ���� �׷��� �׷� �Լ��� �ƴմϴ�
FROM kor_loan_status
WHERE period = '201311'
;

SELECT period, region, SUM(loan_jan_amt)
FROM kor_loan_status
WHERE period = '201311' AND SUM(loan_jan_amt) > 10000 --����: �׷� �Լ��� �㰡���� �ʽ��ϴ�
GROUP BY period, region
ORDER BY region
;

-- 2013�� 11�� �Ⱓ��/������ �� �ܾ��� (100�� �ʰ�) ���� ��ȸ
SELECT period, region, SUM(loan_jan_amt)
FROM kor_loan_status
WHERE period = '201311' 
GROUP BY period, region
HAVING SUM(loan_jan_amt) > 10000
ORDER BY region
;

-- ROLLUP ��
SELECT �÷�1, �÷�2, �����Լ�(ǥ����)
FROM  ���̺�
WHERE   ����
GROUP BY �÷�1, �÷�2
ORDER BY �÷�
;

SELECT  period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY ROLLUP(period, gubun) -- ���п� ���ؼ�????????
;

--ǥ���� 2 �� - 2+ 1 ����
SELECT  period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY ROLLUP(gubun, period)
;

-- ǥ���� 1�� > 1+1 ����
SELECT  period, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY ROLLUP(period)
;

-- ǥ���� 3�� > 3+1 ����
SELECT  period, gubun, region, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY ROLLUP(gubun, period, region)
;


SELECT  �÷�1, �÷�2, �����Լ�(ǥ����)
FROM    ���̺�
WHERE   ����
GROUP BY ROLLUP(ǥ����1, ǥ����2)
;

--����(partial) ROLLUP
ROLLIP�� ����� ����: 2+1 ����
(ǥ����2, ǥ����3)
(ǥ����2)
(��ü)
SELECT  �÷�1, �÷�2, �����Լ�(ǥ����)
FROM    ���̺�
WHERE   ����
GROUP BY ǥ����1, ROLLUP(ǥ����1, ǥ����2)
;
------------------------------------------
ROLLIP�� ����� ����: 1+1 ����
(ǥ����1, ǥ����2)
(ǥ����1)
;

SELECT  gubun, period, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY gubun, ROLLUP(period)
;

-- CUBE

SELECT  �÷�
FROM    ���̺�
WHERE   ����
GROUP BY �׷��÷�
;

ǥ����1���϶� but cube�� �Ⱦ�������,
SELECT  gubun
FROM    kor_loan_status
WHERE   gubun = '��Ÿ����'
GROUP BY gubun
;

SELECT  gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   gubun = '��Ÿ����'
GROUP BY gubun
;

ǥ����1���϶� with CUBE

SELECT  gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   gubun = '��Ÿ����'
GROUP BY CUBE(gubun)
;

--ǥ����2���϶� wth CUBE - cube�� period�� ��������,
SELECT  period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   gubun = '��Ÿ����'
GROUP BY CUBE(period, gubun)
;

--- cube�� gubun�� ��������,
SELECT  period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   gubun = '��Ÿ����'
GROUP BY CUBE(gubun, period)
;
-->>> ������ �ٸ��� �ص� ������ ���뿡 ���̰� ���� ���� 

SELECT  period, gubun, region, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   gubun = '��Ÿ����'
GROUP BY CUBE(gubun, period, region)
;

--���տ�����
--���� ǰ�� ���� ���̺� ����
CREATE TABLE exp_goods(
        Country VARCHAR2(10),
        seq     NUMBER,
        Goods   VARCHAR2(80)
    );
    
INSERT INTO exp_goods VALUES ('�Ϻ�', 1, '�ڵ���');
INSERT INTO exp_goods VALUES ('�Ϻ�', 2, '�ڵ�����ǰ');
INSERT INTO exp_goods VALUES ('�Ϻ�', 3, '��������ȸ��');
INSERT INTO exp_goods VALUES ('�Ϻ�', 4, '����');
INSERT INTO exp_goods VALUES ('�Ϻ�', 5, '�ݵ�ü������');
INSERT INTO exp_goods VALUES ('�Ϻ�', 6, 'ȭ����');
INSERT INTO exp_goods VALUES ('�Ϻ�', 7, '�������� ������');
INSERT INTO exp_goods VALUES ('�Ϻ�', 8, '�Ǽ����');
INSERT INTO exp_goods VALUES ('�Ϻ�', 9, '���̿���, Ʈ��������');
INSERT INTO exp_goods VALUES ('�Ϻ�', 10, '����');

COMMIT;

--����ǰ ���̺��� ������ �ѱ��� ��ǰ�� ��� ��ȸ
--(��, ǰ�� ��ȣ ������� ��ȸ�� ��, ��������)

SELECT *
FROM exp_goods
WHERE country = '�ѱ�'
ORDER BY seq ASC;

SELECT goods
FROM exp_goods
WHERE country = '�ѱ�'
UNION
SELECT goods
FROM exp_goods
WHERE country = '�Ϻ�'
ORDER BY 1;

SELECT goods
FROM exp_goods
WHERE country = '�ѱ�'
UNION ALL
SELECT goods
FROM exp_goods
WHERE country = '�Ϻ�'
ORDER BY 1;


--�ѱ��� �����ϴ� ǰ��
SELECT goods
FROM exp_goods
WHERE country = '�ѱ�'
MINUS
SELECT goods
FROM exp_goods
WHERE country = '�Ϻ�'
ORDER BY 1;

--�Ϻ��� �����ϴ� ǰ��
SELECT goods
FROM exp_goods
WHERE country = '�Ϻ�'
MINUS
SELECT goods
FROM exp_goods
WHERE country = '�ѱ�'
ORDER BY 1
;

<���ǻ���>
1 SELECT ����Ʈ�� ���� �� ������Ÿ����ġ
2 ORDER BY ���� ������ SELECT �������� ��� ����

SELECT  Į��1, �÷�2 
FROM    ���̺�
WHERE   ����

UNION

SELECT  Į��1, �÷�2
FROM    ���̺�
ORDER BY �÷�
;
--UNION 
--UNION ALL

--INTERSECT
������ ����
�� �� �̻��� ���� select ������ ����
���� select ���� ��ȯ ��� �� �ߺ��� ���� ������ ���� ���� ��� ����

---MIUNS
������
�� �� �̻��� ���� select ������ ����
���� select ���� ��ȯ ��� �� �ߺ��� ���� ������ ���� ���� ��� ����

--���� ������ ���ѻ���
--���� select ������ select����Ʈ ������ ������ Ÿ���� ��ġ�ؾ���
order by���� �� ������ ���� select ������
BLOB, CLOB, BFILE ���� LOB Ÿ�� �÷��� ����
union, intersect, minus �����ڴ� long


SELECT  Į��1, �÷�2 --select ���� �÷��� ������ Ÿ���� ��ġ 1���ѻ���
FROM    ���̺�
WHERE   ����
GROUP BY �׷��÷�
HAVING   �׷�����
--ORDER BY �߰��� ���� �ʰ� �������� ���� 2���ѻ���
���տ�����
SELECT  Į��1, �÷�2
FROM    ���̺�
ORDER BY �÷�
;

--5�� 1������ - OK

������̺��� �Ի�⵵�� ��� ���� ���ϴ� ������ �ۼ�

������̺� employees
�Ի�⵵ hire_date
��� �� �⵵���� �� ���??
--���� Ǭ ��
SELECT TO_CHAR(hire_date, 'YYYY'), COUNT(employee_id)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

--<Ǯ�̹��>
1.�����ؼ�
>���� �и�, ����� ���̺�/�÷�/����Ȯ��
>���� ã��(����): ����� ������/�Լ�Ȯ��
2. ������ (���̺�, CRUD) �� ������ �ۼ�
3. ���� �ؼ� ������ �����ͺ��̽� ������ �°� ����
4. �ռ� �ۼ��� ������ ������ �°� ����
5. ��� �׽�Ʈ
6. ���� �߻��� ����Ȯ��(�����߻���İ���)
7. ��� �� �׽�Ʈ

SELECT  �÷�
FROM    ���̺�
WHERE   ����
GROUP BY �׷��÷�
HAVING  �׷�����
ORDER BY �÷�
;

������̺���
�Խó⵵�� > ������ ���� TO_CHAR(��, ����)
������� ���ϴ� > COUNT(�÷�)

���̺�: employees
�÷�: hire_date
�Լ�(����): TO_CHAR(��, ����), COUNT(Į��)


--5�� 2������ --OK
kor_loan_status ���̺��� 2012�⵵ ����, ������ ���� �� �ܾ��� ���ϴ�
������ �ۼ�����
--���� Ǯ��
���̺� kor_loan_status
�÷�: 2012�⵵ ���� MM, ����, ���� �� �ܾ�
�Լ�: SUM
����: 2012

SELECT period, region, SUM(loan_jan_amt)
FROM kor_loan_status
WHERE period LIKE '2012%'
GROUP BY period, region
ORDER BY 1
;

--5�� 3������
�Ʒ� ������ rollup�� ��������ʰ�, ���� �����ڷ� ������ ����� 
�������� ������ �ۼ��ض�


--�õ�1
SELECT period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY  GROUPING SETS(period, gubun);


--�õ� 2
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

--�õ� 3 - ��� �� �Ⱓ�� ���հ踦 ���ұ�??
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

<Ǯ�̹��>

--���뺰 ������ ���
1. (�Ⱓ, ����)�� ���� �����Ѿ�
2.(�Ⱓ)�� ���� �����Ѿ�

���տ����ڸ� ����ؼ� > 4����: UNION, UNION ALL, INTERSECT, MINUS
������ ����� �������� > SELECT 

SELECT  period, gubun, SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY period, gubun
UNION
SELECT  period, '', SUM(loan_jan_amt)
FROM    kor_loan_status
WHERE   period LIKE '2013%'
GROUP BY period        ---gubun �� ���� ���ش�????
;

--> NULL���� ��� > NULL �Ǵ� ''

--��ģ�κ�
--1. NULL ���� select���� �־���ϰ�, �׷���̿� period �� �־��ش�




--5�� 4������

SELECT period,
    CASE WHEN gubun = '���ô㺸����' THEN SUM(loan_jan_amt) 
    ELSE 0 END ���ô㺸�����,
    CASE WHEN gubun = '��Ÿ����' THEN SUM(loan_jan_amt) 
    ELSE 0 END  ��Ÿ�����
FROM kor_loan_status
WHERE period = '201311'
GROUP BY period, gubun;

���� ����� ���տ����ڷ� ������ ����� �����ϴ� ������ �ۼ�����

--���� Ǯ��

--2013�� 11�� ��Ÿ����� �� �հ� + ���ô㺸�����

SELECT period, 0 ���ô㺸�����, SUM(loan_jan_amt) ��Ÿ�����
FROM kor_loan_status
WHERE period = '201311'
    AND gubun = '��Ÿ����'
GROUP BY period

UNION

SELECT period, SUM(loan_jan_amt) ���ô㺸�����, 0 ��Ÿ�����
FROM kor_loan_status
WHERE period = '201311'
    AND gubun = '���ô㺸����'
GROUP BY period
;
--�÷��� ��� �� ���� ����??? >> 0 ���ô㺸�����
-- ���� null�� �ƴ϶� 0


--5�� ���� 5��

SELECT region, SUM(loan_jan_amt) "201111", 
        0 "201112", 0 "201210", 0 "201212", 0 "201310", 0 "201311"
FROM kor_loan_status
WHERE period = '201111'
GROUP BY region
;

SELECT region ����, 
    CASE WHEN period = '201111' THEN SUM(loan_jan_amt) ELSE 0  END "201111",
    CASE WHEN period = '201112' THEN SUM(loan_jan_amt) ELSE 0  END "201112"
  FROM kor_loan_status
WHERE period = '201111' 
GROUP BY region, period
ORDER BY 1
;


<����Ǯ��>

���̺� kor_loan_status
�÷� region, �÷�"201111", 201112, 201210,
����
�Լ�: SUM(loan_jan_amt)


--<1���> SUM �� CASE �� ��ø 
SELECT region ����, SUM(CASE WHEN period = '201111' THEN loan_jan_amt ELSE 0 END)"201111",
               SUM(CASE WHEN period = '201112' THEN loan_jan_amt ELSE 0 END)"201112",
               SUM(CASE WHEN period = '201210' THEN loan_jan_amt ELSE 0 END)"201210",
               SUM(CASE WHEN period = '201211' THEN loan_jan_amt ELSE 0 END)"201211",
               SUM(CASE WHEN period = '201212' THEN loan_jan_amt ELSE 0 END)"201212",
               SUM(CASE WHEN period = '201310' THEN loan_jan_amt ELSE 0 END)"201310",
               SUM(CASE WHEN period = '201311' THEN loan_jan_amt ELSE 0 END)"201311"
FROM kor_loan_status
GROUP BY region
ORDER BY 1;


--SELECT region ����, CASE WHEN period = '201111' THEN SUM(loan_jan_amt) ELSE 0 END "201111",
--               CASE WHEN period = '201112' THEN SUM(loan_jan_amt) ELSE 0 END"201112",
--               CASE WHEN period = '201210' THEN SUM(loan_jan_amt) ELSE 0 END"201210",
--               CASE WHEN period = '201211' THEN SUM(loan_jan_amt) ELSE 0 END"201211",
--               CASE WHEN period = '201212' THEN SUM(loan_jan_amt) ELSE 0 END"201212",
--               CASE WHEN period = '201310' THEN SUM(loan_jan_amt) ELSE 0 END"201310",
--               CASE WHEN period = '201311' THEN SUM(loan_jan_amt) ELSE 0 END"201311"
--FROM kor_loan_status
--GROUP BY region, loan_jan_amt
--ORDER BY 1;

--���� ��ģ ��, case���� ������ sum�� ������ ������ ���ߴ�

--<2���> SELECT ��ø/Ȱ��
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

--6��
*****SQL(DML) �ſ��߿�
CRUD: ����Ʈ��� ������ �⺻���� �����͸� ó�� ��� <������Ʈ���� ���� ���� ����...>
Create(����) Read(�б�) Update(����) Delete (����)

Create(����) > INSERT
Read(�б�)  > SELECT
Update(����) > UPDATE
Delete (����) > DELETE

*****����: ���̺��� ���踦 �δ� ���

1.��������

1)��������
- ���� �⺻���̰� �Ϲ����� ���ι��
- where ������ ��ȣ= �����ڸ� ����� 2���̻��� ���̺��̳� �並 ������ ���� > ��������
- �÷� ����(������)�� �������� ���
- SELECT *
  FROM TAB1 a, TAB2 b
  WHERE a.col1 = b.col1
  
SELECT  T1.�÷�, T2.�÷� 
FROM    ���̺�1 T1, ���̺�2 T2
WHERE   T1.�÷��� = T2.�÷��� (�����̸��� ������ �ִ� �÷���) --��������
;
  
SELECT  *
FROM    employees T1, departments T2
WHERE   T1.manager_id = T2.manager_id 
;
 
SELECT  T1.employee_id
FROM    employees T1, departments T2
WHERE   T1.manager_id = T2.manager_id 
; 
--�μ���ȣ�� �������� 2���� ���̺��� ���� �����ϰ�. 
--������̺�, ����̸�, �μ���ȣ�� �μ����̺��� �μ��̸� �÷��� ��ȸ
SELECT  a.employee_id, a.emp_name, a.department_id, b.department_id
FROM    employees a, departments b
WHERE   a.department_id = b.department_id --��������
; 

2)��������: ������������ �����ϴ� �����͸� ������������ ����
EXISTS ������
: ���ǿ� �����ϴ� �����Ͱ� �ϳ��� ������ ��� ��ȯ

SELECT  �÷�
FROM    ���̺�1    
WHERE   EXISTS( SELECT  �÷�
                FROM    ���̺�2
                WHERE   �������� ���̺�1.�÷� = ���̺�2.�÷�
);

--�μ���ȣ, �μ��̸� ��ȸ

SELECT  d.department_id, department_name
FROM   departments d 
WHERE   EXISTS( SELECT  *
                FROM    employees e
                WHERE   d.department_id = e.department_id
);


--IN ������: ���������� ����, �Ϲ����� ������ ���� ����
: OR �������ڸ� ����� ���¿� ����.
Ư¡
1. where ���� ���������� ����
2. IN ���� �������� �÷��� �������� �������� ��õ� �÷��� ����/ �������� where���� = ���������� select
3. �������� select �� ��Ī�� ����, �̹� ������������ ���� ��� ������

SELECT
FROM
WHERE   �÷� IN ( SELECT �÷�
                  FROM  ���̺�
                  WHERE ����
                  );

SELECT  *
FROM    employees e
WHERE   d.manager_id = e.manager_id --����
;

������̺��� �޿��� 3000���� �̻��� ����� �μ���ȣ�� ��ȸ��
�μ����̺��� �μ���ȣ�� ������ ���ԵǾ� ������ �μ���ȣ�� �μ��̸��� ������ ������ �ۼ�

SELECT  department_id, department_name      --��Ī�ʿ� ����
FROM    departments d 
WHERE   d.department_id IN ( SELECT e.department_id   -- ���� �÷����� ���ؾ��Ѵ�
                            FROM  employees e 
                            WHERE e.salary > 13000
                  );
--�����ϴ�����?? �ٸ����̺� ������ �ֱ� ������~


SELECT  *
FROM    employees e
WHERE   e.salary > 13000
;



�������� : ������ ���� �μ� ��ȣ ��ȸ
SELECT department_id
FROM departments
WHERE manager_id is null;

�������� (���� ����): ������̺�� �μ����̺��� (
������ ���� �μ���ȣ�� ��ȸ�� ���������� ����� ��ġ�ϸ�)�����ȣ,�̸�,��ȣ �� �μ����� ��ȸ

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

--��Ƽ����: ��������(EXISTS, IN)�� �ݴ밳��, �տ� NOT�� �ٿ� ����Ѵ�
--NOT IN

SELECT e.employee_id, e.emp_name, e.department_id, d.department_name
FROM    employees e, departments d
WHERE e.department_id = d.department_id
    AND e.department_id NOT IN (SELECT d.department_id
                        FROM departments d
                        WHERE d.manager_id is null)
;

--NOT EXISTS

��������
SELECT  *
FROM    departments
WHERE   manager_id is null
;

��������
������ ���� �μ��� �������� �ʴ� �����Ϳ��� ��� ������ ��ȸ

SELECT  employee_id, emp_name, department_id
FROM    employees e
WHERE   NOT EXISTS (SELECT  *
                FROM    departments d
                WHERE   manager_id is null
            AND e.department_id = d.department_id)
;

--��������
��뿹��

SELECT  employee_id, emp_name, manager_id
FROM    employees
WHERE   salary > 9000 and salary < 11000
;

SELECT
FROM    employees e1, employees e2
WHERE   el.manager_id = e2.employee_id
;

2.�ܺ�����
-�Ϲ������� Ȯ���� ����
- �������ǿ� �����ϴ� ������ �Ӹ� �ƴ϶�, ��� �� �� ���̺� ���� ���ǿ� ��õ�
�÷����� ���ų�(null) �ش� �ο찡 �ƿ� ������ �����͸� ��� ����1
- �������ǿ��� �����Ͱ� ���� �� ���̺� �÷� ���� (+)�� ���δ�
- ���������� �������� ��� ��� �������ǿ� (+)�� �ٿ����Ѵ�


<�Ϲ�����>
��������: �����÷��� ���� �����ϰ� �� ���� ������
SELECT  d.department_id, d.department_name, j.job_id, j.department_id
FROM    departments d, job_history j
WHERE   d.department_id = j.department_id
;
<�ܺ�����>
Ư¡: 
-�����÷��� ���� ��������(�ش�Ǵ� null�� ������) �ʰ� �� ���� ����
- �ܺ������� �� �������� 2�� �̻��� ���, ��� ���� ���ǿ� (+) ǥ�ø� �� ��
null�� ó���� ���� ���Խ��� �����ֱ� ������~
- (+) �����ڰ� ���� ���ǰ� OR �� IN �����ڸ� ���� ��� �Ұ�
- �ѹ��� �� ���̺��� �ܺ����� ����

SELECT  d.department_id, d.department_name, j.job_id, j.department_id
FROM    departments d, job_history j
WHERE   d.department_id = j.department_id(+)
;

�����÷��� �ƴ� �÷��� (+) ǥ��, �� �� ���� ���Ե�
SELECT  e.department_id, e.emp_name, j.job_id, j.department_id
FROM    employees e, job_history j
WHERE   e.employee_id = j.employee_id(+)
;


SELECT  e.department_id, e.emp_name, j.job_id, j.department_id
FROM    employees e, job_history j
WHERE   e.employee_id = j.employee_id(+)  -- ���� �������� (+)�ǹ̰� ����
    and e.department_id = j.department_id
;

�ܺ������� �� �������� 2�� �̻��� ���, ��� ���� ���ǿ� (+) ǥ�ø� �� ��
null�� ó���� ���� ���Խ��� �����ֱ� ������~

SELECT  e.department_id, e.emp_name, j.job_id, j.department_id
FROM    employees e, job_history j
WHERE   e.employee_id = j.employee_id(+) 
    and e.department_id = j.department_id(+) 
;

(+) �����ڰ� ���� ���ǰ� OR �� IN �����ڸ� ���� ��� �Ұ�
--���� ���� � (+)�� OR �Ǵ� IN�� ������� ������� �ʽ��ϴ�
SELECT  e.department_id, e.emp_name, j.job_id, j.department_id
FROM    employees e, job_history j
WHERE   e.employee_id = j.employee_id(+) 
    or e.department_id = j.department_id(+) 
;


3.ANSI ����
<����Ŭ ���� : �������� >
SELECT  T1.�÷�, T2�÷�
FROM    ���̺� T1, ���̺� T2
WHERE   T1�÷� = T2�÷�
;

<ANSI ����>
SELECT  T1.�÷�, T2�÷�
FROM    ���̺� T1
INNER JOIN ���̺�2 T2
ON  T1�÷� = T2�÷�
WHERE ���� 
;

<ANSI ����>
SELECT  e.employee_id, d.department_name, e.hire_date
FROM    employees e
INNER JOIN  departments d
ON  e.department_id = d.department_id
WHERE    e.hire_date >= TO_DATE('2003-01-01') -- ���ڿ����� ��¥Ÿ������ ��ȯ
ORDER BY 3;

<����Ŭ ���� : �������� >
SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id = d.department_id
;


ANSI �ܺ�����
<����Ŭ ����: �ܺ�����>
SELECT  a.�÷�1, a�÷�2, b.�÷�.1, b.�÷�2
FROM    ���̺� a, ���̺� b
WHERE   a.�÷�1 = b.�÷�
;

<ASNI �ܺ�����>
SELECT  a.�÷�1, a�÷�2, b.�÷�.1, b.�÷�2
FROM    ���̺� a
LEFT (RIGHT) [OUTER] JOIN ���̺� b
ON (a.�÷�1 = b.�÷�)
WHERE...
;

--(+)�� �ǹ̴� ������, (+) �� ���� ������� �ݴ�ȴ�
SELECT  a.emp_name, b.job_id
FROM    employees a LEFT OUTER JOIN job_history b  
-- LEFT OUTER JOIN ���ʿ� �ִ� ���̺� employees�� �������� ��´�, RIGHT �� ��� job_history���̺� 
--�׷��Ƿ� �������̺��� �� ���� �������� null���� ���� �� �ִ�
ON (a.employee_id = b.employee_id)
;

SELECT  a.emp_name, b.job_id
FROM    employees a 
RIGHT OUTER JOIN job_history b  
ON a.employee_id = b.employee_id
 AND a.department_id = b.department_id
 ;

--ANSI CROSS ����
<����Ŭ ����: īŸ�þ� ����>
SELECT  a.employee_id, a.emp_name, b.department_id, b.department_name
FROM    employees a, departments b;

<ANSI CROSS ����>
SELECT a.employee_id, a.emp_name, b.department_id, b.department_name
FROM    employees a
CROSS JOIN  departments b;


ANSI FULL OUTER ����

DROP TABLE ex4_1;

CREATE TABLE dep4_1(
        dep_id      VARCHAR(10),
        dep_name    VARCHAR(20),
        manager_id VARCHAR(10)
);

INSERT INTO emp4_1 VALUES('100', '���缮', '10');
INSERT INTO emp4_1 VALUES('101', '��ȣ��', '20');
INSERT INTO emp4_1 VALUES('102', '�豸��', '50');
INSERT INTO emp4_1 VALUES('103', '����ö', '30');
INSERT INTO emp4_1 VALUES('105', '�̰��', '50');
INSERT INTO emp4_1 VALUES('106', '�ڳ���', '60');

DELETE dep4_1 
WHERE dep_id >= 100 and dep_id <= 106;

CREATE TABLE emp4_1(
        emp_id      VARCHAR(10),
        emp_name    VARCHAR(20),
        department_id VARCHAR(10)
);

ALTER TABLE emp4_1 RENAME COLUMN department_id to dep_id;
--�⺻
SELECT  e.emp_name, d.dep_id
FROM    emp4_1 e, dep4_1 d
WHERE   e.dep_id = d.dep_id;

SELECT  e.emp_name, d.dep_id
FROM    emp4_1 e
FULL OUTER JOIN dep4_1 d
ON  e.dep_id = d.dep_id;

COMMIT;



4. ��������: SQL ���� �� ������ ���Ǵ� �ٸ� SELECT ��

-�������� �������� ����: �������� ����

SELECT�� > ��������
FROM��   > �ζ��κ�
WHERE��  > ��ø����

<��������>
SELECT  AVG(salary)
FROM    employees
--WHERE   ����
;

1) ���������� ��������
<��������>: �� �޿��� ��� �Ʒ����� ������
�� �����(107) ��� �� ���� (51��)
SELECT  count(*)
FROM    employees
WHERE   salary >= (SELECT  AVG(salary) FROM    employees)
;


<��������>: ��޺μ��� ���� �μ���ȣ ��ȸ

SELECT  department_id
FROM    departments
WHERE   parent_id is null
;


<��������>: ��޺μ��� ����  �μ��� ���� ��ȸ

SELECT COUNT(*)
FROM    departments
WHERE   department_id NOT IN (SELECT  department_id
                            FROM    departments 
                            WHERE   parent_id is null)
;

<��������>: ������̺�κ��� �����ȣ�� ������ȣ ��ȸ
SELECT  employee_id, job_id
FROM    job_history;


<��������>: ������̺��� ����̸��� ��Ī, �����ȣ�� ������ȣ�� ��ȸ
--���ÿ� 2���� �÷� ���� ������ ���
SELECT  emp_name, employee_id, job_id
FROM    employees
WHERE   (employee_id, job_id) IN (SELECT  employee_id, job_id
                                   FROM    job_history)
;
1���� �÷� ���� ������ ���
SELECT  emp_name, employee_id, job_id
FROM    employees
WHERE   employee_id IN (SELECT  employee_id
                                   FROM    job_history)
;

COMMIT;

������̺��� �޿��� ������ �����ϰ� ��ձ޿��� ����
UPDATE  employees
SET    salary = (SELECT AVG(salary) FROM employees) --���γֱ�
;

��ձ޿����� ���� �޴� ��� ����

SELECT COUNT(*) FROM employees;


DELETE  employees
WHERE   salary > (SELECT AVG(salary) FROM employees)
;

ROLLBACK;

2) ������ �ִ� ��������

<��������>: ������̺��� �μ���ȣ ��ȸ

SELECT  department_id
FROM    job_history;


<��������>: ������̺��� ��ȸ�� �μ���ȣ�� �μ���� �Բ� ��ȸ
SELECT  department_id, department_name
FROM    departments d
WHERE   EXISTS (SELECT department_id
                FROM    job_history j
                WHERE d.department_id = j.department_id);



<��������1> ������̺��� ����� ��ȸ 107��
SELECT  emp_name
FROM    employees;
WHERE   

<��������2>  �μ��� ��ȸ 27��
SELECT  department_name
FROM    departments;
WHERE

<��������>  �����ȣ, �����, �μ���ȣ, �μ���
SELECT  employee_id,
        (SELECT  e.emp_name 
         FROM employees e
         WHERE  e.employee_id = j.employee_id ) emp_name, --���ξȿ� (��������,��������)��Ī
        department_id,
        (SELECT  d.department_name 
         FROM departments d
         WHERE d.department_id = j.department_id)department_id
FROM    job_history j;


<��������1> ������̺��� ��ձ޿���ȸ

SELECT AVG(salary)
FROM employees;

<��������2> ��ձ޿� ���� �����޿��� �޴� ����� �μ���ȣ ��ȸ
    
SELECT  department_id
FROM    employees
WHERE   salary > (SELECT AVG(salary) FROM employees)
--GROUP BY department_id
;

<��������> ��ձ޿� ���� �����޿��� �޴� ����� �μ���ȣ�� ��Ī�Ǵ� �μ��� ��ȸ

SELECT  d.department_name, d.department_name
FROM    departments d
WHERE    EXISTS (SELECT  department_id
                FROM    employees e
                WHERE   e.department_id = d.department_id
                   AND e.salary > (SELECT AVG(salary) FROM employees))
                                   
;

<��������1> �μ����̺��� �����μ�(��ȣ)�� 90���� �μ���ȣ ��ȸ
SELECT  department_id
FROM    departments
WHERE   parent_id = 90;

<��������2> ������̺��� �����μ�(��ȣ)�� 90���� �μ���ȣ, ��ձ޿� ��ȸ

SELECT  e.department_id, AVG(e.salary)
FROM    employees e, 
        departments d
WHERE   d.parent_id = 90
    AND  e.department_id = d.department_id 
GROUP BY   e.department_id
;

<��������3> (������̺��� �����μ�(��ȣ)�� 90���� �μ���ȣ, ��ձ޿�)���� ��ձ޿��� ����

SELECT  avg_sal
FROM    (SELECT  e.department_id, AVG(e.salary) avg_sal -- ��Ī
            FROM    employees e, departments d
         WHERE   d.parent_id = 90
         AND  e.department_id = d.department_id 
        GROUP BY   e.department_id)
--WHERE
;
 <��������> �����μ��� 90��(��ȹ��)�� ��� ����� �޿��� �ڽ��� �μ��� ��ձ޿��� ����
 
 UPDATE employees
 SET    salary = �μ��� ��ձ޿�
 WHERE  department_id IN (SELECT  department_id
                          FROM    departments
                          WHERE   parent_id = 90)
 ;
 
-- �������� �ֱ� 198p
 UPDATE employees e1
 SET    e1.salary = (SELECT  avg_sal
                     FROM      (SELECT  e.department_id, AVG(e.salary) avg_sal -- ��Ī
                                FROM    employees e, departments d
                                WHERE   d.parent_id = 90
                                  AND  e.department_id = d.department_id 
                              GROUP BY   e.department_id) x1
                    WHERE e1.�÷� = x1.�÷� ���� ����         ) 
 WHERE  department_id IN (SELECT  department_id
                          FROM    departments
                          WHERE   parent_id = 90)
 ;
 COMMIT;
 
 -- WHERE �������� �ֱ�
 UPDATE employees e1
 SET    e1.salary = (SELECT  avg_sal
                     FROM      (SELECT  e.department_id, AVG(e.salary) avg_sal -- ��Ī
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

UPDATE  ������̺� e1
SET     e1.�޿� = (�μ��� ��ձ޿�(��������))
WHERE   e1.�μ���ȣ IN (�����μ��� ��ȹ���� �μ� (��������))
;


--�ζ��κ�: FROM ���� ���������� ���� ���

<��������1> �Ǹſ�, ����Ǹűݾ� ��ȸ >> ������Ǹž�
����1 2000�� 1��~ 2000�� 12������ �Ǹŵ�
����2 ��Ż���ƿ��� �Ǹŵ�

SELECT  sales_month, ROUND (AVG(amount_sold)) month_avg
FROM    sales s, countries t, customers c
WHERE   sales_month BETWEEN '200001' AND '200012'
    AND country_name = 'Italy'
    AND s.cust_id = c.cust_id 
    AND t.country_id = c.country_id 
GROUP BY sales_month
;

����> sales �� countries ���̺��� ������ ���ִ� ����� �÷��� ����!
Ǯ��> �ٸ����̺��� ������ ���� ������� �����



<��������2> �Ǹ����̺�κ��� ����Ǹűݾ׸� ��ȸ >> ������Ǹž�
����1 2000�� 1��~ 2000�� 12������ �Ǹŵ�, 
����2 ��Ż���ƿ��� �Ǹŵ�


SELECT  ROUND (AVG(s.amount_sold)) year_avg
FROM    sales s, countries t, customers c
WHERE   sales_month BETWEEN '200001' AND '200012'
    AND country_name = 'Italy'
    AND s.cust_id = c.cust_id 
    AND t.country_id = c.country_id 
;

--<��������> 2000�� ��Ż���� ��� �����(�����)���� ū ������� �޼��� �� ��� ������� ��ȸ
--
--SELECT  �Ǹſ�, ����Ǹž�
--FROM    ���̺�
--WHERE   ������Ǹž� > ������Ǹž�

--SELECT  a.sales_month, a.month_avg �̷��� �ᵵ �ȴ�
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



6�� 1��: ���������� �� ����, �μ����� ������ �� �Ѱ��� �������?

SELECT e.employee_id, e.emp_name, js.job_title, j.start_date, j.end_date, d.department_name
FROM employees e, job_history j, departments d, jobs js
WHERE e.employee_id = 101
    AND e.department_id = d.department_id
    AND e.employee_id = j.employee_id
--    AND js.job_id = j.job_id
 ;

  
6�� 2��
SELECT a.employee_id, a.emp_name, b.job_id, b.department_id
FROM employees a, 
     job_history b
WHERE a.employee_id = b.employee_id(+) -- (+)�ܺ������� �� �����θ�
 AND a.department_id(+) = b.department_id;

=> �� ���� ���̺��� outer-join �� �� �����ϴ�

SELECT  department_id
FROM    employees
GROUP BY    department_id
ORDER BY    department_id;

SELECT  department_id
FROM   job_history
GROUP BY    department_id
ORDER BY    department_id;
-- employees ���̺� ���� �� ���ͼ� �����÷����� �ش�. 
--�ܺ������� ���� ���� job_histroy �� �ش�


6�� 3��
�ܺ������� �� ��(+)�����ڸ� ���� ����� �� ���µ�
IN���� ����ϴ� ���� �� ���̸� ����� �� �ִ�. �� ������?
--IN �����ڿ� ���� ����

SELECT  employee_id
FROM    employees 
WHERE   e.department_id IN (10, 20, 30);

--���� ���� ���� �ڵ�
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
--�� ���� � (+)�� OR �Ǵ� IN�� ������� ������� �ʽ��ϴ�
<����>
1. �ܺ������� IN�� �Բ� ���� ���(����)
SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id IN ( e.department_id (+), 200) 
;
--������~ ()��ȣ�ȿ� ���� �Ѱ��� �־�� ���� ���� 

2. ���� �ǹ��� �ڵ�(����)
SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id(+) = d.department_id
    OR e.department_id IN  = 200 
;

3. IN�� �����͸� 1���� �ִ� ��� (����)
SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id(+) = d.department_id
    AND e.department_id IN (10) 
;

4.3���� ���� �ڵ� (����)
SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id(+) = d.department_id
 AND e.department_id IN (10) 
;

��) IN���� ����ϴ� ���� 1���� ���
�ǹ̻� OR�� ����� ���� �ƴϹǷ� �ܺ����� ����
--�ܺ����ν� (+) ��ȣ�� � �÷��� �ٿ��� �ұ�?

SELECT  e.employee_id, d.department_name
FROM    employees e, departments d
WHERE   e.department_id(+) = d.department_id
    OR e.department_id =10  
    OR  e.department_id =20
    OR  e.department_id =30
;
                


6�� 4��

SELECT  a.department_id, a.department_name
FROM    departments a
INNER JOIN  employees b
ON  a.department_id = b.department_id
WHERE b.salary > 3000
ORDER BY a.department_name;


6�� 5��

EXISTS > �������� ��: ������ �ִ� ��������
IN  > �������� ��: ������ ���� ��������

SELECT  d.department_id, d.department_name
FROM    departments d, job_history j
WHERE   d.department_id =  j.department_id;

SELECT  d.department_id, d.department_name
FROM    departments d
WHERE   d.department_id IN (SELECT department_id
                            FROM job_history)
 ;

6�� 6��
������ ��Ż���� �ּҸ������� �ּҸ����

SELECT  SUBSTR(s.sales_month,1,4), c.country_name, e.emp_name, MIN(s.amount_sold)
FROM    sales s, employees e, countries c
WHERE   c.country_name = 'Italy'
    AND s.employee_id = e.employee_id
GROUP BY SUBSTR(s.sales_month,1,4), e.emp_name, c.country_name
ORDER BY 1;

--Ǯ�̹��
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
--�̰� ������
--����� �̷��� ����� �ǿ�
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

--8�� PL/SQL
/*
[:=] ������ ���� ���׿� �Ҵ�

**���  
[�̸���] -- CREATE�� �̸�����
[IS(AS)] -- ���ν���, ������Լ��� ����/��� ����
    ������ ������Ÿ��;
DECLARE -- �Ϲ� ���α׷��� ����/��� ����
    �����1
    �����2
BEGIN
    �����1;
    �����2;
[EXCEPTION
    ����ó����]
END;

�Լ�: �Է°��� Ȱ���� Ư�� ������ ���� �� ��� �� ��ȯ
���ν���: Ư�� ������ ó���ϰ� ��� ���� ��ȯ���� ����. �������α׷�
*/

--�͸���

DECLARE
    vi_num  NUMBER;       --i_num �̸����� ���� ����(����)
BEGIN                     --���⼭���� ���α׷��� �����ϰڴ�
     vi_num := 100;       --� ���̴��� ���� �� �ִ�
    DBMS_OUTPUT.PUT_LINE(vi_num);  --���ΰ� ������ �Լ�, �Լ�(���): �α�Ȯ��
END;
--/  ���α׷� �ۼ��� ������ SQL*PLUS ���� ���ο� ���� ���û��
--PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�. => ������ + ����Ϸ�
/
DECLARE
    a INTEGER := 2**2*3**2;
    b NUMBER := 3+4;
BEGIN
       /*  DBMS_OUTPUT.PUT_LINE
    : DBMS ������� �Է°��� ���� �α� Ȯ��*/
   DBMS_OUTPUT.PUT_LINE('a='||TO_CHAR(a));
   DBMS_OUTPUT.PUT_LINE('b='||b);       --�ڵ�����ȯ
   DBMS_OUTPUT.PUT_LINE(b);
END;
/ 
DECLARE --�����
--a�� 2�� 2�� ���ϱ� 3��2��
    a INTEGER := 2**2*3**2;
    b NUMBER := 3+4;
    c VARCHAR2(30) := '�츮����';
    d BOOLEAN := false;
    e DATE := SYSDATE;
    f INT := 33;
BEGIN --�����
    DBMS_OUTPUT.PUT_LINE('===========================');
    DBMS_OUTPUT.PUT_LINE('a='||TO_CHAR(a));
    DBMS_OUTPUT.PUT_LINE('b='||b);       --�ڵ�����ȯ
    DBMS_OUTPUT.PUT_LINE(b);
    DBMS_OUTPUT.PUT_LINE(c);
    --�Ҹ��� �� ��¹��
     DBMS_OUTPUT.PUT_LINE('d='|| CASE WHEN 'ture' ELSE 'false' END); -- DBMS_OUTPUT.PUT_LINE(d);
     DBMS_OUTPUT.PUT_LINE(e);
     DBMS_OUTPUT.PUT_LINE(f);
      DBMS_OUTPUT.PUT_LINE(b+f);
END;
/
DECLARE
    vs_emp_name VARCHAR2(80);   --�߸��� ������Ÿ�� ���� ����!
    vs_dep_name VARCHAR2(80);   --��������
BEGIN
    SELECT e.emp_name, d.department_name
    INTO    vs_emp_name, vs_dep_name     --����, ���� ��ġ
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


8�� 1��
������ 3��

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


<����Ǯ��>
����1

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

����2

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