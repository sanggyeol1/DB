INSERT INTO STUDENT VALUES(3430028, '조민수', 2005, 10);
INSERT INTO STUDENT VALUES(1930028, '강강술', 2005, 10);

INSERT INTO DEPARTMENT VALUES(10, '컴퓨터학과', '2210-9999');

INSERT INTO PROFESSOR VALUES('안명석', 10, 'IT관', 6513, 'msahn@uos.ac.kr');
INSERT INTO PROFESSOR VALUES('김민수', 10, 'IT관', 1113, 'kimhn@uos.ac.kr');

INSERT INTO EXAM VALUES(343028, 'COMP-321', '안명석', 'A0');

INSERT INTO EXAM VALUES(343028, 'COMP-234', '김민수', 'A+');
INSERT INTO EXAM VALUES(343028, 'COMP-321', '김민수', 'A0');

SELECT *
FROM EXAM

--1. 2005년에 컴퓨터학과에 입학한 모든 학생들에 대해서 학번과 이름을 검색하라. 
--학생의 이름의 오름차순으로 결과가 나타나야 한다.

SELECT SID, SNAME
FROM STUDENT
WHERE STARTYEAR = 2005 
ORDER BY SNAME ASC;

--2. 과목 'COMP-321' 과 'COMP-234'에 대해서 시험을 실시한 교수들의 이름을 검색해라.
(SELECT PROFESSOR
FROM EXAM
WHERE CID = 'COMP-234')
UNION
(SELECT PROFESSOR
FROM EXAM
WHERE CID = 'COMP-321')

--3. 오직 한 과목에 대해서만 시험을 치른 학생
--(즉, 릴레이션 EXAM에 한 개의 투플만 들어있는 학생)들의 학번을 검색하라.

SELECT SID
FROM EXAM
GROUP BY SID
HAVING COUNT(*) = 1;

--4. 적어도 두 과목의 시험을 실시한 교수들의 이름을 검색하라. 
--결과에서 중복이 제거되도록 하여라.

SELECT PROFESSOR
FROM EXAM 
GROUP BY PROFESSOR
HAVING COUNT(*) >= 2;

--5. 적어도 한 시험의 성적이 'A0'인 학생들의 학번을 검색하라.
--결과에서 중복이 제거되도록 하여라.
SELECT DISTINCT SID
FROM EXAM
WHERE GRADE = 'A0';

--6. 적어도 두 시험의 성적이 A0인 학생들의 학번을 검색하라.
SELECT SID
FROM EXAM
GROUP BY SID, GRADE
HAVING GRADE = 'A0' AND COUNT(*) >= 2;

--7. 모든 시험의 성적이 A0인 학생들의 학번을 검색하라. SELECT * FROM emp WHERE sal = ALL(950, 3000, 1250) 이런식으로 작성하면 안됨 결괏값이 모두 같을 수는 없음

SELECT SID
FROM EXAM
WHERE GRADE = 'A0' 
AND SID NOT IN(
    SELECT SID
    FROM EXAM
    WHERE GRADE <> 'A0'
    );
    
   
--8. 각 과목의 평균 성적을 검색하라.

SELECT CID, AVG(CASE WHEN GRADE = 'A+' THEN 4.5
                     WHEN GRADE = 'A0' THEN 4.0
                     WHEN GRADE = 'B+' THEN 3.5
                     WHEN GRADE = 'B0' THEN 3.0
                     WHEN GRADE = 'C+' THEN 2.5
                     WHEN GRADE = 'C0' THEN 2.0
                     WHEN GRADE = 'D+' THEN 1.5
                     WHEN GRADE = 'D0' THEN 1.0
                     WHEN GRADE = 'F' THEN 0
                     ELSE 0.0 END) AVGG
FROM EXAM
GROUP BY CID
      


