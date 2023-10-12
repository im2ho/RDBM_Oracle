/*
CREATE TABLE orders(
    order_id NUMBER PRIMARY KEY,
    cafe_id NUMBER,
    menu_id NUMBER,
    order_date TIMESTAMP,
    quantity NUMBER,
    total_price NUMBER
);

--외래 키 제약 조건 추가
ALTER TABLE orders ADD 
    CONSTRAINT fk_orders_cafe
    FOREIGN KEY (cafe_id)
    REFERENCES cafes(cafe_id);
    
--외래 키 제약 조건 추가2
ALTER TABLE orders ADD
    CONSTRAINT fk_orders_menu
    FOREIGN KEY (menu_id)
    REFERENCES menu(menu_id);

--테이블 코멘트 추가
COMMENT ON TABLE orders IS '주문 정보를 저장하는 테이블';

--열 코멘트 추가 ex) orders테이블의 order_id 컬럼에 추가하기
COMMENT ON COLUMN orders.order_id IS '주문을 고유하게 식별하는 번호';

COMMENT ON COLUMN orders.cafe_id IS '주문이 발생한 카페 ID';
COMMENT ON COLUMN orders.menu_id IS '주문한 메뉴 항목의 ID';
COMMENT ON COLUMN orders.order_date IS '주문이 발생한 날짜 및 시간';
COMMENT ON COLUMN orders.quantity IS '주문한 메뉴 항목의 수량';
COMMENT ON COLUMN orders.total_price IS '주문한 메뉴의 총 가격';

--첫 주문 주문 테이블에 추가
INSERT INTO orders(order_id, cafe_id, menu_id, order_date, quantity, total_price)
VALUES(1, 2, 1, TIMESTAMP '2023-10-11 14:30:00', 2, 7.00);

--order테이블에 메뉴이름 열 추가..
ALTER TABLE orders ADD mname VARCHAR(50);

--메뉴이름 추가 by UPDATE
UPDATE orders SET mname = '버블티' WHERE menu_id= 1;
*/

--JOIN을 사용해서 주문번호 1번의 주문 정보를 다 뽑아보세용
SELECT o.order_id, c.cname, o.mname, m.price, o.quantity, o.total_price
FROM orders o
JOIN cafes c ON c.cafe_id = o.cafe_id
JOIN menu m ON m.menu_id = o.menu_id
WHERE o.order_id = 1;

--들어온 모든 주문정보 뽑기
SELECT o.order_id, c.cname, o.mname, m.price, o.quantity, o.total_price
FROM orders o
JOIN cafes c ON c.cafe_id = o.cafe_id
JOIN menu m ON m.menu_id = o.menu_id;

--특정 카페의 주문 조회
SELECT o.order_id, c.cname, m.menu_id, m.price, o.quantity, o.total_price
FROM orders o
JOIN cafes c ON c.cafe_id = o.cafe_id
JOIN menu m ON m.menu_id = o.menu_id
WHERE c.cname LIKE '%바다%';

SELECT * FROM orders
WHERE cafe_id = (SELECT cafe_id from cafes where cname = 'in 바다');

--특정 주문 날짜 범위 내 주문 조회
SELECT * FROM orders 
WHERE order_date LIKE '23-10-11%';

--각 카페별 주문 총액 조회
SELECT c.cname, o.total_price
FROM orders o
JOIN cafes c ON o.cafe_id = c.cafe_id;

--주문 수량이 3개 이상인 주문 조회
SELECT * FROM orders
WHERE quantity >=3;

--가격범위 3.00~5.00 내의 메뉴 조회
SELECT * FROM menu
WHERE price >3.00 AND price<5.00;

--주문일이 오늘인 주문 조회
SELECT * FROM orders
WHERE trunc(order_date) = trunc(sysdate);