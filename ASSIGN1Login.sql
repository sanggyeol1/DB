CREATE TABLE DEPARTMENT(
    DEPTNO NUMBER NOT NULL,
    DEPTNAME CHAR(10),
    FLOOR NUMBER,
    PRIMARY KEY(DEPTNO));
    
CREATE TABLE EMPLOYEE(
    EMPNO NUMBER NOT NULL,
    EMPNAME CHAR(10) UNIQUE,
    TITLE CHAR(10),
    MANAGER NUMBER,
    SALARY NUMBER,
    HIREDATE DATE,
    DNO NUMBER,
    PRIMARY KEY(EMPNO),
    FOREIGN KEY(MANAGER) REFERENCES EMPLOYEE (EMPNO),
    FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DEPTNO));
    
--INSERT INTO DEPARTMENT VALUES(1, '영업', 8);
--INSERT INTO DEPARTMENT VALUES(2, '기획', 10);
--INSERT INTO DEPARTMENT VALUES(3, '개발', 9);
--INSERT INTO DEPARTMENT VALUES(4, '총무', 7);

--INSERT INTO EMPLOYEE VALUES(4377, '이성래', '사장', NULL, 5000000, '1996-01-05', 2);
--INSERT INTO EMPLOYEE VALUES(1234, '장건호', '부장', 4377, 4200000, '1996-11-23', 1);
--INSERT INTO EMPLOYEE VALUES(3426, '박영권', '과장', 1234, 3000000, '1998-07-20', 1);
--INSERT INTO EMPLOYEE VALUES(1365, '김상원', '사원', 3426, 1500000, '2004-02-26', 1);
--INSERT INTO EMPLOYEE VALUES(1099, '이재원', '사원', 3426, 1800000, '2003-12-21', 1);
--INSERT INTO EMPLOYEE VALUES(3011, '이수민', '부장', 4377, 4300000, '1996-04-30', 3);
--INSERT INTO EMPLOYEE VALUES(2468, '조범수', '과장', 3011, 3500000, '1998-12-17', 3);
--INSERT INTO EMPLOYEE VALUES(2544, '오준석', '대리', 2468, 2700000, '2002-08-25', 3);
--INSERT INTO EMPLOYEE VALUES(1003, '조민희', '대리', 2468, 2600000, '2001-02-19', 2);
--INSERT INTO EMPLOYEE VALUES(3427, '최종철', '사원', 1003, 1500000, '2005-10-28', 3);
--INSERT INTO EMPLOYEE VALUES(3228, '김주훈', '부장', 4377, 4000000, '1997-03-06', 2);
--INSERT INTO EMPLOYEE VALUES(2106, '김창섭', '대리', 3228, 2500000, '2003-03-05', 2);




--질의1:DEPARTMENT 릴레이션에서 부서이름과 부서번호를 검색하라.
SELECT DEPTNAME, DEPTNO
FROM DEPARTMENT;

--질의2:EMPLOYEE 릴레이션의 모든 애트리뷰트들을 검색하라.
SELECT *
FROM EMPLOYEE;

--질의3:EMPLOYEE릴레이션에서 직급 애트리뷰트를 검색하라.
SELECT TITLE
FROM EMPLOYEE;

--질의4: 3번부서에 근무하는 모든 사원들의 이름과 직급을 검색하라.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE DNO = 3;

--질의5:직급이 과장인 모든 사원들의 이름을 검색하라.
SELECT EMPNAME
FROM EMPLOYEE
WHERE TITLE = '과장';

--질의6:2000년 2월1일 이후에 입사한 모든 사원들의 이름과 입사일을 검색하라
SELECT EMPNAME, HIREDATE
FROM EMPLOYEE
WHERE HIREDATE > '2000-02-01';

--질의7:직급이 과장이 아닌 모든 사원들의 이름과 직급을 검색하라.
SELECT EMPNAME, TITLE
FROM EMPLOYEE 
WHERE TITLE <> '과장';

--질의8:부서2에 근무하면서 매월 2500000원보다 많은 급여를 받는
--모든 사원들의 이름, 직급, 급여를 검색하라.
SELECT EMPNAME, TITLE, SALARY
FROM EMPLOYEE
WHERE DNO = 2 
      AND SALARY > 2500000;
      
--질의9:급여가2000000원에서 3000000원 사이인
--모든 사원들의 이름, 직급, 급여를 검색하라.
SELECT EMPNAME, TITLE, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND 3000000;

--질의10:직급이 과장이 아니면서 급여가 3000000원보다 많은
--모든 사원들의 이름, 직급, 급여를 검색하라.
SELECT EMPNAME, TITLE, SALARY
FROM EMPLOYEE
WHERE TITLE<>'과장' AND SALARY > 3000000;

--질의11:직급이 대리이거나 과장이거나 부장인
--모든 사원들의 이름, 직급, 부서번호를 검색하라
SELECT EMPNAME, TITLE, DNO
FROM EMPLOYEE
WHERE TITLE IN('대리', '과장', '부장');

--질의12:2번 부서에 근무하면서, 직급이 대리이거나 과장인
--모든 사람들의 이름, 직급, 부서번호를 검색하라.
SELECT EMPNAME, TITLE, DNO
FROM EMPLOYEE
WHERE DNO = 2 AND TITLE IN('대리', '과장');

--질의13:김씨 성을 가진 모든 사람의 이름과 직급을 검색하라.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE EMPNAME LIKE '김%';

--질의14:직속상사가 없는, 즉 가장 높은 사원의 이름과 직급을 검색하라.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE MANAGER IS NULL;

--질의15:모든 사원들의 급여와 이름을 검색하여 
--급여에 따라 오름차순으로 정렬
SELECT SALARY, EMPNAME
FROM EMPLOYEE
ORDER BY SALARY;

--질의16:모든 사원들의 급여와 이름을 검색하여 급여에 따라 
--내림차순으로 정렬하라.
SELECT SALARY, EMPNAME
FROM EMPLOYEE
ORDER BY SALARY DESC;

--질의17:모든 사원들의 급여와 이름을 검색하여 부서번호에 대해서는
--오름차순으로, 급여에 대해서는 내림차순으로 정렬하라.
SELECT SALARY, EMPNAME
FROM EMPLOYEE
ORDER BY DNO, SALARY DESC;

--질의18:3번부서에 근무하는 사원들의 수와 평균 급여를 검색하라.
SELECT COUNT(*) AS TOTAL, AVG(SALARY) AS AVGSAL
FROM EMPLOYEE
WHERE DNO = 3;

--질의19:모든 사원들에 대해서 이름과 근무하는 부서의 층을 검색하라
SELECT E.EMPNAME, D.FLOOR
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO;


--질의20:개발부서에 근무하는 모든 사원들에 대해 이름과 직급을 검색하라.
SELECT E.EMPNAME, E.TITLE
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
      AND D.DEPTNAME = '개발';

--질의21:모든사원들에 대하여 이름과 근무하는 부서의 층을 검색하라.
SELECT EMPNAME, FLOOR
FROM EMPLOYEE INNER JOIN DEPARTMENT 
     ON EMPLOYEE.DNO = DEPARTMENT.DEPTNO;
     
--질의22:김상원과 같은 부서에 근무하는 사원들의 이름과 직급을 검색하라.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE DNO = (SELECT DNO
             FROM EMPLOYEE
             WHERE EMPNAME = '김상원');
             
--질의23:전체 사원들의 평균 급여보다 많이 받는 사원들의 이름을 검색하라.
SELECT EMPNAME
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEE);
                
--질의24:8층이나 9층에 위치한 부서에 근무하는 사원들의 이름을 검색
SELECT EMPNAME
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO
      AND FLOOR IN(8,9);
    
SELECT DISTINCT EMPNAME
FROM EMPLOYEE, DEPARTMENT
WHERE DNO IN(SELECT DEPTNO
             FROM DEPARTMENT
             WHERE FLOOR IN(8, 9));
             
--질의25:소속사원이 한명도 없는 부서에 대해서 부서번호, 부서이름, 층을 검색
SELECT DEPTNO, DEPTNAME, FLOOR
FROM DEPARTMENT D
WHERE NOT EXISTS
      (SELECT *
       FROM EMPLOYEE E
       WHERE E.DNO = D.DEPTNO);
       
--질의26:조민희와 같은 부서에서 근무하면서 같은 직급을 가진
--사원들의 이름, 직급, 부서번호를 검색하라.
SELECT EMPNAME, TITLE, DNO
FROM EMPLOYEE E1
WHERE EXISTS
      (SELECT *
       FROM EMPLOYEE E2
       WHERE E2.EMPLOYEE = '조민희'
             AND E1.TITLE = E2.TITLE
             AND E1.DNO = E2.DNO);
             
--질의27:부서별로 부서이름과 급여의 평균을 구하여라
SELECT DEPTNAME, AVG(SALARY) AS AVG_SAL
FROM DEPARTMENT D, EMPLOYEE E
WHERE D.DEPTNO = E.DNO
GROUP BY DEPTNAME;

--질의28:부서에 속한 직원들의 급여의 합계가 10000000원과 15000000원
--사이인 부서에 대하여 부서별로 부서이름과 급여의 합계를 검색해라.
SELECT DEPTNAME, SUM(SALARY)
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
GROUP BY DEPTNAME
HAVING SUM(SALARY) BETWEEN 10000000 AND 15000000;












