/*
UPDATE department SET dname = 'PERSONNEL' WHERE dno = 70;

UPDATE employee SET dno = 60 WHERE ename = '칸쵸';

--열에 대한 값이 너무 큼 (실제: ~~, 최대값: ~~) 오류 발생시 > 열(Column)의 허용값 수정해주기
ALTER TABLE employee MODIFY (job VARCHAR2(50 BYTE)); 
*/

--평균 급여가 4000이상인 직원들의 부서 찾기
SELECT dno, AVG(SALARY) AS AVG_SAL
FROM employee
GROUP BY dno
HAVING AVG(SALARY) >= 4000;

--급여가 4000이상인 직원 수를 찾기
SELECT COUNT(ename) 
FROM employee 
WHERE salary >=4000;

--급여가 가장 높은 직원 찾기
SELECT ename, salary FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);

--직원 수가 3명 이상인 부서의 부서 번호와 직원수 찾기
SELECT dno, COUNT(ename) AS employeeNum
FROM employee
GROUP BY dno
HAVING COUNT(dno) >= 3;

--부서별로 직원의 직무 수 찾기
SELECT dno, job, COUNT(*) AS JOB_COUNT
FROM employee
GROUP BY dno, job;

--각 부서에서 가장 높은 급여 찾기
SELECT dno, MAX(salary)
FROM employee
GROUP BY dno;

--각 부서에서 가장 높은 급여를 받는 직원 이름과 같이 찾기
SELECT dno, ename, salary 
FROM employee
WHERE salary IN (SELECT MAX(salary) FROM employee GROUP BY dno);


--급여 중간값이 3500 이상인 부서 찾기 HAVING MEDIAN(salary) >= 3500; 사용
SELECT dno, Median(salary) AS medianSalary
FROM employee
GROUP BY dno
HAVING MEDIAN(salary) >=2000;

--급여가 평균 급여보다 높은 부서의 직원 수 찾기 (서브쿼리 활용)
SELECT dno, COUNT(*)
FROM employee
WHERE salary > (SELECT AVG(SALARY) FROM EMPLOYEE)
GROUP BY dno;

--부서와 직책별로 직원 수가 2명 이상인 경우 찾기 count group by
SELECT dno, COUNT(ename)
FROM employee
COUNT GROUP BY dno
HAVING COUNT(ename) > 2;

--부서별로 직원의 직무 수 찾기
SELECT dno, job, COUNT(*) AS JOB_COUNT
FROM employee
GROUP BY dno, job;

--부서별로 최소 급여가 3000 이상인 직원 찾기

--급여가 5000 이상이고 커미션을 받지 않는 직원
SELECT ename
FROM employee
WHERE salary >= 5000 AND commission IS null ;

--부서별로 급여 합계가 10000 이상이고 직원 수가 2명 이상인 부서 찾기

--부서별로 직원의 입사일자가 2023-01-01 이후인 직원 수 찾기

--급여가 두 번째로 높은 직원 찾기
--DISTINCT 중복 제거하기

--급여가 가장 높은 직무 찾기

--직원 수가 가장 많은 부서 찾기
SELECT E.DepartmentNum, E.EmployeesNum
FROM(SELECT dno AS DepartmentNum, COUNT(*) AS EmployeesNum
     FROM employee GROUP BY dno ORDER BY 2 DESC) E
WHERE ROWNUM = 1;

--------------------------------------------------------------------------------
--INNER JOIN 일치하는 행만 반환 (JOIN과 동일한 기능)
--LEFT JOIN 왼쪽 테이블의 모든 행을 반환
--모든 부서와 부서에 속한 직원을 가져오기
--만약에 부서에 속한 직원이 없는 경우에는 부서 정보 포함하기
SELECT d.dno, d.dname, e.eno, e.ename
FROM department d
LEFT JOIN employee e ON d.dno = e.eno;
--RIGHT JOIN 오른쪽 테이블의 모든 행 반환
--모든 직원과 직원이 속한 부서 정보 가져오기
--부서에 속하지 않은 경우도 직원 정보 포함
SELECT e.eno, e.ename, d.dno, d.dname
FROM employee e
RIGHT JOIN department d ON e.dno = d.dno;

--FULL JOIN 양쪽 테이블의 모든 행을 반환

-----------------------------------<<<함수>>>-----------------------------------
--NVL (Null Value 어쩌구) : NULL 값을 다른 값으로 대체
SELECT ename, NVL(commission, 0) AS commission
FROM employee;

--NEXT DAY 다음 주어진 요일 날짜 찾기
SELECT ename, next_day(sysdate, 'FRIDAY') AS next_day
FROM dual;
                                  
--TRUNC : 날짜 또는 숫자의 소수부 제거
SELECT ename, TRUNC(salary) AS trunc_salary FROM employee;

--FLOOR, CEIL, ROUND : 버림/올림/반올림
SELECT ename, FLOOR(salary) AS floor_salary FROM employee;
SELECT ename, CEIL(salary) AS ceil_salary FROM employee;
SELECT ename, ROUND(salary,2) AS round_salary FROM employee;

--ABS : 절대값 계산 (ABsolute)
SELECT ename, ABS(commission) AS abs_commission FROM employee;
--------------------------------------------------------------------------------