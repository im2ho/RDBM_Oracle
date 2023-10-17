--Basic SELECT

--1. 학과 이름과 계열 표시
SELECT department_name "학과 명", category "계열" FROM tb_department;

--2.학과의 학과 정원 출력
SELECT
department_name || '의 정원은 ' || capacity || '명 입니다.' as "학과별 정원"
FROM tb_department;

SELECT CONCAT(CONCAT(CONCAT(department_name, '의 정원은 '), capacity), '명 입니다.')
FROM tb_department;

--3. "국어국문학과"에 다니는 여학생 중 현재 휴학중인 여학생의 이름
SELECT td.department_name, ts.student_name, ts.absence_yn
FROM tb_student ts
JOIN tb_department td ON td.department_no = ts.department_no
WHERE td.department_name = '국어국문학과' AND ts.absence_yn = 'Y' AND INSTR(ts.student_ssn,'2')=8;

--현재 휴학중인 여학생들의 학번 및 이름
SELECT student_no, student_name, student_ssn ,absence_yn
FROM tb_student 
WHERE absence_yn = 'Y' AND INSTR(student_ssn,'2')=8; --student_ssn : 주민번호 > 8번째 자리가 2인 사람의 정보를 추출

--4. 도서관에서 대출 도서 장기 연체자들의 이름을 찾기 by 학번
SELECT student_name AS where_in FROM tb_student
WHERE student_no IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY student_name DESC;

--5. 입학정원이 20명 이상 30명 이하인 학과들의 학과 이름과 계열
SELECT department_name, category, capacity
FROM tb_department
WHERE capacity>=20 AND capacity<=30;

SELECT department_name, category, capacity
FROM tb_department
WHERE capacity between 20 AND 30;

--6. 총장을 제외한 모든 교수가 소속 학과를 가지고있을 때, 총장의 이름을 알아내기
SELECT professor_name FROM tb_professor
WHERE department_no IS NULL;

--7. 학과가 지정되지 않은 학생이 있는지 점검하기
SELECT * FROM tb_student
WHERE department_no IS NULL;

--8. 선수과목이 존재하는 과목들의 과목번호
SELECT class_no FROM tb_class
WHERE preattending_class_no IS NOT NULL;

--9. 춘 대학교에 존재하는 계열 조회
SELECT category 
FROM tb_department
GROUP BY category
ORDER BY category ASC;

SELECT distinct category
FROM tb_department
ORDER BY category ASC;

--10. 02학번 전주 거주자 출력 (휴학러 제외, 재학생의 학번 이름 주민번호만)
SELECT student_no, student_name, student_ssn
FROM tb_student
WHERE 
absence_yn = 'N' AND 
TO_CHAR(entrance_date) LIKE '02%' AND --아니면 student_no like 'A2%'
student_address LIKE '%전주%'
ORDER BY student_name ASC;