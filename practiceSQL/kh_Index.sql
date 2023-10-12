/*
--��ǰ���̺� ����
CREATE TABLE products(
    product_id NUMBER(5) PRIMARY KEY,--PRIMARY Ű�� �����ϸ� �ε����� �ڵ� ������...
    product_name VARCHAR2(100),
    category VARCHAR2(50),
    price NUMBER(10,2),
    stock_quantity NUMBER(5)
);

INSERT INTO products(product_id, product_name, category, price, stock_quantity)
VALUES(1, '������� ��������', '���ϸ�', 1500.99, 2);

INSERT INTO products(product_id, product_name, category, price, stock_quantity)
VALUES(2, '���ϴ��� ���ڷ�', '���ϸ�', 1500.80, 1);

INSERT INTO products(product_id, product_name, category, price, stock_quantity)
VALUES(3, '�̻��ؾ��� ��������', '���ϸ�', 1300.89, 2);

INSERT INTO products(product_id, product_name, category, price, stock_quantity)
VALUES(4, '���Ǿ��� ������ȭ �����', '���ϸ�', 1800.59, 1);
*/

--�ε��� ���� : ��ǰ �̸����� �˻��� ����ȭ
CREATE INDEX idx_product_name ON products(product_name);

--�ε��� ���� : ī�װ��� �˻��� ����ȭ
CREATE INDEX idx_category ON products(category);

--��ǰ �̸����� �˻� (�ε��� Ȱ��)
SELECT * FROM products
WHERE product_name LIKE '%�����%';

--�ֹ� ID �ֹ� �˻� (�ε��� Ȱ��)
SELECT * FROM orders WHERE order_id = 7;

--cafe_id�� 6�� ī�信�� �ֹ� �˻�
CREATE INDEX idx_cafe_id ON orders(cafe_id);
SELECT * FROM orders WHERE cafe_id = 8;

--���� ������ �ֹ� �˻�
CREATE INDEX idx_price ON orders(total_price);
SELECT * FROM orders WHERE total_price < 5;

--2023-10-11 14:00:00 ~ 2023-10-11 15:00:00 ������ �ֹ� �˻�
CREATE INDEX idx_order_date ON orders(order_date);
SELECT * FROM orders WHERE order_date < '2023-10-12' ;
SELECT * FROM orders WHERE order_date >= TIMESTAMP '2023-10-11 14:00:00' 
                        AND order_date < TIMESTAMP '2023-10-11 15:00:00';
                        

/*************�Լ�*************/
--REPLACE: ���ڿ����� Ư�� ���� �Ǵ� ���ڿ��� �ٸ� ���ڿ��� ��ü
SELECT REPLACE (description, '���' , '����') FROM menu;
SELECT product_name, REPLACE (product_name, '����' , '����') FROM products;

--CONCAT: �� ���ڿ��� ����
SELECT product_name || '���� : $' || TO_CHAR(price, '1500.99')
FROM products;

--SUBSTR ���ڿ� �Ϻ� ����
SELECT product_name, SUBSTR(product_name,1,3)
FROM products;

--��������
--TRIM, LTRIM, RTRIM : ���ڿ����� ���� ����ǥ ���� ������ �����ϴµ� ���
--TRIM : ���ڿ� �� ���� ' ' ����
--LTRIM: ���ڿ� �� ����(���ۺκ�)�� ' ' ����
--RTRIM: ���ڿ� �� ������(���κ�)�� ' ' ����

SELECT RTRIM(product_name, '��') AS "�� ������"
FROM products;

SELECT RTRIM(category, '��') AS "���ῡ�� �� ����" FROM products WHERE category = '����';

--INSTR : ���ڿ����� Ư�� ���� ��ġ
SELECT product_name, INSTR(product_name, '����') FROM products;

--LENGTHB / LENGTH : ����Ʈ ���ڿ� ���� / ���ڴ����� ���ڿ� ����
--�ѱ�: �� ���ڴ� 3byte / ����: 1byte 
SELECT product_name, LENGTHB(product_name), LENGTH(product_name) FROM products;

--���� �� ��ǰ �̸� ã��
SELECT product_name, LENGTH(product_name) FROM products
WHERE LENGTH(product_name) = (SELECT MAX(LENGTH(product_name)) FROM products); --����..

--��ǰ ���� �ݿø�
SELECT product_name, ROUND(price) FROM products;

--��ǰ �̸��� ���� ���� ��ǰ ã�� INSTR
SELECT product_name FROM products WHERE INSTR(product_name, '��') > 0;
SELECT product_name FROM products WHERE product_name LIKE '%��%';