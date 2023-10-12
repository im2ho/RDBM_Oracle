--DUAL : 테이블은 없지만 어쩌고 하고싶어
SELECT REPLACE ('Hello, World!', 'Hello', 'Hi') FROM DUAL;
SELECT 'Hello' || 'World!' AS textSum From DUAL;

--LOWER : 문자열을 소문자로 변환
SELECT LOWER('Hello, World!') FROM DUAL;
--UPPER : 문자열을 대문자로 변환
SELECT UPPER('Hello, World!') FROM DUAL;
--INITCAP : 각 단어의 첫 글자를 대문자로 변환
SELECT INITCAP('hello world') FROM DUAL;
--SUBSTR : 문자열의 (1~5) 일부분 추출

--TRIM ' Hello, World ' 의 양쪽 공백 제거
SELECT RTRIM(' Hello, World', 'd') FROM DUAL;
SELECT TRIM(' Hello, World ') FROM DUAL; --조건을 안쓰면 공백이 제거된다 덜덜

--서브쿼리 활용해서 가장 비싼 책의 정보 가져오기
SELECT * FROM bookcafe
WHERE price = (SELECT MAX(PRICE) FROM bookcafe);

--윈도우 함수 RANK 활용해서 각 장르별로 가장 비싼 책 가져오기 or ROW_NUMBER()
SELECT title AS "장르별 가장 비싼 책", genre
FROM(SELECT b.*, ROW_NUMBER() OVER(PARTITION BY genre ORDER BY price DESC) rn
        FROM bookcafe b)
WHERE rn = 1;

--테이블 정렬 상위 5권의 책 가져오기
SELECT * FROM (
    SELECT ROWNUM rn, b.* FROM bookcafe b)
WHERE rn <= 5;

--각 저자가 쓴 책 수가 2권 이상인 저자 찾기

--Romance 장르의 책 중에서 제일 비싼 책
SELECT title, price, genre FROM bookcafe
WHERE price = (SELECT MAX(PRICE) FROM bookcafe WHERE genre='Romance');

--각 장르별로 평균 가격과 최고 가격 가져오기
SELECT * FROM (
    SELECT genre, price, AVG(price) OVER(PARTITION BY genre) avg_price FROM bookcafe)
PIVOT (
    MAX(price), AVG(avg_price)
    FOR genre IN('Fiction', 'SHORT Story'));
    
--가격대 별로 책의 판매량(CASE와 JOIN)
-- (price < 10  '상대적으로 구매할 수 있는 책' 10 AND price < 20 THEN '보통 책')
--'소설' 장르의 책과 'Novel' 장르의 책 합치기 (UNION)
--책의 출판 년도와 그 해에 출판된 책 수