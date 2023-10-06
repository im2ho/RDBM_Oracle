//테이블 전체 내용 조회 SELECT (* : 모두찾기)
//모든 사원 정보 조회
SELECT * FROM employee;

//WHERE로 조건 걸어서 조회 (테이블명 WHERE 컬럼명 = 찾고싶은내용;)
//상사번호가 7698인 사원 조회
SELECT * FROM employee WHERE manager = 7698;

/*
SELECT * FROM employee WHERE salary 
    BETWEEN (SELECT losal FROM salagrade WHERE grade = 3)
        AND(SELECT hisal FROM salagrade WHERE grade =3);
*/
        
--정보수정 UPDATE--

//UPDATE 테이블명 SET 업데이트할부분(컬럼 = 업데이트내용) =  WHERE 수정할구역(컬럼 = 내용) 
//사원정보수정 (사원번호 7369의 급여를 1000으로 조정)
UPDATE employee SET salary = 1000 WHERE ENO = 7369;

//사원번호가 7369인 사원의 급여를 2000으로 업데이트
UPDATE employee SET salary = 2000 WHERE ENO = 7369;

//부서번호가 10인 사람들의 급여를 3000으로 업데이트 (부럽다..)
UPDATE employee SET salary = 3000 WHERE DNO = 10;

//특정 부서의 모든 사원 직무 업데이트
//부서 번호 30에 속한 모든 사원의 직무를 'MANAGER'로 변경
UPDATE employee SET job = 'MANAGER' WHERE dno = 30;

//특정 사원의 상사 업데이트
//사원번호 7499의 상사를 사원번호 7566으로 변경
UPDATE employee SET manager = 7566 WHERE eno = 7499; 

//특정 부서의 모든 사원의 급여 인상
//부서번호 20에 속한 모든 사원의 급여를 10% 인상
UPDATE employee SET salary = (salary*1.1) WHERE dno = 20;

//특정 사원의 급여와 수수료 업데이트
//사원번호 7788 급여를 3500, 수수료를 500으로 변경 (,로 변경 부분 이어쓰기 가능함요)
UPDATE employee SET salary = 3500, commission = 500 WHERE eno = 7788;

//특정 사원의 고용일자 변경 (예: 사원 번호 7521의 고용일자를 '2022-01-15'로 변경)
UPDATE employee SET hiredate = '2022-01-15' WHERE eno = 7521;

//특정 급여 등급의 최소 급여 변경 (예: 급여 등급 1의 최소 급여를 700에서 750으로 변경):
UPDATE salgrade SET losal = 750 WHERE grade = 1;

//특정 부서의 사원들을 다른 부서로 이동 (예: 부서 번호 40에 속한 모든 사원을 부서 번호 10으로 이동):
//부서 없으면 INSERT로 추가해주세용
UPDATE employee SET dno = 10 WHERE dno = 40;

//특정 급여 등급 삭제 (예: 급여 등급 5 삭제):
DELETE salgrade WHERE grade = 5;

//특정 부서에 속한 사원의 모든 정보 삭제 (예: 부서 번호 30에 속한 모든 사원 삭제):
DELETE employee WHERE dno = 30;

//새로운 사원을 EMPLOYEE 테이블에 추가하는 SQL문:
INSERT INTO employee(eno, ename, job, manager, hiredate, salary, commission, dno)
    VALUES(7789, '칸쵸', '대장', NULL, '2023-10-06', 8000, NULL, 30);

//SMITH의 사원정보 찾기
SELECT * FROM employee WHERE ENAME = 'SMITH';

//모든 사원의 이름과 급여를 선택하는 SQL문:
SELECT ename, salary FROM employee;

//EMPLOYEE 테이블에서 부서 번호가 10이고(AND) 직무가 'CLERK'인 사원들의 평균AVG() 급여를 선택
SELECT AVG(salary) FROM employee WHERE dno = 10 AND job = 'CLERK';

//EMPLOYEE 테이블에서 급여가 1500에서 2500 사이인 사원들의 이름과 급여를 선택
//where 에서 between 사용
SELECT ename, salary FROM employee WHERE salary BETWEEN 1500 AND 2500;

//EMPLOYEE 테이블에서 관리자가 없는 사원의 이름을 선택 (IS NULL)
SELECT ename FROM employee WHERE MANAGER IS NULL;