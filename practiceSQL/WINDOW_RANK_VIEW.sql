--WINDOW
SELECT order_id, order_date, total_price, 
        SUM(total_price) OVER (ORDER BY order_Date) AS OD
        --이 부분이 윈도우 함수
        --order_date를 기준으로 각 주문의 총 가격을 누적한 값을 반환한 것
        --결과 집합에는 order_id, order_date, total_price, OD열이 포함
        --각 주문에 대한 누적 가격을 계산할 수 있음......뭐라는거야
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