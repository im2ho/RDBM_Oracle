/*
--제품테이블 생성
CREATE TABLE products(
    product_id NUMBER(5) PRIMARY KEY,--PRIMARY 키를 지정하면 인덱스가 자동 생성됨...
    product_name VARCHAR2(100),
    category VARCHAR2(50),
    price NUMBER(10,2),
    stock_quantity NUMBER(5)
);

INSERT INTO products(product_id, product_name, category, price, stock_quantity)
VALUES(1, '고오스의 초코케익', '포켓몬빵', 1500.99, 2);

INSERT INTO products(product_id, product_name, category, price, stock_quantity)
VALUES(2, '로켓단의 초코롤', '포켓몬빵', 1500.80, 1);

INSERT INTO products(product_id, product_name, category, price, stock_quantity)
VALUES(3, '이상해씨의 초코팡팡', '포켓몬빵', 1300.89, 2);

INSERT INTO products(product_id, product_name, category, price, stock_quantity)
VALUES(4, '님피아의 전광석화 딸기롤', '포켓몬빵', 1800.59, 1);
*/

--인덱스 생성 : 제품 이름으로 검색을 최적화
CREATE INDEX idx_product_name ON products(product_name);

--인덱스 생성 : 카테고리로 검색을 최적화
CREATE INDEX idx_category ON products(category);

--제품 이름으로 검색 (인덱스 활용)
SELECT * FROM products
WHERE product_name LIKE '%고오스%';

--주문 ID 주문 검색 (인덱스 활용)
SELECT * FROM orders WHERE order_id = 7;

--cafe_id가 6인 카페에서 주문 검색
CREATE INDEX idx_cafe_id ON orders(cafe_id);
SELECT * FROM orders WHERE cafe_id = 8;

--가격 범위로 주문 검색
CREATE INDEX idx_price ON orders(total_price);
SELECT * FROM orders WHERE total_price < 5;

--2023-10-11 14:00:00 ~ 2023-10-11 15:00:00 범위로 주문 검색
CREATE INDEX idx_order_date ON orders(order_date);
SELECT * FROM orders WHERE order_date < '2023-10-12' ;
SELECT * FROM orders WHERE order_date >= TIMESTAMP '2023-10-11 14:00:00' 
                        AND order_date < TIMESTAMP '2023-10-11 15:00:00';
                        

/*************함수*************/
--REPLACE: 문자열에서 특정 문자 또는 문자열을 다른 문자열로 대체
SELECT REPLACE (description, '사약' , '숭늉') FROM menu;
SELECT product_name, REPLACE (product_name, '팡팡' , '빵빵') FROM products;

--CONCAT: 두 문자열을 결합
SELECT product_name || '가격 : $' || TO_CHAR(price, '1500.99')
FROM products;

--SUBSTR 문자열 일부 추출
SELECT product_name, SUBSTR(product_name,1,3)
FROM products;

--공백제거
--TRIM, LTRIM, RTRIM : 문자열에서 작은 따옴표 안의 내용을 제거하는데 사용
--TRIM : 문자열 양 끝의 ' ' 제거
--LTRIM: 문자열 맨 왼쪽(시작부분)의 ' ' 제거
--RTRIM: 문자열 맨 오른쪽(끝부분)의 ' ' 제거

SELECT RTRIM(product_name, '롤') AS "롤 뺐지롱"
FROM products;

SELECT RTRIM(category, '료') AS "음료에서 료 빼기" FROM products WHERE category = '음료';

--INSTR : 문자열에서 특정 문자 위치
SELECT product_name, INSTR(product_name, '초코') FROM products;

--LENGTHB / LENGTH : 바이트 문자열 길이 / 문자단위로 문자열 길이
--한글: 한 글자당 3byte / 공백: 1byte 
SELECT product_name, LENGTHB(product_name), LENGTH(product_name) FROM products;

--가장 긴 제품 이름 찾기
SELECT product_name, LENGTH(product_name) FROM products
WHERE LENGTH(product_name) = (SELECT MAX(LENGTH(product_name)) FROM products); --ㅎㅎ..

--제품 가격 반올림
SELECT product_name, ROUND(price) FROM products;

--제품 이름에 폰이 들어가는 제품 찾기 INSTR
SELECT product_name FROM products WHERE INSTR(product_name, '롤') > 0;
SELECT product_name FROM products WHERE product_name LIKE '%롤%';