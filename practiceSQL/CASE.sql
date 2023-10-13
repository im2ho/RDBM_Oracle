--직원의 급여가 5000 이상인 경우 "고액", 그 외는 "보통"으로 표시
SELECT ename, salary,
    CASE --여러 조건을 비교할 수 있고, 조건을 만족하는 경우 다른 결과 반환
        WHEN salary >= 5000 THEN '고액' --급여가 5000 이상인 경우 고액 반환
        ELSE '보통' --위 조건에 해당하지 않는 경우 '보통'으로 반환
    END AS salary_Category
    --END : CASE문의 끝을 나타내는 키워드
FROM employee; --employee 테이블에서

--직급에 따라 보너스 계산
SELECT ename, job, salary,
    CASE job
        WHEN 'MANAGER' THEN salary*0.15
        WHEN 'DEVELOPER' THEN salary*0.1
        WHEN 'SALESPerson' THEN salary*0.05
        ELSE 0
    END AS BONUS
FROM employee;

--급여 범위 지정
SELECT ename, salary,
    CASE 
        WHEN salary >= 5000 THEN '고액'
        WHEN salary >=3000 AND salary <5000 THEN '중간'
        ELSE '보통'
    END AS salary_Range
FROM employee;

--직원 입사 연도에 따른 경력 계산
SELECT ename,
    CASE 
        WHEN EXTRACT(YEAR FROM hiredate) = 2021 THEN '1년 미만'
        WHEN EXTRACT(YEAR FROM hiredate) = 2022 THEN '1년'
        ELSE '고인물'
    END
FROM employee;

--직원 급여를 천 단위로 반올림
SELECT ename,
    CASE
        WHEN salary>0 THEN ROUND(salary,0)
    END
FROM employee;

--직원의 급여에 따른 등급 지정
SELECT ename, salary,
    CASE
        WHEN salary<= 2000 THEN '브론즈'
        WHEN salary>2000 AND salary<= 3000 THEN '실버'
        WHEN salary>3000 AND salary<=5000 THEN '골드' 
        ELSE '플래티넘'
    END AS 티어
FROM employee;

--부서별 직원 수 계산 및 부서 유형 지정
    --3명: 중규모, 5명: 대규모
SELECT dno, COUNT(dno),
    CASE 
        WHEN COUNT(dno)>=3 AND COUNT(dno)<5 THEN '중규모'
        WHEN COUNT(dno)>5 THEN '대규모'
        ELSE '소규모'
    END AS 부서규모
FROM employee 
GROUP BY dno;

--직원의 입사 월에 따른 경력 계산
    --10월 1개월 9월은 2개월 나머지는 3개월 이상
SELECT ename,
    CASE
        WHEN EXTRACT(MONTH FROM hiredate) = 10 THEN '1개월'
        WHEN EXTRACT(MONTH FROM hiredate) = 9 THEN '2개월'
        ELSE '3개월 이상'
    END AS 경력
FROM employee;
    