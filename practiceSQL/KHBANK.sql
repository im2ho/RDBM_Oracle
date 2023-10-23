/*DROP TABLE bank;
CREATE TABLE bank(
    account_id INT PRIMARY KEY, --각 계좌의 ID (계좌를 고유하게 식별)
    account_number VARCHAR2(15) UNIQUE NOT NULL, --계좌번호 중복값 및 NULL값 불허 (고유제약과 NOT NULL 키 제약)
    account_name VARCHAR2(50) NOT NULL, --계좌 소유주 이름
    balance DECIMAL(10,2) NOT NULL, --잔액 소수점 이하 2자리까지 표현, DECIMAL : NUMBER의 표준 데이터 유형으로, 0보다 작거나 같을 수 없게 기본 세팅
    branch_name VARCHAR2(50), --은행 계좌 정보 저장 (우리, 국민, 신한 어쩌구)
    last_transaction_date DATE, --가장 최근 거래 날짜
    CONSTRAINT chk_balance CHECK (balance >= 0) --체크 제약 (잔액은 0원 미만이 될 수 없다)
);

INSERT INTO bank(account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES(1, 1002159226496, '김칸쵸', 572000, '동쪽지점', TO_DATE('2023-10-16', 'YYYY-MM-DD'));
UPDATE bank SET balance=572.00 WHERE account_name='김칸쵸';

INSERT INTO bank(account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES(2, 63220255853, '나사자', 1120.58, '서쪽지점', TO_DATE('2023-9-8', 'YYYY-MM-DD'));

INSERT INTO bank(account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES(3, 333302123542, '김이호', 467.01, '남쪽지점', TO_DATE('2023-9-10', 'YYYY-MM-DD'));

INSERT INTO bank(account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES(4, 644644644644, '서제승', 6444.40, '북쪽지점', TO_DATE('2023-10-1', 'YYYY-MM-DD'));

INSERT INTO bank(account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES(5, 498875624859, '김동휘', 930.09, '동쪽지점', TO_DATE('2023-9-28', 'YYYY-MM-DD'));

INSERT INTO BANK (account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES (6, '2222333344', '이혜린', 3000.50, '서쪽지점', TO_DATE('2023-10-11', 'YYYY-MM-DD'));

INSERT INTO BANK (account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES (7, '5555666777', '방이든', 1500.75, '서쪽지점', TO_DATE('2023-10-10', 'YYYY-MM-DD'));

INSERT INTO BANK (account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES (8, '8888999000', '정민호', 4000.00, '동쪽지점', TO_DATE('2023-10-09', 'YYYY-MM-DD'));

INSERT INTO BANK (account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES (9, '3333444555', '김서영', 950.25, '남쪽지점', TO_DATE('2023-10-08', 'YYYY-MM-DD'));

INSERT INTO BANK (account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES (10, '6666777888', '이동훈', 3200.50, '북쪽지점', TO_DATE('2023-10-07', 'YYYY-MM-DD')); */

--잔액이 1000이상인 계좌의 계좌번호와 잔액 조회
SELECT account_number, balance FROM bank
WHERE balance >= 1000;

--도시가 '서쪽지점'인 계좌의 계좌 소유주 이름 조회
SELECT account_name FROM bank WHERE branch_name = '서쪽지점';

--마지막 거래 날짜가 '2023-10-10' 이전인 계좌의 계좌번호와 마지막 거래 날짜를 조회
SELECT account_number, last_transaction_date FROM bank WHERE last_transaction_date < '2023-10-10';

--잔액이 가장 큰 계좌의 계좌 번호와 잔액을 조회 (이중쿼리)
SELECT account_number, balance
FROM bank
WHERE balance = (SELECT MAX(balance) FROM bank);

--잔액이 500보다 작고 1000보다 큰 계좌의 계좌 소유주 이름 조회
SELECT account_name, balance
FROM bank
WHERE balance < 500 OR balance > 1000;

--계좌번호가 1002153226496 잔액을 1500으로 업뎃
UPDATE bank SET balance = 1500 WHERE account_number = 1002159226496;
SELECT * FROM bank WHERE account_number = 1002159226496;

--잔액이 2000이상인 계좌의 잔액을 10% 증가
UPDATE bank SET balance = 1.1 * balance WHERE balance >= 2000;

--잔액이 0보다 작은 계좌가 있는지 확인
SELECT * FROM bank WHERE balance < 0;

--모든 계좌의 평균 잔액 계산
SELECT AVG(balance) FROM bank;

--도시가 '남쪽지점'인 계좌의 평균 잔액 계산
SELECT branch_name, AVG(balance) AS "남쪽지점 평균 잔액" FROM bank
GROUP BY branch_name
HAVING branch_name = '남쪽지점';

--거래 날짜 빠른 순서대로 소유주 이름 조회
SELECT account_name, last_transaction_date FROM bank
ORDER BY last_transaction_date ASC;

--마지가 거래 날짜가 가장 빠른 계좌의 소유주 이름 조회
SELECT account_name, last_transaction_date FROM bank
ORDER BY last_transaction_date ASC
FETCH FIRST 1 rows only;