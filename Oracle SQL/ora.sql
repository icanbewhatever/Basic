
--기본키 제약 조건 NULL 과 NOT NULL 11/09

CREATE TABLE ex2_6(
    col_null    VARCHAR2(10)    NULL,
    col_notnull VARCHAR2(10)    NOT NULL
);

INSERT INTO 테이블
VALUES(값1, 값2);

INSERT INTO ex2_6
VALUES('AA', '');

INSERT INTO ex2_6
VALUES('AA', 'BB');

INSERT INTO ex2_6
VALUES('', 'BB');

--기본키 제약 조건 UNIQUE
DROP TABLE ex2_7;
CREATE TABLE ex2_7(
    col1   VARCHAR2(10)    UNIQUE,
    col2   VARCHAR2(10)    UNIQUE NOT NULL,
    col3   VARCHAR2(10),
    CONSTRAINTS unique_1 UNIQUE(col3)
);

--기본키 제약 조건 PRIMARY KEY

DROP TABLE ex2_8;

CREATE TABLE ex2_8(
    col1    VARCHAR(10),
    col2    VARCHAR(10),
    col3    VARCHAR(10),
    CONSTRAINTS pk_1 PRIMARY KEY (col1) -- col 여러개 가능
);

INSERT INTO ex2_8 VALUES ('A', 'B', 'C');
INSERT INTO ex2_8 VALUES ('A', 'BB', 'CC'); --오류
INSERT INTO ex2_8 VALUES ('', 'B', 'C'); --오류

DROP TABLE ex2_8;

CREATE TABLE ex2_8(
    col1    VARCHAR(10),
    col2    VARCHAR(10) PRIMARY KEY, --col 하나만 가능
    col3    VARCHAR(10)
);

INSERT INTO ex2_8 VALUES ('A', 'B', 'C');
INSERT INTO ex2_8 VALUES ('AA', 'B', 'CC');  --오류
INSERT INTO ex2_8 VALUES ('AA', '', 'CC');   --오류
INSERT INTO ex2_8 VALUES ('AA', 'BB', 'CC'); --정상


--기본키 제약 조건 외래키 Foreign Key
외래키는 어느 테이블 입장에 따라 달라질 수 있다

CONSTRAINT 외래키명 FOREIGN KEY(컬럼명,..)
REFERENCES 참조테이블 (컬럼명,..)

DROP TABLE ex2_9;

CREATE TABLE ex2_9(
    col4 VARCHAR(10) PRIMARY KEY,
    col5 VARCHAR(10),
    col6 VARCHAR(10),
    CONSTRAINT fk_2_0 FOREIGN KEY (col6) --ex2_8이 있어서 외래키입력가능
    REFERENCES ex2_8(col2)
);

INSERT INTO ex2_9 VALUES ('D', 'E', 'F');

--기본키 제약 조건 CHECK
컬럼명 데이터타입 CONSTRAINT 제약조건명 CHECK (컬럼 IN ('남자', '여자'))

DROP TABLE ex2_10;
CREATE TABLE ex2_10(
    col1 VARCHAR(10) CHECK (col1 IN ('남자', '여자')),
    col2 NUMBER CONSTRAINTS ch_1 CHECK(col2 BETWEEN 1 AND 9),
    col3 VARCHAR(10)
);

INSERT INTO ex2_10 VALUES ('노인', 'E', 'F');
INSERT INTO ex2_10 VALUES ('남자', 1, 'F');
INSERT INTO ex2_10 VALUES ('여자', 12, 'F');   


--테이블 변경



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



