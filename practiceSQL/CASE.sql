--������ �޿��� 5000 �̻��� ��� "���", �� �ܴ� "����"���� ǥ��
SELECT ename, salary,
    CASE --���� ������ ���� �� �ְ�, ������ �����ϴ� ��� �ٸ� ��� ��ȯ
        WHEN salary >= 5000 THEN '���' --�޿��� 5000 �̻��� ��� ��� ��ȯ
        ELSE '����' --�� ���ǿ� �ش����� �ʴ� ��� '����'���� ��ȯ
    END AS salary_Category
    --END : CASE���� ���� ��Ÿ���� Ű����
FROM employee; --employee ���̺���

--���޿� ���� ���ʽ� ���
SELECT ename, job, salary,
    CASE job
        WHEN 'MANAGER' THEN salary*0.15
        WHEN 'DEVELOPER' THEN salary*0.1
        WHEN 'SALESPerson' THEN salary*0.05
        ELSE 0
    END AS BONUS
FROM employee;

--�޿� ���� ����
SELECT ename, salary,
    CASE 
        WHEN salary >= 5000 THEN '���'
        WHEN salary >=3000 AND salary <5000 THEN '�߰�'
        ELSE '����'
    END AS salary_Range
FROM employee;

--���� �Ի� ������ ���� ��� ���
SELECT ename,
    CASE 
        WHEN EXTRACT(YEAR FROM hiredate) = 2021 THEN '1�� �̸�'
        WHEN EXTRACT(YEAR FROM hiredate) = 2022 THEN '1��'
        ELSE '���ι�'
    END
FROM employee;

--���� �޿��� õ ������ �ݿø�
SELECT ename,
    CASE
        WHEN salary>0 THEN ROUND(salary,0)
    END
FROM employee;

--������ �޿��� ���� ��� ����
SELECT ename, salary,
    CASE
        WHEN salary<= 2000 THEN '�����'
        WHEN salary>2000 AND salary<= 3000 THEN '�ǹ�'
        WHEN salary>3000 AND salary<=5000 THEN '���' 
        ELSE '�÷�Ƽ��'
    END AS Ƽ��
FROM employee;

--�μ��� ���� �� ��� �� �μ� ���� ����
    --3��: �߱Ը�, 5��: ��Ը�
SELECT dno, COUNT(dno),
    CASE 
        WHEN COUNT(dno)>=3 AND COUNT(dno)<5 THEN '�߱Ը�'
        WHEN COUNT(dno)>5 THEN '��Ը�'
        ELSE '�ұԸ�'
    END AS �μ��Ը�
FROM employee 
GROUP BY dno;

--������ �Ի� ���� ���� ��� ���
    --10�� 1���� 9���� 2���� �������� 3���� �̻�
SELECT ename,
    CASE
        WHEN EXTRACT(MONTH FROM hiredate) = 10 THEN '1����'
        WHEN EXTRACT(MONTH FROM hiredate) = 9 THEN '2����'
        ELSE '3���� �̻�'
    END AS ���
FROM employee;
    