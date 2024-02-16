
--�⺻Ű ���� ���� NULL �� NOT NULL 11/09

CREATE TABLE ex2_6(
    col_null    VARCHAR2(10)    NULL,
    col_notnull VARCHAR2(10)    NOT NULL
);

INSERT INTO ���̺�
VALUES(��1, ��2);

INSERT INTO ex2_6
VALUES('AA', '');

INSERT INTO ex2_6
VALUES('AA', 'BB');

INSERT INTO ex2_6
VALUES('', 'BB');

--�⺻Ű ���� ���� UNIQUE
DROP TABLE ex2_7;
CREATE TABLE ex2_7(
    col1   VARCHAR2(10)    UNIQUE,
    col2   VARCHAR2(10)    UNIQUE NOT NULL,
    col3   VARCHAR2(10),
    CONSTRAINTS unique_1 UNIQUE(col3)
);

--�⺻Ű ���� ���� PRIMARY KEY

DROP TABLE ex2_8;

CREATE TABLE ex2_8(
    col1    VARCHAR(10),
    col2    VARCHAR(10),
    col3    VARCHAR(10),
    CONSTRAINTS pk_1 PRIMARY KEY (col1) -- col ������ ����
);

INSERT INTO ex2_8 VALUES ('A', 'B', 'C');
INSERT INTO ex2_8 VALUES ('A', 'BB', 'CC'); --����
INSERT INTO ex2_8 VALUES ('', 'B', 'C'); --����

DROP TABLE ex2_8;

CREATE TABLE ex2_8(
    col1    VARCHAR(10),
    col2    VARCHAR(10) PRIMARY KEY, --col �ϳ��� ����
    col3    VARCHAR(10)
);

INSERT INTO ex2_8 VALUES ('A', 'B', 'C');
INSERT INTO ex2_8 VALUES ('AA', 'B', 'CC');  --����
INSERT INTO ex2_8 VALUES ('AA', '', 'CC');   --����
INSERT INTO ex2_8 VALUES ('AA', 'BB', 'CC'); --����


--�⺻Ű ���� ���� �ܷ�Ű Foreign Key
�ܷ�Ű�� ��� ���̺� ���忡 ���� �޶��� �� �ִ�

CONSTRAINT �ܷ�Ű�� FOREIGN KEY(�÷���,..)
REFERENCES �������̺� (�÷���,..)

DROP TABLE ex2_9;

CREATE TABLE ex2_9(
    col4 VARCHAR(10) PRIMARY KEY,
    col5 VARCHAR(10),
    col6 VARCHAR(10),
    CONSTRAINT fk_2_0 FOREIGN KEY (col6) --ex2_8�� �־ �ܷ�Ű�Է°���
    REFERENCES ex2_8(col2)
);

INSERT INTO ex2_9 VALUES ('D', 'E', 'F');

--�⺻Ű ���� ���� CHECK
�÷��� ������Ÿ�� CONSTRAINT �������Ǹ� CHECK (�÷� IN ('����', '����'))

DROP TABLE ex2_10;
CREATE TABLE ex2_10(
    col1 VARCHAR(10) CHECK (col1 IN ('����', '����')),
    col2 NUMBER CONSTRAINTS ch_1 CHECK(col2 BETWEEN 1 AND 9),
    col3 VARCHAR(10)
);

INSERT INTO ex2_10 VALUES ('����', 'E', 'F');
INSERT INTO ex2_10 VALUES ('����', 1, 'F');
INSERT INTO ex2_10 VALUES ('����', 12, 'F');   


--���̺� ����



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



