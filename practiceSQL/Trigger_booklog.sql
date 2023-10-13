CREATE TABLE book_log (
    log_id NUMBER PRIMARY KEY,
    action_type VARCHAR2(10),
    book_id NUMBER,
    log_date TIMESTAMP
);
CREATE SEQUENCE book_log_seq START WITH 1 INCREMENT BY 1; --시퀀스 생성 (1씩 증가)
-- 트리거 생성: 
CREATE OR REPLACE TRIGGER book_insert_trigger
AFTER INSERT ON bookcafe FOR EACH ROW --bookcafe 테이블에 행이 하나가 INSERT 될 때마다
BEGIN
    INSERT INTO book_log (log_id, action_type, book_id, log_date) --book_log 테이블에 로그 추가
    VALUES (book_log_seq.NEXTVAL, 'INSERT', :NEW.book_id, SYSTIMESTAMP);
END;
/
-- INSERT 문을 실행
INSERT INTO bookcafe
(book_id, title, author, publication_year, isbn, genre, description, price, publication_date, is_available)
VALUES (23, '더 새로운 책', '더 새로운 저자', 2023, '978-1234567890', 
        'Fiction', '더 새로운 책 설명', 9.99, TO_DATE('2023-10-13', 'YYYY-MM-DD'), 'Y');
        
SELECT * FROM book_log; --출력결과 LOG_ID :1 / ACTION_TYPE: INSERT / BOOK_ID:22 / LOG_DATE :어쩌구 완~

-----------------------------------------------------------------------------------------------------------
CREATE TABLE order_log (
    log_id NUMBER PRIMARY KEY,
    action_type VARCHAR2(50),
    order_id NUMBER,
    menu_id NUMBER,
    mname VARCHAR2(50),
    quantity NUMBER,
    log_date TIMESTAMP
);

CREATE SEQUENCE order_log_seq START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER order_insert_trigger --주문 하나 들어올 때마다 로그 추가하는 트리거임..
AFTER INSERT ON orders FOR EACH ROW
BEGIN 
    INSERT INTO order_log(log_id, action_type, order_id, menu_id, mname, quantity, log_date)
    VALUES(order_log_seq.NEXTVAL, '주문승인', :NEW.order_id, :NEW.menu_id, :NEW.mname, :NEW.quantity, SYSTIMESTAMP);
END;
/

--주문 2개 들어옴
INSERT INTO orders(order_id, cafe_id, menu_id, order_date, quantity, total_price, mname)
VALUES(41, 12, 16,TO_DATE('2023-10-13', 'YYYY-MM-DD'), 3, 20.00, '카페오레레');

INSERT INTO orders(order_id, cafe_id, menu_id, order_date, quantity, total_price, mname)
VALUES(42, 12, 16,TO_DATE('2023-10-13', 'YYYY-MM-DD'), 4, 35.80, '퐁퐁크러쉬');

SELECT * FROM order_log;