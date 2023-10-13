--����1: �μ��� ��� ����

--���� : ERROR ���� �׷��� ���� �Լ��� �ƴϴ�
SELECT dno, AVG(salary)
FROM employee;

--GROUP BY ������ �׷������ ǥ�����ֿ��� SELECT ������ �׷� ������ �÷��� ���� �Լ� ��� ����

--����
SELECT dno, AVG(salary) AS "��տ���"
FROM employee
GROUP BY dno; --GROUP BY ������ ALIAS ��� �Ұ�

--����2: �������� �μ��� ��� ������ ���ϴµ� ��� ������ 3000 �̻��� ������ ǥ��

--���� : ERROR ���� �Լ��� �㰡���� ����
SELECT dno, AVG(salary)
FROM employee
WHERE AVG(salary) > 3000 --WHERE ������ �����Լ� ��� �Ұ�
-- WHERE ���� FROM ���� ���ǵ� ������ '���� ��'�� ������ �����ϹǷ� �����Լ� �Ұ�
GROUP BY dno;

--����
SELECT dno, AVG(salary)
FROM employee
GROUP BY dno
HAVING AVG(salary) > 3000; --GROUP BY ������ ������ �ұ׷��� ���� �Լ��� �̿��� ���� ǥ�� ����
--HAVING ���� GROUP BY���� ����� ��� ������ �࿡ ������ ����
--WHERE ���� �ٸ��� '�׷��� ��Ÿ����' ��� ������ �࿡ ������ ����ȴ� (WHERE�� ������)

--����3: ������ �� �μ���ȣ 30�� 70�� �ο����� ���ΰ�?
SELECT dno, COUNT(*)
FROM employee
WHERE dno IN (30,70) --WHERE dno=30 OR dno=70 ���ε� �ۼ��ص� ����� ����
GROUP BY dno;

--����4: �μ��� ��� ������ ����ϴµ�, �ִ� ������ 3000 �̻��� ������ �������ִ� �μ� �� ������ ����Ѵ�
SELECT dno, AVG(salary)
FROM employee
GROUP BY dno
HAVING MAX(salary) > 3000;
--HAVING ���� SELECT ���� ������ ���� Į���̳� ���� �Լ��� �ƴϴ��� GROUP BY ���� 
--���� �׸��̳� �ұ׷��� ���� �Լ��� �̿��� ������ ǥ�� ����

--����5: GROUP BY ���� ��ü �������� �μ��� ��� ���� �� ��ü ��� ���� ���(�Ҽ��� �� �ڸ�����)
SELECT
ROUND(AVG(salary),2) AS "��ü��տ���",
ROUND(AVG(CASE WHEN dno=10 THEN salary END),2) AS "�μ���ȣ10 ��տ���",
ROUND(AVG(CASE WHEN dno=20 THEN salary END),2) AS "�μ���ȣ20 ��տ���",
ROUND(AVG(CASE WHEN dno=30 THEN salary END),2) AS "�μ���ȣ30 ��տ���",
ROUND(AVG(CASE WHEN dno=40 THEN salary END),2) AS "�μ���ȣ40 ��տ���",
ROUND(AVG(CASE WHEN dno=50 THEN salary END),2) AS "�μ���ȣ50 ��տ���",
ROUND(AVG(CASE WHEN dno=60 THEN salary END),2) AS "�μ���ȣ60 ��տ���",
ROUND(AVG(CASE WHEN dno=70 THEN salary END),2) AS "�μ���ȣ70 ��տ���"
FROM employee;