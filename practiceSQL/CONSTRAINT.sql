/*
CREATE TABLE orders(
    order_id NUMBER PRIMARY KEY,
    cafe_id NUMBER,
    menu_id NUMBER,
    order_date TIMESTAMP,
    quantity NUMBER,
    total_price NUMBER
);

--�ܷ� Ű ���� ���� �߰�
ALTER TABLE orders ADD 
    CONSTRAINT fk_orders_cafe
    FOREIGN KEY (cafe_id)
    REFERENCES cafes(cafe_id);
    
--�ܷ� Ű ���� ���� �߰�2
ALTER TABLE orders ADD
    CONSTRAINT fk_orders_menu
    FOREIGN KEY (menu_id)
    REFERENCES menu(menu_id);

--���̺� �ڸ�Ʈ �߰�
COMMENT ON TABLE orders IS '�ֹ� ������ �����ϴ� ���̺�';

--�� �ڸ�Ʈ �߰� ex) orders���̺��� order_id �÷��� �߰��ϱ�
COMMENT ON COLUMN orders.order_id IS '�ֹ��� �����ϰ� �ĺ��ϴ� ��ȣ';

COMMENT ON COLUMN orders.cafe_id IS '�ֹ��� �߻��� ī�� ID';
COMMENT ON COLUMN orders.menu_id IS '�ֹ��� �޴� �׸��� ID';
COMMENT ON COLUMN orders.order_date IS '�ֹ��� �߻��� ��¥ �� �ð�';
COMMENT ON COLUMN orders.quantity IS '�ֹ��� �޴� �׸��� ����';
COMMENT ON COLUMN orders.total_price IS '�ֹ��� �޴��� �� ����';

--ù �ֹ� �ֹ� ���̺� �߰�
INSERT INTO orders(order_id, cafe_id, menu_id, order_date, quantity, total_price)
VALUES(1, 2, 1, TIMESTAMP '2023-10-11 14:30:00', 2, 7.00);

--order���̺� �޴��̸� �� �߰�..
ALTER TABLE orders ADD mname VARCHAR(50);

--�޴��̸� �߰� by UPDATE
UPDATE orders SET mname = '����Ƽ' WHERE menu_id= 1;
*/

--JOIN�� ����ؼ� �ֹ���ȣ 1���� �ֹ� ������ �� �̾ƺ�����
SELECT o.order_id, c.cname, o.mname, m.price, o.quantity, o.total_price
FROM orders o
JOIN cafes c ON c.cafe_id = o.cafe_id
JOIN menu m ON m.menu_id = o.menu_id
WHERE o.order_id = 1;

--���� ��� �ֹ����� �̱�
SELECT o.order_id, c.cname, o.mname, m.price, o.quantity, o.total_price
FROM orders o
JOIN cafes c ON c.cafe_id = o.cafe_id
JOIN menu m ON m.menu_id = o.menu_id;

--Ư�� ī���� �ֹ� ��ȸ
SELECT o.order_id, c.cname, m.menu_id, m.price, o.quantity, o.total_price
FROM orders o
JOIN cafes c ON c.cafe_id = o.cafe_id
JOIN menu m ON m.menu_id = o.menu_id
WHERE c.cname LIKE '%�ٴ�%';

SELECT * FROM orders
WHERE cafe_id = (SELECT cafe_id from cafes where cname = 'in �ٴ�');

--Ư�� �ֹ� ��¥ ���� �� �ֹ� ��ȸ
SELECT * FROM orders 
WHERE order_date LIKE '23-10-11%';

--�� ī�亰 �ֹ� �Ѿ� ��ȸ
SELECT c.cname, o.total_price
FROM orders o
JOIN cafes c ON o.cafe_id = c.cafe_id;

--�ֹ� ������ 3�� �̻��� �ֹ� ��ȸ
SELECT * FROM orders
WHERE quantity >=3;

--���ݹ��� 3.00~5.00 ���� �޴� ��ȸ
SELECT * FROM menu
WHERE price >3.00 AND price<5.00;

--�ֹ����� ������ �ֹ� ��ȸ
SELECT * FROM orders
WHERE trunc(order_date) = trunc(sysdate);