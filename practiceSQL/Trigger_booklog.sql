CREATE TABLE book_log (
    log_id NUMBER PRIMARY KEY,
    action_type VARCHAR2(10),
    book_id NUMBER,
    log_date TIMESTAMP
);
CREATE SEQUENCE book_log_seq START WITH 1 INCREMENT BY 1; --������ ���� (1�� ����)
-- Ʈ���� ����: 
CREATE OR REPLACE TRIGGER book_insert_trigger
AFTER INSERT ON bookcafe FOR EACH ROW --bookcafe ���̺� ���� �ϳ��� INSERT �� ������
BEGIN
    INSERT INTO book_log (log_id, action_type, book_id, log_date) --book_log ���̺� �α� �߰�
    VALUES (book_log_seq.NEXTVAL, 'INSERT', :NEW.book_id, SYSTIMESTAMP);
END;
/
-- INSERT ���� ����
INSERT INTO bookcafe
(book_id, title, author, publication_year, isbn, genre, description, price, publication_date, is_available)
VALUES (23, '�� ���ο� å', '�� ���ο� ����', 2023, '978-1234567890', 
        'Fiction', '�� ���ο� å ����', 9.99, TO_DATE('2023-10-13', 'YYYY-MM-DD'), 'Y');
        
SELECT * FROM book_log; --��°�� LOG_ID :1 / ACTION_TYPE: INSERT / BOOK_ID:22 / LOG_DATE :��¼�� ��~

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
CREATE OR REPLACE TRIGGER order_insert_trigger --�ֹ� �ϳ� ���� ������ �α� �߰��ϴ� Ʈ������..
AFTER INSERT ON orders FOR EACH ROW
BEGIN 
    INSERT INTO order_log(log_id, action_type, order_id, menu_id, mname, quantity, log_date)
    VALUES(order_log_seq.NEXTVAL, '�ֹ�����', :NEW.order_id, :NEW.menu_id, :NEW.mname, :NEW.quantity, SYSTIMESTAMP);
END;
/

--�ֹ� 2�� ����
INSERT INTO orders(order_id, cafe_id, menu_id, order_date, quantity, total_price, mname)
VALUES(41, 12, 16,TO_DATE('2023-10-13', 'YYYY-MM-DD'), 3, 20.00, 'ī�������');

INSERT INTO orders(order_id, cafe_id, menu_id, order_date, quantity, total_price, mname)
VALUES(42, 12, 16,TO_DATE('2023-10-13', 'YYYY-MM-DD'), 4, 35.80, '����ũ����');

SELECT * FROM order_log;