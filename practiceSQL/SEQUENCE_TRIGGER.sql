--TABLE ����
CREATE TABLE cafes(
    cafe_id INT PRIMARY KEY,
    cname VARCHAR2(255) NOT NULL, --�����־����
    address VARCHAR2(255),
    phone_number VARCHAR2(15),
    operating_hours VARCHAR2(255)
);

--SEQUENCE ���� ("Sequence CAFE_SEQ��(��) �����Ǿ����ϴ�.")
CREATE SEQUENCE cafe_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
--TRIGGER ���� ("Trigger CAFE_TRIGGER��(��) �����ϵǾ����ϴ�.")
CREATE OR REPLACE TRIGGER cafe_trigger
BEFORE INSERT ON cafes
FOR EACH ROW
BEGIN
    SELECT cafe_seq.NEXTVAL
    INTO:NEW.cafe_id
    FROM dual;
END;
