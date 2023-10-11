--TABLE 생성
CREATE TABLE cafes(
    cafe_id INT PRIMARY KEY,
    cname VARCHAR2(255) NOT NULL, --값이있어야함
    address VARCHAR2(255),
    phone_number VARCHAR2(15),
    operating_hours VARCHAR2(255)
);

--SEQUENCE 생성 ("Sequence CAFE_SEQ이(가) 생성되었습니다.")
CREATE SEQUENCE cafe_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
--TRIGGER 생성 ("Trigger CAFE_TRIGGER이(가) 컴파일되었습니다.")
CREATE OR REPLACE TRIGGER cafe_trigger
BEFORE INSERT ON cafes
FOR EACH ROW
BEGIN
    SELECT cafe_seq.NEXTVAL
    INTO:NEW.cafe_id
    FROM dual;
END;
