--WINDOW
SELECT order_id, order_date, total_price, 
        SUM(total_price) OVER (ORDER BY order_Date) AS OD
        --�� �κ��� ������ �Լ�
        --order_date�� �������� �� �ֹ��� �� ������ ������ ���� ��ȯ�� ��
        --��� ���տ��� order_id, order_date, total_price, OD���� ����
        --�� �ֹ��� ���� ���� ������ ����� �� ����......����°ž�
FROM orders;

--RANK
SELECT order_id, order_date, total_price, 
        RANK() OVER (ORDER BY order_Date) AS OD
FROM orders;

--VIEW
CREATE VIEW cafe_order_menu AS
SELECT 
    o.order_id,
    c.cname AS cafe_name,
    m.mname,
    o.order_date,
    o.quantity,
    m.price,
    (o.quantity * m.price) AS total_price
FROM
    orders o
JOIN cafes c ON o.cafe_id = c.cafe_id
JOIN menu m ON o.menu_id = m.menu_id;