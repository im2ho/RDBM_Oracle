/*
UNION(���Ͽ�)
 SQL�� �� �� �̻��� SELECT�� ����� ���ļ� �ϳ��� ��� �������� ��ȯ�ϴ� ������
 �ߺ��� ���� �����ϰ� �ߺ��� ���� �������� �ʴ� ����� ����
*/

--employee ���̺��� ���� �̸��� ���� ����
--salagrade ���̺��� �޿� ����� �����Ͽ� ��ġ��

--���� �̸��� ���� ����
SELECT ename, salary
FROM employee

UNION

--�޿��������
SELECT 'salgrade' AS ename, grade AS salary
FROM salgrade;