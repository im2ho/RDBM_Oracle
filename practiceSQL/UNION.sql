/*
UNION(유니온)
 SQL의 두 개 이상의 SELECT문 결과를 합쳐서 하나의 결과 집합으로 반환하는 연산자
 중복된 행을 제거하고 중복된 행을 포함하지 않는 결과를 생성
*/

--employee 테이블에서 직원 이름과 연봉 추출
--salagrade 테이블에서 급여 등급을 추출하여 합치기

--직원 이름과 연봉 추출
SELECT ename, salary
FROM employee

UNION

--급여등급추출
SELECT 'salgrade' AS ename, grade AS salary
FROM salgrade;