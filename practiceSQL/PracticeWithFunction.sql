/*
UPDATE department SET dname = 'PERSONNEL' WHERE dno = 70;

UPDATE employee SET dno = 60 WHERE ename = 'ĭ��';

--���� ���� ���� �ʹ� ŭ (����: ~~, �ִ밪: ~~) ���� �߻��� > ��(Column)�� ��밪 �������ֱ�
ALTER TABLE employee MODIFY (job VARCHAR2(50 BYTE)); 
*/

--��� �޿��� 4000�̻��� �������� �μ� ã��
SELECT dno, AVG(SALARY) AS AVG_SAL
FROM employee
GROUP BY dno
HAVING AVG(SALARY) >= 4000;

--�޿��� 4000�̻��� ���� ���� ã��
SELECT COUNT(ename) 
FROM employee 
WHERE salary >=4000;

--�޿��� ���� ���� ���� ã��
SELECT ename, salary FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);

--���� ���� 3�� �̻��� �μ��� �μ� ��ȣ�� ������ ã��
SELECT dno, COUNT(ename) AS employeeNum
FROM employee
GROUP BY dno
HAVING COUNT(dno) >= 3;

--�μ����� ������ ���� �� ã��
SELECT dno, job, COUNT(*) AS JOB_COUNT
FROM employee
GROUP BY dno, job;

--�� �μ����� ���� ���� �޿� ã��
SELECT dno, MAX(salary)
FROM employee
GROUP BY dno;

--�� �μ����� ���� ���� �޿��� �޴� ���� �̸��� ���� ã��
SELECT dno, ename, salary 
FROM employee
WHERE salary IN (SELECT MAX(salary) FROM employee GROUP BY dno);


--�޿� �߰����� 3500 �̻��� �μ� ã�� HAVING MEDIAN(salary) >= 3500; ���
SELECT dno, Median(salary) AS medianSalary
FROM employee
GROUP BY dno
HAVING MEDIAN(salary) >=2000;

--�޿��� ��� �޿����� ���� �μ��� ���� �� ã�� (�������� Ȱ��)
SELECT dno, COUNT(*)
FROM employee
WHERE salary > (SELECT AVG(SALARY) FROM EMPLOYEE)
GROUP BY dno;

--�μ��� ��å���� ���� ���� 2�� �̻��� ��� ã�� count group by
SELECT dno, COUNT(ename)
FROM employee
COUNT GROUP BY dno
HAVING COUNT(ename) > 2;

--�μ����� ������ ���� �� ã��
SELECT dno, job, COUNT(*) AS JOB_COUNT
FROM employee
GROUP BY dno, job;

--�μ����� �ּ� �޿��� 3000 �̻��� ���� ã��

--�޿��� 5000 �̻��̰� Ŀ�̼��� ���� �ʴ� ����
SELECT ename
FROM employee
WHERE salary >= 5000 AND commission IS null ;

--�μ����� �޿� �հ谡 10000 �̻��̰� ���� ���� 2�� �̻��� �μ� ã��

--�μ����� ������ �Ի����ڰ� 2023-01-01 ������ ���� �� ã��

--�޿��� �� ��°�� ���� ���� ã��
--DISTINCT �ߺ� �����ϱ�

--�޿��� ���� ���� ���� ã��

--���� ���� ���� ���� �μ� ã��
SELECT E.DepartmentNum, E.EmployeesNum
FROM(SELECT dno AS DepartmentNum, COUNT(*) AS EmployeesNum
     FROM employee GROUP BY dno ORDER BY 2 DESC) E
WHERE ROWNUM = 1;

--------------------------------------------------------------------------------
--INNER JOIN ��ġ�ϴ� �ุ ��ȯ (JOIN�� ������ ���)
--LEFT JOIN ���� ���̺��� ��� ���� ��ȯ
--��� �μ��� �μ��� ���� ������ ��������
--���࿡ �μ��� ���� ������ ���� ��쿡�� �μ� ���� �����ϱ�
SELECT d.dno, d.dname, e.eno, e.ename
FROM department d
LEFT JOIN employee e ON d.dno = e.eno;
--RIGHT JOIN ������ ���̺��� ��� �� ��ȯ
--��� ������ ������ ���� �μ� ���� ��������
--�μ��� ������ ���� ��쵵 ���� ���� ����
SELECT e.eno, e.ename, d.dno, d.dname
FROM employee e
RIGHT JOIN department d ON e.dno = d.dno;

--FULL JOIN ���� ���̺��� ��� ���� ��ȯ

-----------------------------------<<<�Լ�>>>-----------------------------------
--NVL (Null Value ��¼��) : NULL ���� �ٸ� ������ ��ü
SELECT ename, NVL(commission, 0) AS commission
FROM employee;

--NEXT DAY ���� �־��� ���� ��¥ ã��
SELECT ename, next_day(sysdate, 'FRIDAY') AS next_day
FROM dual;
                                  
--TRUNC : ��¥ �Ǵ� ������ �Ҽ��� ����
SELECT ename, TRUNC(salary) AS trunc_salary FROM employee;

--FLOOR, CEIL, ROUND : ����/�ø�/�ݿø�
SELECT ename, FLOOR(salary) AS floor_salary FROM employee;
SELECT ename, CEIL(salary) AS ceil_salary FROM employee;
SELECT ename, ROUND(salary,2) AS round_salary FROM employee;

--ABS : ���밪 ��� (ABsolute)
SELECT ename, ABS(commission) AS abs_commission FROM employee;
--------------------------------------------------------------------------------