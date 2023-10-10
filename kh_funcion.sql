--------함수 Function--------

--CREATE
/*
DROP TABLE fridaytable;

CREATE TABLE FridayTABLE (
id NUMBER(5) PRIMARY KEY,
name VARCHAR2(50),
description VARCHAR2(100),
birthdate DATE
);

--INSERT
--To Date 함수 사용해서 날짜 형식으로 데이터 삽입

INSERT INTO fridaytable (id, name, description, birthdate)
VALUES (1, '최팔호', '망나니', TO_DATE('1995-05-25', 'YYYY-MM-DD'));

INSERT INTO fridaytable (id, name, description, birthdate)
VALUES (2, '한호주', '흑곰', TO_DATE('1997-08-16', 'YYYY-MM-DD'));

INSERT INTO fridaytable (id, name, description, birthdate)
VALUES (3, '이준영', '주냉', TO_DATE('1999-06-22', 'YYYY-MM-DD'));

INSERT INTO fridaytable (id, name, description, birthdate)
VALUES (4, '김예림', '월당', TO_DATE('1996-11-29', 'YYYY-MM-DD'));

INSERT INTO fridaytable (id, name, description, birthdate)
VALUES (5, '한운학', '바보', TO_DATE('2000-02-09', 'YYYY-MM-DD'));
*/

--ORDER BY : 결과 정렬
SELECT * FROM fridaytable ORDER BY name; //이름 기준 오름차순 정렬
SELECT * FROM fridaytable ORDER BY birthdate; //나이순 정렬

--COUNT : 행의 수를 세어준다
SELECT COUNT(*) AS row_count FROM fridaytable; //AS: 행의 개수를 세서 저장할 이름

--테이블 구조 변경하기
--열의 크기 늘리기
ALTER TABLE fridaytable MODIFY description VARCHAR2(200); //200으로 늘려줌

--SUM : 숫자 열의 합을 계산
SELECT SUM(id) AS id_sum FROM fridaytable; //모든 id 값을 합산

--TO_CHAR : 날짜를 문자열로 반환
SELECT name, TO_CHAR(birthdate, 'YYYY-MM-DD') AS birthdate_str FROM fridaytable;

--Length : 문자열의 길이 반환
SELECT name, description, LENGTH(description) AS discription_len FROM fridaytable;

/*
INSERT INTO fridaytable (id, name, description, birthdate)
VALUES(6, '한별', '아갓시와흑곰이', TO_DATE('2017-05-05', 'YYYY-MM-DD'));

INSERT INTO fridaytable (id, name, description, birthdate)
VALUES(7, 'Windy', 'Pokemon of Legend', TO_DATE('2017-05-05', 'YYYY-MM-DD'));
*/

--UPPER : 문자열을 대문자로 변환
SELECT name, UPPER(name), UPPER(description) FROM fridaytable;
--LOWER : 문자열을 소문자로 변환
SELECT name, LOWER(name), LOWER(description) FROM fridaytable;

--ROUND : 숫자를 반올림
--birthdate 열의 연도를 반올림하여 출력
--EXTRACT 날짜 값에서 연도를 추출
SELECT name, ROUND(EXTRACT(YEAR FROM birthdate)) AS BirthYear FROM fridaytable;

--NVL (Null Value 어쩌구) : NULL 값을 다른 값으로 대체
SELECT ename, NVL(commission, 0) AS commission
FROM employee;

--NEXT DAY 다음 주어진 요일 날짜 찾기
SELECT ename, next_day(sysdate, 'FRIDAY') AS next_day
FROM dual;
                                  
--TRUNC : 날짜 또는 숫자의 소수부 제거
SELECT ename, TRUNC(salary) AS trunc_salary FROM employee;

--FLOOR, CEIL, ROUND : 버림/올림/반올림
SELECT ename, FLOOR(salary) AS floor_salary FROM employee;
SELECT ename, CEIL(salary) AS ceil_salary FROM employee;
SELECT ename, ROUND(salary,2) AS round_salary FROM employee;

--ABS : 절대값 계산 (ABsolute)
SELECT ename, ABS(commission) AS abs_commission FROM employee;
