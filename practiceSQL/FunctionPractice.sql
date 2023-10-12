--DUAL : ���̺��� ������ ��¼�� �ϰ�;�
SELECT REPLACE ('Hello, World!', 'Hello', 'Hi') FROM DUAL;
SELECT 'Hello' || 'World!' AS textSum From DUAL;

--LOWER : ���ڿ��� �ҹ��ڷ� ��ȯ
SELECT LOWER('Hello, World!') FROM DUAL;
--UPPER : ���ڿ��� �빮�ڷ� ��ȯ
SELECT UPPER('Hello, World!') FROM DUAL;
--INITCAP : �� �ܾ��� ù ���ڸ� �빮�ڷ� ��ȯ
SELECT INITCAP('hello world') FROM DUAL;
--SUBSTR : ���ڿ��� (1~5) �Ϻκ� ����

--TRIM ' Hello, World ' �� ���� ���� ����
SELECT RTRIM(' Hello, World', 'd') FROM DUAL;
SELECT TRIM(' Hello, World ') FROM DUAL; --������ �Ⱦ��� ������ ���ŵȴ� ����

--�������� Ȱ���ؼ� ���� ��� å�� ���� ��������
SELECT * FROM bookcafe
WHERE price = (SELECT MAX(PRICE) FROM bookcafe);

--������ �Լ� RANK Ȱ���ؼ� �� �帣���� ���� ��� å �������� or ROW_NUMBER()
SELECT title AS "�帣�� ���� ��� å", genre
FROM(SELECT b.*, ROW_NUMBER() OVER(PARTITION BY genre ORDER BY price DESC) rn
        FROM bookcafe b)
WHERE rn = 1;

--���̺� ���� ���� 5���� å ��������
SELECT * FROM (
    SELECT ROWNUM rn, b.* FROM bookcafe b)
WHERE rn <= 5;

--�� ���ڰ� �� å ���� 2�� �̻��� ���� ã��

--Romance �帣�� å �߿��� ���� ��� å
SELECT title, price, genre FROM bookcafe
WHERE price = (SELECT MAX(PRICE) FROM bookcafe WHERE genre='Romance');

--�� �帣���� ��� ���ݰ� �ְ� ���� ��������
SELECT * FROM (
    SELECT genre, price, AVG(price) OVER(PARTITION BY genre) avg_price FROM bookcafe)
PIVOT (
    MAX(price), AVG(avg_price)
    FOR genre IN('Fiction', 'SHORT Story'));
    
--���ݴ� ���� å�� �Ǹŷ�(CASE�� JOIN)
-- (price < 10  '��������� ������ �� �ִ� å' 10 AND price < 20 THEN '���� å')
--'�Ҽ�' �帣�� å�� 'Novel' �帣�� å ��ġ�� (UNION)
--å�� ���� �⵵�� �� �ؿ� ���ǵ� å ��