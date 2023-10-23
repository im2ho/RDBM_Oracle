--Basic SELECT

--1. �а� �̸��� �迭 ǥ��
SELECT department_name "�а� ��", category "�迭" FROM tb_department;

--2.�а��� �а� ���� ���
SELECT
department_name || '�� ������ ' || capacity || '�� �Դϴ�.' as "�а��� ����"
FROM tb_department;

SELECT CONCAT(CONCAT(CONCAT(department_name, '�� ������ '), capacity), '�� �Դϴ�.')
FROM tb_department;

--3. "������а�"�� �ٴϴ� ���л� �� ���� �������� ���л��� �̸�
SELECT td.department_name, ts.student_name, ts.absence_yn
FROM tb_student ts
JOIN tb_department td ON td.department_no = ts.department_no
WHERE td.department_name = '������а�' AND ts.absence_yn = 'Y' AND INSTR(ts.student_ssn,'2')=8;

--���� �������� ���л����� �й� �� �̸�
SELECT student_no, student_name, student_ssn ,absence_yn
FROM tb_student 
WHERE absence_yn = 'Y' AND INSTR(student_ssn,'2')=8; --student_ssn : �ֹι�ȣ > 8��° �ڸ��� 2�� ����� ������ ����

--4. ���������� ���� ���� ��� ��ü�ڵ��� �̸��� ã�� by �й�
SELECT student_name AS where_in FROM tb_student
WHERE student_no IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY student_name DESC;

--5. ���������� 20�� �̻� 30�� ������ �а����� �а� �̸��� �迭
SELECT department_name, category, capacity
FROM tb_department
WHERE capacity>=20 AND capacity<=30;

SELECT department_name, category, capacity
FROM tb_department
WHERE capacity between 20 AND 30;

--6. ������ ������ ��� ������ �Ҽ� �а��� ���������� ��, ������ �̸��� �˾Ƴ���
SELECT professor_name FROM tb_professor
WHERE department_no IS NULL;

--7. �а��� �������� ���� �л��� �ִ��� �����ϱ�
SELECT * FROM tb_student
WHERE department_no IS NULL;

--8. ���������� �����ϴ� ������� �����ȣ
SELECT class_no FROM tb_class
WHERE preattending_class_no IS NOT NULL;

--9. �� ���б��� �����ϴ� �迭 ��ȸ
SELECT category 
FROM tb_department
GROUP BY category
ORDER BY category ASC;

SELECT distinct category
FROM tb_department
ORDER BY category ASC;

--10. 02�й� ���� ������ ��� (���з� ����, ���л��� �й� �̸� �ֹι�ȣ��)
SELECT student_no, student_name, student_ssn
FROM tb_student
WHERE 
absence_yn = 'N' AND 
TO_CHAR(entrance_date) LIKE '02%' AND --�ƴϸ� student_no like 'A2%'
student_address LIKE '%����%'
ORDER BY student_name ASC;