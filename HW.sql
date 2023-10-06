//���̺� ��ü ���� ��ȸ SELECT (* : ���ã��)
//��� ��� ���� ��ȸ
SELECT * FROM employee;

//WHERE�� ���� �ɾ ��ȸ (���̺�� WHERE �÷��� = ã���������;)
//����ȣ�� 7698�� ��� ��ȸ
SELECT * FROM employee WHERE manager = 7698;

/*
SELECT * FROM employee WHERE salary 
    BETWEEN (SELECT losal FROM salagrade WHERE grade = 3)
        AND(SELECT hisal FROM salagrade WHERE grade =3);
*/
        
--�������� UPDATE--

//UPDATE ���̺�� SET ������Ʈ�Һκ�(�÷� = ������Ʈ����) =  WHERE �����ұ���(�÷� = ����) 
//����������� (�����ȣ 7369�� �޿��� 1000���� ����)
UPDATE employee SET salary = 1000 WHERE ENO = 7369;

//�����ȣ�� 7369�� ����� �޿��� 2000���� ������Ʈ
UPDATE employee SET salary = 2000 WHERE ENO = 7369;

//�μ���ȣ�� 10�� ������� �޿��� 3000���� ������Ʈ (�η���..)
UPDATE employee SET salary = 3000 WHERE DNO = 10;

//Ư�� �μ��� ��� ��� ���� ������Ʈ
//�μ� ��ȣ 30�� ���� ��� ����� ������ 'MANAGER'�� ����
UPDATE employee SET job = 'MANAGER' WHERE dno = 30;

//Ư�� ����� ��� ������Ʈ
//�����ȣ 7499�� ��縦 �����ȣ 7566���� ����
UPDATE employee SET manager = 7566 WHERE eno = 7499; 

//Ư�� �μ��� ��� ����� �޿� �λ�
//�μ���ȣ 20�� ���� ��� ����� �޿��� 10% �λ�
UPDATE employee SET salary = (salary*1.1) WHERE dno = 20;

//Ư�� ����� �޿��� ������ ������Ʈ
//�����ȣ 7788 �޿��� 3500, �����Ḧ 500���� ���� (,�� ���� �κ� �̾�� �����Կ�)
UPDATE employee SET salary = 3500, commission = 500 WHERE eno = 7788;

//Ư�� ����� ������� ���� (��: ��� ��ȣ 7521�� ������ڸ� '2022-01-15'�� ����)
UPDATE employee SET hiredate = '2022-01-15' WHERE eno = 7521;

//Ư�� �޿� ����� �ּ� �޿� ���� (��: �޿� ��� 1�� �ּ� �޿��� 700���� 750���� ����):
UPDATE salgrade SET losal = 750 WHERE grade = 1;

//Ư�� �μ��� ������� �ٸ� �μ��� �̵� (��: �μ� ��ȣ 40�� ���� ��� ����� �μ� ��ȣ 10���� �̵�):
//�μ� ������ INSERT�� �߰����ּ���
UPDATE employee SET dno = 10 WHERE dno = 40;

//Ư�� �޿� ��� ���� (��: �޿� ��� 5 ����):
DELETE salgrade WHERE grade = 5;

//Ư�� �μ��� ���� ����� ��� ���� ���� (��: �μ� ��ȣ 30�� ���� ��� ��� ����):
DELETE employee WHERE dno = 30;

//���ο� ����� EMPLOYEE ���̺� �߰��ϴ� SQL��:
INSERT INTO employee(eno, ename, job, manager, hiredate, salary, commission, dno)
    VALUES(7789, 'ĭ��', '����', NULL, '2023-10-06', 8000, NULL, 30);

//SMITH�� ������� ã��
SELECT * FROM employee WHERE ENAME = 'SMITH';

//��� ����� �̸��� �޿��� �����ϴ� SQL��:
SELECT ename, salary FROM employee;

//EMPLOYEE ���̺��� �μ� ��ȣ�� 10�̰�(AND) ������ 'CLERK'�� ������� ���AVG() �޿��� ����
SELECT AVG(salary) FROM employee WHERE dno = 10 AND job = 'CLERK';

//EMPLOYEE ���̺��� �޿��� 1500���� 2500 ������ ������� �̸��� �޿��� ����
//where ���� between ���
SELECT ename, salary FROM employee WHERE salary BETWEEN 1500 AND 2500;

//EMPLOYEE ���̺��� �����ڰ� ���� ����� �̸��� ���� (IS NULL)
SELECT ename FROM employee WHERE MANAGER IS NULL;