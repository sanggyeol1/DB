-- 질의1 : 가장 오래 근무한 사원에 대한 모든 데이터를 검색하라.
SELECT *
FROM EMPLOYEE 
WHERE HIREDATE = (
    SELECT MIN(HIREDATE)
    FROM EMPLOYEE
    );

-- 질의2 : 최종철과 같은 부서에 근무하는 사원에 관한 모든 데이터를 검색하라.
SELECT *
FROM EMPLOYEE 
WHERE DNO = (
    SELECT DNO
    FROM EMPLOYEE
    WHERE EMPNAME = '최종철'
    );
    
--질의3 : 회사의 전체 사원수를 검색하라.
SELECT COUNT(*)
FROM EMPLOYEE;

--질의4 : 회사에 몇 개의 부서가 있는가를 검색하라.
SELECT COUNT(*)
FROM DEPARTMENT;

--질의5 : 기획부에 근무하는 사원들의 이름과 직급을 검색하라.
SELECT EMPNAME, TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO AND DEPTNAME = '기획';

--질의6 : 한명 이상의 사원이 근무하는 부서의 개수를 검색하라.

SELECT COUNT(*)
FROM DEPARTMENT
WHERE DEPTNO IN (SELECT DEPTNO
FROM DEPARTMENT, EMPLOYEE
WHERE DNO = DEPTNO
GROUP BY DEPTNO);

--질의7 : 사원이 한 명도 근무하지 않는 부서를 검색하라.
SELECT *
FROM DEPARTMENT
WHERE DEPTNO NOT IN (SELECT DEPTNO
FROM EMPLOYEE, DEPARTMENT
WHERE DEPTNO = DNO);

--질의8 : 사원이 한 명 이상 속한 부서에 대해서 평균 급여를 구하여라.
SELECT AVG(SALARY)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO
GROUP BY DNO;

--질의9 : 부서에 속한 사원들의 평균 급여가 가장 많은 부서의 이름과 평균 급여를 검색하라.
SELECT AVG(SALARY)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO
GROUP BY DNO
ORDER BY AVG(SALARY) DESC;

--질의10: EMPLOYEE와 DEPARTMENT릴레이션을 조인하고, 부서번호 순서에 따라 정렬하라.
SELECT *
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO
ORDER BY DNO ASC;

--질의11 : 모든 사원들을 직급별로 그룹화하고, 각 그룹별 사원 수와 평균 급여를 검색하라.
SELECT TITLE, COUNT(*), ROUND(AVG(SALARY))
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO
GROUP BY TITLE
ORDER BY TITLE DESC;

--질의12 : 모든 사원들을 직급별로 그룹화 하고, 동일 직급을 갖는 사원 수가 2명 이상인 직급에 대해서 직급, 사원 수, 연간 급여를 검색하라.
SELECT TITLE, COUNT(*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY TITLE
HAVING COUNT(*) >= 2;

--질의13 : 직급이 대리인 사원이 적어도 2명 이상 속한 부서의 이름을 검색하라.

SELECT DEPTNAME, COUNT(*)
FROM DEPARTMENT, EMPLOYEE
WHERE DNO = DEPTNO
    AND TITLE = '대리'
GROUP BY DEPTNAME
HAVING COUNT(*) >= 2;

--질의14 : 모든 부서에 대해서 이름, 층, 각 부서에 근무하는 사원 수를 검색하라. 사원이 없는 부서도 포함시켜라.

SELECT DEPTNAME, FLOOR, COUNT(EMPNO)
FROM DEPARTMENT LEFT OUTER JOIN EMPLOYEE ON DEPTNO = DNO
GROUP BY DEPTNAME, FLOOR;


--질의15 : 부서1,2,3 에 공통적으로 있는 직급을 검색하라.

SELECT TITLE
FROM EMPLOYEE
WHERE DNO IN (1, 2, 3)
GROUP BY TITLE
HAVING COUNT(DISTINCT DNO) = 3;

--질의16 : 개발부서에 근무하는 사원들의 직급과 직급별 사원 수를 검색하라. 사원 수가 많은 직급부터 표시하라.

SELECT TITLE, COUNT(*)
FROM DEPARTMENT, EMPLOYEE
WHERE DNO = DEPTNO AND DEPTNAME = '개발'
GROUP BY TITLE
ORDER BY COUNT(*) DESC;


--질의17 : 평균 급여가 가장 높은 부서의 부서번호와 이 부서의 최고급여를 검색하라.

SELECT *
FROM(
    SELECT DNO, MAX(SALARY)
    FROM EMPLOYEE
    GROUP BY DNO
    ORDER BY AVG(SALARY) DESC)
WHERE ROWNUM <= 1;
    
--질의18 : 소속 사원 수가 4명 이하인 부서의 이름과 사원 수를 검색하라.

SELECT DEPTNO, DEPTNAME, COUNT(EMPNO)
FROM DEPARTMENT LEFT OUTER JOIN EMPLOYEE
ON DEPTNO =  DNO
GROUP BY DEPTNO, DEPTNAME
HAVING COUNT(EMPNO) <= 4;

--질의19 : 자신이 속한 부서의 평균 급여보다 많이 받는 사원의 이름, 부서번호, 급여를 검색하라.

SELECT E.EMPNAME, E.EMPNO, E.DNO, E.SALARY
FROM EMPLOYEE E JOIN(
    SELECT DNO, AVG(SALARY) AVGSAL
    FROM EMPLOYEE
    GROUP BY DNO) J
    ON E.DNO = J.DNO
WHERE E.SALARY > J.AVGSAL;


--질의20 : 각 부서에서 가장 많은 급여를 받는 사원들의 이름, 부서번호, 급여를 검색하라.

SELECT EMPNAME, EMPNO, SALARY
FROM EMPLOYEE E JOIN(
    SELECT DNO, MAX(SALARY) MAXSAL
    FROM EMPLOYEE
    GROUP BY DNO
) J ON E.DNO = J.DNO
WHERE E.SALARY = J.MAXSAL;





--질의21 : 모든 사원에 대해서 사원번호, 이름, 급여, 부서번호, 소속 부서의 평균 급여를 검색하라.

SELECT E.EMPNO, E.EMPNAME, E.SALARY, E.DNO, J.AVGSAL
FROM EMPLOYEE E 
JOIN (
    SELECT DNO, AVG(SALARY) AS AVGSAL
    FROM EMPLOYEE
    GROUP BY DNO
) J ON E.DNO = J.DNO;


--질의22 : 최종철 또는 이수민과 같은 직급을 가진 모든 사원에 대해서 사원의 이름과 직급을 검색하라.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE TITLE IN(SELECT TITLE
FROM EMPLOYEE
WHERE EMPNAME IN ('최종철', '이수민'));

--질의23 : 기획 또는 총무 부서에 근무하지 않는 모든 사원들의 이름을 검색하라.

SELECT EMPNAME
FROM DEPARTMENT, EMPLOYEE
WHERE DNO = DEPTNO AND DEPTNAME NOT IN('기획', '총무');

--질의24 : DEPARTMENT 릴레이션에 투플(5,'홍보',8)을 삽입하라.
INSERT INTO DEPARTMENT VALUES(5, '홍보', 8);

--질의25 : EMPLOYEE 릴레이션에서 부서번호 3에 근무하는 사원들을 삭제하라.
--MANAGER속성이 EMPNO를 참조하는 형식이기 때문에 삭제 안됨
DELETE
FROM EMPLOYEE
WHERE DNO = 3;

--질의26 : 부서번호 2에 근무하는 사원들의 급여를 5%인상하라.
UPDATE EMPLOYEE
SET SALARY = SALARY*1.05
WHERE DNO = 2











