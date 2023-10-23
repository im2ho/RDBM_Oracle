/*DROP TABLE bank;
CREATE TABLE bank(
    account_id INT PRIMARY KEY, --�� ������ ID (���¸� �����ϰ� �ĺ�)
    account_number VARCHAR2(15) UNIQUE NOT NULL, --���¹�ȣ �ߺ��� �� NULL�� ���� (��������� NOT NULL Ű ����)
    account_name VARCHAR2(50) NOT NULL, --���� ������ �̸�
    balance DECIMAL(10,2) NOT NULL, --�ܾ� �Ҽ��� ���� 2�ڸ����� ǥ��, DECIMAL : NUMBER�� ǥ�� ������ ��������, 0���� �۰ų� ���� �� ���� �⺻ ����
    branch_name VARCHAR2(50), --���� ���� ���� ���� (�츮, ����, ���� ��¼��)
    last_transaction_date DATE, --���� �ֱ� �ŷ� ��¥
    CONSTRAINT chk_balance CHECK (balance >= 0) --üũ ���� (�ܾ��� 0�� �̸��� �� �� ����)
);

INSERT INTO bank(account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES(1, 1002159226496, '��ĭ��', 572000, '��������', TO_DATE('2023-10-16', 'YYYY-MM-DD'));
UPDATE bank SET balance=572.00 WHERE account_name='��ĭ��';

INSERT INTO bank(account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES(2, 63220255853, '������', 1120.58, '��������', TO_DATE('2023-9-8', 'YYYY-MM-DD'));

INSERT INTO bank(account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES(3, 333302123542, '����ȣ', 467.01, '��������', TO_DATE('2023-9-10', 'YYYY-MM-DD'));

INSERT INTO bank(account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES(4, 644644644644, '������', 6444.40, '��������', TO_DATE('2023-10-1', 'YYYY-MM-DD'));

INSERT INTO bank(account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES(5, 498875624859, '�赿��', 930.09, '��������', TO_DATE('2023-9-28', 'YYYY-MM-DD'));

INSERT INTO BANK (account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES (6, '2222333344', '������', 3000.50, '��������', TO_DATE('2023-10-11', 'YYYY-MM-DD'));

INSERT INTO BANK (account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES (7, '5555666777', '���̵�', 1500.75, '��������', TO_DATE('2023-10-10', 'YYYY-MM-DD'));

INSERT INTO BANK (account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES (8, '8888999000', '����ȣ', 4000.00, '��������', TO_DATE('2023-10-09', 'YYYY-MM-DD'));

INSERT INTO BANK (account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES (9, '3333444555', '�輭��', 950.25, '��������', TO_DATE('2023-10-08', 'YYYY-MM-DD'));

INSERT INTO BANK (account_id, account_number, account_name, balance, branch_name, last_transaction_date)
VALUES (10, '6666777888', '�̵���', 3200.50, '��������', TO_DATE('2023-10-07', 'YYYY-MM-DD')); */

--�ܾ��� 1000�̻��� ������ ���¹�ȣ�� �ܾ� ��ȸ
SELECT account_number, balance FROM bank
WHERE balance >= 1000;

--���ð� '��������'�� ������ ���� ������ �̸� ��ȸ
SELECT account_name FROM bank WHERE branch_name = '��������';

--������ �ŷ� ��¥�� '2023-10-10' ������ ������ ���¹�ȣ�� ������ �ŷ� ��¥�� ��ȸ
SELECT account_number, last_transaction_date FROM bank WHERE last_transaction_date < '2023-10-10';

--�ܾ��� ���� ū ������ ���� ��ȣ�� �ܾ��� ��ȸ (��������)
SELECT account_number, balance
FROM bank
WHERE balance = (SELECT MAX(balance) FROM bank);

--�ܾ��� 500���� �۰� 1000���� ū ������ ���� ������ �̸� ��ȸ
SELECT account_name, balance
FROM bank
WHERE balance < 500 OR balance > 1000;

--���¹�ȣ�� 1002153226496 �ܾ��� 1500���� ����
UPDATE bank SET balance = 1500 WHERE account_number = 1002159226496;
SELECT * FROM bank WHERE account_number = 1002159226496;

--�ܾ��� 2000�̻��� ������ �ܾ��� 10% ����
UPDATE bank SET balance = 1.1 * balance WHERE balance >= 2000;

--�ܾ��� 0���� ���� ���°� �ִ��� Ȯ��
SELECT * FROM bank WHERE balance < 0;

--��� ������ ��� �ܾ� ���
SELECT AVG(balance) FROM bank;

--���ð� '��������'�� ������ ��� �ܾ� ���
SELECT branch_name, AVG(balance) AS "�������� ��� �ܾ�" FROM bank
GROUP BY branch_name
HAVING branch_name = '��������';

--�ŷ� ��¥ ���� ������� ������ �̸� ��ȸ
SELECT account_name, last_transaction_date FROM bank
ORDER BY last_transaction_date ASC;

--������ �ŷ� ��¥�� ���� ���� ������ ������ �̸� ��ȸ
SELECT account_name, last_transaction_date FROM bank
ORDER BY last_transaction_date ASC
FETCH FIRST 1 rows only;