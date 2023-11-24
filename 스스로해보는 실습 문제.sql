-- ����1 : ���� ���� �ٹ��� ����� ���� ��� �����͸� �˻��϶�.
SELECT *
FROM EMPLOYEE 
WHERE HIREDATE = (
    SELECT MIN(HIREDATE)
    FROM EMPLOYEE
    );

-- ����2 : ����ö�� ���� �μ��� �ٹ��ϴ� ����� ���� ��� �����͸� �˻��϶�.
SELECT *
FROM EMPLOYEE 
WHERE DNO = (
    SELECT DNO
    FROM EMPLOYEE
    WHERE EMPNAME = '����ö'
    );
    
--����3 : ȸ���� ��ü ������� �˻��϶�.
SELECT COUNT(*)
FROM EMPLOYEE;

--����4 : ȸ�翡 �� ���� �μ��� �ִ°��� �˻��϶�.
SELECT COUNT(*)
FROM DEPARTMENT;

--����5 : ��ȹ�ο� �ٹ��ϴ� ������� �̸��� ������ �˻��϶�.
SELECT EMPNAME, TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO AND DEPTNAME = '��ȹ';

--����6 : �Ѹ� �̻��� ����� �ٹ��ϴ� �μ��� ������ �˻��϶�.

SELECT COUNT(*)
FROM DEPARTMENT
WHERE DEPTNO IN (SELECT DEPTNO
FROM DEPARTMENT, EMPLOYEE
WHERE DNO = DEPTNO
GROUP BY DEPTNO);

--����7 : ����� �� �� �ٹ����� �ʴ� �μ��� �˻��϶�.
SELECT *
FROM DEPARTMENT
WHERE DEPTNO NOT IN (SELECT DEPTNO
FROM EMPLOYEE, DEPARTMENT
WHERE DEPTNO = DNO);

--����8 : ����� �� �� �̻� ���� �μ��� ���ؼ� ��� �޿��� ���Ͽ���.
SELECT AVG(SALARY)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO
GROUP BY DNO;

--����9 : �μ��� ���� ������� ��� �޿��� ���� ���� �μ��� �̸��� ��� �޿��� �˻��϶�.
SELECT AVG(SALARY)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO
GROUP BY DNO
ORDER BY AVG(SALARY) DESC;

--����10: EMPLOYEE�� DEPARTMENT�����̼��� �����ϰ�, �μ���ȣ ������ ���� �����϶�.
SELECT *
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO
ORDER BY DNO ASC;

--����11 : ��� ������� ���޺��� �׷�ȭ�ϰ�, �� �׷캰 ��� ���� ��� �޿��� �˻��϶�.
SELECT TITLE, COUNT(*), ROUND(AVG(SALARY))
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO
GROUP BY TITLE
ORDER BY TITLE DESC;

--����12 : ��� ������� ���޺��� �׷�ȭ �ϰ�, ���� ������ ���� ��� ���� 2�� �̻��� ���޿� ���ؼ� ����, ��� ��, ���� �޿��� �˻��϶�.
SELECT TITLE, COUNT(*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY TITLE
HAVING COUNT(*) >= 2;

--����13 : ������ �븮�� ����� ��� 2�� �̻� ���� �μ��� �̸��� �˻��϶�.

SELECT DEPTNAME, COUNT(*)
FROM DEPARTMENT, EMPLOYEE
WHERE DNO = DEPTNO
    AND TITLE = '�븮'
GROUP BY DEPTNAME
HAVING COUNT(*) >= 2;

--����14 : ��� �μ��� ���ؼ� �̸�, ��, �� �μ��� �ٹ��ϴ� ��� ���� �˻��϶�. ����� ���� �μ��� ���Խ��Ѷ�.

SELECT DEPTNAME, FLOOR, COUNT(EMPNO)
FROM DEPARTMENT LEFT OUTER JOIN EMPLOYEE ON DEPTNO = DNO
GROUP BY DEPTNAME, FLOOR;


--����15 : �μ�1,2,3 �� ���������� �ִ� ������ �˻��϶�.



--����16 : ���ߺμ��� �ٹ��ϴ� ������� ���ް� ���޺� ��� ���� �˻��϶�. ��� ���� ���� ���޺��� ǥ���϶�.

SELECT TITLE, COUNT(*)
FROM DEPARTMENT, EMPLOYEE
WHERE DNO = DEPTNO AND DEPTNAME = '����'
GROUP BY TITLE
ORDER BY COUNT(*) DESC;


--����17 : ��� �޿��� ���� ���� �μ��� �μ���ȣ�� �� �μ��� �ְ�޿��� �˻��϶�.


--����18 : �Ҽ� ��� ���� 4�� ������ �μ��� �̸��� ��� ���� �˻��϶�.



--����19 : �ڽ��� ���� �μ��� ��� �޿����� ���� �޴� ����� �̸�, �μ���ȣ, �޿��� �˻��϶�.

--����20 : �� �μ����� ���� ���� �޿��� �޴� ������� �̸�, �μ���ȣ, �޿��� �˻��϶�.

--����21 : ��� ����� ���ؼ� �����ȣ, �̸�, �޿�, �μ���ȣ, �Ҽ� �μ��� ��� �޿��� �˻��϶�.

--����22 : ����ö �Ǵ� �̼��ΰ� ���� ������ ���� ��� ����� ���ؼ� ����� �̸��� ������ �˻��϶�.

--����23 : ��ȹ �Ǵ� �ѹ� �μ��� �ٹ����� �ʴ� ��� ������� �̸��� �˻��϶�.

--����24 : DEPARTMENT �����̼ǿ� ����(5,'ȫ��',8)�� �����϶�.

--����25 : EMPLOYEE �����̼ǿ��� �μ���ȣ 3�� �ٹ��ϴ� ������� �����϶�.

--����26 : �μ���ȣ 2�� �ٹ��ϴ� ������� �޿��� 5%�λ��϶�.

--����27 : ������ ������ ������� �����ȣ, ����̸�, �޿��� �̷���� �並 �����϶�.






