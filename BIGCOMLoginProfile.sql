--모든 사원의 급여의 합, 최고급여, 최저급여, 평균급여를 구하라
SELECT SUM(SALARY), MAX(SALARY), MIN(SALARY), AVG(SALARY)
FROM EMPLOYEE;


--RESEARCH부서에서 근무하는 사원의 급여의 합, 최고급여, 최저급여, 평균급여를 구하라
SELECT SUM(SALARY), MAX(SALARY), MIN(SALARY), AVG(SALARY)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DNUMBER
      AND UPPER(DNAME) = 'RESEARCH';

--RESEARCH부서에서 근무하는 총 사원의 수를 구하여라
SELECT COUNT(*)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DNUMBER
      AND UPPER(DNAME) = 'RESEARCH';
      
--각 부서에 대해서 부서번호, 부서이름, 각 부서에 속한 사원들의 수와 평균급여를 검색하라.
SELECT DNO, Dname, COUNT(*), ROUND(AVG(SALARY))
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DNUMBER
GROUP BY DNO, DNAME; -- GROUPPING ATTRIBUTE에 있는것만 SELECT가능

--각 프로젝트에 대해서 프로젝트 번호, 이름, 그 프로젝트에서 근무하는 사원의 수를 검색하라.
SELECT PNUMBER, PNAME, COUNT(*)
FROM PROJECT, WORKS_ON
WHERE PNO = PNUMBER
GROUP BY PNUMBER, PNAME; -- GROUPING ATTRIBUTE에 있는것만 SELECT가능

--2명이상이 근무하는 각 프로젝트에 대하여 프로젝트 번호, 이름, 그 프로젝트에서 근무하는
--사원의 수를 검색하라.

SELECT PNUMBER, PNAME, COUNT(*)
FROM PROJECT, WORKS_ON
WHERE PNO = PNUMBER
GROUP BY PNUMBER, PNAME
HAVING COUNT(ESSN) >= 3; -- 집단함수, GROUPING ATTRIBUTE를 이용한 조건문만 사용 가능
--=>HAVING: GROUP에 대한 조건문이기 때문에 ????? 검증필요








