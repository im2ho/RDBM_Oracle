/*
CREATE TABLE menu(
    menu_id INT PRIMARY KEY,
    cafe_id INT,
    mname VARCHAR(255) NOT NULL,
    price NUMBER(8,2) NOT NULL,
    CONSTRAINT fk_cafe --제약조건
        FOREIGN KEY (cafe_id)
        REFERENCES cafes(cafe_id) --FOREING키 정의 후 관계설정
);
ALTER TABLE menu ADD description VARCHAR2(500);
*/

--서울에 위치한 모든 카페 조회
SELECT * FROM cafes WHERE address LIKE '%서울%'; --LIKE와 %

--메뉴 이름에 '밀크'가 있는 카페 찾기..
SELECT c.cname AS 카페명, m.mname AS 메뉴명
FROM cafes c
JOIN menu m ON c.cafe_id = m.cafe_id
WHERE m.mname LIKE '%밀크%';

--주말에 운영되는 카페목록
SELECT * FROM cafes WHERE cafes.operating_hours LIKE '%주말%';

--주말에 운영안하는
SELECT * FROM cafes WHERE cafes.operating_hours NOT LIKE '%주말%';

--02를 포함하는 전화번호를 가지는 서울의 카페 찾기
SELECT * FROM cafes WHERE cafes.phone_number LIKE '02%';

--이름에 라떼가 포함된 카페 찾기
SELECT * FROM cafes WHERE cafes.cname LIKE '%라떼%';

--4.00 미만의 가격을 가진 메뉴 항목 찾기
SELECT * FROM menu WHERE menu.price < 4.00;

--매일 운영되는 카페 찾기
SELECT * FROM cafes WHERE cafes.operating_hours LIKE '%매일%';

--매일 운영되고 가격 4.00 미만의 가격을 가진 카페 찾기
SELECT c.cname, m.mname, m.price, c.operating_hours 
FROM cafes c
JOIN menu m ON c.cafe_id = m.cafe_id
WHERE m.price < 4.00 AND c.operating_hours LIKE '%매일%';

--'대'라는 글자를 포함한 이름을 가진 카페 찾기
SELECT cname FROM cafes WHERE cname LIKE '%대%';

--모든 카페의 메뉴 항목 수 계산:
SELECT c.cname AS 카페명, COUNT(m.menu_id) AS 메뉴수
FROM cafes c
LEFT JOIN menu m ON c.cafe_id = m.cafe_id
GROUP BY c.cname;

--메뉴 설명에 '포켓몬'가 포함된 카페 찾기:
SELECT c.cname, m.mname, m.description FROM cafes c
JOIN menu m ON c.cafe_id = m.cafe_id
WHERE m.description LIKE '%포켓몬%';

--각 카페별.. 모든 메뉴 항목의 총 가격 계산: ?
SELECT c.cname, SUM(m.price) 
FROM cafes c
JOIN menu m ON c.cafe_id = m.cafe_id
GROUP BY c.cname;

--'HP'이 설명에 포함된 메뉴 항목이 있는 카페 선택:
SELECT c.cname, m.mname, m.description FROM cafes c
JOIN menu m ON c.cafe_id = m.cafe_id
WHERE m.description LIKE '%HP%';

SELECT SUM(price)
FROM cafes
JOIN menu ON cafes.cafe_id = menu.menu_id;