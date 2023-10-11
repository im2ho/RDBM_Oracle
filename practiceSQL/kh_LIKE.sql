/*
CREATE TABLE menu(
    menu_id INT PRIMARY KEY,
    cafe_id INT,
    mname VARCHAR(255) NOT NULL,
    price NUMBER(8,2) NOT NULL,
    CONSTRAINT fk_cafe --��������
        FOREIGN KEY (cafe_id)
        REFERENCES cafes(cafe_id) --FOREINGŰ ���� �� ���輳��
);
ALTER TABLE menu ADD description VARCHAR2(500);
*/

--���￡ ��ġ�� ��� ī�� ��ȸ
SELECT * FROM cafes WHERE address LIKE '%����%'; --LIKE�� %

--�޴� �̸��� '��ũ'�� �ִ� ī�� ã��..
SELECT c.cname AS ī���, m.mname AS �޴���
FROM cafes c
JOIN menu m ON c.cafe_id = m.cafe_id
WHERE m.mname LIKE '%��ũ%';

--�ָ��� ��Ǵ� ī����
SELECT * FROM cafes WHERE cafes.operating_hours LIKE '%�ָ�%';

--�ָ��� ����ϴ�
SELECT * FROM cafes WHERE cafes.operating_hours NOT LIKE '%�ָ�%';

--02�� �����ϴ� ��ȭ��ȣ�� ������ ������ ī�� ã��
SELECT * FROM cafes WHERE cafes.phone_number LIKE '02%';

--�̸��� �󶼰� ���Ե� ī�� ã��
SELECT * FROM cafes WHERE cafes.cname LIKE '%��%';

--4.00 �̸��� ������ ���� �޴� �׸� ã��
SELECT * FROM menu WHERE menu.price < 4.00;

--���� ��Ǵ� ī�� ã��
SELECT * FROM cafes WHERE cafes.operating_hours LIKE '%����%';

--���� ��ǰ� ���� 4.00 �̸��� ������ ���� ī�� ã��
SELECT c.cname, m.mname, m.price, c.operating_hours 
FROM cafes c
JOIN menu m ON c.cafe_id = m.cafe_id
WHERE m.price < 4.00 AND c.operating_hours LIKE '%����%';

--'��'��� ���ڸ� ������ �̸��� ���� ī�� ã��
SELECT cname FROM cafes WHERE cname LIKE '%��%';

--��� ī���� �޴� �׸� �� ���:
SELECT c.cname AS ī���, COUNT(m.menu_id) AS �޴���
FROM cafes c
LEFT JOIN menu m ON c.cafe_id = m.cafe_id
GROUP BY c.cname;

--�޴� ���� '���ϸ�'�� ���Ե� ī�� ã��:
SELECT c.cname, m.mname, m.description FROM cafes c
JOIN menu m ON c.cafe_id = m.cafe_id
WHERE m.description LIKE '%���ϸ�%';

--�� ī�亰.. ��� �޴� �׸��� �� ���� ���: ?
SELECT c.cname, SUM(m.price) 
FROM cafes c
JOIN menu m ON c.cafe_id = m.cafe_id
GROUP BY c.cname;

--'HP'�� ���� ���Ե� �޴� �׸��� �ִ� ī�� ����:
SELECT c.cname, m.mname, m.description FROM cafes c
JOIN menu m ON c.cafe_id = m.cafe_id
WHERE m.description LIKE '%HP%';

SELECT SUM(price)
FROM cafes
JOIN menu ON cafes.cafe_id = menu.menu_id;