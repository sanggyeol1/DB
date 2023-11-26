INSERT INTO STUDENT VALUES(3430028, '���μ�', 2005, 10);
INSERT INTO STUDENT VALUES(1930028, '������', 2005, 10);

INSERT INTO DEPARTMENT VALUES(10, '��ǻ���а�', '2210-9999');

INSERT INTO PROFESSOR VALUES('�ȸ�', 10, 'IT��', 6513, 'msahn@uos.ac.kr');
INSERT INTO PROFESSOR VALUES('��μ�', 10, 'IT��', 1113, 'kimhn@uos.ac.kr');

INSERT INTO EXAM VALUES(343028, 'COMP-321', '�ȸ�', 'A0');

INSERT INTO EXAM VALUES(343028, 'COMP-234', '��μ�', 'A+');
INSERT INTO EXAM VALUES(343028, 'COMP-321', '��μ�', 'A0');

SELECT *
FROM EXAM

--1. 2005�⿡ ��ǻ���а��� ������ ��� �л��鿡 ���ؼ� �й��� �̸��� �˻��϶�. 
--�л��� �̸��� ������������ ����� ��Ÿ���� �Ѵ�.

SELECT SID, SNAME
FROM STUDENT
WHERE STARTYEAR = 2005 
ORDER BY SNAME ASC;

--2. ���� 'COMP-321' �� 'COMP-234'�� ���ؼ� ������ �ǽ��� �������� �̸��� �˻��ض�.
(SELECT PROFESSOR
FROM EXAM
WHERE CID = 'COMP-234')
UNION
(SELECT PROFESSOR
FROM EXAM
WHERE CID = 'COMP-321')

--3. ���� �� ���� ���ؼ��� ������ ġ�� �л�
--(��, �����̼� EXAM�� �� ���� ���ø� ����ִ� �л�)���� �й��� �˻��϶�.

SELECT SID
FROM EXAM
GROUP BY SID
HAVING COUNT(*) = 1;

--4. ��� �� ������ ������ �ǽ��� �������� �̸��� �˻��϶�. 
--������� �ߺ��� ���ŵǵ��� �Ͽ���.

SELECT PROFESSOR
FROM EXAM 
GROUP BY PROFESSOR
HAVING COUNT(*) >= 2;

--5. ��� �� ������ ������ 'A0'�� �л����� �й��� �˻��϶�.
--������� �ߺ��� ���ŵǵ��� �Ͽ���.
SELECT DISTINCT SID
FROM EXAM
WHERE GRADE = 'A0';

--6. ��� �� ������ ������ A0�� �л����� �й��� �˻��϶�.
SELECT SID
FROM EXAM
GROUP BY SID, GRADE
HAVING GRADE = 'A0' AND COUNT(*) >= 2;

--7. ��� ������ ������ A0�� �л����� �й��� �˻��϶�. SELECT * FROM emp WHERE sal = ALL(950, 3000, 1250) �̷������� �ۼ��ϸ� �ȵ� �ᱣ���� ��� ���� ���� ����

SELECT SID
FROM EXAM
WHERE GRADE = 'A0' 
AND SID NOT IN(
    SELECT SID
    FROM EXAM
    WHERE GRADE <> 'A0'
    );
    
   
--8. �� ������ ��� ������ �˻��϶�.

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
      


