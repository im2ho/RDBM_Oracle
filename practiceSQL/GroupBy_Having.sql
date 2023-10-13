--문제1: 부서별 평균 연봉

--오답 : ERROR 단일 그룹의 집계 함수가 아니다
SELECT dno, AVG(salary)
FROM employee;

--GROUP BY 절에서 그룹단위를 표시해주여야 SELECT 절에서 그룹 단위의 컬럼과 집계 함수 사용 가능

--정답
SELECT dno, AVG(salary) AS "평균연봉"
FROM employee
GROUP BY dno; --GROUP BY 절에는 ALIAS 사용 불가

--문제2: 직원들의 부서별 평균 연봉을 구하는데 평균 연봉이 3000 이상인 정보만 표시

--오답 : ERROR 집계 함수는 허가되지 않음
SELECT dno, AVG(salary)
FROM employee
WHERE AVG(salary) > 3000 --WHERE 절에는 집계함수 사용 불가
-- WHERE 절은 FROM 절에 정의된 집합의 '개별 행'에 조건을 적용하므로 집계함수 불가
GROUP BY dno;

--정답
SELECT dno, AVG(salary)
FROM employee
GROUP BY dno
HAVING AVG(salary) > 3000; --GROUP BY 절에서 정의한 소그룹의 집계 함수를 이용한 조건 표시 가능
--HAVING 절은 GROUP BY까지 실행된 결과 집합의 행에 조건을 적용
--WHERE 절과 다르게 '그룹을 나타내는' 결과 집합의 행에 조건이 적용된다 (WHERE은 개별행)

--문제3: 직원들 중 부서번호 30과 70의 인원수는 얼마인가?
SELECT dno, COUNT(*)
FROM employee
WHERE dno IN (30,70) --WHERE dno=30 OR dno=70 으로도 작성해도 결과가 같음
GROUP BY dno;

--문제4: 부서별 평균 연봉을 출력하는데, 최대 연봉이 3000 이상인 직원을 가지고있는 부서 내 정보만 출력한다
SELECT dno, AVG(salary)
FROM employee
GROUP BY dno
HAVING MAX(salary) > 3000;
--HAVING 절은 SELECT 절에 사용되지 않은 칼럼이나 집계 함수가 아니더라도 GROUP BY 절의 
--기준 항목이나 소그룹의 집계 함수를 이용한 조건을 표시 가능

--문제5: GROUP BY 없이 전체 직원들의 부서별 평균 연봉 및 전체 평균 연봉 출력(소수점 두 자리까지)
SELECT
ROUND(AVG(salary),2) AS "전체평균연봉",
ROUND(AVG(CASE WHEN dno=10 THEN salary END),2) AS "부서번호10 평균연봉",
ROUND(AVG(CASE WHEN dno=20 THEN salary END),2) AS "부서번호20 평균연봉",
ROUND(AVG(CASE WHEN dno=30 THEN salary END),2) AS "부서번호30 평균연봉",
ROUND(AVG(CASE WHEN dno=40 THEN salary END),2) AS "부서번호40 평균연봉",
ROUND(AVG(CASE WHEN dno=50 THEN salary END),2) AS "부서번호50 평균연봉",
ROUND(AVG(CASE WHEN dno=60 THEN salary END),2) AS "부서번호60 평균연봉",
ROUND(AVG(CASE WHEN dno=70 THEN salary END),2) AS "부서번호70 평균연봉"
FROM employee;