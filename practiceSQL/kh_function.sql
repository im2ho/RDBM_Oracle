--------�Լ� Function--------

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
--To Date �Լ� ����ؼ� ��¥ �������� ������ ����

INSERT INTO fridaytable (id, name, description, birthdate)
VALUES (1, '����ȣ', '������', TO_DATE('1995-05-25', 'YYYY-MM-DD'));

INSERT INTO fridaytable (id, name, description, birthdate)
VALUES (2, '��ȣ��', '���', TO_DATE('1997-08-16', 'YYYY-MM-DD'));

INSERT INTO fridaytable (id, name, description, birthdate)
VALUES (3, '���ؿ�', '�ֳ�', TO_DATE('1999-06-22', 'YYYY-MM-DD'));

INSERT INTO fridaytable (id, name, description, birthdate)
VALUES (4, '�迹��', '����', TO_DATE('1996-11-29', 'YYYY-MM-DD'));

INSERT INTO fridaytable (id, name, description, birthdate)
VALUES (5, '�ѿ���', '�ٺ�', TO_DATE('2000-02-09', 'YYYY-MM-DD'));
*/

--ORDER BY : ��� ����
SELECT * FROM fridaytable ORDER BY name; //�̸� ���� �������� ����
SELECT * FROM fridaytable ORDER BY birthdate; //���̼� ����

--COUNT : ���� ���� �����ش�
SELECT COUNT(*) AS row_count FROM fridaytable; //AS: ���� ������ ���� ������ �̸�

--���̺� ���� �����ϱ�
--���� ũ�� �ø���
ALTER TABLE fridaytable MODIFY description VARCHAR2(200); //200���� �÷���

--SUM : ���� ���� ���� ���
SELECT SUM(id) AS id_sum FROM fridaytable; //��� id ���� �ջ�

--TO_CHAR : ��¥�� ���ڿ��� ��ȯ
SELECT name, TO_CHAR(birthdate, 'YYYY-MM-DD') AS birthdate_str FROM fridaytable;

--Length : ���ڿ��� ���� ��ȯ
SELECT name, description, LENGTH(description) AS discription_len FROM fridaytable;

/*
INSERT INTO fridaytable (id, name, description, birthdate)
VALUES(6, '�Ѻ�', '�ư��ÿ������', TO_DATE('2017-05-05', 'YYYY-MM-DD'));

INSERT INTO fridaytable (id, name, description, birthdate)
VALUES(7, 'Windy', 'Pokemon of Legend', TO_DATE('2017-05-05', 'YYYY-MM-DD'));
*/

--UPPER : ���ڿ��� �빮�ڷ� ��ȯ
SELECT name, UPPER(name), UPPER(description) FROM fridaytable;
--LOWER : ���ڿ��� �ҹ��ڷ� ��ȯ
SELECT name, LOWER(name), LOWER(description) FROM fridaytable;

--ROUND : ���ڸ� �ݿø�
--birthdate ���� ������ �ݿø��Ͽ� ���
--EXTRACT ��¥ ������ ������ ����
SELECT name, ROUND(EXTRACT(YEAR FROM birthdate)) AS BirthYear FROM fridaytable;